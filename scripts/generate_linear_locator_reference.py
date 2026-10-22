"""Run original pinned LinearLocator and NumPy linspace, including alias state.

Oversized linspace requests are observed with the same original function body,
substituting sampled arange indices and suppressing only its terminal endpoint
write. This preserves the full sample divisor and avoids allocating giant arrays.
"""
from pathlib import Path
import argparse
import ast
import copy
import hashlib
import inspect
import json
import math
import sys
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_multiple_locator_reference import load as load_ticker, clean, TICKER_SHA, TRANSFORMS_SHA, RC_SHA, RCSETUP_SHA

ROOT = Path(__file__).resolve().parents[1]
FUNCTION_BASE_SHA = "413d696e597ff2b7ffdd9b06b4b42801e435392a82a9e006b4c4f33c013523fc"
BUDGET = 100000
SAMPLE_INDICES = [0, 1, 2, 3, 4, 5, 6, 7, 99998, 99999]


class ReferenceBudget(Exception):
    def __init__(self, count):
        self.count = count


class SourceNumpy:
    def linspace(self, start, stop, num):
        if num > BUDGET:
            raise ReferenceBudget(num)
        return np.linspace(start, stop, num)

    def __getattr__(self, name):
        return getattr(np, name)


class SampleArray(np.ndarray):
    """Ignore the source endpoint write, which targets the full array's last row."""
    def __setitem__(self, key, value):
        if isinstance(key, tuple) and key == (-1, Ellipsis):
            return
        return super().__setitem__(key, value)


class SampleNumpy:
    def arange(self, start, stop, dtype, **kwargs):
        if start != 0 or stop <= BUDGET:
            raise ValueError("unexpected linspace source arange call")
        return np.array(SAMPLE_INDICES, dtype=dtype).view(SampleArray)

    def __getattr__(self, name):
        return getattr(np, name)


def load(path):
    original = inspect.unwrap(np.linspace)
    source = Path(inspect.getfile(original))
    if hashlib.sha256(source.read_bytes()).hexdigest() != FUNCTION_BASE_SHA:
        raise ValueError("pinned NumPy linspace source differs: " + str(source))
    namespace = load_ticker(path)
    namespace["np"] = SourceNumpy()
    cls = next(node for node in ast.parse(path.read_text()).body
               if isinstance(node, ast.ClassDef) and node.name == "LinearLocator")
    exec(compile(ast.Module(body=[cls], type_ignores=[]), str(path), "exec"), namespace)
    fn = copy.deepcopy(next(node for node in ast.parse(source.read_text()).body
                            if isinstance(node, ast.FunctionDef) and node.name == "linspace"))
    fn.decorator_list = []
    prefix_namespace = dict(original.__globals__)
    prefix_namespace["_nx"] = SampleNumpy()
    exec(compile(ast.Module(body=[fn], type_ignores=[]), str(source), "exec"), prefix_namespace)
    namespace["prefix_linspace"] = prefix_namespace["linspace"]
    return namespace


def call(function):
    try:
        return function(), None
    except (ValueError, ZeroDivisionError, OverflowError, TypeError) as exc:
        return None, type(exc).__name__


def checked_ticks(reference, locator, lower, upper):
    try:
        result = locator.tick_values(lower, upper)
        return dict(values=[float(value) for value in result], source_error=None)
    except ReferenceBudget as exc:
        # Re-enter the original Locator body with the instrumented original
        # linspace body. Normalization and preset precedence remain original.
        original_proxy = reference["np"]
        class PrefixProxy(SourceNumpy):
            def linspace(self, first, last, count):
                return reference["prefix_linspace"](first, last, count)
        reference["np"] = PrefixProxy()
        try:
            values = [float(value) for value in locator.tick_values(lower, upper)]
        finally:
            reference["np"] = original_proxy
        return dict(enumeration_omitted=True, original_count=exc.count,
                    sample_indices=SAMPLE_INDICES, values=values,
                    port_eager_cap=BUDGET, source_error=None)
    except (ValueError, ZeroDivisionError, OverflowError, TypeError) as exc:
        return dict(values=None, source_error=type(exc).__name__)


def error_assert(expression):
    return ("  assert_true(try { ignore(" + expression + "); false } catch {\n"
            "    @core.DataError::InvalidTicks(..) => true\n"
            "    _ => false\n  })\n")


def ticks_assert(expression, result):
    if result["source_error"]:
        return error_assert(expression)
    if result.get("enumeration_omitted"):
        return ("  let values = " + expression + "\n  assert_eq(values.length(), 100000)\n"
                "  verify_linear_reference_values([" + ", ".join("values.get(" + str(index) + ")" for index in SAMPLE_INDICES)
                + "], " + moon(result["values"]) + ")\n")
    return "  verify_linear_reference_values((" + expression + ").to_array(), " + moon(result["values"]) + ")\n"


def sliced_view(values, start, stride, length):
    start = start + len(values) if start < 0 else start
    if stride == 0:
        return np.lib.stride_tricks.as_strided(
            values[start:], shape=(length,), strides=(0,), writeable=True)
    if length == 0:
        return values[start:start]
    stop = start + stride * length
    if stride < 0 and stop < 0:
        stop = None
    return values[start:stop:stride]


def strided_presets(reference):
    cases = [
        ("positive stride", [(1, 2, 5)]),
        ("negative stride", [(10, -2, 5)]),
        ("negative start", [(-1, -3, 4)]),
        ("empty view", [(2, 3, 0)]),
        ("composed reverse", [(1, 2, 5), (-1, -2, 3)]),
        ("composed forward", [(10, -2, 5), (1, 2, 2)]),
        ("writable zero stride", [(2, 0, 4)]),
    ]
    code = ""
    rows = []
    for label, slices in cases:
        owner = np.arange(12, dtype=np.float64)
        positions = np.arange(12)
        selected = owner
        for start, stride, length in slices:
            selected = sliced_view(selected, start, stride, length)
            positions = sliced_view(positions, start, stride, length)
        store = {(0., 1.): selected}
        locator = reference["LinearLocator"](-1, store)
        shallow = copy.copy(locator)
        old_view = locator.tick_values(0., 1.)
        assert old_view is selected
        if len(selected):
            assert np.shares_memory(old_view, owner)
        stages = [dict(stage="initial", owner=owner.tolist(), values=old_view.tolist())]
        if len(old_view):
            old_view[-1] += 100.
        stages.append(dict(stage="result writes original owner", owner=owner.tolist(),
                           values=shallow.tick_values(0., 1.).tolist()))
        owner_index = int(positions[0]) if len(positions) else 0
        owner[owner_index] -= 50.
        stages.append(dict(stage="owner writes borrowed result", owner_index=owner_index,
                           owner=owner.tolist(), values=old_view.tolist()))
        store[(0., 1.)] = np.array([77., 88.])
        shared_after_replace = shallow.tick_values(0., 1.).tolist()
        shallow.set_params(presets={(0., 1.): np.array([99.])})
        owner[-1] += .5
        stages.append(dict(stage="store replacement and shallow detachment",
                           owner=owner.tolist(), old_view=old_view.tolist(),
                           shared_after_replace=shared_after_replace,
                           original=locator.tick_values(0., 1.).tolist(),
                           copy=shallow.tick_values(0., 1.).tolist()))

        code += "\n///|\ntest " + moon("LinearLocator original strided preset " + label) + " {\n"
        code += "  let owner = " + moon([float(index) for index in range(12)]) + "\n"
        expression = "@ticker.TickValues::from_array(owner)"
        for start, stride, length in slices:
            expression += ".view(" + str(start) + ", " + str(stride) + ", " + str(length) + ")"
        code += "  let selected = " + expression + "\n"
        code += "  let presets = @ticker.LinearLocatorPresets::new()\n  presets.set_view(0.0, 1.0, selected)\n"
        code += "  let locator = @ticker.LinearLocator::new(numticks=-1, presets~)\n  let shallow = locator.copy()\n  let old_view = locator.tick_values(0.0, 1.0)\n"
        code += "  verify_linear_reference_values(old_view.to_array(), " + moon(stages[0]["values"]) + ")\n"
        if len(selected):
            code += "  old_view.set(-1, old_view.get(-1) + 100.0)\n"
        code += "  verify_linear_reference_values(owner, " + moon(stages[1]["owner"]) + ")\n"
        code += "  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), " + moon(stages[1]["values"]) + ")\n"
        code += "  owner[" + str(owner_index) + "] -= 50.0\n"
        code += "  verify_linear_reference_values(old_view.to_array(), " + moon(stages[2]["values"]) + ")\n"
        code += "  verify_linear_reference_values(presets.get(0.0, 1.0).unwrap().to_array(), " + moon(stages[2]["values"]) + ")\n"
        code += "  presets.set(0.0, 1.0, [77.0, 88.0])\n"
        code += "  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), " + moon(shared_after_replace) + ")\n"
        code += "  let replacement = @ticker.LinearLocatorPresets::new()\n  replacement.set(0.0, 1.0, [99.0])\n  shallow.set_params(presets=replacement)\n  owner[11] += 0.5\n"
        code += "  verify_linear_reference_values(owner, " + moon(stages[3]["owner"]) + ")\n"
        code += "  verify_linear_reference_values(old_view.to_array(), " + moon(stages[3]["old_view"]) + ")\n"
        code += "  verify_linear_reference_values(locator.tick_values(0.0, 1.0).to_array(), " + moon(stages[3]["original"]) + ")\n"
        code += "  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), " + moon(stages[3]["copy"]) + ")\n}\n"
        rows.append(dict(label=label, slices=slices, stages=stages))
    return rows, code


def generate(path):
    reference = load(path)
    largest = sys.float_info.max
    bounds = [(-1., 1.), (1., -1.), (0., 0.), (-0., -0.), (2., 2.), (-2., -2.),
              (.1, .9), (12., 12. + 1e-7), (1., math.nextafter(1., math.inf)),
              (1e-280, math.nextafter(1e-280, math.inf)), (5e-324, -5e-324),
              (1e-288, 2e-288), (largest, largest), (-largest, largest),
              (-largest, -largest), (1e100, math.nextafter(1e100, math.inf)),
              (math.nan, 0.), (0., math.inf), (-math.inf, math.inf), (math.nan, math.nan)]
    specs = [(count, lower, upper) for count in [None, -1, 0, 1, 2, 3, 7, 11, 17]
             for lower, upper in bounds]
    specs += [(-2147483648, -1., 1.), (100001, 0., 1.), (2147483647, 0., 1.),
              (2147483647, -largest, largest)]
    code = """// Generated original LinearLocator and NumPy linspace source observations.

///|
fn verify_linear_reference_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}

///|
fn verify_linear_reference_limits(actual : (Double, Double), expected : Array[Double]) -> Unit raise {
  verify_linear_reference_values([actual.0, actual.1], expected)
}
"""
    rows = []
    for index, (count, lower, upper) in enumerate(specs):
        locator = reference["LinearLocator"](numticks=count)
        label = "LinearLocator original " + str(index) + " count " + repr(count)
        code += "\n///|\ntest " + moon(label) + " {\n"
        code += "  let previous_mode = @config.axes_autolimit_mode()\n  defer { try! @config.set_axes_autolimit_mode(previous_mode) }\n"
        code += "  let locator = @ticker.LinearLocator::new(" + ("" if count is None else "numticks=" + str(count)) + ")\n"
        code += "  assert_eq(locator.numticks(), " + str(locator.numticks) + ")\n"
        code += "  assert_eq(locator.configured_numticks(), " + ("None" if count is None else "Some(" + str(count) + ")") + ")\n"
        result = checked_ticks(reference, locator, lower, upper)
        code += ticks_assert("locator.tick_values(" + moon(lower) + ", " + moon(upper) + ")", result)
        limits_rows = []
        for mode in ["data", "round_numbers", "data"]:
            reference["mpl"].rcParams["axes.autolimit_mode"] = mode
            value, error = call(lambda: [float(v) for v in locator.view_limits(lower, upper)])
            code += "  @config.set_axes_autolimit_mode(" + moon(mode) + ")\n"
            expression = "locator.view_limits(" + moon(lower) + ", " + moon(upper) + ")"
            code += error_assert(expression) if error else "  verify_linear_reference_limits(" + expression + ", " + moon(value) + ")\n"
            limits_rows.append(dict(mode=mode, values=value, source_error=error))
        nonsingular = [float(v) for v in locator.nonsingular(lower, upper)]
        code += "  verify_linear_reference_limits(locator.nonsingular(" + moon(lower) + ", " + moon(upper) + "), " + moon(nonsingular) + ")\n}\n"
        rows.append(dict(numticks=count, lower=lower, upper=upper, ticks=result,
                         view_limits=limits_rows, nonsingular=nonsingular))

    preset_rows = []
    for count in [None, -1, 0, 1]:
        for lower, upper in [(0., 0.), (2., 2.), (3., 1.), (math.nan, math.inf), (1., 2.)]:
            entries = [((-.05, .05), [3., 2., 1.]), ((1.9, 2.1), [8., 8., -1.]),
                       ((1., 3.), [math.inf, math.nan, -math.inf]), ((2., 1.), [99.])]
            presets = {key: np.array(values) for key, values in entries}
            locator = reference["LinearLocator"](count, presets)
            result = checked_ticks(reference, locator, lower, upper)
            code += "\n///|\ntest " + moon("LinearLocator preset precedence count " + repr(count) + " bounds " + repr((lower, upper))) + " {\n"
            code += "  let presets = @ticker.LinearLocatorPresets::new()\n"
            for key, values in entries:
                code += "  presets.set(" + moon(key[0]) + ", " + moon(key[1]) + ", " + moon(values) + ")\n"
            code += "  let locator = @ticker.LinearLocator::new(presets~" + ("" if count is None else ", numticks=" + str(count)) + ")\n"
            code += ticks_assert("locator.tick_values(" + moon(lower) + ", " + moon(upper) + ")", result) + "}\n"
            preset_rows.append(dict(numticks=count, lower=lower, upper=upper, result=result))

    # Observe identity through mutation, the public language-independent effect.
    array = np.array([3., 2., 1.]); key = (-.05, .05); store = {key: array}
    original = reference["LinearLocator"](-1, store); shallow = copy.copy(original)
    old_view = original.tick_values(0., 0.); old_view[1] = 9.; array[0] = 10.
    alias_rows = [dict(stage="borrowed result and caller array mutations", original=original.tick_values(0., 0.).tolist(), copy=shallow.tick_values(0., 0.).tolist())]
    store[key] = np.array([77.]); old_snapshot = old_view.tolist()
    alias_rows.append(dict(stage="replace shared key preserves older result buffer", original=original.tick_values(0., 0.).tolist(), copy=shallow.tick_values(0., 0.).tolist(), old_view=old_snapshot))
    shallow.set_params(presets={key: np.array([88.])}); store[key] = np.array([99.])
    alias_rows.append(dict(stage="copy store replacement detaches", original=original.tick_values(0., 0.).tolist(), copy=shallow.tick_values(0., 0.).tolist()))
    code += """
///|
test "LinearLocator original preset dictionary result and shallow copy aliases" {
  let values = [3.0, 2.0, 1.0]
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, values)
  let locator = @ticker.LinearLocator::new(numticks=-1, presets~)
  let shallow = locator.copy()
  let old_view = locator.tick_values(0.0, 0.0)
  old_view.set(1, 9.0)
  values[0] = 10.0
"""
    for name in ["locator", "shallow"]:
        code += "  verify_linear_reference_values(" + name + ".tick_values(0.0, 0.0).to_array(), " + moon(alias_rows[0]["original"]) + ")\n"
    code += "  presets.set(-0.05, 0.05, [77.0])\n"
    for name in ["locator", "shallow"]:
        code += "  verify_linear_reference_values(" + name + ".tick_values(0.0, 0.0).to_array(), " + moon(alias_rows[1]["original"]) + ")\n"
    code += "  verify_linear_reference_values(old_view.to_array(), " + moon(old_snapshot) + ")\n"
    code += "  let replacement = @ticker.LinearLocatorPresets::new()\n  replacement.set(-0.05, 0.05, [88.0])\n  shallow.set_params(presets=replacement)\n  presets.set(-0.05, 0.05, [99.0])\n"
    code += "  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), " + moon(alias_rows[2]["original"]) + ")\n"
    code += "  verify_linear_reference_values(shallow.tick_values(0.0, 0.0).to_array(), " + moon(alias_rows[2]["copy"]) + ")\n}\n"

    updates = [dict(numticks=0), {}, dict(numticks=1), dict(numticks=None), dict(numticks=-1), dict(numticks=3)]
    original = reference["LinearLocator"](); update_rows = []
    code += "\n///|\ntest \"LinearLocator original count updates None omission and property reset\" {\n  let locator = @ticker.LinearLocator::new()\n"
    for params in updates:
        original.set_params(**params)
        result = checked_ticks(reference, original, -.5, .5)
        arguments = ", ".join(key + "=" + str(value) for key, value in params.items() if value is not None)
        code += "  locator.set_params(" + arguments + ")\n  assert_eq(locator.numticks(), " + str(original.numticks) + ")\n"
        code += ticks_assert("locator.tick_values(-0.5, 0.5)", result)
        update_rows.append(dict(parameters=params, raw_numticks=original._numticks, effective_numticks=original.numticks, ticks=result))
    original.numticks = None
    code += "  locator.set_numticks(None)\n  assert_eq(locator.numticks(), " + str(original.numticks) + ")\n  assert_eq(locator.configured_numticks(), None)\n}\n"
    strided_rows, strided_code = strided_presets(reference)
    code += strided_code
    payload = dict(ticker_source_sha256=TICKER_SHA, transforms_source_sha256=TRANSFORMS_SHA,
                   matplotlibrc_sha256=RC_SHA, rcsetup_sha256=RCSETUP_SHA,
                   numpy_function_base_sha256=FUNCTION_BASE_SHA, python=sys.version.split()[0], numpy=np.__version__,
                   ast_source_bodies=["LinearLocator", "Locator.nonsingular", "transforms._nonsingular", "numpy.linspace"],
                   count_domain="Int32 or None; negative counts retain delayed source error",
                   enumeration_budget=BUDGET, prefix_sample_indices=SAMPLE_INDICES,
                   cases=rows, preset_cases=preset_rows, alias_steps=alias_rows,
                   parameter_updates=update_rows, strided_presets=strided_rows)
    return clean(payload), formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", RuntimeWarning)
        payload, code = generate(args.ticker)
    for path, text in {ROOT / "testdata/linear_locator_reference.json": json.dumps(payload, indent=2, allow_nan=False) + "\n",
                       ROOT / "ticker/linear_locator_reference_test.mbt": code}.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(text)
    strided_observations = sum(len(case["stages"]) for case in payload["strided_presets"])
    observations = len(payload["cases"]) * 5 + len(payload["preset_cases"]) + len(payload["alias_steps"]) + len(payload["parameter_updates"]) + strided_observations
    print("LinearLocator reference:", len(payload["cases"]), "ranges,", len(payload["preset_cases"]),
          "presets,", len(payload["alias_steps"]), "alias stages,", len(payload["parameter_updates"]),
          "updates,", len(payload["strided_presets"]), "strided presets,", observations, "observations")


if __name__ == "__main__":
    main()
