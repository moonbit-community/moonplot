"""Observe complete pinned AutoMinorLocator calls and their NumPy intermediates.

The original class AST executes unchanged. A Python frame trace observes its
locals; NumPy unique/arange are delegated, not reimplemented as an oracle.
Only unsafe enumeration is omitted independently, never called a source error.
"""
from pathlib import Path
import argparse
import ast
import hashlib
import json
import math
import platform
import sys
import types
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_maxn_params_reference import load
from generate_multiple_locator_reference import TICKER_SHA, TRANSFORMS_SHA, clean

ROOT = Path(__file__).resolve().parents[1]
SAFE_ALLOCATION = 250000
PORT_CAP = 100000
HIGHWAY_SHA = "37c08e5528f63ead9c7e4fd99ba454c1b1a3e3f7"


class EnumerationBudget(Exception):
    pass


class BoundedNumpy:
    def __init__(self):
        self.requests = []

    def arange(self, start, stop):
        request = dict(start=str(start), stop=str(stop), argument_type="Python int")
        self.requests.append(request)
        # This is an allocation guard only. Large enough semantic-size errors
        # are safe to delegate: NumPy rejects them before allocation.
        estimate = stop - start
        if SAFE_ALLOCATION < estimate < 2**60 - 64:
            request.update(enumeration_omitted=True, allocation_guard_difference=str(estimate))
            raise EnumerationBudget()
        values = np.arange(start, stop)
        request.update(dtype=str(values.dtype), observed_length=len(values))
        return values

    def __getattr__(self, name):
        return getattr(np, name)


def divisions(value):
    if isinstance(value, dict):
        return "@config.MinorTickDivisions::Integer(@bigint.BigInt::from_string(" + moon(value["integer"]) + "))"
    if isinstance(value, str):
        return "@config.MinorTickDivisions::Text(" + moon(value) + ")"
    return "@config.MinorTickDivisions::Number(" + moon(float(value)) + ")"


def input_expression(case):
    if case["dtype"] == "int64":
        values = "[" + ", ".join(str(value) + "L" for value in case["major"]) + "]"
        result = "TickValues::from_int64_array(" + values + ")"
    else:
        result = "TickValues::from_array(" + moon(case["major"]) + ")"
    for start, stride, length in case.get("views", []):
        result += ".view(" + str(start) + ", " + str(stride) + ", " + str(length) + ")"
    return result


def observe(reference, cls, proxy, case):
    owner = np.array(case["major"], dtype=case["dtype"])
    major = owner
    for start, stride, length in case.get("views", []):
        start = start + len(major) if start < 0 else start
        major = np.lib.stride_tricks.as_strided(major[start:], shape=(length,),
                                               strides=(stride * major.strides[0],))
    unique = np.unique(major)
    value = case["ndivs"]
    value = int(value["integer"]) if isinstance(value, dict) else value
    locator = cls(value)
    locator.axis = types.SimpleNamespace(axis_name="x", get_scale=lambda: "linear",
                                        get_majorticklocs=lambda: major,
                                        get_view_interval=lambda: tuple(case["view"]))
    locals_seen = {}
    target = cls.__call__.__code__

    def trace(frame, event, argument):
        if frame.f_code is target:
            if event in ["line", "exception", "return"]:
                locals_seen.update(frame.f_locals)
            return trace
        return None

    first_request = len(proxy.requests)
    sys.settrace(trace)
    try:
        actual = locator()
        size = len(actual)
        result = dict(source_error=None, observed_length=size)
        if size > PORT_CAP:
            result.update(prefix=[float(x) for x in actual[:8]],
                          capped_prefix_last=[float(x) for x in actual[PORT_CAP-4:PORT_CAP]],
                          full_last=[float(x) for x in actual[-4:]])
        else:
            result["values"] = [float(x) for x in actual]
    except EnumerationBudget:
        result = dict(query_omitted=True, source_error=None,
                      reason="independent enumeration budget; no source output or error inferred")
    except (ValueError, OverflowError, TypeError, IndexError) as error:
        result = dict(source_error=type(error).__name__, source_message=str(error))
    finally:
        sys.settrace(None)
    result["arange_requests"] = proxy.requests[first_request:]
    result["unique"] = [int(x) for x in unique] if unique.dtype == np.int64 else [float(x) for x in unique]
    result["unique_dtype"] = str(unique.dtype)
    if "minorstep" in locals_seen:
        result["minorstep"] = float(locals_seen["minorstep"])
    if "majorstep" in locals_seen:
        step = locals_seen["majorstep"]
        result["majorstep"] = int(step) if isinstance(step, np.integer) else float(step)
    for name in ["tmin", "tmax"]:
        if name in locals_seen:
            result[name] = str(locals_seen[name])
    result["owner_after"] = owner.tolist()
    if case.get("probe_zero_representative"):
        bits = set()
        for _ in range(1000):
            values = np.unique(major)
            bits.add(int(values[values == 0][0].view(np.uint64)))
        result["zero_representative_probe"] = dict(repetitions=1000, allowed_observed_bits=sorted(bits),
            source="VQSort random pivot state; only genuinely variable signed-zero representatives permit a bitset")
        if len(bits) > 1:
            result["unique"] = [0.0 if x == 0 else x for x in result["unique"]]
            result["zero_representative_probe"]["serialization"] = (
                "unique stores the +0 member of the observed bitset for reproducibility; the bitset is the expected source observation")
    return result


def error_assert(expression):
    return ("  assert_true(try { ignore(" + expression + "); false } catch {\n"
            "    @core.DataError::InvalidTicks(..) => true\n    _ => false\n  })\n")


def test_code(case, result, index):
    code = "\n///|\ntest " + moon("AutoMinor original grid " + str(index) + " " + case["label"]) + " {\n"
    code += "  let major = " + input_expression(case) + "\n  let unique = auto_minor_unique(major)\n"
    if case["dtype"] == "int64":
        code += "  assert_true(unique.is_int64())\n  assert_eq(unique.length(), " + str(len(result["unique"])) + ")\n"
        for place, value in enumerate(result["unique"]):
            code += "  assert_eq(unique.get_int64(" + str(place) + "), " + str(value) + "L)\n"
    else:
        allowed = result.get("zero_representative_probe", {}).get("allowed_observed_bits", [])
        code += "  assert_true(!unique.is_int64())\n"
        if len(allowed) > 1:
            code += "  verify_auto_minor_unique_zero_set(unique.to_array(), " + moon(result["unique"]) + ")\n"
        else:
            code += "  verify_auto_minor_grid_bits(unique.to_array(), " + moon(result["unique"]) + ")\n"
    # Unique is a copy, including when the source input is a strided view.
    original = [float(x) for x in case["major"]]
    code += "  verify_auto_minor_grid_bits(major.to_array(), "
    if case.get("views"):
        owner = np.array(original)
        for start, stride, length in case["views"]:
            start = start + len(owner) if start < 0 else start
            owner = np.lib.stride_tricks.as_strided(owner[start:], shape=(length,), strides=(stride*owner.strides[0],))
        original = owner.tolist()
    code += moon(original) + ")\n"
    if len(result["unique"]) < 2:
        return code + "}\n"
    call = "auto_minor_step(unique, " + divisions(case["ndivs"]) + ")"
    if "minorstep" not in result:
        return code + error_assert(call) + "}\n"
    code += "  let step = " + call + "\n  verify_auto_minor_grid_bits([step], " + moon([result["minorstep"]]) + ")\n"
    expression = "auto_minor_grid(unique, step, " + moon(case["view"][0]) + ", " + moon(case["view"][1]) + ")"
    if result.get("query_omitted"):
        code += "  // Complete original enumeration independently omitted; no expected ticks invented.\n"
    elif result["source_error"]:
        code += error_assert(expression)
    elif "prefix" in result:
        code += "  let ticks = " + expression + "\n  assert_eq(ticks.length(), 100000)\n"
        code += "  verify_auto_minor_grid_bits(Array::makei(8, index => ticks[index]), " + moon(result["prefix"]) + ")\n"
        code += "  verify_auto_minor_grid_bits(Array::makei(4, index => ticks[99996 + index]), " + moon(result["capped_prefix_last"]) + ")\n"
    else:
        code += "  verify_auto_minor_grid_bits(" + expression + ", " + moon(result["values"]) + ")\n"
    return code + "}\n"


def generate(path):
    if sys.platform != "darwin" or platform.machine() != "arm64":
        raise ValueError("fixed Darwin arm64 NumPy numerical profile required")
    reference = load(path)
    proxy = BoundedNumpy()
    reference["np"] = proxy
    reference["_api"].warn_external = lambda message: None
    node = next(node for node in ast.parse(path.read_text()).body
                if isinstance(node, ast.ClassDef) and node.name == "AutoMinorLocator")
    exec(compile(ast.Module(body=[node], type_ignores=[]), str(path), "exec"), reference)
    cls = reference["AutoMinorLocator"]
    specs = []

    def add(label, major, ndivs="auto", view=None, dtype="float64", **extras):
        if dtype == "float64":
            major = [float(x) for x in major]
        specs.append(dict(label=label, major=major, dtype=dtype, ndivs=ndivs,
                          view=[0., 1.] if view is None else [float(x) for x in view], **extras))

    for step in [1., 2., 2.5, 3., 5., 10., .1, .25, .3, 1e-6, 1e6]:
        for view in [(0., step), (.17*step, 2.1*step), (2.1*step, .17*step), (-1.1*step, .1*step)]:
            add("global first step and sorted view", [step*3, 0., step, step, step*3], view=view)
    for value in [0., -0., -1., -2.5, .5, 2., 2.5, 4., math.nan, math.inf, -math.inf,
                  np.nextafter(0., 1.).item(), 1e308]:
        for view in [(0., 1.), (.1, .4), (1., 1.)]:
            add("complete Number subdivision domain", [0., 1.], value, view=view)
    for text in ["AUTO", "Auto", "2", "", "auto "]:
        add("only exact auto text is consumed", [0., 1.], text, view=(math.nan, math.inf))
    for integer in [0, 1, -1, 2**53+1, 10**308, int(sys.float_info.max), int(sys.float_info.max)+1,
                    10**309, 10**400]:
        add("exact Python integer subdivision conversion", [0., 1.], {"integer": str(integer)}, view=(0., 0.))
    for major in [[], [1.], [1., 1.], [math.nan], [math.nan, math.nan], [0., math.nan],
                  [0., 1., math.nan], [1., math.inf], [-math.inf, 0.], [-math.inf, math.inf],
                  [math.inf, math.inf], [-0., 0.], [0., -0., 1.], [-0., 0., 1.],
                  [1., -0., 0., -1.], [0.]*50+[-0.], [-0.]+[0.]*50]:
        add("unique NaN infinity and signed zero", major, view=(-1., 2.))
    # Source randomized VQSort has genuinely nondeterministic signed-zero
    # representatives in large equal partitions. Record the observed bitset.
    rng = np.random.default_rng(9)
    for length in [50, 100]:
        major = rng.integers(-1, 2, length).astype(float)
        major[::3] = -0.
        major[::4] = 0.
        add("VQSort variable signed zero representative", major.tolist(), probe_zero_representative=True)
    tiny = np.nextafter(0., 1.).item()
    for step in [tiny, tiny*2, tiny*5, 1e-320, sys.float_info.min, 1e-300, 1e300, 1e308]:
        add("automatic mantissa subnormal and extreme", [0., step], view=(0., step))
    for target in [1., 2.5, 5., 10.]:
        tolerance = 1e-8 + 1e-5*target
        for direction in [-1, 1]:
            boundary = target + direction*tolerance
            for point in [math.nextafter(boundary, -math.inf), boundary, math.nextafter(boundary, math.inf)]:
                add("NumPy scalar auto isclose tolerance", [0., point], view=(0., point))
    for first, last in [(.25, 1.25), (.75, 1.75), (-1.25, -.25), (-1.75, -.75),
                        (math.nan, 1.), (1., math.nan), (math.inf, 1.), (1., -math.inf)]:
        add("Python ties even and nonfinite sorted view", [0., 1.], 2., view=(first, last))
    for point in [2**53, 2**63-2048, 2**63, 2**64-2048, 2**64, -2**63,
                  -2**63-2048, 1e100, -1e100, 1e308, -1e308]:
        add("arbitrary precision phase and inferred arange dtype", [0., 1.], 1., view=(point, point))
    for first in [2**63-1024, 2**63]:
        add("reachable float64 arange repeated fill", [0., 1.], 1., view=(first, first+4096))
    for origin in [2**53, -2**53, 1e16, -1e16]:
        add("separate multiply and add rounding", [origin, origin+4], 2.5, view=(origin-8, origin+12))
    for major in [[2**53+1, 2**53, 2**53+3, 2**53+1], [-2**63, 0, 1],
                  [-2**63, 2**63-1], [-2**63, -2**63+1], [2**63-2, 2**63-1],
                  [0, 2**63-1], [-2**63, -1, 0], [2**53+3, 2**53+2]]:
        for divisions_value in ["auto", 2., -1.]:
            add("true Int64 unique difference wrap and t0", major, divisions_value,
                view=(float(min(major)), float(min(major))+4.), dtype="int64")
    add("strided major view", [99., 2., 99., 0., 99., 1., 99., 1.], views=[(1, 2, 4)])
    add("reverse major view", [1., 0., 3., 1.], views=[(-1, -1, 4)])
    add("zero stride major view", [-0.], views=[(0, 0, 4)])
    for last in [124999., 199999.]:
        add("complete source array above eager cap", [0., 1.], 1., view=(0., last))
    add("full phase precedes cap", [0., 1.], 2.5, view=(-20000., 30000.))
    for last in [1e8, 1e16]:
        add("independent safe enumeration omission", [0., 1.], 1., view=(0., last))
    for view in [(0., 2**60), (0., 2**63), (0., 1e308), (0., -1e308)]:
        add("actual NumPy semantic size failure", [0., 1.], -1. if view[1] < 0 else 1., view=view)

    code = """// Generated by complete original AutoMinorLocator calls and traced locals.

///|
fn verify_auto_minor_grid_bits(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}

///|
fn verify_auto_minor_unique_zero_set(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value == 0.0 { assert_true(actual[index] == 0.0) }
    else if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}
"""
    rows = []
    for index, case in enumerate(specs):
        result = observe(reference, cls, proxy, case)
        rows.append(dict(case=case, observation=result))
        code += test_code(case, result, index)
    binary = Path(np._core._multiarray_umath.__file__)
    raw_dtype_probes = []
    for first in [2**63-1024, 2**63, 2**63+1024, 2**64, -2**63-1]:
        values = np.arange(first, first+3)
        raw_dtype_probes.append(dict(start=str(first), stop=str(first+3), dtype=str(values.dtype),
                                    values=[float(x) for x in values],
                                    scope="direct NumPy observation; the halfway first=2^63+1024 is not a round(finiteDouble) AutoMinor phase"))
    payload = dict(ticker_source_sha256=TICKER_SHA, transforms_source_sha256=TRANSFORMS_SHA,
                   python=sys.version.split()[0], numpy=np.__version__, platform=sys.platform,
                   machine=platform.machine(), numpy_binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),
                   numpy_highway_submodule_commit=HIGHWAY_SHA,
                   numpy_unique_python_sha256=hashlib.sha256(Path(np.lib._arraysetops_impl.__file__).read_bytes()).hexdigest(),
                   executed_source_bodies=["AutoMinorLocator.__init__", "AutoMinorLocator.__call__", "Locator.raise_if_exceeds", "TickHelper", "NumPy unique/arange/ufuncs"],
                   fixture_boundary="Axis providers and enumeration budget only; original class AST unchanged. Frame trace observes original unique/majorstep/minorstep/tmin/tmax. Fixed Darwin NumPy profile; randomized VQSort permits observed signed-zero representative bitsets only where repetition proves variation. Logger host routing is not modeled.",
                   safe_allocation_limit=SAFE_ALLOCATION, port_eager_cap=PORT_CAP,
                   direct_numpy_dtype_probes=raw_dtype_probes, cases=rows)
    return clean(payload), formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", RuntimeWarning)
        payload, code = generate(args.ticker)
    outputs = {ROOT/"testdata/auto_minor_grid_reference.json": json.dumps(payload, indent=2, allow_nan=False)+"\n",
               ROOT/"ticker/auto_minor_grid_reference_wbtest.mbt": code}
    for path, text in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(text)
    rows = payload["cases"]
    print("AutoMinor grid reference:", len(rows), "cases / generated tests,",
          sum(bool(row["observation"].get("query_omitted")) for row in rows), "budget omissions,",
          sum("prefix" in row["observation"] for row in rows), "complete source arrays above cap")


if __name__ == "__main__":
    main()
