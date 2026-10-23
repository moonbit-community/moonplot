"""Generate ScalarFormatter object/rc/copy assertions from complete pinned AST.

Actual RcParams and scalar validators run in the explicit empty-font-catalog
profile. Numerical algorithms, locale and real Axis integration are separate.
"""
from pathlib import Path
import argparse
import copy
import json
import math
import sys
import warnings

import numpy as np

from formatter_reference_source import load_scalar_formatter
from generate_auto_date_reference import formatted, moon
from generate_basic_formatter_params_reference import clean, raw

ROOT = Path(__file__).resolve().parents[1]
DEFAULTS = {'axes.formatter.useoffset': True, 'axes.formatter.use_mathtext': False,
            'axes.formatter.use_locale': False, 'text.usetex': False,
            'axes.formatter.offset_threshold': 4, 'axes.formatter.limits': [-5, 6],
            'axes.unicode_minus': True}


def number(value):
    if isinstance(value, np.bool_):
        kind, value = 'NumpyBool', bool(value)
    elif isinstance(value, np.float64):
        kind, value = 'NumpyFloat64', float(value)
    elif isinstance(value, np.int64):
        kind, value = 'NumpyInt64', int(value)
    elif isinstance(value, bool):
        kind = 'Boolean'
    elif isinstance(value, int):
        kind, value = 'Integer', str(value)
    elif isinstance(value, float):
        kind = 'Number'
    else:
        return dict(kind='source-only', type=type(value).__name__, repr=repr(value))
    return dict(kind=kind, value=value)


def number_code(record):
    kind, value = record['kind'], record['value']
    if kind == 'Integer':
        value = '@bigint.BigInt::from_string(' + moon(value) + ')'
    elif kind == 'NumpyInt64':
        value = str(value) + 'L'
    else:
        value = moon(value)
    return '@ticker.ScalarNumber::' + kind + '(' + value + ')'


def optional_number(value):
    return 'None' if value is None else 'Some(' + number_code(value) + ')'


def integers(values):
    return '[' + ', '.join('@bigint.BigInt::from_string(' + moon(str(v)) + ')' for v in values) + ']'


def query(expression, expected):
    if expected['source_error']:
        return ('  let error = try { ignore(' + expression + '); "unexpected success" } catch { '
                '@core.DataError::InvalidTicks(message~) => message; _ => "unexpected error" }\n'
                '  assert_eq(error, ' + moon(expected['source_error'] + ': ' + expected['message']) + ')\n')
    return '  assert_eq(' + expression + ', ' + moon(expected['value']) + ')\n'


def config_prefix():
    return '''  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(previous.formatter_offset_threshold())
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([@bigint.BigInt::from_int(-5), @bigint.BigInt::from_int(6)])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
'''


def generate(path):
    ns = load_scalar_formatter(path)
    source = ns['ScalarFormatter']
    rc = ns['mpl'].rcParams
    observations, cases, source_only = [], [], []
    code = '''// Complete pinned ScalarFormatter state, actual RcParams and real descriptors.

///|
fn verify_scalar_param_number(actual : @ticker.ScalarNumber, expected : @ticker.ScalarNumber) -> Unit raise {
  match (actual, expected) {
    (@ticker.ScalarNumber::Number(left), @ticker.ScalarNumber::Number(right))
    | (@ticker.ScalarNumber::NumpyFloat64(left), @ticker.ScalarNumber::NumpyFloat64(right)) => {
      if right.is_nan() { assert_true(left.is_nan()) }
      else { assert_eq(left.reinterpret_as_uint64(), right.reinterpret_as_uint64()) }
    }
    _ => assert_eq(actual, expected)
  }
}

///|
fn verify_scalar_param_optional(actual : @ticker.ScalarNumber?, expected : @ticker.ScalarNumber?) -> Unit raise {
  match (actual, expected) {
    (Some(actual), Some(expected)) => verify_scalar_param_number(actual, expected)
    (None, None) => ()
    _ => fail("unexpected optional scalar")
  }
}

///|
fn verify_scalar_param_limits(actual : @ticker.ScalarPowerLimits, expected : Array[@ticker.ScalarNumber]) -> Unit raise {
  let values = match actual {
    Sequence(values) => values.map(value => @ticker.ScalarNumber::Number(value))
    Integers(values) => values.map(value => @ticker.ScalarNumber::Integer(value))
    Values(values) => values
    NdArray(_) => abort("ndarray identity is checked separately")
  }
  assert_eq(values.length(), expected.length())
  for index, value in expected { verify_scalar_param_number(values[index], value) }
}
'''

    def reset():
        for key, value in DEFAULTS.items():
            rc[key] = copy.copy(value)

    def observe(label, action):
        ns['external_warnings'].clear(); ns['warning_records'].clear()
        with warnings.catch_warnings(record=True) as runtime:
            warnings.simplefilter('always')
            try:
                result = dict(value=raw(action()), source_error=None)
            except (TypeError, ValueError, ZeroDivisionError, OverflowError,
                    IndexError, KeyError, AttributeError) as exc:
                result = dict(value=None, source_error=type(exc).__name__, message=str(exc))
        result['warnings'] = list(ns['warning_records'])
        result['runtime_warnings'] = [dict(category=type(item.message).__name__, message=str(item.message)) for item in runtime]
        observations.append(dict(label=label, **result))
        return result

    def state(formatter):
        return dict(offset=None if formatter.offset is None else number(formatter.offset),
                    use_offset=formatter.get_useOffset(), threshold=str(formatter._offset_threshold),
                    usetex=formatter.get_usetex(), math=formatter.get_useMathText(), locale=formatter.get_useLocale(),
                    scientific=formatter._scientific, order=number(formatter._orderOfMagnitude),
                    pattern=formatter._format, limits=[number(v) for v in formatter._powerlimits])

    def state_assert(variable, value, limits=True):
        body = '  verify_scalar_param_optional(' + variable + '.offset(), ' + optional_number(value['offset']) + ')\n'
        for field, expected in [('get_use_offset', value['use_offset']), ('get_usetex', value['usetex']),
                                ('get_use_math_text', value['math']), ('get_use_locale', value['locale']),
                                ('scientific', value['scientific'])]:
            body += '  assert_eq(' + variable + '.' + field + '(), ' + moon(expected) + ')\n'
        body += '  assert_eq(' + variable + '.offset_threshold(), @bigint.BigInt::from_string(' + moon(value['threshold']) + '))\n'
        body += '  verify_scalar_param_number(' + variable + '.order_of_magnitude(), ' + number_code(value['order']) + ')\n'
        body += '  assert_eq(' + variable + '.format_pattern(), ' + moon(value['pattern']) + ')\n'
        if limits:
            body += '  verify_scalar_param_limits(' + variable + '.power_limits(), [' + ', '.join(number_code(v) for v in value['limits']) + '])\n'
        return body

    def add(label, spec, expected, body, configured=True):
        nonlocal code
        cases.append(dict(label=label, specification=clean(spec), observations=clean(expected)))
        code += '\n///|\ntest ' + moon(label) + ' {\n' + (config_prefix() if configured else '') + body + '}\n'

    reset()
    formatter = source()
    expected = observe('default original constructor with actual failed font lookup', lambda: state(formatter))
    body = '  let formatter = @ticker.ScalarFormatter::new()\n' + state_assert('formatter', expected['value'])
    body += '  assert_true(formatter.axis() is None)\n  assert_eq(formatter.locations().length(), 0)\n  assert_eq(formatter.get_offset(), "")\n  assert_eq(formatter.call(2.0), "")\n'
    for method in ['null_formatter', 'fixed_formatter', 'func_formatter', 'format_str_formatter', 'str_method_formatter', 'percent_formatter']:
        body += '  assert_true(formatter.as_base_formatter().' + method + '() is None)\n'
    add('scalar params original defaults', {}, expected, body)

    rc_cases = [(False, False, False, False, 4, [-5, 6]),
                (True, True, True, True, -2, [-2, 3]),
                (False, True, False, True, 0, [0, 0]),
                (True, False, True, False, 10**100, [10**100, -(10**100)])]
    for index, (offset, math_text, locale_flag, tex, threshold, limits) in enumerate(rc_cases):
        reset()
        for key, value in [('axes.formatter.useoffset', offset), ('axes.formatter.use_mathtext', math_text),
                           ('axes.formatter.use_locale', locale_flag), ('text.usetex', tex),
                           ('axes.formatter.offset_threshold', threshold), ('axes.formatter.limits', limits)]:
            rc[key] = value
        formatter = source()
        captured = observe('constructor None options capture all current rc domains', lambda: state(formatter))
        explicit = source(useOffset=False, useMathText=False, useLocale=False, usetex=False)
        overridden = observe('constructor explicit false overrides current true defaults', lambda: state(explicit))
        body = ''
        for config, value in [('formatter_use_offset', offset), ('formatter_use_math_text', math_text),
                              ('formatter_use_locale', locale_flag), ('text_usetex', tex)]:
            body += '  @config.set_' + config + '(' + moon(value) + ')\n'
        body += '  @config.set_formatter_offset_threshold(@bigint.BigInt::from_string(' + moon(str(threshold)) + '))\n'
        body += '  @config.set_formatter_limits(' + integers(limits) + ')\n  let formatter = @ticker.ScalarFormatter::new()\n'
        body += state_assert('formatter', captured['value'])
        body += '  let explicit = @ticker.ScalarFormatter::new(use_offset=Some(@ticker.ScalarNumber::Boolean(false)), use_math_text=Some(false), use_locale=Some(false), usetex=Some(false))\n'
        body += state_assert('explicit', overridden['value'])
        add('scalar params original constructor rc capture ' + str(index), dict(use_offset=offset, use_math_text=math_text, use_locale=locale_flag, usetex=tex, threshold=str(threshold), limits=list(map(str, limits))), [captured, overridden], body)

    offsets = [None, True, False, 0, 1, -1, 10**100, -(10**100), -0., math.nan,
               math.inf, -math.inf, sys.float_info.max, np.float64(-0.),
               np.float64(math.nan), np.float64(1.25), np.int64(-(1 << 63)),
               np.int64(9007199254740993), np.bool_(True), np.bool_(False)]
    for index, value in enumerate(offsets):
        reset(); formatter = source(useOffset=value, useMathText=False)
        initial = observe('constructor optional offset resolves rc then stores raw domain', lambda: state(formatter))
        formatter.set_useOffset(value)
        setter = observe('setter None/raw scalar has independent semantics', lambda: state(formatter))
        body = '  let formatter = @ticker.ScalarFormatter::new(use_offset=' + optional_number(None if value is None else number(value)) + ', use_math_text=Some(false))\n'
        body += state_assert('formatter', initial['value'])
        body += '  formatter.set_use_offset(' + optional_number(None if value is None else number(value)) + ')\n' + state_assert('formatter', setter['value'])
        body += '  assert_eq(formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)), "")\n'
        add('scalar params original offset mode ' + str(index), None if value is None else number(value), [initial, setter], body)

    for name, source_name, key, config in [('usetex', 'usetex', 'text.usetex', 'text_usetex'),
                                          ('use_math_text', 'useMathText', 'axes.formatter.use_mathtext', 'formatter_use_math_text'),
                                          ('use_locale', 'useLocale', 'axes.formatter.use_locale', 'formatter_use_locale')]:
        for initial in [False, True, None]:
            reset(); formatter = source(useMathText=False)
            setter = getattr(formatter, 'set_' + source_name)
            setter(initial)
            captured = observe('explicit option or current rc capture', lambda: state(formatter))
            rc[key] = True
            before_reset = observe('rc mutation does not change captured flag', lambda: state(formatter))
            setter(None)
            after_reset = observe('None setter recaptures current rc', lambda: state(formatter))
            rc[key] = False
            after_second = observe('second rc mutation still not live', lambda: state(formatter))
            body = '  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))\n  formatter.set_' + name + '(' + ('None' if initial is None else 'Some(' + moon(initial) + ')') + ')\n'
            body += state_assert('formatter', captured['value']) + '  @config.set_' + config + '(true)\n' + state_assert('formatter', before_reset['value'])
            body += '  formatter.set_' + name + '(None)\n' + state_assert('formatter', after_reset['value'])
            body += '  @config.set_' + config + '(false)\n' + state_assert('formatter', after_second['value'])
            add('scalar params original captured flag ' + name + ' ' + str(initial), dict(flag=name, initial=initial), [captured, before_reset, after_reset, after_second], body)

    raw_offsets = [None, False, True, -0., math.nan, math.inf, 10**100,
                   np.float64(-0.), np.int64(9007199254740993), np.bool_(True)]
    for index, value in enumerate(raw_offsets):
        reset(); formatter = source(useMathText=False); formatter.offset = value
        expected = observe('raw offset write does not alter automatic mode', lambda: state(formatter))
        body = '  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))\n  formatter.set_offset(' + optional_number(None if value is None else number(value)) + ')\n'
        body += state_assert('formatter', expected['value'])
        add('scalar params original raw offset slot ' + str(index), None if value is None else number(value), expected, body)

    for index, value in enumerate([0, 2, 2.5, -0., math.nan, math.inf, 10**100,
                                   np.float64(2.5), np.int64(9007199254740993), np.bool_(True)]):
        reset(); formatter = source(useMathText=False); formatter._orderOfMagnitude = value; formatter._format = '%r'
        expected = observe('raw cached slots assign without preparing', lambda: state(formatter))
        body = '  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))\n  formatter.set_order_of_magnitude(' + number_code(number(value)) + ')\n  formatter.set_format_pattern("%r")\n'
        body += state_assert('formatter', expected['value'])
        add('scalar params original raw cached order ' + str(index), number(value), expected, body)

    limits_cases = [('Sequence', []), ('Sequence', [1.]), ('Sequence', [1., 2., 3.]),
                    ('Sequence', [2.5, 2.5]), ('Sequence', [math.nan, math.inf]),
                    ('Integers', [-5, 6]), ('Integers', [10**100, 10**100]),
                    ('Values', [np.bool_(True), np.int64(9007199254740993)]),
                    ('Values', [2.5, 3])]
    for index, (kind, values) in enumerate(limits_cases):
        reset(); formatter = source(useMathText=False); old = formatter._powerlimits
        expected = observe('powerlimits validates only current length then borrows', lambda: (formatter.set_powerlimits(values), state(formatter))[1])
        identity = observe('powerlimits old or borrowed identity', lambda: dict(old=formatter._powerlimits is old, borrowed=formatter._powerlimits is values))
        array = moon(values) if kind == 'Sequence' else integers(values) if kind == 'Integers' else '[' + ', '.join(number_code(number(v)) for v in values) + ']'
        body = '  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))\n  let limits = ' + array + '\n'
        expression = 'formatter.set_power_limits(@ticker.ScalarPowerLimits::' + kind + '(limits))'
        if expected['source_error']:
            body += query(expression, expected)
            body += '  verify_scalar_param_limits(formatter.power_limits(), [@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(-5)), @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(6))])\n'
        else:
            body += '  ' + expression + '\n' + state_assert('formatter', expected['value'])
            body += '  match formatter.power_limits() { ' + kind + '(retained) => assert_true(physical_equal(retained, limits)); _ => fail("expected original power limits") }\n'
        add('scalar params original power limits ' + str(index), dict(kind=kind, values=[number(v) for v in values]), [expected, identity], body)

    for index, kind in enumerate(['Sequence', 'Integers', 'Values']):
        reset(); values = [-3., 4.] if kind == 'Sequence' else [-3, 4] if kind == 'Integers' else [np.int64(1), 2.5]
        formatter = source(useMathText=False); formatter.set_powerlimits(values); shallow = copy.copy(formatter)
        values.append(8. if kind == 'Sequence' else 8)
        expected = observe('shallow limits retain live length and values', lambda: [state(formatter), state(shallow)])
        shallow.set_powerlimits([1, 1])
        rebound = observe('copy can independently rebind power limits', lambda: [state(formatter), state(shallow)])
        array = moon(values[:-1]) if kind == 'Sequence' else integers(values[:-1]) if kind == 'Integers' else '[' + ', '.join(number_code(number(v)) for v in values[:-1]) + ']'
        body = '  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))\n  let limits = ' + array + '\n  formatter.set_power_limits(@ticker.ScalarPowerLimits::' + kind + '(limits))\n  let shallow = formatter.copy()\n'
        body += '  limits.push(' + ('8.0' if kind == 'Sequence' else '@bigint.BigInt::from_int(8)' if kind == 'Integers' else '@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(8))') + ')\n'
        for variable, value in zip(['formatter', 'shallow'], expected['value']):body += state_assert(variable, value)
        body += '  shallow.set_power_limits(@ticker.ScalarPowerLimits::Integers([@bigint.BigInt::from_int(1), @bigint.BigInt::from_int(1)]))\n'
        for variable, value in zip(['formatter', 'shallow'], rebound['value']):body += state_assert(variable, value)
        add('scalar params original power limits copy ' + kind, dict(kind=kind), [expected, rebound], body)

    views = [('forward', [(0, 1, 2)]), ('reverse', [(1, -1, 2)]),
             ('nested', [(0, 2, 2), (1, -1, 2)]), ('zero', [(1, 0, 2)])]
    for integer in [False, True]:
        for name, chain in views:
            reset(); initial = [9007199254740993, -(1 << 63), 7, -1] if integer else [-0., 1.25, 3.5, -7.]
            owner = np.array(initial, dtype=np.int64 if integer else np.float64); view = owner
            for start, stride, length in chain:view = np.lib.stride_tricks.as_strided(view[start:], shape=(length,), strides=(view.strides[0]*stride,), writeable=True)
            formatter = source(useMathText=False); formatter.set_powerlimits(view); shallow = copy.copy(formatter)
            identity = observe('strided limits retained without dtype conversion', lambda: dict(shared=formatter._powerlimits is shallow._powerlimits is view, dtype=str(view.dtype)))
            view[-1] = 13; owner[0] = 11
            expected = observe('strided limits owner/view mutation remains shared', lambda: dict(owner=owner.tolist(), values=view.tolist()))
            formatter.set_powerlimits([2, 2])
            retained = observe('strided limits copy survives original slot rebind', lambda: dict(identity=shallow._powerlimits is view, values=shallow._powerlimits.tolist()))
            array = '[' + ', '.join(str(v)+'L' for v in initial) + ']' if integer else moon(initial)
            body = '  let owner = ' + array + '\n  let view = @ticker.TickValues::' + ('from_int64_array' if integer else 'from_array') + '(owner)'
            for step in chain:body += '.view(' + ', '.join(map(str,step)) + ')'
            body += '\n  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))\n  formatter.set_power_limits(@ticker.ScalarPowerLimits::NdArray(view))\n  let shallow = formatter.copy()\n  view.set(-1, 13.0)\n  owner[0] = ' + ('11L' if integer else '11.0') + '\n'
            wanted = '[' + ', '.join(str(v)+'L' for v in expected['value']['owner']) + ']' if integer else moon(expected['value']['owner'])
            body += '  assert_eq(owner, ' + wanted + ')\n  formatter.set_power_limits(@ticker.ScalarPowerLimits::Integers([@bigint.BigInt::from_int(2), @bigint.BigInt::from_int(2)]))\n'
            body += '  match shallow.power_limits() { NdArray(retained) => assert_true(physical_equal(retained, view)); _ => fail("expected retained view") }\n'
            add('scalar params original ndarray power limits ' + ('int64 ' if integer else 'float64 ') + name, dict(integer=integer, chain=chain, owner=initial), [identity, expected, retained], body)

    reset(); formatter = source(useMathText=False); shallow = copy.copy(formatter); snapshot = rc.copy()
    shared = rc['axes.formatter.limits']; shared.append(8)
    expected = observe('constructor/object/rc copies share limits array', lambda: dict(formatter=state(formatter), shallow=state(shallow), snapshot=snapshot['axes.formatter.limits'][:], same=formatter._powerlimits is shallow._powerlimits is snapshot['axes.formatter.limits'] is shared))
    shared.pop(); rc['axes.formatter.limits'] = [2, 2]; rc['axes.formatter.offset_threshold'] = 7
    replacement = source(useMathText=False)
    captured = observe('rc replacement changes future captures only', lambda: [state(formatter), state(replacement)])
    body = '  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))\n  let shallow = formatter.copy()\n  let snapshot = @config.rc_params()\n  let shared = @config.formatter_limits()\n  shared.push(@bigint.BigInt::from_int(8))\n'
    body += state_assert('formatter', expected['value']['formatter']) + state_assert('shallow', expected['value']['shallow'])
    body += '  assert_true(physical_equal(snapshot.formatter_limits(), shared))\n  ignore(shared.pop())\n  @config.set_formatter_limits([@bigint.BigInt::from_int(2), @bigint.BigInt::from_int(2)])\n  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(7))\n  let replacement = @ticker.ScalarFormatter::new(use_math_text=Some(false))\n'
    for variable, value in zip(['formatter', 'replacement'], captured['value']):body += state_assert(variable, value)
    add('scalar params original rc capture and shallow aliases', {}, [expected, captured], body)

    reset(); formatter = source(useMathText=False); locations = []
    formatter.set_locs(locations); formatter.create_dummy_axis(); shallow = copy.copy(formatter)
    formatter.offset = 17; formatter._orderOfMagnitude = 3; formatter._format = '%1.2f'
    expected = []
    body = '  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))\n  let locations : Array[Double] = []\n  formatter.set_locs(locations)\n  formatter.create_dummy_axis()\n  let shallow = formatter.copy()\n  formatter.set_offset(Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(17))))\n  formatter.set_order_of_magnitude(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(3)))\n  formatter.set_format_pattern("%1.2f")\n'
    for source_name, port_name, value, code_value in [('usetex','usetex',True,'Some(true)'), ('useMathText','use_math_text',True,'Some(true)'), ('useLocale','use_locale',True,'Some(true)'), ('scientific','scientific',False,'false'), ('powerlimits','power_limits',[2,2],'@ticker.ScalarPowerLimits::Integers([@bigint.BigInt::from_int(2), @bigint.BigInt::from_int(2)])'), ('useOffset','use_offset',True,'Some(@ticker.ScalarNumber::Boolean(true))')]:
        getattr(formatter,'set_'+source_name)(value)
        result = observe('flag setter leaves prepared cached fields unchanged', lambda: state(formatter));expected.append(result)
        body += '  formatter.set_' + port_name + '(' + code_value + ')\n' + state_assert('formatter', result['value'])
    original_copy = observe('shallow copy retains all original cached/option slots', lambda: state(shallow));expected.append(original_copy)
    body += state_assert('shallow', original_copy['value']) + '  assert_eq(shallow.axis(), formatter.axis())\n'
    body += '  locations.push(7.0)\n  assert_eq(shallow.locations().get(0), 7.0)\n  formatter.set_axis(None)\n  assert_true(shallow.axis() is Some(_))\n'
    add('scalar params original cached fields do not recompute and copies stay independent', {}, expected, body)

    # Whole real descriptors and unsupported raw truth/type domains are recorded,
    # not counted as preferred typed-API warning parity.
    reset()
    for name, value in [('format','%r'), ('orderOfMagnitude',2.5)]:
        formatter = source(useMathText=False)
        result = [observe('source deprecated getter', lambda name=name:getattr(formatter,name)),
                  observe('source deprecated setter', lambda name=name,value=value:(setattr(formatter,name,value),None)[1])]
        source_only.append(dict(reason='deprecated spelling/warning distinct from new preferred raw cached-slot methods', attribute=name, observations=result))
    for value in ['12', [], np.array([1.,2.])]:
        formatter = source(useOffset=value,useMathText=False)
        source_only.append(dict(reason='raw offset outside optional typed numeric carrier', raw_type=type(value).__name__, observation=observe('dynamic offset stored', lambda:dict(identity=formatter.offset is value, use_offset=formatter.get_useOffset()))))
    for name in ['usetex','useMathText','useLocale']:
        for value in [0,'False',np.bool_(False)]:
            formatter = source(useMathText=False);getattr(formatter,'set_'+name)(value)
            source_only.append(dict(reason='raw truth-valued option outside Bool/None domain', option=name, raw_type=type(value).__name__, observation=observe('raw non-Bool option retained', lambda name=name:dict(type=type(getattr(formatter,'get_'+name)()).__name__, same=getattr(formatter,'get_'+name)() is value))))
    for value in [None, 'ab', np.array([[1,2],[3,4]])]:
        formatter = source(useMathText=False)
        source_only.append(dict(reason='None/Text/2D powerlimits outside numeric one-dimensional carrier', raw_type=type(value).__name__, observation=observe('dynamic powerlimits setter', lambda value=value:(formatter.set_powerlimits(value),True)[1])))

    payload = dict(source_hashes=ns['source_hashes'], python=sys.version.split()[0], numpy=np.__version__,
                   host_profile=ns['scalar_host_profile'],
                   scope='Complete ScalarFormatter, inherited real Formatter/deprecation, actual RcParams with original scalar validators. Six numeric scalar origins and optional raw offsets; captured Bool options; four borrowed power-limit stores; independent shallow cached slots with shared locs/axis/limits and rc limits. Preferred raw methods do not impersonate deprecated spelling warning behavior. Numeric preparation/formatting, locale and actual Axis have separate references. Raw dynamic nonnumeric/truth/shape domains remain source-only.',
                   observation_count=len(observations), generated_test_count=len(cases), cases=cases, source_only=source_only)
    return json.dumps(clean(payload), indent=2, allow_nan=False) + '\n', formatted(code)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('ticker', type=Path); parser.add_argument('--check', action='store_true')
    args = parser.parse_args(); outputs = generate(args.ticker)
    for name, content in zip(['testdata/scalar_formatter_params_reference.json', 'ticker/scalar_formatter_params_reference_test.mbt'], outputs):
        target = ROOT / name
        if args.check:
            if not target.exists() or target.read_text() != content:raise SystemExit('reference differs: '+name)
        else:target.write_text(content)
    payload=json.loads(outputs[0])
    print('Scalar params:',payload['observation_count'],'observations;',payload['generated_test_count'],'generated tests;',len(payload['source_only']),'source-only records')


if __name__ == '__main__':main()
