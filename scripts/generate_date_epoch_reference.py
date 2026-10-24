"""Generate D05 epoch assertions from the pinned Matplotlib helpers.

Requires NumPy and python-dateutil. No installed Matplotlib is imported.
Each epoch runs in a separate MoonBit test package, preserving its global lock.
"""
from pathlib import Path
import argparse
import ast
import datetime
import hashlib
import json
import random
import subprocess
import sys
import types

import dateutil
import dateutil.tz
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
SHA256 = "fb8d673fbc57c2499f2dd138c87c6c9520a59b38b60b01a6d59d5eb6540ef233"
EPOCHS = {
    "2000": "2000-01-01T00:00:00",
    "2400": "2400-01-01T00:00:00",
    "legacy": "0000-12-31",
    "clock": "1970-01-01T01:02:03",
    "fraction": "2000-01-01T00:00:00.123456",
    "bce": "-0001-12-31",
    "expanded": "+10000-01-01",
}


def load_reference(path, epoch):
    if hashlib.sha256(path.read_bytes()).hexdigest() != SHA256:
        raise ValueError("dates.py does not match pinned Matplotlib commit")
    names = {"_dt64_to_ordinalf", "date2num", "_from_ordinalf", "drange"}
    nodes = [n for n in ast.parse(path.read_text()).body
             if isinstance(n, ast.FunctionDef) and n.name in names]
    if {n.name for n in nodes} != names:
        raise ValueError("missing pinned upstream helpers")
    namespace = {
        "np": np, "datetime": datetime, "dateutil": dateutil,
        "UTC": datetime.timezone.utc, "SEC_PER_DAY": 86400,
        "MUSECONDS_PER_DAY": 86400000000, "get_epoch": lambda: epoch,
        "_get_tzinfo": lambda zone: zone or datetime.timezone.utc,
        "cbook": types.SimpleNamespace(_unpack_to_numpy=lambda value: value),
    }
    exec(compile(ast.Module(body=nodes, type_ignores=[]), str(path), "exec"), namespace)
    return namespace


def fields(value):
    return [value.year, value.month, value.day, value.hour, value.minute,
            value.second, value.microsecond, int(value.utcoffset().total_seconds())]


def moon(value):
    if isinstance(value, list):
        return "[" + ", ".join(moon(x) for x in value) + "]"
    if isinstance(value, float):
        text = repr(value)
        if "e" in text and "." not in text.split("e")[0]:
            text = text.replace("e", ".0e")
        return text
    return json.dumps(value)


def generate(path):
    rng = random.Random(20261022)
    dates = []
    for year in [1, 1800, 1900, 1970, 1999, 2000, 2024, 2400, 9999]:
        for microsecond in [0, 1, 9, 11, 123456, 999999]:
            dates.append(datetime.datetime(year, 3, 1, 2, 3, 4, microsecond,
                                           tzinfo=datetime.timezone.utc))
    for _ in range(80):
        zone = datetime.timezone(datetime.timedelta(seconds=rng.choice([0, 561, -17762, 20700])))
        dates.append(datetime.datetime(rng.randint(2, 9998), rng.randint(1, 12),
                                       rng.randint(1, 28), rng.randrange(24),
                                       rng.randrange(60), rng.randrange(60),
                                       rng.randrange(1000000), tzinfo=zone))
    outputs = {}
    metadata = {"matplotlib_commit": "d3ca9172e392048ec242b90e8423e88d1a3000b2",
                "dates_py_sha256": SHA256, "python": sys.version.split()[0],
                "numpy": np.__version__, "dateutil": dateutil.__version__,
                "note": "Pinned AST only, no installed Matplotlib; epoch subsecond asymmetry is upstream behavior.",
                "epochs": {}}
    for name, epoch in EPOCHS.items():
        ref = load_reference(path, epoch)
        rows = []
        for dt in dates:
            ordinal = float(ref["date2num"](dt))
            for offset in [0, 561, -17762, 20700]:
                zone = datetime.timezone(datetime.timedelta(seconds=offset))
                try:
                    decoded = fields(ref["_from_ordinalf"](ordinal, zone))
                except (ValueError, OverflowError):
                    decoded = None
                rows.append({"date": fields(dt), "ordinal": ordinal,
                             "offset": offset, "decoded": decoded})
        probes = []
        for x in [0.0, 1.0, -1.0, 25550.0, -25550.0,
                  25550.00000142889, -25550.00000142889, 1e-11, -1e-11,
                  106751992.0, -106751992.0, 1e100]:
            try:
                decoded = fields(ref["_from_ordinalf"](x))
            except (ValueError, OverflowError):
                decoded = None
            probes.append({"ordinal": x, "decoded": decoded})
        first = datetime.datetime(2400, 1, 1, microsecond=123456, tzinfo=datetime.timezone.utc)
        ranges = []
        for delta in [datetime.timedelta(hours=7), datetime.timedelta(microseconds=200003)]:
            last = first + (datetime.timedelta(days=2) if delta.days or delta.seconds else datetime.timedelta(seconds=1))
            ranges.append({"start": fields(first), "end": fields(last),
                           "delta": [delta.days, delta.seconds, delta.microseconds],
                           "values": [float(x) for x in ref["drange"](first, last, delta)]})
        code = "// Generated from pinned Matplotlib v3.11.2 by generate_date_epoch_reference.py.\n"
        code += "\n///|\nfn reference_date(v : Array[Int]) -> @date.DateTime {\n"
        code += "  try! @date.datetime(v[0], v[1], v[2], hour=v[3], minute=v[4], second=v[5], microsecond=v[6], offset_seconds=v[7])\n}\n"
        code += "\n///|\nfn reference_fields(v : @date.DateTime) -> Array[Int] {\n"
        code += "  [v.year(), v.month(), v.day(), v.hour(), v.minute(), v.second(), v.microsecond(), v.offset_seconds()]\n}\n"
        code += "\n///|\nfn verify_reference() -> Unit raise {\n"
        code += "  let rows : Array[(Array[Int], Double, Int, Array[Int]?)] = [\n"
        for row in rows:
            decoded = "None" if row["decoded"] is None else "Some(" + moon(row["decoded"]) + ")"
            code += "    (" + ", ".join([moon(row["date"]), moon(row["ordinal"]), str(row["offset"]), decoded]) + "),\n"
        code += "  ]\n  for row in rows {\n"
        code += "    let (date, ordinal, offset, decoded) = row\n"
        code += "    assert_eq(reference_date(date).to_ordinal(), ordinal)\n"
        code += "    let actual = try { Some(reference_fields(@date.from_ordinal(ordinal, offset_seconds=offset))) } catch { _ => None }\n"
        code += "    assert_eq(actual, decoded)\n  }\n"
        code += "  let probes : Array[(Double, Array[Int]?)] = [\n"
        for row in probes:
            decoded = "None" if row["decoded"] is None else "Some(" + moon(row["decoded"]) + ")"
            code += "    (" + moon(row["ordinal"]) + ", " + decoded + "),\n"
        code += "  ]\n  for probe in probes {\n    let (ordinal, decoded) = probe\n"
        code += "    let actual = try { Some(reference_fields(@date.num2date(ordinal))) } catch { _ => None }\n"
        code += "    assert_eq(actual, decoded)\n  }\n"
        for row in ranges:
            args = f"days={row['delta'][0]}, seconds={row['delta'][1]}, microseconds={row['delta'][2]}"
            code += "  let values = @date.drange(reference_date(" + moon(row["start"]) + "), reference_date(" + moon(row["end"]) + "), @date.timedelta(" + args + "))\n"
            code += "  assert_eq(values, " + moon(row["values"]) + ")\n"
        code += "}\n"
        formatted = subprocess.run(["moonfmt", "-"], input=code, text=True, check=True, stdout=subprocess.PIPE).stdout
        outputs[ROOT / "tests/integration" / ("epoch_" + name) / "reference_test.mbt"] = formatted
        metadata["epochs"][epoch] = {"forward_inverse_cases": len(rows), "inverse_probes": probes, "ranges": ranges}
    outputs[ROOT / "testdata/date_epoch_reference.json"] = json.dumps(metadata, indent=2) + "\n"
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
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(value)
    print(("Verified" if args.check else "Generated") + " D05: 7 epochs, 3752 forward/inverse cases, 84 inverse probes, 14 ranges")


if __name__ == "__main__":
    main()
