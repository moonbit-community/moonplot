"""Load complete pinned basic Formatter classes and real API descriptors.

The host fixture provides rc values and a warning sink. Neither formatter method
bodies nor the deprecated locs descriptor are substituted by port algorithms.
"""
from pathlib import Path
import ast
import hashlib
import math
import re
import sys
import types
import urllib.request
import warnings

import numpy as np

TICKER_SHA = "49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad"
API_SHA = "7e262cedd8ce1a1660c2e2caa63adeb078c29e36bd541b8e6f773cfed4c3c782"
RC_SHA = "8b76e138ce9dc944a843dc6aa1ef9ee0e88638358b10baf227cd248d271b5f5a"
DEPRECATION_SHA = "364d069a9bcdf2b10f2f641220717baaa4e5c9b8e25fbe150cd9895f2f8542d2"
DEPRECATION_URL = ("https://raw.githubusercontent.com/matplotlib/matplotlib/"
                   "v3.11.2/lib/matplotlib/_api/deprecation.py")
CLASSES = ("_DummyAxis", "TickHelper", "Formatter", "NullFormatter",
           "FixedFormatter", "FuncFormatter")


def _checked(path, expected):
    contents = path.read_bytes()
    if hashlib.sha256(contents).hexdigest() != expected:
        raise ValueError("fixed formatter source differs: " + str(path))
    return contents


def load(ticker_path):
    """Return a namespace of real classes, _api, mpl, and warning collectors.

    external_warnings contains strings; warning_records retains category names.
    Each call creates fresh source modules/classes and the original shared _locs
    default. The ignored pinned helper is downloaded only if not already cached.
    """
    if sys.version_info[:3] != (3, 12, 14) or np.__version__ != "2.3.5":
        raise ValueError("fixed CPython 3.12.14 / NumPy 2.3.5 required")
    ticker_path = Path(ticker_path)
    api_path = ticker_path.parent / "_api/__init__.py"
    deprecation_path = api_path.with_name("deprecation.py")
    rc_path = ticker_path.parent / "mpl-data/matplotlibrc"
    ticker_source = _checked(ticker_path, TICKER_SHA)
    api_source = _checked(api_path, API_SHA)
    rc_source = _checked(rc_path, RC_SHA)
    if not deprecation_path.exists():
        with urllib.request.urlopen(DEPRECATION_URL, timeout=30) as response:
            downloaded = response.read()
        if hashlib.sha256(downloaded).hexdigest() != DEPRECATION_SHA:
            raise ValueError("fixed deprecation download differs")
        deprecation_path.write_bytes(downloaded)
    deprecation_source = _checked(deprecation_path, DEPRECATION_SHA)

    mpl = types.ModuleType("matplotlib")
    mpl.__path__ = [str(ticker_path.parent)]
    default = re.search(rb"^#axes\.unicode_minus:\s*(\w+)", rc_source, re.M)
    if default is None or default[1] not in (b"True", b"False"):
        raise ValueError("fixed unicode-minus default missing")
    mpl.rcParams = {"axes.unicode_minus": default[1] == b"True"}
    api = types.ModuleType("matplotlib._api")
    api.__package__ = "matplotlib._api"
    api.__path__ = [str(api_path.parent)]
    deprecation = types.ModuleType("matplotlib._api.deprecation")
    deprecation.__package__ = "matplotlib._api"
    sys.modules.update({"matplotlib": mpl, "matplotlib._api": api,
                        "matplotlib._api.deprecation": deprecation})
    mpl._api = api
    exec(compile(deprecation_source, str(deprecation_path), "exec"), deprecation.__dict__)
    exec(compile(api_source, str(api_path), "exec"), api.__dict__)

    external_warnings = []
    warning_records = []

    def warn_external(message, category=None):
        category = category or (type(message) if isinstance(message, Warning) else UserWarning)
        external_warnings.append(str(message))
        warning_records.append(dict(category=category.__name__, message=str(message)))

    api.warn_external = warn_external
    module = types.ModuleType("matplotlib.ticker")
    module.__package__ = "matplotlib"
    sys.modules[module.__name__] = module
    mpl.ticker = module
    namespace = module.__dict__
    namespace.update(np=np, math=math, warnings=warnings, _api=api, mpl=mpl,
                     external_warnings=external_warnings, warning_records=warning_records,
                     source_hashes={"ticker.py": TICKER_SHA, "_api/__init__.py": API_SHA,
                                    "_api/deprecation.py": DEPRECATION_SHA, "matplotlibrc": RC_SHA})
    tree = ast.parse(ticker_source)
    nodes = [node for node in tree.body if isinstance(node, ast.ClassDef) and node.name in CLASSES]
    if tuple(node.name for node in nodes) != CLASSES:
        raise ValueError("fixed formatter classes missing or reordered")
    exec(compile(ast.Module(body=nodes, type_ignores=[]), str(ticker_path), "exec"), namespace)
    return namespace


STRING_SHA = "24aeae1f0526250f442022022bf98df9a823b1cb330543ee79e70e44907462e9"
STRING_CLASSES = ("FormatStrFormatter", "_UnicodeMinusFormat", "StrMethodFormatter")


def load_string_formatters(ticker_path):
    """Explicit string-class branch; the accepted D28 load metadata is unchanged.

    Executes complete original classes and their actual stdlib Formatter parent.
    Scalar origins are supplied by callers as Python float/NumPy float64/int64;
    no portable implementation or replacement format algorithm is involved.
    """
    import string

    namespace = load(ticker_path)
    _checked(Path(string.__file__), STRING_SHA)
    namespace['string'] = string
    namespace['source_hashes']['stdlib/string.py'] = STRING_SHA
    tree = ast.parse(Path(ticker_path).read_bytes())
    nodes = [node for node in tree.body if isinstance(node, ast.ClassDef) and node.name in STRING_CLASSES]
    if tuple(node.name for node in nodes) != STRING_CLASSES:
        raise ValueError("fixed string formatter classes missing or reordered")
    exec(compile(ast.Module(body=nodes, type_ignores=[]), str(ticker_path), "exec"), namespace)
    return namespace


def load_percent_formatter(ticker_path):
    """Explicit percentage-class branch; prior loader metadata is unchanged.

    Constructor coercion, symbol property, arithmetic and native formatting all
    execute the complete original class. The fixture supplies only checked rc
    defaults and caller-owned axis/context objects.
    """
    namespace = load(ticker_path)
    ticker_path = Path(ticker_path)
    rc_source = _checked(ticker_path.parent / "mpl-data/matplotlibrc", RC_SHA)
    default = re.search(rb"^#text\.usetex:\s*(\w+)", rc_source, re.M)
    if default is None or default[1] not in (b"True", b"False"):
        raise ValueError("fixed TeX text default missing")
    namespace['mpl'].rcParams['text.usetex'] = default[1] == b'True'
    tree = ast.parse(ticker_path.read_bytes())
    nodes = [node for node in tree.body
             if isinstance(node, ast.ClassDef) and node.name == 'PercentFormatter']
    if len(nodes) != 1:
        raise ValueError("fixed percentage formatter class missing")
    exec(compile(ast.Module(body=nodes, type_ignores=[]), str(ticker_path), "exec"), namespace)
    return namespace
