"""Execute pinned numeric MultipleLocator, Edge and nonsingular source bodies.

The oracle never imports installed Matplotlib or copies its algorithms. Requests
above the eager fixture budget record the original arange count and only evaluate
an eight-element prefix; a budget event is never reported as a source exception.
"""
from pathlib import Path
import argparse
import ast
import copy
import hashlib
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
RC_SHA = "8b76e138ce9dc944a843dc6aa1ef9ee0e88638358b10baf227cd248d271b5f5a"
RCSETUP_SHA = "a052eac4af21ce8cdb58ee49c3ab952af4c2ff5e18f36cc8b741793fa79b5f59"
BUDGET = 100000
PREFIX = 8


class ReferenceBudget(Exception):
    def __init__(self, count):
        self.count = float(count)


class BoundedNumpy:
    """Delegate NumPy exactly, intercepting oversized finite arange requests."""
    prefix = False

    def arange(self, stop):
        if math.isfinite(stop) and stop > BUDGET:
            if self.prefix:
                return np.arange(PREFIX)
            raise ReferenceBudget(stop)
        return np.arange(stop)

    def __getattr__(self, name):
        return getattr(np, name)


def clean(value):
    if isinstance(value, float) and not math.isfinite(value):
        return repr(value)
    if isinstance(value, (tuple, list)):
        return [clean(v) for v in value]
    if isinstance(value, dict):
        return {key: clean(v) for key, v in value.items()}
    return value


def load(path):
    if sys.version_info[:3] != (3, 12, 14) or np.__version__ != "2.3.5":
        raise ValueError("fixed CPython 3.12.14 / NumPy 2.3.5 required")
    transforms = path.with_name("transforms.py")
    for source, sha in [(path, TICKER_SHA), (transforms, TRANSFORMS_SHA),
                        (path.parent / "mpl-data/matplotlibrc", RC_SHA),
                        (path.with_name("rcsetup.py"), RCSETUP_SHA)]:
        if hashlib.sha256(source.read_bytes()).hexdigest() != sha:
            raise ValueError("pinned source differs: " + str(source))
    proxy = BoundedNumpy()
    namespace = dict(np=proxy, math=math,
                     mpl=types.SimpleNamespace(rcParams={"axes.autolimit_mode": "data"}),
                     _log=logging.getLogger("multiple-reference"))
    body = ast.parse(transforms.read_text()).body
    nonsingular = next(node for node in body if isinstance(node, ast.FunctionDef)
                       and node.name == "_nonsingular")
    exec(compile(ast.Module(body=[nonsingular], type_ignores=[]), str(transforms), "exec"), namespace)
    namespace["mtransforms"] = types.SimpleNamespace(_nonsingular=namespace["_nonsingular"])
    classes = {node.name: node for node in ast.parse(path.read_text()).body
               if isinstance(node, ast.ClassDef)}
    locator = copy.deepcopy(classes["Locator"])
    locator.bases = []
    locator.body = [node for node in locator.body
                    if isinstance(node, ast.Assign) or
                    isinstance(node, ast.FunctionDef) and node.name in {"raise_if_exceeds", "nonsingular"}]
    for node in [locator, classes["_Edge_integer"], classes["MultipleLocator"]]:
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(path), "exec"), namespace)
    namespace["_log"].disabled = True
    return namespace


def checked_ticks(reference, locator, lower, upper):
    proxy = reference["np"]
    try:
        return dict(ticks=[float(v) for v in locator.tick_values(lower, upper)], source_error=None)
    except ReferenceBudget as exc:
        # The unmodified source body is evaluated with an arange prefix. This
        # observes the original output prefix without allocating the full array.
        proxy.prefix = True
        try:
            prefix = [float(v) for v in locator.tick_values(lower, upper)]
        finally:
            proxy.prefix = False
        return dict(enumeration_omitted=True, original_arange_count=exc.count,
                    prefix=prefix, port_eager_cap=BUDGET, source_error=None)
    except (ValueError, OverflowError, ZeroDivisionError, TypeError) as exc:
        return dict(ticks=None, source_error=type(exc).__name__)


def expect_ticks(expression, result, variable):
    if result.get("enumeration_omitted"):
        return ("  let " + variable + " = " + expression + "\n"
                "  assert_eq(" + variable + ".length(), 100000)\n"
                "  verify_multiple_reference_values(Array::makei(8, index => " + variable + "[index]), "
                + moon(result["prefix"]) + ")\n")
    if result["source_error"]:
        return ("  assert_true(try { ignore(" + expression + "); false } catch {\n"
                "    @core.DataError::InvalidTicks(..) => true\n"
                "    _ => false\n  })\n")
    return "  verify_multiple_reference_values(" + expression + ", " + moon(result["ticks"]) + ")\n"


def generate(path):
    reference = load(path)
    specs = []

    def add(label, base, offset, lower, upper):
        specs.append(dict(label=label, base=float(base), offset=float(offset),
                          lower=float(lower), upper=float(upper)))

    for base in [.1, .25, .5, 1., 2.5, 7., 10., 1e-9, 1e9]:
        for offset in [0., .1, -.35]:
            for lower, upper in [(-3 * base, 3 * base), (.4 * base, 2.6 * base),
                                 (2 * base, 2 * base), (-2 * base, -2 * base),
                                 (3 * base, -base)]:
                add("fraction / offset / direction", base, offset, lower + offset, upper + offset)
    for base in [.1, .3, 7., 1e-12]:
        for offset in [0., 1e6, -1e6]:
            point = offset + 3 * base
            for near in [math.nextafter(point, -math.inf), point, math.nextafter(point, math.inf)]:
                add("ULP near multiple", base, offset, near, offset + 5 * base)
    largest = sys.float_info.max
    for base, offset, lower, upper in [
            (5e-324, 0., 0., 0.), (1e-300, 0., 0., 0.),
            (1e300, 0., -1e300, 1e300), (1e308, 0., 0., 0.),
            (1e308, 0., -1e308, 1e308), (1e308, 1e308, 1e308, 1e308),
            (1e-300, 1e308, 1e308, 1e308), (1e-300, 0., 1e308, 1e308),
            (1., 1e308, -1e308, -1e308), (1e308, -1e308, 1e308, 1e308),
            (1e-290, 0., -1e-300, 1e-300), (1e-300, 0., -1e-299, 1e-299),
            (largest, 0., largest, largest),
            (1., 0., math.nextafter(1e16, -math.inf), math.nextafter(1e16, math.inf)),
            (1e16, 0., -5e-324, 5e-324),
            (1., -0., -0., -0.), (.1, 0., -0., 0.),
            (5e-324, 0., 0., 1e-318), (1., .25, 0., 200000.)]:
        add("extreme finite / duplicate / eager prefix", base, offset, lower, upper)
    for lower, upper in [(math.nan, 0.), (0., math.nan), (math.inf, 0.),
                         (-math.inf, 0.), (0., math.inf), (0., -math.inf),
                         (math.inf, -math.inf), (math.nan, math.inf)]:
        add("nonfinite bounds", .5, -.25, lower, upper)

    code = """// Generated from pinned MultipleLocator, _Edge_integer, Locator.nonsingular
// and transforms._nonsingular. Finite values and infinities compare by bits.

///|
fn verify_multiple_reference_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() {
      assert_true(actual[index].is_nan())
    } else {
      assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64())
    }
  }
}

///|
fn verify_multiple_reference_limits(actual : (Double, Double), expected : Array[Double]) -> Unit raise {
  verify_multiple_reference_values([actual.0, actual.1], expected)
}
"""
    rows = []
    for index, case in enumerate(specs):
        base, offset, lower, upper = [case[key] for key in ["base", "offset", "lower", "upper"]]
        locator = reference["MultipleLocator"](base=base, offset=offset)
        code += "\n///|\ntest " + moon("MultipleLocator original " + str(index) + " " + case["label"]) + " {\n"
        code += "  let previous_mode = @config.axes_autolimit_mode()\n  defer { try! @config.set_axes_autolimit_mode(previous_mode) }\n"
        code += "  let locator = @ticker.MultipleLocator::new(base=" + moon(base) + ", offset=" + moon(offset) + ")\n"
        code += "  assert_eq(locator.base(), " + moon(base) + ")\n  assert_eq(locator.offset(), " + moon(offset) + ")\n"
        calls = []
        for reverse in [False, True]:
            first, last = (upper, lower) if reverse else (lower, upper)
            result = checked_ticks(reference, locator, first, last)
            code += expect_ticks("locator.tick_values(" + moon(first) + ", " + moon(last) + ")", result,
                                 "reversed_values" if reverse else "values")
            calls.append(dict(reverse=reverse, **result))
        # Project adapter preserves incoming direction; the direct source object
        # always emits ascending ticks, including out-of-range neighbors.
        if not calls[0].get("enumeration_omitted"):
            result = calls[0]
            expected = [] if result["source_error"] else result["ticks"]
            if lower > upper:
                expected = expected[::-1]
            code += "  verify_multiple_reference_values(locator.as_locator().tick_values(" + moon(lower) + ", " + moon(upper) + "), " + moon(expected) + ")\n"
        limits_rows = []
        for mode in ["data", "round_numbers", "data"]:
            reference["mpl"].rcParams["axes.autolimit_mode"] = mode
            limits = [float(v) for v in locator.view_limits(lower, upper)]
            code += "  @config.set_axes_autolimit_mode(" + moon(mode) + ")\n"
            code += "  verify_multiple_reference_limits(locator.view_limits(" + moon(lower) + ", " + moon(upper) + "), " + moon(limits) + ")\n"
            limits_rows.append(dict(mode=mode, output=limits))
        nonsingular = [float(v) for v in locator.nonsingular(lower, upper)]
        code += "  verify_multiple_reference_limits(locator.nonsingular(" + moon(lower) + ", " + moon(upper) + "), " + moon(nonsingular) + ")\n}\n"
        rows.append(dict(case=case, direct=calls, view_limits=limits_rows, nonsingular=nonsingular))

    updates = [dict(base=.5), dict(offset=.25), {}, dict(base=7., offset=-3.),
               dict(base=0., offset=100.), dict(offset=None), dict(base=None),
               dict(base=-.1), dict(base=.1, offset=0.)]
    original = reference["MultipleLocator"](base=2.5, offset=.75)
    independent = copy.copy(original)
    update_rows = []
    code += "\n///|\ntest \"MultipleLocator original successful and failed parameter updates\" {\n"
    code += "  let locator = @ticker.MultipleLocator::new(base=2.5, offset=0.75)\n  let independent = locator.copy()\n  let live = locator.as_locator().copy()\n"
    for index, params in enumerate(updates):
        error = None
        try:
            original.set_params(**params)
        except ValueError as exc:
            error = type(exc).__name__
        arguments = ", ".join(key + "=" + moon(value) for key, value in params.items() if value is not None)
        expression = "locator.set_params(" + arguments + ")"
        if error:
            code += "  assert_true(try { " + expression + "; false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })\n"
        else:
            code += "  " + expression + "\n"
        code += "  assert_eq(locator.base(), " + moon(float(original._edge.step)) + ")\n"
        code += "  assert_eq(locator.offset(), " + moon(float(original._offset)) + ")\n"
        result = checked_ticks(reference, original, -1., 1.)
        code += expect_ticks("locator.tick_values(-1.0, 1.0)", result, "update_values_" + str(index))
        code += "  assert_eq(live.multiple_locator().unwrap().base(), locator.base())\n"
        code += "  assert_eq(live.multiple_locator().unwrap().offset(), locator.offset())\n"
        code += "  assert_eq(independent.base(), " + moon(float(independent._edge.step)) + ")\n"
        code += "  assert_eq(independent.offset(), " + moon(float(independent._offset)) + ")\n"
        update_rows.append(dict(parameters=params, source_error=error, base=float(original._edge.step),
                                offset=float(original._offset), ticks=result))
    code += "}\n"
    constructor_rows = []
    for value in [0., -1., -5e-324]:
        try:
            reference["MultipleLocator"](base=value)
            raise AssertionError("expected original base rejection")
        except ValueError as exc:
            constructor_rows.append(dict(base=value, source_error=type(exc).__name__))
        code += "\n///|\ntest " + moon("MultipleLocator original rejects nonpositive base " + repr(value)) + " {\n"
        code += "  assert_true(try { ignore(@ticker.MultipleLocator::new(base=" + moon(value) + ")); false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })\n}\n"
    payload = dict(ticker_source_sha256=TICKER_SHA, transforms_source_sha256=TRANSFORMS_SHA,
                   matplotlibrc_sha256=RC_SHA, rcsetup_sha256=RCSETUP_SHA,
                   python=sys.version.split()[0], numpy=np.__version__,
                   ast_source_bodies=["MultipleLocator", "_Edge_integer", "Locator.nonsingular",
                                      "Locator.raise_if_exceeds", "transforms._nonsingular"],
                   enumeration_budget=BUDGET, prefix_length=PREFIX,
                   port_contract="finite positive base and finite offset; eager prefix capped at 100000; adapter preserves input direction",
                   cases=rows, parameter_updates=update_rows, rejected_constructors=constructor_rows)
    return clean(payload), formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", RuntimeWarning)
        payload, code = generate(args.ticker)
    outputs = {ROOT / "testdata/multiple_locator_reference.json": json.dumps(payload, indent=2, allow_nan=False) + "\n",
               ROOT / "ticker/multiple_locator_reference_test.mbt": code}
    for path, text in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(text)
    observations = len(payload["cases"]) * 6 + len(payload["parameter_updates"]) + len(payload["rejected_constructors"])
    print("MultipleLocator reference:", len(payload["cases"]), "grids,", len(payload["parameter_updates"]),
          "updates,", len(payload["rejected_constructors"]), "constructor errors,", observations, "observations")


if __name__ == "__main__":
    main()
