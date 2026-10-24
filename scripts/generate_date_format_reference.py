"""Run pinned date formatters and C-locale Gregorian calendar oracles."""
from pathlib import Path
import argparse
import datetime as dt
import hashlib
import io
import json
import locale
import platform
import sys
import types
from zoneinfo import ZoneInfo
import numpy as np
import dateutil
import generate_auto_locator_reference as base
from generate_auto_date_reference import moon, formatted

ROOT = base.ROOT
CPYTHON_SHA = 'bf16f5f4c0fff97d03147c7d3a1c763fc233fa703ad180bdb96e9b40afc7ec6e'
CALENDAR_FORMAT = '%j %U %W %G %V %u'
FULL_FORMAT = '%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X'


def digest(text, initial=0):
    for byte in text.encode('ascii'):
        initial = (initial * 31 + byte) % 1_000_000_007
    return initial


def generate(path):
    locale.setlocale(locale.LC_TIME, 'C')
    # Pin minimum-year padding and C composite output explicitly instead of
    # silently recording a different libc's platform-dependent representation.
    if dt.datetime(1, 1, 1).strftime('%G %c') != '0001 Mon Jan  1 00:00:00 0001':
        raise ValueError('reference runtime must retain pinned four-digit C-locale year padding')
    ref = base.load_reference(path)
    cases = []
    for year in [1, 9, 99, 100, 400, 999, 1000, 1582, 1600, 1700, 1800, 1900,
                 1998, 1999, 2000, 2004, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2023, 2024, 2400, 9999]:
        for month, day in [(1, 1), (12, 31)]:
            cases.append((dt.datetime(year, month, day, tzinfo=dt.timezone.utc), '', FULL_FORMAT, False))
    for hour, minute, second in [(0, 0, 0), (0, 0, 1), (11, 59, 59), (12, 0, 0), (12, 0, 1), (13, 0, 0), (23, 59, 59)]:
        cases.append((dt.datetime(2024, 2, 29, hour, minute, second, tzinfo=dt.timezone.utc), '', FULL_FORMAT, False))
    for date in ['2015-12-28', '2016-01-03', '2016-01-04', '2018-12-31', '2019-12-30', '2021-01-03', '2021-01-04', '2023-01-02', '2024-02-28', '2024-03-01']:
        cases.append((dt.datetime.fromisoformat(date).replace(tzinfo=dt.timezone.utc), '', FULL_FORMAT, False))
    for label, zone in [('561', dt.timezone(dt.timedelta(seconds=561))), ('-17762', dt.timezone(dt.timedelta(seconds=-17762))),
                        ('NY', ZoneInfo.from_file(io.BytesIO((ROOT / 'testdata/tzif/new_york.tzif').read_bytes())))]:
        for instant in ['2021-01-04T00:00:00+00:00', '2024-03-10T06:59:59+00:00', '2024-03-10T07:00:00+00:00',
                        '2024-11-03T05:30:00+00:00', '2024-11-03T06:30:00+00:00']:
            cases.append((dt.datetime.fromisoformat(instant).astimezone(zone), label, FULL_FORMAT + '|%z %Z', False))
    cases.append((dt.datetime(2021, 1, 1, 13, 5, tzinfo=dt.timezone.utc), '', 'week %G-W%V %I:%M %p', True))
    rows = []
    code = '// Generated from pinned DateFormatter and C-locale strftime.\n'
    for index, (value, zone, fmt, tex) in enumerate(cases):
        formatter = ref['DateFormatter'](fmt, tz=value.tzinfo, usetex=tex)
        number = float(ref['date2num'](value))
        expected = formatter(number)
        direct = value.strftime(fmt)
        zone_expr = '@date.tzif_timezone(tzif_new_york)' if zone == 'NY' else ('@date.fixed_timezone_seconds(' + zone + ')' if zone else '')
        expression = '@date.parse_iso(' + moon(value.isoformat()) + ')' + ('.with_timezone(zone)' if zone == 'NY' else '')
        code += '\n///|\ntest ' + moon('date format reference %s: %s/%s' % (index, value.isoformat(), zone or 'UTC')) + ' {\n'
        if zone_expr: code += '  let zone = ' + zone_expr + '\n'
        code += '  let value = ' + expression + '\n'
        code += '  assert_eq(@date.format_date(value, ' + moon(fmt) + '), ' + moon(direct) + ')\n'
        fmt_expr = '@date.date_formatter(' + moon(fmt) + ')' + ('.with_timezone(zone)' if zone_expr else '') + ('.with_usetex(true)' if tex else '')
        code += '  assert_eq(' + fmt_expr + '.format_value(' + moon(number) + '), ' + moon(expected) + ')\n}\n'
        rows.append(dict(date=value.isoformat(), zone=zone or 'UTC', format=fmt, usetex=tex, number=number, direct=direct, label=expected))
    hashes = []
    for year in range(1, 401):
        value = dt.datetime(year, 1, 1)
        last = dt.datetime(year + 1, 1, 1)
        h = 0
        while value < last:
            h = digest(value.strftime(CALENDAR_FORMAT), h)
            value += dt.timedelta(days=1)
        hashes.append(h)
    code += '\n///|\ntest "C locale calendar oracle covers every day of the first Gregorian cycle" {\n'
    code += '  let expected : Array[Int64] = [' + ', '.join(str(x) + 'L' for x in hashes) + ']\n'
    code += '''  for index in 0..<400 {
    let year = index + 1
    let first = @date.datetime(year, 1, 1).to_ordinal()
    let last = @date.datetime(year + 1, 1, 1).to_ordinal()
    let mut hash = 0L
    for day in 0..<(last - first).to_int() {
      let value = @date.num2date(first + Double::from_int(day))
      let label = @date.format_date(value, "%j %U %W %G %V %u")
      for char in label.to_array() { hash = (hash * 31L + Int64::from_int(char.to_int())) % 1_000_000_007L }
    }
    assert_eq((year, hash), (year, expected[index]))
  }
}
'''
    # Original Auto and Concise formatters exercise reuse rather than a parallel formatter.
    fmt = '%G-W%V-%u %I:%M %p'
    numbers = [float(x) for x in ref['date2num']([dt.datetime(2020, 12, 31, 23), dt.datetime(2021, 1, 1, 13)])]
    auto = ref['AutoDateFormatter'](types.SimpleNamespace(_get_unit=lambda: 1 / 24))
    auto.scaled[1 / 24] = fmt
    labels = [auto(v, i) for i, v in enumerate(numbers)]
    code += '\n///|\ntest "C locale date directives propagate through original automatic formatter" {\n'
    code += '  let formatter = @date.AutoDateFormatter::new().with_locator_unit(1.0 / 24.0).with_scale(1.0 / 24.0, @date.Text(' + moon(fmt) + '))\n'
    code += '  assert_eq(formatter.format_ticks(' + moon(numbers) + '), ' + moon(labels) + ')\n}\n'
    concise = ref['ConciseDateFormatter'](types.SimpleNamespace(axis=None), formats=[fmt] * 6, zero_formats=[fmt] * 6, offset_formats=[fmt] * 6)
    concise_labels = concise.format_ticks(numbers)
    code += '\n///|\ntest "C locale date directives propagate through original concise formatter" {\n'
    code += '  let formats = [' + ', '.join([moon(fmt)] * 6) + ']\n'
    code += '  let formatter = @date.concise_date_formatter(formats~, zero_formats=formats, offset_formats=formats)\n'
    code += '  assert_eq(formatter.format_ticks(' + moon(numbers) + '), ' + moon(concise_labels) + ')\n'
    code += '  assert_eq(formatter.get_offset(), ' + moon(concise.get_offset()) + ')\n}\n'
    epoch_outputs = {}
    epoch_rows = []
    epoch_format = FULL_FORMAT + '|%f'
    for name, epoch, year in [('2400', '2400-01-01T00:00:00', 2400), ('fraction', '2000-01-01T00:00:00.123456', 2000)]:
        namespace = base.load_reference(path, epoch)
        formatter = namespace['DateFormatter'](epoch_format)
        dates = [dt.datetime(year, 1, 1, 13), dt.datetime(year, 12, 31, 23, 59, 59)]
        numbers = [float(x) for x in namespace['date2num'](dates)]
        labels = [formatter(value, index) for index, value in enumerate(numbers)]
        extra = '// Generated from pinned DateFormatter.\n\n///|\nfn verify_format_epoch_reference(formatter : @date.DateFormatter) -> Unit raise {\n'
        extra += '  assert_eq(formatter.format_values(' + moon(numbers) + '), ' + moon(labels) + ')\n}\n'
        epoch_outputs[ROOT / 'tests/integration' / ('epoch_' + name) / 'format_reference_test.mbt'] = formatted(extra)
        epoch_rows.append(dict(epoch=epoch, format=epoch_format, values=numbers, labels=labels))
    manifest = dict(matplotlib_commit='d3ca9172e392048ec242b90e8423e88d1a3000b2', dates_py_sha256=base.base.SHA256,
                    inspected_cpython_version='3.11.0', inspected_datetime_c_sha256=CPYTHON_SHA,
                    python=sys.version.split()[0], numpy=np.__version__, dateutil=dateutil.__version__,
                    platform=platform.system(), locale='C', named_case_count=len(cases) + 3, cases=rows,
                    calendar_format=CALENDAR_FORMAT, calendar_days=146097, calendar_year_hashes=hashes, epochs=epoch_rows,
                    digest='h=(h*31+ASCII byte)%1000000007; reset for each year',
                    automatic=dict(values=numbers, format=fmt, labels=labels),
                    concise=dict(values=numbers, format=fmt, labels=concise_labels, offset=concise.get_offset()),
                    note='Four-digit year/composite padding pinned explicitly. 146097-day digests supplement explicit boundary labels; unknown directives and OS extensions are outside the source oracle.')
    outputs = {ROOT / 'ticker/date/format_reference_test.mbt': formatted(code),
               ROOT / 'testdata/date_format_reference.json': json.dumps(manifest, ensure_ascii=False, indent=2) + '\n'}
    outputs.update(epoch_outputs)
    return outputs


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('dates_py', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    for path, content in generate(args.dates_py).items():
        if args.check:
            if path.read_text() != content: raise SystemExit('reference differs: ' + str(path.relative_to(ROOT)))
        else: path.write_text(content)
    print(('Verified' if args.check else 'Generated') + ' D10 C-locale date format references')


if __name__ == '__main__': main()
