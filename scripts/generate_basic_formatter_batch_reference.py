"""Execute complete pinned basic Formatter bodies with observable user callbacks.

The callback fixtures are user programs, not replacement formatter algorithms.
Every result/order/error comes from the original classes loaded by the shared
real-descriptor loader. Array and ndarray fixtures retain their different shapes.
"""
from pathlib import Path
import argparse
import collections
import json
import math
import sys

import numpy as np

from formatter_reference_source import load
from generate_auto_date_reference import formatted, moon
from generate_multiple_locator_reference import clean

ROOT = Path(__file__).resolve().parents[1]
KINDS = ["Base", "Null", "Fixed", "Func"]


def position_label(position):
    return "none" if position is None else "p" + str(position)


def value_label(value):
    if math.isnan(value):
        return "nan"
    if math.isinf(value):
        return "negative infinity" if value < 0 else "positive infinity"
    if value == 0:
        return "negative zero" if math.copysign(1., value) < 0 else "zero"
    return "finite"


def summary(values):
    values = list(values)
    indices = (list(range(len(values))) if len(values) <= 128 else
               [0, 1, 2, 99999, 100000, len(values) - 1])
    return dict(length=len(values), samples=[[i, values[i]] for i in indices])


def source_view(owner, spec):
    start, stride, length = spec
    if stride == 0:
        return np.lib.stride_tricks.as_strided(
            owner[start:], shape=(length,), strides=(0,), writeable=True)
    if length == 0:
        return owner[start:start]
    stop = start + stride * length
    return owner[start:None if stride < 0 and stop < 0 else stop:stride]


def observe(namespace, case):
    """Only fixtures mutate inputs/state; original format_ticks owns iteration."""
    calls, positions, nested, caught = [], [], [], []
    values = ([case["values"][0]] * case["size"] if "size" in case else
              case["values"].copy())
    owner = np.array(values, dtype=np.float64)
    selected = source_view(owner, case["view"]) if case["operation"] == "view" else None
    scenario = case.get("scenario")
    depth = [False]
    formatter = None

    def replacement(value, position):
        calls.append(float(value))
        positions.append(position)
        return "replacement"

    def callback(value, position):
        calls.append(float(value))
        positions.append(position)
        if scenario in ["reentrant_caught", "reentrant_propagates"] and value == 7:
            raise ValueError("inner callback")
        if "fail_position" in case and position == case["fail_position"]:
            raise ValueError("fixture callback")
        if position == 0:
            if scenario in ["replace", "replace_append"]:
                values[1] = 20.
            if scenario in ["append", "replace_append", "append_error"]:
                values.append(42.)
            if scenario == "clear":
                values.clear()
            if scenario == "view_replace":
                start, stride, _ = case["view"]
                owner[start + stride] = 20.
            if scenario == "set_locs":
                formatter.set_locs([7., 8.])
            if scenario == "rebind":
                formatter.func = replacement
        if scenario == "append_error" and position == 1:
            raise ValueError("fixture callback")
        if scenario in ["reentrant", "reentrant_caught", "reentrant_propagates"] and position == 0 and not depth[0]:
            depth[0] = True
            if scenario == "reentrant_caught":
                try:
                    nested.append(formatter.format_ticks([7.]))
                except ValueError as error:
                    caught.append(str(error))
            else:
                nested.append(formatter.format_ticks([7.]))
            depth[0] = False
        if scenario == "offset":
            formatter.set_offset_string(position_label(position))
        if scenario == "rebind":
            return "original"
        return (value_label(value) if case.get("callback") == "value" else
                position_label(position))

    cls = namespace["Formatter" if case["kind"] == "Base" else case["kind"] + "Formatter"]
    formatter = (cls(case["labels"].copy()) if case["kind"] == "Fixed" else
                 cls(callback) if case["kind"] == "Func" else cls())
    formatter.set_locs([91., 92.])
    namespace["external_warnings"].clear()
    try:
        operation = case["operation"]
        if operation == "batch":
            result = formatter.format_ticks(values)
        elif operation == "view":
            result = formatter.format_ticks(selected)
        elif operation == "call":
            result = formatter(case["value"], case.get("position"))
        else:
            result = getattr(formatter, operation)(case["value"])
        error, message = None, None
    except (NotImplementedError, IndexError, ValueError) as failure:
        result, error, message = None, type(failure).__name__, str(failure)
    return dict(
        result=summary(result) if isinstance(result, list) else result,
        result_is_batch=case["operation"] in ["batch", "view"],
        error=error, message=message, calls=calls, positions=positions,
        locations=summary(float(x) for x in formatter._locs),
        locations_kind="NdArray" if isinstance(formatter._locs, np.ndarray) else "Sequence",
        input_after=summary(values), owner_after=summary(float(x) for x in owner),
        nested=nested, caught=caught, offset=formatter.get_offset(),
        warnings=namespace["external_warnings"].copy())


def optional_positions(values):
    return "[" + ", ".join("None" if x is None else "Some(" + str(x) + ")" for x in values) + "]"


def callback_code(case):
    scenario = case.get("scenario")
    code = """(value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
"""
    if scenario in ["reentrant_caught", "reentrant_propagates"]:
        code += '    if value == 7.0 { raise @core.DataError::InvalidTicks(message="inner callback") }\n'
    if "fail_position" in case:
        condition = "position is None" if case["fail_position"] is None else "position == Some(" + str(case["fail_position"]) + ")"
        code += '    if ' + condition + ' { raise @core.DataError::InvalidTicks(message="fixture callback") }\n'
    if scenario in ["replace", "replace_append"]:
        code += '    if position == Some(0) { values[1] = 20.0 }\n'
    if scenario in ["append", "replace_append", "append_error"]:
        code += '    if position == Some(0) { values.push(42.0) }\n'
    if scenario == "clear":
        code += '    if position == Some(0) { values.clear() }\n'
    if scenario == "view_replace":
        start, stride, _ = case["view"]
        code += '    if position == Some(0) { values[' + str(start + stride) + '] = 20.0 }\n'
    if scenario == "set_locs":
        code += '    if position == Some(0) { holder[0].unwrap().set_locs([7.0, 8.0]) }\n'
    if scenario == "rebind":
        code += '''    if position == Some(0) {
      holder[0].unwrap().set_func((next_value, next_position) => {
        seen_values.push(next_value)
        seen_positions.push(next_position)
        "replacement"
      })
    }
'''
    if scenario == "append_error":
        code += '    if position == Some(1) { raise @core.DataError::InvalidTicks(message="fixture callback") }\n'
    if scenario in ["reentrant", "reentrant_caught", "reentrant_propagates"]:
        code += '    if position == Some(0) && !depth[0] {\n      depth[0] = true\n'
        if scenario == "reentrant_caught":
            code += '''      try {
        nested.push(holder[0].unwrap().format_ticks([7.0]))
      } catch {
        @core.DataError::InvalidTicks(message~) => caught.push(message)
        error => raise error
      }
'''
        else:
            code += '      nested.push(holder[0].unwrap().format_ticks([7.0]))\n'
        code += '      depth[0] = false\n    }\n'
    if scenario == "offset":
        code += '    holder[0].unwrap().set_offset_string(basic_formatter_batch_position(position))\n'
    code += ('    "original"' if scenario == "rebind" else
             '    basic_formatter_batch_value(value)' if case.get("callback") == "value" else
             '    basic_formatter_batch_position(position)')
    return code + '\n  }'


def numeric_summary_assert(expression, observed, locations=False):
    code = '  assert_eq(' + expression + '.length(), ' + str(observed["length"]) + ')\n'
    selected = [expression + ('.get(' + str(index) + ')' if locations else '[' + str(index) + ']')
                for index, _ in observed["samples"]]
    code += '  verify_basic_formatter_batch_values([' + ', '.join(selected) + '], ' + moon([x for _, x in observed["samples"]]) + ')\n'
    return code


def test_code(case, observed, index):
    code = '\n///|\ntest ' + moon('Basic formatter batch ' + str(index) + ' ' + case["label"]) + ' {\n'
    code += '  let values = ' + ('Array::make(' + str(case["size"]) + ', ' + moon(case["values"][0]) + ')' if "size" in case else moon(case["values"])) + '\n'
    if case["operation"] == "view":
        start, stride, length = case["view"]
        code += '  let selected = TickValues::from_array(values).view(' + ', '.join(map(str, [start, stride, length])) + ')\n'
    code += '  let seen_values : Array[Double] = []\n  let seen_positions : Array[Int32?] = []\n'
    code += '  let nested : Array[Array[String]] = []\n  let caught : Array[String] = []\n'
    scenario = case.get("scenario")
    needs_holder = scenario in ["set_locs", "rebind", "reentrant", "reentrant_caught", "reentrant_propagates", "offset"]
    if needs_holder:
        code += '  let holder : Array[FuncFormatter?] = [None]\n'
    if scenario in ["reentrant", "reentrant_caught", "reentrant_propagates"]:
        code += '  let depth = [false]\n'
    init = ("BaseFormatter::new()" if case["kind"] == "Base" else
            "FixedFormatter::new(" + moon(case["labels"]) + ")" if case["kind"] == "Fixed" else
            "FuncFormatter::new(" + callback_code(case) + ")" if case["kind"] == "Func" else
            "NullFormatter::new()")
    if case.get("adapter") and case["kind"] != "Base":
        code += '  let wrapper = ' + init + '\n  let formatter = wrapper.as_base_formatter()\n'
    else:
        code += '  let formatter = ' + init + '\n'
    if needs_holder:
        code += '  holder[0] = Some(formatter)\n'
    code += '  let base = ' + ('formatter' if case["kind"] == "Base" or case.get("adapter") else 'formatter.as_base_formatter()') + '\n'
    code += '  base.set_locs([91.0, 92.0])\n'
    operation = case["operation"]
    query = ('formatter.format_ticks(values)' if operation == "batch" else
             'formatter.format_ticks_view(selected)' if operation == "view" else
             'formatter.call(' + moon(case["value"]) + (', pos=' + str(case["position"]) if case.get("position") is not None else '') + ')' if operation == "call" else
             'formatter.' + operation + '(' + moon(case["value"]) + ')')
    if observed["error"]:
        exact = observed["message"] if observed["error"] in ["ValueError", "NotImplementedError"] else None
        pattern = '@core.DataError::InvalidTicks(message~) => message == ' + moon(exact) if exact else '@core.DataError::InvalidTicks(..) => true'
        code += '  assert_true(try { ignore(' + query + '); false } catch { ' + pattern + '; _ => false })\n'
    elif observed["result_is_batch"]:
        result = observed["result"]
        code += '  let labels = ' + query + '\n  assert_eq(labels.length(), ' + str(result["length"]) + ')\n'
        if result["samples"]:
            code += '  assert_eq([' + ', '.join('labels[' + str(i) + ']' for i, _ in result["samples"]) + '], ' + moon([v for _, v in result["samples"]]) + ')\n'
    else:
        code += '  assert_eq(' + query + ', ' + moon(observed["result"]) + ')\n'
    code += '  verify_basic_formatter_batch_values(seen_values, ' + moon(observed["calls"]) + ')\n'
    code += '  assert_eq(seen_positions, ' + optional_positions(observed["positions"]) + ')\n'
    code += '  assert_eq(nested, ' + moon(observed["nested"]) + ')\n  assert_eq(caught, ' + moon(observed["caught"]) + ')\n'
    code += '  let locations = base.locations()\n  assert_true(locations is ' + observed["locations_kind"] + '(_))\n'
    code += numeric_summary_assert('locations', observed["locations"], locations=True)
    code += numeric_summary_assert('values', observed["owner_after"] if operation == "view" else observed["input_after"])
    code += '  assert_eq(base.get_offset(), ' + moon(observed["offset"]) + ')\n'
    return code + '}\n'


def generate(path):
    namespace = load(path)
    cases = []

    def add(label, kind, operation="batch", **kwargs):
        case = dict(label=label, kind=kind, operation=operation,
                    values=[1., 2., 3.], labels=["A", "B", "C"], value=-0.)
        case.update(kwargs)
        cases.append(case)

    for kind in KINDS:
        for position in [None, -2147483648, -4, -3, -1, 0, 2, 3, 2147483647]:
            add("direct optional and negative position", kind, "call", position=position)
        for value in [math.nan, math.inf, -math.inf, 0., -0., 1.5]:
            for operation in ["format_data", "format_data_short"]:
                add("data methods preserve prior locations and None position", kind, operation, value=value, callback="value")
        for values in [[], [0.], [0., -0., math.nan, math.inf, -math.inf], [3., 2., 1.], [1., 1., 1.], [-2., -1., 0.]]:
            add("complete raw array batch", kind, values=values, callback="value")
        for view in [(1, 2, 3), (5, -2, 3), (2, 0, 4), (0, 1, 0)]:
            add("borrowed strided reverse zero-stride or empty view", kind, "view", values=[99., 1., 99., 2., 99., 3.], view=list(view))
        for operation in ["call", "batch", "view", "format_data", "format_data_short"]:
            add("base adapter retains virtual dispatch", kind, operation, adapter=True, view=[0, 1, 3], position=-1)
    for position in [None, -2147483648, -1, 0, 2147483647]:
        add("empty sequence uses source negative indexing", "Fixed", "call", position=position, labels=[])
    for operation in ["call", "format_data", "format_data_short", "batch", "view"]:
        for failure in [None, 0, 1]:
            add("callback error has exact message and retained side effects", "Func", operation, fail_position=failure, view=[0, 1, 3], position=failure)
    for scenario in ["replace", "append", "replace_append", "clear", "append_error", "set_locs", "reentrant", "reentrant_caught", "reentrant_propagates", "rebind", "offset"]:
        add("live user program " + scenario, "Func", scenario=scenario, values=[10., 20.] if scenario.startswith("reentrant") else [1., 2., 3.])
    for view in [[1, 2, 3], [5, -2, 3], [2, 0, 4]]:
        add("user mutates future view element through owner", "Func", "view", view=view, values=[99., 1., 99., 2., 99., 3.], scenario="view_replace", callback="value")
    for kind in ["Null", "Fixed"]:
        add("actual full125001 batch has no locator prefix cap", kind, values=[0.], size=125001)

    code = '''// Complete original Formatter classes and real descriptor helper; callbacks are user fixtures.

///|
fn verify_basic_formatter_batch_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}

///|
fn basic_formatter_batch_position(position : Int32?) -> String {
  match position { None => "none"; Some(value) => "p" + value.to_string() }
}

///|
fn basic_formatter_batch_value(value : Double) -> String {
  if value.is_nan() { "nan" }
  else if value.is_inf() { if value < 0.0 { "negative infinity" } else { "positive infinity" } }
  else if value == 0.0 { if value.reinterpret_as_uint64() >> 63 == 1UL { "negative zero" } else { "zero" } }
  else { "finite" }
}
'''
    observations = []
    for index, case in enumerate(cases):
        observed = observe(namespace, case)
        observations.append(dict(case=case, original_source=observed))
        code += test_code(case, observed, index)
    minus = []
    for enabled in [False, True]:
        for value in ["", "-", "a-b--2−‐", "$-1$", "plain", "−"]:
            namespace["mpl"].rcParams["axes.unicode_minus"] = enabled
            expected = namespace["Formatter"].fix_minus(value)
            minus.append(dict(enabled=enabled, value=value, result=expected))
            code += '\n///|\ntest ' + moon('Basic formatter explicit minus ' + str(len(minus))) + ' {\n  let previous = @config.unicode_minus()\n  defer @config.set_unicode_minus(previous)\n  @config.set_unicode_minus(' + moon(enabled) + ')\n  assert_eq(BaseFormatter::fix_minus(' + moon(value) + '), ' + moon(expected) + ')\n}\n'
    namespace["mpl"].rcParams["axes.unicode_minus"] = True
    raw = []
    for position in [1., 3., math.nan, math.inf]:
        try:
            result = namespace["FixedFormatter"](["A", "B", "C"])(0., position)
            error = None
        except TypeError as failure:
            result, error = None, type(failure).__name__
        raw.append(dict(position=position, result=result, error=error, boundary="non-Int32 direct position; no Moon parity test"))
    raw.append(dict(result=namespace["FuncFormatter"](lambda value, position: None if position == 0 else 42).format_ticks([1., 2.]), boundary="non-String callback result; no coercion and no Moon parity test"))
    payload = dict(source_hashes=namespace["source_hashes"],
                   original_profile=dict(python=sys.version.split()[0], numpy=np.__version__),
                   algorithm="Complete original Formatter/NullFormatter/FixedFormatter/FuncFormatter AST; no copied formatter algorithm or numerical profile substitution. Callback fixtures are explicit user programs.",
                   typed_boundary="Double callbacks with optional Int32 position and String return; Array has live shape, native numeric view fixed shape/live data. No100000 formatter cap. Raw Python object/subclass/non-String/position protocols are evidence only.",
                   cases=observations, minus=minus, source_only=raw,
                   generated_count=len(observations) + len(minus))
    return clean(payload), formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    payload, code = generate(args.ticker)
    outputs = {ROOT / "testdata/basic_formatter_batch_reference.json": json.dumps(payload, indent=2, allow_nan=False) + "\n",
               ROOT / "ticker/basic_formatter_batch_reference_wbtest.mbt": code}
    for path, text in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(text)
    counts = collections.Counter(row["original_source"]["error"] or "success" for row in payload["cases"])
    print("Basic Formatter batch:", len(payload["cases"]), "original queries,", len(payload["minus"]), "minus cases,", payload["generated_count"], "generated tests;", dict(counts), ";", len(payload["source_only"]), "source-only observations")


if __name__ == "__main__":
    main()
