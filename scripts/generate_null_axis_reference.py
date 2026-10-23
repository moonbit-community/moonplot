"""Execute pinned Null/AutoMinor and Axis binding, filtering and skip bodies.

The oracle executes original AST methods, not a translated axis algorithm.
Containers, provider event sinks, physical transforms and visible Tick artists
are controlled fixtures; it does not import installed Matplotlib or render it.
"""
from pathlib import Path
import argparse
import ast
import copy
import hashlib
import itertools
import json
import logging
import math
import sys
import types
import weakref

import numpy as np

from generate_auto_date_reference import formatted, moon

ROOT = Path(__file__).resolve().parents[1]
HASHES = {
    "ticker.py": "49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad",
    "axis.py": "f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0",
    "transforms.py": "109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8",
    "_api/__init__.py": "7e262cedd8ce1a1660c2e2caa63adeb078c29e36bd541b8e6f773cfed4c3c782",
    "figure.py": "b440ab0a5be03cb39b13529a2fec497d2d96deb083e3e56d6220593e3ec567da",
    "cbook.py": "e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643",
    "axes/_secondary_axes.py": "b2aaaae077e03ff6538d1a4bf8a69c3476eed0e27120aa567de138c794599a93",
}

# Both exact pins use NumPy 2.3.5's Darwin arm64 numeric profile. The second
# bundle was re-signed on 2026-10-22. Its code/data bytes were independently
# compared with the official macOS14 wheel (core SHA256 96ce8cda...609de09):
# only six load-command size bytes and the code signature differ.
NUMPY_BINARY_HASHES = {
    "44fdecc68c23ac6dd5825dc124c801086f7f68dc15ab008ed584ed6a47be6305",
    "b11f1ef3534cc6bb0a9c8141206350b27cadf48632c34acfcfc97ca6e700363e",
}


def clean(value):
    if isinstance(value, (float, np.floating)):
        return float(value) if np.isfinite(value) else repr(float(value))
    if isinstance(value, (tuple, list, np.ndarray)):
        return [clean(v) for v in value]
    if isinstance(value, dict):
        return {k: clean(v) for k, v in value.items()}
    if isinstance(value, np.integer):
        return int(value)
    return value


def load(path):
    if sys.version_info[:3] != (3, 12, 14) or np.__version__ != "2.3.5":
        raise ValueError("fixed CPython3.12.14 / NumPy2.3.5 required")
    binary = Path(np._core._multiarray_umath.__file__)
    if hashlib.sha256(binary.read_bytes()).hexdigest() not in NUMPY_BINARY_HASHES:
        raise ValueError("fixed Darwin arm64 NumPy binary differs")
    parsed = {}
    for name, sha in HASHES.items():
        source = path.parent / name
        if hashlib.sha256(source.read_bytes()).hexdigest() != sha:
            raise ValueError("pinned source differs: " + str(source))
        parsed[name] = ast.parse(source.read_text()).body
    events, warning_messages = [], []
    ns = dict(__name__="matplotlib.ticker", np=np, math=math, itertools=itertools,
              weakref=weakref, _log=logging.getLogger("null-axis-reference"),
              mpl=types.SimpleNamespace(rcParams={"xtick.minor.ndivs": "auto", "ytick.minor.ndivs": "auto"}))

    def run(node, filename):
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(path.parent / filename), "exec"), ns)

    for name in ["check_isinstance"]:
        run(next(n for n in parsed["_api/__init__.py"] if isinstance(n, ast.FunctionDef) and n.name == name), "_api/__init__.py")
    ns["_api"] = types.SimpleNamespace(check_isinstance=ns["check_isinstance"], warn_external=warning_messages.append)
    for name in ["_nonsingular", "_interval_contains_close"]:
        run(next(n for n in parsed["transforms.py"] if isinstance(n, ast.FunctionDef) and n.name == name), "transforms.py")
    ns["mtransforms"] = types.SimpleNamespace(_nonsingular=ns["_nonsingular"], _interval_contains_close=ns["_interval_contains_close"])
    for name in ["TickHelper", "Locator", "NullLocator", "FixedLocator", "IndexLocator", "AutoMinorLocator"]:
        run(next(n for n in parsed["ticker.py"] if isinstance(n, ast.ClassDef) and n.name == name), "ticker.py")
    ns["mticker"] = types.SimpleNamespace(**{n: ns[n] for n in ["Locator", "NullLocator", "FixedLocator", "AutoMinorLocator"]})
    run(next(n for n in parsed["cbook.py"] if isinstance(n, ast.ClassDef) and n.name == "Grouper"), "cbook.py")

    def partial(filename, name, methods):
        node = copy.deepcopy(next(n for n in parsed[filename] if isinstance(n, ast.ClassDef) and n.name == name))
        node.bases, node.decorator_list = [], []
        node.body = [n for n in node.body if isinstance(n, ast.FunctionDef) and n.name in methods]
        run(node, filename)

    partial("axis.py", "Axis", {"get_scale", "get_transform", "get_majorticklocs", "get_minorticklocs", "_tick_group_visible", "_update_ticks", "get_major_locator", "get_minor_locator", "get_major_formatter", "get_minor_formatter", "set_major_locator", "set_minor_locator"})
    partial("figure.py", "FigureBase", {"_remove_axes"})
    partial("axes/_secondary_axes.py", "SecondaryAxis", {"_set_scale", "_set_lims"})
    ns["_log"].disabled = True
    ns["events"], ns["warning_messages"] = events, warning_messages
    return ns


def fixtures(ns):
    events = ns["events"]

    class Transform:
        def __init__(self, function=lambda values: values):
            self.function = function
        def transform(self, values):
            return self.function(np.asarray(values, dtype=float))

    class Scale:
        def __init__(self, label, name="linear", transform=None):
            self.label, self._name, self.transform = label, name, transform or Transform()
        @property
        def name(self):
            events.append(self.label + ".scale")
            return self._name
        @name.setter
        def name(self, value):
            self._name = value
        def get_transform(self):
            return self.transform

    class Formatter(ns["TickHelper"]):
        def __init__(self, label, fail=False):
            self.label, self.fail = label, fail
        def _set_locator(self, locator):
            pass
        def format_ticks(self, values):
            events.append(self.label + ".formatter")
            if self.fail:
                raise ValueError("formatter must not run: " + self.label)
            return [str(float(v)) for v in values]

    class Tick:
        def __init__(self):
            self.label1 = self.label2 = types.SimpleNamespace(set_text=lambda text: None)
        def update_position(self, value):
            self.value = value
        def get_loc(self):
            return self.value

    class Axis(ns["Axis"]):
        def __init__(self, label, name="x", majors=(0., 1.), view=(0., 1.), scale="linear", transform=None):
            self.label, self._axis_name, self.view = label, name, view
            self._scale = Scale(label, scale, transform)
            self._major_tick_kw, self._minor_tick_kw = {}, {}
            self.remove_overlapping_locs = True
            self.major = types.SimpleNamespace(locator=None, formatter=Formatter(label + ".major"))
            self.minor = types.SimpleNamespace(locator=None, formatter=Formatter(label + ".minor"))
            self.major_values = np.asarray(majors)
            self.set_major_locator(Provider(self, "major"))
            self.set_minor_locator(ns["NullLocator"]())
        @property
        def axis_name(self):
            events.append(self.label + ".name")
            return self._axis_name
        def get_view_interval(self):
            events.append(self.label + ".view")
            return self.view
        def get_major_ticks(self, count):
            return [Tick() for _ in range(count)]
        def get_minor_ticks(self, count):
            return [Tick() for _ in range(count)]

    class Provider(ns["Locator"]):
        def __init__(self, owner, level, values=None, fail=False):
            self.owner, self.level, self.values, self.fail = owner, level, values, fail
        def __call__(self):
            events.append(self.axis.label + "." + self.level + ".provider")
            if self.fail is True or callable(self.fail) and self.fail():
                raise ValueError("provider must not run")
            return self.axis.major_values if self.values is None else np.asarray(self.values)

    return Axis, Formatter, Provider, Transform


def observe(ns, function):
    ns["events"].clear()
    ns["warning_messages"].clear()
    try:
        result, error = function(), None
    except (ValueError, TypeError, OverflowError, AttributeError, ZeroDivisionError) as exc:
        result, error = None, type(exc).__name__
    return dict(values=None if result is None else clean(result), error=error,
                events=ns["events"][:], warnings=ns["warning_messages"][:])


def generate(path):
    ns = load(path)
    Axis, Formatter, Provider, Transform = fixtures(ns)
    null = ns["NullLocator"]()
    ranges = [(0., 0.), (1., 1.), (-1., -1.), (2., -3.), (math.nan, math.inf),
              (math.inf, -math.inf), (-0., 0.), (5e-324, 5e-324), (1e-300, 2e-300),
              (1e12, 1e12 + 1e-4), (-1e308, 1e308)]
    null_rows = [dict(bounds=clean(pair), call=clean(null()), ticks=clean(null.tick_values(*pair)),
                      view=clean(null.view_limits(*pair)), nonsingular=clean(null.nonsingular(*pair))) for pair in ranges]
    null.set_params(unused=99)
    warning = ns["warning_messages"][:]
    assert warning == ["'set_params()' not defined for locator of type <class 'matplotlib.ticker.NullLocator'>"]

    specs = [
        ("unique irregular neighbors", [3., 1., 0., 1., 3.], (.75, 1.75), 2., True),
        ("raw retains outer neighbor", [0., 1.], (.75, 1.75), 2., True),
        ("overlap disabled", [0., 1.], (.75, 1.75), 2., False),
        ("span tolerance removes nearby irregular major", [0., 1., 1.50001], (0., 2.), 2., True),
        ("span tolerance keeps farther irregular major", [0., 1., 1.50003], (0., 2.), 2., True),
        ("reversed view source remains ascending", [0., 1.], (1.75, .75), 2., True),
        ("auto 4", [0., 3.], (0., 3.), "auto", True),
        ("auto 5", [0., 2.5], (0., 2.5), "auto", True),
        ("only one major", [2., 2.], (0., 1.), None, True),
        ("zero returns NaN", [0., 1.], (0., 1.), 0., True),
        ("negative short interval", [0., 1.], (.1, .4), -1., True),
        ("fractional divisions", [0., 1.], (0., 1.), 2.5, True),
        ("NaN later major", [0., 1., math.nan], (0., 1.), 2., True),
    ]
    axis_rows = []
    for name in ["x", "y"]:
        for label, majors, view, n, overlap in specs:
            axis = Axis("axis", name=name, majors=majors, view=view)
            locator = ns["AutoMinorLocator"](n)
            axis.set_minor_locator(locator)
            axis.remove_overlapping_locs = overlap
            raw = observe(ns, locator)
            filtered = observe(ns, axis.get_minorticklocs)
            axis_rows.append(dict(label=label, name=name, majors=clean(majors), view=clean(view), n=n,
                                  overlap=overlap, raw=raw, filtered=filtered, captured=locator.ndivs))

    axis = Axis("late", majors=[0., 1.], view=(0., 1.))
    answers = iter([False, True])
    axis.set_major_locator(Provider(axis, "major", fail=lambda: next(answers)))
    axis.set_minor_locator(ns["AutoMinorLocator"](2.))
    late_major_error = observe(ns, axis.get_minorticklocs)
    assert late_major_error["error"] == "ValueError"
    assert late_major_error["events"].count("late.major.provider") == 2

    # Stateful provider ownership: original setter updates one axis pointer.
    ownership_rows = []
    for name in ["x", "y"]:
        first = Axis("first", name=name, majors=[0., 1.], view=(0., 1.))
        second = Axis("second", name=name, majors=[10., 12.], view=(10., 12.))
        locator = ns["AutoMinorLocator"]()
        ns["mpl"].rcParams.update({"xtick.minor.ndivs": 2, "ytick.minor.ndivs": 3})
        stages = []
        def take(label, active=locator):
            stages.append(dict(stage=label, owner=active.axis.label, captured=active.ndivs,
                               query=observe(ns, active), after=active.ndivs))
        first.set_minor_locator(locator)
        take("first install captures own rc")
        external = copy.copy(locator)
        second.set_minor_locator(locator)
        take("second install changes all owner providers")
        second.major_values = np.asarray([20., 24.])
        second.view = (20., 24.)
        take("later major and view updates are live")
        # This controlled fixture changes only the scale name, not Axis._set_scale
        # or its default installation. The existing major provider stays live.
        retained_major = second.get_major_locator()
        second._scale.name = "log"
        take("log is allowed at setter and warns only on call")
        second._scale.name = "linear"
        assert second.get_major_locator() is retained_major
        np.testing.assert_array_equal(second.major_values, [20., 24.])
        locator.ndivs = None
        ns["mpl"].rcParams["xtick.minor.ndivs" if name == "x" else "ytick.minor.ndivs"] = 4
        take("manual reset captures current owner rc")
        take("outside copy retains first owner and old captured divisions", external)
        ownership_rows.append(dict(name=name, stages=stages))
    ns["mpl"].rcParams.update({"xtick.minor.ndivs": "auto", "ytick.minor.ndivs": "auto"})

    shared_rows = []
    for name in ["x", "y"]:
        first = Axis("first", name=name, majors=[0., 1.], view=(0., 1.))
        second = Axis("second", name=name, majors=[0., 1.], view=(0., 1.))
        second.major, second.minor = first.major, first.minor
        locator = ns["AutoMinorLocator"](2.)
        first.set_minor_locator(locator)
        second.set_minor_locator(locator)
        external = copy.copy(locator)
        wrappers = []
        group = ns["Grouper"]()
        twins = ns["Grouper"]()
        class Wrapper:
            pass
        for axis in [first, second]:
            wrapper = Wrapper()
            wrapper._axis_names, wrapper._axis_map = [name], {name: axis}
            wrapper._shared_axes, wrapper._twinned_axes = {name: group}, twins
            wrappers.append(wrapper)
        group.join(wrappers[1], wrappers[0])
        figure = ns["FigureBase"]()
        figure._axobservers = types.SimpleNamespace(process=lambda *args: None)
        figure._root_figure = types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda *args: None))
        before = observe(ns, locator)
        figure._remove_axes(wrappers[1], owners=[wrappers[:]])
        after = observe(ns, locator)
        second.view = (1., 2.)
        # The shared major Provider is itself still bound by original set_axis;
        # its call below must observe its rebound axis, not a captured owner.
        outside = observe(ns, external)
        shared_rows.append(dict(name=name, before=before, after=after, outside=outside,
                                owner=locator.axis.label, copy_owner=external.axis.label))

    secondary_rows = []
    for name in ["x", "y"]:
        for parent_scale in ["linear", "log"]:
            for reversed_view in [False, True]:
                parent_view = (1., 3.) if not reversed_view else (3., 1.)
                parent = Axis("parent", name=name, majors=[1., 2., 3.], view=parent_view, scale=parent_scale)
                secondary_axis = Axis("secondary", name=name, majors=[12., 14., 15.00005], view=(0., 1.))
                secondary = ns["SecondaryAxis"]()
                secondary._orientation, secondary._axis = name, secondary_axis
                secondary._parent = types.SimpleNamespace(xaxis=parent, yaxis=parent,
                    get_xlim=lambda: parent.view, get_ylim=lambda: parent.view)
                secondary._functions = (lambda values: values * 2. + 10., lambda values: (values - 10.) / 2.)
                secondary._ticks_set, secondary._parentscale = False, None
                secondary.set_xlim = secondary.set_ylim = lambda values: setattr(secondary_axis, "view", tuple(values))
                scale_writes = []
                def set_scale(scale, functions):
                    scale_writes.append(scale)
                    inverse = functions[0]
                    function = inverse if scale == "function" else lambda values: np.log10(inverse(values))
                    secondary_axis._scale = types.SimpleNamespace(name=scale, get_transform=lambda: Transform(function))
                secondary.set_xscale = secondary.set_yscale = set_scale
                secondary._set_lims()
                secondary._set_scale()
                locator = ns["AutoMinorLocator"](2.)
                secondary_axis.set_minor_locator(locator)
                raw = observe(ns, locator)
                filtered = observe(ns, secondary_axis.get_minorticklocs)
                secondary_rows.append(dict(name=name, parent_scale=parent_scale, parent_view=parent_view,
                    secondary_view=secondary_axis.view, secondary_scale=secondary_axis.get_scale(),
                    major_values=secondary_axis.major_values, scale_writes=scale_writes, raw=raw, filtered=filtered))

    null_getter = []
    for overlap in [True, False]:
        axis = Axis("null-getter", majors=[], view=(0., 1.))
        axis.set_major_locator(ns["IndexLocator"](1., 0.))
        def empty_data():
            ns["events"].append("null-getter.data")
            return math.inf, -math.inf
        axis.get_data_interval = empty_data
        axis.remove_overlapping_locs = overlap
        null_getter.append(dict(overlap=overlap, **observe(ns, axis.get_minorticklocs)))
    assert null_getter[0]["error"] == "ValueError"
    assert null_getter[1]["values"] == [] and null_getter[1]["events"] == []

    # Actual _update_ticks group branches. Poison the unused provider and
    # formatter so an eager empty-array implementation is distinguishable.
    skip_rows = []
    for null_major, null_minor in [(True, True), (True, False), (False, True), (False, False)]:
        for poison in [False, True]:
            axis = Axis("draw", majors=[0., 1.], view=(0., 1.))
            if null_major:
                axis.set_major_locator(ns["NullLocator"]())
            if null_minor:
                axis.set_minor_locator(ns["NullLocator"]())
            else:
                axis.set_minor_locator(Provider(axis, "minor", values=[.5]))
            for level, is_null in [("major", null_major), ("minor", null_minor)]:
                getattr(axis, level).formatter.fail = poison and is_null
            if null_major and null_minor:
                axis.get_view_interval = lambda: (_ for _ in ()).throw(ValueError("view provider must not run"))
            result = observe(ns, lambda: [tick.get_loc() for tick in axis._update_ticks()])
            skip_rows.append(dict(null_major=null_major, null_minor=null_minor, poison=poison, **result))
    # Ordinary empty locators still call format_ticks; Null skips the group.
    axis = Axis("empty", majors=[], view=(0., 1.))
    axis.major.formatter.fail = True
    empty_result = observe(ns, axis._update_ticks)
    assert empty_result["error"] == "ValueError"
    skip_rows.append(dict(label="empty ordinary locator still invokes formatter", **empty_result))
    return clean(dict(source_hashes=HASHES, python=sys.version.split()[0], numpy=np.__version__,
        numpy_binary_sha256=hashlib.sha256(Path(np._core._multiarray_umath.__file__).read_bytes()).hexdigest(),
        methods=["full TickHelper/Locator/NullLocator/AutoMinorLocator", "Axis.set_major_locator/set_minor_locator/get_majorticklocs/get_minorticklocs/_update_ticks", "Grouper", "FigureBase._remove_axes", "SecondaryAxis._set_lims/_set_scale", "transforms._nonsingular/_interval_contains_close"],
        fixture_boundaries="controlled axis Ticker containers, live major callbacks, rc mapping, known identity/log10/function transforms, Tick/formatter sinks; secondary scale setter captures source scale name/functions but does not implement scale-default lifecycle or full renderer", null_ranges=null_rows,
        null_warning=warning, axis_cases=axis_rows, late_major_error=late_major_error, ownership=ownership_rows, shared=shared_rows,
        secondary=secondary_rows, null_getter=null_getter, null_skip=skip_rows))


def number(value):
    if isinstance(value, str) and value in ["nan", "inf", "-inf"]:
        return {"nan": "0.0 / 0.0", "inf": "1.0 / 0.0", "-inf": "-1.0 / 0.0"}[value]
    return moon(value)


def array(values):
    return "[" + ", ".join(number(v) for v in values) + "]"


def ndivs(value):
    if value is None:
        return "None"
    if isinstance(value, str):
        return "Some(@config.MinorTickDivisions::Text(" + moon(value) + "))"
    return "Some(@config.MinorTickDivisions::Number(" + moon(float(value)) + "))"


def generated_null(payload):
    code = "// Generated from original pinned NullLocator and transforms AST.\n\n///|\nfn verify_null_axis_numbers(actual : Array[Double], expected : Array[Double]) -> Unit raise {\n  assert_eq(actual.length(), expected.length())\n  for index, value in expected {\n    if value.is_nan() { assert_true(actual[index].is_nan()) } else {\n      assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64())\n    }\n  }\n}\n"
    for index, row in enumerate(payload["null_ranges"]):
        args = ", ".join(number(v) for v in row["bounds"])
        code += f'\n///|\ntest "Null original range {index}" {{\n  let locator = @ticker.NullLocator::new()\n'
        code += f"  assert_eq(locator.call(), [])\n  assert_eq(locator.tick_values({args}), [])\n"
        for method in ["view_limits", "nonsingular"]:
            key = "view" if method == "view_limits" else method
            code += f"  let (lower, upper) = locator.{method}({args})\n  verify_null_axis_numbers([lower, upper], {array(row[key])})\n"
        code += "}\n"
    code += '\n///|\ntest "Null inherited set params warning is a no op and warning snapshots are copied" {\n  let locator = @ticker.NullLocator::new()\n  locator.set_params()\n'
    code += "  assert_eq(locator.warnings(), " + moon(payload["null_warning"]) + ")\n"
    code += '  let previous = locator.warnings()\n  previous.clear()\n  assert_eq(locator.warnings().length(), 1)\n  let copied = locator.copy()\n  copied.set_params()\n  assert_eq(copied.warnings().length(), 1)\n  assert_eq(locator.warnings().length(), 1)\n  assert_eq(copied.call(), [])\n  assert_eq(copied.warnings(), [])\n  assert_eq(locator.warnings().length(), 1)\n  assert_eq(locator.tick_values(0.0 / 0.0, 1.0 / 0.0), [])\n  assert_eq(locator.warnings(), [])\n}\n'
    return formatted(code)


def generated_axes(payload):
    code = "// Generated from original AutoMinorLocator + Axis.get_minorticklocs.\n// Raw source getters retain neighbors; final SVG clipping is separate.\n\n///|\nfn verify_auto_minor_axis_numbers(actual : Array[Double], expected : Array[Double]) -> Unit raise {\n  assert_eq(actual.length(), expected.length())\n  for index, value in expected {\n    if value.is_nan() { assert_true(actual[index].is_nan()) } else {\n      assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64())\n    }\n  }\n}\n"
    for index, row in enumerate(payload["axis_cases"]):
        if row["filtered"]["error"]:
            raise ValueError("unexpected source axis fixture error")
        code += f'\n///|\ntest "AutoMinor original Axis raw overlap {index}: {row["label"]}" {{\n'
        code += "  let axis = @axis.axis()\n  axis.set_tick_layout(100.0, " + moon(row["name"] == "x") + ")\n"
        code += "  let view = @core.limits(" + ", ".join(number(v) for v in row["view"]) + ")\n"
        code += "  axis.set_limits(view.lower(), view.upper())\n"
        code += "  let major = @ticker.FixedLocator::new(" + array(row["majors"]) + ")\n"
        code += "  axis.set_locator(major.as_locator())\n"
        code += "  let minor = @ticker.AutoMinorLocator::new(ndivs=" + ndivs(row["n"]) + ")\n"
        code += "  axis.set_minor_locator(minor.as_minor_locator())\n  axis.set_minor_overlap_removal(" + moon(row["overlap"]) + ")\n"
        code += "  verify_auto_minor_axis_numbers(minor.call(), " + array(row["raw"]["values"]) + ")\n"
        code += "  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), " + array(row["filtered"]["values"]) + ")\n}\n"
    for row in payload["ownership"]:
        name = row["name"]
        horizontal = moon(name == "x")
        stages = row["stages"]
        code += f'\n///|\ntest "AutoMinor original axis owner trace {name}" {{\n'
        code += "  let previous_x = @config.minor_tick_divisions(horizontal=true)\n  let previous_y = @config.minor_tick_divisions(horizontal=false)\n"
        code += "  defer { @config.set_minor_tick_divisions(previous_x, horizontal=true) catch { _ => () }; @config.set_minor_tick_divisions(previous_y, horizontal=false) catch { _ => () } }\n"
        code += "  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(2.0), horizontal=true)\n  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(3.0), horizontal=false)\n"
        code += "  let first = @axis.axis()\n  let second = @axis.axis()\n"
        code += "  for axis in [first, second] { axis.set_tick_layout(100.0, " + horizontal + ") }\n"
        code += "  first.set_limits(0.0, 1.0)\n  second.set_limits(10.0, 12.0)\n"
        code += "  first.set_locator(@ticker.FixedLocator::new([0.0, 1.0]).as_locator())\n  second.set_locator(@ticker.FixedLocator::new([10.0, 12.0]).as_locator())\n  let minor = @ticker.AutoMinorLocator::new()\n  first.set_minor_locator(minor.as_minor_locator())\n"
        code += "  verify_auto_minor_axis_numbers(minor.call(), " + array(stages[0]["query"]["values"]) + ")\n  let external = minor.copy()\n  second.set_minor_locator(minor.as_minor_locator())\n"
        code += "  verify_auto_minor_axis_numbers(minor.call(), " + array(stages[1]["query"]["values"]) + ")\n"
        code += "  second.set_locator(@ticker.FixedLocator::new([20.0, 24.0]).as_locator())\n  second.set_limits(20.0, 24.0)\n"
        code += "  verify_auto_minor_axis_numbers(minor.call(), " + array(stages[2]["query"]["values"]) + ")\n"
        code += "  second.set_scale(@scale.log_scale())\n  second.set_minor_locator(minor.as_minor_locator())\n  assert_eq(minor.call(), [])\n"
        code += "  assert_eq(minor.warnings(), " + moon(stages[3]["query"]["warnings"]) + ")\n"
        code += "  second.set_scale(@scale.linear_scale())\n"
        code += "  // The source fixture changes only the scale name and retains these majors.\n"
        code += "  second.set_locator(@ticker.FixedLocator::new([20.0, 24.0]).as_locator())\n"
        code += "  minor.set_ndivs(None)\n  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(4.0), horizontal=" + horizontal + ")\n"
        code += "  verify_auto_minor_axis_numbers(minor.call(), " + array(stages[4]["query"]["values"]) + ")\n"
        code += "  verify_auto_minor_axis_numbers(external.call(), " + array(stages[5]["query"]["values"]) + ")\n}\n"
    for row in payload["shared"]:
        name = row["name"]
        code += f'\n///|\ntest "AutoMinor original shared removal rebind and outside copy {name}" {{\n'
        code += "  let figure = @scene.figure()\n  let axes = figure.subplots(1, 2, share_" + name + "=true)\n"
        code += "  axes[0].set_" + name + "_limits(0.0, 1.0)\n  axes[1].set_" + name + "_locator(@ticker.FixedLocator::new([0.0, 1.0]).as_locator())\n"
        code += "  let minor = @ticker.AutoMinorLocator::new(ndivs=Some(@config.MinorTickDivisions::Number(2.0)))\n  axes[1].set_" + name + "_minor_locator(minor.as_minor_locator())\n"
        code += "  verify_auto_minor_axis_numbers(minor.call(), " + array(row["before"]["values"]) + ")\n  let external = minor.copy()\n  axes[1].remove()\n"
        code += "  verify_auto_minor_axis_numbers(minor.call(), " + array(row["after"]["values"]) + ")\n  axes[1].set_" + name + "_limits(1.0, 2.0)\n"
        code += "  verify_auto_minor_axis_numbers(external.call(), " + array(row["outside"]["values"]) + ")\n  verify_auto_minor_axis_numbers(minor.call(), " + array(row["after"]["values"]) + ")\n}\n"
    for index, row in enumerate(payload["secondary"]):
        name = row["name"]
        code += f'\n///|\ntest "AutoMinor original secondary own major view scale {index}" {{\n'
        code += "  let figure = @scene.figure()\n  let axes = figure.axes()\n  axes.set_" + name + "_limits(" + ", ".join(number(v) for v in row["parent_view"]) + ")\n"
        if row["parent_scale"] == "log":
            code += "  axes." + name + "_axis().set_scale(@scale.log_scale())\n"
        code += "  axes.set_" + name + "_locator(@ticker.FixedLocator::new([1.0, 2.0, 3.0]).as_locator())\n"
        code += "  let secondary = axes.secondary_" + name + "axis(value => value * 2.0 + 10.0, value => (value - 10.0) / 2.0)\n"
        code += "  secondary.set_locator(@ticker.FixedLocator::new(" + array(row["major_values"]) + ").as_locator())\n"
        code += "  let minor = @ticker.AutoMinorLocator::new(ndivs=Some(@config.MinorTickDivisions::Number(2.0)))\n  secondary.set_minor_locator(minor.as_minor_locator())\n"
        code += "  verify_auto_minor_axis_numbers(minor.call(), " + array(row["raw"]["values"]) + ")\n"
        code += "  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), " + array(row["filtered"]["values"]) + ")\n"
        code += "  assert_eq(minor.warnings(), [])\n  secondary.set_minor_overlap_removal(false)\n"
        code += "  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), " + array(row["raw"]["values"]) + ")\n}\n"
    return formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with np.errstate(all="ignore"):
        payload = generate(args.ticker)
    outputs = {ROOT / "testdata/null_axis_reference.json": json.dumps(payload, indent=2, allow_nan=False) + "\n",
               ROOT / "ticker/null_locator_reference_test.mbt": generated_null(payload),
               ROOT / "scene/auto_minor_axis_reference_test.mbt": generated_axes(payload)}
    for path, text in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(text)
    print("Null/Axis reference:", len(payload["null_ranges"]), "Null ranges,", len(payload["axis_cases"]),
          "raw axis cases,", sum(len(row["stages"]) for row in payload["ownership"]), "owner stages,",
          len(payload["shared"]), "shared removals,", len(payload["secondary"]), "secondary cases,",
          len(payload["null_skip"]), "Null skip cases")


if __name__ == "__main__":
    main()
