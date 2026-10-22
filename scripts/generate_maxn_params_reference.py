"""Execute pinned MaxNLocator parameter, validation and ndarray-alias bodies.

Only the typed Int32/Bool/String/one-dimensional binary64 domain is mapped.
Dynamic Python coercion, multidimensional arrays and arbitrary dtype promotion
remain explicit domain boundaries; no source validation helper is replaced.
"""
from pathlib import Path
import argparse
import ast
import copy
import difflib
import hashlib
import json
import logging
import math
import sys
import types
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_multiple_locator_reference import TICKER_SHA, TRANSFORMS_SHA, RC_SHA, RCSETUP_SHA, clean
from generate_fixed_locator_reference import API_SHA

ROOT = Path(__file__).resolve().parents[1]


def load(path):
    if sys.version_info[:3] != (3, 12, 14) or np.__version__ != "2.3.5":
        raise ValueError("fixed CPython 3.12.14 / NumPy 2.3.5 required")
    api = path.parent / "_api/__init__.py"
    transforms = path.with_name("transforms.py")
    for source, expected in [(path, TICKER_SHA), (api, API_SHA), (transforms, TRANSFORMS_SHA),
                             (path.parent / "mpl-data/matplotlibrc", RC_SHA), (path.with_name("rcsetup.py"), RCSETUP_SHA)]:
        if hashlib.sha256(source.read_bytes()).hexdigest() != expected:
            raise ValueError("fixed source differs: " + str(source))
    namespace = dict(np=np, math=math, difflib=difflib, _log=logging.getLogger("maxn-params-reference"),
                     mpl=types.SimpleNamespace(rcParams={"axes.autolimit_mode": "data", "_internal.classic_mode": False}))
    api_tree = ast.parse(api.read_text())
    for name in ["list_suggestion_error_msg", "check_in_list", "kwarg_error"]:
        node = next(node for node in api_tree.body if isinstance(node, ast.FunctionDef) and node.name == name)
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(api), "exec"), namespace)
    namespace["_api"] = types.SimpleNamespace(**{name: namespace[name] for name in ["check_in_list", "kwarg_error"]})
    nonsingular = next(node for node in ast.parse(transforms.read_text()).body
                       if isinstance(node, ast.FunctionDef) and node.name == "_nonsingular")
    exec(compile(ast.Module(body=[nonsingular], type_ignores=[]), str(transforms), "exec"), namespace)
    namespace["mtransforms"] = types.SimpleNamespace(_nonsingular=namespace["_nonsingular"])
    tree = ast.parse(path.read_text())
    for name in ["_DummyAxis", "TickHelper", "Locator", "scale_range", "_Edge_integer", "MaxNLocator"]:
        node = next(node for node in tree.body if isinstance(node, (ast.ClassDef, ast.FunctionDef)) and node.name == name)
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(path), "exec"), namespace)
    namespace["_log"].disabled = True
    return namespace


def snapshot(locator):
    return dict(nbins=locator._nbins, integer=bool(locator._integer), symmetric=bool(locator._symmetric),
                prune=locator._prune, min_n_ticks=int(locator._min_n_ticks),
                steps=[float(value) for value in locator._steps],
                extended_steps=[float(value) for value in locator._extended_steps])


def bins(value):
    return "@ticker.MaxNBins::Auto" if value == "auto" else "@ticker.MaxNBins::Count(" + str(value) + ")"


def option_string(value):
    return "None" if value is None else "Some(" + moon(value) + ")"


def state_assert(state, name="locator"):
    return ("  verify_maxn_params_state(" + name + ", " + bins(state["nbins"]) + ", "
            + moon(state["integer"]) + ", " + moon(state["symmetric"]) + ", "
            + option_string(state["prune"]) + ", " + str(state["min_n_ticks"]) + ", "
            + moon(state["steps"]) + ", " + moon(state["extended_steps"]) + ")\n")


def error_assert(expression):
    return ("  assert_true(try { ignore(" + expression + "); false } catch {"
            " @core.DataError::InvalidTicks(..) => true; _ => false })\n")


def expression(params, constructor=False):
    args = []
    for key, value in params.items():
        if key == "nbins":
            if value is not None:
                args.append("nbins=" + bins(value))
        elif key == "steps":
            if constructor:
                if value is not None:
                    args.append("steps=@ticker.TickValues::from_array(" + moon(value) + ")")
            else:
                args.append("steps=None" if value is None else "steps=Some(@ticker.TickValues::from_array(" + moon(value) + "))")
        elif key == "prune":
            if constructor:
                if value is not None:
                    args.append("prune=" + moon(value))
            else:
                args.append("prune=" + option_string(value))
        else:
            args.append(key + "=" + moon(value))
    return ", ".join(args)


def call(function):
    try:
        return function(), None
    except (ValueError, TypeError, IndexError, OverflowError) as exc:
        return None, type(exc).__name__


def pyparams(params):
    return {key: np.array(value, dtype=np.float64) if key == "steps" and value is not None else value
            for key, value in params.items()}


def source_view(values, start, stride, length):
    start = start + len(values) if start < 0 else start
    if stride == 0:
        return np.lib.stride_tricks.as_strided(values[start:], shape=(length,), strides=(0,), writeable=True)
    if length == 0:
        return values[start:start]
    stop = start + stride * length
    return values[start:None if stride < 0 and stop < 0 else stop:stride]


def aliases(reference):
    specs = [
        ("borrowed contiguous", [1., 2., 5., 10.], []),
        ("borrowed signed", [10., 5., 2., 1.], [(-1, -1, 4)]),
        ("borrowed nested", [10., 0., 5., 0., 2., 0., 1.], [(0, 1, 7), (6, -2, 4)]),
        ("borrowed NaN interior", [1., math.nan, 10.], []),
        ("prepend copy", [2., 4., 10.], []),
        ("append copy", [1., 2., 8.], []),
        ("prepend append copy", [2., 4., 8.], []),
        ("strided normalized copy", [0., 2., 99., 4., 99., 8.], [(1, 2, 3)]),
        ("zero stride NaN copy", [math.nan], [(0, 0, 3)]),
        ("zero stride single append copy", [1.], [(0, 0, 1)]),
    ]
    rows = []
    code = ""
    for label, initial, slices in specs:
        owner = np.array(initial, dtype=np.float64)
        selected = owner
        indices = np.arange(len(owner))
        for start, stride, length in slices:
            selected = source_view(selected, start, stride, length)
            indices = source_view(indices, start, stride, length)
        locator = reference["MaxNLocator"](steps=selected)
        shallow = copy.copy(locator)
        borrowed = bool(np.shares_memory(locator._steps, owner))
        stages = [dict(stage="initial", owner=owner.tolist(), state=snapshot(locator))]
        owner[int(indices[0])] = 1.125
        stages.append(dict(stage="caller modifies owner", owner=owner.tolist(), state=snapshot(locator)))
        locator._steps[-1] = 9.
        stages.append(dict(stage="step getter modifies its buffer", owner=owner.tolist(),
                           state=snapshot(locator), copy=snapshot(shallow)))
        shallow.set_params(steps=None, integer=True)
        stages.append(dict(stage="copy replaces step storage", owner=owner.tolist(),
                           state=snapshot(locator), copy=snapshot(shallow)))
        code += "\n///|\ntest " + moon("MaxN original step alias " + label) + " {\n"
        code += "  let owner = " + moon(initial) + "\n"
        source = "@ticker.TickValues::from_array(owner)"
        for start, stride, length in slices:
            source += ".view(" + str(start) + ", " + str(stride) + ", " + str(length) + ")"
        code += "  let selected = " + source + "\n  let locator = @ticker.MaxNLocator::new(steps=selected)\n  let shallow = locator.copy()\n"
        code += state_assert(stages[0]["state"])
        code += "  owner[" + str(int(indices[0])) + "] = 1.125\n" + state_assert(stages[1]["state"])
        code += "  locator.steps().set(-1, 9.0)\n"
        code += "  verify_maxn_params_values(owner, " + moon(stages[2]["owner"]) + ")\n"
        code += state_assert(stages[2]["state"]) + state_assert(stages[2]["copy"], "shallow")
        code += "  shallow.set_params(steps=None, integer=true)\n"
        code += state_assert(stages[3]["state"]) + state_assert(stages[3]["copy"], "shallow") + "}\n"
        rows.append(dict(label=label, initial=initial, slices=slices, steps_borrowed=borrowed, stages=stages))
    return rows, code


def generate(path):
    reference = load(path)
    code = """// Generated original MaxNLocator state, validation and ndarray alias observations.

///|
fn verify_maxn_params_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}

///|
fn verify_maxn_params_state(locator : @ticker.MaxNLocator, nbins : @ticker.MaxNBins, integer : Bool, symmetric : Bool, prune : String?, min_n_ticks : Int32, steps : Array[Double], extended : Array[Double]) -> Unit raise {
  assert_eq(locator.nbins(), nbins)
  assert_eq(locator.integer(), integer)
  assert_eq(locator.symmetric(), symmetric)
  assert_eq(locator.prune(), prune)
  assert_eq(locator.min_n_ticks(), min_n_ticks)
  verify_maxn_params_values(locator.steps().to_array(), steps)
  verify_maxn_params_values(locator.extended_steps(), extended)
}
"""
    constructors = []
    for nbins in [None, "auto", -2147483648, -1, 0, 1, 10, 2147483647]:
        for minimum in [-2147483648, 0, 1, 2, 12, 2147483647]:
            index = len(constructors)
            params = dict(nbins=nbins, min_n_ticks=minimum, integer=index % 2 == 0,
                          symmetric=index % 3 == 0, prune=[None, "lower", "upper", "both"][index % 4])
            locator = reference["MaxNLocator"](**params)
            state = snapshot(locator)
            code += "\n///|\ntest " + moon("MaxN original constructor state " + str(index)) + " {\n"
            code += "  let locator = @ticker.MaxNLocator::new(" + expression(params, True) + ")\n" + state_assert(state) + "}\n"
            constructors.append(dict(parameters=params, state=state, source_error=None))
    for prune in ["", "invalid", "LOWER"]:
        params = dict(prune=prune)
        _, error = call(lambda: reference["MaxNLocator"](**params))
        if error is None:
            raise ValueError("expected original prune rejection")
        code += "\n///|\ntest " + moon("MaxN original constructor invalid prune " + repr(prune)) + " {\n"
        code += error_assert("@ticker.MaxNLocator::new(" + expression(params, True) + ")") + "}\n"
        constructors.append(dict(parameters=params, source_error=error))

    step_inputs = [[], [1.], [10.], [2.], [2., 4., 8.], [1., 2., 10.],
                   [1., 1.5, 2., 2.5, 3., 4., 5., 6., 8., 10.],
                   [0., 2., 10.], [1., 2., 11.], [1., 2., 2., 10.], [10., 1.],
                   [math.nan], [1., math.nan, 10.], [math.nan, 5., math.nan],
                   [1., math.nan, -math.inf, math.nan, 10.], [1., math.nan, math.inf, math.nan, 10.],
                   [1., -0., 10.], [1., math.nextafter(1., math.inf), 10.],
                   [1., 5e-324, 10.], [1., 9.999999999999998, 10.]]
    step_rows = []
    for values in step_inputs:
        for stage in ["constructor", "set_params"]:
            index = len(step_rows)
            code += "\n///|\ntest " + moon("MaxN original step validation " + str(index) + " " + stage) + " {\n"
            if stage == "constructor":
                params = dict(steps=values)
                locator, error = call(lambda: reference["MaxNLocator"](**pyparams(params)))
                expr = "@ticker.MaxNLocator::new(" + expression(params, True) + ")"
                if error:
                    code += error_assert(expr)
                else:
                    code += "  let locator = " + expr + "\n" + state_assert(snapshot(locator))
            else:
                locator = reference["MaxNLocator"](nbins=3, prune="lower")
                code += "  let locator = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Count(3), prune=\"lower\")\n"
                params = dict(nbins=4, symmetric=True, prune="upper", min_n_ticks=5, steps=values, integer=True)
                _, error = call(lambda: locator.set_params(**pyparams(params)))
                expr = "locator.set_params(" + expression(params) + ")"
                code += error_assert(expr) if error else "  " + expr + "\n"
                code += state_assert(snapshot(locator))
            code += "}\n"
            step_rows.append(dict(stage=stage, input=values, source_error=error,
                                  state=None if locator is None else snapshot(locator)))

    updates = [{}, dict(nbins="auto"), dict(nbins=0), dict(min_n_ticks=-9),
               dict(steps=None), dict(prune=None),
               dict(nbins=7, symmetric=True, prune="bad", min_n_ticks=9, steps=[1., 5., 10.], integer=True),
               dict(nbins=9, symmetric=False, prune="both", min_n_ticks=5, steps=[], integer=True),
               dict(steps=[2., 4., 8.], min_n_ticks=3, integer=True),
               dict(integer=False, prune=None), dict(steps=None, prune="lower"),
               dict(steps=[1., math.nan, 10.], integer=True)]
    locator = reference["MaxNLocator"](steps=np.array([1., 2., 10.]), prune="upper")
    sequence = []
    code += "\n///|\ntest \"MaxN original ordered updates explicit resets and partial failures\" {\n"
    code += "  let locator = @ticker.MaxNLocator::new(steps=@ticker.TickValues::from_array([1.0,2.0,10.0]), prune=\"upper\")\n"
    for params in updates:
        _, error = call(lambda: locator.set_params(**pyparams(params)))
        expr = "locator.set_params(" + expression(params) + ")"
        code += error_assert(expr) if error else "  " + expr + "\n"
        state = snapshot(locator)
        code += state_assert(state)
        sequence.append(dict(parameters=params, source_error=error, state=state))
    code += "}\n"
    alias_rows, alias_code = aliases(reference)
    code += alias_code

    axis_a = types.SimpleNamespace(space=5., bounds=(0., 1.))
    axis_a.get_tick_space = lambda: axis_a.space
    axis_a.get_view_interval = lambda: axis_a.bounds
    axis_b = types.SimpleNamespace(get_tick_space=lambda: 3., get_view_interval=lambda: (-2., 4.))
    locator = reference["MaxNLocator"](); locator.set_axis(axis_a); shallow = copy.copy(locator)
    provider_rows = [dict(stage="initial shared binding", original=[locator.axis.get_tick_space(), list(locator.axis.get_view_interval())], copy=[shallow.axis.get_tick_space(), list(shallow.axis.get_view_interval())])]
    axis_a.space = 7.; axis_a.bounds = (1., 5.)
    provider_rows.append(dict(stage="live provider mutation", original=[locator.axis.get_tick_space(), list(locator.axis.get_view_interval())], copy=[shallow.axis.get_tick_space(), list(shallow.axis.get_view_interval())]))
    shallow.set_axis(axis_b)
    provider_rows.append(dict(stage="copy rebind independent", original=[locator.axis.get_tick_space(), list(locator.axis.get_view_interval())], copy=[shallow.axis.get_tick_space(), list(shallow.axis.get_view_interval())]))
    code += """
///|
test "MaxN original shallow binding live context and independent copy rebind" {
  let space = Ref(5.0)
  let bounds = Ref((0.0, 1.0))
  let locator = @ticker.MaxNLocator::new()
  locator.bind_tick_space(() => space.val)
  locator.bind_view_interval(() => bounds.val)
  let shallow = locator.copy()
"""
    for index, stage in enumerate(provider_rows):
        if index == 1:
            code += "  space.val = 7.0\n  bounds.val = (1.0, 5.0)\n"
        if index == 2:
            code += "  shallow.bind_tick_space(() => 3.0)\n  shallow.bind_view_interval(() => (-2.0, 4.0))\n"
        for name, expected in [("locator", stage["original"]), ("shallow", stage["copy"])]:
            code += "  assert_eq((" + name + ".tick_space_provider().unwrap())(), " + moon(expected[0]) + ")\n"
            code += "  let view_" + name + "_" + str(index) + " = (" + name + ".view_interval_provider().unwrap())()\n"
            code += "  verify_maxn_params_values([view_" + name + "_" + str(index) + ".0, view_" + name + "_" + str(index) + ".1], " + moon(expected[1]) + ")\n"
    code += "}\n"
    payload = dict(ticker_source_sha256=TICKER_SHA, transforms_source_sha256=TRANSFORMS_SHA,
                   api_source_sha256=API_SHA, matplotlibrc_sha256=RC_SHA, rcsetup_sha256=RCSETUP_SHA,
                   python=sys.version.split()[0], numpy=np.__version__,
                   ast_source_bodies=["MaxNLocator", "TickHelper", "Locator", "_Edge_integer", "scale_range", "_api.check_in_list", "_api.list_suggestion_error_msg", "_api.kwarg_error"],
                   typed_domain="Int32 nbins/min_n_ticks, Bool flags, String/None prune, binary64 one-dimensional TickValues; dynamic coercion/multidimensional/dtype behavior not claimed",
                   constructors=constructors, steps=step_rows, parameter_updates=sequence,
                   alias_cases=alias_rows, provider_stages=provider_rows)
    return clean(payload), formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", RuntimeWarning)
        payload, code = generate(args.ticker)
    for path, text in {ROOT / "testdata/maxn_params_reference.json": json.dumps(payload, indent=2, allow_nan=False) + "\n",
                       ROOT / "ticker/maxn_params_reference_test.mbt": code}.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(text)
    observations = len(payload["constructors"]) + len(payload["steps"]) + len(payload["parameter_updates"]) + sum(len(case["stages"]) for case in payload["alias_cases"]) + len(payload["provider_stages"])
    print("MaxN parameters reference:", len(payload["constructors"]), "constructors,", len(payload["steps"]),
          "step validations,", len(payload["parameter_updates"]), "updates,", len(payload["alias_cases"]),
          "alias cases,", len(payload["provider_stages"]), "provider stages,", observations, "observations")


if __name__ == "__main__":
    main()
