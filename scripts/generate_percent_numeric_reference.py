"""Complete pinned PercentFormatter AST, actual scalar arithmetic and format.

The mathematical profile executes the same complete class with only log10
replaced by independently stable Decimal 180/320-digit rounding. Native NumPy
RuntimeWarnings are observations, not Matplotlib _api warnings or port errors.
No portable formatter/kernel is used as an oracle. Unsafe output allocations
are independent omissions, never inferred source exceptions.
"""
from pathlib import Path
import argparse
import ast
import collections
import decimal
import functools
import hashlib
import json
import math
import re
import struct
import sys
import unicodedata
import warnings

from formatter_reference_source import load_percent_formatter
from generate_auto_date_reference import formatted, moon as numeric_moon
from generate_multiple_locator_reference import clean

ROOT = Path(__file__).resolve().parents[1]


def moon(value):
    if isinstance(value, str):
        # JSON's real Unicode escapes need Moon's braced spelling. An even
        # backslash run instead contains literal text such as source repr's
        # "\\ufeff"; changing that text would manufacture a different error.
        def unicode_escape(match):
            slashes, digits = match.groups()
            return (slashes[:-1] + r'\u{' + digits + '}'
                    if len(slashes) % 2 else match.group())
        return re.sub(r'(\\+)u([0-9a-fA-F]{4})', unicode_escape,
                      json.dumps(value, ensure_ascii=False))
    if isinstance(value, list):
        return '[' + ', '.join(moon(item) for item in value) + ']'
    return numeric_moon(value)


def operand(kind, value=None, **kw):
    return dict(kind=kind, value=value, **kw)


def pyfloat(value):
    return operand('PythonFloat', value)


def number(value):
    return operand('Number', value)


def integer(value):
    return operand('Integer', str(value))


def decode(desc, np):
    kind, value = desc['kind'], desc.get('value')
    if kind == 'Automatic':
        return None
    if kind == 'Integer':
        return (-1 if desc.get('negative') else 1) * 10**desc['power10'] if 'power10' in desc else int(value)
    if kind == 'NumpyInt64':
        return np.int64(value)
    if kind == 'NumpyFloat64':
        return np.float64(value)
    return value


def bigint_code(desc):
    if 'power10' in desc:
        text = 'decimal_power(' + str(desc['power10']) + ')'
        return text + '.neg()' if desc.get('negative') else text
    return '@bigint.BigInt::from_string(' + moon(desc['value']) + ')'


def code_operand(desc, family):
    kind, value = desc['kind'], desc.get('value')
    if kind == 'Automatic':
        return 'PercentDecimals::Automatic'
    if kind == 'Integer':
        body = bigint_code(desc)
    elif kind == 'NumpyInt64':
        body = str(value) + 'L'
    else:
        body = moon(value)
    return family + '::' + kind + '(' + body + ')'


@functools.lru_cache(None)
def correct_log10(value):
    value = float(value)
    if not math.isfinite(value) or value <= 0:
        return math.log10(value)
    with decimal.localcontext() as context:
        context.prec = 180
        first = float(decimal.Decimal.from_float(value).log10())
        context.prec = 320
        second = float(decimal.Decimal.from_float(value).log10())
    if first.hex() != second.hex():
        raise ValueError('independent log10 precision did not stabilize')
    return first


class MathematicalMath:
    def __getattr__(self, name):
        return correct_log10 if name == 'log10' else getattr(math, name)


def observe(namespace, case):
    np = namespace['np']
    namespace['mpl'].rcParams.update({'text.usetex': case.get('tex', False),
                                     'axes.unicode_minus': case.get('minus', True)})
    with warnings.catch_warnings(record=True) as native:
        warnings.simplefilter('always')
        try:
            xmax = decode(case['xmax'], np)
            if case['operation'] == 'normalize':
                result = namespace['PercentFormatter'](xmax=xmax).xmax
                kind = 'NumpyFloat64' if isinstance(result, np.float64) else 'Number'
            else:
                formatter = namespace['PercentFormatter'](
                    decimals=decode(case['decimals'], np),
                    symbol=case.get('symbol', '%'), is_latex=case.get('latex', False))
                formatter.xmax = xmax  # Preserve the source RAW public slot.
                value = decode(case['value'], np)
                if case['operation'] == 'convert':
                    result = formatter.convert_to_pct(value)
                else:
                    result = formatter.format_pct(value, decode(case['range'], np))
                kind = None
            error = message = None
        except (TypeError, ValueError, OverflowError, ZeroDivisionError) as failure:
            result, kind = None, None
            error, message = type(failure).__name__, str(failure)
    bits = (struct.unpack('>Q', struct.pack('>d', result))[0]
            if result is not None and not isinstance(result, str) else None)
    return dict(result=float(result) if bits is not None else result,
                result_bits=bits, normalized_kind=kind, error=error, message=message,
                native_warnings=[dict(category=type(w.message).__name__, message=str(w.message))
                                 for w in native])


def emit(case, expected, index):
    operation = case['operation']
    code = '\n///|\ntest ' + moon('Percent complete source numeric ' + str(index) + ' ' + operation) + ' {\n'
    code += '  let previous = @config.text_usetex()\n  defer @config.set_text_usetex(previous)\n'
    code += '  @config.set_text_usetex(' + moon(case.get('tex', False)) + ')\n'
    xmax = code_operand(case['xmax'], 'PercentXMax')
    if operation == 'normalize':
        query = 'percent_xmax_normalize(' + xmax + ')'
    else:
        value = code_operand(case['value'], 'NamedFormatValue')
        if operation == 'convert':
            query = 'percent_convert_to_pct(' + xmax + ', ' + value + ')'
        else:
            symbol = 'None' if case.get('symbol', '%') is None else 'Some(' + moon(case.get('symbol', '%')) + ')'
            code += '  let state : PercentFormatterState = { xmax: ' + xmax + ', decimals: ' + code_operand(case['decimals'], 'PercentDecimals')
            code += ', symbol: ' + symbol + ', is_latex: ' + moon(case.get('latex', False)) + ' }\n'
            if case['range']['kind'] == 'Integer':
                query = 'percent_format_pct_with_range(state, ' + value + ', PercentDisplayRange::PythonInteger(' + bigint_code(case['range']) + '))'
            else:
                query = 'percent_format_pct(state, ' + value + ', ' + code_operand(case['range'], 'NamedFormatValue') + ')'
    if expected['error']:
        message = expected['error'] + ': ' + expected['message']
        code += '  assert_true(try { ignore(' + query + '); false } catch { @core.DataError::InvalidTicks(message~) => message == ' + moon(message) + '; _ => false })\n'
    elif operation == 'format':
        code += '  assert_eq(' + query + ', ' + moon(expected['result']) + ')\n'
    else:
        code += '  let actual = ' + query + '\n'
        if operation == 'normalize':
            code += '  let actual = match actual { PercentXMax::' + expected['normalized_kind'] + '(number) => number; _ => abort("normalized scalar origin differs") }\n'
        if math.isnan(expected['result']):
            code += '  assert_true(actual.is_nan())\n'
        else:
            code += '  assert_eq(actual.reinterpret_as_uint64(), ' + str(expected['result_bits']) + 'UL)\n'
    return code + '}\n'


def generate(path):
    original = load_percent_formatter(path)
    node = next(n for n in ast.parse(path.read_text()).body
                if isinstance(n, ast.ClassDef) and n.name == 'PercentFormatter')
    mathematical = dict(original, math=MathematicalMath())
    exec(compile(ast.Module(body=[node], type_ignores=[]), str(path), 'exec'), mathematical)
    cases = []

    def add(value=1.25, display_range=1., xmax=100., decimals=None, **kw):
        cases.append(dict(operation='format',
                          value=value if isinstance(value, dict) else pyfloat(float(value)),
                          range=display_range if isinstance(display_range, dict) else pyfloat(float(display_range)),
                          xmax=xmax if isinstance(xmax, dict) else number(float(xmax)),
                          decimals=decimals if isinstance(decimals, dict) else operand('Automatic') if decimals is None else number(float(decimals)), **kw))

    x_values = [0., -0., 1.25, -1.25, 2.675, 5e-324, -5e-324, sys.float_info.max,
                -sys.float_info.max, math.nan, -math.nan, math.inf, -math.inf]
    for origin in ['PythonFloat', 'NumpyFloat64', 'NumpyInt64']:
        values = x_values if origin != 'NumpyInt64' else [0, -1, 1, 9007199254740993, -(2**63), 2**63-1]
        for value in values:
            for xmax in [100., 1., -1., 0., -0., 5e-324, math.inf, -math.inf, math.nan]:
                for decimals in [None, 2]:
                    add(value=operand(origin, value), xmax=xmax, decimals=decimals)
    # Raw public xmax origins retain zero-division dispatch and exact BigInt coercion.
    raw_xmax = [number(0.), operand('NumpyFloat64', 0.), operand('NumpyInt64', 0),
                integer(0), operand('Boolean', False), operand('Boolean', True),
                integer(2**63+1), operand('Integer', power10=308), operand('Integer', power10=309)]
    for xmax in raw_xmax:
        for value in [pyfloat(1.), operand('NumpyFloat64', 1.), operand('NumpyInt64', 1)]:
            for display_range in [pyfloat(1.), operand('NumpyFloat64', 1.)]:
                for decimals in [None, 1, -1]:
                    add(value=value, display_range=display_range, xmax=xmax, decimals=decimals)
    # Real Dummy/default and public Python-integer intervals retain integer
    # division, rather than coercing every display_range to Python float.
    for xmax in raw_xmax + [number(1.), operand('NumpyFloat64', 1.), operand('NumpyInt64', 1), integer(1), integer(-1)]:
        for value in [pyfloat(1.), operand('NumpyFloat64', 1.), operand('NumpyInt64', 1)]:
            for display_range in [integer(0), integer(1), operand('Integer', power10=309), operand('Integer', power10=400)]:
                add(value=value, display_range=display_range, xmax=xmax)
    for xmax in [100., 1., 17.]:
        for threshold in [50., 5., .5, .05, .005, .0005, .00005]:
            middle = threshold*xmax/100.
            value = middle
            for _ in range(16):
                value = math.nextafter(value, -math.inf)
            for offset in range(-16, 17):
                add(display_range=value, xmax=xmax, threshold=dict(nominal=threshold, offset=offset))
                value = math.nextafter(value, math.inf)
    for display_range in [-math.inf, -1., -0., 0., 5e-324, 1e-320, 1e-8,
                          1e306, sys.float_info.max, math.inf, math.nan]:
        for xmax in [100., -100., math.inf, -math.inf, math.nan]:
            for decimals in [None, 2]:
                add(display_range=display_range, xmax=xmax, decimals=decimals)
    precisions = [number(x) for x in [0., -0., -.5, -.9, -1., -1.9, 1.9, 2.5, math.nan,
                                      math.inf, -math.inf, sys.float_info.max, -sys.float_info.max]]
    precisions += [operand('Boolean', x) for x in [True, False]]
    precisions += [integer(x) for x in [0, 2, -1, 2147483647, 2147483648, 2**63-1, 2**63]]
    precisions += [operand('Integer', power10=power, negative=negative)
                   for power in [4299, 4300] for negative in [False, True]]
    texts = ['2', ' +02 ', '-0', '-1', '+_2', '_2', '2_', '2__0', '2_0', '2 _0', '+ 2',
             '0x2', '02', '０２', '٢_٢', '2_٢', '²', '①', '＋2', '−2', '\0'+'2', '2\0',
             '2.0', '', ' 2\n', '\x1c2', '\x1d2', '\x1e2', '\x1f2', '\ufeff2', '\u180e2',
             '\U00011f52', '\U0001e4f2', 'x'*300, '😀'*300, '\0'*300, '"'+'x'*300,
             '0'*4300, '0'*4301, '0'*4300+'2', '1'*4300, '1'*4301,
             '1_'*4299+'1', '1_'*4300+'1', '1'*4301+'x', '1'*4301+'_',
             '-'+'1'*4301, '٢'*4301]
    for cp in [9,10,11,12,13,32,0x85,0xa0,0x1680,*range(0x2000,0x200b),0x2028,0x2029,0x202f,0x205f,0x3000]:
        texts.append(chr(cp)+'2'+chr(cp))
    precisions += [operand('Text', text) for text in texts]
    for precision in precisions:
        # Special x proves huge precision-parser behavior without allocating.
        add(value=math.nan, decimals=precision)
    # Finite outputs also prove the consumed numeric value, not merely success.
    for precision in [number(.5), number(1.9), number(2.5), number(-.9),
                      operand('Boolean', True), operand('Boolean', False)]:
        add(decimals=precision)
    for cp in [9,10,11,12,13,32,0x85,0xa0,0x1680,*range(0x2000,0x200b),0x2028,0x2029,0x202f,0x205f,0x3000]:
        add(decimals=operand('Text', chr(cp)+'2'+chr(cp)))
    decimal_zeros = [cp for cp in range(0x110000)
                     if unicodedata.category(chr(cp)) == 'Nd' and unicodedata.decimal(chr(cp)) == 0]
    for zero in decimal_zeros:
        add(decimals=operand('Text', chr(zero+2)))
    for text in [' +02 ', '1_0', '2_٢', '-0']:
        add(decimals=operand('Text', text))
    for precision in [number(math.nan), operand('Text', 'bad')]:
        add(xmax=0., decimals=precision)
    for precision in [0, 1, 2, 101, 325, 1074, 1100]:
        for x, xmax in [(1.25, 1.), (5e-324, 2.), (1e308, 1e308), (5e-324, 5e-324)]:
            add(value=x, xmax=xmax, decimals=precision)
    for symbol in [None, '', '%', 'a-b%', '\\#$%&~_^{}', '😀%']:
        for tex in [False, True]:
            for latex in [False, True]:
                add(value=-0., decimals=2, symbol=symbol, tex=tex, latex=latex)
    for xmax in [number(-0.), number(math.nan), number(math.inf), number(-math.inf),
                 integer(0), integer(9007199254740993), operand('Integer', power10=308),
                 operand('Integer', power10=309), operand('Boolean', True), operand('Boolean', False),
                 operand('NumpyFloat64', -0.), operand('NumpyInt64', -(2**63)), operand('NumpyInt64', 2**63-1)]:
        cases.append(dict(operation='normalize', xmax=xmax))
    for xmax in raw_xmax + [number(100.), number(1e308), number(2.), number(-0.), number(math.nan)]:
        for value in [pyfloat(1.), pyfloat(1e308), pyfloat(5e-324), pyfloat(math.inf), pyfloat(math.nan),
                      operand('NumpyFloat64', 1.), operand('NumpyInt64', 9007199254740993)]:
            cases.append(dict(operation='convert', xmax=xmax, value=value, decimals=operand('Automatic')))
    rows, differences = [], []
    code = '// Complete original PercentFormatter AST and fixed native scalar runtime.\n'
    for index, case in enumerate(cases):
        actual = observe(original, case)
        maths = observe(mathematical, case)
        if (actual['result_bits'], actual['result'], actual['error'], actual['message']) != (maths['result_bits'], maths['result'], maths['error'], maths['message']):
            # NaN values compare unequal by definition; bits/errors still retain
            # the independent original evidence without creating false profiles.
            same_nan = actual['error'] is None and maths['error'] is None and isinstance(actual['result'], float) and isinstance(maths['result'], float) and math.isnan(actual['result']) and math.isnan(maths['result'])
            if not same_nan:
                differences.append(index)
        rows.append(dict(case=case, original_source=actual, mathematical_profile=maths))
        code += emit(case, maths, index)
    omitted = [dict(operation='format', value='finite 1.25', decimals=integer(p),
                    reason='Independent unsafe output-allocation budget; original query not executed, no source exception inferred')
               for p in [1000000000, 2147483645, 2147483647]]
    payload = dict(source_hashes=original['source_hashes'],
                   class_source_sha256=hashlib.sha256(ast.get_source_segment(path.read_text(), node).encode()).hexdigest(),
                   runtime=dict(python=sys.version.split()[0], numpy=original['np'].__version__, unicode=unicodedata.unidata_version, max_str_digits=sys.get_int_max_str_digits()),
                   oracle='Complete original PercentFormatter class and inherited original Formatter; actual CPython/NumPy arithmetic/int/format, no copied percent algorithm.',
                   mathematical_contract='Same complete original AST; only math.log10 replaced by Decimal exact-input 180/320-digit stable correctly-rounded Double. Accepted portable f digits are tested against actual native original fixed formatting.',
                   native_warning_boundary='Native NumPy RuntimeWarnings recorded separately; not _api.warn_external diagnostics. NaN arithmetic classified with is_nan, finite/Inf results asserted by exact bits.',
                   threshold_pairs=693, unicode_decimal_groups=len(decimal_zeros), source_profile_differences=differences,
                   cases=rows, allocation_omissions=omitted)
    return clean(payload), formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('ticker', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    payload, code = generate(args.ticker)
    outputs = {ROOT/'testdata/percent_numeric_reference.json': json.dumps(payload, indent=2, allow_nan=False)+'\n',
               ROOT/'ticker/percent_numeric_reference_wbtest.mbt': code}
    for path, text in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit('reference differs: '+str(path))
        else:
            path.write_text(text)
    counts = collections.Counter(row['original_source']['error'] or 'success' for row in payload['cases'])
    print('Percent numeric:',len(payload['cases']),'queries/tests;',dict(counts),'; 693 threshold pairs;',len(payload['source_profile_differences']),'source/math differences;',len(payload['allocation_omissions']),'allocation omissions')


if __name__ == '__main__':
    main()
