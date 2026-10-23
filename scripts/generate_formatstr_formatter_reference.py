"""Complete original FormatStrFormatter AST and the fixed percent operator.

The three real scalar origins are kept: direct/list Python float and native
NumPy Float64/Int64 views. Unsupported portable String representations and
independent unsafe-allocation omissions are recorded separately from source
exceptions. No Moon code or parallel percent implementation is an oracle.
"""
from pathlib import Path
import argparse
import ast
import collections
import hashlib
import json
import math
import re
import sys

from formatter_reference_source import load_string_formatters
from generate_auto_date_reference import formatted, moon as numeric_moon
from generate_multiple_locator_reference import clean

ROOT = Path(__file__).resolve().parents[1]


def moon(value):
    if isinstance(value, str):
        return re.sub(r"\\u([0-9a-fA-F]{4})", r"\\u{\1}",
                      json.dumps(value, ensure_ascii=False))
    if isinstance(value, list):
        return "[" + ", ".join(moon(x) for x in value) + "]"
    return numeric_moon(value)


def observe(namespace, case):
    values = case["values"]
    kind = case["kind"]
    typed = (values if kind == "PythonFloat" else
             namespace["np"].array(values, dtype="float64" if kind == "NumpyFloat64" else "int64"))
    formatter = namespace["FormatStrFormatter"](case["format"])
    formatter.set_locs([91., 92.])
    try:
        if case["method"] == "call":
            result = formatter(typed[0], -7)
        elif case["method"] in ["format_data", "format_data_short"]:
            result = getattr(formatter, case["method"])(typed[0])
        else:
            result = formatter.format_ticks(typed)
        error = message = None
    except (TypeError, ValueError, OverflowError, IndexError) as failure:
        result, error, message = None, type(failure).__name__, str(failure)
    texts = result if isinstance(result, list) else [result] if result is not None else []
    boundary = any(any(0xd800 <= ord(ch) <= 0xdfff for ch in text) for text in texts)
    return dict(result=result if not boundary else None,
                source_success_codepoints=[[ord(ch) for ch in text] for text in texts] if boundary else None,
                error=error, message=message,
                typed_boundary="Unsupported unpaired surrogate output" if boundary else None,
                locations_length=len(formatter._locs))


def test_code(case, observed, index):
    code = '\n///|\ntest ' + moon('FormatStr original scalar ' + str(index) + ' ' + case['kind']) + ' {\n'
    code += '  let formatter = @ticker.FormatStrFormatter::new(' + moon(case['format']) + ')\n'
    code += '  formatter.set_locs([91.0, 92.0])\n'
    kind, method = case['kind'], case['method']
    if kind == 'PythonFloat':
        if method == 'format_ticks':
            query = 'formatter.format_ticks(' + moon(case['values']) + ')'
        else:
            query = 'formatter.' + method + '(' + moon(case['values'][0]) + (', pos=-7' if method == 'call' else '') + ')'
    else:
        code += '  let values = @ticker.TickValues::' + ('from_int64_array([' + ', '.join(str(v) + 'L' for v in case['values']) + '])' if kind == 'NumpyInt64' else 'from_array(' + moon(case['values']) + ')') + '\n'
        query = 'formatter.format_ticks_view(values)'
    if observed['error'] or observed['typed_boundary']:
        message = 'Unsupported: percent character is an unpaired Unicode surrogate' if observed['typed_boundary'] else observed['error'] + ': ' + observed['message']
        code += '  assert_true(try { ignore(' + query + '); false } catch { @core.DataError::InvalidTicks(message~) => message == ' + moon(message) + '; _ => false })\n'
    else:
        code += '  assert_eq(' + query + ', ' + moon(observed['result']) + ')\n'
    code += '  assert_eq(formatter.locations().length(), ' + str(observed['locations_length']) + ')\n'
    if method == 'format_ticks':
        code += '  assert_true(formatter.locations() is @ticker.FormatterLocations::' + ('Sequence(_)' if kind == 'PythonFloat' else 'NdArray(_)') + ')\n'
    return code + '}\n'


def generate(path):
    namespace = load_string_formatters(path)
    np = namespace['np']
    cases = []

    def add(fmt, kind='PythonFloat', value=1.25, method=None, values=None):
        cases.append(dict(format=fmt, kind=kind,
                          method=method or ('call' if kind == 'PythonFloat' else 'format_ticks'),
                          values=values if values is not None else [int(value) if kind == 'NumpyInt64' else float(value)]))

    grammar = ['', 'plain', '%%', '%%%g', '%g%%', '%% %g %%', '%g %g', '%q', '%g %q', '%q %g',
               '%g %', '%g %*f', '%g %(x)f', '%g %(x)', '%g %5%', '%', '%(', '%(x)', '%(x)f',
               '%(x)q', '%()s', '%((x))f', '%*f', '%.*f', '%*q', '%.*q', '%5%', '%#%', '%1.2%',
               '%.f', '%.d', '%.-2f', '%lf', '%hf', '%Lf', '%llf', '%hhf', '%zf', '%5.2lf',
               '%s', '%r', '%a', '%c', '%d', '%i', '%u', '%o', '%x', '%X', '%b', '%n',
               '%010s', '%+s', '%#s', '% 10s', '%.3s', '%.0r', '%-010.3a', '%05.3d', '%#.0d',
               '%+.0d', '%0-+ #12.0g', '%10.0f', '%#.0e', '%#.0g', '😀%q', '%😀', '%é', '%\n', '%\0',
               '%0', '%00', '%5', '%.', '%.2', '%l', '%g %.2147483648q',
               '%9223372036854775807q', '%9223372036854775808q', '%.2147483647q', '%.2147483648q',
               '%2147483648x', '%2147483648c', '%999999999999999999999999999f',
               '%.999999999999999999999999999f']
    for kind in ['PythonFloat', 'NumpyFloat64', 'NumpyInt64']:
        for fmt in grammar:
            # Huge supported integer/c width must not allocate; use a type/range
            # error for those safe parser-order cases. Int64 variants are omitted.
            if kind == 'NumpyInt64' and fmt in ['%2147483648x', '%2147483648c']:
                continue
            add(fmt, kind, 65 if kind == 'NumpyInt64' else 1.25)
    for kind in ['PythonFloat', 'NumpyFloat64']:
        for value in [0., -0., math.nan, math.inf, -math.inf, 5e-324, -5e-324,
                      sys.float_info.max, -sys.float_info.max, 2.675, 1.005, 2.5, 3.5, -.5, -.999,
                      1e-5, 1e-4, 1e15, 1e16, 1e20, math.nextafter(1., 0.), math.nextafter(1., 2.)]:
            for fmt in ['%g', '%f', '%e', '%G', '%F', '%E', '%s', '%r', '%a', '%d', '%i', '%u',
                        '%x', '%c', '%+010.2f', '% .0f', '%#.0g']:
                add(fmt, kind, value)
    for code in 'eEfFgG':
        for flags in ['', '+', ' ', '0', '#', '-', '+0', '-0', '#0', ' +', '0-+# ']:
            for spec in ['', '12', '.0', '.1', '.17', '12.3']:
                for value in [1.25, -0., math.nan, math.inf]:
                    add('%' + flags + spec + code, value=value)
    for value in [0, -1, 42, -42, 65, 9007199254740993, -(2**63), 2**63-1]:
        for fmt in ['%s', '%r', '%a', '%d', '%i', '%u', '%o', '%x', '%X', '%c', '%e', '%E', '%f',
                    '%F', '%g', '%G', '%#08x', '%+08c', '%#.0o', '%#.0x', '%#.0X', '%+#08x',
                    '%#08o', '%.5x', '%-#08x', '%#08.5x', '%*f', '%.*f']:
            add(fmt, 'NumpyInt64', value)
    for value in [-1, 0, 0xd800, 0xdfff, 0x1f600, 0x10ffff, 0x110000]:
        for fmt in ['%c', '%05c', '%.0c', '%+c']:
            add(fmt, 'NumpyInt64', value)
    for fmt, value in [('%.101f', 1.25), ('%1001g', 1.25), ('%.1001g', 1.25),
                       ('%.1074f', 5e-324), ('%#.1100g', 5e-324), ('%.1075e', 5e-324),
                       ('%.1200f', sys.float_info.max), ('%.1200g', sys.float_info.max), ('%.1200g', 5e-324)]:
        add(fmt, value=value)
    for fmt in ['%s', '%r', '%a', '%+08.2f', '%g %g', '%d']:
        for method in ['format_data', 'format_data_short']:
            add(fmt, value=-0., method=method)
        for kind in ['PythonFloat', 'NumpyFloat64']:
            add(fmt, kind, method='format_ticks', values=[1., -0., math.nan])
    for fmt in ['%r', '%d', '%#x', '%c']:
        add(fmt, 'NumpyInt64', values=[0, 65, 9007199254740993])

    rows = []
    code = '// Complete pinned original class AST and actual CPython percent operator.\n'
    for index, case in enumerate(cases):
        observed = observe(namespace, case)
        rows.append(dict(case=case, original_source=observed))
        code += test_code(case, observed, index)
    node = next(node for node in ast.parse(path.read_text()).body if isinstance(node, ast.ClassDef) and node.name == 'FormatStrFormatter')
    omitted = [dict(format=fmt, reason='Independent output-allocation budget; original query not executed and no source error inferred')
               for fmt in ['%1000000000f', '%.1000000000f', '%9223372036854775807s']]
    omitted += [dict(format=fmt, kind='NumpyInt64', value=65,
                     reason='Independent output-allocation budget for this supported NumPy Int64 conversion width; original query not executed and no source error inferred')
                for fmt in ['%2147483648x', '%2147483648c']]
    payload = dict(source_hashes=namespace['source_hashes'],
                   class_source_sha256=hashlib.sha256(ast.get_source_segment(path.read_text(), node).encode()).hexdigest(),
                   runtime=dict(python=sys.version.split()[0], numpy=np.__version__),
                   oracle='Complete original FormatStrFormatter class, inherited complete original Formatter methods, and actual fixed CPython str percent operator. No copied formatter algorithm.',
                   typed_boundary='Three scalar origins retained. Source lone-surrogate c outputs are successful source observations but separately tested Unsupported portable String boundaries; no unsafe String construction. Allocation omissions are independent, not source exceptions.',
                   cases=rows, allocation_omissions=omitted)
    return clean(payload), formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('ticker', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    payload, code = generate(args.ticker)
    outputs = {ROOT / 'testdata/formatstr_formatter_reference.json': json.dumps(payload, indent=2, allow_nan=False) + '\n',
               ROOT / 'ticker/formatstr_formatter_reference_test.mbt': code}
    for path, text in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit('reference differs: ' + str(path))
        else:
            path.write_text(text)
    counts = collections.Counter(row['original_source']['error'] or ('typed_boundary' if row['original_source']['typed_boundary'] else 'success') for row in payload['cases'])
    print('FormatStr original:', len(payload['cases']), 'queries/tests;', dict(counts), ';', len(payload['allocation_omissions']), 'independent allocation omissions')


if __name__ == '__main__':
    main()
