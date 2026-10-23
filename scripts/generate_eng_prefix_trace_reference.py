"""Builtin CPython dictionary traces for engineering numeric prefix keys.

Hash collisions with NumPy weak equality make probe order observable after
deletion, resizing and copying. Iteration order alone is not a lookup oracle.
"""
import argparse
import json
import math
import random
import sys
from pathlib import Path

import numpy as np

from formatter_reference_source import load_eng_formatter
from generate_scalar_formatter_numeric_reference import num, ncode, moon

ROOT = Path(__file__).resolve().parents[1]


def source_keys():
    p, n = 2**61 - 1, 2**120
    huge = 10**400 // p * p
    return [n + m*p for m in range(-8, 9)] + [
        np.float64(n), float(n), np.float64(-n),
        False, True, np.bool_(False), np.bool_(True),
        np.int64(-2**63), np.int64(2**63-1), np.int64(-1),
        np.int64(0), np.int64(1), np.float64(0.0), np.float64(0.1),
        np.float64(1.0), np.float64(math.nan), np.float64(math.nan),
        float('nan'), math.inf, -math.inf, huge+1, huge+314159,
        -huge-1, -1, -2, 0.1, 3, 6, -3,
    ]


def lookup(table, key):
    try:
        return dict(value=table.get(key), error=None)
    except Exception as error:
        return dict(value=None, error=type(error).__name__ + ': ' + str(error))


def collect(path):
    ns = load_eng_formatter(path)
    cases = []
    # Native NaN hashes depend on process addresses. Isolated identity tests
    # are in the parameter reference; do not freeze mixed collision traces.
    portable_indices = [i for i in range(len(source_keys())) if i not in (32, 33, 34)]
    fixed = [
        [('set', 8), ('set', 9), ('remove', 8), ('set', 7), ('get', 17), ('copy', 0), ('get', 17)],
        [('set', i) for i in range(17)] + [('get', 17), ('copy', 0), ('get', 17)],
        [('set', i) for i in range(17)] + [('remove', i) for i in range(0, 17, 2)]
        + [('set', 5), ('copy', 0), ('get', 17)],
    ]
    for case_id in range(99):
        keys = source_keys()
        table, steps = {}, []
        rng = random.Random(32171023 + case_id)
        operations = fixed[case_id] if case_id < len(fixed) else [
            (rng.choices(['set', 'remove', 'get', 'copy'], [5, 2, 2, 1])[0],
             rng.choice(portable_indices)) for _ in range(64)]
        for step_id, (op, index) in enumerate(operations):
            value = str(step_id % 7)
            result, error = None, None
            try:
                if op == 'set':
                    table[keys[index]] = value
                elif op == 'remove':
                    marker = object()
                    result = table.pop(keys[index], marker) is not marker
                elif op == 'get':
                    result = table.get(keys[index])
                else:
                    table = table.copy()
            except Exception as exc:
                error = type(exc).__name__ + ': ' + str(exc)
            retained = [next(i for i, candidate in enumerate(keys) if candidate is key)
                        for key in table]
            probe_index = rng.choice(portable_indices)
            steps.append(dict(op=op, key=index, input_value=value, result=result,
                              error=error, retained_keys=retained,
                              retained_values=list(table.values()),
                              probes=[dict(key=i, **lookup(table, keys[i]))
                                      for i in (index, probe_index)]))
        cases.append(dict(id=case_id, keys=[num(key) for key in keys], steps=steps))
    return dict(source_hashes=ns['source_hashes'], python=sys.version.split()[0],
                numpy=np.__version__, scope=__doc__, cases=cases,
                source_step_count=sum(len(case['steps']) for case in cases),
                registered_test_count=(len(cases)+31)//32,
                host_boundary='NaN process-address hashes: isolated identity/copy observations are in params; mixed collision traces omit NaN insertion/queries rather than freezing address-dependent results')


def lookup_code(probe):
    expected = 'Some(' + moon(probe['value']) + ')' if probe['value'] is not None else 'None'
    return ('  eng_trace_lookup(table, keys[' + str(probe['key']) + '], '
            + expected + ', ' + ('Some(' + moon(probe['error']) + ')' if probe['error'] else 'None') + ')\n')


def generate(payload):
    code = '''// Builtin CPython dictionary operation traces; no port algorithm oracle.

///|
fn eng_trace_keys(table : @ticker.EngPrefixes, all : Array[@ticker.EngPrefixKey], expected : Array[Int]) -> Unit raise {
  let retained = table.keys()
  assert_eq(retained.length(), expected.length())
  for index, key in retained { assert_true(physical_equal(key, all[expected[index]])) }
}

///|
fn eng_trace_lookup(table : @ticker.EngPrefixes, key : @ticker.EngPrefixKey, expected : String?, expected_error : String?) -> Unit raise {
  let (actual, error) = try { (table.get_key(key), None) } catch {
    @core.DataError::InvalidTicks(message~) => (None, Some(message))
    _ => (None, Some("unexpected error"))
  }
  assert_eq(error, expected_error)
  assert_eq(actual, expected)
}
'''
    common_keys = payload['cases'][0]['keys']
    assert all(case['keys'] == common_keys for case in payload['cases'])
    code += '\n///|\nfn eng_trace_new_keys() -> Array[@ticker.EngPrefixKey] {\n'
    code += '  [\n' + ''.join('    @ticker.EngPrefixKey::new(' + ncode(key).replace('ScalarNumber::', '@ticker.ScalarNumber::') + '),\n' for key in common_keys) + '  ]\n}\n'
    for case in payload['cases']:
        code += '\n///|\nfn eng_trace_case_' + str(case['id']) + '() -> Unit raise {\n'
        code += '  let keys = eng_trace_new_keys()\n'
        code += '  let mut table = @ticker.EngPrefixes::new()\n'
        for step in case['steps']:
            code += '  {\n'
            key = 'keys[' + str(step['key']) + ']'
            if step['op'] == 'copy':
                code += '  table = table.copy()\n'
            else:
                expression = {'set': 'table.set_key(' + key + ', ' + moon(step['input_value']) + ')',
                              'remove': 'table.remove_key(' + key + ')',
                              'get': 'table.get_key(' + key + ')'}[step['op']]
                if step['error']:
                    code += '  let error = try { ignore(' + expression + '); "unexpected success" } catch { @core.DataError::InvalidTicks(message~) => message; _ => "unexpected error" }\n'
                    code += '  assert_eq(error, ' + moon(step['error']) + ')\n'
                elif step['op'] == 'set':
                    code += '  ' + expression + '\n'
                elif step['op'] == 'remove':
                    code += '  assert_eq(' + expression + ', ' + moon(step['result']) + ')\n'
                else:
                    expected = 'None' if step['result'] is None else 'Some(' + moon(step['result']) + ')'
                    code += '  assert_eq(' + expression + ', ' + expected + ')\n'
            code += '  eng_trace_keys(table, keys, ' + str(step['retained_keys']) + ')\n'
            code += ''.join(lookup_code(probe) for probe in step['probes'])
            code += '  }\n'
        code += '}\n'
    for start in range(0, len(payload['cases']), 32):
        code += '\n///|\ntest "engineering dictionary source traces ' + str(start) + '" {\n'
        for case in payload['cases'][start:start+32]:
            code += '  eng_trace_case_' + str(case['id']) + '() catch { error => fail("engineering dictionary case " + ' + '(' + str(case['id']) + ').to_string() + ": " + error.to_string()) }\n'
        code += '}\n'
    return code


def main():
    import subprocess
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('ticker', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    payload = collect(args.ticker)
    code = subprocess.run(['moonfmt', '-'], input=generate(payload), text=True,
                          stdout=subprocess.PIPE, check=True).stdout
    outputs = {'testdata/eng_prefix_trace_reference.json': json.dumps(payload, ensure_ascii=False, indent=2) + '\n',
               'ticker/eng_prefix_trace_reference_test.mbt': code}
    for name, content in outputs.items():
        target = ROOT/name
        if args.check:
            if target.read_text() != content:
                raise SystemExit('engineering dictionary trace differs: ' + name)
        else:
            target.write_text(content)
    print('engineering dictionary traces:', len(payload['cases']), 'cases,',
          payload['source_step_count'], 'steps,', payload['registered_test_count'], 'registered tests')


if __name__ == '__main__':
    main()
