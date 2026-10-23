"""Pinned LogLocator / Axis / Bbox / image and autoscale integration evidence.

Original source AST owns binding, shared minpos, raw minor overlap, data bounds,
image extents, autoscale and limit validation. Fixture objects supply storage,
providers, geometry and event sinks, never a translated locator/axis algorithm.
"""
from pathlib import Path
import argparse
import ast
import copy
import hashlib
import itertools
import json
import math
import numbers
import sys
import types

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_null_axis_reference import load as load_axis, HASHES as AXIS_HASHES, clean

ROOT = Path(__file__).resolve().parents[1]
HASHES = {**AXIS_HASHES,
    "axes/_base.py": "ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b",
    "scale.py": "4800482469b280454eb6e7a48f866ae7b146b27d1395644ffc09df0e91c9d7c1",
    "image.py": "6e1f61a547b371da9bd3b20b65991a90ec73b370504fd4a87d11d1293b2e2a77",
    "axes/_axes.py": "f61e1cb43575eca70b01c9c80f16d3015e91a8101fe9ce0cc3fdc3d80441c8a7",
}


def load(path):
    ns = load_axis(path)
    ns.update(Real=numbers.Real, mpl=types.SimpleNamespace(rcParams={
        "_internal.classic_mode": False, "axes.autolimit_mode": "data"}))
    parsed = {}
    for name, sha in HASHES.items():
        source = path.parent / name
        if hashlib.sha256(source.read_bytes()).hexdigest() != sha:
            raise ValueError("pinned source differs: " + str(source))
        parsed[name] = ast.parse(source.read_text())

    def find(filename, name, method=None):
        node = next(n for n in parsed[filename].body if isinstance(n, (ast.ClassDef, ast.FunctionDef)) and n.name == name)
        return next(n for n in node.body if isinstance(n, ast.FunctionDef) and n.name == method) if method else node

    def run(node, filename):
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(path.parent / filename), "exec"), ns)

    for name in ["list_suggestion_error_msg", "check_in_list", "kwarg_error", "check_shape"]:
        run(find("_api/__init__.py", name), "_api/__init__.py")
    ns["_api"].check_in_list, ns["_api"].kwarg_error = ns["check_in_list"], ns["kwarg_error"]
    ns["_api"].check_shape = ns["check_shape"]
    for name in ["_decade_less_equal", "_decade_greater_equal", "_decade_less", "_decade_greater",
                 "_Edge_integer", "scale_range", "MaxNLocator", "AutoLocator", "LogLocator"]:
        run(find("ticker.py", name), "ticker.py")
    for name in ["_get_shared_axes", "_get_shared_axis", "_get_axis_name", "_set_lim", "limit_range_for_scale"]:
        run(find("axis.py", "Axis", name), "axis.py")
        setattr(ns["Axis"], name, ns[name])
    for class_name in ["XAxis", "YAxis"]:
        run(find("axis.py", class_name, "get_minpos"), "axis.py")
        ns[class_name + "_get_minpos"] = ns["get_minpos"]
    for method in ["update_from_path", "update_from_data_xy"]:
        run(find("transforms.py", "Bbox", method), "transforms.py")
    ns["Path"] = lambda xy: types.SimpleNamespace(vertices=np.asarray(xy))
    for class_name in ["LogTransform", "InvertedLogTransform"]:
        run(find("scale.py", class_name, "transform_non_affine"), "scale.py")
        ns[class_name + "_transform"] = ns["transform_non_affine"]
    run(find("scale.py", "LogScale", "limit_range_for_scale"), "scale.py")
    ns["log_scale_limit"] = ns["limit_range_for_scale"]
    for method in ["get_extent", "set_extent"]:
        run(find("image.py", "AxesImage", method), "image.py")
        ns["image_" + method] = ns[method]
    for method in ["autoscale_view", "_validate_converted_limits", "set_xbound", "update_datalim"]:
        run(find("axes/_base.py", "_AxesBase", method), "axes/_base.py")
    for name in ["_unpack_to_numpy", "_reshape_2D", "boxplot_stats", "normalize_kwargs"]:
        run(find("cbook.py", name), "cbook.py")
    for name in ["axhline", "axvline", "axhspan", "axvspan"]:
        method = copy.deepcopy(find("axes/_axes.py", "Axes", name)); method.decorator_list = []; run(method, "axes/_axes.py")
    run(find("axes/_base.py", "_AxesBase", "_update_line_limits"), "axes/_base.py")
    bxp = copy.deepcopy(find("axes/_axes.py", "Axes", "bxp"))
    bxp.decorator_list = []  # host deprecation/keyword-only wrapper is outside this profile.
    run(bxp, "axes/_axes.py")
    return ns


def fixtures(ns):
    events = ns["events"]

    class Bbox:
        update_from_path = ns["update_from_path"]
        update_from_data_xy = ns["update_from_data_xy"]
        def __init__(self, label):
            self.label = label
            self._points = np.array([[np.inf, np.inf], [-np.inf, -np.inf]])
            self._minpos = np.array([np.inf, np.inf])
            self._ignore = True
            self.reads = [0, 0]
            self.fail_at = None
        def invalidate(self):
            pass
        @property
        def minposx(self):
            events.append(self.label + ".minpos.x")
            self.reads[0] += 1
            if self.fail_at == self.reads[0]: raise ValueError("minpos provider failed")
            return self._minpos[0]
        @property
        def minposy(self):
            events.append(self.label + ".minpos.y")
            self.reads[1] += 1
            if self.fail_at == self.reads[1]: raise ValueError("minpos provider failed")
            return self._minpos[1]
        @minposx.setter
        def minposx(self, value): self._minpos[0] = value
        @minposy.setter
        def minposy(self, value): self._minpos[1] = value
        @property
        def intervalx(self):
            return self._points[:, 0]
        @intervalx.setter
        def intervalx(self, value): self._points[:, 0] = value
        @property
        def intervaly(self):
            return self._points[:, 1]
        @intervaly.setter
        def intervaly(self, value): self._points[:, 1] = value

    class Transform:
        def __init__(self, logarithmic=True):
            self.logarithmic = logarithmic
        def transform(self, values):
            values = np.asarray(values, dtype=float)
            if not self.logarithmic:
                return values
            return ns["LogTransform_transform"](types.SimpleNamespace(base=10., _clip=True,
                _log_funcs={np.e: np.log, 2: np.log2, 10: np.log10}), values)
        def inverted(self):
            class Inverse:
                def transform(self, values):
                    return ns["InvertedLogTransform_transform"](
                        types.SimpleNamespace(base=10., _exp_funcs={np.e: np.exp, 2: np.exp2}), np.asarray(values))
            return Inverse()

    class Scale:
        name = "log"
        def get_transform(self):
            return Transform()
        def limit_range_for_scale(self, first, last, minpos):
            events.append("scale.limit_range")
            return ns["log_scale_limit"](self, first, last, minpos)

    class Formatter(ns["TickHelper"]):
        def _set_locator(self, locator):
            pass

    class Axis(ns["Axis"]):
        def __init__(self, owner, name):
            self.axes, self.axis_name = owner, name
            self.view, self.space, self._scale = (1., 100.), 4, Scale()
            self.major = types.SimpleNamespace(locator=ns["NullLocator"](), formatter=Formatter())
            self.minor = types.SimpleNamespace(locator=ns["NullLocator"](), formatter=Formatter())
            self.remove_overlapping_locs = True
        def get_minpos(self):
            return ns["XAxis_get_minpos" if self.axis_name == "x" else "YAxis_get_minpos"](self)
        def get_view_interval(self):
            events.append(self.axes.label + ".view." + self.axis_name)
            return self.view
        def get_tick_space(self):
            events.append(self.axes.label + ".space." + self.axis_name)
            return self.space
        def get_transform(self):
            return self._scale.get_transform()
        def _get_autoscale_on(self):
            return True
        def _set_autoscale_on(self, value):
            pass
        def convert_units(self, value):
            return value
        def set_view_interval(self, first, last, **kwargs):
            events.append(self.axes.label + ".write." + self.axis_name)
            self.view = (float(first), float(last))

    class Axes:
        autoscale_view = ns["autoscale_view"]
        set_xbound = ns["set_xbound"]
        _validate_converted_limits = ns["_validate_converted_limits"]
        update_datalim = ns["update_datalim"]
        def __init__(self, label):
            self.label, self.dataLim = label, Bbox(label)
            self.ignore_existing_data_limits = True
            self.xaxis, self.yaxis = Axis(self, "x"), Axis(self, "y")
            self._axis_names, self._axis_map = ["x", "y"], {"x": self.xaxis, "y": self.yaxis}
            self._shared_axes = {"x": ns["Grouper"](), "y": ns["Grouper"]()}
            self._twinned_axes = ns["Grouper"]()
            self._stale_viewlims = {"x": False, "y": False}
            self._viewLim = types.SimpleNamespace(mutatedx=lambda: False, mutatedy=lambda: False)
            self.callbacks = types.SimpleNamespace(process=lambda *args: None)
            self._tight, self._xmargin, self._ymargin = False, .05, .05
            self.use_sticky_edges, self.children = True, []
        def _get_data_children(self):
            return self.children
        def get_autoscalex_on(self): return True
        def get_autoscaley_on(self): return True
        def get_xscale(self): return "log"
        def get_yscale(self): return "log"
        def set_ybound(self, *args): pass
        def get_xbound(self): return tuple(sorted(self.xaxis.view))
        def xaxis_inverted(self): return self.xaxis.view[0] > self.xaxis.view[1]
        def set_xlim(self, values, **kwargs):
            # Actual _set_lim handles validation/re-nonsingular/range. emit is
            # false only to omit GUI/shared callback notification side effects.
            return self.xaxis._set_lim(*values, emit=False, auto=kwargs.get("auto", False))
        def _process_unit_info(self, values, kwargs=None, **options):
            return [row[1] for row in values]

    return Axes, Axis, Bbox, Transform


def observe(ns, function):
    ns["events"].clear()
    ns["warning_messages"].clear()
    try:
        result = function()
        return dict(result=clean(result), error=None, events=ns["events"][:], warnings=ns["warning_messages"][:])
    except (ValueError, TypeError, OverflowError, AttributeError, ZeroDivisionError, AssertionError) as exc:
        return dict(result=None, error=type(exc).__name__, message=str(exc),
                    events=ns["events"][:], warnings=ns["warning_messages"][:])


def generate(path):
    ns = load(path)
    Axes, Axis, Bbox, Transform = fixtures(ns)
    points = [
        ("interior positive", [[-2., 1.], [.001, 1.], [100., 1.]]),
        ("other finite negative remains data", [[10., -2.], [20., .01], [40., 4.]]),
        ("paired nonfinite", [[-2., 1.], [.001, 2.], [100., 3.], [1e-9, math.inf], [math.nan, 1e-12]]),
        ("no positives", [[-4., -3.], [-2., -1.], [0., 0.]]),
        ("subnormal positives", [[5e-324, 1.], [1., 5e-324]]),
        ("empty data", []),
    ]
    data_rows = []
    for label, values in points:
        bbox = Bbox("data")
        bbox.update_from_data_xy(np.asarray(values, dtype=float).reshape((-1, 2)))
        data_rows.append(dict(label=label, vertices=values, points=bbox._points.tolist(), minpos=bbox._minpos.tolist()))

    image_rows = []
    for origin in ["upper", "lower"]:
        for extent in [None, (-2., 8., -.1, 4.), (8., -2., 4., -.1), (-8., -2., -4., -.1)]:
            axes = Axes("image")
            image = types.SimpleNamespace(axes=axes, origin=origin, _extent=extent,
                get_size=lambda: (2, 3), convert_xunits=lambda value: value, convert_yunits=lambda value: value,
                sticky_edges=types.SimpleNamespace(x=[], y=[]))
            actual_extent = ns["image_get_extent"](image)
            axes.get_autoscalex_on = axes.get_autoscaley_on = lambda: False
            ns["image_set_extent"](image, actual_extent)
            image_rows.append(dict(origin=origin, requested=extent, extent=actual_extent,
                points=axes.dataLim._points.tolist(), minpos=axes.dataLim._minpos.tolist(),
                stickies=dict(x=image.sticky_edges.x, y=image.sticky_edges.y)))

    boxplots = []
    class Artist: _alias_to_prop = {}
    class Line2D(Artist): zorder = 2
    artist_module = types.ModuleType("matplotlib.artist"); artist_module.Artist = Artist
    previous_artist = sys.modules.get("matplotlib.artist")
    sys.modules["matplotlib.artist"] = artist_module
    ns["cbook"] = types.SimpleNamespace(normalize_kwargs=ns["normalize_kwargs"])
    ns["mlines"] = types.SimpleNamespace(Line2D=Line2D)
    ns["mpl"].rcParams["boxplot.vertical"] = True
    try:
        for horizontal in [False, True]:
            axes = Axes("boxplot")
            paths = []
            def plot(xs, ys, **kwargs):
                vertices = np.column_stack([xs, ys])
                paths.append(vertices.tolist())
                axes.update_datalim(vertices)
                return [types.SimpleNamespace()]
            axes.plot = plot
            stats = ns["boxplot_stats"](np.asarray([-2., .001, 10., 20., 100.]))
            ns["bxp"](axes, stats, orientation="horizontal" if horizontal else "vertical", widths=.6, capwidths=.2, manage_ticks=False)
            boxplots.append(dict(horizontal=horizontal, stats=stats, drawn_paths=paths,
                points=axes.dataLim._points.tolist(), minpos=axes.dataLim._minpos.tolist(), value_minpos=float(axes.dataLim._minpos[0 if horizontal else 1])))
    finally:
        if previous_artist is None: sys.modules.pop("matplotlib.artist", None)
        else: sys.modules["matplotlib.artist"] = previous_artist

    blended = []
    class Blend:
        def __init__(self, flags): self.flags = flags
        def contains_branch_separately(self, data): return self.flags
        def __sub__(self, other): return types.SimpleNamespace(transform_path=lambda path: path)
    class Line:
        def __init__(self, xs, ys, transform, **kwargs):
            self.path = types.SimpleNamespace(vertices=np.column_stack([xs, ys]))
            self.transform = transform
        def get_path(self): return self.path
        def get_transform(self): return self.transform
    class Rectangle:
        def __init__(self, point, width, height, **kwargs):
            self.vertices = np.asarray([point, [point[0]+width, point[1]+height]])
            self.path = types.SimpleNamespace()
        def set_transform(self, transform): self.transform = transform
        def get_path(self): return self.path
    ns["mlines"] = types.SimpleNamespace(Line2D=Line)
    ns["mpatches"] = types.SimpleNamespace(Rectangle=Rectangle)
    ns["mpl"].axis = types.SimpleNamespace(GRIDLINE_INTERPOLATION_STEPS=180)
    for kind in ["axhline", "axvline", "axhspan", "axvspan"]:
        for values in ([[.125], [-2.]] if "line" in kind else [[.125,4.], [-2.,4.], [-4.,-2.]]):
            axes = Axes("blended"); axes.name = "rectilinear"
            axes._check_no_units = lambda *args: None
            axes._request_autoscale_view = lambda *args: None
            axes.get_ybound = lambda: (0.,1.)
            axes.get_xaxis_transform = lambda **kwargs: Blend((True,False))
            axes.get_yaxis_transform = lambda **kwargs: Blend((False,True))
            axes.transData = types.SimpleNamespace(is_affine=False)
            axes.add_line = lambda line: ns["_update_line_limits"](axes,line)
            # Rectangle container supplies known extent corners. Original span
            # method restores the nondatacoordinate even if a patch sink updates it.
            axes.add_patch = lambda patch: axes.dataLim.update_from_data_xy(patch.vertices)
            ns[kind](axes,*values)
            blended.append(dict(kind=kind, values=values, minpos=axes.dataLim._minpos.tolist(), points=axes.dataLim._points.tolist()))

    contexts = []
    for name in ["x", "y"]:
        first, second = Axes("first"), Axes("second")
        first.dataLim._minpos[:] = .1
        second.dataLim._minpos[:] = .001
        group = ns["Grouper"](); group.join(second, first)
        first._shared_axes[name] = second._shared_axes[name] = group
        axis = first._axis_map[name]
        locator = ns["LogLocator"](); axis.set_major_locator(locator)
        for bounds in [(-2., 100.), (.1, 100.), (100., -2.), (5., 5.), (math.nan, math.inf), (-2., 0.)]:
            queries = {}
            for mode in ["data", "round_numbers"]:
                ns["mpl"].rcParams["axes.autolimit_mode"] = mode
                for method in ["tick_values", "nonsingular", "view_limits"]:
                    queries[mode + ":" + method] = observe(ns, lambda method=method: getattr(locator, method)(*bounds))
            contexts.append(dict(name=name, bounds=bounds, own=.1, shared=[.001, .1], queries=queries))

    owner_rows = []
    for name in ["x", "y"]:
        first, second = Axes("first"), Axes("second")
        first.dataLim._minpos[:] = .1; second.dataLim._minpos[:] = .001
        first._axis_map[name].view = second._axis_map[name].view = (-2., 100.)
        group = ns["Grouper"](); group.join(second, first)
        first._shared_axes[name] = second._shared_axes[name] = group
        shared_major = first._axis_map[name].major
        second._axis_map[name].major = shared_major
        locator = ns["LogLocator"]()
        stages = []
        def take(label, active=locator):
            stages.append(dict(stage=label, owner=active.axis.axes.label,
                call=observe(ns, active), nonsingular=observe(ns, lambda: active.nonsingular(-2., 100.))))
        first._axis_map[name].set_major_locator(locator); take("first installed")
        second._axis_map[name].set_major_locator(locator); take("second installed")
        outside = copy.copy(locator)
        second.dataLim._minpos[:] = .00001; take("later local minpos update")
        figure = ns["FigureBase"]()
        figure._axobservers = types.SimpleNamespace(process=lambda *args: None)
        figure._root_figure = types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda *args: None))
        figure._remove_axes(second, owners=[[first, second]])
        take("removed owner rebinds installed locator")
        take("external copy keeps removed singleton", outside)
        owner_rows.append(dict(name=name, stages=stages))

    secondary_rows = []
    for name in ["x", "y"]:
        for scale in ["linear", "log"]:
            for shift in [0., -2.]:
                parent, child = Axes("parent"), Axes("secondary")
                parent._axis_map[name]._scale = types.SimpleNamespace(name=scale)
                parent._axis_map[name].view = (1., 100.)
                secondary = ns["SecondaryAxis"]()
                secondary._orientation, secondary._axis = name, child._axis_map[name]
                secondary._parent = types.SimpleNamespace(xaxis=parent.xaxis, yaxis=parent.yaxis,
                    get_xlim=lambda: parent.xaxis.view, get_ylim=lambda: parent.yaxis.view)
                secondary._functions = (lambda values: values + shift, lambda values: values - shift)
                secondary._ticks_set, secondary._parentscale = False, None
                secondary.set_xlim = secondary.set_ylim = lambda values: setattr(child._axis_map[name], "view", tuple(values))
                scale_names = []
                secondary.set_xscale = secondary.set_yscale = lambda value, **kwargs: scale_names.append(value)
                secondary._set_lims(); secondary._set_scale()
                locator = ns["LogLocator"](); child._axis_map[name].set_major_locator(locator)
                secondary_rows.append(dict(name=name, parent_scale=scale, shift=shift,
                    view=child._axis_map[name].view, scale_names=scale_names, minpos=child.dataLim._minpos.tolist(),
                    call=observe(ns, locator), nonsingular=observe(ns, lambda: locator.nonsingular(*child._axis_map[name].view))))

    overlap_rows = []
    for name in ["x", "y"]:
        for overlap in [True, False]:
            axes = Axes("minor"); axis = axes._axis_map[name]
            axis.view = (2.1, 40.)
            axis.remove_overlapping_locs = overlap
            major, minor = ns["LogLocator"](), ns["LogLocator"](subs=[1., 2., 5.])
            axis.set_major_locator(major); axis.set_minor_locator(minor)
            overlap_rows.append(dict(name=name, overlap=overlap, view=axis.view,
                raw=observe(ns, minor), filtered=observe(ns, axis.get_minorticklocs)))

    axes = Axes("nonpositive"); axis = axes.xaxis; axis.view = (1.,100.)
    axis.set_major_locator(ns["FixedLocator"]([0.,1.,10.,100.]))
    minor = ns["LogLocator"](subs=[-1.,0.,1.,2.],numticks=9)
    axis.set_minor_locator(minor)
    nonpositive_overlap = dict(raw=observe(ns,minor),filtered=observe(ns,axis.get_minorticklocs))

    margins = []
    for base in [10., 0., 1., math.nan]:
        for mode in ["data", "round_numbers"]:
            axes = Axes("margin")
            axes.update_datalim([[5., 1.]])
            locator = ns["LogLocator"](base=base, numticks=9.)
            axes.xaxis.set_major_locator(locator)
            ns["mpl"].rcParams["axes.autolimit_mode"] = mode
            result = observe(ns, lambda: axes.autoscale_view(scaley=False))
            margins.append(dict(base=base, mode=mode, data=[5., 5.], margin=.05,
                query=result, final_view=axes.xaxis.view))
    for mode in ["data", "round_numbers"]:
        axes = Axes("margin"); axes.update_datalim([[-2., 1.], [.001, 1.], [100., 1.]])
        axes.xaxis.set_major_locator(ns["LogLocator"]())
        ns["mpl"].rcParams["axes.autolimit_mode"] = mode
        margins.append(dict(base=10., mode=mode, data=[-2., 100.], minpos=.001, margin=.05,
            query=observe(ns, lambda: axes.autoscale_view(scaley=False)), final_view=axes.xaxis.view))
    failures = []
    ns["mpl"].rcParams["axes.autolimit_mode"] = "data"
    for failing_read in [4, 5]:
        axes = Axes("failure"); axes.update_datalim([[5., 1.]])
        axes.xaxis.set_major_locator(ns["LogLocator"]())
        axes.dataLim.fail_at = failing_read
        failures.append(dict(failing_read=failing_read, query=observe(ns, lambda: axes.autoscale_view(scaley=False))))
    physical = []
    for integer in [True, False]:
        axes = Axes("physical"); axes.xaxis.space = 4 if integer else 4.
        locator = ns["LogLocator"](base=np.nextafter(1., 0.))
        axes.xaxis.set_major_locator(locator)
        physical.append(dict(python_integer=integer, bounds=[5e-324, float(np.finfo(float).max)],
            query=observe(ns, lambda: locator.tick_values(5e-324, float(np.finfo(float).max)))))
    return clean(dict(source_hashes=HASHES, python=sys.version.split()[0], numpy=np.__version__,
        scope="Original AST methods plus controlled Bbox storage/Path vertices/unit identity/event sinks. Autoscale runs original entire method and actual Axis._set_lim validation with emit=False GUI notifications omitted. Scale transform uses original LogTransform/InvertedLogTransform scalar-array methods. Full renderer/default units/cache lifecycle is not executed.",
        data_cases=data_rows, image_cases=image_rows, boxplots=boxplots, blended=blended, contexts=contexts, ownership=owner_rows,
        secondary=secondary_rows, overlap=overlap_rows, nonpositive_overlap=nonpositive_overlap, margins=margins, failures=failures, physical=physical))


def num(value):
    if isinstance(value, str) and value in ["nan", "inf", "-inf"]:
        return {"nan": "0.0 / 0.0", "inf": "1.0 / 0.0", "-inf": "-1.0 / 0.0"}[value]
    return moon(value)


def arr(values):
    return "[" + ", ".join(num(v) for v in values) + "]"


def verify(expression, row, helper):
    if row["error"]:
        return "  assert_true(try { ignore(" + expression + "); false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })\n"
    return "  " + helper + "(" + expression + ", " + arr(row["result"]) + ")\n"


def number_helper(name):
    return "///|\nfn " + name + "(actual : Array[Double], expected : Array[Double]) -> Unit raise {\n  assert_eq(actual.length(), expected.length())\n  for index, value in expected {\n    if value.is_nan() { assert_true(actual[index].is_nan()) } else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }\n  }\n}\n"


def generated_scene(payload):
    code = "// Generated from original LogLocator and Axis minpos/shared binding AST.\n\n" + number_helper("verify_log_axis_numbers")
    for index, row in enumerate(payload["contexts"]):
        code += f'\n///|\ntest "Log original axis context {index}" {{\n'
        code += "  let previous = @config.axes_autolimit_mode()\n  let classic = @config.classic_mode()\n  defer @config.set_axes_autolimit_mode(previous)\n  defer @config.set_classic_mode(classic)\n  @config.set_classic_mode(false)\n"
        code += "  let axis = @axis.axis()\n  axis.set_tick_layout(120.0, " + moon(row["name"] == "x") + ")\n"
        code += "  axis.bind_minpos(() => 0.1)\n  axis.bind_shared_minpos(() => [0.001, 0.1])\n  let locator = @ticker.LogLocator::new()\n  axis.set_locator(locator.as_locator())\n"
        args = ", ".join(num(v) for v in row["bounds"])
        for mode in ["data", "round_numbers"]:
            code += "  @config.set_axes_autolimit_mode(" + moon(mode) + ")\n"
            for method in ["tick_values", "nonsingular", "view_limits"]:
                result = row["queries"][mode + ":" + method]
                expression = "locator." + method + "(" + args + ")"
                if method != "tick_values" and not result["error"]:
                    expression = "{ let pair = " + expression + "; [pair.0, pair.1] }"
                code += verify(expression, result, "verify_log_axis_numbers")
        code += "}\n"
    for index, row in enumerate(payload["secondary"]):
        name = row["name"]
        code += f'\n///|\ntest "Log original secondary empty minpos {index}" {{\n'
        # The original adapter uses raw set_lim storage and records scale names.
        # It does not run a Secondary constructor or a limit finalizer.
        code += "  // Controlled original raw-view host, independent of constructor/draw finalization.\n"
        code += "  let classic = @config.classic_mode()\n  defer @config.set_classic_mode(classic)\n  @config.set_classic_mode(false)\n  let axis = @axis.axis()\n  axis.set_scale(@scale.log_scale())\n"
        code += "  axis.set_tick_layout(" + ("120.0, true" if name == "x" else "80.0, false") + ")\n"
        code += "  axis.bind_view_interval(() => (" + ", ".join(num(v) for v in row["view"]) + "))\n  axis.bind_minpos(() => 1.0 / 0.0)\n  axis.bind_shared_minpos(() => [1.0 / 0.0])\n"
        code += "  let locator = @ticker.LogLocator::new()\n  axis.set_locator(locator.as_locator())\n"
        code += verify("locator.call()", row["call"], "verify_log_axis_numbers")
        args = ", ".join(num(v) for v in row["view"])
        code += verify("{ let pair = locator.nonsingular(" + args + "); [pair.0, pair.1] }", row["nonsingular"], "verify_log_axis_numbers")
        code += "}\n"
    for index, row in enumerate(payload["overlap"]):
        code += f'\n///|\ntest "Log original raw axis minor overlap {index}" {{\n'
        code += "  let classic = @config.classic_mode()\n  defer @config.set_classic_mode(classic)\n  @config.set_classic_mode(false)\n  let axis = @axis.axis()\n  axis.set_tick_layout(120.0, " + moon(row["name"] == "x") + ")\n  axis.set_scale(@scale.log_scale())\n  axis.set_limits(2.1, 40.0)\n  let major = @ticker.LogLocator::new()\n  let minor = @ticker.LogLocator::new(subs=Some(@ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0]))))\n  axis.set_locator(major.as_locator())\n  axis.set_minor_locator(minor.as_minor_locator())\n  axis.set_minor_overlap_removal(" + moon(row["overlap"]) + ")\n"
        code += verify("minor.call()", row["raw"], "verify_log_axis_numbers")
        code += verify("axis.minor_tick_values_checked(@core.limits(2.1, 40.0))", row["filtered"], "verify_log_axis_numbers")
        code += "}\n"
    row = payload["nonpositive_overlap"]
    code += '\n///|\ntest "Log original clipped nonpositive overlap transform" {\n  let axis = @axis.axis()\n  axis.set_scale(@scale.log_scale())\n  axis.set_limits(1.0, 100.0)\n  axis.set_locator(@ticker.FixedLocator::new([0.0, 1.0, 10.0, 100.0]).as_locator())\n  let minor = @ticker.LogLocator::new(subs=Some(@ticker.LogSubs::Values(@ticker.TickValues::from_array([-1.0, 0.0, 1.0, 2.0]))), numticks=Some(@ticker.LogNumTicks::Number(9.0)))\n  axis.set_minor_locator(minor.as_minor_locator())\n'
    code += verify("minor.call()", row["raw"], "verify_log_axis_numbers")
    code += verify("axis.minor_tick_values_checked(@core.limits(1.0, 100.0))", row["filtered"], "verify_log_axis_numbers") + "}\n"
    for index, row in enumerate(payload["data_cases"]):
        code += f'\n///|\ntest "Log scene original paired minpos {index}" {{\n  let figure = @scene.figure()\n  let axes = figure.axes()\n'
        if row["vertices"]:
            code += "  axes.plot(" + arr([v[0] for v in row["vertices"]]) + ", " + arr([v[1] for v in row["vertices"]]) + ")\n"
        code += "  assert_eq(axes.x_axis().get_minpos(), " + num(row["minpos"][0]) + ")\n  assert_eq(axes.y_axis().get_minpos(), " + num(row["minpos"][1]) + ")\n}\n"
    for index, row in enumerate(payload["ownership"]):
        name, stages = row["name"], row["stages"]
        code += f'\n///|\ntest "Log original Scene shared owner and removed copy {name}" {{\n'
        code += "  let classic = @config.classic_mode()\n  defer @config.set_classic_mode(classic)\n  @config.set_classic_mode(false)\n  let figure = @scene.figure(width=240, height=120)\n  let axes = figure.subplots(1, 2, share_" + name + "=true)\n"
        code += "  for panel in axes { panel.set_position(0.0, 0.0, 0.5, 2.0 / 3.0) }\n"
        for target, values in [("axes[0]", [-2., .1, 100.]), ("axes[1]", [-2., .001, 100.])]:
            args = arr(values) + ", [1.0, 1.0, 1.0]" if name == "x" else "[1.0, 1.0, 1.0], " + arr(values)
            code += "  " + target + ".plot(" + args + ")\n"
        code += "  let locator = @ticker.LogLocator::new()\n  axes[0].set_" + name + "_locator(locator.as_locator())\n"
        def check_stage(stage, active="locator"):
            return verify(active + ".tick_values(-2.0, 100.0)", stage["call"], "verify_log_axis_numbers") + verify("{ let pair = " + active + ".nonsingular(-2.0, 100.0); [pair.0, pair.1] }", stage["nonsingular"], "verify_log_axis_numbers")
        code += check_stage(stages[0])
        code += "  axes[1].set_" + name + "_locator(locator.as_locator())\n"
        code += check_stage(stages[1])
        code += "  let external = locator.copy()\n"
        code += "  axes[1].plot(" + ("[0.00001], [1.0]" if name == "x" else "[1.0], [0.00001]") + ")\n"
        code += check_stage(stages[2])
        code += "  axes[1].remove()\n"
        code += check_stage(stages[3]) + check_stage(stages[4], "external") + "}\n"
    return formatted(code)


def generated_minpos(payload):
    code = "// Original Bbox path and AxesImage extent minpos observations.\n\n"
    for index, row in enumerate(payload["data_cases"]):
        points = "[" + ", ".join("@core.point(" + num(pair[0]) + ", " + num(pair[1]) + ")" for pair in row["vertices"]) + "]"
        code += f'\n///|\ntest "Log artist minpos original Bbox {index}: {row["label"]}" {{\n  let points = {points}\n'
        for variant in ["Line(points, @core.style(\"red\"))", "Scatter(points, @core.style(\"red\"))", "Polygon(points, @core.style(\"red\"))"]:
            code += "  assert_eq(artist_minpos([@render.Artist::" + variant + "], true), " + num(row["minpos"][0]) + ")\n"
            code += "  assert_eq(artist_minpos([@render.Artist::" + variant + "], false), " + num(row["minpos"][1]) + ")\n"
        code += "}\n"
    for index, row in enumerate(payload["image_cases"]):
        origin = "@render.ImageOrigin::" + row["origin"].capitalize()
        extent = "None" if row["requested"] is None else "Some((" + ", ".join(num(v) for v in row["requested"]) + "))"
        code += f'\n///|\ntest "Log artist minpos original image extent {index}" {{\n'
        code += "  let pixel = @colors.rgba(1.0, 1.0, 1.0)\n  let image = @render.Artist::ColorImage([[pixel, pixel, pixel], [pixel, pixel, pixel]], " + origin + ", " + extent + ", 1.0, @render.ImageInterpolation::Nearest)\n"
        code += "  assert_eq(artist_minpos([image], true), " + num(row["minpos"][0]) + ")\n  assert_eq(artist_minpos([image], false), " + num(row["minpos"][1]) + ")\n}\n"
    for index, row in enumerate(payload["blended"]):
        variant = {"axhline":"HLine", "axvline":"VLine", "axhspan":"HSpan", "axvspan":"VSpan"}[row["kind"]]
        code += f'\n///|\ntest "Log blended source data minpos {index}: {row["kind"]}" {{\n'
        code += "  let artist = @render.Artist::" + variant + "(" + ", ".join(num(v) for v in row["values"]) + ", @core.style(\"red\"))\n"
        code += "  assert_eq(artist_minpos([artist], true), " + num(row["minpos"][0]) + ")\n  assert_eq(artist_minpos([artist], false), " + num(row["minpos"][1]) + ")\n"
        code += "  let x_bounds = artist_data_interval([artist], true)\n  let y_bounds = artist_data_interval([artist], false)\n"
        code += "  assert_eq((x_bounds.lower(), x_bounds.upper()), (" + num(row["points"][0][0]) + ", " + num(row["points"][1][0]) + "))\n"
        code += "  assert_eq((y_bounds.lower(), y_bounds.upper()), (" + num(row["points"][0][1]) + ", " + num(row["points"][1][1]) + "))\n}\n"
    for index, row in enumerate(payload["boxplots"]):
        code += f'\n///|\ntest "Log artist minpos original bxp quartile path {index}" {{\n'
        code += "  let stat = @boxplot.box_stats([-2.0, 0.001, 10.0, 20.0, 100.0])\n"
        code += "  assert_eq(stat.q1(), " + num(row["stats"][0]["q1"]) + ")\n"
        code += "  let artist = @render.Artist::BoxPlot([stat], " + moon(row["horizontal"]) + ", @core.style(\"red\"))\n"
        code += "  assert_eq(artist_minpos([artist], true), " + num(row["minpos"][0]) + ")\n  assert_eq(artist_minpos([artist], false), " + num(row["minpos"][1]) + ")\n"
        code += "  let x_bounds = artist_data_interval([artist], true)\n  let y_bounds = artist_data_interval([artist], false)\n"
        code += "  assert_eq((x_bounds.lower(), x_bounds.upper()), (" + num(row["points"][0][0]) + ", " + num(row["points"][1][0]) + "))\n"
        code += "  assert_eq((y_bounds.lower(), y_bounds.upper()), (" + num(row["points"][0][1]) + ", " + num(row["points"][1][1]) + "))\n}\n"
    return formatted(code)


def generated_margins(payload):
    code = "// Original autoscale_view -> set_xbound -> Axis._set_lim outcomes.\n\n///|\nfn verify_log_axis_margin(actual : Double, expected : Double) -> Unit raise {\n  if expected == 0.0 { assert_eq(actual, expected) } else {\n    assert_true(Double::abs(actual - expected) <= Double::abs(expected) * 1.0e-12)\n  }\n}\n"
    for index, row in enumerate(payload["margins"]):
        code += f'\n///|\ntest "Log original checked autoscale margin {index}" {{\n'
        code += "  let previous = @config.axes_autolimit_mode()\n  let classic = @config.classic_mode()\n  defer @config.set_axes_autolimit_mode(previous)\n  defer @config.set_classic_mode(classic)\n  @config.set_classic_mode(false)\n  @config.set_axes_autolimit_mode(" + moon(row["mode"]) + ")\n"
        code += "  let x = @axis.axis()\n  let y = @axis.axis()\n  x.set_scale(@ticker_scale.log_scale())\n  y.set_limits(0.0, 2.0)\n"
        minpos = row.get("minpos", 5.)
        code += "  x.bind_minpos(() => " + num(minpos) + ")\n  x.bind_shared_minpos(() => [" + num(minpos) + "])\n  let locator = @ticker.LogLocator::new(base=" + num(row["base"]) + ", numticks=Some(@ticker.LogNumTicks::Number(9.0)))\n  x.set_locator(locator.as_locator())\n"
        values = [[-2., 1.], [.001, 1.], [100., 1.]] if "minpos" in row else [[5., 1.]]
        points = "[" + ", ".join("@core.point(" + num(a) + ", " + num(b) + ")" for a,b in values) + "]"
        code += "  let panel = @render.panel_with_sharing(None, [@render.Artist::Line(" + points + ", @core.style(\"red\"))], None, [], None, x, y, None, None, false, [], [], x_margin=0.05)\n  let figure = @render.figure(240, 120, 0, [panel], [], None)\n"
        if row["query"]["error"]:
            code += "  assert_true(try { ignore(compute_scale(figure, 0)); false } catch { @core.DataError::NonFiniteLimit(..) => true; _ => false })\n"
        else:
            code += "  let actual = compute_scale(figure, 0)\n  verify_log_axis_margin(actual.xmin, " + num(row["final_view"][0]) + ")\n  verify_log_axis_margin(actual.xmax, " + num(row["final_view"][1]) + ")\n"
        code += "}\n"
    return formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with np.errstate(all="ignore"):
        payload = generate(args.ticker)
    outputs = {ROOT / "testdata/log_axis_reference.json": json.dumps(payload, indent=2, allow_nan=False) + "\n",
        ROOT / "scene/log_axis_reference_test.mbt": generated_scene(payload),
        ROOT / "backend/svg/log_locator_minpos_wbtest.mbt": generated_minpos(payload),
        ROOT / "backend/svg/log_locator_autoscale_wbtest.mbt": generated_margins(payload)}
    for path, text in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(text)
    print("Log axis reference:", len(payload["data_cases"]), "Bbox profiles,", len(payload["image_cases"]),
        "images,", len(payload["contexts"]), "contexts,", len(payload["ownership"]), "owner traces,",
        len(payload["secondary"]), "secondary,", len(payload["overlap"]), "overlap,", len(payload["margins"]), "autoscale")


if __name__ == "__main__":
    main()
