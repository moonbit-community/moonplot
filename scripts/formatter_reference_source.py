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


SCALAR_INIT_SHA = "37abb78e74e9e0085a4e306a919606ffa8ff3c263def80ae2f4d938cfa79cd32"
SCALAR_CBOOK_SHA = "e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643"
SCALAR_RCSETUP_SHA = "a052eac4af21ce8cdb58ee49c3ab952af4c2ff5e18f36cc8b741793fa79b5f59"
SCALAR_FONT_SHA = "d0e464bd1aff8e1815d375aa8bfc6dd32869979b348d8ec3b82edd61b8288788"
SCALAR_FONTCONFIG_SHA = "2dd0b57722c56d814672fa6be8afd8705a42f229875ce8098658b50dbf9e68a4"


def _scalar_cached_source(path, checksum):
    if not path.exists():
        url = ("https://raw.githubusercontent.com/matplotlib/matplotlib/"
               "v3.11.2/lib/matplotlib/" + path.name)
        with urllib.request.urlopen(url, timeout=30) as response:
            downloaded = response.read()
        if hashlib.sha256(downloaded).hexdigest() != checksum:
            raise ValueError("fixed scalar dependency download differs: " + str(path))
        path.write_bytes(downloaded)
    return _checked(path, checksum)


def load_scalar_formatter(ticker_path):
    """Load the full Scalar class and its real helpers in a stated host profile.

    FontProperties and FontManager execute their actual classes/findfont against
    an empty supplied font catalog; no OS scanning, fake descriptor or substituted
    font lookup is performed. Fontconfig parser bodies are original but unused
    by list-family default construction. Previous branches keep their metadata.
    """
    import functools
    import itertools
    import locale
    import logging
    import os
    from collections.abc import MutableMapping
    from numbers import Integral

    namespace = load(ticker_path)
    ticker_path = Path(ticker_path)
    mpl = namespace['mpl']
    sources = {
        '__init__.py': _scalar_cached_source(ticker_path.with_name('__init__.py'), SCALAR_INIT_SHA),
        'cbook.py': _checked(ticker_path.with_name('cbook.py'), SCALAR_CBOOK_SHA),
        'rcsetup.py': _checked(ticker_path.with_name('rcsetup.py'), SCALAR_RCSETUP_SHA),
        'font_manager.py': _checked(ticker_path.with_name('font_manager.py'), SCALAR_FONT_SHA),
        '_fontconfig_pattern.py': _scalar_cached_source(ticker_path.with_name('_fontconfig_pattern.py'), SCALAR_FONTCONFIG_SHA),
    }
    rc_tree = ast.parse(sources['rcsetup.py'])
    for node in ast.walk(rc_tree):
        if not (isinstance(node, ast.Call) and isinstance(node.func, ast.Name)
                and node.func.id == '_Param' and node.args
                and isinstance(node.args[0], ast.Constant)):
            continue
        key = node.args[0].value
        if isinstance(key, str) and (key.startswith('font.') or key.startswith('axes.formatter.')
                                    or key in ('mathtext.fontset', 'text.usetex')):
            default = node.args[1] if len(node.args) > 1 else next(
                (item.value for item in node.keywords if item.arg == 'default'), None)
            if default is not None:
                try:
                    mpl.rcParams[key] = ast.literal_eval(default)
                except ValueError:
                    pass  # Unrelated nonliteral font options are never consumed.
    init_tree = ast.parse(sources['__init__.py'])
    val_node = next(node for node in init_tree.body
                    if isinstance(node, ast.FunctionDef) and node.name == '_val_or_rc')
    exec(compile(ast.Module(body=[val_node], type_ignores=[]),
                 str(ticker_path.with_name('__init__.py')), 'exec'), mpl.__dict__)

    cbook = types.ModuleType('matplotlib.cbook')
    cbook.__dict__.update(Path=Path, matplotlib=mpl, np=np, math=math)
    mpl.get_data_path = lambda: str(ticker_path.parent / 'mpl-data')
    cbook_nodes = [node for node in ast.parse(sources['cbook.py']).body
                   if isinstance(node, (ast.ClassDef, ast.FunctionDef))
                   and node.name in ('_ExceptionInfo', '_get_data_path', '_g_sig_digits')]
    exec(compile(ast.Module(body=cbook_nodes, type_ignores=[]),
                 str(ticker_path.with_name('cbook.py')), 'exec'), cbook.__dict__)

    fontconfig = types.ModuleType('matplotlib._fontconfig_pattern')
    fontconfig.__dict__.update(re=re, cache=functools.cache,
                               lru_cache=functools.lru_cache, partial=functools.partial)
    fontconfig_nodes = [node for node in ast.parse(sources['_fontconfig_pattern.py']).body
                       if isinstance(node, (ast.Assign, ast.FunctionDef))]
    exec(compile(ast.Module(body=fontconfig_nodes, type_ignores=[]),
                 str(ticker_path.with_name('_fontconfig_pattern.py')), 'exec'), fontconfig.__dict__)

    font = types.ModuleType('matplotlib.font_manager')
    font.__dict__.update(mpl=mpl, _api=namespace['_api'], cbook=cbook,
                         functools=functools, lru_cache=functools.lru_cache,
                         cache=functools.cache, _log=logging.getLogger('scalar_reference_font'),
                         os=os, Path=Path, Integral=Integral,
                         generate_fontconfig_pattern=fontconfig.generate_fontconfig_pattern,
                         parse_fontconfig_pattern=fontconfig.parse_fontconfig_pattern)
    font_nodes = []
    for node in ast.parse(sources['font_manager.py']).body:
        if isinstance(node, (ast.ClassDef, ast.FunctionDef)) and node.name in (
                'FontProperties', 'FontManager', '_cleanup_fontproperties_init'):
            font_nodes.append(node)
        elif isinstance(node, ast.Assign) and any(
                isinstance(target, ast.Name) and target.id in (
                    'font_scalings', 'weight_dict', 'stretch_dict', 'font_family_aliases')
                for target in node.targets):
            font_nodes.append(node)
    future = ast.ImportFrom(module='__future__', names=[ast.alias(name='annotations')], level=0)
    exec(compile(ast.fix_missing_locations(ast.Module(body=[future] + font_nodes, type_ignores=[])),
                 str(ticker_path.with_name('font_manager.py')), 'exec'), font.__dict__)
    manager = object.__new__(font.FontManager)
    manager.ttflist = []
    manager.afmlist = []
    manager.defaultFamily = {'ttf': 'DejaVu Sans', 'afm': 'Helvetica'}
    font.fontManager = manager
    font.findfont = manager.findfont
    mpl.font_manager = font
    mpl.cbook = cbook
    sys.modules.update({'matplotlib.font_manager': font, 'matplotlib.cbook': cbook,
                        'matplotlib._fontconfig_pattern': fontconfig})
    validator_ns = dict(np=np, cbook=cbook, _api=namespace['_api'], lru_cache=functools.lru_cache)
    validator_nodes = [node for node in rc_tree.body if isinstance(node, ast.FunctionDef)
                       and node.name in ('_listify_validator', '_make_type_validator', 'validate_bool')]
    exec(compile(ast.Module(body=validator_nodes, type_ignores=[]),
                 str(ticker_path.with_name('rcsetup.py')), 'exec'), validator_ns)
    integer_validator = validator_ns['_make_type_validator'](int)
    scalar_validators = {key: validator_ns['validate_bool'] for key in (
        'axes.formatter.useoffset', 'axes.formatter.use_mathtext',
        'axes.formatter.use_locale', 'text.usetex', 'axes.unicode_minus')}
    scalar_validators['axes.formatter.offset_threshold'] = integer_validator
    scalar_validators['axes.formatter.limits'] = validator_ns['_listify_validator'](integer_validator, n=2)
    rc_ns = dict(MutableMapping=MutableMapping, _api=namespace['_api'],
                 rcsetup=types.SimpleNamespace(_validators=scalar_validators, _auto_backend_sentinel=object()))
    rc_node = next(node for node in init_tree.body
                   if isinstance(node, ast.ClassDef) and node.name == 'RcParams')
    exec(compile(ast.Module(body=[rc_node], type_ignores=[]),
                 str(ticker_path.with_name('__init__.py')), 'exec'), rc_ns)
    scalar_rc = rc_ns['RcParams']()
    for key, value in mpl.rcParams.items():
        scalar_rc._set(key, value)  # Original literal defaults; unrelated font validators are outside this profile.
    mpl.rcParams = scalar_rc
    rc_ns['rcParams'] = scalar_rc
    namespace.update(cbook=cbook, itertools=itertools, locale=locale, Integral=Integral,
                     font_manager=font,
                     scalar_host_profile=dict(font_catalog='empty TTF/AFM; actual FontManager.findfont raises caught ValueError',
                                              fontconfig='actual generate/escape methods; list-family defaults never invoke the parser or pyparsing',
                                              data_path='pinned mpl-data fixture; no OS font/cache scan or glyph rendering',
                                              rc='complete original RcParams; real scalar Bool/int/intlist(n=2) validators; unrelated font defaults supplied as original literals'))
    scalar_nodes = [node for node in ast.parse(ticker_path.read_bytes()).body
                    if isinstance(node, ast.ClassDef) and node.name == 'ScalarFormatter']
    if len(scalar_nodes) != 1:
        raise ValueError('fixed ScalarFormatter class missing')
    exec(compile(ast.Module(body=scalar_nodes, type_ignores=[]), str(ticker_path), 'exec'), namespace)
    namespace['source_hashes'].update({name: hashlib.sha256(value).hexdigest()
                                       for name, value in sources.items()})
    return namespace
