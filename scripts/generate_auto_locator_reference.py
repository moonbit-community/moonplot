"""Generate full AutoDateLocator assertions from pinned Matplotlib classes.

Executes original date, rrule, year, microsecond and MultipleLocator classes.
Only the abstract ticker base/axis and warning sink are stubbed. No installed
Matplotlib is imported. Requires NumPy and python-dateutil for regeneration.
"""
from pathlib import Path
import argparse
import ast
import datetime as dt
import functools
import hashlib
import io
import json
import locale
import math
import re
import subprocess
import sys
import types
from zoneinfo import ZoneInfo

import dateutil
from dateutil import rrule as rr
from dateutil.relativedelta import relativedelta
import numpy as np
import generate_concise_date_reference as base
from generate_auto_date_reference import moon, formatted, RC_SHA

ROOT = base.ROOT
TICKER_SHA = '49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad'
FREQUENCIES = {0: 'Year', 1: 'Month', 3: 'Day', 4: 'Hour', 5: 'Minute', 6: 'Second', 7: 'Microsecond'}


def load_reference(path, epoch='1970-01-01T00:00:00'):
    namespace = base.load_reference(path, epoch)
    ticker_path = path.parent / 'ticker.py'
    if hashlib.sha256(ticker_path.read_bytes()).hexdigest() != TICKER_SHA:
        raise ValueError('ticker.py does not match pinned source')

    class Locator:
        axis = None
        def set_axis(self, axis): self.axis = axis
        def raise_if_exceeds(self, values): return values

    namespace.update(Locator=Locator, functools=functools, rrule=rr.rrule, relativedelta=relativedelta,
                     DAYS_PER_YEAR=365.0, DAYS_PER_MONTH=30.0, DAYS_PER_WEEK=7.0,
                     MONTHS_PER_YEAR=12.0, HOURS_PER_DAY=24.0, MIN_PER_HOUR=60.0, MINUTES_PER_DAY=1440.0)
    namespace.update({name: getattr(rr, name) for name in ['YEARLY', 'MONTHLY', 'WEEKLY', 'DAILY', 'HOURLY', 'MINUTELY', 'SECONDLY']})
    namespace['MICROSECONDLY'] = 7
    namespace['ticker'].Locator = Locator
    nodes = [node for node in ast.parse(ticker_path.read_text()).body
             if isinstance(node, ast.ClassDef) and node.name in ['_Edge_integer', 'MultipleLocator']]
    exec(compile(ast.Module(body=nodes, type_ignores=[]), str(ticker_path), 'exec'), namespace)
    namespace['ticker']._Edge_integer = namespace['_Edge_integer']
    namespace['ticker'].MultipleLocator = namespace['MultipleLocator']
    rc_path = path.parent / 'mpl-data/matplotlibrc'
    if hashlib.sha256(rc_path.read_bytes()).hexdigest() != RC_SHA: raise ValueError('rc reference differs')
    namespace['mpl'].rcParams = dict(re.findall(r'^#(date\.autoformatter\.\w+):\s+(.*?)\s*$', rc_path.read_text(), re.M))
    names = {'rrulewrapper', 'DateLocator', 'RRuleLocator', 'AutoDateLocator', 'YearLocator', 'MicrosecondLocator', 'AutoDateFormatter'}
    nodes = [node for node in ast.parse(path.read_text()).body if isinstance(node, ast.ClassDef) and node.name in names]
    if {node.name for node in nodes} != names:
        raise ValueError('missing pinned locator classes')
    exec(compile(ast.Module(body=nodes, type_ignores=[]), str(path), 'exec'), namespace)
    return namespace


def generate(path):
    locale.setlocale(locale.LC_TIME, 'C')
    ref = load_reference(path)
    cases = []

    def add(label, first, last, *, multiples=True, minticks=5, maxticks=None, intervals=None, zone=''):
        cases.append(dict(label=label, first=first, last=last, multiples=multiples, minticks=minticks,
                          maxticks=maxticks, intervals=intervals or {}, zone=zone))

    spans = [dt.timedelta(weeks=52*200), dt.timedelta(weeks=52), dt.timedelta(days=141),
             dt.timedelta(days=40), dt.timedelta(hours=40), dt.timedelta(minutes=20),
             dt.timedelta(seconds=40), dt.timedelta(microseconds=1500)]
    for multiples, year in [(False, 1990), (True, 1997)]:
        first = dt.datetime(year, 1, 1, tzinfo=dt.timezone.utc)
        for index, span in enumerate(spans):
            add('upstream spans %s/%s' % (multiples, index), first, first + span, multiples=multiples)
    first = dt.datetime(2024, 1, 10, 3, 7, 11, 123456, tzinfo=dt.timezone.utc)
    for count in [1, 2, 5, 8, 20]:
        for span in [dt.timedelta(days=182), dt.timedelta(hours=17), dt.timedelta(microseconds=117)]:
            add('maxticks %s/%s' % (count, span), first, first + span, maxticks=count)
    for minimum in [1, 2, 9, 25]:
        add('minticks %s' % minimum, first, first + dt.timedelta(days=50), minticks=minimum)
    add('per frequency maxima', first, first + dt.timedelta(days=500), maxticks={0: 3, 1: 5, 3: 7})
    for frequency, table in [(4, [3]), (4, [7]), (4, [14]), (4, [6, 3]), (3, [2])]:
        for multiples in [True, False]:
            span = dt.timedelta(hours=40) if frequency == 4 else dt.timedelta(days=141)
            add('custom intervals %s/%s/%s' % (frequency, table, multiples), first, first + span,
                intervals={frequency: table}, multiples=multiples)
    for a, b in [('2024-01-31', '2024-02-29'), ('2023-01-31', '2023-03-01'),
                 ('2024-02-28T23:30', '2024-03-31T00:15'), ('1900-02-28', '1900-03-31'),
                 ('2000-02-29', '2005-02-28')]:
        start = dt.datetime.fromisoformat(a).replace(tzinfo=dt.timezone.utc)
        end = dt.datetime.fromisoformat(b).replace(tzinfo=dt.timezone.utc)
        add('month boundary ' + a + '/' + b, start, end)
    for year in [1800, 1970, 2024, 2400]:
        start = dt.datetime(year, 1, 1, tzinfo=dt.timezone.utc)
        for micros in [0, 1, 4, 5, 9, 500, 1001]:
            add('micro/point %s/%s' % (year, micros), start, start + dt.timedelta(microseconds=micros))
    for zone in ['PARIS', 'NY', '561', '-17762', '10800']:
        tz = (ZoneInfo.from_file(io.BytesIO((ROOT / 'testdata/tzif' / ('paris.tzif' if zone == 'PARIS' else 'new_york.tzif')).read_bytes()))
              if zone in ['PARIS', 'NY'] else dt.timezone(dt.timedelta(seconds=int(zone))))
        start = dt.datetime(1900 if zone == 'PARIS' else 2024, 1, 1, tzinfo=tz)
        for span in [dt.timedelta(days=141), dt.timedelta(hours=40), dt.timedelta(minutes=20)]:
            add('timezone %s/%s' % (zone, span), start, start + span, zone=zone)
    code = '// Generated by generate_auto_locator_reference.py from pinned v3.11.2 classes.\n'
    metadata_rows = []
    for case in cases:
        zone = case['first'].tzinfo
        options = dict(minticks=case['minticks'], interval_multiples=case['multiples'])
        if case['maxticks'] is not None: options['maxticks'] = case['maxticks']
        locator = ref['AutoDateLocator'](tz=zone, **options)
        locator.intervald.update(case['intervals'])
        warnings = []
        ref['_api'].warn_external = lambda message: warnings.append(str(message))
        numbers = [float(x) for x in ref['date2num']([case['first'], case['last']])]
        locator.set_axis(types.SimpleNamespace(get_view_interval=lambda: numbers))
        first_date, last_date = locator.viewlim_to_dt()
        selected = locator.get_locator(first_date, last_date)
        selected_interval = int(selected._get_interval())
        selected_unit = float(selected._get_unit())
        ticks = [float(x) for x in selected()]
        frequency = FREQUENCIES[locator._freq]
        warning_kinds = sorted(set('precision' if 'microsecond' in value else 'interval' for value in warnings))
        args = ['minticks=' + str(case['minticks']), 'interval_multiples=' + moon(case['multiples'])]
        if isinstance(case['maxticks'], int): args.append('maxticks=@date.All(' + str(case['maxticks']) + ')')
        if isinstance(case['maxticks'], dict): args.append('maxticks=@date.ByFrequency([' + ', '.join('(@date.' + FREQUENCIES[key] + ', ' + str(value) + ')' for key, value in case['maxticks'].items()) + '])')
        expression = '@date.AutoDateLocator::new(' + ', '.join(args) + ')'
        for freq, table in case['intervals'].items(): expression += '.with_intervals(@date.' + FREQUENCIES[freq] + ', ' + moon(table) + ')'
        if case['zone'] in ['NY', 'PARIS']:
            expression += '.with_timezone(@date.tzif_timezone(' + ('tzif_new_york' if case['zone'] == 'NY' else 'tzif_paris') + '))'
        elif case['zone']:
            expression += '.with_timezone(@date.fixed_timezone_seconds(' + case['zone'] + '))'
        code += '\n///|\ntest ' + moon('auto locator reference: ' + case['label']) + ' {\n  let locator = ' + expression + '\n'
        code += '  let selected = locator.get_locator_for_range(' + moon(numbers[0]) + ', ' + moon(numbers[1]) + ')\n'
        code += '  assert_eq(locator.frequency(), @date.' + frequency + ')\n'
        code += '  assert_eq(selected.interval(), ' + str(selected_interval) + ')\n'
        code += '  assert_eq(selected.unit_scale(), ' + moon(selected_unit) + ')\n'
        code += '  assert_eq(locator.tick_values(' + moon(numbers[0]) + ', ' + moon(numbers[1]) + '), ' + moon(ticks) + ')\n'
        code += '  assert_eq(locator.frequency(), @date.' + frequency + ')\n'
        code += '  assert_eq(locator.warnings().any(value => value is @date.IntervalFallback(_, _)), ' + moon('interval' in warning_kinds) + ')\n'
        code += '  assert_eq(locator.warnings().contains(@date.DistantMicroseconds), ' + moon('precision' in warning_kinds) + ')\n}\n'
        metadata_rows.append({**{key: value for key, value in case.items() if key not in ['first', 'last']},
                              'first': case['first'].isoformat(), 'last': case['last'].isoformat(),
                              'numbers': numbers, 'frequency': frequency, 'selected_interval': selected_interval,
                              'selected_unit': selected_unit, 'ticks': ticks, 'warnings': warning_kinds})
    # Verify the old concise integration expectations against real automatic ticks.
    bounds = [dt.datetime(2024, 1, 30, tzinfo=dt.timezone.utc), dt.datetime(2024, 2, 2, tzinfo=dt.timezone.utc)]
    numbers = [float(x) for x in ref['date2num'](bounds)]
    locator = ref['AutoDateLocator']()
    axis = types.SimpleNamespace(get_view_interval=lambda: numbers, __name__='xaxis', get_inverted=lambda: False)
    locator.set_axis(axis)
    ticks = locator()
    concise = ref['ConciseDateFormatter'](locator)
    labels = concise.format_ticks(ticks)
    concise_forward = concise.get_offset()
    concise_ticks = [float(x) for x in ticks]
    concise_labels = labels.copy()
    axis.get_inverted = lambda: True
    concise.format_ticks(ticks)
    concise_reverse = concise.get_offset()
    direct_rows = []
    direct_cases = [
        ('mixed offset month/year', '2024-01-01T00:00:00+23:00', '2023-12-31T00:00:00-23:00', 5, None, {}),
        ('reverse month-end', '2024-03-31T00:00:00+00:00', '2024-02-28T23:59:59.500000+00:00', 5, None, {}),
        ('reverse signed residual hour', '2024-03-31T00:00:00+00:00', '2024-02-28T23:00:00.500000+00:00', 32, 63, {4: [12, 24]}),
        ('historical seconds offsets', '1900-01-01T00:00:00+00:09:21', '1900-01-02T00:00:00-04:56:02', 5, None, {}),
    ]
    for label, a, b, minimum, maximum, tables in direct_cases:
        locator = ref['AutoDateLocator'](minticks=minimum, maxticks=maximum, interval_multiples=False)
        locator.intervald.update(tables)
        chosen = locator.get_locator(dt.datetime.fromisoformat(a), dt.datetime.fromisoformat(b))
        expr = '@date.AutoDateLocator::new(minticks=' + str(minimum) + ', interval_multiples=false' + (', maxticks=@date.All(' + str(maximum) + ')' if maximum else '') + ')'
        for freq, table in tables.items(): expr += '.with_intervals(@date.' + FREQUENCIES[freq] + ', ' + moon(table) + ')'
        code += '\n///|\ntest ' + moon('auto locator direct reference: ' + label) + ' {\n  let locator = ' + expr + '\n'
        code += '  let selected = locator.get_locator(@date.parse_iso(' + moon(a) + '), @date.parse_iso(' + moon(b) + '))\n'
        code += '  assert_eq(locator.frequency(), @date.' + FREQUENCIES[locator._freq] + ')\n'
        code += '  assert_eq(selected.interval(), ' + str(chosen._get_interval()) + ')\n}\n'
        direct_rows.append({'label': label, 'first': a, 'last': b, 'frequency': FREQUENCIES[locator._freq], 'selected_interval': int(chosen._get_interval())})
    nonsingular_rows = []
    for index, (a, b) in enumerate([(math.nan, math.inf), (math.inf, -math.inf), (0.0, 0.0), (100.0, 100.0), (-1.0, -2.0), (1e100, 1e100)]):
        result = ref['AutoDateLocator']().nonsingular(a, b)
        code += '\n///|\ntest "auto locator nonsingular reference ' + str(index) + '" {\n'
        code += '  assert_eq(@date.AutoDateLocator::new().nonsingular(' + moon(a) + ', ' + moon(b) + '), (' + moon(float(result[0])) + ', ' + moon(float(result[1])) + '))\n}\n'
        nonsingular_rows.append({'lower': repr(a), 'upper': repr(b), 'expected': list(result)})
    epoch_outputs = {}
    epoch_rows = []
    for name, epoch, year in [('2400', '2400-01-01T00:00:00', 2400), ('fraction', '2000-01-01T00:00:00.123456', 2000)]:
        namespace = load_reference(path, epoch)
        locator = namespace['AutoDateLocator']()
        formatter = namespace['AutoDateFormatter'](locator)
        namespace['_api'].warn_external = lambda message: None
        extra = '// Generated by generate_auto_locator_reference.py from pinned classes.\n\n///|\nfn verify_automatic_epoch_reference(locator : @date.AutoDateLocator) -> Unit raise {\n'
        extra += '  let formatter = @date.AutoDateFormatter::new(locator=locator.as_locator())\n'
        start = dt.datetime(year, 1, 1, tzinfo=dt.timezone.utc)
        for span in [dt.timedelta(microseconds=800), dt.timedelta(hours=40), dt.timedelta(microseconds=1), dt.timedelta()]:
            numbers = [float(x) for x in namespace['date2num']([start, start + span])]
            locator.set_axis(types.SimpleNamespace(get_view_interval=lambda: numbers))
            ticks = [float(x) for x in locator()]
            labels = [formatter(value, index) for index, value in enumerate(ticks)]
            extra += '  let values = locator.tick_values(' + moon(numbers[0]) + ', ' + moon(numbers[1]) + ')\n'
            extra += '  assert_eq(values, ' + moon(ticks) + ')\n'
            extra += '  assert_eq(locator.frequency(), @date.' + FREQUENCIES[locator._freq] + ')\n'
            extra += '  assert_eq(formatter.format_ticks(values), ' + moon(labels) + ')\n'
            epoch_rows.append({'epoch': epoch, 'numbers': numbers, 'ticks': ticks, 'frequency': FREQUENCIES[locator._freq], 'labels': labels})
        extra += '}\n'
        epoch_outputs[ROOT / 'tests/integration' / ('epoch_' + name) / 'automatic_reference_test.mbt'] = formatted(extra)
    metadata = {'matplotlib_commit': 'd3ca9172e392048ec242b90e8423e88d1a3000b2', 'dates_py_sha256': base.SHA256,
                'ticker_py_sha256': TICKER_SHA, 'matplotlibrc_sha256': RC_SHA,
                'python': sys.version.split()[0], 'numpy': np.__version__,
                'dateutil': dateutil.__version__, 'locale': 'C', 'case_count': len(cases),
                'named_case_count': len(cases) + len(direct_rows) + len(nonsingular_rows),
                'epoch_selection_count': len(epoch_rows), 'cases': metadata_rows,
                'concise_three_day_view': {'ticks': concise_ticks, 'labels': concise_labels,
                                         'offset': concise_forward, 'inverted_offset': concise_reverse},
                'direct_cases': direct_rows, 'nonsingular_cases': nonsingular_rows, 'epoch_cases': epoch_rows,
                'note': 'Pinned classes and exact MultipleLocator/_Edge_integer AST. IANA references use ZoneInfo for unambiguous local candidates; existing port gap/fold extensions are tested separately.'}
    outputs = {ROOT / 'ticker/date/automatic_reference_test.mbt': formatted(code),
            ROOT / 'testdata/auto_locator_reference.json': json.dumps(metadata, ensure_ascii=False, indent=2) + '\n'}
    outputs.update(epoch_outputs)
    return outputs


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('dates_py', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    for path, value in generate(args.dates_py).items():
        if args.check:
            if path.read_text() != value: raise SystemExit('reference differs: ' + str(path.relative_to(ROOT)))
        else: path.write_text(value)
    print(('Verified' if args.check else 'Generated') + ' D08 automatic locator references')


if __name__ == '__main__': main()
