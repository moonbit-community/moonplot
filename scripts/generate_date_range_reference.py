"""Generate D04 assertions by executing only pinned Matplotlib date helpers.

Run with Python+NumPy+python-dateutil. Pass the saved v3.11.2 dates.py path.
No installed Matplotlib is imported. --check leaves generated files unchanged.
"""
from pathlib import Path
import argparse
import ast
import datetime
import hashlib
import io
import json
import math
import random
import subprocess
import sys
import types
import numpy as np
from dateutil import tz
import dateutil

ROOT = Path(__file__).resolve().parents[1]


def load_reference(path):
    if hashlib.sha256(path.read_bytes()).hexdigest() != 'fb8d673fbc57c2499f2dd138c87c6c9520a59b38b60b01a6d59d5eb6540ef233':
        raise ValueError('dates.py does not match pinned Matplotlib commit')
    source = path.read_text()
    names = {'_dt64_to_ordinalf', 'date2num', 'num2timedelta', 'drange'}
    nodes = [node for node in ast.parse(source).body
             if isinstance(node, ast.FunctionDef) and node.name in names]
    if {node.name for node in nodes} != names:
        raise ValueError('missing pinned upstream functions')
    namespace = {'np': np, 'datetime': datetime, 'UTC': datetime.timezone.utc,
                 'SEC_PER_DAY': 86400, 'get_epoch': lambda: '1970-01-01',
                 'cbook': types.SimpleNamespace(_unpack_to_numpy=lambda value: value),
                 '_ordinalf_to_timedelta_np_vectorized': np.vectorize(
                     lambda value: datetime.timedelta(days=value), otypes='O')}
    exec(compile(ast.Module(body=nodes, type_ignores=[]), str(path), 'exec'), namespace)
    return namespace


def moon(value):
    if isinstance(value, list):
        return '[' + ', '.join(moon(x) for x in value) + ']'
    if isinstance(value, float):
        text = repr(value)
        if 'e' in text and '.' not in text.split('e')[0]:
            text = text.replace('e', '.0e')
        return text
    return json.dumps(value)


def fields(value):
    return [value.year, value.month, value.day, value.hour, value.minute,
            value.second, value.microsecond, int(value.utcoffset().total_seconds())]


def generate(path):
    ref = load_reference(path)
    values = [0.0, -0.0, 1.0, -1.0, 1.5, -1.5, 1.1, -1.1, 1e-12, -1e-12,
              999999999.0, -999999999.0, math.nextafter(1e9, 0),
              math.nextafter(-999999999.0, 0), 106751992.125, -106751992.125]
    for micros in [0.5, 1.5, 2.5, 3.5, 1000000.5, 86400000000.5]:
        value = micros / 86400000000.0
        values += [value, -value, math.nextafter(value, 0), math.nextafter(value, math.inf)]
    rng = random.Random(20261022)
    values += [rng.uniform(-999999998, 999999998) for _ in range(180)]
    values += [rng.uniform(-5, 5) for _ in range(120)]
    duration_rows = []
    for value in values:
        result = ref['num2timedelta'](value)
        duration_rows.append((value, result.days, result.seconds, result.microseconds, result.total_seconds()))
    base = datetime.datetime(2011, 1, 1, tzinfo=datetime.timezone.utc)
    zones = {}
    for name, file in [('NY', 'new_york'), ('PARIS', 'paris'), ('LH', 'lord_howe')]:
        zones[name] = tz.tzfile(io.BytesIO((ROOT / 'testdata/tzif' / (file + '.tzif')).read_bytes()))
    # dateutil tzfile does not extrapolate footer rules; use its equivalent
    # public POSIX rule object for the future-rule arithmetic assertions.
    future = tz.tzstr('EST5EDT,M3.2.0,M11.1.0')
    cases = []

    def add(label, first, last, delta, first_zone='', last_zone=''):
        try:
            with np.errstate(divide='ignore', invalid='ignore'):
                result = ref['drange'](first, last, delta)
        except (ValueError, OverflowError, ZeroDivisionError):
            result = None
        cases.append({'label': label, 'start': fields(first), 'end': fields(last),
                      'delta': [delta.days, delta.seconds, delta.microseconds],
                      'start_zone': first_zone, 'end_zone': last_zone,
                      'expected': None if result is None else [float(x) for x in result]})

    for hours in [1, 4, 7, 24, 25]:
        for shift in [-1, 0, 1]:
            add('hourly boundary %s/%s' % (hours, shift), base,
                base + datetime.timedelta(days=1, microseconds=shift), datetime.timedelta(hours=hours))
    for step in [1, 2, 7, 20, 1000]:
        add('microsecond step %s' % step, base, base + datetime.timedelta(microseconds=100), datetime.timedelta(microseconds=step))
    for year in [1, 1800, 1970, 2243, 9999]:
        first = datetime.datetime(year, 3, 1, microsecond=123456, tzinfo=datetime.timezone.utc)
        add('distant fractional %s' % year, first, first + datetime.timedelta(seconds=1, microseconds=19), datetime.timedelta(microseconds=200003))
    for step in [1, -1]:
        add('equal %s' % step, base, base, datetime.timedelta(days=step))
        add('reverse exact %s' % step, base + datetime.timedelta(days=4), base, datetime.timedelta(days=step))
        add('reverse fraction %s' % step, base + datetime.timedelta(days=4), base + datetime.timedelta(hours=12), datetime.timedelta(days=step))
    add('zero', base, base + datetime.timedelta(days=1), datetime.timedelta())
    add('positive reversed', base + datetime.timedelta(days=1), base, datetime.timedelta(hours=4))
    add('intermediate upper overflow', datetime.datetime(9999, 12, 31, tzinfo=datetime.timezone.utc), datetime.datetime(9999, 12, 31, hour=1, tzinfo=datetime.timezone.utc), datetime.timedelta(days=1))
    add('empty lower overflow', datetime.datetime(1, 1, 1, tzinfo=datetime.timezone.utc), datetime.datetime(1, 1, 1, tzinfo=datetime.timezone.utc), datetime.timedelta(days=1))
    for year, zone, key in [(2024, zones['NY'], 'NY'), (2400, future, 'NY')]:
        # Both years have a March 10/12 window encompassing the US spring change.
        for days in [1, 2]:
            first = datetime.datetime(year, 3, 9, tzinfo=zone)
            last = datetime.datetime(year, 3, 13, tzinfo=zone)
            add('spring %s/%s' % (year, days), first, last, datetime.timedelta(days=days), key, key)
    ny = zones['NY']
    add('spring imaginary endpoint', datetime.datetime(2024, 3, 10, tzinfo=ny), datetime.datetime(2024, 3, 10, hour=3, tzinfo=ny), datetime.timedelta(hours=1), 'NY', 'NY')
    add('fall fold1 start', tz.enfold(datetime.datetime(2024, 11, 3, hour=1, minute=30, tzinfo=ny), fold=1), datetime.datetime(2024, 11, 3, hour=3, minute=30, tzinfo=ny), datetime.timedelta(hours=1), 'NY', 'NY')
    add('different endpoint zone', datetime.datetime(2024, 3, 9, tzinfo=ny), datetime.datetime(2024, 3, 13, tzinfo=datetime.timezone.utc), datetime.timedelta(days=1), 'NY', '')
    lh = zones['LH']
    add('southern half-hour', datetime.datetime(2024, 4, 6, tzinfo=lh), datetime.datetime(2024, 4, 9, tzinfo=lh), datetime.timedelta(hours=12), 'LH', 'LH')
    for offset in [-17762, 561, 20700]:
        zone = datetime.timezone(datetime.timedelta(seconds=offset))
        first = datetime.datetime(1900, 1, 1, microsecond=123456, tzinfo=zone)
        add('fixed seconds %s' % offset, first, first + datetime.timedelta(hours=2), datetime.timedelta(minutes=17))
    add('intermediate UTC overflow corrected', datetime.datetime(9999, 12, 30, hour=19, tzinfo=ny), datetime.datetime(9999, 12, 31, hour=18, tzinfo=ny), datetime.timedelta(days=1), 'NY', 'NY')
    east = datetime.timezone(datetime.timedelta(hours=1))
    add('UTC input underflow', datetime.datetime(1, 1, 1, tzinfo=east), datetime.datetime(1, 1, 2, tzinfo=east), datetime.timedelta(days=1))
    west = datetime.timezone(datetime.timedelta(hours=-1))
    add('UTC input overflow', datetime.datetime(9999, 12, 31, hour=23, tzinfo=west), datetime.datetime(9999, 12, 31, hour=23, tzinfo=west), datetime.timedelta(hours=1))
    edge = datetime.datetime(9999, 12, 31, hour=23, minute=59, second=59, microsecond=999999, tzinfo=datetime.timezone.utc)
    add('valid UTC endpoint rounds to year10000 float', edge, edge, datetime.timedelta(seconds=1))
    edge_east = datetime.datetime(1, 1, 1, hour=1, tzinfo=east)
    add('empty final UTC endpoint underflow', edge_east, edge_east, datetime.timedelta(minutes=30))
    code = '// Generated by scripts/generate_date_range_reference.py from fixed v3.11.2 helpers.\n'
    code += '\n///|\nlet duration_references : Array[(Double, Int, Int, Int, Double)] = [\n'
    for row in duration_rows:
        code += '  (' + ', '.join(moon(x) for x in row) + '),\n'
    code += ']\n\n///|\nstruct RangeReference {\n label : String\n start : Array[Int]\n end : Array[Int]\n delta : Array[Int]\n start_zone : String\n end_zone : String\n expected : Array[Double]?\n}\n'
    code += '\n///|\nlet range_references : Array[RangeReference] = [\n'
    for case in cases:
        code += '  { ' + ', '.join(key + ': ' + (('None' if value is None else 'Some(' + moon(value) + ')') if key == 'expected' else moon(value)) for key, value in case.items()) + ' },\n'
    code += ']\n'
    formatted = subprocess.run(['moonfmt', '-'], input=code, text=True, check=True, stdout=subprocess.PIPE).stdout
    metadata = {'matplotlib_commit': 'd3ca9172e392048ec242b90e8423e88d1a3000b2',
                'dates_py_sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
                'python': sys.version.split()[0], 'numpy': np.__version__, 'dateutil': dateutil.__version__,
                'duration_cases': len(duration_rows), 'range_cases': len(cases),
                'note': 'Pinned helper AST only; no installed Matplotlib imported. UTC epoch 1970; same retained tzinfo for same named endpoints.'}
    return formatted, json.dumps(metadata, indent=2) + '\n'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('dates_py', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    code, metadata = generate(args.dates_py)
    for path, value in [(ROOT / 'ticker/date/range_reference_test.mbt', code),
                        (ROOT / 'testdata/date_range_reference.json', metadata)]:
        if args.check:
            if path.read_text() != value:
                raise SystemExit('reference differs: ' + str(path.relative_to(ROOT)))
        else:
            path.write_text(value)
    print(('Verified' if args.check else 'Generated') + ' D04 references: ' + metadata.replace('\n', ' '))


if __name__ == '__main__':
    main()
