"""Observe raw Bbox data limits and IndexLocator independently of display scale.

Original Bbox.update_from_path, IndexLocator and interval containment bodies
execute against fixed NumPy. Fixture objects supply only the Bbox storage,
invalidation sink, path vertices and axis getter. Display transforms are explicit
identity/log10 fixture boundaries, not a claim to run Matplotlib's renderer.
"""
from pathlib import Path
import argparse
import ast
import copy
import hashlib
import json
import logging
import sys
import types
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon

ROOT = Path(__file__).resolve().parents[1]
TICKER_SHA = "49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad"
TRANSFORMS_SHA = "109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8"


def load(path):
    if sys.version_info[:3] != (3, 12, 14) or np.__version__ != "2.3.5":
        raise ValueError("fixed CPython 3.12.14 / NumPy 2.3.5 required")
    transforms = path.with_name("transforms.py")
    for source, checksum in [(path, TICKER_SHA), (transforms, TRANSFORMS_SHA)]:
        if hashlib.sha256(source.read_bytes()).hexdigest() != checksum:
            raise ValueError("pinned source differs: " + str(source))
    namespace = dict(np=np, _log=logging.getLogger("index-data-scale-reference"))
    body = ast.parse(transforms.read_text()).body
    bbox = next(node for node in body if isinstance(node, ast.ClassDef) and node.name == "Bbox")
    method = next(node for node in bbox.body if isinstance(node, ast.FunctionDef)
                  and node.name == "update_from_path")
    contains = next(node for node in body if isinstance(node, ast.FunctionDef)
                    and node.name == "_interval_contains_close")
    for node in [method, contains]:
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(transforms), "exec"), namespace)
    classes = {node.name: node for node in ast.parse(path.read_text()).body
               if isinstance(node, ast.ClassDef)}
    locator = copy.deepcopy(classes["Locator"])
    locator.bases = []
    locator.body = [node for node in locator.body if isinstance(node, ast.Assign)
                    or isinstance(node, ast.FunctionDef) and node.name == "raise_if_exceeds"]
    for node in [locator, classes["IndexLocator"]]:
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(path), "exec"), namespace)
    namespace["_log"].disabled = True
    return namespace


def generate(path):
    original = load(path)
    specs = [
        dict(label="x log retains negative x data", xs=[-2., 2., 4.], ys=[1., 1., 1.],
             horizontal=True, xlog=True, ylog=False, base=3., views=[(.5, 5.), (5., 2.5)]),
        dict(label="y log retains negative y data", xs=[1., 1., 1.], ys=[-2., 2., 4.],
             horizontal=False, xlog=False, ylog=True, base=3., views=[(.5, 5.), (5., 2.5)]),
        dict(label="negative y on another log axis retains x data", xs=[10., 20., 40.], ys=[-2., 2., 4.],
             horizontal=True, xlog=False, ylog=True, base=15., views=[(5., 45.), (45., 21.)]),
        dict(label="negative x on another log axis retains y data", xs=[-2., 2., 4.], ys=[10., 20., 40.],
             horizontal=False, xlog=True, ylog=False, base=15., views=[(5., 45.), (45., 21.)]),
    ]
    rows = []
    code = "// Generated from original Bbox.update_from_path and IndexLocator data calls.\n"
    for index, case in enumerate(specs):
        invalidations = [0]
        def invalidate():
            invalidations[0] += 1
        bbox = types.SimpleNamespace(_ignore=True,
                                     _points=np.array([[np.inf, np.inf], [-np.inf, -np.inf]]),
                                     _minpos=np.array([np.inf, np.inf]), invalidate=invalidate)
        vertices = np.array(list(zip(case["xs"], case["ys"])))
        original["update_from_path"](bbox, types.SimpleNamespace(vertices=vertices))
        coordinate = 0 if case["horizontal"] else 1
        bounds = tuple(float(v) for v in bbox._points[:, coordinate])
        locator = original["IndexLocator"](case["base"], 0.)
        data_reads = [0]
        def get_data_interval():
            data_reads[0] += 1
            return tuple(bbox._points[:, coordinate])
        locator.axis = types.SimpleNamespace(get_data_interval=get_data_interval)
        target_log = case["xlog"] if case["horizontal"] else case["ylog"]
        view_rows = []
        code += "\n///|\ntest " + moon("Index raw data scale " + str(index) + " " + case["label"]) + " {\n"
        code += "  let figure = @scene.figure(width=420, height=280)\n  let axes = figure.axes()\n"
        code += "  axes.plot(" + moon(case["xs"]) + ", " + moon(case["ys"]) + ")\n"
        if case["xlog"]:
            code += "  axes.set_x_scale(@scale.log_scale())\n"
        if case["ylog"]:
            code += "  axes.set_y_scale(@scale.log_scale())\n"
        other = "y" if case["horizontal"] else "x"
        other_log = case["ylog"] if case["horizontal"] else case["xlog"]
        code += "  axes.set_" + other + "_limits(" + ("0.5, 5.0" if other_log else "0.0, 2.0") + ")\n"
        axis = "x" if case["horizontal"] else "y"
        prefix = "raw-data-" + str(index) + "="
        code += "  let locator = @ticker.IndexLocator::new(base=" + moon(case["base"]) + ", offset=0.0)\n"
        code += "  axes.set_" + axis + "_locator(locator.as_locator())\n"
        code += "  axes.set_" + axis + "_formatter(@ticker.format_str_formatter(" + moon(prefix + "%.0f") + "))\n"
        code += "  let axis = axes." + axis + "_axis()\n"
        for view_index, view in enumerate(case["views"]):
            locator.axis.view_interval = view
            ticks = [float(v) for v in locator()]
            transform = np.log10 if target_log else lambda value: value
            transformed_view = [float(transform(v)) for v in view]
            visible = [value for value in ticks if (not target_log or value > 0.)
                       and original["_interval_contains_close"](transformed_view, float(transform(value)))]
            view_rows.append(dict(view_interval=view, original_data_call=ticks,
                                  transformed_display_view=transformed_view, visible_ticks=visible,
                                  data_reads=data_reads[0]))
            code += "  axes.set_" + axis + "_limits(" + moon(view[0]) + ", " + moon(view[1]) + ")\n"
            code += "  let data_" + str(view_index) + " = axis.data_interval()\n"
            code += "  assert_eq((data_" + str(view_index) + ".lower(), data_" + str(view_index) + ".upper()), (" + moon(bounds[0]) + ", " + moon(bounds[1]) + "))\n"
            code += "  assert_eq(locator.call(), " + moon(ticks) + ")\n"
            code += "  assert_eq(axis.tick_values_checked(@core.limits(" + moon(view[0]) + ", " + moon(view[1]) + ")), " + moon(ticks) + ")\n"
            code += "  let svg_" + str(view_index) + " = figure.to_svg_checked()\n"
            for tick in ticks:
                label = ">" + prefix + str(int(tick)) + "<"
                code += "  assert_true(" + ("" if tick in visible else "!") + "svg_" + str(view_index) + ".contains(" + moon(label) + "))\n"
            code += "  assert_true(!svg_" + str(view_index) + ".contains(\"NaN\"))\n"
            code += "  assert_true(!svg_" + str(view_index) + ".contains(\"Infinity\"))\n"
        code += "}\n"
        rows.append(dict(case=case, bbox_points=bbox._points.tolist(),
                         bbox_minimum_positive=bbox._minpos.tolist(), data_interval=bounds,
                         invalidations=invalidations[0], views=view_rows))
    payload = dict(ticker_source_sha256=TICKER_SHA, transforms_source_sha256=TRANSFORMS_SHA,
                   python=sys.version.split()[0], numpy=np.__version__,
                   executed_methods=["Bbox.update_from_path", "IndexLocator.__call__", "IndexLocator.tick_values",
                                      "Locator.raise_if_exceeds", "transforms._interval_contains_close"],
                   fixture_boundaries="SimpleNamespace supplies Bbox storage/invalidation, raw path vertices and axis data getter. The original Bbox method runs its own finite mask/min/max/minpos through NumPy, with no copied extent algorithm. Display identity/positive-domain log10 are explicit fixture transforms; this does not run Matplotlib's renderer or LogTransform.",
                   native_boundary="Bbox.update_from_path is the pinned pure-Python/NumPy body; no Matplotlib native path helper is substituted. IndexLocator executes the actual fixed NumPy arange native operation.",
                   cases=rows)
    return payload, formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", RuntimeWarning)
        payload, code = generate(args.ticker)
    outputs = {ROOT / "testdata/index_data_scale_reference.json": json.dumps(payload, indent=2, allow_nan=False) + "\n",
               ROOT / "scene/index_data_scale_test.mbt": code}
    for path, text in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(text)
    print("Index data scale reference:", len(payload["cases"]), "Bbox/data cases,",
          sum(len(row["views"]) for row in payload["cases"]), "data-call/display-view observations")


if __name__ == "__main__":
    main()
