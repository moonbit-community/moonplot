"""Observe IndexLocator ownership through original Matplotlib binding methods.

Only Axis/Ticker data containers, group membership and callback sinks are small
controlled fixtures. The actual axis binding, removal rebind, locator call and
secondary view update bodies execute unmodified from the pinned source AST.
"""
from pathlib import Path
import argparse
import ast
import copy
import hashlib
import itertools
import json
import logging
import sys
import types
import warnings

import numpy as np

ROOT = Path(__file__).resolve().parents[1]
HASHES = {
    "axis.py": "f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0",
    "ticker.py": "49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad",
    "figure.py": "b440ab0a5be03cb39b13529a2fec497d2d96deb083e3e56d6220593e3ec567da",
    "axes/_secondary_axes.py": "b2aaaae077e03ff6538d1a4bf8a69c3476eed0e27120aa567de138c794599a93",
    "_api/__init__.py": "7e262cedd8ce1a1660c2e2caa63adeb078c29e36bd541b8e6f773cfed4c3c782",
}


def clean(value):
    if isinstance(value, float) and not np.isfinite(value):
        return repr(value)
    if isinstance(value, (list, tuple)):
        return [clean(v) for v in value]
    if isinstance(value, dict):
        return {k: clean(v) for k, v in value.items()}
    return value


def load(directory):
    if sys.version_info[:3] != (3, 12, 14) or np.__version__ != "2.3.5":
        raise ValueError("fixed CPython3.12.14 / NumPy2.3.5 required")
    parsed = {}
    for name, sha in HASHES.items():
        path = directory / name
        if hashlib.sha256(path.read_bytes()).hexdigest() != sha:
            raise ValueError("pinned source differs: " + str(path))
        parsed[name] = ast.parse(path.read_text()).body
    namespace = dict(np=np, itertools=itertools, _log=logging.getLogger("index-axis-reference"))

    def run(node, filename):
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(directory / filename), "exec"), namespace)

    api = next(node for node in parsed["_api/__init__.py"]
               if isinstance(node, ast.FunctionDef) and node.name == "check_isinstance")
    run(api, "_api/__init__.py")
    namespace["_api"] = types.SimpleNamespace(check_isinstance=namespace["check_isinstance"])

    def partial(filename, name, methods, bases=None):
        node = copy.deepcopy(next(node for node in parsed[filename]
                                  if isinstance(node, ast.ClassDef) and node.name == name))
        if bases is not None:
            node.bases = bases
        node.decorator_list = []
        node.body = [part for part in node.body if isinstance(part, ast.Assign) and
                     any(isinstance(target, ast.Name) and target.id in {"axis", "MAXTICKS"} for target in part.targets) or
                     isinstance(part, ast.FunctionDef) and part.name in methods]
        run(node, filename)

    partial("ticker.py", "TickHelper", {"set_axis"}, [])
    partial("ticker.py", "Locator", {"raise_if_exceeds"})
    namespace["mticker"] = types.SimpleNamespace(Locator=namespace["Locator"])
    partial("ticker.py", "IndexLocator", {"__init__", "set_params", "__call__", "tick_values"})
    partial("axis.py", "Axis", {"set_major_locator", "set_minor_locator", "get_major_locator", "get_minor_locator",
                                   "get_major_formatter", "get_minor_formatter"}, [])
    partial("figure.py", "FigureBase", {"_remove_axes"}, [])
    partial("axes/_secondary_axes.py", "SecondaryAxis", {"_set_lims"}, [])
    namespace["_log"].disabled = True
    return namespace


def generate(directory):
    source = load(directory)
    helper, original_axis = source["TickHelper"], source["Axis"]

    class Formatter(helper):
        def _set_locator(self, locator):
            self.last_locator = locator

    class Axis(original_axis):
        def __init__(self, name, data, ticker=None, minor_ticker=None):
            self.name, self.data, self.view, self.reads = name, data, (0., 1.), 0
            self.major = ticker or types.SimpleNamespace(locator=source["IndexLocator"](1., 0.), formatter=Formatter())
            self.minor = minor_ticker or types.SimpleNamespace(locator=source["IndexLocator"](2., 0.), formatter=Formatter())

        def get_data_interval(self):
            self.reads += 1
            return self.data

    class Grouper:
        def __init__(self, members):
            self.members = members[:]

        def get_siblings(self, member, include_self=True):
            return [other for other in self.members if include_self or other is not member]

        def remove(self, member):
            if member in self.members:
                self.members.remove(member)

    rows = []
    for level in ["major", "minor"]:
        for orientation in ["x", "y"]:
            shared = types.SimpleNamespace(locator=None, formatter=Formatter())
            kwargs = {"ticker" if level == "major" else "minor_ticker": shared}
            first = Axis("first", (0., 2.), **kwargs)
            second = Axis("second", (100., 104.), **kwargs)
            locator = source["IndexLocator"](1., 0.)
            snapshots = []

            def take(label, active=locator):
                snapshots.append(dict(stage=label, owner=active.axis.name, ticks=[float(v) for v in active()],
                                      first_data=list(first.data), second_data=list(second.data),
                                      first_view=list(first.view), second_view=list(second.view)))

            getattr(first, "set_" + level + "_locator")(locator)
            assert getattr(second, "get_" + level + "_locator")() is locator
            take("installed first; shared ticker points to first local data")
            getattr(second, "set_" + level + "_locator")(locator)
            take("installed second; shared ticker points to second local data")
            first.view, second.view = (1000., 2000.), (-200., -100.)
            take("view changes do not change data ownership")
            independent = copy.copy(locator)
            independent.set_params(base=2.)
            take("copy retains second axis but has independent base", independent)
            second.data = (100., 106.)
            take("later local data update is observed")

            axes = []
            for axis in [first, second]:
                other = Axis("unused", (10., 11.))
                axis_map = {orientation: axis, "y" if orientation == "x" else "x": other}
                axes.append(types.SimpleNamespace(_axis_names=[orientation], _axis_map=axis_map,
                                                 _twinned_axes=types.SimpleNamespace(remove=lambda member: None)))
            group = Grouper(axes)
            for ax in axes:
                ax._shared_axes = {orientation: group}
            events = []
            figure = source["FigureBase"]()
            figure._axobservers = types.SimpleNamespace(process=lambda *args: events.append("axes_change"))
            figure._root_figure = types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda ax: events.append("release_mouse")))
            # Figure removal also rebinds the other ticker; initialize it through
            # the original Axis setter rather than replacing the binding method.
            other_level = "minor" if level == "major" else "major"
            for axis in [first, second]:
                getattr(axis, "set_" + other_level + "_locator")(source["IndexLocator"](1., 0.))
            owners = [axes[:], axes[:]]
            figure._remove_axes(axes[1], owners)
            take("remove owning second axis rebinds shared locator to first")
            second.data = (100., 110.)
            take("removed second data no longer controls shared locator")
            take("independent copy outside ticker retains removed second axis", independent)
            assert locator.axis is first
            assert shared.formatter.axis is first
            assert all(owner == [axes[0]] for owner in owners)
            rows.append(dict(level=level, orientation=orientation, stages=snapshots,
                             removal_events=events, formatter_owner=shared.formatter.axis.name,
                             remaining_group_size=len(group.members)))

    secondary_rows = []
    for orientation in ["x", "y"]:
        for parent_view in [(0., 4.), (100., 200.), (4., 0.)]:
            axis = Axis("secondary", (float("inf"), -float("inf")))
            secondary = source["SecondaryAxis"]()
            secondary._orientation = orientation
            secondary._parent = types.SimpleNamespace(get_xlim=lambda: parent_view, get_ylim=lambda: parent_view)
            secondary._functions = (lambda value: value * 2., lambda value: value / 2.)
            writes = []
            def set_limits(values):
                axis.view = tuple(float(v) for v in values)
                writes.append(list(axis.view))
            secondary.set_xlim = secondary.set_ylim = set_limits
            secondary._set_lims()
            locator = source["IndexLocator"](1., 0.)
            axis.set_major_locator(locator)
            try:
                result = dict(ticks=[float(v) for v in locator()], source_error=None)
            except (ValueError, OverflowError, ZeroDivisionError) as exc:
                result = dict(ticks=None, source_error=type(exc).__name__)
            assert axis.data == (float("inf"), -float("inf"))
            secondary_rows.append(dict(orientation=orientation, parent_view=parent_view,
                                       secondary_view=axis.view, secondary_data=axis.data, writes=writes, **result))
    return clean(dict(source_hashes=HASHES, python=sys.version.split()[0], numpy=np.__version__,
                      executed_methods=["TickHelper.set_axis", "Axis.set_major_locator", "Axis.set_minor_locator",
                                        "Axis.get_major_locator", "Axis.get_minor_locator", "FigureBase._remove_axes",
                                        "IndexLocator.__call__", "IndexLocator.tick_values", "SecondaryAxis._set_lims"],
                      fixture_boundaries="controlled local data intervals, shared Ticker containers, group membership and callback sinks; no copied binding algorithm; secondary starts with standard empty data interval",
                      ownership_cases=rows, secondary_cases=secondary_rows))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", RuntimeWarning)
        payload = generate(args.ticker.parent)
    path = ROOT / "testdata/index_axis_reference.json"
    text = json.dumps(payload, indent=2, allow_nan=False) + "\n"
    if args.check:
        if not path.exists() or path.read_text() != text:
            raise SystemExit("reference differs: " + str(path))
    else:
        path.write_text(text)
    print("Index axis reference:", len(payload["ownership_cases"]), "ownership traces,",
          sum(len(row["stages"]) for row in payload["ownership_cases"]), "ownership observations,",
          len(payload["secondary_cases"]), "secondary observations")


if __name__ == "__main__":
    main()
