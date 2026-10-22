"""Run complete pinned MaxN grid/range bodies against the fixed NumPy runtime.

The independent allocation guard only omits unsafe enumeration; it never
supplies expected ticks/counts or reports a budget event as a source exception.
Manageable grids above the port cap are evaluated completely before pruning,
step search and view endpoints are observed from the original source.
"""
from pathlib import Path
import argparse
import hashlib
import json
import math
import platform
import sys
import types
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_maxn_params_reference import load, pyparams, expression
from generate_multiple_locator_reference import TICKER_SHA, TRANSFORMS_SHA, RC_SHA, RCSETUP_SHA, clean
from generate_fixed_locator_reference import API_SHA

ROOT = Path(__file__).resolve().parents[1]
SAFE_ALLOCATION = 250000
PORT_CAP = 100000
PREFIX = 8


class EnumerationBudget(Exception):
    pass


class BoundedNumpy:
    def __init__(self):
        self.requests = []

    def arange(self, start, stop=None, step=1):
        if stop is None:
            start, stop = 0, start
        request = dict(start=float(start), stop=float(stop), step=float(step))
        self.requests.append(request)
        if step != 0:
            estimate = (float(stop) - float(start)) / float(step)
            if math.isfinite(estimate) and SAFE_ALLOCATION < estimate < 2**60:
                request.update(enumeration_omitted=True, budget_estimate=estimate,
                               estimate_scope="allocation guard only, not an observed source length")
                raise EnumerationBudget()
        values = np.arange(start, stop, step)
        request["observed_length"] = len(values)
        return values

    def __getattr__(self, name):
        return getattr(np, name)


def observe(function, proxy):
    first_request = len(proxy.requests)
    try:
        values = function()
        length = len(values)
        result = dict(source_error=None, observed_length=length)
        if length > PORT_CAP:
            result.update(prefix=[float(v) for v in values[:PREFIX]],
                          capped_prefix_last=[float(v) for v in values[PORT_CAP-4:PORT_CAP]],
                          full_last=[float(v) for v in values[-4:]], port_eager_cap=PORT_CAP)
        else:
            result["values"] = [float(v) for v in values]
    except EnumerationBudget:
        result = dict(query_omitted=True, source_error=None, reason="independent allocation budget")
    except (ValueError, OverflowError, ZeroDivisionError, IndexError, TypeError, AttributeError, UnboundLocalError) as error:
        result = dict(source_error=type(error).__name__)
    result["arange_requests"] = proxy.requests[first_request:]
    return result


def expect(expression, result, name):
    if result.get("query_omitted"):
        return "  // This source query was independently omitted by the allocation guard.\n"
    if result["source_error"]:
        return ("  assert_true(try { ignore(" + expression + "); false } catch {\n"
                "    @core.DataError::InvalidTicks(..) => true\n    _ => false\n  })\n")
    if "prefix" in result:
        return ("  let " + name + " = " + expression + "\n"
                "  assert_eq(" + name + ".length(), 100000)\n"
                "  verify_maxn_grid_values(Array::makei(8, index => " + name + "[index]), " + moon(result["prefix"]) + ")\n"
                "  verify_maxn_grid_values(Array::makei(4, index => " + name + "[99996 + index]), " + moon(result["capped_prefix_last"]) + ")\n")
    return "  verify_maxn_grid_values(" + expression + ", " + moon(result["values"]) + ")\n"


def expect_limits(expression, result, name):
    if result.get("query_omitted") or result["source_error"]:
        return expect(expression, result, name)
    return ("  let " + name + " = " + expression + "\n"
            "  verify_maxn_grid_values([" + name + ".0, " + name + ".1], " + moon(result["values"]) + ")\n")


def generate(path):
    if sys.platform != "darwin" or platform.machine() != "arm64":
        raise ValueError("the fixed NumPy numerical profile requires Darwin arm64")
    reference = load(path)
    proxy = BoundedNumpy()
    reference["np"] = proxy
    cls = reference["MaxNLocator"]
    specs = []

    def add(label, lower, upper, params=None, *, space=None, provider=False):
        specs.append(dict(label=label, lower=float(lower), upper=float(upper),
                          params=params or {}, provider=provider, tick_space=space))

    for bins in [1, 2, 3, 4, 5, 10, 12]:
        for integer in [False, True]:
            for first, last in [(.1, .9), (-3.5, 4.2), (0., 10.), (-.5, .5),
                                (0., 0.), (3., 3.), (1e12+.1, 1e12+.4)]:
                add("bin intervals / integer relaxation", first, last, dict(nbins=bins, integer=integer))
    for minimum in [1, 2, 3, 4, 7, 12, 30, 101, 2147483647]:
        for bins in [1, 3, 10]:
            for integer in [False, True]:
                add("full minimum tick search", .1, .9, dict(nbins=bins, min_n_ticks=minimum, integer=integer))
    for prune in [None, "lower", "upper", "both"]:
        for minimum in [2, 4]:
            for first, last in [(.1, 2.1), (2.1, .1)]:
                add("prune neighbors and reversed inputs", first, last,
                    dict(nbins=3, min_n_ticks=minimum, prune=prune))
    for steps in [[1., 10.], [1., 2., 4., 8., 10.], [2., 4., 8.],
                  [math.nan], [1., math.nan, 10.], [1., math.inf, math.nan, 10.],
                  [1., math.nan, -5., 10.]]:
        for integer in [False, True]:
            for first, last in [(.1, 2.1), (-.25, .75), (1e6+.01, 1e6+.05)]:
                add("custom and accepted NaN staircase", first, last,
                    dict(nbins=3, steps=steps, integer=integer))
    for space in [-math.inf, -1., 0., 1., 2.5, 5., 9., 100., math.inf, math.nan]:
        for minimum in [1, 2, 12]:
            add("automatic physical budget clipping", 0., 20.,
                dict(nbins="auto", min_n_ticks=minimum), provider=True, space=space)
    add("automatic budget without an axis", 0., 20., dict(nbins="auto"))
    for bins in [-2147483648, -1, 0]:
        for first, last in [(0., 1.), (0., 0.), (math.nan, math.inf)]:
            add("invalid budget errors are deferred", first, last, dict(nbins=bins))
    for symmetric in [False, True]:
        for first, last in [(math.nan, 1.), (1., math.nan), (math.inf, 1.),
                            (1., math.inf), (math.nan, math.inf), (math.inf, math.nan),
                            (-math.inf, math.inf), (-0., 0.)]:
            add("Python symmetric max NaN order", first, last, dict(nbins=3, symmetric=symmetric))
    for first, last in [(5e-324, 5e-324), (-5e-324, 5e-324), (1e-290, 1e-290),
                        (1e-250, 1.000000000000001e-250), (1e-200, 1.5e-200),
                        (-1e308, 1e308), (1e308, 1e308),
                        (1e16, math.nextafter(1e16, math.inf)),
                        (1e14+.1, 1e14+.4), (-1e14-.4, -1e14-.1),
                        (1e9+.0001, 1e9+.0004), (1e6+.000001, 1e6+.000004),
                        (math.nextafter(.3, -math.inf), math.nextafter(.9, math.inf))]:
        for bins in [1, 3, 10]:
            add("offset Edge / ULP / extreme binary64", first, last, dict(nbins=bins))
    for bins, minimum in [(100001, 100002), (200000, 2)]:
        for prune in [None, "lower", "upper", "both"]:
            add("complete search and pruning precede eager prefix", 0., 1.,
                dict(nbins=bins, min_n_ticks=minimum, prune=prune))
    add("unsafe source enumeration is a separate budget event", 0., 1., dict(nbins=2147483647))

    code = """// Generated by complete original MaxNLocator/scale_range/Edge bodies.
// Finite values and infinities compare by bits. Allocation omissions are not source errors.

///|
fn verify_maxn_grid_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
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
        params, lower, upper = case["params"], case["lower"], case["upper"]
        locator = cls(**pyparams(params))
        reads = [0]
        if case["provider"]:
            def get_tick_space():
                reads[0] += 1
                return case["tick_space"]
            locator.axis = types.SimpleNamespace(get_tick_space=get_tick_space)
        code += "\n///|\ntest " + moon("MaxN grid original " + str(index) + " " + case["label"]) + " {\n"
        code += "  let previous_mode = @config.axes_autolimit_mode()\n  defer { try! @config.set_axes_autolimit_mode(previous_mode) }\n"
        code += "  let locator = @ticker.MaxNLocator::new(" + expression(params, constructor=True) + ")\n"
        if case["provider"]:
            code += "  let reads = [0]\n  locator.bind_tick_space(() => { reads[0] += 1; " + moon(case["tick_space"]) + " })\n"
        calls = []
        for mode in ["data", "round_numbers"]:
            reference["mpl"].rcParams["axes.autolimit_mode"] = mode
            code += "  @config.set_axes_autolimit_mode(" + moon(mode) + ")\n"
            previous_reads = reads[0]
            ticks = observe(lambda: locator.tick_values(lower, upper), proxy)
            tick_reads = reads[0] - previous_reads
            previous_reads = reads[0]
            view = observe(lambda: locator.view_limits(lower, upper), proxy)
            view_reads = reads[0] - previous_reads
            if case["provider"]:
                code += "  reads[0] = 0\n"
            code += expect("locator.tick_values(" + moon(lower) + ", " + moon(upper) + ")", ticks, "ticks_"+mode)
            if case["provider"] and not ticks.get("query_omitted"):
                code += "  assert_eq(reads[0], " + str(tick_reads) + ")\n  reads[0] = 0\n"
            code += expect_limits("locator.view_limits(" + moon(lower) + ", " + moon(upper) + ")", view, "view_"+mode)
            if case["provider"] and not view.get("query_omitted"):
                code += "  assert_eq(reads[0], " + str(view_reads) + ")\n"
            calls.append(dict(mode=mode, ticks=ticks, view_limits=view,
                              tick_space_reads_tick=tick_reads, tick_space_reads_view=view_reads))
        nonsingular = [float(v) for v in locator.nonsingular(lower, upper)]
        code += "  let inherited = locator.nonsingular(" + moon(lower) + ", " + moon(upper) + ")\n"
        code += "  verify_maxn_grid_values([inherited.0, inherited.1], " + moon(nonsingular) + ")\n}\n"
        rows.append(dict(case=case, calls=calls, nonsingular=nonsingular))

    # __call__ reads the bound view at each invocation; copied parameters keep
    # the same source axis/provider, with no clock or data-interval involvement.
    locator = cls(nbins=3)
    unbound = observe(locator, proxy)
    views = [(0., 10.), (.1, 2.1), (2.1, .1)]
    state, view_reads = [0., 10.], [0]
    def get_view_interval():
        view_reads[0] += 1
        return tuple(state)
    locator.axis = types.SimpleNamespace(get_view_interval=get_view_interval)
    provider_rows = []
    code += '\n///|\ntest "MaxN grid original bound view call" {\n'
    code += "  let previous_mode = @config.axes_autolimit_mode()\n  defer { try! @config.set_axes_autolimit_mode(previous_mode) }\n  @config.set_axes_autolimit_mode(\"data\")\n"
    code += "  let locator = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Count(3))\n"
    code += expect("locator.call()", unbound, "unbound")
    code += "  let view = [0.0, 10.0]\n  let reads = [0]\n  locator.bind_view_interval(() => { reads[0] += 1; (view[0], view[1]) })\n"
    reference["mpl"].rcParams["axes.autolimit_mode"] = "data"
    for index, values in enumerate(views):
        state[:] = values
        result = observe(locator, proxy)
        code += "  view[0] = " + moon(values[0]) + "\n  view[1] = " + moon(values[1]) + "\n"
        code += expect("locator.call()", result, "called_"+str(index))
        code += "  assert_eq(reads[0], " + str(view_reads[0]) + ")\n"
        provider_rows.append(dict(view=values, result=result, view_reads=view_reads[0]))
    code += "}\n"
    binary = Path(np._core._multiarray_umath.__file__)
    payload = dict(ticker_source_sha256=TICKER_SHA, transforms_source_sha256=TRANSFORMS_SHA,
                   api_source_sha256=API_SHA, matplotlibrc_sha256=RC_SHA, rcsetup_sha256=RCSETUP_SHA,
                   python=sys.version.split()[0], numpy=np.__version__,
                   platform=sys.platform, machine=platform.machine(),
                   numpy_binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),
                   executed_source_bodies=["MaxNLocator", "scale_range", "_Edge_integer", "Locator",
                                            "TickHelper", "transforms._nonsingular", "_api.check_in_list",
                                            "_api.list_suggestion_error_msg", "_api.kwarg_error"],
                   fixture_boundary="Only axis tick-space/view providers and an independent allocation guard are fixtures; complete original numerical/validation bodies execute. Actual NumPy arrays decide steps/counts/prune/endpoints. Fixed Darwin NumPy fill profile, not a universal platform bit profile.",
                   safe_allocation_limit=SAFE_ALLOCATION, port_eager_cap=PORT_CAP,
                   cases=rows, unbound_call=unbound, view_provider_queries=provider_rows)
    return clean(payload), formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", RuntimeWarning)
        payload, code = generate(args.ticker)
    outputs = {ROOT/"testdata/maxn_grid_reference.json": json.dumps(payload, indent=2, allow_nan=False)+"\n",
               ROOT/"ticker/maxn_grid_reference_test.mbt": code}
    for path, text in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: "+str(path))
        else:
            path.write_text(text)
    omitted = sum(bool(result.get("query_omitted")) for row in payload["cases"]
                  for call in row["calls"] for result in [call["ticks"], call["view_limits"]])
    observations = len(payload["cases"])*5 + 1 + len(payload["view_provider_queries"])
    print("MaxN grid reference:", len(payload["cases"]), "cases,", observations,
          "observation groups,", omitted, "explicit enumeration omissions")


if __name__ == "__main__":
    main()
