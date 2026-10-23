"""Native CPython float(str) evidence for the LogFormatter base converter.

The oracle is the builtin constructor, never the MoonBit parser or a copied
decimal conversion algorithm. Inputs are Unicode scalar strings; lone Python
surrogates have no MoonBit String representation and are outside this bridge.
"""
import argparse
import collections
import decimal
import json
import math
import random
import struct
import subprocess
import sys
import unicodedata
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def moon(value):
    result = '"'
    for char in value:
        if char in ('"', '\\'):
            result += '\\' + char
        elif not char.isprintable():
            result += '\\u{' + format(ord(char), 'x') + '}'
        else:
            result += char
    return result + '"'


def collect():
    if sys.version_info[:3] != (3, 12, 14) or unicodedata.unidata_version != '15.0.0':
        raise SystemExit('Use the fixed CPython 3.12.14 / Unicode 15.0 runtime')
    inputs = []
    def add(category, text):
        inputs.append((category, text))
    for text in ['', '+', '-', '.', '+.', '-.', '0', '-0', '+0', '1.', '.1', '1.e2',
                 '1_0.2_5e+0_1', '00_00.00_01', 'NaN', 'nan', '-NaN', '+nAn',
                 'INF', '-Infinity', '+inFinIty', 'nan(1)', 'i_nf', '_1', '1_',
                 '1__0', '1_.0', '1._0', '1e_2', '1_e2', '1e+_2', '1 e2',
                 '0x1p2', '0x10', '1,2', '1\x00', '\x001', '−1', '１．２',
                 "a'b", 'a"b', "a'\"b", '\\', '\n1\t', '1\u200b', '\ufeff1']:
        add('grammar', text)
    decimal_count = 0
    for code in range(sys.maxunicode + 1):
        char = chr(code)
        if unicodedata.category(char) == 'Nd':
            decimal_count += 1
            add('unicode_decimal', char + '.5')
            add('unicode_decimal_exponent', '1e+' + char)
    for code in list(range(256)) + [0x1680, *range(0x2000, 0x200c), 0x2028, 0x2029,
                                   0x202f, 0x205f, 0x2060, 0x3000, 0xfeff]:
        char = chr(code)
        if char.isspace() or code in (0, 0x200b, 0x2060, 0xfeff):
            add('outer_whitespace', char + '-1.25' + char)
            add('internal_whitespace', '1' + char + '2')
    for exponent in [-100000, -5000, -1075, -400, -325, -324, -323, -309, -308,
                     -1, 0, 1, 307, 308, 309, 400, 5000, 100000]:
        for mantissa in ['0', '-0', '1', '-1', '1.7976931348623157', '4.9406564584124654']:
            add('range', mantissa + 'e' + str(exponent))
    rng = random.Random(331023)
    for _ in range(360):
        digits = ''.join(str(rng.randrange(10)) for _ in range(rng.randrange(1, 90)))
        point = rng.randrange(len(digits) + 1)
        add('random_decimal', rng.choice(['', '+', '-']) + digits[:point] + '.' +
            digits[point:] + rng.choice(['e', 'E']) + str(rng.randrange(-420, 420)))
    patterns = [0, 1, 2, 0x000fffffffffffff, 0x0010000000000000,
                0x3fefffffffffffff, 0x3ff0000000000000, 0x3ff0000000000001,
                0x7feffffffffffffe]
    patterns += [rng.randrange(0x7fefffffffffffff) for _ in range(24)]
    with decimal.localcontext() as ctx:
        ctx.prec = 2200
        for bits in patterns:
            lower = struct.unpack('>d', struct.pack('>Q', bits))[0]
            upper = math.nextafter(lower, math.inf)
            midpoint = (decimal.Decimal.from_float(lower) + decimal.Decimal.from_float(upper)) / 2
            for offset in [decimal.Decimal(0), decimal.Decimal('1e-1200'), -decimal.Decimal('1e-1200')]:
                text = str(midpoint + offset)
                add('exact_midpoint_neighborhood', text)
                add('exact_midpoint_neighborhood', '-' + text)
    for text in ['9' * 5000, '-' + '9' * 5000, '0' * 5000 + '1.25',
                 '0.' + '0' * 5000 + '1e5000', '1' + '0' * 5000 + 'e-5000',
                 '-0.' + '0' * 5000 + '1e5000', '0e' + '9' * 5000,
                 '-0e-' + '9' * 5000, '1e-' + '9' * 5000,
                 '1e' + '9' * 5000, 'a' * 1000, '😀' * 500, '\x00' * 500,
                 "a'\"\\\n" * 100]:
        add('long_input', text)
    cases = []
    for category, text in inputs:
        try:
            result = float(text)
            bits = struct.unpack('>Q', struct.pack('>d', result))[0]
            error = None
        except Exception as exc:
            bits = None
            error = type(exc).__name__ + ': ' + str(exc)
        cases.append(dict(id=len(cases), category=category, input=text, bits=bits, error=error))
    return dict(runtime=dict(python=sys.version.split()[0], unicode=unicodedata.unidata_version),
                oracle=__doc__, unicode_decimal_count=decimal_count, cases=cases,
                registered_test_count=(len(cases)+31)//32,
                category_counts=dict(collections.Counter(c['category'] for c in cases)))


def generate(payload):
    code = '''// Native CPython float(str); every expected result comes from the builtin.

///|
fn verify_log_float_text(id : Int, text : String, bits : UInt64?, expected_error : String?) -> Unit raise {
  let (actual, error) = try { (Some(log_text_float(text).reinterpret_as_uint64()), None) } catch {
    @core.DataError::InvalidTicks(message~) => (None, Some(message))
    _ => (None, Some("unexpected error"))
  }
  if actual != bits || error != expected_error {
    fail("float text case " + id.to_string() + ": unexpected result or error")
  }
}
'''
    for first in range(0, len(payload['cases']), 32):
        code += '\n///|\ntest "native log base float text group ' + str(first//32) + '" {\n'
        for row in payload['cases'][first:first+32]:
            bits = 'None' if row['bits'] is None else 'Some(' + str(row['bits']) + 'UL)'
            error = 'None' if row['error'] is None else 'Some(' + moon(row['error']) + ')'
            code += '  verify_log_float_text(' + str(row['id']) + ', ' + moon(row['input']) + ', ' + bits + ', ' + error + ')\n'
        code += '}\n'
    # Formatting is not a parser or type-check acceptance gate.
    return subprocess.run(['moonfmt', '-'], input=code, text=True, capture_output=True, check=True).stdout


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    payload = collect()
    outputs = {ROOT/'testdata/log_float_text_reference.json': json.dumps(payload, ensure_ascii=False, indent=2) + '\n',
               ROOT/'ticker/log_float_text_reference_wbtest.mbt': generate(payload)}
    for path, content in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != content:
                raise SystemExit('reference differs: ' + str(path))
        else:
            path.write_text(content)
    print('float text:', len(payload['cases']), 'native cases;', payload['registered_test_count'],
          'registered groups;', dict(collections.Counter('error' if c['error'] else 'success' for c in payload['cases'])))


if __name__ == '__main__':
    main()
