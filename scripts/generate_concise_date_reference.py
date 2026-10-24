"""Execute pinned Matplotlib ConciseDateFormatter on explicit tick arrays.

No installed Matplotlib is imported. Requires NumPy and python-dateutil;
checked-in MoonBit assertions require neither at runtime.
"""
from pathlib import Path
import argparse
import ast
import datetime as dt
import hashlib
import io
import json
import locale
import re
import subprocess
import sys
import types
from zoneinfo import ZoneInfo

import dateutil
from dateutil import tz
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
SHA256 = "fb8d673fbc57c2499f2dd138c87c6c9520a59b38b60b01a6d59d5eb6540ef233"


def load_reference(path, epoch="1970-01-01T00:00:00"):
    if hashlib.sha256(path.read_bytes()).hexdigest() != SHA256:
        raise ValueError("dates.py does not match pinned Matplotlib commit")
    names = {"_wrap_in_tex", "_from_ordinalf", "_dt64_to_ordinalf", "date2num", "num2date",
             "DateFormatter", "ConciseDateFormatter"}
    nodes = [n for n in ast.parse(path.read_text()).body
             if isinstance(n, (ast.FunctionDef, ast.ClassDef)) and n.name in names]
    if {n.name for n in nodes} != names:
        raise ValueError("missing pinned formatter definitions")
    namespace = {"np": np, "datetime": dt, "dateutil": dateutil, "re": re,
                 "UTC": dt.timezone.utc, "SEC_PER_DAY": 86400, "MUSECONDS_PER_DAY": 86400000000,
                 "get_epoch": lambda: epoch,
                 "_get_tzinfo": lambda zone: zone or dt.timezone.utc,
                 "cbook": types.SimpleNamespace(_unpack_to_numpy=lambda x: x),
                 "mpl": types.SimpleNamespace(_val_or_rc=lambda value, key: False if value is None else value),
                 "ticker": types.SimpleNamespace(Formatter=object),
                 "_api": types.SimpleNamespace(deprecate_privatize_attribute=lambda *args, **kwargs: None)}
    exec(compile(ast.Module(body=nodes, type_ignores=[]), str(path), "exec"), namespace)
    namespace["_from_ordinalf_np_vectorized"] = np.vectorize(namespace["_from_ordinalf"], otypes="O")
    return namespace


def moon(value):
    if isinstance(value, list):
        return "[" + ", ".join(moon(x) for x in value) + "]"
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, float):
        text = repr(value)
        if "e" in text and "." not in text.split("e")[0]:
            text = text.replace("e", ".0e")
        return text
    return json.dumps(value, ensure_ascii=False)


def generate(path):
    locale.setlocale(locale.LC_TIME, "C")
    ref = load_reference(path)
    base = dt.datetime(1997, 1, 1, tzinfo=dt.timezone.utc)
    patterns = {
        "years": [base.replace(year=y) for y in range(1980, 2201, 20)],
        "months": [base.replace(month=m) for m in range(1, 13)],
        "half months": [base.replace(month=m, day=d) for m in range(1, 6) for d in [1, 15]],
        "days": [base + dt.timedelta(days=i) for i in range(0, 41, 4)],
        "hours": [base + dt.timedelta(hours=i) for i in range(0, 41, 4)],
        "minutes": [base + dt.timedelta(minutes=i) for i in range(0, 21, 5)],
        "seconds": [base + dt.timedelta(seconds=i) for i in range(0, 41, 5)],
        "subseconds": [base + dt.timedelta(seconds=i / 2) for i in range(-1, 6)],
    }
    custom = ["%Y", "%m/%Y", "day: %d", "%H hr %M min", "%H hr %M min", "%S.%f sec"]
    zeros = ["", "'%y", "%B", "%m-%d", "%S", "%S.%f"]
    offsets = ["years=%Y", "year=%Y", "%Y/%m", "%Y/%m/%d", "%Y/%m/%d", "%Y/%m/%d %H:%M:%S.%f"]
    cases = []

    def add(label, dates, *, options=None, zone="", inverted=False):
        options = options or {}
        if zone == "NY":
            selected_zone = ZoneInfo.from_file(io.BytesIO((ROOT / "testdata/tzif/new_york.tzif").read_bytes()))
        elif zone == "PARIS":
            selected_zone = ZoneInfo.from_file(io.BytesIO((ROOT / "testdata/tzif/paris.tzif").read_bytes()))
        elif zone == "FUTURE":
            selected_zone = tz.tzstr("EST5EDT,M3.2.0,M11.1.0")
        elif zone:
            selected_zone = dt.timezone(dt.timedelta(seconds=int(zone)))
        else:
            selected_zone = dt.timezone.utc
        axis = types.SimpleNamespace(__name__="xaxis", get_inverted=lambda: inverted)
        locator = types.SimpleNamespace(axis=axis)
        formatter = ref["ConciseDateFormatter"](locator, tz=selected_zone, **options)
        values = [float(x) for x in ref["date2num"](dates)]
        labels = formatter.format_ticks(values)
        cases.append({"label": label, "values": values, "options": options, "zone": zone,
                      "inverted": inverted, "labels": labels, "offset": formatter.get_offset(),
                      "single": formatter(values[0]), "short": formatter.format_data_short(values[0])})

    variants = [("default", {}), ("formats", {"formats": custom}),
                ("zero formats", {"zero_formats": zeros}), ("offset formats", {"offset_formats": offsets}),
                ("no offset", {"show_offset": False}), ("tex", {"usetex": True})]
    for label, dates in patterns.items():
        for name, options in variants:
            add(label + " / " + name, dates, options=options)
        add(label + " / inverted", dates, inverted=True)
        add(label + " / reversed", dates[::-1])
        add(label + " / reversed inverted", dates[::-1], inverted=True)
    for offset in ["10800", "561", "-17762"]:
        for label in ["hours", "minutes", "seconds", "subseconds"]:
            add(label + " / offset " + offset, patterns[label], zone=offset)
    add("empty format arrays choose defaults", patterns["hours"], options={"formats": [], "zero_formats": [], "offset_formats": []})
    for value in [base, base.replace(second=1), base.replace(microsecond=123456)]:
        add("singleton " + value.isoformat(), [value])
        add("duplicate " + value.isoformat(), [value, value])
    micro_base = dt.datetime(1996, 12, 31, tzinfo=dt.timezone.utc)
    add("upstream mixed precision 500 and 900us", [micro_base + dt.timedelta(microseconds=x) for x in [0, 500, 900]])
    add("microseconds shared decimal count", [base + dt.timedelta(microseconds=x) for x in [0, 10000, 100000, 250000]])
    add("microseconds custom suffix prevents trimming", [base + dt.timedelta(microseconds=x) for x in [0, 10000, 100000]], options={"formats": custom})
    for zone, first in [("NY", dt.datetime(2024, 3, 10, 6, tzinfo=dt.timezone.utc)),
                        ("NY", dt.datetime(2024, 11, 3, 5, tzinfo=dt.timezone.utc)),
                        ("FUTURE", dt.datetime(2400, 11, 5, 5, tzinfo=dt.timezone.utc)),
                        ("PARIS", dt.datetime(1900, 1, 1, tzinfo=dt.timezone.utc))]:
        dates = [first + dt.timedelta(minutes=30 * x) for x in range(6)]
        add(zone + " / " + first.isoformat(), dates, zone=zone)
        add(zone + " / exact offset labels / " + first.isoformat(), dates, zone=zone,
            options={"formats": ["%Y", "%b", "%d", "%H:%M %Z %z", "%H:%M %Z %z", "%S.%f %Z %z"]})
    add("literal unicode punctuation and tex", patterns["subseconds"], options={
        "formats": ["年%Y", "%b", "%d", "α %H:%M", "%H:%M", "β%S.%f-xy"],
        "zero_formats": ["", "%Y", "%b", "%d", "%H:%M", "z %H:%M"], "usetex": True})
    add("multiple dots and shared trailing zeros", patterns["subseconds"], options={"formats": ["%Y", "%b", "%d", "%H:%M", "%H:%M", "%S.%f.000"]})
    code = "// Generated by generate_concise_date_reference.py from pinned v3.11.2.\n"
    for case in cases:
        args = ", ".join(key + "=" + moon(value) for key, value in case["options"].items())
        expression = "@date.concise_date_formatter(" + args + ")"
        zone = case["zone"]
        if zone in ["NY", "FUTURE"]:
            expression += ".with_timezone(@date.tzif_timezone(tzif_new_york))"
        elif zone == "PARIS":
            expression += ".with_timezone(@date.tzif_timezone(tzif_paris))"
        elif zone:
            expression += ".with_timezone(@date.fixed_timezone_seconds(" + zone + "))"
        code += "\n///|\ntest " + moon("concise reference: " + case["label"]) + " {\n"
        code += "  let formatter = " + expression + "\n  let values = " + moon(case["values"]) + "\n"
        inverse = "inverted=" + moon(case["inverted"])
        code += "  assert_eq(formatter.format_ticks(values, " + inverse + "), " + moon(case["labels"]) + ")\n"
        code += "  assert_eq(formatter.get_offset(), " + moon(case["offset"]) + ")\n"
        code += "  assert_eq(formatter.format_value(values[0]), " + moon(case["single"]) + ")\n"
        code += "  assert_eq(formatter.format_data_short(values[0]), " + moon(case["short"]) + ")\n"
        code += "  let generic = formatter.as_formatter()\n"
        code += "  assert_eq(generic.format_values(values, " + inverse + "), " + moon(case["labels"]) + ")\n"
        code += "  assert_eq(generic.offset_label(values, " + inverse + "), " + moon(case["offset"]) + ")\n}\n"
    code = subprocess.run(["moonfmt", "-"], input=code, text=True, stdout=subprocess.PIPE, check=True).stdout
    epoch_outputs = {}
    epoch_cases = []
    for name, epoch in [("2400", "2400-01-01T00:00:00"), ("fraction", "2000-01-01T00:00:00.123456")]:
        selected = load_reference(path, epoch)
        year = 2400 if name == "2400" else 2000
        dates = [dt.datetime(year, 1, 1, microsecond=x, tzinfo=dt.timezone.utc) for x in [0, 100, 500, 900, 1000]]
        values = [float(x) for x in selected["date2num"](dates)]
        formatter = selected["ConciseDateFormatter"](types.SimpleNamespace(axis=None))
        labels = formatter.format_ticks(values)
        offset = formatter.get_offset()
        epoch_cases.append({"epoch": epoch, "values": values, "labels": labels, "offset": offset})
        extra = "// Generated by generate_concise_date_reference.py from pinned v3.11.2.\n\n///|\nfn verify_concise_epoch_reference() -> Unit raise {\n"
        extra += "  let values = " + moon(values) + "\n  let formatter = @date.concise_date_formatter()\n"
        extra += "  assert_eq(formatter.format_ticks(values), " + moon(labels) + ")\n"
        extra += "  assert_eq(formatter.get_offset(), " + moon(offset) + ")\n}\n"
        epoch_outputs[ROOT / "tests/integration" / ("epoch_" + name) / "concise_reference_test.mbt"] = subprocess.run(["moonfmt", "-"], input=extra, text=True, stdout=subprocess.PIPE, check=True).stdout
    metadata = {"matplotlib_commit": "d3ca9172e392048ec242b90e8423e88d1a3000b2", "dates_py_sha256": SHA256,
                "python": sys.version.split()[0], "numpy": np.__version__, "dateutil": dateutil.__version__,
                "tzif_sha256": {name: hashlib.sha256((ROOT / "testdata/tzif" / (name + ".tzif")).read_bytes()).hexdigest() for name in ["new_york", "paris"]},
                "locale": "C", "epoch": "1970-01-01T00:00:00", "case_count": len(cases),
                "timezone_reference": "CPython ZoneInfo.from_file for TZif fixtures (retains equal-offset abbreviation transitions); dateutil tzstr for future POSIX rules",
                "note": "Pinned class/helper AST; explicit ticks isolate formatter behavior from AutoDateLocator selection. Empty array behavior is a documented port adaptation.",
                "cases": cases, "epoch_cases": epoch_cases}
    return code, json.dumps(metadata, ensure_ascii=False, indent=2) + "\n", len(cases), epoch_outputs


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("dates_py", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    code, metadata, count, epoch_outputs = generate(args.dates_py)
    for path, value in [(ROOT / "ticker/date/concise_reference_test.mbt", code),
                        (ROOT / "testdata/concise_date_reference.json", metadata)] + list(epoch_outputs.items()):
        if args.check:
            if path.read_text() != value:
                raise SystemExit("reference differs: " + str(path.relative_to(ROOT)))
        else:
            path.write_text(value)
    print(("Verified" if args.check else "Generated") + " D06: " + str(count) + " concise formatter cases + 2 isolated epoch cases")


if __name__ == "__main__":
    main()
