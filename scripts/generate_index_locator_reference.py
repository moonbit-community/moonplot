"""Execute the pinned IndexLocator and inherited range methods against NumPy.

All expected ticks come from the original class calling the installed fixed
NumPy runtime. A separate allocation guard can omit an unsafe query, but never
labels that omission a source error. The 200000-element cap case is evaluated
in full (about 1.6 MB), then only its observed length and eight values are saved.
"""
from pathlib import Path
import argparse
import ast
import copy
import decimal
import hashlib
import json
import logging
import math
import platform
import sys
import types
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon

ROOT = Path(__file__).resolve().parents[1]
TICKER_SHA = "49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad"
TRANSFORMS_SHA = "109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8"
SAFE_ALLOCATION = 250000
PORT_CAP = 100000
PREFIX = 8


class AllocationBudget(Exception):
    pass


class BoundedNumpy:
    def arange(self, start, stop, step):
        # This estimate controls allocation only. It never supplies expected
        # counts/values or changes a source exception into an expected result.
        if step != 0.0:
            ratio = (stop - start) / step
            if math.isfinite(ratio) and SAFE_ALLOCATION < ratio < 2**60:
                raise AllocationBudget()
        return np.arange(start, stop, step)

    def __getattr__(self, name):
        return getattr(np, name)


def clean(value):
    if isinstance(value, float) and not math.isfinite(value):
        return repr(value)
    if isinstance(value, (list, tuple)):
        return [clean(v) for v in value]
    if isinstance(value, dict):
        return {key: clean(v) for key, v in value.items()}
    return value


def load(path):
    if sys.version_info[:3] != (3, 12, 14) or np.__version__ != "2.3.5":
        raise ValueError("fixed CPython 3.12.14 / NumPy 2.3.5 required")
    if sys.platform != "darwin" or platform.machine() != "arm64":
        raise ValueError("the fixed NumPy fill profile requires Darwin arm64")
    transforms = path.with_name("transforms.py")
    for source, checksum in [(path, TICKER_SHA), (transforms, TRANSFORMS_SHA)]:
        if hashlib.sha256(source.read_bytes()).hexdigest() != checksum:
            raise ValueError("pinned source differs: " + str(source))
    namespace = dict(np=BoundedNumpy(), math=math,
                     mpl=types.SimpleNamespace(rcParams={"axes.autolimit_mode": "data"}),
                     _log=logging.getLogger("index-reference"))
    nonsingular = next(node for node in ast.parse(transforms.read_text()).body
                       if isinstance(node, ast.FunctionDef) and node.name == "_nonsingular")
    exec(compile(ast.Module(body=[nonsingular], type_ignores=[]), str(transforms), "exec"), namespace)
    namespace["mtransforms"] = types.SimpleNamespace(_nonsingular=namespace["_nonsingular"])
    classes = {node.name: node for node in ast.parse(path.read_text()).body
               if isinstance(node, ast.ClassDef)}
    locator = copy.deepcopy(classes["Locator"])
    locator.bases = []
    locator.body = [node for node in locator.body
                    if isinstance(node, ast.Assign) or isinstance(node, ast.FunctionDef)
                    and node.name in {"raise_if_exceeds", "nonsingular", "view_limits"}]
    for node in [locator, classes["IndexLocator"]]:
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(path), "exec"), namespace)
    namespace["_log"].disabled = True
    return namespace


def observe(operation):
    try:
        values = operation()
        length = len(values)
        if length > PORT_CAP:
            return dict(source_length=length, prefix=[float(v) for v in values[:PREFIX]],
                        source_error=None, port_eager_cap=PORT_CAP)
        return dict(source_length=length, values=[float(v) for v in values], source_error=None)
    except AllocationBudget:
        return dict(source_query_omitted=True, reason="independent allocation budget",
                    source_error=None, safe_allocation_limit=SAFE_ALLOCATION)
    except (ValueError, OverflowError, ZeroDivisionError, TypeError, AttributeError) as error:
        return dict(source_error=type(error).__name__)


def expect(expression, result, name="values"):
    if result.get("source_query_omitted"):
        return "  // Source enumeration omitted by its independent allocation budget.\n"
    if result["source_error"]:
        return ("  assert_true(try { ignore(" + expression + "); false } catch {\n"
                "    @core.DataError::InvalidTicks(..) => true\n"
                "    _ => false\n  })\n")
    if "prefix" in result:
        return ("  let " + name + " = " + expression + "\n"
                "  assert_eq(" + name + ".length(), " + str(PORT_CAP) + ")\n"
                "  verify_index_reference_values(Array::makei(8, index => " + name
                + "[index]), " + moon(result["prefix"]) + ")\n")
    return "  verify_index_reference_values(" + expression + ", " + moon(result["values"]) + ")\n"


def generate(path):
    reference = load(path)
    cls = reference["IndexLocator"]
    specs = []

    def add(label, base, offset, lower, upper):
        specs.append(dict(label=label, base=float(base), offset=float(offset),
                          lower=float(lower), upper=float(upper)))

    for base in [.1, .3, .5, 1., 2.5, 7., -.1, -.3, -.5, -1., -2.5, -7.]:
        for offset in [0., .25, -.5]:
            for first, last in [(0., 3.), (.2, 3.2), (3., 0.), (0., 0.), (-3., -1.)]:
                add("fractional spacing / offset / direction", base, offset, first, last)
    for base in [0., -0., math.nan, math.inf, -math.inf]:
        for first, last in [(0., 3.), (3., 0.), (0., -1e-12)]:
            add("unchecked nonfinite or zero step", base, 0., first, last)
    for offset in [math.nan, math.inf, -math.inf]:
        add("unchecked nonfinite offset", 1., offset, 0., 4.)
    for first, last in [(math.nan, 0.), (0., math.nan), (math.inf, 0.),
                        (-math.inf, 0.), (0., math.inf), (0., -math.inf),
                        (math.inf, math.inf), (-math.inf, -math.inf)]:
        add("nonfinite bounds", 1., 0., first, last)
    for base in [.1, .5, 1., 2., -1.]:
        add("binary64 actual fill step", base, 0., 1e16, 1e16 + (4. if base > 0 else -4.))
    tiny = 5e-324
    for base, offset, first, last in [
            (1e308, 0., -tiny, -1e-12), (-1e308, 0., -tiny, -1e-12),
            (1e308, 0., tiny, -1e-12), (-1e308, 0., tiny, -1e-12),
            (tiny, 0., -tiny, -1e-12), (-tiny, 0., tiny, -1e-12),
            (1., -0., -0., 1.), (-1., -0., -0., -2.),
            (1., 0., 0., math.nextafter(1. - 1e-12, -math.inf)),
            (1., 0., 0., 1. - 1e-12),
            (1., 0., 0., math.nextafter(1. - 1e-12, math.inf)),
            (1e308, 0., -1e308, 1e308),
            (1e308, 0., 1e308, -1e308),
            (1., 0., 0., 1e20), (1., 0., 0., -1e20),
            (1., 0., 0., -9223372036854775808.),
            (1., 0., 0., 1152921504606846976.),
            (1., 0., 0., 200000.),
            (tiny, 0., 0., 0.),
            (1e-200, 0., 0., 1.),
            (1e-9, .25, 0., 1e6)]:
        add("underflow / epsilon / signed zero / overflow / explicit budget", base, offset, first, last)
    code = """// Generated by the original IndexLocator, inherited Locator methods and NumPy 2.3.5.
// Allocation omissions are not source exceptions; finite values compare by bits.

///|
fn verify_index_reference_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) } else {
      assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64())
    }
  }
}
"""
    rows = []
    for index, case in enumerate(specs):
        base, offset, lower, upper = [case[key] for key in ["base", "offset", "lower", "upper"]]
        locator = cls(base, offset)
        result = observe(lambda: locator.tick_values(lower, upper))
        nonsingular = [float(v) for v in locator.nonsingular(lower, upper)]
        limits = []
        code += "\n///|\ntest " + moon("IndexLocator original " + str(index) + " " + case["label"]) + " {\n"
        code += "  let locator = @ticker.IndexLocator::new(base=" + moon(base) + ", offset=" + moon(offset) + ")\n"
        code += "  verify_index_reference_values([locator.base(), locator.offset()], " + moon([base, offset]) + ")\n"
        code += expect("locator.tick_values(" + moon(lower) + ", " + moon(upper) + ")", result)
        for mode in ["data", "round_numbers"]:
            reference["mpl"].rcParams["axes.autolimit_mode"] = mode
            view = [float(v) for v in locator.view_limits(lower, upper)]
            limits.append(dict(mode=mode, output=view))
            # Inherited view_limits does not consult rc; the observed values
            # verify that fact without changing the application's global rc.
            code += "  let view_" + mode + " = locator.view_limits(" + moon(lower) + ", " + moon(upper) + ")\n"
            code += "  verify_index_reference_values([view_" + mode + ".0, view_" + mode + ".1], " + moon(view) + ")\n"
        code += "  let bounds = locator.nonsingular(" + moon(lower) + ", " + moon(upper) + ")\n"
        code += "  verify_index_reference_values([bounds.0, bounds.1], " + moon(nonsingular) + ")\n}\n"
        rows.append(dict(case=case, ticks=result, view_limits=limits, nonsingular=nonsingular))

    original = cls(2., .25)
    independent = copy.copy(original)
    updates = [dict(base=-1.), dict(offset=-.5), {}, dict(base=None, offset=None),
               dict(base=0., offset=100.), dict(base=math.nan), dict(base=math.inf, offset=0.),
               dict(base=1., offset=math.nan), dict(base=.5, offset=.25)]
    update_rows = []
    code += "\n///|\ntest \"IndexLocator original unchecked updates and independent parameters\" {\n"
    code += "  let locator = @ticker.IndexLocator::new(base=2.0, offset=0.25)\n  let independent = locator.copy()\n"
    for index, params in enumerate(updates):
        original.set_params(**params)
        args = ", ".join(key + "=" + moon(value) for key, value in params.items() if value is not None)
        result = observe(lambda: original.tick_values(-1., 3.))
        code += "  locator.set_params(" + args + ")\n"
        code += "  verify_index_reference_values([locator.base(), locator.offset()], " + moon([float(original._base), float(original.offset)]) + ")\n"
        code += expect("locator.tick_values(-1.0, 3.0)", result, "updated_" + str(index))
        code += "  verify_index_reference_values([independent.base(), independent.offset()], [2.0, 0.25])\n"
        update_rows.append(dict(parameters=params, base=float(original._base), offset=float(original.offset), ticks=result))
    code += "}\n"

    provider_rows = []
    provider_cases = [(1., 0., [(0., 4.), (2., 5.), (-2., 2.)]),
                      (.5, .25, [(1., 3.), (3., 1.), (0., 0.)]),
                      (-1., 0., [(4., 0.), (5., 2.), (0., 4.)])]
    for index, (base, offset, intervals) in enumerate(provider_cases):
        state = list(intervals[0])
        reads = [0]
        def data_interval():
            reads[0] += 1
            return tuple(state)
        locator = cls(base, offset)
        unbound = observe(locator)
        locator.axis = types.SimpleNamespace(get_data_interval=data_interval,
                                             get_view_interval=lambda: (100., 200.))
        independent = copy.copy(locator)
        code += "\n///|\ntest " + moon("IndexLocator original data provider " + str(index)) + " {\n"
        code += "  let locator = @ticker.IndexLocator::new(base=" + moon(base) + ", offset=" + moon(offset) + ")\n"
        code += expect("locator.call()", unbound)
        code += "  let state = " + moon(list(intervals[0])) + "\n  let reads = [0]\n"
        code += "  locator.bind_data_interval(() => { reads[0] += 1; (state[0], state[1]) })\n"
        code += "  let independent = locator.copy()\n"
        observations = []
        for point, interval in enumerate(intervals):
            state[:] = interval
            result = observe(locator)
            copied = observe(independent)
            code += "  state[0] = " + moon(interval[0]) + "\n  state[1] = " + moon(interval[1]) + "\n"
            code += expect("locator.call()", result, "provider_values_" + str(point))
            code += expect("independent.call()", copied, "copy_values_" + str(point))
            code += "  assert_eq(reads[0], " + str(reads[0]) + ")\n"
            observations.append(dict(data_interval=interval, call=result, copied_call=copied, provider_reads=reads[0]))
        code += "}\n"
        provider_rows.append(dict(base=base, offset=offset, unbound=unbound,
                                  unrelated_view_interval=[100., 200.], queries=observations))
    fill_observations = []
    with decimal.localcontext() as context:
        context.prec = 2000
        start, step = .2, .1
        actual_step = (start + step) - start
        values = np.arange(start, 3.2 + 1e-12, step)
        for index in [7, 14, 15]:
            observed = float(values[index])
            unfused = start + index * actual_step
            rounded_once = float(decimal.Decimal(start) + index * decimal.Decimal(actual_step))
            if observed != rounded_once or observed == unfused:
                raise ValueError("the fixed Darwin NumPy fused fill profile differs")
            fill_observations.append(dict(start=start, requested_step=step,
                                          actual_step=actual_step, index=index,
                                          original_numpy_fill=observed,
                                          ordinary_product_then_sum=unfused,
                                          exact_decimal_sum_rounded_once=rounded_once))
    binary = Path(np._core._multiarray_umath.__file__)
    payload = dict(ticker_source_sha256=TICKER_SHA, transforms_source_sha256=TRANSFORMS_SHA,
                   python=sys.version.split()[0], numpy=np.__version__,
                   ast_source_bodies=["IndexLocator", "Locator.nonsingular", "Locator.view_limits",
                                      "Locator.raise_if_exceeds", "transforms._nonsingular"],
                   safe_allocation_limit=SAFE_ALLOCATION, port_eager_cap=PORT_CAP,
                   prefix_length=PREFIX, cases=rows, parameter_updates=update_rows,
                   data_provider_cases=provider_rows,
                   numpy_fill_profile=dict(platform=sys.platform, machine=platform.machine(),
                                           binary_name=binary.name,
                                           binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),
                                           scope="fixed Darwin arm64 NumPy 2.3.5 binary, not a universal NumPy bit profile",
                                           independent_decimal_precision=2000,
                                           observations=fill_observations))
    return clean(payload), formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", RuntimeWarning)
        payload, code = generate(args.ticker)
    outputs = {ROOT / "testdata/index_locator_reference.json": json.dumps(payload, indent=2, allow_nan=False) + "\n",
               ROOT / "ticker/index_locator_reference_test.mbt": code}
    for path, text in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(text)
    cases = payload["cases"]
    omitted = sum(bool(row["ticks"].get("source_query_omitted")) for row in cases)
    observations = len(cases) * 4 + len(payload["parameter_updates"]) + sum(1 + 2*len(row["queries"]) for row in payload["data_provider_cases"]) + len(payload["numpy_fill_profile"]["observations"])
    print("IndexLocator reference:", len(cases), "grids,", len(payload["parameter_updates"]),
          "updates,", len(payload["data_provider_cases"]), "providers,", omitted,
          "enumerations omitted,", observations, "observation groups")


if __name__ == "__main__":
    main()
