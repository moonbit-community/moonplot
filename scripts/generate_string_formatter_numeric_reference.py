"""Independent original string-formatter numeric regression corpus.

The original named classes, real stdlib formatting and NumPy scalar methods
supply all expectations. No Moon numeric routine is used as an oracle.
"""
from pathlib import Path
import argparse
import json
import locale
import math
import random
import struct
import sys

import numpy as np

from formatter_reference_source import load_string_formatters
from generate_auto_date_reference import formatted, moon

ROOT = Path(__file__).resolve().parents[1]


def bits_of(number):
    return struct.unpack('>Q', struct.pack('>d', number))[0]


def from_bits(bits):
    return struct.unpack('>d', bits.to_bytes(8, 'big'))[0]


def literal(bits):
    return f'0x{bits:016x}UL.reinterpret_as_double()'


def generate(path):
    ns = load_string_formatters(path)
    ns['mpl'].rcParams['axes.unicode_minus'] = False
    locale.setlocale(locale.LC_NUMERIC, 'C')
    repr_formatter = ns['FormatStrFormatter']('%r')
    str_formatter = ns['FormatStrFormatter']('%s')
    rng = random.Random(2903112)
    samples = [0, 1, 2, (1 << 52) - 1, 1 << 52, 0x7fefffffffffffff,
               0x8000000000000000, 0x7ff0000000000000,
               0xfff0000000000000, 0x7ff8000000000000, 0xfff8000000000000]
    for exponent in sorted(set(range(-324, 309, 17)) | {-5, -4, -3, 14, 15, 16, 17, 22, 23}):
        value = float('1e' + str(exponent))
        if not math.isfinite(value):
            continue
        center = bits_of(value)
        for bits in range(max(0, center - 2), min(0x7ff0000000000000, center + 3)):
            samples += [bits, bits | (1 << 63)]
    samples += [rng.getrandbits(64) for _ in range(256)]
    samples = list(dict.fromkeys(samples))
    repr_rows = [dict(bits=f'{bits:016x}', expected=repr_formatter(from_bits(bits))) for bits in samples]
    code = '// Generated from original named formatters and actual Python/NumPy numeric formatting.\n'
    groups = 0
    for start in range(0, len(repr_rows), 32):
        groups += 1
        code += '\n///|\ntest "string numeric original shortest repr ' + str(start // 32) + '" {\n'
        code += '  let cases : Array[(Double, String)] = [\n'
        for row in repr_rows[start:start + 32]:
            code += '    (' + literal(int(row['bits'], 16)) + ', ' + moon(row['expected']) + '),\n'
        code += '  ]\n  for (value, expected) in cases { assert_eq(named_format_float_repr(value), expected) }\n}\n'

    edges = [0., -0., 1., -1., 2.5, 3.5, 2.675, 1.005, 12.34, 99.999,
             9.999999999999998, 0.0001, 1e-5, 1e15, 1e16, 1e308,
             from_bits(1), from_bits(0x0010000000000000), from_bits(0x7fefffffffffffff),
             math.inf, -math.inf, math.nan, from_bits(0xfff8000000000000)]
    edges += [from_bits(rng.getrandbits(64)) for _ in range(8)]
    precisions = [None, 0, 1, 2, 6, 17, 101]
    numeric_rows = []
    for presentation in ['', 'e', 'E', 'f', 'F', 'g', 'G', 'n', '%']:
        for precision in precisions:
            for alternate in [False, True]:
                spec = ('#' if alternate else '') + ('.' + str(precision) if precision is not None else '') + presentation
                formatter = ns['StrMethodFormatter']('{x:' + spec + '}')
                group = []
                for value in edges:
                    expected = formatter(value)
                    row = dict(bits=f'{bits_of(value):016x}', spec=spec, expected=expected,
                               code=presentation, precision=precision, alternate=alternate)
                    numeric_rows.append(row)
                    group.append(row)
                groups += 1
                label = 'string numeric original digits ' + repr(spec)
                code += '\n///|\ntest ' + moon(label) + ' {\n  let cases : Array[(Double, String)] = [\n'
                for row in group:
                    code += '    (' + literal(int(row['bits'], 16)) + ', ' + moon(row['expected']) + '),\n'
                char = "'\\u0000'" if not presentation else "'" + presentation + "'"
                option = 'None' if precision is None else 'Some(' + str(precision) + ')'
                code += '  ]\n  for (value, expected) in cases { assert_eq(named_format_float_digits(value, ' + char + ', ' + option + ', ' + str(alternate).lower() + '), expected) }\n}\n'

    large_rows = []
    for bits, presentation, precision, alternate in [
            (1, 'f', 1074, False), (1, 'e', 1075, False), (1, 'g', 1100, True),
            (0x7fefffffffffffff, 'f', 1200, False),
            (0x7fefffffffffffff, 'g', 1200, False), (1, 'g', 1200, False)]:
        spec = ('#' if alternate else '') + '.' + str(precision) + presentation
        expected = ns['StrMethodFormatter']('{x:' + spec + '}')(from_bits(bits))
        large_rows.append(dict(bits=f'{bits:016x}', spec=spec, expected=expected))
        groups += 1
        code += '\n///|\ntest ' + moon('string numeric original large precision ' + spec + ' ' + f'{bits:016x}') + ' {\n'
        code += '  assert_eq(named_format_float_digits(' + literal(bits) + ", '" + presentation + "', Some(" + str(precision) + '), ' + str(alternate).lower() + '), ' + moon(expected) + ')\n}\n'

    scalar_rows = []
    for origin in ['PythonFloat', 'NumpyFloat64', 'NumpyInt64']:
        groups += 1
        code += '\n///|\ntest ' + moon('string numeric original scalar origin ' + origin) + ' {\n'
        values = [-9223372036854775808, -1, 0, 1, 9007199254740993, 9223372036854775807] if origin == 'NumpyInt64' else edges
        for value in values:
            actual = np.int64(value) if origin == 'NumpyInt64' else np.float64(value) if origin == 'NumpyFloat64' else value
            expected_str, expected_repr = str_formatter(actual), repr_formatter(actual)
            scalar_rows.append(dict(origin=origin, value=str(value) if origin == 'NumpyInt64' else f'{bits_of(value):016x}', str=expected_str, repr=expected_repr))
            argument = str(value) + 'L' if origin == 'NumpyInt64' else literal(bits_of(value))
            expression = 'NamedFormatValue::' + origin + '(' + argument + ')'
            code += '  assert_eq(named_format_value_str(' + expression + '), ' + moon(expected_str) + ')\n'
            code += '  assert_eq(named_format_value_repr(' + expression + '), ' + moon(expected_repr) + ')\n'
        code += '}\n'

    selections = []
    owner = np.array([-9223372036854775808, 9007199254740993, 0, 9223372036854775807], dtype=np.int64)
    for start, stride, length, mask in [(0, 1, 4, [True, True, False, True]),
                                      (3, -1, 4, [True, False, True, True]),
                                      (1, 2, 2, [True, True]), (0, 1, 4, [False] * 4)]:
        source_view = owner[[start + i * stride for i in range(length)]]
        expected = source_view[np.array(mask, dtype=bool)].tolist()
        selections.append(dict(start=start, stride=stride, length=length, mask=mask, expected=expected))
        groups += 1
        code += '\n///|\ntest ' + moon('string numeric original Int64 mask ' + str(len(selections))) + ' {\n'
        code += '  let owner = [-9223372036854775808L, 9007199254740993L, 0L, 9223372036854775807L]\n'
        code += f'  let view = TickValues::from_int64_array(owner).view({start}, {stride}, {length})\n'
        mask_literal = '[' + ', '.join(str(v).lower() for v in mask) + ']'
        code += '  let selected = view.select_mask(' + mask_literal + ')\n'
        code += '  assert_true(selected.is_int64())\n  assert_eq(selected.length(), ' + str(len(expected)) + ')\n'
        for index, value in enumerate(expected):
            code += '  assert_eq(selected.get_int64(' + str(index) + '), ' + str(value) + 'L)\n'
        code += '  owner[0] = 2L\n'
        for index, value in enumerate(expected):
            code += '  assert_eq(selected.get_int64(' + str(index) + '), ' + str(value) + 'L)\n'
        code += '}\n'

    payload = dict(source_hashes=ns['source_hashes'], python=sys.version.split()[0], numpy=np.__version__,
                   numeric_locale='C', generated_test_count=groups,
                   assertion_count=len(repr_rows) + len(numeric_rows) + len(large_rows) + 2 * len(scalar_rows),
                   scope='Private shared ASCII float digit/repr kernel. Original complete named classes and real stdlib/NumPy operations; no port oracle. Repr corpus includes random bits, decimal-power neighbors, sign zero, extrema and subnormal values. Width/flags/grouping/errors/UnicodeMinus belong to separate engine and integration references.',
                   repr_cases=repr_rows, numeric_cases=numeric_rows,
                   large_precision_cases=large_rows, scalar_cases=scalar_rows,
                   dtype_selection_cases=selections)
    return json.dumps(payload, indent=2, allow_nan=False) + '\n', formatted(code)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('ticker', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    outputs = generate(args.ticker)
    for name, content in zip(['testdata/string_formatter_numeric_reference.json', 'ticker/string_formatter_numeric_reference_wbtest.mbt'], outputs):
        target = ROOT / name
        if args.check:
            if not target.exists() or target.read_text() != content:
                raise SystemExit('reference differs: ' + name)
        else:
            target.write_text(content)
    payload = json.loads(outputs[0])
    print('string numeric:', payload['assertion_count'], 'assertions in', payload['generated_test_count'], 'tests')


if __name__ == '__main__':
    main()
