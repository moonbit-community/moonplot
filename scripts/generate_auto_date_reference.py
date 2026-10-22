"""Generate AutoDateFormatter and minor-overlap assertions from pinned sources.

Reuses the pinned date-helper loader; never imports installed Matplotlib.
"""
from pathlib import Path
import argparse
import ast
import copy
import datetime as dt
import hashlib
import json
import locale
import math
import re
import sys
import subprocess
import types

import numpy as np
import dateutil
import generate_concise_date_reference as base

ROOT = base.ROOT
AXIS_SHA = "f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0"
RC_SHA = "8b76e138ce9dc944a843dc6aa1ef9ee0e88638358b10baf227cd248d271b5f5a"


def moon(value):
    if isinstance(value, float) and not math.isfinite(value):
        if math.isnan(value):
            return "(0.0 / 0.0)"
        return "(" + ("-1.0" if value < 0 else "1.0") + " / 0.0)"
    if isinstance(value, list):
        return "[" + ", ".join(moon(x) for x in value) + "]"
    return base.moon(value)


def formatted(code):
    return subprocess.run(["moonfmt", "-"], input=code, text=True, stdout=subprocess.PIPE, check=True).stdout


def generate(path):
    locale.setlocale(locale.LC_TIME, "C")
    namespace = base.load_reference(path)
    rc_path = path.parent / "mpl-data/matplotlibrc"
    axis_path = path.parent / "axis.py"
    for source, checksum in [(rc_path, RC_SHA), (axis_path, AXIS_SHA)]:
        if hashlib.sha256(source.read_bytes()).hexdigest() != checksum:
            raise ValueError("pinned reference differs: " + str(source))
    defaults = dict(re.findall(r"^#(date\.autoformatter\.\w+):\s+(.*?)\s*$", rc_path.read_text(), re.M))
    namespace["mpl"].rcParams = defaults
    namespace.update(DAYS_PER_YEAR=365.0, DAYS_PER_MONTH=30.0, DAYS_PER_WEEK=7.0,
                     HOURS_PER_DAY=24.0, MINUTES_PER_DAY=1440.0)
    cls = next(n for n in ast.parse(path.read_text()).body if isinstance(n, ast.ClassDef) and n.name == "AutoDateFormatter")
    exec(compile(ast.Module(body=[cls], type_ignores=[]), str(path), "exec"), namespace)
    date = dt.datetime(2024, 5, 6, 12, 34, 56, 123456, tzinfo=dt.timezone.utc)
    values = [float(x) for x in namespace["date2num"]([date, date + dt.timedelta(hours=1)])]
    units = [365.0, 30.0, 7.0, 1.0, 1/24, 1/1440, 1/86400, 1/86400000000,
             400.0, -11.0, 0.0, 2/86400000000, math.nextafter(1/1440, math.inf),
             math.nextafter(1/1440, 0), math.inf, math.nan]
    entries = [(0.0, "ZERO %H:%M"), (0.1, "SHORT %H:%M"), (30.0, "MONTH %Y-%m"),
               (1.0, "DAY %Y-%m-%d"), (1.0, "REPLACED %d"), (-10.0, "NEG %H"), (math.inf, "INFINITE %Y")]
    code = "// Generated from pinned AutoDateFormatter by generate_auto_date_reference.py.\n"
    cases = []
    for unit in units:
        for variant in ["default", "tex", "scaled", "empty"]:
            locator = types.SimpleNamespace(_get_unit=lambda: unit)
            formatter = namespace["AutoDateFormatter"](locator, defaultfmt="fallback %Y", usetex=variant == "tex")
            if variant == "scaled":
                formatter.scaled = dict(entries)
            if variant == "empty":
                formatter.scaled = {}
            labels = [formatter(value, index) for index, value in enumerate(values)]
            single = formatter(values[0])
            label = "automatic date reference " + repr(unit) + " / " + variant
            cases.append({"unit": repr(unit), "variant": variant, "values": values, "labels": labels, "single": single})
            expression = '@date.AutoDateFormatter::new(default_format="fallback %Y", usetex=' + moon(variant == "tex") + ').with_locator_unit(' + moon(unit) + ')'
            if variant == "scaled":
                expression += '.with_scaled([' + ', '.join('(' + moon(k) + ', @date.Text(' + moon(v) + '))' for k, v in entries) + '])'
            if variant == "empty":
                expression += '.with_scaled([])'
            code += '\n///|\ntest ' + moon(label) + ' {\n  let formatter = ' + expression + '\n  let values = ' + moon(values) + '\n'
            code += '  assert_eq(formatter.format_ticks(values), ' + moon(labels) + ')\n'
            code += '  assert_eq(formatter.format_value(values[0]), ' + moon(single) + ')\n'
            code += '  assert_eq(formatter.as_formatter().format_values(values), ' + moon(labels) + ')\n}\n'
    # The missing-unit fallback is separate from explicitly supplied unit scales.
    formatter = namespace["AutoDateFormatter"](object())
    expected = formatter(values[0])
    code += '\n///|\ntest "automatic date reference missing unit fallback" {\n  assert_eq(@date.AutoDateFormatter::new().format_value(' + moon(values[0]) + '), ' + moon(expected) + ')\n}\n'
    # Extract the original static frequency-to-unit implementation.
    rule_class = next(n for n in ast.parse(path.read_text()).body if isinstance(n, ast.ClassDef) and n.name == "RRuleLocator")
    unit_fn = copy.deepcopy(next(n for n in rule_class.body if isinstance(n, ast.FunctionDef) and n.name == "get_unit_generic"))
    unit_fn.decorator_list = []
    namespace.update({name: index for index, name in enumerate(["YEARLY", "MONTHLY", "WEEKLY", "DAILY", "HOURLY", "MINUTELY", "SECONDLY"])})
    exec(compile(ast.Module(body=[unit_fn], type_ignores=[]), str(path), "exec"), namespace)
    source_units = [namespace["get_unit_generic"](index) for index in range(7)]
    code += '\n///|\ntest "automatic date reference recurrence base units exclude interval" {\n'
    for name, unit in zip(["Yearly", "Monthly", "Weekly", "Daily", "Hourly", "Minutely", "Secondly"], source_units):
        code += '  assert_eq(@date.rrule_locator(@date.' + name + ', interval=17).unit_scale(), ' + moon(unit) + ')\n'
    code += '}\n'
    # Pinned __call__ passes scalar/array inputs directly to callable entries.
    callback = lambda value, pos: "v:" + ("none" if pos is None else str(pos)) + ":" + namespace["num2date"](value).strftime("%H:%M")
    function_ref = namespace["AutoDateFormatter"](types.SimpleNamespace(_get_unit=lambda: -11), tz=dt.timezone(dt.timedelta(hours=3)), usetex=True)
    function_ref.scaled[-10] = callback
    callback_labels = [function_ref(value, index) for index, value in enumerate(values)]
    callback_single = function_ref(values[0])
    code += '\n///|\ntest "automatic date reference scalar callable original input and position" {\n'
    code += '  let formatter = @date.AutoDateFormatter::new(usetex=true).with_locator_unit(-11.0).with_scale(-10.0, @date.Func(fn(value, pos) {\n'
    code += '    "v:" + pos.map(index => index.to_string()).unwrap_or("none") + ":" + (try! @date.date_formatter("%H:%M", tz="UTC")).format_value(value)\n  })).with_offset(180)\n'
    code += '  assert_eq(formatter.format_ticks(' + moon(values) + '), ' + moon(callback_labels) + ')\n'
    code += '  assert_eq(formatter.format_value(' + moon(values[0]) + '), ' + moon(callback_single) + ')\n}\n'
    raw_date = dt.datetime(2014, 12, 25, tzinfo=dt.timezone(dt.timedelta(hours=23)))
    function_ref.scaled[-10] = lambda dates, pos: [value.strftime('%d-%m//%Y') for value in dates]
    date_labels = function_ref([raw_date])
    code += '\n///|\ntest "automatic date reference original datetime array callable" {\n'
    code += '  let formatter = @date.AutoDateFormatter::new().with_locator_unit(-11.0).with_scale(-10.0, @date.DatesFunc(fn(dates, _) { dates.map(value => @date.format_date(value, "%d-%m//%Y")) }))\n'
    code += '  assert_eq(formatter.format_dates([@date.datetime(2014, 12, 25, offset_minutes=1380)]), ' + moon(date_labels) + ')\n}\n'
    function_ref.scaled[-10] = lambda xs, pos: [str(int(value) + pos) for value in xs]
    array_labels = function_ref([2.0, 3.0], 7)
    code += '\n///|\ntest "automatic date reference numeric array callable" {\n'
    code += '  let formatter = @date.AutoDateFormatter::new().with_locator_unit(-11.0).with_scale(-10.0, @date.ValuesFunc(fn(values, pos) { values.map(value => (value.to_int() + pos.unwrap()).to_string()) }))\n'
    code += '  assert_eq(formatter.format_array([2.0, 3.0], pos=7), ' + moon(array_labels) + ')\n}\n'
    # Original overlap function with only its view/locator/identity-transform inputs stubbed.
    axis_cls = next(n for n in ast.parse(axis_path.read_text()).body if isinstance(n, ast.ClassDef) and n.name == "Axis")
    overlap_fn = next(n for n in axis_cls.body if isinstance(n, ast.FunctionDef) and n.name == "get_minorticklocs")
    overlap_ns = {"np": np}
    exec(compile(ast.Module(body=[overlap_fn], type_ignores=[]), str(axis_path), "exec"), overlap_ns)
    overlap_cases = [([0.0, 1.0], [0.0, 0.5, 1.0], [0.0, 1.0], True),
                     ([0.0, 1.0], [0.000009, 0.000011, 0.999989, 0.999991], [1.0, 0.0], True),
                     ([19847.5], [19847.500009, 19847.500011, 19847.4], [19847.0, 19848.0], True),
                     ([0.0], [0.0, 0.000001], [0.0, 0.0], True),
                     ([], [0.0, 0.5, 1.0], [0.0, 1.0], True),
                     ([0.0, 1.0], [0.0, 0.5, 1.0], [0.0, 1.0], False)]
    overlap_code = "// Generated from pinned axis.get_minorticklocs.\n"
    overlaps = []
    for index, (major, minor, view, enabled) in enumerate(overlap_cases):
        identity = types.SimpleNamespace(transform=lambda x: np.asarray(x))
        axis = types.SimpleNamespace(minor=types.SimpleNamespace(locator=lambda: minor),
                                     major=types.SimpleNamespace(locator=lambda: major),
                                     remove_overlapping_locs=enabled,
                                     _scale=types.SimpleNamespace(get_transform=lambda: identity),
                                     get_view_interval=lambda: view)
        output = [float(x) for x in overlap_ns["get_minorticklocs"](axis)]
        overlaps.append({"major": major, "minor": minor, "view": view, "enabled": enabled, "expected": output})
        overlap_code += '\n///|\ntest "date minor overlap upstream reference ' + str(index) + '" {\n  let axis = axis()\n'
        overlap_code += '  axis.set_minor_overlap_removal(' + moon(enabled) + ')\n'
        overlap_code += '  assert_eq(axis.filter_date_minor_ticks(' + moon(minor) + ', ' + moon(major) + ', @core.limits(' + moon(view[0]) + ', ' + moon(view[1]) + ')), ' + moon(output) + ')\n}\n'
    epoch_outputs = {}
    epoch_cases = []
    for name, epoch, year in [("2400", "2400-01-01T00:00:00", 2400), ("fraction", "2000-01-01T00:00:00.123456", 2000)]:
        ref = base.load_reference(path, epoch)
        ref["mpl"].rcParams = defaults
        ref.update(DAYS_PER_YEAR=365.0, DAYS_PER_MONTH=30.0, HOURS_PER_DAY=24.0, MINUTES_PER_DAY=1440.0)
        exec(compile(ast.Module(body=[cls], type_ignores=[]), str(path), 'exec'), ref)
        micro_values = [float(x) for x in ref["date2num"]([dt.datetime(year, 1, 1, microsecond=x, tzinfo=dt.timezone.utc) for x in [0, 100, 900]])]
        formatter = ref["AutoDateFormatter"](types.SimpleNamespace(_get_unit=lambda: 1/86400000000))
        labels = [formatter(value, index) for index, value in enumerate(micro_values)]
        epoch_cases.append({"epoch": epoch, "values": micro_values, "labels": labels})
        extra = '// Generated by generate_auto_date_reference.py from pinned v3.11.2.\n\n///|\nfn verify_auto_epoch_reference(formatter : @date.AutoDateFormatter) -> Unit raise {\n'
        extra += '  assert_eq(formatter.format_ticks(' + moon(micro_values) + '), ' + moon(labels) + ')\n}\n'
        epoch_outputs[ROOT / "integration" / ("epoch_" + name) / "auto_reference_test.mbt"] = formatted(extra)
    metadata = {"matplotlib_commit": "d3ca9172e392048ec242b90e8423e88d1a3000b2", "dates_py_sha256": base.SHA256,
                "python": sys.version.split()[0], "numpy": np.__version__, "dateutil": dateutil.__version__, "locale": "C",
                "axis_py_sha256": AXIS_SHA, "matplotlibrc_sha256": RC_SHA, "defaults": defaults,
                "cases": cases, "recurrence_units": source_units, "minor_overlap_cases": overlaps,
                "callbacks": {"values": values, "scalar_labels": callback_labels, "scalar_single": callback_single, "raw_date": raw_date.isoformat(), "date_labels": date_labels, "array_labels": array_labels}, "epoch_cases": epoch_cases,
                "note": "Pinned AutoDateFormatter, get_unit_generic and get_minorticklocs AST; no installed Matplotlib."}
    outputs = {ROOT / "ticker/date/auto_reference_test.mbt": formatted(code),
            ROOT / "scene/axis/date_minor_reference_wbtest.mbt": formatted(overlap_code),
            ROOT / "testdata/auto_date_reference.json": json.dumps(metadata, indent=2, allow_nan=False) + "\n"}
    outputs.update(epoch_outputs)
    return outputs


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("dates_py", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    for path, value in generate(args.dates_py).items():
        if args.check:
            if path.read_text() != value:
                raise SystemExit("reference differs: " + str(path.relative_to(ROOT)))
        else:
            path.write_text(value)
    print(("Verified" if args.check else "Generated") + " D07: 64 scaled, 3 callable cases, missing-unit fallback, 7 recurrence units, 6 overlaps, 2 isolated epochs")


if __name__ == "__main__":
    main()
