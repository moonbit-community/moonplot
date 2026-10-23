"""Generate basic Formatter state/alias assertions using complete pinned AST.

Dynamic Python-only parameter observations are recorded separately and do not
count as passing MoonBit tests. Batch algorithms have their own reference.
"""
from pathlib import Path
import argparse
import copy
import json
import math
import sys

import numpy as np

from formatter_reference_source import load
from generate_auto_date_reference import formatted, moon

ROOT = Path(__file__).resolve().parents[1]


def clean(value):
    if isinstance(value, np.ndarray):
        return [clean(v) for v in value]
    if isinstance(value, np.generic):
        return clean(value.item())
    if isinstance(value, float) and not math.isfinite(value):
        return repr(value)
    if isinstance(value, (list, tuple)):
        return [clean(v) for v in value]
    if isinstance(value, dict):
        return {str(k): clean(v) for k, v in value.items()}
    return value


def raw(value):
    if isinstance(value, np.ndarray):
        return [raw(v) for v in value]
    if isinstance(value, np.generic):
        return raw(value.item())
    if isinstance(value, (list, tuple)):
        return [raw(v) for v in value]
    if isinstance(value, dict):
        return {str(k): raw(v) for k, v in value.items()}
    return value


def error_assert(expression):
    return ('  assert_true(try { ignore(' + expression + '); false } catch { '
            '@core.DataError::InvalidTicks(..) => true; _ => false })\n')


def generate(path):
    ns = load(path)
    source_classes = {name: ns[name] for name in ['Formatter', 'NullFormatter', 'FixedFormatter', 'FuncFormatter']}
    observations = []
    cases = []
    source_only = []
    code = '''// Generated from complete pinned Formatter classes and real API descriptors.

///|
fn verify_basic_formatter_param_values(actual : @ticker.FormatterLocations, expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    let got = actual.get(index)
    if value.is_nan() { assert_true(got.is_nan()) }
    else { assert_eq(got.reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}

///|
fn verify_basic_formatter_param_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}
'''

    def observe(label, action):
        ns['external_warnings'].clear()
        ns['warning_records'].clear()
        try:
            result = dict(value=raw(action()), source_error=None)
        except (TypeError, ValueError, IndexError, OverflowError, AttributeError, NotImplementedError) as exc:
            result = dict(value=None, source_error=type(exc).__name__, message=str(exc))
        result['warnings'] = list(ns['warning_records'])
        observations.append(dict(label=label, **result))
        return result

    def add(label, spec, expected, body):
        nonlocal code
        cases.append(dict(label=label, specification=clean(spec), observations=clean(expected)))
        code += '\n///|\ntest ' + moon(label) + ' {\n' + body + '}\n'

    def construct(name):
        if name == 'FixedFormatter':
            return source_classes[name](['first', 'second'])
        if name == 'FuncFormatter':
            return source_classes[name](lambda x, p: 'source')
        return source_classes[name]()

    def constructor(name):
        if name == 'Formatter':
            return '@ticker.BaseFormatter::new()'
        argument = '["first", "second"]' if name == 'FixedFormatter' else 'fn(_value, _position) { "source" }' if name == 'FuncFormatter' else ''
        return '@ticker.' + name + '::new(' + argument + ').as_base_formatter()'

    for name in source_classes:
        formatter = construct(name)
        state = observe(name + ' defaults', lambda: dict(offset=formatter.get_offset(), locations=list(formatter._locs), axis_none=formatter.axis is None))
        body = '  let formatter = ' + constructor(name) + '\n'
        body += '  assert_eq(formatter.get_offset(), ' + moon(state['value']['offset']) + ')\n'
        body += '  verify_basic_formatter_param_values(formatter.locations(), ' + moon(state['value']['locations']) + ')\n'
        body += '  assert_true(formatter.axis() is None)\n'
        for wrapper, method in [('NullFormatter', 'null_formatter'), ('FixedFormatter', 'fixed_formatter'), ('FuncFormatter', 'func_formatter')]:
            expected = 'Some(_)' if name == wrapper else 'None'
            body += '  assert_true(formatter.' + method + '() is ' + expected + ')\n'
        add('basic formatter original defaults ' + name, dict(kind=name), state, body)

    shared_instances = [construct(name) for name in source_classes]
    shared_default = ns['Formatter']._locs
    shared_default.clear()
    shared_stages = [observe('default locs shared across kinds', lambda: [f._locs is shared_default for f in shared_instances])]
    shared_default.append(7.)
    shared_stages.append(observe('default locs cross-kind mutation', lambda: [list(f._locs) for f in shared_instances]))
    shared_instances[0].set_locs([9.])
    shared_stages.append(observe('default locs independent first write', lambda: [list(f._locs) for f in shared_instances]))
    body = ''.join('  let formatter' + str(i) + ' = ' + constructor(name) + '\n' for i, name in enumerate(source_classes))
    body += '  let shared = match formatter0.locations() { Sequence(values) => values; _ => abort("expected default sequence") }\n  defer shared.clear()\n'
    for i in range(1, 4):
        body += '  match formatter' + str(i) + '.locations() { Sequence(values) => assert_true(physical_equal(shared, values)); _ => fail("expected shared sequence") }\n'
    body += '  shared.push(7.0)\n'
    for i, values in enumerate(shared_stages[1]['value']):
        body += '  verify_basic_formatter_param_values(formatter' + str(i) + '.locations(), ' + moon(values) + ')\n'
    body += '  formatter0.set_locs([9.0])\n'
    for i, values in enumerate(shared_stages[2]['value']):
        body += '  verify_basic_formatter_param_values(formatter' + str(i) + '.locations(), ' + moon(values) + ')\n'
    add('basic formatter original shared class default locations', dict(kinds=list(source_classes)), shared_stages, body)
    shared_default.clear()

    captured = ['original']
    formatter = ns['FuncFormatter'](lambda x, p: captured[0])
    retained = formatter.func
    shallow = copy.copy(formatter)
    function_stages = [observe('callback getter original', lambda: [retained(2., None), shallow(2., None)])]
    captured[0] = 'captured-mutated'
    function_stages.append(observe('callback closure shared by copy', lambda: [formatter(2., 0), shallow(2., 0), retained(2., None)]))
    formatter.func = lambda x, p: 'replacement'
    function_stages.append(observe('callback slot independent', lambda: [formatter(2., None), shallow(2., None), retained(2., None)]))
    body = '  let captured = Ref("original")\n  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { captured.val })\n  let retained = formatter.func()\n  let shallow = formatter.copy()\n'
    body += '  assert_eq(retained(2.0, None), ' + moon(function_stages[0]['value'][0]) + ')\n'
    body += '  assert_eq(shallow.call(2.0), ' + moon(function_stages[0]['value'][1]) + ')\n  captured.val = "captured-mutated"\n'
    body += '  assert_eq(formatter.call(2.0, pos=0), ' + moon(function_stages[1]['value'][0]) + ')\n'
    body += '  assert_eq(shallow.call(2.0, pos=0), ' + moon(function_stages[1]['value'][1]) + ')\n'
    body += '  assert_eq(retained(2.0, None), ' + moon(function_stages[1]['value'][2]) + ')\n'
    body += '  formatter.set_func(fn(_value, _position) { "replacement" })\n'
    body += '  assert_eq(formatter.call(2.0), ' + moon(function_stages[2]['value'][0]) + ')\n'
    body += '  assert_eq(shallow.call(2.0), ' + moon(function_stages[2]['value'][1]) + ')\n'
    body += '  assert_eq(retained(2.0, None), ' + moon(function_stages[2]['value'][2]) + ')\n'
    add('basic formatter original callback getter copy and raw replacement', {}, function_stages, body)

    for index, initial in enumerate([[], [''], ['a', 'b'], ['-1', '−2', '𝄞'], ['same', 'same']]):
        labels = initial.copy()
        formatter = ns['FixedFormatter'](labels)
        shallow = copy.copy(formatter)
        stages = [observe('fixed borrowed initial', lambda: dict(labels=list(formatter.seq), shared=formatter.seq is shallow.seq is labels))]
        labels.append('appended')
        labels[0] = 'mutated'
        stages.append(observe('fixed live growth', lambda: dict(labels=list(formatter.seq), copied_labels=list(shallow.seq))))
        formatter.seq = ['replacement']
        stages.append(observe('fixed independent rebind', lambda: dict(labels=list(formatter.seq), copied_labels=list(shallow.seq))))
        shallow.seq.append('through-copy')
        stages.append(observe('fixed copy writes original', lambda: list(labels)))
        body = '  let labels : Array[String] = ' + moon(initial) + '\n  let formatter = @ticker.FixedFormatter::new(labels)\n  let shallow = formatter.copy()\n'
        body += '  assert_true(physical_equal(formatter.seq(), labels))\n  assert_true(physical_equal(shallow.seq(), labels))\n'
        body += '  labels.push("appended")\n  labels[0] = "mutated"\n'
        body += '  assert_eq(formatter.seq(), ' + moon(stages[1]['value']['labels']) + ')\n'
        body += '  assert_eq(shallow.seq(), ' + moon(stages[1]['value']['copied_labels']) + ')\n'
        body += '  formatter.set_seq(["replacement"])\n'
        body += '  assert_eq(formatter.seq(), ' + moon(stages[2]['value']['labels']) + ')\n'
        body += '  assert_eq(shallow.seq(), ' + moon(stages[2]['value']['copied_labels']) + ')\n'
        body += '  shallow.seq().push("through-copy")\n  assert_eq(labels, ' + moon(stages[3]['value']) + ')\n'
        body += '  let live = formatter.as_base_formatter().fixed_formatter().unwrap()\n  live.set_seq(["through-base"])\n  assert_eq(formatter.seq(), ["through-base"])\n'
        add('basic formatter original label alias ' + str(index), dict(labels=initial), stages, body)

    for name in ['FixedFormatter', 'FuncFormatter']:
        for index, offset in enumerate(['', '-', '−1 + 2', 'first\nsecond', '𝄞 café']):
            formatter = construct(name)
            formatter.set_offset_string(offset)
            shallow = copy.copy(formatter)
            first = observe('offset shallow initial', lambda: [formatter.get_offset(), shallow.get_offset()])
            formatter.set_offset_string('rebound')
            second = observe('offset independent replacement', lambda: [formatter.get_offset(), shallow.get_offset()])
            argument = '["first", "second"]' if name == 'FixedFormatter' else 'fn(_value, _position) { "source" }'
            body = '  let formatter = @ticker.' + name + '::new(' + argument + ')\n'
            body += '  formatter.set_offset_string(' + moon(offset) + ')\n  let shallow = formatter.copy()\n'
            body += '  assert_eq(formatter.as_base_formatter().get_offset(), ' + moon(first['value'][0]) + ')\n'
            body += '  assert_eq(shallow.get_offset(), ' + moon(first['value'][1]) + ')\n'
            body += '  formatter.set_offset_string("rebound")\n'
            body += '  assert_eq(formatter.get_offset(), ' + moon(second['value'][0]) + ')\n'
            body += '  assert_eq(shallow.as_base_formatter().get_offset(), ' + moon(second['value'][1]) + ')\n'
            add('basic formatter original offset ' + name + ' ' + str(index), dict(kind=name, offset=offset), [first, second], body)

    for name in source_classes:
        for index, original in enumerate([[], [-0.0], [-3.0, 2.0, math.inf]]):
            values = original.copy()
            formatter = construct(name)
            formatter.set_locs(values)
            shallow = copy.copy(formatter)
            stages = [observe('locs borrowed identity', lambda: dict(shared=formatter._locs is shallow._locs is values, locations=list(formatter._locs)))]
            values.append(7.5)
            values[0] = -2.25
            stages.append(observe('locs list growth', lambda: [list(formatter._locs), list(shallow._locs)]))
            formatter.set_locs([9.0])
            stages.append(observe('locs independent slot', lambda: [list(formatter._locs), list(shallow._locs)]))
            body = '  let formatter = ' + constructor(name) + '\n  let values : Array[Double] = ' + moon(original) + '\n  formatter.set_locs(values)\n  let shallow = formatter.copy()\n'
            body += '  match formatter.locations() { Sequence(retained) => assert_true(physical_equal(retained, values)); _ => fail("expected list locations") }\n'
            body += '  values.push(7.5)\n  values[0] = -2.25\n'
            body += '  verify_basic_formatter_param_values(formatter.locations(), ' + moon(stages[1]['value'][0]) + ')\n'
            body += '  verify_basic_formatter_param_values(shallow.locations(), ' + moon(stages[1]['value'][1]) + ')\n'
            body += '  formatter.set_locs([9.0])\n'
            body += '  verify_basic_formatter_param_values(formatter.locations(), ' + moon(stages[2]['value'][0]) + ')\n'
            body += '  verify_basic_formatter_param_values(shallow.locations(), ' + moon(stages[2]['value'][1]) + ')\n'
            add('basic formatter original locs list ' + name + ' ' + str(index), dict(kind=name, values=original), stages, body)

    views = [dict(name='full', chain=[(0, 1, 8)]), dict(name='reverse', chain=[(7, -2, 4)]),
             dict(name='stride', chain=[(1, 2, 4)]), dict(name='nested', chain=[(1, 2, 4), (3, -1, 4), (1, 2, 2)]),
             dict(name='zero', chain=[(2, 0, 3)]), dict(name='empty', chain=[(0, 1, 0)])]
    for integer in [False, True]:
        for spec in views:
            owner = np.arange(8, dtype=np.int64 if integer else np.float64)
            view = owner
            indices = np.arange(8)
            for start, stride, length in spec['chain']:
                view = np.lib.stride_tricks.as_strided(view[start:], shape=(length,), strides=(view.strides[0] * stride,), writeable=True)
                indices = np.lib.stride_tricks.as_strided(indices[start:], shape=(length,), strides=(indices.strides[0] * stride,), writeable=False)
            formatter = ns['NullFormatter']()
            formatter.set_locs(view)
            shallow = copy.copy(formatter)
            stages = [observe('view borrowed initial', lambda: dict(values=list(map(float, formatter._locs)), shared=formatter._locs is shallow._locs is view, dtype=str(formatter._locs.dtype)))]
            if len(view):
                owner[int(indices[0])] = 41.5
            stages.append(observe('view owner mutation', lambda: list(map(float, shallow._locs))))
            if len(view):
                view[0] = -3.75
            stages.append(observe('view write to owner', lambda: dict(values=list(map(float, formatter._locs)), owner=owner.tolist())))
            formatter.set_locs([])
            stages.append(observe('view copy slot retained', lambda: list(map(float, shallow._locs))))
            owner_expr = '[' + ', '.join(str(i) + ('L' if integer else '.0') for i in range(8)) + ']'
            maker = 'from_int64_array' if integer else 'from_array'
            body = '  let owner = ' + owner_expr + '\n  let view = @ticker.TickValues::' + maker + '(owner)'
            for start, stride, length in spec['chain']:
                body += '.view(' + ', '.join(map(str, (start, stride, length))) + ')'
            body += '\n  let formatter = @ticker.NullFormatter::new()\n  formatter.set_locs_view(view)\n  let shallow = formatter.copy()\n'
            body += '  match formatter.locations() { NdArray(retained) => assert_true(physical_equal(retained, view)); _ => fail("expected ndarray locations") }\n'
            body += '  verify_basic_formatter_param_values(formatter.locations(), ' + moon(stages[0]['value']['values']) + ')\n'
            if len(view):
                body += '  owner[' + str(int(indices[0])) + '] = ' + ('41L' if integer else '41.5') + '\n'
            body += '  verify_basic_formatter_param_values(shallow.locations(), ' + moon(stages[1]['value']) + ')\n'
            if len(view):
                body += '  view.set(0, -3.75)\n'
            body += '  verify_basic_formatter_param_values(formatter.locations(), ' + moon(stages[2]['value']['values']) + ')\n'
            expected_owner = '[' + ', '.join(str(v) + 'L' for v in stages[2]['value']['owner']) + ']' if integer else moon(stages[2]['value']['owner'])
            body += '  assert_eq(owner, ' + expected_owner + ')\n  formatter.set_locs([])\n'
            body += '  verify_basic_formatter_param_values(shallow.locations(), ' + moon(stages[3]['value']) + ')\n'
            add('basic formatter original locs view ' + ('int64 ' if integer else 'float64 ') + spec['name'], dict(integer=integer, **spec), stages, body)

    for ndarray in [False, True]:
        for index in [-2147483648, -4, -3, -1, 0, 2, 3, 2147483647]:
            values = np.array([1., -0., math.inf]) if ndarray else [1., -0., math.inf]
            formatter = ns['Formatter']()
            formatter.set_locs(values)
            result = observe('locations indexed access', lambda: float(formatter._locs[index]))
            body = '  let formatter = @ticker.BaseFormatter::new()\n'
            body += ('  formatter.set_locs_view(@ticker.TickValues::from_array([1.0, -0.0, (1.0/0.0)]))\n' if ndarray else '  formatter.set_locs([1.0, -0.0, (1.0/0.0)])\n')
            expression = 'formatter.locations().get(' + str(index) + ')'
            body += error_assert(expression) if result['source_error'] else '  verify_basic_formatter_param_double(' + expression + ', ' + moon(result['value']) + ')\n'
            add('basic formatter original locs index ' + str(ndarray) + ' ' + str(index), dict(ndarray=ndarray, index=index), result, body)

    for name in source_classes:
        for index, minimum in enumerate([0.0, -0.0, .25, math.inf, math.nan]):
            formatter = construct(name)
            first = object()
            second = object()
            formatter.set_axis(first)
            shallow = copy.copy(formatter)
            formatter.create_dummy_axis(minpos=minimum)
            stages = [observe('bound dummy ignored', lambda: [formatter.axis is first, shallow.axis is first])]
            formatter.set_axis(second)
            stages.append(observe('axis independent rebinding', lambda: [formatter.axis is second, shallow.axis is first]))
            formatter.set_axis(None)
            formatter.create_dummy_axis(minpos=minimum)
            dummy = formatter.axis
            stages.append(observe('dummy minpos', lambda: [formatter.axis.get_minpos(), shallow.axis is first]))
            formatter.create_dummy_axis(minpos=999.)
            stages.append(observe('dummy kept', lambda: [formatter.axis is dummy, formatter.axis.get_minpos()]))
            formatter.set_axis(None)
            stages.append(observe('axis None reset', lambda: [formatter.axis is None, shallow.axis is first]))
            body = '  let formatter = ' + constructor(name) + '\n  let first = @ticker.FormatterAxisBinding::new()\n  let second = @ticker.FormatterAxisBinding::new()\n'
            body += '  assert_true(first != second)\n  assert_true(!first.is_dummy())\n  assert_true(first.dummy_minpos() is None)\n'
            body += '  formatter.set_axis(Some(first))\n  let shallow = formatter.copy()\n  formatter.create_dummy_axis(minpos=' + moon(minimum) + ')\n'
            body += '  assert_eq(formatter.axis(), Some(first))\n  assert_eq(shallow.axis(), Some(first))\n  formatter.set_axis(Some(second))\n'
            body += '  assert_eq(formatter.axis(), Some(second))\n  assert_eq(shallow.axis(), Some(first))\n  formatter.set_axis(None)\n  formatter.create_dummy_axis(minpos=' + moon(minimum) + ')\n'
            body += '  let dummy = formatter.axis().unwrap()\n  assert_true(dummy.is_dummy())\n  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), ' + moon(stages[2]['value'][0]) + ')\n'
            body += '  formatter.create_dummy_axis(minpos=999.0)\n  assert_eq(formatter.axis(), Some(dummy))\n  formatter.set_axis(None)\n  assert_true(formatter.axis() is None)\n  assert_eq(shallow.axis(), Some(first))\n'
            add('basic formatter original axis copy ' + name + ' ' + str(index), dict(kind=name, minpos=minimum), stages, body)

    # Deprecated and dynamic parameter observations are deliberately source only.
    for seq in [None, 0, [], ['a', 'b'], [1, None], 'a𝄞b']:
        for position in [None, -1, 0, 2.0, math.nan, 2**100, -(2**100)]:
            formatter = ns['FixedFormatter'](seq)
            result = observe('source-only dynamic fixed position', lambda: formatter(1., position))
            control = isinstance(seq, list) and all(isinstance(value, str) for value in seq) and (position is None or type(position) is int and -2147483648 <= position <= 2147483647)
            source_only.append(dict(domain='typed-control' if control else 'outside-typed-domain', reason='source-only dynamic/control comparison, not additional passing Moon count', seq=clean(seq), position=clean(position), observation=result))
    class VirtualLabels:
        def __init__(self, length):
            self.length = length
            self.events = []

        def __len__(self):
            self.events.append('len')
            return self.length

        def __getitem__(self, position):
            self.events.append(['getitem', position])
            return 'virtual'

        def __bool__(self):
            raise RuntimeError('sequence truth must not be queried')

    for length in [3, sys.maxsize, sys.maxsize + 1]:
        for position in [None, 0, length, -(2**100)]:
            virtual = VirtualLabels(length)
            formatter = ns['FixedFormatter'](virtual)
            result = observe('source-only virtual sequence length', lambda: formatter(1., position))
            source_only.append(dict(reason='arbitrary Python sequences are outside Array[String]; no giant allocation', length=length, position=position, events=virtual.events, observation=result))
    formatter = ns['FuncFormatter'](None)
    source_only.append(dict(reason='noncallable raw constructor accepted, outside typed function domain', observation=observe('source-only noncallable Func', lambda: formatter(1.))))
    formatter = ns['Formatter']()
    ns['Formatter']._locs.clear()
    source_only.append(dict(reason='real deprecated property', operation='read', observation=observe('deprecated locs read', lambda: formatter.locs)))
    source_only.append(dict(reason='real deprecated property', operation='write', observation=observe('deprecated locs write', lambda: setattr(formatter, 'locs', [2.]))))
    source_only.append(dict(reason='real deprecated property', operation='delete', observation=observe('deprecated locs delete', lambda: delattr(formatter, 'locs'))))

    payload = dict(source_hashes=ns['source_hashes'], python=sys.version.split()[0], numpy=np.__version__,
                   scope='Complete original basic Formatter classes and real pinned API/deprecation module. Double values, String labels/offset/callback outputs, Int32 optional positions, mutable list or Float64/Int64 TickValues locations. State copy is shallow; opaque axis binding identity/dummy-minpos metadata excludes dynamic Axis/dummy getters. Legacy convenience formatters unchanged. Deprecated locs property and unsupported dynamic parameter domains are source-only evidence.',
                   observation_count=len(observations), generated_test_count=len(cases), cases=cases, source_only=source_only)
    return json.dumps(clean(payload), indent=2, allow_nan=False) + '\n', formatted(code)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('ticker', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    outputs = generate(args.ticker)
    for name, content in zip(['testdata/basic_formatter_params_reference.json', 'ticker/basic_formatter_params_reference_test.mbt'], outputs):
        target = ROOT / name
        if args.check:
            if not target.exists() or target.read_text() != content:
                raise SystemExit('reference differs: ' + name)
        else:
            target.write_text(content)
    payload = json.loads(outputs[0])
    print('basic formatter params:', payload['observation_count'], 'observations,', payload['generated_test_count'], 'generated tests,', len(payload['source_only']), 'source-only records')


if __name__ == '__main__':
    main()
