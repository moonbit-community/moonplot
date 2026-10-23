"""Builtin CPython set traces for LogitFormatter's shared numeric label set.

Finite traces retain actual physical iteration order. NaN hashes derived from
native object addresses are recorded as a separate host profile: portable NaN
keys use actual float/np.float64 subclasses overriding only hash to zero.
"""
import argparse
import hashlib
import json
import math
import random
import sys
from pathlib import Path

import numpy as np

from generate_auto_date_reference import formatted
from generate_eng_prefix_trace_reference import source_keys as engineering_keys
from generate_scalar_formatter_numeric_reference import moon, num, ncode

ROOT = Path(__file__).resolve().parents[1]
SET_SHA = 'e633e7ae4e427ecead8879965910e27427d34ae0fc5b956142bc337f741a367c'


def source_keys():
    # Preserve the accepted engineering-key corpus and add explicit hash-zero
    # overflow queries. Equal numeric hashes gate the rich comparison itself.
    q = (2**61-1) * 10**400
    return engineering_keys() + [q, q+1, 0.0, np.float64(0), np.bool_(False)]


class PortableNaN(float):
    def __hash__(self):
        return 0


class PortableNumpyNaN(np.float64):
    def __hash__(self):
        return 0


def is_nan(value):
    return isinstance(value, (float, np.floating)) and math.isnan(value)


def make_keys(portable):
    keys = source_keys()
    if portable:
        keys = [PortableNumpyNaN(v) if isinstance(v, np.float64) and is_nan(v)
                else PortableNaN(v) if is_nan(v) else v for v in keys]
    return keys


def capacity(table):
    # set.__sizeof__ is the actual C method. A non-small table is additional
    # allocation beyond sizeof(PySetObject), with a pointer+Py_hash_t per slot.
    extra = table.__sizeof__() - set().__sizeof__()
    return extra // 16 if extra else 8


def observe(operations, portable, ordered):
    keys, table, steps = make_keys(portable), set(), []
    for op, index in operations:
        result = error = None
        try:
            if op == 0:
                table.add(keys[index])
            elif op == 1:
                result = keys[index] in table
            else:
                table.clear()
        except Exception as exc:
            error = type(exc).__name__ + ': ' + str(exc)
        retained = [next(i for i, key in enumerate(keys) if key is item) for item in table]
        steps.append(dict(op=op, key=index, result=result, error=error,
                          retained_keys=retained if ordered else sorted(retained),
                          table_size=capacity(table)))
    return steps


def collect():
    assert sys.version_info[:3] == (3, 12, 14)
    assert np.__version__ == '2.3.5'
    assert sys.maxsize == 2**63-1
    source_sha = hashlib.sha256((ROOT/'.moonagent/upstream/cpython-v3.12.14/Objects/setobject.c').read_bytes()).hexdigest()
    assert source_sha == SET_SHA, 'fixed CPython set source differs'
    keys = source_keys()
    q = len(engineering_keys())
    finite = [i for i, key in enumerate(engineering_keys()) if not is_nan(key)]
    nan = [i for i, key in enumerate(keys) if is_nan(key)]
    cases = []
    for case_id in range(100):
        rng = random.Random(341023 + case_id)
        operations = ([(0, i) for i in finite] + [(1, i) for i in finite]
                      if case_id < 4 else
                      [(rng.choices([0, 1, 2], [6, 5, 1])[0], rng.choice(finite))
                       for _ in range(64)])
        if case_id < 4:
            rng.shuffle(operations)
        cases.append(dict(id=case_id, profile='finite native', operations=operations,
                          steps=observe(operations, False, True)))
    for nan_index in nan:
        operations = [(0, nan_index), (1, nan_index)] + [(1, other) for other in nan]
        operations += [(1, q), (1, q+1), (0, 35), (0, 36), (1, 35), (1, 36), (2, 0), (1, nan_index)]
        cases.append(dict(id=len(cases), profile='portable NaN hash zero', operations=operations,
                          steps=observe(operations, True, True),
                          native_host_steps_unordered=observe(operations, False, False)))
    for nan_index in nan:
        operations = [(0, q), (1, nan_index)]
        cases.append(dict(id=len(cases), profile='portable NaN reverse hash gate', operations=operations,
                          steps=observe(operations, True, True),
                          native_host_steps_unordered=observe(operations, False, False)))
    for zero in (q+2, q+3, q+4):
        operations = [(0, zero), (1, q), (1, q+1), (0, q), (1, q)]
        cases.append(dict(id=len(cases), profile='native hash-gated conversion', operations=operations,
                          steps=observe(operations, False, True)))
    large = set()
    for value in range(80000):
        large.add(value)
    checksum = 14695981039346656037
    for value in large:
        checksum = ((checksum ^ value) * 1099511628211) % 2**64
    return dict(runtime=dict(python=sys.version.split()[0], numpy=np.__version__, bits=64),
                source_sha256=source_sha,
                oracle=__doc__, keys=[num(key) for key in keys],
                key_aliases=[[index, next(i for i, other in enumerate(keys[:index]) if key is other)]
                             for index, key in enumerate(keys) if any(key is other for other in keys[:index])],
                cases=cases,
                registered_groups=(len(cases)+31)//32, operation_steps=sum(len(c['steps']) for c in cases),
                large_growth=dict(count=len(large), capacity=capacity(large), ordered_checksum=checksum))


def emit(payload):
    code = '''// Actual builtin set operations; not a port-model oracle.

///|
fn verify_logit_set_step(table : LogitLabelled, keys : Array[LogitKey], op : Int, key : Int, expected : Bool?, expected_error : String?, retained : Array[Int], size : Int) -> Unit raise {
  let (actual, error) = try {
    let result = if op == 0 { table.add(keys[key]); None }
      else if op == 1 { Some(table.contains(keys[key])) }
      else { table.clear(); None }
    (result, None)
  } catch {
    @core.DataError::InvalidTicks(message~) => (None, Some(message))
    _ => (None, Some("unexpected error"))
  }
  assert_eq(actual, expected)
  assert_eq(error, expected_error)
  assert_eq(table.table.length(), size)
  let values = table.keys()
  assert_eq(values.length(), retained.length())
  for index, value in values { assert_true(physical_equal(value, keys[retained[index]])) }
}

///|
fn logit_set_reference_keys() -> Array[LogitKey] {
  let keys : Array[LogitKey] = []
'''
    aliases = dict(payload['key_aliases'])
    for index, key in enumerate(payload['keys']):
        code += ('  keys.push(keys[' + str(aliases[index]) + '])\n' if index in aliases else
                 '  keys.push(LogitKey::new(' + ncode(key) + '))\n')
    code += '  keys\n}\n'
    for row in payload['cases']:
        code += '\n///|\nfn logit_set_reference_case_' + str(row['id']) + '() -> Unit raise {\n  let table = LogitLabelled::new()\n  let keys = logit_set_reference_keys()\n'
        for step in row['steps']:
            expected = 'None' if step['result'] is None else 'Some(' + str(step['result']).lower() + ')'
            error = 'None' if step['error'] is None else 'Some(' + moon(step['error']) + ')'
            code += '  verify_logit_set_step(table, keys, ' + str(step['op']) + ', ' + str(step['key']) + ', ' + expected + ', ' + error + ', ' + str(step['retained_keys']) + ', ' + str(step['table_size']) + ')\n'
        code += '}\n'
    for first in range(0, len(payload['cases']), 32):
        code += '\n///|\ntest "logit builtin set reference group ' + str(first//32) + '" {\n'
        code += ''.join('  logit_set_reference_case_' + str(i) + '()\n' for i in range(first, min(first+32,len(payload['cases'])))) + '}\n'
    large = payload['large_growth']
    code += '\n///|\ntest "logit numeric set retains native growth beyond 50000" {\n  let table = LogitLabelled::new()\n  for index in 0..<' + str(large['count']) + ' { table.add(LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_int(index)))) }\n'
    code += '  assert_eq(table.used, ' + str(large['count']) + ')\n  assert_eq(table.table.length(), ' + str(large['capacity']) + ')\n  let mut checksum = 14695981039346656037UL\n  for key in table.keys() { checksum = (checksum ^ scalar_numeric_integer(key.value()).to_uint64()) * 1099511628211UL }\n'
    code += '  assert_eq(checksum, ' + str(large['ordered_checksum']) + 'UL)\n  table.clear()\n  assert_eq(table.used, 0)\n  assert_eq(table.table.length(), 8)\n}\n'
    return formatted(code)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    payload = collect()
    for path, content in [(ROOT/'testdata/logit_set_reference.json', json.dumps(payload, indent=2, allow_nan=False)+'\n'),
                          (ROOT/'ticker/logit_set_reference_wbtest.mbt', emit(payload))]:
        if args.check:
            if path.read_text() != content:
                raise SystemExit('reference differs: ' + str(path))
        else:
            path.write_text(content)
    print('logit builtin set:', len(payload['cases']), 'traces;', payload['operation_steps'], 'steps;', payload['registered_groups'], 'groups + 1 large growth test')


if __name__ == '__main__':
    main()
