"""Observe pinned AutoMinorLocator parameter/provider state and rc validation.

The original AutoMinorLocator/Locator and original rc/cbook validators execute.
Fixtures supply axis getters, minimal rc storage and an external-warning sink;
this does not claim original renderer or warning-stacklevel integration.
"""
from pathlib import Path
import argparse
import ast
import copy
import hashlib
import json
import math
import sys
import types
import unicodedata
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_maxn_params_reference import load as load_base
from generate_multiple_locator_reference import clean, TICKER_SHA, RCSETUP_SHA, RC_SHA

ROOT = Path(__file__).resolve().parents[1]
CBOOK_SHA = "e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643"


def load(path):
    reference = load_base(path)
    cbook = path.with_name("cbook.py")
    if hashlib.sha256(cbook.read_bytes()).hexdigest() != CBOOK_SHA:
        raise ValueError("fixed cbook source differs")
    scope = {}
    node = next(n for n in ast.parse(cbook.read_text()).body
                if isinstance(n, ast.FunctionDef) and n.name == "_str_lower_equal")
    exec(compile(ast.Module(body=[node], type_ignores=[]), str(cbook), "exec"), scope)
    namespace = dict(cbook=types.SimpleNamespace(_str_lower_equal=scope["_str_lower_equal"]))
    rcsetup = path.with_name("rcsetup.py")
    tree = ast.parse(rcsetup.read_text())
    for name in ["_make_type_validator", "_validate_int_greaterequal0", "_validate_minor_tick_ndivs"]:
        node = next(n for n in tree.body if isinstance(n, ast.FunctionDef) and n.name == name)
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(rcsetup), "exec"), namespace)
        if name == "_make_type_validator":
            namespace["validate_int"] = namespace[name](int)
    reference["validate_ndivs"] = namespace["_validate_minor_tick_ndivs"]
    reference["external_warnings"] = []
    reference["_api"].warn_external = reference["external_warnings"].append
    reference["__name__"] = "matplotlib.ticker"
    node = next(n for n in ast.parse(path.read_text()).body
                if isinstance(n, ast.ClassDef) and n.name == "AutoMinorLocator")
    exec(compile(ast.Module(body=[node], type_ignores=[]), str(path), "exec"), reference)
    return reference


def typed(value):
    if value is None:
        return "None"
    if isinstance(value, str):
        return "@config.MinorTickDivisions::Text(" + moon(value) + ")"
    if isinstance(value, int):
        return "@config.MinorTickDivisions::Integer(@bigint.BigInt::from_string(" + moon(str(value)) + "))"
    return "@config.MinorTickDivisions::Number(" + moon(value) + ")"


def optional(value):
    return "None" if value is None else "Some(" + typed(value) + ")"


def assert_state(value, name="locator"):
    return "  verify_auto_minor_params_ndivs(" + name + ".ndivs(), " + optional(value) + ")\n"


def error_assert(expression):
    return ("  assert_true(try { ignore(" + expression + "); false } catch {"
            " @core.DataError::InvalidTicks(..) => true; _ => false })\n")


class Axis:
    def __init__(self, trace, scale="linear", name="x", majors=(0., 1.), view=(0., 1.), fail=None):
        self.trace, self.scale, self.name = trace, scale, name
        self.majors = np.array(majors)
        self.view, self.fail = view, fail

    def read(self, kind, value):
        self.trace.append(kind)
        if self.fail == kind:
            raise ValueError("fixture provider " + kind)
        return value

    def get_scale(self):
        return self.read("scale", self.scale)

    @property
    def axis_name(self):
        return self.read("name", self.name)

    def get_majorticklocs(self):
        return self.read("major", self.majors)

    def get_view_interval(self):
        return self.read("view", self.view)


def capture(reference, locator, fn=None):
    reference["external_warnings"].clear()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", RuntimeWarning)
        try:
            values = locator() if fn is None else fn()
            result = None if values is None else [float(v) for v in values]
            error = None
        except (ValueError, TypeError, AttributeError, OverflowError, NotImplementedError) as exc:
            result, error = None, type(exc).__name__
    return dict(values=result, error=error, ndivs=locator.ndivs,
                warnings=list(reference["external_warnings"]))


def axis_code(spec, trace="trace", name="locator"):
    scale, axis_name = spec.get("scale", "linear"), spec.get("name", "x")
    majors, view, fail = spec.get("majors", [0., 1.]), spec.get("view", [0., 1.]), spec.get("fail")
    code = ""
    for label, method, expr in [
        ("scale", "scale", moon(scale)), ("name", "axis_name", moon(axis_name)),
        ("major", "major_ticks", "@ticker.TickValues::from_array(" + moon([float(v) for v in majors]) + ")"),
        ("view", "view_interval", "(" + moon(float(view[0])) + ", " + moon(float(view[1])) + ")")]:
        result = ('raise @core.DataError::InvalidTicks(message="fixture provider ' + label + '")') if fail == label else expr
        effect = " raise @core.DataError" if fail == label else ""
        code += "  " + name + ".bind_" + method + "(fn()" + effect + " { " + trace + ".push(" + moon(label) + "); " + result + " })\n"
    return code


def observe_code(observation, trace, name="locator"):
    code = error_assert(name + ".call()") if observation["error"] else "  verify_auto_minor_params_values(" + name + ".call(), " + moon(observation["values"]) + ")\n"
    code += assert_state(observation["ndivs"], name)
    code += "  assert_eq(trace, " + moon(trace) + ")\n"
    code += "  assert_eq(" + name + ".warnings(), " + moon(observation["warnings"]) + ")\n"
    return code


def generate(path):
    reference = load(path)
    rc = reference["mpl"].rcParams
    code = '''// Generated pinned AutoMinor parameter/state/provider observations.

///|
fn verify_auto_minor_params_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}

///|
fn verify_auto_minor_params_ndivs(actual : @config.MinorTickDivisions?, expected : @config.MinorTickDivisions?) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(@config.MinorTickDivisions::Text(a)), Some(@config.MinorTickDivisions::Text(b))) => assert_eq(a, b)
    (Some(@config.MinorTickDivisions::Integer(a)), Some(@config.MinorTickDivisions::Integer(b))) => assert_eq(a, b)
    (Some(@config.MinorTickDivisions::Number(a)), Some(@config.MinorTickDivisions::Number(b))) => {
      if b.is_nan() { assert_true(a.is_nan()) }
      else { assert_eq(a.reinterpret_as_uint64(), b.reinterpret_as_uint64()) }
    }
    _ => fail("unexpected subdivision representation")
  }
}
'''
    config_code = '''// Generated original rc minor subdivision validator observations.

///|
fn verify_minor_tick_divisions(actual : @config.MinorTickDivisions, expected : @config.MinorTickDivisions) -> Unit raise {
  assert_eq(actual, expected)
}
'''
    numbers = [0., -0., .5, -.5, 1., -1., 2.5, -2.5, math.nextafter(1., 0.),
               math.nextafter(-1., 0.), float(2**53), math.nextafter(float(2**53), math.inf),
               float(2**63), 1e100, 1e308, sys.float_info.max, math.nan, math.inf, -math.inf]
    strings = ["auto", "AUTO", "Auto", "aUtO", " auto", "auto ", "", "2", "+2", "-0", "-1", "2.5", "2e1", "0x10",
               "1_000", "_2", "2_", "2__0", "+_2", " +1_2 ", "-0_0", "\x1c2", "\ufeff2", "1 2", "++2", "²",
               "9007199254740993", "1" + "0"*308, "1" + "0"*309,
               "0"*4300, "0"*4301]
    zeroes = [i for i in range(0x110000) if unicodedata.category(chr(i)) == "Nd" and unicodedata.decimal(chr(i)) == 0]
    strings += [chr(z+1) + "_" + chr(z+2) for z in zeroes]
    strings += [c + "+2" + c for c in ["\t", "\n", "\v", "\f", "\r", " ", "\x85", "\xa0", "\u1680", "\u2000", "\u200a", "\u2028", "\u2029", "\u202f", "\u205f", "\u3000"]]
    validators = []
    for index, value in enumerate(numbers + strings + [2**53+1, 10**400, -1]):
        try:
            expected, error = reference["validate_ndivs"](value), None
        except (ValueError, TypeError, OverflowError, RuntimeError) as exc:
            expected, error = None, type(exc).__name__
        config_code += "\n///|\ntest " + moon("minor ndivs original rc validator " + str(index)) + " {\n"
        config_code += "  let previous_x = @config.minor_tick_divisions()\n  let previous_y = @config.minor_tick_divisions(horizontal=false)\n  defer @config.set_minor_tick_divisions(previous_x)\n  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)\n"
        config_code += "  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))\n  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(8.0), horizontal=false)\n  let before = @config.rc_params()\n"
        expr = "@config.set_minor_tick_divisions(" + typed(value) + ")"
        config_code += error_assert(expr) if error else "  " + expr + "\n"
        result = 7 if error else expected
        config_code += "  verify_minor_tick_divisions(@config.minor_tick_divisions(), " + typed(result) + ")\n"
        config_code += "  verify_minor_tick_divisions(@config.minor_tick_divisions(horizontal=false), " + typed(8) + ")\n"
        config_code += "  verify_minor_tick_divisions(before.minor_tick_divisions(), " + typed(7) + ")\n}\n"
        validators.append(dict(input=value, output=expected, source_error=error))

    constructors = [None, "auto", "AUTO", "2", "bad", 0., -0., -1., 2.5, math.nan, math.inf, -math.inf, 2**53+1, 10**400]
    for index, value in enumerate(constructors):
        locator = reference["AutoMinorLocator"](value)
        code += "\n///|\ntest " + moon("AutoMinor original unchecked constructor " + str(index)) + " {\n"
        code += "  let locator = @ticker.AutoMinorLocator::new(ndivs=" + optional(value) + ")\n"
        code += assert_state(locator.ndivs) + "  assert_eq(locator.warnings(), [])\n"
        code += error_assert("locator.tick_values(0.0 / 0.0, 1.0 / 0.0)")
        code += "  assert_true(locator.scale_provider() is None)\n  assert_true(locator.axis_name_provider() is None)\n  assert_true(locator.major_ticks_provider() is None)\n  assert_true(locator.view_interval_provider() is None)\n}\n"

    specs = [
        dict(label="log before all other providers", scale="log"),
        dict(label="one major before axis name", majors=[1.]),
        dict(label="duplicate major before axis name", majors=[1., 1.]),
        dict(label="NaN unique one before axis name", majors=[math.nan, math.nan]),
        dict(label="capture x float rc truncation", rc=2.5),
        dict(label="capture y rc", name="y", rc=3.),
        dict(label="z uses x rc", name="z", rc=2.),
        dict(label="uppercase Y uses x rc", name="Y", rc=2.),
        dict(label="uppercase auto captured before failure", rc="AUTO"),
        dict(label="capture remains after view failure", fail="view", rc=2.),
        dict(label="scale provider failure", fail="scale"),
        dict(label="major provider failure", fail="major"),
        dict(label="axis name provider failure", fail="name"),
        dict(label="explicit skips axis name failure", fail="name", ndivs=2.),
        dict(label="explicit uppercase fails before view", ndivs="AUTO", fail="view"),
        dict(label="NaN step capture before round failure", majors=[0., math.nan]),
        dict(label="explicit fractional constructor", ndivs=2.5),
        dict(label="negative division still reads view", ndivs=-1., view=[.1, .4]),
        dict(label="zero division still reads view", ndivs=0.),
        dict(label="nonlog scale continues", scale="symlog", majors=[-1., 1.]),
        dict(label="huge rc integer point view", rc=str(10**400), view=[0., 0.]),
        dict(label="rc finite huge float becomes integer", rc=1e308, view=[0., 0.]),
        dict(label="rc largest finite float becomes integer", rc=sys.float_info.max, view=[0., 0.]),
        dict(label="rc integer above max float rounds finite", rc=str(int(sys.float_info.max)+1), view=[0., 0.]),
        dict(label="rc integer float conversion overflows", rc=str(10**309), view=[0., 0.]),
        dict(label="constructor finite huge float remains float", ndivs=1e308, view=[0., 0.]),
        dict(label="constructor largest finite float remains float", ndivs=sys.float_info.max, view=[0., 0.]),
    ]
    observations = []
    for spec in specs:
        rc["xtick.minor.ndivs"] = reference["validate_ndivs"](spec.get("rc", "auto"))
        rc["ytick.minor.ndivs"] = reference["validate_ndivs"](spec.get("rc", "auto"))
        trace = []
        axis = Axis(trace, spec.get("scale", "linear"), spec.get("name", "x"), spec.get("majors", [0., 1.]), spec.get("view", [0., 1.]), spec.get("fail"))
        locator = reference["AutoMinorLocator"](spec.get("ndivs"))
        locator.set_axis(axis)
        observation = capture(reference, locator)
        code += "\n///|\ntest " + moon("AutoMinor original provider order " + spec["label"]) + " {\n"
        code += "  let old_x = @config.minor_tick_divisions()\n  let old_y = @config.minor_tick_divisions(horizontal=false)\n  defer @config.set_minor_tick_divisions(old_x)\n  defer @config.set_minor_tick_divisions(old_y, horizontal=false)\n"
        code += "  @config.set_minor_tick_divisions(" + typed(spec.get("rc", "auto")) + ")\n  @config.set_minor_tick_divisions(" + typed(spec.get("rc", "auto")) + ", horizontal=false)\n"
        code += "  let trace : Array[String] = []\n  let locator = @ticker.AutoMinorLocator::new(ndivs=" + optional(spec.get("ndivs")) + ")\n"
        code += axis_code(spec) + observe_code(observation, trace) + "}\n"
        observations.append(dict(spec=spec, trace=trace, **observation))

    # Capturing/reset/rebinding across original shallow copies; every result uses original call.
    trace = []
    locator = reference["AutoMinorLocator"]()
    x = Axis(trace)
    locator.set_axis(x)
    shallow = copy.copy(locator)
    stages = []
    rc["xtick.minor.ndivs"] = 2
    stages.append(capture(reference, locator))
    rc["xtick.minor.ndivs"] = 4
    stages.append(capture(reference, shallow))
    y = Axis(trace, name="y")
    rc["ytick.minor.ndivs"] = 3
    locator.set_axis(y)
    stages.append(capture(reference, locator))
    locator.ndivs = None
    stages.append(capture(reference, locator))
    stages.append(capture(reference, shallow))
    code += '\n///|\ntest "AutoMinor original capture reset shallow copy and owner rebind" {\n'
    code += "  let old_x = @config.minor_tick_divisions()\n  let old_y = @config.minor_tick_divisions(horizontal=false)\n  defer @config.set_minor_tick_divisions(old_x)\n  defer @config.set_minor_tick_divisions(old_y, horizontal=false)\n  let trace : Array[String] = []\n  let locator = @ticker.AutoMinorLocator::new()\n"
    code += axis_code({}) + "  let shallow = locator.copy()\n"
    code += "  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(2.0))\n"
    code += "  verify_auto_minor_params_values(locator.call(), " + moon(stages[0]["values"]) + ")\n" + assert_state(stages[0]["ndivs"])
    code += "  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(4.0))\n"
    code += "  verify_auto_minor_params_values(shallow.call(), " + moon(stages[1]["values"]) + ")\n" + assert_state(stages[1]["ndivs"], "shallow")
    code += "  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(3.0), horizontal=false)\n"
    code += axis_code(dict(name="y"))
    for index, expression in [(2,"locator.call()"),(3,"locator.call()"),(4,"shallow.call()")]:
        if index == 3:
            code += "  locator.set_ndivs(None)\n"
        code += "  verify_auto_minor_params_values(" + expression + ", " + moon(stages[index]["values"]) + ")\n"
        code += assert_state(stages[index]["ndivs"], "shallow" if index == 4 else "locator")
    code += "}\n"

    # Original warning strings and no-op updates, plus typed independent diagnostic snapshots.
    locator = reference["AutoMinorLocator"](2.)
    observation = capture(reference, locator, lambda: locator.set_params(n=5))
    code += '\n///|\ntest "AutoMinor inherited set params warning no-op and diagnostic copies" {\n  let locator = @ticker.AutoMinorLocator::new(ndivs=Some(@config.MinorTickDivisions::Number(2.0)))\n  locator.set_params()\n'
    code += assert_state(locator.ndivs) + "  assert_eq(locator.warnings(), " + moon(observation["warnings"]) + ")\n"
    code += "  let saved = locator.warnings()\n  saved.clear()\n  assert_eq(locator.warnings(), " + moon(observation["warnings"]) + ")\n  let shallow = locator.copy()\n"
    code += "  locator.bind_scale(fn() { \"log\" })\n  assert_eq(locator.call(), [])\n  assert_eq(locator.warnings(), [\"AutoMinorLocator does not work on logarithmic scales\"])\n"
    code += "  assert_eq(shallow.warnings(), " + moon(observation["warnings"]) + ")\n"
    code += "  locator.bind_scale(fn() { \"linear\" })\n  locator.bind_major_ticks(fn() { @ticker.TickValues::from_array([1.0]) })\n  assert_eq(locator.call(), [])\n  assert_eq(locator.warnings(), [])\n}\n"

    payload = dict(source="Matplotlib v3.11.2", ticker_sha256=TICKER_SHA, rcsetup_sha256=RCSETUP_SHA,
                   cbook_sha256=CBOOK_SHA, matplotlibrc_sha256=RC_SHA, python=sys.version.split()[0], numpy=np.__version__,
                   unicode=unicodedata.unidata_version,
                   scope="Original AutoMinor/Locator and rc validators; axis getter fixtures and external-warning sink; logger host routing, arbitrary dynamic Python values and mutable Python int-string limits are explicit boundaries. Fixed decimal conversion limit is 4300.",
                   rc_validation=validators, unchecked_constructors=constructors,
                   provider_observations=observations, capture_copy_stages=stages, warning_noop=observation)
    return json.dumps(clean(payload), indent=2, allow_nan=False) + "\n", formatted(code), formatted(config_code)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    outputs = generate(args.ticker)
    paths = [ROOT / "testdata/auto_minor_params_reference.json", ROOT / "ticker/auto_minor_params_reference_test.mbt", ROOT / "config/auto_minor_params_reference_test.mbt"]
    for path, content in zip(paths, outputs):
        if args.check:
            if not path.exists() or path.read_text() != content:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(content)
    payload = json.loads(outputs[0])
    print("AutoMinor params reference:", len(payload["rc_validation"]), "rc validators,", len(payload["unchecked_constructors"]), "constructors,", len(payload["provider_observations"]), "provider cases,", len(payload["capture_copy_stages"]), "copy stages")


if __name__ == "__main__":
    main()
