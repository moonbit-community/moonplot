"""Execute fixed Matplotlib FixedLocator/shape/nonsingular AST source bodies.

NumPy results, stride mutation and shallow-copy aliasing are observed directly;
the oracle does not reimplement the source subsampling algorithm.
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
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon

ROOT = Path(__file__).resolve().parents[1]
TICKER_SHA = "49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad"
TRANSFORMS_SHA = "109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8"
API_SHA = "7e262cedd8ce1a1660c2e2caa63adeb078c29e36bd541b8e6f773cfed4c3c782"


def clean(value):
    if isinstance(value, float) and not math.isfinite(value):
        return repr(value)
    if isinstance(value, (tuple, list)):
        return [clean(v) for v in value]
    if isinstance(value, dict):
        return {k: clean(v) for k, v in value.items()}
    return value


def load(path):
    if sys.version_info[:3] != (3, 12, 14) or np.__version__ != "2.3.5":
        raise ValueError("fixed CPython 3.12.14 / NumPy 2.3.5 required")
    transforms = path.with_name("transforms.py")
    api = path.parent / "_api/__init__.py"
    for source, sha in [(path, TICKER_SHA), (transforms, TRANSFORMS_SHA), (api, API_SHA)]:
        if hashlib.sha256(source.read_bytes()).hexdigest() != sha:
            raise ValueError("pinned source differs: " + str(source))
    namespace = dict(np=np, itertools=itertools, _log=logging.getLogger("fixed-reference"))
    for source, name in [(api, "check_shape"), (transforms, "_nonsingular")]:
        node = next(node for node in ast.parse(source.read_text()).body
                    if isinstance(node, ast.FunctionDef) and node.name == name)
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(source), "exec"), namespace)
    namespace["_api"] = types.SimpleNamespace(check_shape=namespace["check_shape"])
    namespace["mtransforms"] = types.SimpleNamespace(_nonsingular=namespace["_nonsingular"])
    classes = {node.name: node for node in ast.parse(path.read_text()).body if isinstance(node, ast.ClassDef)}
    locator = copy.deepcopy(classes["Locator"])
    locator.bases = []
    locator.body = [node for node in locator.body if isinstance(node, ast.Assign) or
                    isinstance(node, ast.FunctionDef) and node.name in {"raise_if_exceeds", "nonsingular", "view_limits"}]
    for node in [locator, classes["FixedLocator"]]:
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(path), "exec"), namespace)
    namespace["_log"].disabled = True
    return namespace["FixedLocator"]


def observe(call):
    try:
        values = call()
        return dict(values=[float(value) for value in values], source_error=None)
    except (ValueError, OverflowError, ZeroDivisionError, TypeError) as exc:
        return dict(values=None, source_error=type(exc).__name__)


def expect(expression, result):
    if result["source_error"]:
        return "  assert_true(try { ignore(" + expression + "); false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })\n"
    return "  verify_fixed_reference_values((" + expression + ").to_array(), " + moon(result["values"]) + ")\n"


def nbins_assert(value):
    return "  verify_fixed_reference_nbins(locator.nbins(), " + ("None" if value is None else "Some(" + moon(float(value)) + ")") + ")\n"


def generate(path):
    fixed = load(path)
    arrays = [[], [0.], [2.], [-0.], [3., -1., 0., 1., -3.],
              [4., 1., 0., -1., -4.], [1., -1., 1., -1., 2., -2.],
              [4., 3., 2., 1., 0., -1., -2., -3.],
              [math.nan, 0., -1., 1.], [4., 0., math.nan, 1., -1., 3.],
              [math.inf, -math.inf, 0., -0., math.nan, 2.],
              [5e-324, -5e-324, 0., 1e308, -1e308, 0.]]
    bins = [None, -math.inf, -5., -0.5, -0., 0., 5e-324, .1, .5, 1., 1.5,
            2., 2.5, 3., 4., 10., 1e308, math.inf, math.nan]
    bounds = [(0., 1.), (100., -100.), (math.nan, math.inf)]
    code = """// Generated from fixed original FixedLocator, Locator and _api.check_shape bodies.

///|
fn verify_fixed_reference_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}

///|
fn verify_fixed_reference_nbins(actual : Double?, expected : Double?) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(actual), Some(expected)) => verify_fixed_reference_values([actual], [expected])
    _ => fail("FixedLocator nbins differs")
  }
}
"""
    rows = []
    for values in arrays:
        for nbins in bins:
            for stage in ["constructor", "set_params"]:
                original = fixed(np.array(values, dtype=float), nbins=nbins if stage == "constructor" else None)
                if stage == "set_params":
                    original.set_params(nbins=nbins)
                code += "\n///|\ntest " + moon("FixedLocator original " + str(len(rows)) + " " + stage) + " {\n"
                arguments = "" if nbins is None else ", nbins=" + moon(nbins)
                code += "  let locator = @ticker.FixedLocator::new(" + moon(values) + (arguments if stage == "constructor" else "") + ")\n"
                if stage == "set_params":
                    code += "  locator.set_params(" + ("" if nbins is None else "nbins=" + moon(nbins)) + ")\n"
                code += nbins_assert(original.nbins)
                calls = []
                for lower, upper in bounds:
                    observed = observe(lambda: original.tick_values(lower, upper))
                    calls.append(dict(lower=lower, upper=upper, **observed))
                    code += expect("locator.tick_values(" + moon(lower) + ", " + moon(upper) + ")", observed)
                called = observe(original)
                code += expect("locator.values()", called)
                code += "}\n"
                rows.append(dict(locations=values, nbins=nbins, stage=stage, stored_nbins=original.nbins,
                                 calls=calls, call=called))

    alias_rows = []
    for kind in ["list", "ndarray", "ndarray_view", "ndarray_reverse_view", "ndarray_nested_view", "ndarray_zero_view"]:
        for nbins in [None, 2., 3., math.inf]:
            owner = np.array([9., 4., 7., 1., 6., 0., 5., -1., 3., -4.])
            owner_before = [float(v) for v in owner]
            if kind == "list":
                supplied = list(owner[1::2])
            elif kind == "ndarray":
                supplied = owner[1::2].copy()
            elif kind == "ndarray_reverse_view":
                supplied = owner[-1::-2]
            elif kind == "ndarray_nested_view":
                supplied = owner[1::2][::-1]
            elif kind == "ndarray_zero_view":
                supplied = np.lib.stride_tricks.as_strided(owner[1:2], shape=(5,), strides=(0,), writeable=True)
            else:
                supplied = owner[1::2]
            original = fixed(supplied, nbins=nbins)
            shallow = copy.copy(original)
            before = [float(v) for v in original.locs]
            ticks = original.tick_values(math.nan, math.inf)
            result_before = [float(v) for v in ticks]
            ticks[0] = 42.25
            after_write = [float(v) for v in original.locs]
            owner_after_tick = [float(v) for v in owner]
            shallow.locs[-1] = -99.5
            after_copy_write = [float(v) for v in original.locs]
            owner_after_shallow = [float(v) for v in owner]
            shallow.set_params(nbins=1.)
            supplied[0] = 88.5
            after_input_write = [float(v) for v in original.locs]
            owner_after_input = [float(v) for v in owner]
            code += "\n///|\ntest " + moon("FixedLocator original shared result " + kind + " nbins " + str(nbins)) + " {\n"
            code += "  let owner = " + moon(owner_before) + "\n"
            if kind == "ndarray_view":
                code += "  let supplied = @ticker.TickValues::from_array(owner).view(1, 2, 5)\n"
            elif kind == "ndarray_reverse_view":
                code += "  let supplied = @ticker.TickValues::from_array(owner).view(-1, -2, 5)\n"
            elif kind == "ndarray_nested_view":
                code += "  let supplied = @ticker.TickValues::from_array(owner).view(1, 2, 5).view(-1, -1, 5)\n"
            elif kind == "ndarray_zero_view":
                code += "  let supplied = @ticker.TickValues::from_array(owner).view(1, 0, 5)\n"
            else:
                code += "  let supplied = " + moon(before) + "\n"
            is_view = kind.endswith("_view")
            method = "from_view" if is_view else "from_list" if kind == "list" else "new"
            code += "  let locator = @ticker.FixedLocator::" + method + "(supplied" + ("" if nbins is None else ", nbins=" + moon(nbins)) + ")\n"
            code += "  let shallow = locator.copy()\n  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)\n"
            code += "  verify_fixed_reference_values(ticks.to_array(), " + moon(result_before) + ")\n"
            code += "  ticks.set(0, 42.25)\n  verify_fixed_reference_values(locator.locations().to_array(), " + moon(after_write) + ")\n"
            code += "  verify_fixed_reference_values(owner, " + moon(owner_after_tick) + ")\n"
            code += "  shallow.locations().set(-1, -99.5)\n  verify_fixed_reference_values(locator.locations().to_array(), " + moon(after_copy_write) + ")\n"
            code += "  verify_fixed_reference_values(owner, " + moon(owner_after_shallow) + ")\n"
            code += "  shallow.set_params(nbins=1.0)\n" + nbins_assert(original.nbins)
            code += "  " + ("supplied.set(0, 88.5)" if is_view else "supplied[0] = 88.5") + "\n"
            code += "  verify_fixed_reference_values(locator.locations().to_array(), " + moon(after_input_write) + ")\n"
            code += "  verify_fixed_reference_values(owner, " + moon(owner_after_input) + ")\n}\n"
            alias_rows.append(dict(kind=kind, nbins=nbins, locations_before=before, ticks_before=result_before,
                                   after_tick_write=after_write, after_shallow_write=after_copy_write,
                                   after_input_write=after_input_write, original_nbins=original.nbins,
                                   shallow_nbins=shallow.nbins, numpy_shares_memory=bool(np.shares_memory(ticks, original.locs)),
                                   owner_before=owner_before, owner_after_tick=owner_after_tick,
                                   owner_after_shallow=owner_after_shallow, owner_after=owner_after_input))

    range_rows = []
    original = fixed([])
    range_bounds = [(0., 0.), (1., 1.), (-2., -2.), (3., -1.), (5e-324, -5e-324),
                    (1e308, 1e308), (-1e308, 1e308), (math.nan, math.inf), (-math.inf, math.inf)]
    code += '\n///|\ntest "FixedLocator original inherited ranges" {\n  let locator = @ticker.FixedLocator::new([])\n'
    for lower, upper in range_bounds:
        row = dict(lower=lower, upper=upper)
        for method in ["nonsingular", "view_limits"]:
            result = [float(v) for v in getattr(original, method)(lower, upper)]
            row[method] = result
            expression = "locator." + method + "(" + moon(lower) + ", " + moon(upper) + ")"
            code += "  let pair = " + expression + "\n  verify_fixed_reference_values([pair.0, pair.1], " + moon(result) + ")\n"
        range_rows.append(row)
    code += "}\n"
    shape_rows = []
    for values in [3., [[1., 2.]], [[1.], [2.]], np.empty((0, 2))]:
        try:
            fixed(values)
            raise AssertionError("source should reject nonflat shape")
        except ValueError as exc:
            shape_rows.append(dict(shape=list(np.asarray(values).shape), source_error=type(exc).__name__, message=str(exc)))
    payload = dict(ticker_source_sha256=TICKER_SHA, transforms_source_sha256=TRANSFORMS_SHA,
                   api_source_sha256=API_SHA, python=sys.version.split()[0], numpy=np.__version__,
                   ast_source_bodies=["FixedLocator", "Locator.raise_if_exceeds", "Locator.nonsingular", "Locator.view_limits",
                                      "transforms._nonsingular", "_api.check_shape"],
                   port_contract="Array borrows a contiguous buffer; from_view borrows a signed strided view of its real owner; from_list copies; results and shallow copies alias the same owner; direct ignores bounds",
                   cases=rows, alias_cases=alias_rows, inherited_ranges=range_rows, rejected_shapes=shape_rows)
    return clean(payload), formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", RuntimeWarning)
        payload, code = generate(args.ticker)
    outputs = {ROOT / "testdata/fixed_locator_reference.json": json.dumps(payload, indent=2, allow_nan=False) + "\n",
               ROOT / "ticker/fixed_locator_reference_test.mbt": code}
    for path, text in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(text)
    print("FixedLocator reference:", len(payload["cases"]), "parameter/location cases,",
          len(payload["alias_cases"]), "alias cases,", len(payload["inherited_ranges"]), "ranges,",
          len(payload["rejected_shapes"]), "typed-outside shape errors")


if __name__ == "__main__":
    main()
