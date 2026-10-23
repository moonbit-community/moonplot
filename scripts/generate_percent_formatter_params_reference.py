"""Execute complete pinned PercentFormatter parameter and state protocols.

The source loader uses real API/deprecation descriptors. Numeric engines and
actual Axis integration have separate references; no port function is an oracle.
"""
from pathlib import Path
import argparse
import copy
import json
import math
import sys
import warnings

import numpy as np

from formatter_reference_source import load_percent_formatter
from generate_auto_date_reference import formatted, moon
from generate_basic_formatter_params_reference import clean, raw

ROOT = Path(__file__).resolve().parents[1]


def xmax_record(value):
    if isinstance(value, np.float64):
        kind = 'NumpyFloat64'
    elif isinstance(value, np.int64):
        kind = 'NumpyInt64'
    elif isinstance(value, bool):
        kind = 'Boolean'
    elif isinstance(value, int):
        kind = 'Integer'
    elif isinstance(value, float):
        kind = 'Number'
    else:
        return dict(kind='source-only', type=type(value).__name__, repr=repr(value))
    return dict(kind=kind, value=str(value) if kind == 'Integer' else raw(value))


def decimals_record(value):
    if value is None:
        return dict(kind='Automatic')
    if isinstance(value, bool):
        return dict(kind='Boolean', value=value)
    if isinstance(value, int):
        return dict(kind='Integer', value=str(value))
    if isinstance(value, float):
        return dict(kind='Number', value=float(value))
    if isinstance(value, str):
        return dict(kind='Text', value=value)
    return dict(kind='source-only', type=type(value).__name__, repr=repr(value))


def scalar_argument(record, enum):
    kind = record['kind']
    if kind == 'Automatic':
        return '@ticker.' + enum + '::Automatic'
    value = record['value']
    if kind == 'Integer':
        value = '@bigint.BigInt::from_string(' + moon(value) + ')'
    elif kind == 'NumpyInt64':
        value = str(value) + 'L'
    else:
        value = moon(value)
    return '@ticker.' + enum + '::' + kind + '(' + value + ')'


def xmax_argument(value):
    return scalar_argument(xmax_record(value), 'PercentXMax')


def decimals_argument(value):
    return scalar_argument(decimals_record(value), 'PercentDecimals')


def optional_text(value):
    return 'None' if value is None else 'Some(' + moon(value) + ')'


def query(expression, expected):
    if expected['source_error']:
        return ('  let error = try { ignore(' + expression + '); "unexpected success" } catch { '
                '@core.DataError::InvalidTicks(message~) => message; _ => "unexpected error" }\n'
                '  assert_eq(error, ' + moon(expected['source_error'] + ': ' + expected['message']) + ')\n')
    return '  assert_eq(' + expression + ', ' + moon(expected['value']) + ')\n'


def generate(path):
    ns = load_percent_formatter(path)
    source = ns['PercentFormatter']
    observations = []
    cases = []
    source_only = []
    code = '''// Complete pinned PercentFormatter object/state methods, with actual descriptor dependencies.

///|
fn verify_percent_params_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn verify_percent_params_xmax(actual : @ticker.PercentXMax, expected : @ticker.PercentXMax) -> Unit raise {
  match (actual, expected) {
    (@ticker.PercentXMax::Number(left), @ticker.PercentXMax::Number(right))
    | (@ticker.PercentXMax::NumpyFloat64(left), @ticker.PercentXMax::NumpyFloat64(right)) => verify_percent_params_double(left, right)
    _ => assert_eq(actual, expected)
  }
}

///|
fn verify_percent_params_decimals(actual : @ticker.PercentDecimals, expected : @ticker.PercentDecimals) -> Unit raise {
  match (actual, expected) {
    (@ticker.PercentDecimals::Number(left), @ticker.PercentDecimals::Number(right)) => verify_percent_params_double(left, right)
    _ => assert_eq(actual, expected)
  }
}

///|
fn verify_percent_params_locations(actual : @ticker.FormatterLocations, expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected { verify_percent_params_double(actual.get(index), value) }
}
'''

    def observe(label, action):
        ns['external_warnings'].clear()
        ns['warning_records'].clear()
        with warnings.catch_warnings(record=True) as runtime:
            warnings.simplefilter('always')
            try:
                result = dict(value=raw(action()), source_error=None)
            except (TypeError, ValueError, ZeroDivisionError, KeyError, IndexError,
                    OverflowError, AttributeError, NotImplementedError) as exc:
                result = dict(value=None, source_error=type(exc).__name__, message=str(exc))
        result['warnings'] = list(ns['warning_records'])
        result['runtime_warnings'] = [dict(category=type(item.message).__name__, message=str(item.message))
                                      for item in runtime]
        observations.append(dict(label=label, **result))
        return result

    def add(label, spec, expected, body):
        nonlocal code
        cases.append(dict(label=label, specification=clean(spec), observations=clean(expected)))
        code += '\n///|\ntest ' + moon(label) + ' {\n' + body + '}\n'

    def state(formatter):
        return dict(xmax=xmax_record(formatter.xmax), decimals=decimals_record(formatter.decimals),
                    symbol=formatter._symbol, is_latex=formatter._is_latex,
                    offset=formatter.get_offset(), axis_none=formatter.axis is None,
                    locations=list(map(float, formatter._locs)))

    def state_assert(variable, expected):
        value = expected['value']
        return ('  verify_percent_params_xmax(' + variable + '.xmax(), '
                + scalar_argument(value['xmax'], 'PercentXMax') + ')\n'
                + '  verify_percent_params_decimals(' + variable + '.decimals(), '
                + scalar_argument(value['decimals'], 'PercentDecimals') + ')\n'
                + '  assert_eq(' + variable + '.raw_symbol(), ' + optional_text(value['symbol']) + ')\n'
                + '  assert_eq(' + variable + '.is_latex(), ' + moon(value['is_latex']) + ')\n'
                + '  assert_eq(' + variable + '.get_offset(), ' + moon(value['offset']) + ')\n')

    defaults = source()
    expected = observe('constructor defaults', lambda: state(defaults))
    body = '  let formatter = @ticker.PercentFormatter::new()\n' + state_assert('formatter', expected)
    body += '  assert_true(formatter.axis() is None)\n  assert_eq(formatter.locations().length(), 0)\n'
    body += '  let base = formatter.as_base_formatter()\n  assert_true(base.percent_formatter() is Some(_))\n'
    for method in ['null_formatter', 'fixed_formatter', 'func_formatter', 'format_str_formatter', 'str_method_formatter']:
        body += '  assert_true(base.' + method + '() is None)\n'
    add('percent params original defaults', {}, expected, body)

    xmax_values = [100., -0., 0., -1., math.nan, math.inf, -math.inf,
                   math.ulp(0.), sys.float_info.max, 1 << 100, -(1 << 100),
                   False, True, np.float64(-0.), np.float64(math.nan),
                   np.float64(math.inf), np.float64(1.25), np.int64(-(1 << 63)),
                   np.int64((1 << 63) - 1), np.int64(0), 1 << 2000]
    for index, value in enumerate(xmax_values):
        expected = observe('xmax constructor +0.0', lambda value=value: state(source(xmax=value)))
        expression = '@ticker.PercentFormatter::new(xmax=' + xmax_argument(value) + ')'
        if expected['source_error']:
            body = query(expression, expected)
        else:
            body = '  let formatter = ' + expression + '\n' + state_assert('formatter', expected)
        add('percent params original xmax constructor ' + str(index), xmax_record(value), expected, body)

    raw_values = [-0., math.nan, math.inf, -math.inf, -(1 << 100), 1 << 2000,
                  False, True, np.float64(-0.), np.float64(0.),
                  np.int64(-(1 << 63)), np.int64((1 << 63) - 1)]
    for index, value in enumerate(raw_values):
        formatter = source()
        shallow = copy.copy(formatter)
        formatter.xmax = value
        expected = [observe('raw xmax assignment no constructor coercion', lambda: state(formatter)),
                    observe('shallow xmax independent slot', lambda: state(shallow))]
        body = '  let formatter = @ticker.PercentFormatter::new()\n  let shallow = formatter.copy()\n'
        body += '  formatter.set_xmax(' + xmax_argument(value) + ')\n'
        body += state_assert('formatter', expected[0]) + state_assert('shallow', expected[1])
        add('percent params original raw xmax slot ' + str(index), xmax_record(value), expected, body)

    decimal_values = [None, 0., -0., 2.9, -.9, -1.9, math.nan, math.inf, -math.inf,
                      sys.float_info.max, 0, -1, 2, 1 << 100, False, True,
                      '2', ' +02 ', '٢', '1_0', '2.0', '-1', '', '\u001c2']
    for index, value in enumerate(decimal_values):
        formatter = source(decimals=value)
        initial = observe('constructor leaves raw decimals unchanged', lambda: state(formatter))
        result = observe('explicit decimals consumed after construction', lambda: formatter.format_pct(1.25, math.nan if value is not None else 100.))
        formatter.decimals = None
        reset = observe('raw None resets automatic precision', lambda: state(formatter))
        repaired = observe('precision reset can format again', lambda: formatter.format_pct(1.25, 100.))
        body = '  let formatter = @ticker.PercentFormatter::new(decimals=' + decimals_argument(value) + ')\n'
        body += state_assert('formatter', initial)
        body += query('formatter.format_pct(1.25, ' + moon(math.nan if value is not None else 100.) + ')', result)
        body += '  formatter.set_decimals(@ticker.PercentDecimals::Automatic)\n'
        body += state_assert('formatter', reset) + query('formatter.format_pct(1.25, 100.0)', repaired)
        add('percent params original deferred decimals ' + str(index), decimals_record(value), [initial, result, reset, repaired], body)

    symbols = [None, '', '%', r'\%', r'\#$%&~_^{}', '-%', '𝄞 café', '{value}', '%%__']
    for index, symbol in enumerate(symbols):
        for latex in [False, True]:
            formatter = source(symbol=symbol, is_latex=latex, decimals=0)
            expected = []
            body = '  let previous = @config.text_usetex()\n  defer @config.set_text_usetex(previous)\n'
            body += '  let formatter = @ticker.PercentFormatter::new(decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)), symbol=' + optional_text(symbol) + ', is_latex=' + moon(latex) + ')\n'
            for tex in [False, True, False]:
                ns['mpl'].rcParams['text.usetex'] = tex
                current = observe('symbol property reads current rc without rewriting raw', lambda: dict(symbol=formatter.symbol, raw=formatter._symbol, label=formatter.format_pct(1., 100.)))
                expected.append(current)
                body += '  @config.set_text_usetex(' + moon(tex) + ')\n'
                body += '  assert_eq(formatter.symbol(), ' + moon(current['value']['symbol']) + ')\n'
                body += '  assert_eq(formatter.raw_symbol(), ' + optional_text(current['value']['raw']) + ')\n'
                body += '  assert_eq(formatter.format_pct(1.0, 100.0), ' + moon(current['value']['label']) + ')\n'
            add('percent params original dynamic symbol ' + str(index) + ' ' + str(latex), dict(symbol=symbol, is_latex=latex), expected, body)
    ns['mpl'].rcParams['text.usetex'] = False

    for index, symbol in enumerate([None, '', r'\%', '-new']):
        formatter = source(xmax=1., decimals=2, symbol='old', is_latex=False)
        axis = object()
        locations = [1., 2.]
        formatter.set_axis(axis)
        formatter.set_locs(locations)
        shallow = copy.copy(formatter)
        formatter.xmax = np.int64(7)
        formatter.decimals = '3'
        formatter.symbol = symbol
        formatter._is_latex = True
        expected = [observe('all parameter slots rebound independently', lambda: [state(formatter), state(shallow)])]
        locations.append(3.)
        expected.append(observe('shared live location list after raw changes', lambda: dict(original=formatter._locs[:], copy=shallow._locs[:], same_axis=formatter.axis is shallow.axis is axis)))
        formatter.set_locs([9.])
        formatter.set_axis(None)
        expected.append(observe('context rebind does not affect copy', lambda: dict(original=formatter._locs[:], copy=shallow._locs[:], original_axis_none=formatter.axis is None, copy_axis_same=shallow.axis is axis)))
        body = '  let formatter = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(1.0), decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(2)), symbol=Some("old"))\n'
        body += '  let axis = @ticker.FormatterAxisBinding::new()\n  let locations = [1.0, 2.0]\n  formatter.set_axis(Some(axis))\n  formatter.set_locs(locations)\n  let shallow = formatter.copy()\n'
        body += '  formatter.set_xmax(@ticker.PercentXMax::NumpyInt64(7L))\n  formatter.set_decimals(@ticker.PercentDecimals::Text("3"))\n  formatter.set_symbol(' + optional_text(symbol) + ')\n  formatter.set_is_latex(true)\n'
        for variable, state_value in zip(['formatter', 'shallow'], expected[0]['value']):
            body += state_assert(variable, dict(value=state_value))
        body += '  locations.push(3.0)\n'
        for variable, key in [('formatter', 'original'), ('shallow', 'copy')]:
            body += '  verify_percent_params_locations(' + variable + '.locations(), ' + moon(expected[1]['value'][key]) + ')\n'
        body += '  assert_eq(shallow.axis(), Some(axis))\n  formatter.set_locs([9.0])\n  formatter.set_axis(None)\n'
        for variable, key in [('formatter', 'original'), ('shallow', 'copy')]:
            body += '  verify_percent_params_locations(' + variable + '.locations(), ' + moon(expected[2]['value'][key]) + ')\n'
        body += '  assert_true(formatter.axis() is None)\n  assert_eq(shallow.axis(), Some(axis))\n'
        add('percent params original shallow slots ' + str(index), dict(replacement_symbol=symbol), expected, body)

    views = [dict(name='full', chain=[(0, 1, 4)]), dict(name='reverse', chain=[(3, -1, 4)]),
             dict(name='nested', chain=[(1, 2, 2), (1, -1, 2)]),
             dict(name='zero', chain=[(2, 0, 3)]), dict(name='empty', chain=[(0, 1, 0)])]
    for integer in [False, True]:
        for spec in views:
            initial = [9007199254740993, -(1 << 63), 7, -1] if integer else [-0., 1.25, 3.5, -7.]
            owner = np.array(initial, dtype=np.int64 if integer else np.float64)
            view = owner
            indices = np.arange(4)
            for start, stride, length in spec['chain']:
                view = np.lib.stride_tricks.as_strided(view[start:], shape=(length,), strides=(view.strides[0] * stride,), writeable=True)
                indices = np.lib.stride_tricks.as_strided(indices[start:], shape=(length,), strides=(indices.strides[0] * stride,), writeable=False)
            formatter = source()
            formatter.set_locs(view)
            shallow = copy.copy(formatter)
            expected = [observe('copy retains source numeric view', lambda: dict(identity=formatter._locs is shallow._locs is view, values=list(map(float, view))))]
            if len(view):
                owner[int(indices[0])] = 11
                view[-1] = 13
            expected.append(observe('owner and view writes remain live', lambda: dict(owner=owner.tolist(), values=list(map(float, shallow._locs)))))
            formatter.set_locs([9.])
            formatter.decimals = 4
            expected.append(observe('view copy independent context and precision slots', lambda: dict(values=list(map(float, shallow._locs)), decimals=decimals_record(shallow.decimals))))
            array = '[' + ', '.join(str(v) + 'L' for v in initial) + ']' if integer else moon(initial)
            body = '  let owner = ' + array + '\n  let view = @ticker.TickValues::' + ('from_int64_array' if integer else 'from_array') + '(owner)'
            for step in spec['chain']:
                body += '.view(' + ', '.join(map(str, step)) + ')'
            body += '\n  let formatter = @ticker.PercentFormatter::new()\n  formatter.set_locs_view(view)\n  let shallow = formatter.copy()\n'
            body += '  verify_percent_params_locations(shallow.locations(), ' + moon(expected[0]['value']['values']) + ')\n'
            if len(view):
                body += '  owner[' + str(int(indices[0])) + '] = ' + ('11L' if integer else '11.0') + '\n  view.set(-1, 13.0)\n'
            body += '  assert_eq(owner, ' + ('[' + ', '.join(str(v) + 'L' for v in expected[1]['value']['owner']) + ']' if integer else moon(expected[1]['value']['owner'])) + ')\n'
            body += '  verify_percent_params_locations(shallow.locations(), ' + moon(expected[1]['value']['values']) + ')\n'
            body += '  match shallow.locations() { NdArray(retained) => assert_true(physical_equal(retained, view)); _ => fail("expected retained view") }\n'
            body += '  formatter.set_locs([9.0])\n  formatter.set_decimals(@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(4)))\n'
            body += '  verify_percent_params_locations(shallow.locations(), ' + moon(expected[2]['value']['values']) + ')\n'
            body += '  assert_eq(shallow.decimals(), ' + scalar_argument(expected[2]['value']['decimals'], 'PercentDecimals') + ')\n'
            add('percent params original retained view ' + ('int64 ' if integer else 'float64 ') + spec['name'], dict(integer=integer, values=initial, **spec), expected, body)

    old_default = ns['Formatter']._locs
    old_default.clear()
    formatter = source()
    previous = ns['NullFormatter']()
    old_default.append(7.)
    expected = observe('all kinds retain original class default', lambda: dict(same=formatter._locs is previous._locs is old_default, values=list(old_default)))
    body = '  let previous = @ticker.NullFormatter::new()\n  let formatter = @ticker.PercentFormatter::new()\n  let shared = match previous.locations() { Sequence(values) => values; _ => abort("expected default list") }\n  defer shared.clear()\n  shared.push(7.0)\n'
    body += '  verify_percent_params_locations(formatter.locations(), ' + moon(expected['value']['values']) + ')\n'
    add('percent params original common default locations', {}, expected, body)
    old_default.clear()

    formatter = source(xmax=0., decimals=-1)
    formatter.set_locs([9.])
    direct = observe('unbound axis error precedes invalid numeric state', lambda: formatter(1.))
    values = [1., 2.]
    batch = observe('batch locs write precedes axis failure', lambda: formatter.format_ticks(values))
    retained = observe('failure retains original batch list', lambda: dict(same=formatter._locs is values, values=values[:]))
    formatter.xmax = 100.
    formatter.decimals = 0
    direct_pct = observe('format_pct needs no axis', lambda: formatter.format_pct(1., 100.))
    body = '  let formatter = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(0.0), decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(-1)))\n  formatter.set_locs([9.0])\n'
    body += query('formatter.call(1.0)', direct) + '  let values = [1.0, 2.0]\n' + query('formatter.format_ticks(values)', batch)
    body += '  match formatter.locations() { Sequence(retained) => assert_true(physical_equal(retained, values)); _ => fail("expected installed list") }\n'
    body += '  verify_percent_params_locations(formatter.locations(), ' + moon(retained['value']['values']) + ')\n'
    body += '  formatter.set_xmax(@ticker.PercentXMax::Number(100.0))\n  formatter.set_decimals(@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)))\n' + query('formatter.format_pct(1.0, 100.0)', direct_pct)
    add('percent params original late error keeps batch state', {}, [direct, batch, retained, direct_pct], body)

    # Dynamic domains remain evidence, not fabricated typed passing tests.
    for value in [None, '100', np.array([1., 2.])]:
        result = observe('source-only xmax constructor', lambda value=value: state(source(xmax=value)))
        source_only.append(dict(reason='None/String/ndarray xmax outside typed numeric scalar carriers', raw_type=type(value).__name__, observation=result))
    for symbol in [False, True, [], ['%']]:
        formatter = source(symbol=symbol, decimals=0)
        results = []
        for tex in [False, True]:
            ns['mpl'].rcParams['text.usetex'] = tex
            results.append(observe('source-only dynamic symbol consumption', lambda: formatter.format_pct(1., 100.)))
        source_only.append(dict(reason='raw symbol outside String or None', raw_type=type(symbol).__name__, observation=results))
    ns['mpl'].rcParams['text.usetex'] = False
    formatter = source(is_latex=None)
    source_only.append(dict(reason='dynamic truth-valued is_latex outside Bool', observation=observe('source-only None is_latex', lambda: formatter.symbol)))
    formatter = source()
    source_only.append(dict(reason='no original Percent-specific offset setter', observation=observe('source-only absent offset setter', lambda: getattr(formatter, 'set_offset_string'))))
    source_only.append(dict(reason='no original set_params API', observation=observe('source-only absent set_params', lambda: getattr(formatter, 'set_params'))))

    payload = dict(source_hashes=ns['source_hashes'], python=sys.version.split()[0], numpy=np.__version__,
                   scope='Complete original PercentFormatter and real inherited Formatter/API/deprecation descriptor. Raw typed scalar xmax origins and deferred Automatic/Number/Integer/Text/Boolean precision; String-or-None symbol with dynamic text.usetex; independent copied parameter slots, shared live list/Float64/Int64 strided locations and stable axis identity. Numeric engine and actual Axis have separate references. Source dynamic raw objects, shape/broadcasting and truth domains are source-only, not passing typed parity. No giant output allocation or portable function manufactured expected values.',
                   observation_count=len(observations), generated_test_count=len(cases), cases=cases, source_only=source_only)
    return json.dumps(clean(payload), indent=2, allow_nan=False) + '\n', formatted(code)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('ticker', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    outputs = generate(args.ticker)
    for name, content in zip(['testdata/percent_formatter_params_reference.json', 'ticker/percent_formatter_params_reference_test.mbt'], outputs):
        target = ROOT / name
        if args.check:
            if not target.exists() or target.read_text() != content:
                raise SystemExit('reference differs: ' + name)
        else:
            target.write_text(content)
    payload = json.loads(outputs[0])
    print('percent formatter params:', payload['observation_count'], 'observations,', payload['generated_test_count'], 'generated tests,', len(payload['source_only']), 'source-only records')


if __name__ == '__main__':
    main()
