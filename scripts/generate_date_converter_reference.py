"""Evaluate pinned Matplotlib date converter classes, not an installed package."""
from pathlib import Path
import argparse
import ast
import datetime as dt
import hashlib
import io
import json
import locale
import sys
import types
from zoneinfo import ZoneInfo
import numpy as np
import dateutil
import generate_auto_locator_reference as base
from generate_auto_date_reference import moon, formatted, RC_SHA

ROOT = base.ROOT


def load_reference(path, epoch='1970-01-01T00:00:00'):
    ref = base.load_reference(path, epoch)
    # The typed port only accepts flat, finite DateTime arrays or a scalar.
    # For those inputs the original safe-first-finite helper is simply next().
    def first(values):
        return next(iter(values))
    ref['cbook']._safe_first_finite = first
    ref['units'] = types.SimpleNamespace(ConversionInterface=object, AxisInfo=lambda **kwargs: types.SimpleNamespace(**kwargs))
    names = {'DateConverter', 'ConciseDateConverter', '_SwitchableDateConverter'}
    nodes = [node for node in ast.parse(path.read_text()).body if isinstance(node, ast.ClassDef) and node.name in names]
    if {node.name for node in nodes} != names: raise ValueError('missing pinned converter classes')
    exec(compile(ast.Module(body=nodes, type_ignores=[]), str(path), 'exec'), ref)
    return ref


def generate(path):
    locale.setlocale(locale.LC_TIME, 'C')
    ref = load_reference(path)
    ny = ZoneInfo.from_file(io.BytesIO((ROOT / 'testdata/tzif/new_york.tzif').read_bytes()))
    zones = [('none', None, ''), ('UTC', dt.timezone.utc, '@date.fixed_timezone_seconds(0)'),
             ('seconds', dt.timezone(dt.timedelta(seconds=561)), '@date.fixed_timezone_seconds(561)'),
             ('NY', ny, '@date.tzif_timezone(tzif_new_york)')]
    cases = []
    for name in ['auto', 'concise']:
        for multiple in [False, True]:
            for label, zone, expr in zones:
                for span in [dt.timedelta(days=141), dt.timedelta(hours=40)]:
                    cases.append((name, multiple, label, zone, expr, span, {}))
    custom = dict(formats=['%Y', '%m', '%d', '%H:%M', '%H:%M', '%S.%f'],
                  zero_formats=['', '%Y', '%m', '%d', '%H', '%M'],
                  offset_formats=['', '%Y', '%Y-%m', '%Y-%m-%d', '%Y-%m-%d', '%Y-%m-%d %H:%M'])
    for multiple in [False, True]:
        for show in [False, True]:
            for span in [dt.timedelta(days=141), dt.timedelta(hours=40)]:
                cases.append(('concise', multiple, 'custom', None, '', span, dict(custom, show_offset=show)))
    rows = []
    code = '// Generated from pinned v3.11.2 converter classes.\n'
    for index, (name, multiple, zone_label, zone, zone_expr, span, options) in enumerate(cases):
        cls = ref['DateConverter'] if name == 'auto' else ref['ConciseDateConverter']
        converter = cls(interval_multiples=multiple, **options)
        info = converter.axisinfo(zone, None)
        start = dt.datetime(2024, 1, 10, 3, 7, 11, 123456, tzinfo=zone or dt.timezone.utc)
        dates = [start, start + span]
        numbers = [float(x) for x in converter.convert(dates, None, None)]
        info.majloc.set_axis(types.SimpleNamespace(get_view_interval=lambda: numbers, __name__='xaxis', get_inverted=lambda: False))
        ticks = [float(x) for x in info.majloc()]
        labels = info.majfmt.format_ticks(ticks) if hasattr(info.majfmt, 'format_ticks') else [info.majfmt(t, i) for i, t in enumerate(ticks)]
        offset = info.majfmt.get_offset() if hasattr(info.majfmt, 'get_offset') else ''
        options_code = ', '.join(key + '=' + moon(value) for key, value in options.items())
        ctor = '@date.' + ('DateConverter' if name == 'auto' else 'ConciseDateConverter') + '::new(interval_multiples=' + moon(multiple) + (', ' + options_code if options_code else '') + ')'
        code += '\n///|\ntest ' + moon('date converter reference %s: %s/%s/%s/%s' % (index, name, multiple, zone_label, span)) + ' {\n'
        code += '  let converter = ' + ctor + '\n'
        if zone_expr: code += '  let zone = ' + zone_expr + '\n'
        code += '  let info = converter.axisinfo(' + ('unit=zone' if zone_expr else '') + ')\n'
        expressions = ['@date.parse_iso(' + moon(value.isoformat()) + ')' + ('.with_timezone(zone)' if zone_label == 'NY' else '') for value in dates]
        code += '  let dates = [' + ', '.join(expressions) + ']\n'
        code += '  assert_eq(converter.convert(dates), ' + moon(numbers) + ')\n'
        code += '  assert_eq(converter.convert_value(dates[0]), ' + moon(numbers[0]) + ')\n'
        inferred = converter.default_units(dates, None)
        offset_seconds = int(inferred.utcoffset(start).total_seconds())
        code += '  assert_eq(converter.default_units(dates).unwrap().offset_seconds_at(' + moon(numbers[0]) + '), ' + str(offset_seconds) + ')\n'
        code += '  assert_true(converter.default_units([]) is None)\n'
        code += '  assert_eq(info.label(), "")\n'
        code += '  assert_eq(@date.format_date(info.default_limits().0, "%Y-%m-%d"), "1970-01-01")\n'
        code += '  assert_eq(@date.format_date(info.default_limits().1, "%Y-%m-%d"), "1970-01-02")\n'
        code += '  assert_eq(info.major_locator().automatic_locator().unwrap().interval_multiples(), ' + moon(info.majloc.interval_multiples) + ')\n'
        code += '  let formatter = info.major_formatter()\n'
        code += '  let ticks = info.major_locator().tick_values(' + moon(numbers[0]) + ', ' + moon(numbers[1]) + ')\n'
        code += '  assert_eq(ticks, ' + moon(ticks) + ')\n'
        code += '  assert_eq(formatter.format_values(ticks), ' + moon(labels) + ')\n'
        code += '  assert_eq(formatter.offset_label(ticks), ' + moon(offset) + ')\n}\n'
        rows.append(dict(name=name, requested_multiples=multiple, actual_multiples=info.majloc.interval_multiples,
                         zone=zone_label, options=options, dates=[value.isoformat() for value in dates], numbers=numbers,
                         ticks=ticks, labels=labels, offset=offset, first_offset_seconds=offset_seconds))
    switches = []
    for name in ['auto', 'concise']:
        for flag in [False, True]:
            ref['mpl'].rcParams.update({'date.converter': name, 'date.interval_multiples': flag})
            info = ref['_SwitchableDateConverter']().axisinfo(None, None)
            code += '\n///|\ntest ' + moon('switchable date converter reference: %s/%s' % (name, flag)) + ' {\n'
            code += '  @config.reset()\n  @config.set_date_converter(' + moon(name) + ')\n  @config.set_date_interval_multiples(' + moon(flag) + ')\n'
            code += '  let info = @date.default_date_converter().axisinfo()\n'
            code += '  assert_eq(info.major_locator().automatic_locator().unwrap().interval_multiples(), ' + moon(info.majloc.interval_multiples) + ')\n'
            numbers = [0., 40. / 24.]
            info.majloc.set_axis(types.SimpleNamespace(get_view_interval=lambda: numbers, __name__='xaxis', get_inverted=lambda: False))
            ticks = [float(x) for x in info.majloc()]
            labels = info.majfmt.format_ticks(ticks) if hasattr(info.majfmt, 'format_ticks') else [info.majfmt(t, i) for i, t in enumerate(ticks)]
            code += '  let ticks = info.major_locator().tick_values(0.0, ' + moon(numbers[1]) + ')\n'
            code += '  assert_eq(info.major_formatter().format_values(ticks), ' + moon(labels) + ')\n  @config.reset()\n}\n'
            switches.append(dict(name=name, requested_multiples=flag, actual_multiples=info.majloc.interval_multiples, ticks=ticks, labels=labels))
    outputs = {ROOT / 'ticker/date/converter_reference_test.mbt': formatted(code)}
    epochs = []
    for name, epoch, year in [('2400', '2400-01-01T00:00:00', 2400), ('fraction', '2000-01-01T00:00:00.123456', 2000)]:
        namespace = load_reference(path, epoch)
        extra = '// Generated from pinned converter classes.\n\n///|\nfn verify_converter_epoch_reference(auto : @date.DateAxisInfo, concise : @date.DateAxisInfo) -> Unit raise {\n'
        for mode, cls in [('auto', 'DateConverter'), ('concise', 'ConciseDateConverter')]:
            converter = namespace[cls]()
            info = converter.axisinfo(None, None)
            first = dt.datetime(year, 1, 1, tzinfo=dt.timezone.utc)
            numbers = [float(x) for x in converter.convert([first, first + dt.timedelta(hours=40)], None, None)]
            info.majloc.set_axis(types.SimpleNamespace(get_view_interval=lambda: numbers, __name__='xaxis', get_inverted=lambda: False))
            ticks = [float(x) for x in info.majloc()]
            labels = info.majfmt.format_ticks(ticks) if hasattr(info.majfmt, 'format_ticks') else [info.majfmt(t, i) for i, t in enumerate(ticks)]
            offset = info.majfmt.get_offset() if hasattr(info.majfmt, 'get_offset') else ''
            extra += '  let ticks = ' + mode + '.major_locator().tick_values(' + moon(numbers[0]) + ', ' + moon(numbers[1]) + ')\n'
            extra += '  assert_eq(ticks, ' + moon(ticks) + ')\n'
            extra += '  assert_eq(' + mode + '.major_formatter().format_values(ticks), ' + moon(labels) + ')\n'
            extra += '  assert_eq(' + mode + '.major_formatter().offset_label(ticks), ' + moon(offset) + ')\n'
            epochs.append(dict(epoch=epoch, name=mode, ticks=ticks, labels=labels, offset=offset))
        extra += '}\n'
        outputs[ROOT / 'integration' / ('epoch_' + name) / 'converter_reference_test.mbt'] = formatted(extra)
    manifest = dict(matplotlib_commit='d3ca9172e392048ec242b90e8423e88d1a3000b2', dates_py_sha256=base.base.SHA256,
                    ticker_py_sha256=base.TICKER_SHA, matplotlibrc_sha256=RC_SHA, python=sys.version.split()[0],
                    numpy=np.__version__, dateutil=dateutil.__version__, locale='C', named_case_count=len(rows)+len(switches),
                    epoch_case_count=len(epochs), cases=rows, switches=switches, epochs=epochs,
                    note='Original classes; abstract units container and finite typed first-element helper stubbed. Flat aware dates only; no heterogeneous/NumPy units registry claim.')
    outputs[ROOT / 'testdata/date_converter_reference.json'] = json.dumps(manifest, ensure_ascii=False, indent=2) + '\n'
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
    print(('Verified' if args.check else 'Generated') + ' D09 date converter references')


if __name__ == '__main__': main()
