"""Complete pinned StrMethodFormatter + actual string.Formatter reference.

All parity results come from the original AST and real CPython/NumPy formatting.
Unsupported reflection/surrogate and allocation boundaries are distinct records.
"""
from pathlib import Path
import argparse
import hashlib
import itertools
import json
import locale
import math
import re
import struct
import sys

import numpy as np

from formatter_reference_source import load_string_formatters
from generate_auto_date_reference import formatted, moon

ROOT = Path(__file__).resolve().parents[1]
DECIMAL_ZEROS = [
    0x30, 0x660, 0x6F0, 0x7C0, 0x966, 0x9E6, 0xA66, 0xAE6, 0xB66, 0xBE6,
    0xC66, 0xCE6, 0xD66, 0xDE6, 0xE50, 0xED0, 0xF20, 0x1040, 0x1090, 0x17E0,
    0x1810, 0x1946, 0x19D0, 0x1A80, 0x1A90, 0x1B50, 0x1BB0, 0x1C40, 0x1C50,
    0xA620, 0xA8D0, 0xA900, 0xA9D0, 0xA9F0, 0xAA50, 0xABF0, 0xFF10, 0x104A0,
    0x10D30, 0x11066, 0x110F0, 0x11136, 0x111D0, 0x112F0, 0x11450, 0x114D0,
    0x11650, 0x116C0, 0x11730, 0x118E0, 0x11950, 0x11C50, 0x11D50, 0x11DA0,
    0x11F50, 0x16A60, 0x16AC0, 0x16B50, 0x1D7CE, 0x1D7D8, 0x1D7E2, 0x1D7EC,
    0x1D7F6, 0x1E140, 0x1E2F0, 0x1E4F0, 0x1E950, 0x1FBF0,
]


def scalar(kind, value):
    return float(value) if kind == 'python' else np.float64(value) if kind == 'float64' else np.int64(value)


def scalar_record(kind, value):
    if kind == 'int64':
        return dict(kind=kind, integer=str(int(value)))
    return dict(kind=kind, repr=repr(float(value)), hex=float(value).hex(),
                bits=struct.pack('>d', float(value)).hex())


def source_result(action):
    try:
        return dict(value=action(), error=None)
    except (ValueError, TypeError, IndexError, KeyError, OverflowError, AttributeError) as exc:
        return dict(value=None, error=type(exc).__name__, message=str(exc))


def query_code(fmt, kind, value, pos):
    constructor = '@ticker.StrMethodFormatter::new(' + moon(fmt) + ')'
    if kind == 'python':
        return constructor + '.call(' + moon(float(value)) + (', pos=' + str(pos) if pos is not None else '') + ')'
    view = ('@ticker.TickValues::from_array([' + moon(float(value)) + '])' if kind == 'float64' else
            '@ticker.TickValues::from_int64_array([' + str(int(value)) + 'L])')
    return constructor + '.format_ticks_view(' + view + ')[0]'


def assert_query(query, observed):
    if observed['error']:
        return ('  let result = try { ignore(' + query + '); "unexpected success" } catch { '
                '@core.DataError::InvalidTicks(message~) => message; _ => "unexpected error" }\n'
                '  assert_eq(result, ' + moon(observed['error'] + ': ' + observed['message']) + ')\n')
    return '  assert_eq(' + query + ', ' + moon(observed['value']) + ')\n'


def generate(path):
    ns = load_string_formatters(path)
    locale.setlocale(locale.LC_NUMERIC, 'C')
    cases, boundaries, batches = [], [], []
    code = '// Generated from complete original StrMethodFormatter, string.Formatter and real builtin formatting.\n'
    seen = set()

    def add(group, fmt, value=-1234.5678, pos=3, kind='python', unicode=True):
        nonlocal code
        if kind != 'python':
            pos = 0  # Original enumerate() of the one-element ndarray, not a fake direct carrier.
        marker = (fmt, kind, str(int(value)) if kind == 'int64' else struct.pack('>d', float(value)).hex(), pos, unicode)
        if marker in seen:
            return
        seen.add(marker)
        ns['mpl'].rcParams['axes.unicode_minus'] = unicode
        formatter = ns['StrMethodFormatter'](fmt)
        values = np.array([value], dtype=kind) if kind != 'python' else None
        observed = source_result(lambda: formatter(scalar(kind, value), pos) if values is None else formatter.format_ticks(values)[0])
        index = len(cases)
        row = dict(index=index, group=group, fmt=fmt, value=scalar_record(kind, value), pos=pos,
                   unicode_minus=unicode, observation=observed)
        if values is not None:
            row['locs_is_input'] = formatter.locs is values
            assert row['locs_is_input']
        cases.append(row)
        code += '\n///|\ntest ' + moon('StrMethod original ' + str(index) + ' ' + group) + ' {\n'
        code += '  let saved = @config.unicode_minus()\n  defer { @config.set_unicode_minus(saved) }\n  @config.set_unicode_minus(' + str(unicode).lower() + ')\n'
        code += assert_query(query_code(fmt, kind, value, pos), observed)
        code += '}\n'

    numeric_specs = [
        '', '<14.2f', '>14.2f', '^14.2f', '=14.2f', '*<14.2f', '*>14.2f', '*^14.2f', '*=14.2f',
        '−>14.2f', '🐍^14.2f', '0>14.2f', '014.2f', '<014.2f', '>014.2f', '^014.2f', '=014.2f',
        '+.2f', ' .2f', '-.2f', 'z.2f', '+z.2f', '#.0f', '#.0e', '#.5g', ',.2f', '_.2f',
        '0=+16,.2f', '0=+16_.2f', ',', '.3e', '.3E', '.3f', '.3F', '.3g', '.3G', 'n', '.4n',
        '.2%', '020.2%', '%', 's', 'b', 'c', 'd', 'o', 'x', 'X', 'a', 'q', 'N', 'D', 'P',
        '.f', '..2f', '+-f', ',_.2f', ',n', '_n', 'z', 'zz.2f', '(f', '10.2ff', 'z.2d', 'z.2q',
        '+.2c', '+#c', '+,.2s', '=+,d', '+z#=4s', ',q', '_q', ',d', '_d', ',x', '_x', ',.2c',
        'z,.2d', '+z.2c', ',.2s', '+s', '+.2s', '=+s', '#+s', 'z=s', '10.٢f', '٣.٢f', '１２.２f',
        '².2f', '1_2.2f', '.2147483648f', '1000000000000000000000000000f',
        '.1000000000000000000000000000f',
    ]
    for spec in numeric_specs:
        add('float mini language', '{x:' + spec + '}')
    for align, fill, sign, grouping in itertools.product('<>^=', [' ', '0', '*', '🐍'], ['', '+', ' '], ['', ',', '_']):
        add('alignment sign zero grouping', '{x:' + fill + align + sign + '018' + grouping + '.2f}')
    for value in [-0., -0.00001, 0., 1., 2.675, 1.005, 2.5, 3.5, 1e-5, 1e-4, 1e15, 1e16,
                  1.2345678901234567, math.inf, -math.inf, math.nan, -math.nan, 1e308,
                  sys.float_info.max, math.ulp(0.), sys.float_info.min]:
        for spec in ['', '.0', '.1', '.2', '.3', 'g', '.0g', '.1g', 'n', 'G', 'e', 'E', 'f', 'F',
                     '%', '+z.0f', 'z.1f', '#.0f', '#.0e', '#.0g', ',.2f']:
            add('binary64 rounding zero extremes', '{x:' + spec + '}', value)
    for spec in ['.101f', '.150g', '1001.2f', '-^1001.2f', '.1100f', '.1100e', '#.1100g']:
        add('valid beyond legacy width precision', '{x:' + spec + '}', 1.25)
    position_specs = ['d', 'b', 'c', 'o', 'x', 'X', 'n', ',d', '_d', '08d', '+08d', 'z', 'z.2f',
                      '.2f', 'e', '%', 's', '10', '>10', '0=10', '.2', '+#c', '#c', 'z.2d', ',.2c']
    for pos in [None, -2147483648, -3, 0, 3, 45, 128512, 1114112, 2147483647]:
        for spec in position_specs:
            add('optional exact int position', '{pos:' + spec + '}', pos=pos)
    for conversion in ['', '!s', '!r', '!a']:
        for spec in ['', '.3', '.3s', '010', '>010', '=10', '+10', 'z', '#', ',', '10.2s', '🐍^10',
                     's', 'e', 'c', '-^12', '->12', '.101s']:
            add('converted strings and None', '{x' + conversion + ':' + spec + '}', -12.5)
            add('converted strings and None', '{pos' + conversion + ':' + spec + '}', -12.5, None)
    grammar = ['', 'literal {{x}} {{pos}} {{{x}}}', '{{{x}}}', '{{{{x}}}}', '{}', '{0}', '{1}',
               '{value}', '{missing}', '{X}', '{x!q}', '{x!}', '{x!ss}', '{x!r!s}', '{x', 'x}',
               '{{', '}}', '{', '}', '{x}}', '{{x}', '{x:', '{x:{pos}', '{x[0]}', '{x[-1]}',
               '{pos[0]}', '{x.}', '{x[]}', '{x..real}', '{x.real[0]}', '{x.__class__.__name__[99]}',
               '{x.__class__.__name__[real]}', '{x.__class__.__name__[-1]}', '{x.__class__.__name__[١]}',
               '{١}', '{²}', '{x:{{<10.2f}', '{x:}}>10.2f}', '{x:{{^10.2f}', '{x!}', '{x!r',
               '{x!', '{x[}', '{x{}}', '{x!r blah}', '{x[0]foo}', '{x[0}', '{x.__class__.__name__[0]x}']
    for fmt in grammar:
        add('field parser and indexing', fmt, -1.2, None)
    nested = ['{x:{pos}.2f}', '{x:.{pos}f}', '{x:{pos}g}', '{x:{pos}>12.2f}', '{x:{pos}}', '{pos:{x}}',
              '{x:.{pos!s}f}', '{x:{pos:{pos}}}', '{x:{pos:{x}}}', '{x:{pos!r}}', '{x:{x:.0f}.2f}',
              '{x:{x:.1f}.2f}', '{x:{pos:02d}.1f}', '{x:{{}}}', '{x!s:{pos}}',
              '{missing} {x!q}', '{x!q} {missing}', '{x!q:{missing}}', '{x:{missing}}',
              '{x:bad}{missing}', '{missing}{x:bad}', '{x!s:.{pos}f}', '{x:{pos!q}}', '{x:{pos:{missing}}}',
              '{x:{pos!r}>10.2f}', '{x:{pos:c}^12.2f}']
    for fmt, pos, unicode in itertools.product(nested, [None, 3, -8, 45], [False, True]):
        add('nested recursive order unicode', fmt, 8., pos, unicode=unicode)
    attributes = ['x.real', 'x.imag', 'x.__class__', 'x.__class__.__name__', 'x.__class__.__name__[0]',
                  'pos.real', 'pos.imag', 'pos.numerator', 'pos.denominator', 'pos.__class__',
                  'pos.__class__.__name__', 'pos.__class__.__name__[0]']
    for attr, pos, conv in itertools.product(attributes, [None, -3, 45], ['', '!s', '!r', '!a']):
        # Numeric attributes on None are excluded reflection, not a fabricated source AttributeError.
        if pos is None and attr in ['pos.real', 'pos.imag', 'pos.numerator', 'pos.denominator']:
            continue
        add('stable scalar attribute chains', '{' + attr + conv + '}', -1.25, pos)
    for value in [-1.25, -0., math.nan, math.inf, -math.inf, 1e-5, 1., math.ulp(0.)]:
        for fmt in ['{x}', '{x!s}', '{x!r}', '{x!a}', '{x:d}', '{x!r:-^30}', '{x.real!r}',
                    '{x.imag!r}', '{x.__class__.__name__}', '{x:.2f}', '{x:+020,.2f}']:
            add('actual Float64 ndarray scalar', fmt, value, kind='float64')
    int_specs = ['', 'd', 'b', 'o', 'x', 'X', 'n', '#b', '#o', '#x', '#X', '_d', ',d', '_x',
                 '_b', '020,d', '+#024_x', '^#30_b', 'c', '.0f', '.2e', 'g', 'z', 'z.2f', '.2d']
    for value in [-9223372036854775808, -9007199254740993, -1, 0, 1, 9007199254740993, 9223372036854775807]:
        for spec in int_specs:
            add('exact Int64 ndarray numeric domain', '{x:' + spec + '}', value, kind='int64')
        for fmt in ['{x!s}', '{x!r}', '{x!a}', '{x.real!r}', '{x.imag!r}', '{x.numerator!r}',
                    '{x.denominator!r}', '{x.__class__.__name__[0]}']:
            add('exact Int64 ndarray conversion attributes', fmt, value, kind='int64')
    for zero in DECIMAL_ZEROS:
        add('Unicode15 Nd width precision', '{x:' + chr(zero + 8) + '.' + chr(zero + 2) + 'f}', 1.25)
        add('Unicode15 Nd string index', '{x.__class__.__name__[' + chr(zero + 1) + ']}', 1.25)
    for fmt in ['- literal {x} - {pos}', '{{-x}}:{x}', '{x!s:-^12}', '{x!r:-<12}', '{x!a:->12}',
                '{pos!s:-^12}', '{x:-^12.2f}', '{x:🐍^12.2f}', '{pos:c}']:
        for unicode in [False, True]:
            add('minus only in completed fields', fmt, -12., 45, unicode=unicode)

    for token in ['9' * 30 + 'x', '9' * 30 + '²', '1x', '1²']:
        add('native decimal-prefix overflow order', '{' + token + '}', 1.25)
        add('native decimal-prefix overflow order', '{x.__class__.__name__[' + token + ']}', 1.25)
    for character in ['\u0378', '\u1c89', '\U0001fae9']:
        add('fixed Python Unicode15 printable error repr', '{x:' + character + 'f}', 1.25)
    for fmt in ['{x:_x}', '{x:_X}']:
        add('hex letter grouping', fmt, 0xABCDEF, kind='int64')
    for character in ['\x00', '\n', '\t', 'é', '🐍', '\x1f', '\x7f']:
        for field in ['x', 'pos', 'x!s']:
            add('explicit type and native error code escapes', '{' + field + ':' + character + '}', 1.25)
        add('Int64 explicit type and native error escapes', '{x:' + character + '}', 3, kind='int64')
    for spec in [',é', ',\n', '_🐍', ',\x00', '_\x00']:
        for field in ['x', 'pos', 'x!s']:
            add('native grouping code error escapes', '{' + field + ':' + spec + '}', 1.25)
    for character in ['\u0378', '\u1c89', '\U0001fae9']:
        add('unknown field uses real Python repr', '{' + character + '}', 1.25)
    for field in ['x', 'pos', 'x!s']:
        add('invalid specification uses raw single quotes', '{' + field + ":'f}", 1.25)

    # Distinct boundary tests retain the actual original success/error, but never count as parity.
    for fmt, value, pos, kind, reason in [
        ('{x.foo}', 1., 3, 'python', "dynamic attribute 'foo' on float"),
        ('{x.__doc__}', 1., 3, 'python', "dynamic attribute '__doc__' on float"),
        ('{x.as_integer_ratio}', 1., 3, 'python', "dynamic attribute 'as_integer_ratio' on float"),
        ('{x.dtype}', 1., 0, 'float64', "dynamic attribute 'dtype' on float64"),
        ('{pos:c}', 1., 55296, 'python', 'unpaired surrogate output cannot be represented portably'),
        ('{pos:c}', 1., 57343, 'python', 'unpaired surrogate output cannot be represented portably'),
        ('{x:c}', 55296, 0, 'int64', 'unpaired surrogate output cannot be represented portably'),
    ]:
        ns['mpl'].rcParams['axes.unicode_minus'] = True
        observed = source_result(lambda: ns['StrMethodFormatter'](fmt)(scalar(kind, value), pos))
        if fmt == '{x.as_integer_ratio}' and observed['error'] is None:
            # This expressly excluded dynamic method repr carries a host address.
            # Preserve its source shape, while making the non-parity record reproducible.
            observed['value'] = re.sub(r'0x[0-9a-fA-F]+', '<host-address>', observed['value'])
            observed['host_address_normalized'] = True
        row = dict(fmt=fmt, value=scalar_record(kind, value), pos=pos, source=observed,
                   boundary='Unsupported: ' + reason)
        boundaries.append(row)
        code += '\n///|\ntest ' + moon('StrMethod explicit boundary ' + str(len(boundaries))) + ' {\n'
        code += '  let result = try { ignore(' + query_code(fmt, kind, value, pos) + '); "unexpected success" } catch { @core.DataError::InvalidTicks(message~) => message; _ => "unexpected error" }\n'
        code += '  assert_eq(result, ' + moon(row['boundary']) + ')\n}\n'

    for kind, values, spec in [('float64', [1., -0., 2.675, math.nan], [3, -1, 4]),
                               ('int64', [9007199254740993, -9223372036854775808, 0], [2, -1, 3]),
                               ('int64', [9007199254740993], [0, 0, 4])]:
        ns['mpl'].rcParams['axes.unicode_minus'] = True
        owner = np.array(values, dtype=kind)
        start, stride, length = spec
        selected = (np.lib.stride_tricks.as_strided(owner[start:], shape=(length,), strides=(0,), writeable=True) if stride == 0 else
                    owner[start:None if start + stride * length < 0 else start + stride * length:stride])
        formatter = ns['StrMethodFormatter']('{x!r}={pos}')
        observed = formatter.format_ticks(selected)
        row = dict(kind=kind, values=[scalar_record(kind, v) for v in values], view=spec,
                   labels=observed, locs_is_input=formatter.locs is selected)
        assert row['locs_is_input']
        batches.append(row)
        constructor = ('@ticker.TickValues::from_array(' + moon(values) + ')' if kind == 'float64' else
                       '@ticker.TickValues::from_int64_array([' + ','.join(str(v)+'L' for v in values) + '])')
        code += '\n///|\ntest ' + moon('StrMethod actual retained ndarray view ' + str(len(batches))) + ' {\n'
        code += '  let saved = @config.unicode_minus()\n  defer { @config.set_unicode_minus(saved) }\n  @config.set_unicode_minus(true)\n'
        code += '  let view = ' + constructor + '.view(' + ','.join(map(str, spec)) + ')\n'
        code += '  let formatter = @ticker.StrMethodFormatter::new("{x!r}={pos}")\n'
        code += '  assert_eq(formatter.format_ticks_view(view), ' + moon(observed) + ')\n'
        code += '  match formatter.locations() { NdArray(retained) => assert_true(physical_equal(view, retained)); _ => fail("missing view") }\n'
        code += '}\n'

    ns['mpl'].rcParams['axes.unicode_minus'] = True
    original_full = ns['StrMethodFormatter']('{x!r}={pos}')
    values = np.full(125001, 9007199254740993, dtype=np.int64)
    labels = original_full.format_ticks(values)
    samples = [[i, labels[i]] for i in [0, 99999, 100000, 125000]]
    batches.append(dict(kind='int64', length=len(values), labels_length=len(labels), samples=samples,
                        locs_is_input=original_full.locs is values))
    code += '\n///|\ntest "StrMethod actual full125001 Int64 transport" {\n'
    code += '  let saved = @config.unicode_minus()\n  defer { @config.set_unicode_minus(saved) }\n  @config.set_unicode_minus(true)\n'
    code += '  let values = @ticker.TickValues::from_int64_array(Array::make(125001, 9007199254740993L))\n'
    code += '  let formatter = @ticker.StrMethodFormatter::new("{x!r}={pos}")\n  let labels = formatter.format_ticks_view(values)\n'
    code += '  assert_eq(labels.length(), 125001)\n'
    code += '  assert_eq([' + ','.join('labels['+str(i)+']' for i,_ in samples) + '], ' + moon([v for _,v in samples]) + ')\n'
    code += '  assert_eq(formatter.locations().length(), 125001)\n}\n'
    data = dict(source_hashes=ns['source_hashes'], runtime=dict(python=sys.version.split()[0], numpy=np.__version__,
                locale=locale.setlocale(locale.LC_NUMERIC), profile='Darwin arm64 NumPy 2.3.5; direct/list PythonFloat, actual ndarray dtype preserved'),
                execution='Complete original StrMethodFormatter/_UnicodeMinusFormat/Formatter AST, original string.Formatter/native parser and builtin format; no replacement formatting algorithm',
                parity_cases=cases, explicit_boundaries=boundaries, full_original_batches=batches,
                allocation_boundaries=[dict(fmt='{x:2147483648f}', reason='Valid source allocation independently omitted; port String Int32 addressability checked separately; not a Python exception')],
                counts=dict(parity=len(cases), source_success=sum(c['observation']['error'] is None for c in cases),
                            source_errors=sum(c['observation']['error'] is not None for c in cases),
                            boundary=len(boundaries), batches=len(batches), generated=len(cases)+len(boundaries)+len(batches)))
    return json.dumps(data, ensure_ascii=True, indent=2) + '\n', formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('ticker', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    data, code = generate(args.ticker)
    outputs = [(ROOT/'testdata/strmethod_formatter_reference.json', data),
               (ROOT/'ticker/strmethod_formatter_reference_test.mbt', code)]
    if args.check:
        for path, expected in outputs:
            if not path.exists() or path.read_text() != expected:
                raise SystemExit('reference differs: ' + str(path))
    else:
        for path, text in outputs:
            path.write_text(text)
    print(json.loads(data)['counts'])


if __name__ == '__main__':
    main()
