"""Execute complete original LogLocator grid bodies with fixed NumPy.

Frame observations retain scalar origins, complete decade shape and ndarray
dtype. An independent allocation guard omits unsafe requests without inventing
source errors, expected lengths, ticks, powers or fallback decisions.
"""
from pathlib import Path
import argparse
import hashlib
import inspect
import json
import math
import platform
import sys
import types
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_log_params_reference import load, number, subs
from generate_multiple_locator_reference import clean, TICKER_SHA, TRANSFORMS_SHA

ROOT = Path(__file__).resolve().parents[1]
SAFE_ALLOCATION = 250000
PORT_CAP = 100000


class EnumerationBudget(Exception):
    pass


def scalar(value):
    return dict(type=type(value).__name__, value=str(value))


class BoundedNumpy:
    def __init__(self):
        self.events = []

    def __getattr__(self, name):
        return getattr(np, name)

    def clip(self, value, first, last):
        result = np.clip(value, first, last)
        self.events.append(dict(operation="np.clip", input=scalar(value), output=scalar(result)))
        return result

    def arange(self, *args):
        start, stop, step = (0, args[0], 1) if len(args) == 1 else (args[0], args[1], args[2] if len(args) > 2 else 1)
        event = dict(operation="np.arange", arguments=[scalar(x) for x in args])
        self.events.append(event)
        try:
            estimate = (stop-start)/step
        except (OverflowError, ZeroDivisionError):
            estimate = math.inf
        if math.isfinite(estimate) and SAFE_ALLOCATION < estimate < 2**60-64:
            event.update(independent_budget_omission=True, allocation_estimate=str(estimate))
            raise EnumerationBudget()
        result = np.arange(*args)
        event.update(observed_length=len(result), observed_dtype=str(result.dtype))
        return result

    def array(self, value, *args, **kwargs):
        event = None
        if isinstance(value, range):
            event = dict(operation="np.array(range)", start=str(value.start), stop=str(value.stop), step=str(value.step))
            self.events.append(event)
            try:
                length = len(value)
            except OverflowError:
                return np.array(value, *args, **kwargs)
            if length > SAFE_ALLOCATION:
                event.update(independent_budget_omission=True, range_length=length)
                raise EnumerationBudget()
        result = np.array(value, *args, **kwargs)
        if event is not None:
            event.update(observed_length=len(result), observed_dtype=str(result.dtype))
        return result

    def bounded_range(self, *args):
        result = range(*args)
        frame = inspect.currentframe().f_back
        # Only the two-argument minor list comprehension enumerates the product
        # here. A modern three-argument decades range remains lazy until array.
        if len(args) == 2 and frame.f_code.co_name == "tick_values" and "subs" in frame.f_locals:
            try:
                length = len(result)
            except OverflowError:
                self.events.append(dict(operation="minor Python range", arguments=[str(x) for x in args], independent_budget_omission=True))
                raise EnumerationBudget()
            estimate = length * len(frame.f_locals["subs"])
            if estimate > SAFE_ALLOCATION:
                self.events.append(dict(operation="minor Python range", range_length=length,
                                        product_allocation_estimate=estimate, independent_budget_omission=True))
                raise EnumerationBudget()
        return result


def observe(ns, proxy, case):
    ns["mpl"].rcParams["_internal.classic_mode"] = case.get("construct_classic", case["classic"])
    locator = ns["LogLocator"](case["base"], case["subs"], numticks=case["numticks"])
    ns["mpl"].rcParams["_internal.classic_mode"] = case["classic"]
    ns["mpl"].rcParams["axes.autolimit_mode"] = case["mode"]
    reads = []
    attributes = {}
    if "space" in case:
        def space():
            reads.append("space")
            return case["space"]
        attributes["get_tick_space"] = space
    if "minpos" in case:
        def minpos():
            reads.append("minpos")
            return case["minpos"]
        attributes["get_minpos"] = minpos
    if case.get("bound"):
        locator.axis = types.SimpleNamespace(**attributes)
    captured = {}
    target = ns["LogLocator"].tick_values.__code__

    def trace(frame, event, argument):
        if frame.f_code is target:
            if event in ["line", "exception", "return"]:
                captured.update(frame.f_locals)
            return trace
        return None

    first_event = len(proxy.events)
    sys.settrace(trace)
    try:
        values = locator.tick_values(*case["bounds"])
        size = len(values)
        eager = min(size, PORT_CAP)
        result = dict(source_error=None, observed_length=size, eager_length=eager)
        if size <= 256:
            result["values"] = [float(x) for x in values]
        else:
            sample_indices = sorted(set(list(range(8)) + list(range(max(eager-4, 0), eager))
                                        + list(range(max(eager//2-2, 0), min(eager//2+2, eager)))))
            result["samples"] = [[index, float(values[index])] for index in sample_indices]
            result["full_last"] = [float(x) for x in values[-4:]]
    except EnumerationBudget:
        result = dict(source_error=None, query_omitted=True, reason="independent allocation budget; no original result or error inferred")
    except (ValueError, OverflowError, ZeroDivisionError, TypeError, AttributeError, AssertionError, IndexError) as error:
        result = dict(source_error=type(error).__name__, source_message=str(error))
    finally:
        sys.settrace(None)
    result["provider_reads"] = reads
    result["numpy_events"] = proxy.events[first_event:]
    result["locals"] = {name: scalar(captured[name]) for name in ["n_request", "efmin", "efmax", "emin", "emax", "n_avail", "stride", "nr", "mid", "olo", "ohi", "offset"] if name in captured}
    if "decades" in captured:
        values = captured["decades"]
        shape = dict(container=type(values).__name__)
        if isinstance(values, np.ndarray):
            shape["dtype"] = str(values.dtype)
        try:
            shape["full_length"] = len(values)
            shape["prefix"] = [scalar(x) for x in list(values[:12]) if not isinstance(values, range)] if not isinstance(values, range) else [scalar(values[index]) for index in range(min(12,len(values)))]
        except OverflowError:
            shape["length_exceeds_Python_ssize_t"] = True
        if isinstance(values, range):
            shape.update(start=str(values.start), stop=str(values.stop), step=str(values.step))
        result["complete_decades_shape"] = shape
    if "subs" in captured:
        values = captured["subs"]
        if not isinstance(values, str):
            result["actual_subs"] = dict(length=len(values), dtype=str(values.dtype), prefix=[float(x) for x in values[:8]])
    return result


def error_assert(expression):
    return "  assert_true(try { ignore("+expression+"); false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })\n"


def expression_number(value, space=False):
    return number(value, space).replace("@ticker.", "")


def test_case(case, result, index):
    code = "\n///|\ntest "+moon("Log original grid "+str(index)+" "+case["label"])+" {\n"
    code += "  let previous_classic = @config.classic_mode()\n  let previous_mode = @config.axes_autolimit_mode()\n"
    code += "  defer { @config.set_classic_mode(previous_classic); try! @config.set_axes_autolimit_mode(previous_mode) }\n"
    code += "  @config.set_classic_mode("+moon(case.get("construct_classic",case["classic"]))+")\n"
    arguments = ["base="+moon(case["base"])]
    if case["subs"] is None:
        arguments.append("subs=None")
    else:
        arguments.append("subs=Some("+subs(case["subs"]).replace("@ticker.", "")+")")
    if case["numticks"] is not None:
        arguments.append("numticks=Some("+expression_number(case["numticks"])+")")
    code += "  let locator = LogLocator::new("+", ".join(arguments)+")\n"
    code += "  @config.set_classic_mode("+moon(case["classic"])+")\n  @config.set_axes_autolimit_mode("+moon(case["mode"])+")\n"
    code += "  let reads : Array[String] = []\n"
    if "space" in case:
        code += "  locator.bind_tick_space(() => { reads.push(\"space\"); "+expression_number(case["space"],True)+" })\n"
    if "minpos" in case:
        code += "  locator.bind_minpos(() => { reads.push(\"minpos\"); "+moon(case["minpos"])+" })\n"
    if case.get("bound") and "space" not in case and "minpos" not in case:
        code += "  locator.bind_view_interval(() => { (1.0, 10.0) })\n"
    expression = "locator.tick_values("+moon(case["bounds"][0])+", "+moon(case["bounds"][1])+")"
    if result.get("query_omitted"):
        code += "  // Complete original query independently omitted by allocation guard.\n"
        code += "  ignore(locator)\n  ignore(reads)\n"
    elif result["source_error"]:
        code += error_assert(expression)
    elif "values" in result:
        code += "  verify_log_grid_bits("+expression+", "+moon(result["values"])+")\n"
    else:
        code += "  let ticks = "+expression+"\n  assert_eq(ticks.length(), "+str(result["eager_length"])+")\n"
        code += "  verify_log_grid_bits(["+", ".join("ticks["+str(index)+"]" for index,value in result["samples"])+"], "+moon([value for index,value in result["samples"]])+")\n"
    if not result.get("query_omitted"):
        code += "  assert_eq(reads, "+moon(result["provider_reads"])+")\n"
    return code+"}\n"


def generate(path):
    if sys.platform != "darwin" or platform.machine() != "arm64":
        raise ValueError("fixed Darwin arm64 NumPy profile required")
    ns = load(path)
    proxy = BoundedNumpy()
    ns["np"] = proxy
    ns["range"] = proxy.bounded_range
    cases = []

    def add(label, *, base=10., subs=(1.,), numticks=None, bounds=(1.,1000.), classic=False, mode="data", **extra):
        cases.append(dict(label=label, base=float(base), subs=subs, numticks=numticks,
                          bounds=[float(x) for x in bounds], classic=classic, mode=mode, **extra))

    for base in [10.,2.,3.,math.e,5.,.5,.1,0.,-0.,-1.,1.,math.nan,math.inf,-math.inf,
                 math.nextafter(1.,math.inf),math.nextafter(1.,0.)]:
        for selected in [(1.,),"auto","all"]:
            add("complete Double base domain",base=base,subs=selected)
    for classic in [False,True]:
        for budget in [-10,-2,-1,0,1,2,3,4,5,9,100,2**53+1,10**100,10**400,
                       -10**400,-1.,0.,1.,1.5,2.5,.5,math.nan,math.inf,-math.inf,"AUTO",""]:
            for bounds in [(1.,2.),(1.,1e6)]:
                add("raw count domains and actual stride",numticks=budget,classic=classic,bounds=bounds)
    for bounds in [(0.,100.),(-1.,100.),(100.,-1.),(-2.,-1.),(0.,0.),(math.nan,10.),
                   (1.,math.nan),(math.inf,10.),(1.,math.inf),(10.,1.),(1.,1.),(1.1,1.2),(.001,1e6)]:
        add("input order and delayed logarithm errors",bounds=bounds)
    for minimum in [1e-5,0.,-1.,math.nan,math.inf]:
        add("own minimum positive recovery",bounds=(0.,100.),bound=True,space=9,minpos=minimum)
    for budget in [2,2.,2.5,3,3.,3.5,5,5.,math.nan,math.inf,-math.inf,2**63-1,2**63,2**64-1,2**64,
                   10**400,-2**63,-2**63-1,-10**400]:
        for base,bounds in [(10.,(1.,1000.)),(math.nextafter(1.,0.),(np.nextafter(0.,1.).item(),sys.float_info.max))]:
            add("integer unsigned object and float clipped space",base=base,bounds=bounds,bound=True,space=budget)
    for selected in [(),(0.,),(-1.,),(math.nan,),(math.inf,),(2.,),(2.,1.),(1.,2.),(2.,2.)]:
        for bounds in [(1.,1000.),(1.1,1.2),(3.,3.)]:
            for mode in ["data","round_numbers"]:
                add("subdivision order and complete fallback",subs=selected,bounds=bounds,mode=mode)
    tiny = np.nextafter(0.,1.).item()
    for base in [10.,2.,3.,math.nextafter(1.,math.inf),math.nextafter(1.,0.)]:
        for bounds in [(tiny,1e-300),(1e-300,1e308),(1e308,1e308),(sys.float_info.max,sys.float_info.max)]:
            for selected in [(1.,),(2.,),(1.,2.)]:
                add("full exponents and distinct power protocols",base=base,bounds=bounds,subs=selected)
    for base in [math.nextafter(1.,math.inf),math.nextafter(1.,0.)]:
        for budget in [0,1,2,3,9]:
            add("arbitrary integer decades determine whole dtype",base=base,numticks=budget,bounds=(tiny,sys.float_info.max))
    for power in [-10,-3,-1,0,1,3,10,100,300]:
        point=10.**power
        for boundary in [math.nextafter(point,0.),point,math.nextafter(point,math.inf)]:
            add("specialized logarithm decade boundaries",bounds=(boundary,boundary),numticks=3)
    for base in [3.,10.]:
        for available in [9,10]:
            for selected in [None,"auto","all"]:
                add("automatic subdivision threshold",base=base,subs=selected,bounds=(1.,base**(available-1)))
    for base in [62501.,100001.]:
        add("complete original flattened array above eager cap",base=base,subs="all",bounds=(1.,2.))
    add("complete source count beyond cap with explicit subs",subs=tuple(float(x) for x in range(1,62501)),bounds=(1.,2.))
    for base in [1e7,1e308,math.inf]:
        add("independent budget versus genuine size error",base=base,subs="all")
    add("hand logical-trillion query has independent source budget",base=1e12,subs="all",bounds=(1.,1.))
    add("huge minor product independently omitted",base=math.nextafter(1.,math.inf),numticks=10**100,subs=(1.,2.),bounds=(1.,1e100))
    add("incomplete bound owner needs tick space",bound=True)
    add("minimum alone still marks owner bound",bound=True,minpos=.001)
    add("explicit count skips missing tick space",bound=True,numticks=3)
    add("positive first does not read own minpos",bound=True,space=5,bounds=(100.,-1.),minpos=.001)
    add("captured classic default and dynamic modern query",classic=False,construct_classic=True)
    add("captured modern auto and dynamic classic query",classic=True,construct_classic=False)

    code = """// Generated by complete pinned LogLocator/AutoLocator bodies with real NumPy.

///|
fn verify_log_grid_bits(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}
"""
    rows=[]
    for index, case in enumerate(cases):
        result=observe(ns,proxy,case)
        rows.append(dict(case=case,observation=result))
        code+=test_case(case,result,index)
    helper_rows=[]
    for base in [10.,2.,3.,.5,0.,-0.,1.,math.nan,math.inf,-1.]:
        for value in [-100.,-1.,-0.,0.,.001,1.,1.1,100.,math.nan,math.inf,-math.inf]:
            # The frozen private helper contract is the NumPy IEEE scalar
            # domain, as used by real Axis intervals; Python zero/zero dynamic
            # operand-origin differences are outside this nonraising helper.
            expected=[float(ns[name](np.float64(value),base)) for name in ["_decade_less_equal","_decade_greater_equal","_decade_less","_decade_greater"]]
            helper_rows.append(dict(base=base,value=value,operand_type="numpy.float64",values=expected))
            code+="\n///|\ntest "+moon("Log original IEEE decade helpers "+str(len(helper_rows)-1))+" {\n"
            code+="  verify_log_grid_bits([log_decade_less_equal("+moon(value)+", "+moon(base)+"), log_decade_greater_equal("+moon(value)+", "+moon(base)+"), log_decade_less("+moon(value)+", "+moon(base)+"), log_decade_greater("+moon(value)+", "+moon(base)+")], "+moon(expected)+")\n}\n"
    ns["mpl"].rcParams["_internal.classic_mode"] = False
    late_subs=np.full(62501,1e9)
    late_subs[-1]=1.
    late_values=ns["LogLocator"](subs=late_subs).tick_values(1.,1.)
    hand_evidence=dict(label="hand fallback has one visible tick only after cap", observed_length=len(late_values),
                       indices=[0,62500,62501,99999,125001],
                       observed_values=[float(late_values[i])for i in [0,62500,62501,99999,125001]],
                       scope="complete original 125002-point query; concise programmatic hand test covers the capped prefix")
    payload=dict(ticker_source_sha256=TICKER_SHA,transforms_source_sha256=TRANSFORMS_SHA,
                 python=sys.version.split()[0],numpy=np.__version__,platform=sys.platform,machine=platform.machine(),
                 numpy_binary_sha256=hashlib.sha256(Path(np._core._multiarray_umath.__file__).read_bytes()).hexdigest(),
                 executed_source_bodies=["LogLocator","_decade_less_equal","_decade_greater_equal","_decade_less","_decade_greater","AutoLocator","MaxNLocator","scale_range","_Edge_integer","Locator","TickHelper","original transforms._nonsingular","original _api checks"],
                 fixture_boundary="Only rc storage, axis providers, frame observation and independent allocation budgets are fixtures. Complete original grid/fallback bodies and real NumPy execute. Original IEEE array and Python-object power paths remain distinct. Fixed Darwin bit profile, not a universal NumPy platform claim. Helper observations use NumPy float64 scalar operands per their nonraising IEEE contract.",
                 safe_allocation_limit=SAFE_ALLOCATION,port_eager_cap=PORT_CAP,cases=rows,decade_helper_cases=helper_rows,
                 hand_source_evidence=hand_evidence)
    return clean(payload),formatted(code)


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument("ticker",type=Path)
    parser.add_argument("--check",action="store_true")
    args=parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore",RuntimeWarning)
        payload,code=generate(args.ticker)
    outputs={ROOT/"testdata/log_grid_reference.json":json.dumps(payload,indent=2,allow_nan=False)+"\n",
             ROOT/"ticker/log_grid_reference_wbtest.mbt":code}
    for path,text in outputs.items():
        if args.check:
            if not path.exists() or path.read_text()!=text:raise SystemExit("reference differs: "+str(path))
        else:path.write_text(text)
    rows=payload["cases"]
    print("Log grid reference:",len(rows),"complete-query cases,",len(payload["decade_helper_cases"]),"IEEE helper cases,",
          sum(bool(row["observation"].get("query_omitted"))for row in rows),"independent omissions,",
          sum(row["observation"].get("observed_length",0)>PORT_CAP for row in rows),"complete arrays above cap")


if __name__=="__main__":main()
