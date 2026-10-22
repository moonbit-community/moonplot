"""Observe fixed NumPy int64 scalar writes, view aliases and MaxN step dtype.

The public tick view reads project to Double, while original owner arrays and
copies preserve actual signed Int64 storage. No integer-cast algorithm is used
as the expected-value oracle: every write is performed by NumPy itself.
"""
from pathlib import Path
import argparse
import hashlib
import json
import math
import sys
import warnings

import numpy as np
import numpy._core._multiarray_umath as numpy_core

from generate_auto_date_reference import formatted, moon
from generate_maxn_params_reference import load as load_maxn, source_view
from generate_fixed_locator_reference import load as load_fixed
from generate_multiple_locator_reference import clean, TICKER_SHA

ROOT = Path(__file__).resolve().parents[1]
NUMPY_CORE_SHA = "44fdecc68c23ac6dd5825dc124c801086f7f68dc15ab008ed584ed6a47be6305"


def integers(values):
    return "[" + ", ".join(str(int(value)) + "L" for value in values) + "]"


def floats(values):
    return [float(value) for value in values]


def assign(values, index, value):
    try:
        values[index] = value
        return None
    except (ValueError, OverflowError, IndexError) as exc:
        return type(exc).__name__


def error_assert(expression):
    return ("  assert_true(try { " + expression + "; false } catch {"
            " @core.DataError::InvalidTicks(..) => true; _ => false })\n")


def generate(path):
    if sys.version_info[:3] != (3, 12, 14) or np.__version__ != "2.3.5":
        raise ValueError("fixed CPython 3.12.14 / NumPy 2.3.5 required")
    if hashlib.sha256(Path(numpy_core.__file__).read_bytes()).hexdigest() != NUMPY_CORE_SHA:
        raise ValueError("fixed NumPy core binary differs")
    reference = load_maxn(path)
    code = """// Fixed NumPy int64 scalar-write, real owner-view and MaxN dtype observations.

///|
fn verify_integer_tick_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}
"""
    assignments = []
    values = [1.25, -1.25, .999, -.999, 0., -0., 2.5, -2.5,
              math.nextafter(float(2 ** 63), -math.inf), -float(2 ** 63),
              float(2 ** 63), math.nextafter(-float(2 ** 63), -math.inf),
              math.nan, math.inf, -math.inf, 1e300, -1e300]
    for index, value in enumerate(values):
        owner = np.array([7, 8], dtype=np.int64)
        error = assign(owner, 0, value)
        double_owner = np.array([7., 8.], dtype=np.float64)
        double_error = assign(double_owner, 0, value)
        assert double_error is None
        code += "\n///|\ntest " + moon("NumPy int64 scalar tick assignment " + str(index) + " " + repr(value)) + " {\n"
        code += "  let owner = [7L, 8L]\n  let view = @ticker.TickValues::from_int64_array(owner)\n"
        expression = "view.set(0, " + moon(value) + ")"
        code += error_assert(expression) if error else "  " + expression + "\n"
        code += "  assert_eq(owner, " + integers(owner) + ")\n"
        code += "  verify_integer_tick_values(view.to_array(), " + moon(floats(owner)) + ")\n"
        code += "  let doubles = @ticker.TickValues::from_array([7.0, 8.0])\n  doubles.set(0, " + moon(value) + ")\n"
        code += "  verify_integer_tick_values(doubles.to_array(), " + moon(floats(double_owner)) + ")\n}\n"
        assignments.append(dict(value=value, source_error=error, owner=[int(v) for v in owner],
                                integer_projection=floats(owner), floating_values=floats(double_owner)))

    alias_specs = [("positive", [(1, 2, 5)]), ("negative", [(10, -2, 5)]),
                   ("negative start", [(-1, -3, 4)]), ("empty", [(2, 3, 0)]),
                   ("nested reverse", [(1, 2, 5), (-1, -2, 3)]),
                   ("nested forward", [(10, -2, 5), (1, 2, 2)]),
                   ("writable zero stride", [(2, 0, 4)])]
    aliases = []
    for label, slices in alias_specs:
        owner = np.arange(12, dtype=np.int64)
        selected = owner
        positions = np.arange(12)
        for start, stride, length in slices:
            selected = source_view(selected, start, stride, length)
            positions = source_view(positions, start, stride, length)
        initial = floats(selected)
        if len(selected):
            assert np.shares_memory(selected, owner)
            assert assign(selected, -1, 1.75) is None
        after_return_write = dict(owner=[int(v) for v in owner], values=floats(selected))
        owner_index = int(positions[0]) if len(positions) else 0
        owner[owner_index] = 9
        after_owner_write = dict(owner=[int(v) for v in owner], values=floats(selected))
        copied = selected.copy()
        if len(copied):
            assert assign(copied, 0, -1.75) is None
            copy_error = assign(copied, 0, math.nan)
            assert copy_error == "ValueError"
        else:
            copy_error = None
        final = dict(owner=[int(v) for v in owner], values=floats(selected), copied=floats(copied),
                     copy_dtype=str(copied.dtype), copy_nan_error=copy_error)
        code += "\n///|\ntest " + moon("NumPy int64 real tick view " + label) + " {\n"
        code += "  let owner = " + integers(range(12)) + "\n"
        expression = "@ticker.TickValues::from_int64_array(owner)"
        for start, stride, length in slices:
            expression += ".view(" + str(start) + ", " + str(stride) + ", " + str(length) + ")"
        code += "  let selected = " + expression + "\n"
        code += "  verify_integer_tick_values(selected.to_array(), " + moon(initial) + ")\n"
        if len(selected):
            code += "  selected.set(-1, 1.75)\n"
        code += "  assert_eq(owner, " + integers(after_return_write["owner"]) + ")\n"
        code += "  verify_integer_tick_values(selected.to_array(), " + moon(after_return_write["values"]) + ")\n"
        code += "  owner[" + str(owner_index) + "] = 9L\n"
        code += "  verify_integer_tick_values(selected.to_array(), " + moon(after_owner_write["values"]) + ")\n"
        code += "  let copied = selected.copy()\n"
        if len(copied):
            code += "  copied.set(0, -1.75)\n" + error_assert("copied.set(0, 0.0 / 0.0)")
        code += "  assert_eq(owner, " + integers(final["owner"]) + ")\n"
        code += "  verify_integer_tick_values(selected.to_array(), " + moon(final["values"]) + ")\n"
        code += "  verify_integer_tick_values(copied.to_array(), " + moon(final["copied"]) + ")\n}\n"
        aliases.append(dict(label=label, slices=slices, initial=initial,
                            after_return_write=after_return_write, after_owner_write=after_owner_write, final=final))

    maxn_rows = []
    minimum = -(2 ** 63)
    maximum = 2 ** 63 - 1
    step_inputs = [[1, 2, 5, 10], [2, 4, 8], [2, 4, 10], [1, 2, 8], [1], [10],
                   [1, minimum, -1, maximum - 1, -3, 10],
                   [1, minimum, -1, maximum - 1, -3, 9],
                   [2, minimum, -1, maximum - 1, -3, 10],
                   [1, maximum, -2, 10]]
    for values in step_inputs:
        int_owner = np.array(values, dtype=np.int64)
        float_owner = np.array(values, dtype=np.float64)
        integer = reference["MaxNLocator"](steps=int_owner)
        try:
            floating = reference["MaxNLocator"](steps=float_owner)
            floating_error = None
        except (ValueError, IndexError) as exc:
            floating = None
            floating_error = type(exc).__name__
        assert integer._steps.dtype == np.dtype(np.int64)
        if floating is not None:
            assert floating._steps.dtype == np.dtype(np.float64)
        reconstructed = reference["MaxNLocator"](steps=integer._steps)
        initial_integer = floats(integer._steps)
        reconstructed_values = floats(reconstructed._steps)
        stages = [dict(stage="normalized constructor", integer=initial_integer,
                       floating=None if floating is None else floats(floating._steps),
                       integer_owner=[int(v) for v in int_owner], floating_owner=floats(float_owner),
                       integer_extended=floats(integer._extended_steps),
                       floating_extended=None if floating is None else floats(floating._extended_steps))]
        integer._steps[1] = 1.25
        if floating is not None:
            floating._steps[1] = 1.25
        stages.append(dict(stage="fractional write after normalization", integer=floats(integer._steps),
                           floating=None if floating is None else floats(floating._steps),
                           integer_owner=[int(v) for v in int_owner], floating_owner=floats(float_owner)))
        integer._steps[-1] = 9.75
        if floating is not None:
            floating._steps[-1] = 9.75
        stages.append(dict(stage="fractional final element write", integer=floats(integer._steps),
                           floating=None if floating is None else floats(floating._steps),
                           integer_owner=[int(v) for v in int_owner], floating_owner=floats(float_owner),
                           integer_extended=floats(integer._extended_steps),
                           floating_extended=None if floating is None else floats(floating._extended_steps)))
        code += "\n///|\ntest " + moon("MaxN original normalized step dtype " + repr(values)) + " {\n"
        code += "  let integer_owner = " + integers(values) + "\n  let floating_owner = " + moon([float(v) for v in values]) + "\n"
        code += "  let integer = @ticker.MaxNLocator::new(steps=@ticker.TickValues::from_int64_array(integer_owner))\n"
        if floating_error:
            code += error_assert("ignore(@ticker.MaxNLocator::new(steps=@ticker.TickValues::from_array(floating_owner)))")
        else:
            code += "  let floating = @ticker.MaxNLocator::new(steps=@ticker.TickValues::from_array(floating_owner))\n"
        names = ["integer"] if floating_error else ["integer", "floating"]
        for name in names:
            code += "  verify_integer_tick_values(" + name + ".steps().to_array(), " + moon(stages[0][name]) + ")\n"
        code += "  let reconstructed = @ticker.MaxNLocator::new(steps=integer.steps())\n"
        code += "  verify_integer_tick_values(reconstructed.steps().to_array(), " + moon(reconstructed_values) + ")\n"
        code += "  integer.steps().set(1, 1.25)\n"
        if floating is not None:
            code += "  floating.steps().set(1, 1.25)\n"
        for name in names:
            code += "  verify_integer_tick_values(" + name + ".steps().to_array(), " + moon(stages[1][name]) + ")\n"
        code += "  assert_eq(integer_owner, " + integers(stages[1]["integer_owner"]) + ")\n"
        code += "  verify_integer_tick_values(floating_owner, " + moon(stages[1]["floating_owner"]) + ")\n"
        code += "  integer.steps().set(-1, 9.75)\n"
        if floating is not None:
            code += "  floating.steps().set(-1, 9.75)\n"
        for name in names:
            code += "  verify_integer_tick_values(" + name + ".steps().to_array(), " + moon(stages[2][name]) + ")\n"
            code += "  verify_integer_tick_values(" + name + ".extended_steps(), " + moon(stages[2][name + "_extended"]) + ")\n"
        code += "  assert_eq(integer_owner, " + integers(stages[2]["integer_owner"]) + ")\n"
        code += "  verify_integer_tick_values(floating_owner, " + moon(stages[2]["floating_owner"]) + ")\n}\n"
        maxn_rows.append(dict(input=values, source_differences=[int(v) for v in np.diff(np.array(values, dtype=np.int64))],
                             integer_dtype=str(integer._steps.dtype), floating_dtype=None if floating is None else str(floating._steps.dtype),
                             floating_constructor_error=floating_error, reconstructed_values=reconstructed_values, stages=stages))

    fixed_class = load_fixed(path)
    fixed_rows = []
    for label, values in [
            ("minimum absolute value wraps", [-(2 ** 63), 0, 1, 2]),
            ("phase distinguishes integers above double precision", [2 ** 53 + 1, 2 ** 53, 2 ** 53 + 1, 2 ** 53])]:
        owner = np.array(values, dtype=np.int64)
        locator = fixed_class(owner, nbins=2)
        selected = locator.tick_values(math.nan, math.inf)
        assert np.shares_memory(selected, owner)
        phase = (selected.__array_interface__["data"][0] - owner.__array_interface__["data"][0]) // owner.itemsize
        initial = floats(selected)
        selected[0] = 1.25
        after_first = dict(owner=[int(v) for v in owner], values=floats(selected))
        selected[-1] = -1.25
        after_last = dict(owner=[int(v) for v in owner], values=floats(selected))
        code += "\n///|\ntest " + moon("Fixed original Int64 phase " + label) + " {\n"
        code += "  let owner = " + integers(values) + "\n"
        code += "  let locator = @ticker.FixedLocator::from_view(@ticker.TickValues::from_int64_array(owner), nbins=2.0)\n"
        code += "  let selected = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)\n"
        code += "  verify_integer_tick_values(selected.to_array(), " + moon(initial) + ")\n"
        code += "  selected.set(0, 1.25)\n  assert_eq(owner, " + integers(after_first["owner"]) + ")\n"
        code += "  verify_integer_tick_values(selected.to_array(), " + moon(after_first["values"]) + ")\n"
        code += "  selected.set(-1, -1.25)\n  assert_eq(owner, " + integers(after_last["owner"]) + ")\n"
        code += "  verify_integer_tick_values(selected.to_array(), " + moon(after_last["values"]) + ")\n}\n"
        fixed_rows.append(dict(label=label, input=values, selected_phase=int(phase), initial=initial,
                               after_first=after_first, after_last=after_last, dtype=str(selected.dtype)))

    payload = dict(python=sys.version.split()[0], numpy=np.__version__, numpy_core_sha256=NUMPY_CORE_SHA,
                   ticker_source_sha256=TICKER_SHA,
                   profile="NumPy int64 scalar assignment; public reads/materialization project to binary64; signed/zero/nested views and copy retain Int64 storage",
                   boundaries="Only Float64/Int64 storage and Python-float scalar writes; not arbitrary NumPy dtypes, broadcasting or unsafe casts. MaxN fixtures include source-accepted Int64 diff/multiplication wrap at extreme interior values, endpoint completion and Float64 validation differences; Fixed uses exact Int64 absolute/minimum comparisons, including wrapped minimum.",
                   scalar_assignments=assignments, view_alias_cases=aliases, maxn_step_cases=maxn_rows,
                   fixed_phase_cases=fixed_rows)
    return clean(payload), formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", RuntimeWarning)
        payload, code = generate(args.ticker)
    for path, text in {ROOT / "testdata/integer_tick_values_reference.json": json.dumps(payload, indent=2, allow_nan=False) + "\n",
                       ROOT / "ticker/integer_tick_values_reference_test.mbt": code}.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(text)
    print("Integer tick values reference:", len(payload["scalar_assignments"]), "scalar writes,",
          len(payload["view_alias_cases"]), "view aliases,", len(payload["maxn_step_cases"]), "MaxN dtype cases,",
          len(payload["fixed_phase_cases"]), "Fixed phases")


if __name__ == "__main__":
    main()
