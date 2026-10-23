"""Execute original named string formatter state, copy and deferred failures.

The explicit shared loader keeps accepted D28 metadata stable. NumPy views keep
their actual scalar origin; unsupported raw fmt objects are source-only evidence.
"""
from pathlib import Path
import argparse
import copy
import json
import math
import sys

import numpy as np

from formatter_reference_source import load_string_formatters
from generate_auto_date_reference import formatted, moon
from generate_basic_formatter_params_reference import clean, raw

ROOT = Path(__file__).resolve().parents[1]
NAMES = ['FormatStrFormatter', 'StrMethodFormatter']


def constructor(name, fmt, base=False):
    return '@ticker.' + name + '::new(' + moon(fmt) + ')' + ('.as_base_formatter()' if base else '')


def query(expression, expected):
    if expected['source_error']:
        return ('  let error = try { ignore(' + expression + '); "unexpected success" } catch { '
                '@core.DataError::InvalidTicks(message~) => message; _ => "unexpected error" }\n'
                '  assert_eq(error, ' + moon(expected['source_error'] + ': ' + expected['message']) + ')\n')
    return '  assert_eq(' + expression + ', ' + moon(expected['value']) + ')\n'


def generate(path):
    ns = load_string_formatters(path)
    observations = []
    cases = []
    source_only = []
    code = '''// Complete pinned string formatter object methods; scalar engines use separate references.

///|
fn verify_string_formatter_param_locations(actual : @ticker.FormatterLocations, expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    let got = actual.get(index)
    if value.is_nan() { assert_true(got.is_nan()) }
    else { assert_eq(got.reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}
'''

    def observe(label, action):
        ns['external_warnings'].clear()
        ns['warning_records'].clear()
        try:
            result = dict(value=raw(action()), source_error=None)
        except (TypeError, ValueError, KeyError, IndexError, OverflowError, AttributeError) as exc:
            result = dict(value=None, source_error=type(exc).__name__, message=str(exc))
        result['warnings'] = list(ns['warning_records'])
        observations.append(dict(label=label, **result))
        return result

    def add(label, spec, expected, body):
        nonlocal code
        cases.append(dict(label=label, specification=clean(spec), observations=clean(expected)))
        code += '\n///|\ntest ' + moon(label) + ' {\n' + body + '}\n'

    for name in NAMES:
        for index, fmt in enumerate(['', 'plain', '-', '𝄞 café', '%', '{', '%s', '{x}/{pos}']):
            formatter = ns[name](fmt)
            expected = observe('constructor only fmt assignment', lambda: dict(fmt=formatter.fmt, attrs=sorted(formatter.__dict__), offset=formatter.get_offset(), axis_none=formatter.axis is None, default_locs=formatter._locs is ns['Formatter']._locs))
            body = '  let formatter = ' + constructor(name, fmt) + '\n'
            body += '  assert_eq(formatter.fmt(), ' + moon(expected['value']['fmt']) + ')\n'
            body += '  assert_eq(formatter.get_offset(), ' + moon(expected['value']['offset']) + ')\n'
            body += '  assert_true(formatter.axis() is None)\n  assert_eq(formatter.locations().length(), 0)\n'
            base = 'formatter.as_base_formatter()'
            own = 'format_str_formatter' if name == NAMES[0] else 'str_method_formatter'
            other = 'str_method_formatter' if name == NAMES[0] else 'format_str_formatter'
            body += '  assert_true(' + base + '.' + own + '() is Some(_))\n'
            body += '  assert_true(' + base + '.' + other + '() is None)\n'
            body += '  assert_true(' + base + '.fixed_formatter() is None)\n  assert_true(' + base + '.func_formatter() is None)\n'
            add('string formatter original constructor ' + name + ' ' + str(index), dict(kind=name, fmt=fmt), expected, body)

    for name in NAMES:
        initial = '%s' if name == NAMES[0] else '{x}'
        for index, replacement in enumerate(['', 'plain', '%', '{', '𝄞 %s', '𝄞 {x}']):
            formatter = ns[name](initial)
            formatter.set_locs([1.])
            axis = object()
            formatter.set_axis(axis)
            shallow = copy.copy(formatter)
            formatter.fmt = replacement
            states = [observe('raw fmt rebind is independent', lambda: dict(fmt=formatter.fmt, copy_fmt=shallow.fmt, same_locations=formatter._locs is shallow._locs, same_axis=formatter.axis is shallow.axis is axis, offsets=[formatter.get_offset(), shallow.get_offset()]))]
            formatter._locs.append(2.)
            states.append(observe('copy keeps live locations', lambda: [formatter._locs[:], shallow._locs[:]]))
            formatter.set_locs([9.])
            formatter.set_axis(None)
            states.append(observe('context slots independent', lambda: dict(locations=formatter._locs, copy_locations=shallow._locs, axis_none=formatter.axis is None, copy_axis=shallow.axis is axis)))
            body = '  let formatter = ' + constructor(name, initial) + '\n  let locations = [1.0]\n  let axis = @ticker.FormatterAxisBinding::new()\n  formatter.set_locs(locations)\n  formatter.set_axis(Some(axis))\n  let shallow = formatter.copy()\n'
            body += '  formatter.set_fmt(' + moon(replacement) + ')\n  assert_eq(formatter.fmt(), ' + moon(states[0]['value']['fmt']) + ')\n'
            body += '  assert_eq(shallow.fmt(), ' + moon(states[0]['value']['copy_fmt']) + ')\n  assert_eq(shallow.axis(), Some(axis))\n'
            body += '  locations.push(2.0)\n'
            body += '  verify_string_formatter_param_locations(formatter.locations(), ' + moon(states[1]['value'][0]) + ')\n'
            body += '  verify_string_formatter_param_locations(shallow.locations(), ' + moon(states[1]['value'][1]) + ')\n'
            body += '  formatter.set_locs([9.0])\n  formatter.set_axis(None)\n'
            body += '  verify_string_formatter_param_locations(formatter.locations(), ' + moon(states[2]['value']['locations']) + ')\n'
            body += '  verify_string_formatter_param_locations(shallow.locations(), ' + moon(states[2]['value']['copy_locations']) + ')\n'
            body += '  assert_true(formatter.axis() is None)\n  assert_eq(shallow.axis(), Some(axis))\n  assert_eq(formatter.get_offset(), "")\n  assert_eq(shallow.get_offset(), "")\n'
            add('string formatter original raw slot copy ' + name + ' ' + str(index), dict(kind=name, fmt=initial, replacement=replacement), states, body)

    old_default = ns['Formatter']._locs
    old_default.clear()
    formats = [ns['NullFormatter'](), ns[NAMES[0]]('%s'), ns[NAMES[1]]('{x}')]
    default_states = [observe('new kinds retain old class default', lambda: [f._locs is old_default for f in formats])]
    old_default.append(7.)
    default_states.append(observe('new kinds share old default mutation', lambda: [f._locs[:] for f in formats]))
    formats[1].set_locs([9.])
    default_states.append(observe('new kind first locs write independent', lambda: [f._locs[:] for f in formats]))
    body = '  let old = @ticker.NullFormatter::new()\n  let percent = @ticker.FormatStrFormatter::new("%s")\n  let method_formatter = @ticker.StrMethodFormatter::new("{x}")\n  let shared = match old.locations() { Sequence(values) => values; _ => abort("expected default list") }\n  defer shared.clear()\n'
    body += '  shared.push(7.0)\n'
    for variable, values in zip(['old', 'percent', 'method_formatter'], default_states[1]['value']):
        body += '  verify_string_formatter_param_locations(' + variable + '.locations(), ' + moon(values) + ')\n'
    body += '  percent.set_locs([9.0])\n'
    for variable, values in zip(['old', 'percent', 'method_formatter'], default_states[2]['value']):
        body += '  verify_string_formatter_param_locations(' + variable + '.locations(), ' + moon(values) + ')\n'
    add('string formatter original common class default', {}, default_states, body)
    old_default.clear()

    views = [dict(name='full', chain=[(0, 1, 4)]), dict(name='reverse', chain=[(3, -1, 4)]),
             dict(name='nested', chain=[(1, 2, 2), (1, -1, 2)]),
             dict(name='zero', chain=[(2, 0, 3)]), dict(name='empty', chain=[(0, 1, 0)])]
    for name in NAMES:
        for integer in [False, True]:
            for spec in views:
                initial = [9007199254740993, -9223372036854775808, 7, -1] if integer else [-0., 1.25, 3.5, -7.]
                owner = np.array(initial, dtype=np.int64 if integer else np.float64)
                view = owner
                indices = np.arange(4)
                for start, stride, length in spec['chain']:
                    view = np.lib.stride_tricks.as_strided(view[start:], shape=(length,), strides=(view.strides[0] * stride,), writeable=True)
                    indices = np.lib.stride_tricks.as_strided(indices[start:], shape=(length,), strides=(indices.strides[0] * stride,), writeable=False)
                fmt = '%r' if name == NAMES[0] else '{x!r}'
                formatter = ns[name](fmt)
                formatter.set_locs(view)
                shallow = copy.copy(formatter)
                states = [observe('typed view initial labels', lambda: formatter.format_ticks(view))]
                if len(view):
                    owner[int(indices[0])] = 41.5
                states.append(observe('typed view owner mutation labels', lambda: shallow.format_ticks(view)))
                states.append(observe('typed view retained identity and owner', lambda: dict(shared=formatter._locs is shallow._locs is view, owner=owner.tolist(), values=list(map(float, shallow._locs)))))
                formatter.fmt = 'rebound:%s' if name == NAMES[0] else 'rebound:{x}'
                formatter.set_locs([9.])
                states.append(observe('typed view copy independent slots', lambda: dict(fmt=shallow.fmt, shared=shallow._locs is view, values=list(map(float, shallow._locs)))))
                array = '[' + ', '.join(str(value) + 'L' for value in initial) + ']' if integer else moon(initial)
                body = '  let previous = @config.unicode_minus()\n  defer @config.set_unicode_minus(previous)\n  @config.set_unicode_minus(true)\n  let owner = ' + array + '\n  let view = @ticker.TickValues::' + ('from_int64_array' if integer else 'from_array') + '(owner)'
                for step in spec['chain']:
                    body += '.view(' + ', '.join(map(str, step)) + ')'
                body += '\n  let formatter = ' + constructor(name, fmt) + '\n  formatter.set_locs_view(view)\n  let shallow = formatter.copy()\n'
                body += query('formatter.format_ticks_view(view)', states[0])
                if len(view):
                    body += '  owner[' + str(int(indices[0])) + '] = ' + ('41L' if integer else '41.5') + '\n'
                body += query('shallow.format_ticks_view(view)', states[1])
                body += '  match shallow.locations() { NdArray(retained) => assert_true(physical_equal(retained, view)); _ => fail("expected borrowed view") }\n'
                body += '  verify_string_formatter_param_locations(shallow.locations(), ' + moon(states[2]['value']['values']) + ')\n'
                body += '  formatter.set_fmt(' + moon('rebound:%s' if name == NAMES[0] else 'rebound:{x}') + ')\n  formatter.set_locs([9.0])\n'
                body += '  assert_eq(shallow.fmt(), ' + moon(states[3]['value']['fmt']) + ')\n'
                body += '  verify_string_formatter_param_locations(shallow.locations(), ' + moon(states[3]['value']['values']) + ')\n'
                add('string formatter original view copy ' + name + ' ' + ('int64 ' if integer else 'float64 ') + spec['name'], dict(kind=name, integer=integer, values=initial, **spec), states, body)

    failures = {NAMES[0]: ['%', '%q', 'literal', '%g %g'], NAMES[1]: ['{', '{missing}', '{x:!}', '{pos:d}']}
    for name, formats in failures.items():
        for index, invalid in enumerate(formats):
            initial = '%s' if name == NAMES[0] else '{x}'
            formatter = ns[name](initial)
            formatter.set_locs([9.])
            formatter.fmt = invalid
            direct = observe('deferred fmt direct failure', lambda: formatter(2.))
            before = observe('direct error leaves fmt and locations', lambda: dict(fmt=formatter.fmt, locations=formatter._locs[:]))
            values = [3., 4.]
            batch = observe('deferred fmt batch failure', lambda: formatter.format_ticks(values))
            after = observe('batch error retains installed list', lambda: dict(fmt=formatter.fmt, identity=formatter._locs is values, locations=formatter._locs[:]))
            formatter.fmt = initial
            repaired = observe('raw fmt repair', lambda: formatter.format_data(2.))
            body = '  let formatter = ' + constructor(name, initial) + '\n  formatter.set_locs([9.0])\n  formatter.set_fmt(' + moon(invalid) + ')\n'
            body += '  assert_eq(formatter.fmt(), ' + moon(before['value']['fmt']) + ')\n' + query('formatter.call(2.0)', direct)
            body += '  verify_string_formatter_param_locations(formatter.locations(), ' + moon(before['value']['locations']) + ')\n  let values = [3.0, 4.0]\n'
            body += query('formatter.format_ticks(values)', batch)
            body += '  match formatter.locations() { Sequence(retained) => assert_true(physical_equal(retained, values)); _ => fail("expected installed list") }\n'
            body += '  verify_string_formatter_param_locations(formatter.locations(), ' + moon(after['value']['locations']) + ')\n'
            body += '  formatter.set_fmt(' + moon(initial) + ')\n' + query('formatter.format_data(2.0)', repaired)
            add('string formatter original deferred fmt error ' + name + ' ' + str(index), dict(kind=name, malformed=invalid), [direct, before, batch, after, repaired], body)

    for name in NAMES:
        for unicode_minus in [False, True]:
            fmt = 'literal- %s' if name == NAMES[0] else 'literal- {x}/{pos}'
            formatter = ns[name](fmt)
            ns['mpl'].rcParams['axes.unicode_minus'] = unicode_minus
            direct = observe('dynamic minus after constructor', lambda: formatter(-1.25, -2))
            data = observe('data retains None position', lambda: formatter.format_data(-1.25))
            body = '  let previous = @config.unicode_minus()\n  defer @config.set_unicode_minus(previous)\n  let formatter = ' + constructor(name, fmt) + '\n  @config.set_unicode_minus(' + moon(unicode_minus) + ')\n'
            body += query('formatter.call(-1.25, pos=-2)', direct) + query('formatter.format_data_short(-1.25)', data)
            body += '  assert_eq(formatter.get_offset(), "")\n'
            add('string formatter original rc and data ' + name + ' ' + str(unicode_minus), dict(kind=name, unicode_minus=unicode_minus), [direct, data], body)

    # These dynamic values are source-only; their successes are not typed parity.
    for name in NAMES:
        for fmt in [None, 0, 5., [], b'%g', np.array([2., 3.])]:
            formatter = ns[name](fmt)
            stored = observe('source-only raw fmt constructor', lambda: dict(identity=formatter.fmt is fmt, offset=formatter.get_offset(), axis_none=formatter.axis is None))
            result = observe('source-only raw fmt operation', lambda: formatter(2., 0))
            if isinstance(result.get('value'), bytes):
                result['value'] = dict(bytes_hex=result['value'].hex())
            source_only.append(dict(reason='raw fmt/result type outside String API; no eager source validation', kind=name, raw_type=type(fmt).__name__, stored=stored, operation=result))
        formatter = ns[name]('%s' if name == NAMES[0] else '{x}')
        formatter.offset_string = 'ignored raw attribute'
        source_only.append(dict(reason='source dynamic attribute is unrelated to inherited empty offset', kind=name, observation=observe('raw offset attr ignored', lambda: formatter.get_offset())))
        source_only.append(dict(reason='no source offset setter', kind=name, observation=observe('no offset setter', lambda: getattr(formatter, 'set_offset_string'))))

    class SourceFmt:
        def __init__(self):
            self.text = 'original'
            self.events = []

        def __mod__(self, value):
            self.events.append(['modulo', value])
            return self.text

        def __bool__(self):
            raise RuntimeError('source constructor must not query truth')

        def __str__(self):
            raise RuntimeError('source constructor must not coerce string')

    for name in NAMES:
        fmt = SourceFmt()
        formatter = ns[name](fmt)
        shallow = copy.copy(formatter)
        stored = observe('source-only custom fmt retained', lambda: dict(shared=formatter.fmt is shallow.fmt is fmt, events=fmt.events[:]))
        fmt.text = 'mutated'
        operation = observe('source-only custom fmt operator', lambda: [formatter(2.), shallow(3.)])
        source_only.append(dict(reason='custom fmt/operator and mutable raw objects outside String API', kind=name, stored=stored, operation=operation, events=fmt.events[:]))

    payload = dict(source_hashes=ns['source_hashes'], python=sys.version.split()[0], numpy=np.__version__,
                   scope='Complete original FormatStrFormatter/_UnicodeMinusFormat/StrMethodFormatter with real D28 Formatter/API/descriptor and pinned stdlib string. String fmt required with raw deferred validation; Double direct/list, true NumPy Float64/Int64 view origins; shallow fmt slots with borrowed locs and stable typed binding identity. Old pure factories unchanged. Raw dynamic fmt/bytes/operator/dtype objects and dynamic extra attributes are source-only, not passing typed parity.',
                   observation_count=len(observations), generated_test_count=len(cases), cases=cases, source_only=source_only)
    return json.dumps(clean(payload), indent=2, allow_nan=False) + '\n', formatted(code)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('ticker', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    outputs = generate(args.ticker)
    for name, content in zip(['testdata/string_formatter_params_reference.json', 'ticker/string_formatter_params_reference_test.mbt'], outputs):
        target = ROOT / name
        if args.check:
            if not target.exists() or target.read_text() != content:
                raise SystemExit('reference differs: ' + name)
        else:
            target.write_text(content)
    payload = json.loads(outputs[0])
    print('string formatter params:', payload['observation_count'], 'observations,', payload['generated_test_count'], 'generated tests,', len(payload['source_only']), 'source-only records')


if __name__ == '__main__':
    main()
