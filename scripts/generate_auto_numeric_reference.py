"""Execute complete pinned AutoLocator/MaxNLocator source with real validators.

Axis callbacks supply controlled tick space and view intervals. All selection,
rounding, pruning, parameter updates and error observations execute the original
AST bodies; NumPy is the fixed development runtime, never a port oracle.
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

ROOT = Path(__file__).resolve().parents[1]
HASHES = {
    "ticker.py": "49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad",
    "transforms.py": "109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8",
    "_api/__init__.py": "7e262cedd8ce1a1660c2e2caa63adeb078c29e36bd541b8e6f773cfed4c3c782",
}


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
        raise ValueError("fixed CPython3.12.14 / NumPy2.3.5 required")
    parsed = {}
    for name, sha in HASHES.items():
        source = path.parent / name
        if hashlib.sha256(source.read_bytes()).hexdigest() != sha:
            raise ValueError("pinned source differs: " + str(source))
        parsed[name] = ast.parse(source.read_text()).body
    namespace = dict(np=np, math=math, difflib=difflib, _log=logging.getLogger("auto-numeric-reference"),
                     mpl=types.SimpleNamespace(rcParams={"_internal.classic_mode": False, "axes.autolimit_mode": "data"}))

    def run(node, filename):
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(path.parent / filename), "exec"), namespace)

    for name in ["check_in_list", "list_suggestion_error_msg"]:
        run(next(node for node in parsed["_api/__init__.py"] if isinstance(node, ast.FunctionDef) and node.name == name), "_api/__init__.py")
    namespace["_api"] = types.SimpleNamespace(check_in_list=namespace["check_in_list"])
    run(next(node for node in parsed["transforms.py"] if isinstance(node, ast.FunctionDef) and node.name == "_nonsingular"), "transforms.py")
    namespace["mtransforms"] = types.SimpleNamespace(_nonsingular=namespace["_nonsingular"])
    classes = {node.name: node for node in parsed["ticker.py"] if isinstance(node, ast.ClassDef)}
    helper = copy.deepcopy(classes["TickHelper"])
    helper.body = [node for node in helper.body if isinstance(node, ast.Assign) or isinstance(node, ast.FunctionDef) and node.name == "set_axis"]
    run(helper, "ticker.py")
    locator = copy.deepcopy(classes["Locator"])
    locator.body = [node for node in locator.body if isinstance(node, ast.Assign) or
                    isinstance(node, ast.FunctionDef) and node.name in {"raise_if_exceeds", "nonsingular"}]
    run(locator, "ticker.py")
    run(next(node for node in parsed["ticker.py"] if isinstance(node, ast.FunctionDef) and node.name == "scale_range"), "ticker.py")
    for name in ["_Edge_integer", "MaxNLocator", "AutoLocator"]:
        run(classes[name], "ticker.py")
    namespace["_log"].disabled = True
    return namespace


class Axis:
    axes = types.SimpleNamespace(name="rectilinear")

    def __init__(self, space=4., view=(0., 1.)):
        self.space, self.view = space, view
        self.space_reads = self.view_reads = 0

    def get_tick_space(self):
        self.space_reads += 1
        return self.space

    def get_view_interval(self):
        self.view_reads += 1
        return self.view


def observe(call, axis=None):
    if axis is not None:
        axis.space_reads = axis.view_reads = 0
    try:
        values = call()
        result = dict(values=[float(v) for v in values], source_error=None)
    except (ValueError, ZeroDivisionError, OverflowError, IndexError, AttributeError) as exc:
        result = dict(values=None, source_error=type(exc).__name__)
    result.update(space_reads=0 if axis is None else axis.space_reads,
                  view_reads=0 if axis is None else axis.view_reads)
    return result


def state(locator):
    return dict(nbins=locator._nbins, steps=[float(v) for v in locator._steps],
                extended_steps=[float(v) for v in locator._extended_steps], integer=bool(locator._integer),
                symmetric=bool(locator._symmetric), prune=locator._prune, min_n_ticks=int(locator._min_n_ticks))


def state_checks(value, variable="locator"):
    nbins = "@ticker.MaxNBins::Auto" if value["nbins"] == "auto" else "@ticker.MaxNBins::Count(" + str(value["nbins"]) + ")"
    code = "  assert_eq(" + variable + ".nbins(), " + nbins + ")\n"
    for key in ["steps", "extended_steps"]:
        expression = variable + "." + key + "()" + (".to_array()" if key == "steps" else "")
        code += "  verify_auto_numeric_values(" + expression + ", " + moon(value[key]) + ")\n"
    for key in ["integer", "symmetric", "min_n_ticks"]:
        code += "  assert_eq(" + variable + "." + key + "(), " + moon(value[key]) + ")\n"
    prune = "None" if value["prune"] is None else "Some(" + moon(value["prune"]) + ")"
    return code + "  assert_eq(" + variable + ".prune(), " + prune + ")\n"


def expect(expression, result, pair=False):
    code = "  space_reads[0] = 0\n  view_reads[0] = 0\n"
    if result["source_error"]:
        code += "  assert_true(try { ignore(" + expression + "); false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })\n"
    elif pair:
        code += "  let pair = " + expression + "\n  verify_auto_numeric_values([pair.0, pair.1], " + moon(result["values"]) + ")\n"
    else:
        code += "  verify_auto_numeric_values(" + expression + ", " + moon(result["values"]) + ")\n"
    return code + "  assert_eq(space_reads[0], " + str(result["space_reads"]) + ")\n  assert_eq(view_reads[0], " + str(result["view_reads"]) + ")\n"


def preamble(classic):
    return """  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer { @config.set_classic_mode(previous_classic); try! @config.set_axes_autolimit_mode(previous_mode) }
  @config.set_classic_mode(""" + moon(classic) + """ )
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(""" + moon(not classic) + """ )
  let space_reads = [0]
  let view_reads = [0]
"""


def bind_code(space, view, variable="locator", state_name="binding"):
    return "  let " + state_name + "_space = [" + moon(space) + "]\n  let " + state_name + "_view = " + moon(list(view)) + "\n" + \
        "  " + variable + ".bind_tick_space(fn() { space_reads[0] += 1; " + state_name + "_space[0] })\n" + \
        "  " + variable + ".bind_view_interval(fn() { view_reads[0] += 1; (" + state_name + "_view[0], " + state_name + "_view[1]) })\n"


def parameters(arguments):
    code = []
    for key, value in arguments.items():
        if key == "nbins":
            text = "@ticker.MaxNBins::Auto" if value == "auto" else "@ticker.MaxNBins::Count(" + str(value) + ")"
        elif key == "steps":
            text = "None" if value is None else "Some(@ticker.TickValues::from_array(" + moon(value) + "))"
        elif key == "prune":
            text = "None" if value is None else "Some(" + moon(value) + ")"
        else:
            text = moon(value)
        code.append(key + "=" + text)
    return ", ".join(code)


def generate(path):
    source = load(path)
    constructor = source["AutoLocator"]
    rc = source["mpl"].rcParams
    code = """// Generated from complete fixed AutoLocator/MaxNLocator source and real _api validation.

///|
fn verify_auto_numeric_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}
"""
    rows = []
    ranges = [(0., 1.), (-3.7, 14.2), (1e10, 1e10 + 1.), (2., 2.),
              (-1e-290, 1e-290), (1e150, 1e150 + 1e136), (math.nan, 1.)]
    spaces = [None, -math.inf, -3., 0., 1., 2.5, 4., 9., 20., math.inf, math.nan]
    for classic in [False, True]:
        for space in spaces:
            for lower, upper in ranges:
                for mode in ["data", "round_numbers"]:
                    rc["_internal.classic_mode"] = classic
                    rc["axes.autolimit_mode"] = mode
                    original = constructor()
                    captured = state(original)
                    rc["_internal.classic_mode"] = not classic
                    axis = None if space is None else Axis(space, (lower, upper))
                    if axis is not None:
                        original.set_axis(axis)
                    calls = dict(direct=observe(lambda: original.tick_values(lower, upper), axis),
                                 reverse=observe(lambda: original.tick_values(upper, lower), axis),
                                 limits=observe(lambda: original.view_limits(lower, upper), axis),
                                 nonsingular=observe(lambda: original.nonsingular(lower, upper), axis),
                                 call=observe(original, axis))
                    code += "\n///|\ntest " + moon("AutoLocator original " + str(len(rows)) + " classic " + str(classic) + " " + mode) + " {\n"
                    code += preamble(classic) + "  @config.set_axes_autolimit_mode(" + moon(mode) + ")\n"
                    code += state_checks(captured) + state_checks(captured, "live")
                    if axis is not None:
                        code += bind_code(space, (lower, upper))
                    code += expect("locator.tick_values(" + moon(lower) + ", " + moon(upper) + ")", calls["direct"])
                    code += expect("locator.tick_values(" + moon(upper) + ", " + moon(lower) + ")", calls["reverse"])
                    code += expect("locator.view_limits(" + moon(lower) + ", " + moon(upper) + ")", calls["limits"], pair=True)
                    code += expect("locator.nonsingular(" + moon(lower) + ", " + moon(upper) + ")", calls["nonsingular"], pair=True)
                    code += expect("locator.call()", calls["call"]) + "}\n"
                    rows.append(dict(classic=classic, space=space, bounds=[lower, upper], mode=mode,
                                     captured=captured, calls=calls))
    updates = [dict(nbins=3, integer=True, symmetric=True, prune="both", min_n_ticks=4, steps=[1., 3., 6., 10.]),
               dict(steps=None, prune=None), {},
               dict(nbins="auto", min_n_ticks=20, integer=False, symmetric=False, prune="upper"),
               dict(nbins=0, integer=True, prune=None),
               dict(nbins=4, prune="invalid", min_n_ticks=9, steps=[1., 2., 10.], integer=False),
               dict(symmetric=True, min_n_ticks=4, steps=[1., 1., 10.], integer=False),
               dict(steps=[1., 2., 2.5, 5., 10.], integer=False)]
    update_rows = []
    copy_rows = []
    for classic in [False, True]:
        rc["_internal.classic_mode"], rc["axes.autolimit_mode"] = classic, "data"
        original = constructor()
        axis = Axis(3., (-2.7, 9.1))
        original.set_axis(axis)
        code += "\n///|\ntest " + moon("AutoLocator original inherited updates classic " + str(classic)) + " {\n"
        code += preamble(classic) + '  @config.set_axes_autolimit_mode("data")\n' + bind_code(axis.space, axis.view)
        observed_updates = []
        for args in updates:
            error = None
            try:
                original.set_params(**args)
            except (ValueError, IndexError) as exc:
                error = type(exc).__name__
            expression = "locator.set_params(" + parameters(args) + ")"
            code += "  assert_true(try { " + expression + "; false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })\n" if error else "  " + expression + "\n"
            current = state(original)
            code += state_checks(current) + state_checks(current, "live")
            calls = []
            for mode in ["data", "round_numbers"]:
                rc["axes.autolimit_mode"] = mode
                result = observe(original, axis)
                code += "  @config.set_axes_autolimit_mode(" + moon(mode) + ")\n" + expect("locator.call()", result)
                calls.append(dict(mode=mode, **result))
            observed_updates.append(dict(parameters=args, source_error=error, state=current, calls=calls))
        code += "}\n"
        update_rows.append(dict(classic=classic, stages=observed_updates))

        rc["_internal.classic_mode"], rc["axes.autolimit_mode"] = classic, "data"
        original = constructor()
        old_axis, new_axis = Axis(2., (0., 20.)), Axis(8., (-1., 1.))
        original.set_axis(old_axis)
        independent = copy.copy(original)
        code += "\n///|\ntest " + moon("AutoLocator original provider copy rebind classic " + str(classic)) + " {\n"
        code += preamble(classic) + '  @config.set_axes_autolimit_mode("data")\n' + bind_code(old_axis.space, old_axis.view)
        code += "  let independent = locator.copy()\n"
        copy_steps = []
        for label in ["initial", "old axis mutated", "original rebound", "copy updated"]:
            if label == "old axis mutated":
                old_axis.space, old_axis.view = 6., (1., 4.)
                code += "  binding_space[0] = 6.0\n  binding_view[0] = 1.0\n  binding_view[1] = 4.0\n"
            if label == "original rebound":
                original.set_axis(new_axis)
                code += bind_code(new_axis.space, new_axis.view, state_name="replacement")
            if label == "copy updated":
                independent.set_params(nbins=2, prune="lower", integer=True)
                code += "  independent.set_params(nbins=@ticker.MaxNBins::Count(2), prune=Some(\"lower\"), integer=true)\n"
            original_result = observe(original, original.axis)
            copied_result = observe(independent, independent.axis)
            code += expect("locator.call()", original_result) + expect("independent.call()", copied_result)
            code += state_checks(state(original)) + state_checks(state(independent), "independent")
            copy_steps.append(dict(stage=label, original_state=state(original), copied_state=state(independent),
                                   original_call=original_result, copied_call=copied_result))
        # Source steps remain shallow-shared independently of parameter replacement.
        original._steps[1] = 1.25
        code += "  locator.steps().set(1, 1.25)\n" + state_checks(state(original)) + state_checks(state(original), "live") + state_checks(state(independent), "independent")
        code += "}\n"
        copy_rows.append(dict(classic=classic, stages=copy_steps, after_shared_step_write=[state(original), state(independent)]))
    payload = dict(source_hashes=HASHES, python=sys.version.split()[0], numpy=np.__version__,
                   ast_source_bodies=["AutoLocator", "MaxNLocator", "_Edge_integer", "scale_range", "Locator.nonsingular",
                                      "Locator.raise_if_exceeds", "TickHelper.set_axis", "transforms._nonsingular", "_api.check_in_list"],
                   provider_scope="controlled two-dimensional tick-space and view callbacks; renderer physical binding verified separately",
                   cases=rows, parameter_update_traces=update_rows, copy_provider_traces=copy_rows)
    return clean(payload), formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", RuntimeWarning)
        payload, code = generate(args.ticker)
    outputs = {ROOT / "testdata/auto_numeric_reference.json": json.dumps(payload, indent=2, allow_nan=False) + "\n",
               ROOT / "ticker/auto_numeric_reference_test.mbt": code}
    for path, text in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(text)
    print("AutoLocator reference:", len(payload["cases"]), "grids,",
          sum(len(row["stages"]) for row in payload["parameter_update_traces"]), "updates,",
          sum(len(row["stages"]) for row in payload["copy_provider_traces"]), "copy/provider stages")


if __name__ == "__main__":
    main()
