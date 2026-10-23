"""Native fixed CPython percent operator for ScalarFormatter's extra origins.

Actual scalar and one-element-tuple RHS operations supply the expected result.
No portable percent parser or formatting routine is used as an oracle.
"""
from pathlib import Path
import argparse, collections, json, sys
import numpy as np
from generate_auto_date_reference import formatted
from generate_percent_numeric_reference import moon
ROOT = Path(__file__).resolve().parents[1]


def generate():
    if sys.version_info[:3] != (3, 12, 14) or np.__version__ != '2.3.5':
        raise RuntimeError('requires fixed CPython 3.12.14 / NumPy 2.3.5')
    grammar = ['', 'literal', '%%', '%g', '%s', '%r', '%a', '%d', '%i', '%u',
               '%o', '%x', '%X', '%c', '%+08d', '%#08x', '%#08.5x', '%-10s',
               '%.1r', '%+.3g', '%12.2f', '%#.0e', '%', '%(', '%(x)', '%(x)f',
               '%((x))q', '%*', '%*q', '%*f', '%.*', '%.*q', '%.*f', '%*.*f',
               '%g %q', '%g %*f', '%g %(x)q', '%q %g', '%5%', '%l', '%llf',
               '%g %.2147483648q', '%9999999999999999999999q', '%😀', '😀%q',
               '%\0', '%\n', '%.f', '%-.0d']
    operands = [('Integer', 0), ('Integer', -42), ('Integer', 65),
                ('Integer', 2**100), ('Integer', -(2**100)),
                ('Boolean', False), ('Boolean', True),
                ('NumpyBool', False), ('NumpyBool', True)]
    rows = []
    code = '// Actual native CPython percent operator: ScalarNumber extra domains.\n'
    for kind, raw in operands:
        value = np.bool_(raw) if kind == 'NumpyBool' else raw
        expr = ('ScalarNumber::Integer(@bigint.BigInt::from_string(' + moon(str(raw)) + '))'
                if kind == 'Integer' else 'ScalarNumber::' + kind + '(' + str(raw).lower() + ')')
        for fmt in grammar:
            for tuple_rhs in [False, True]:
                try:
                    result = fmt % ((value,) if tuple_rhs else value)
                    error = None
                except Exception as failure:
                    result = None
                    error = type(failure).__name__ + ': ' + str(failure)
                rows.append(dict(kind=kind, value=str(raw), format=fmt, tuple_rhs=tuple_rhs,
                                 result=result, error=error))
                query = 'scalar_percent_format(' + moon(fmt) + ', ' + expr + ', tuple=' + str(tuple_rhs).lower() + ')'
                code += '\n///|\nfn scalar_native_percent_case_' + str(len(rows)-1) + '() -> Unit raise {\n'
                if error:
                    code += '  assert_true(try { ignore(' + query + '); false } catch { @core.DataError::InvalidTicks(message~) => message == ' + moon(error) + '; _ => false })\n'
                else:
                    code += '  assert_eq(' + query + ', ' + moon(result) + ')\n'
                code += '}\n'
    group_size = 32
    for start in range(0, len(rows), group_size):
        end = min(len(rows), start + group_size)
        code += '\n///|\ntest ' + moon('Scalar native percent cases ' + str(start) + '..' + str(end)) + ' {\n'
        for index in range(start, end):
            code += '  scalar_native_percent_case_' + str(index) + '()\n'
        code += '}\n'
    payload = dict(runtime=dict(python=sys.version.split()[0], numpy=np.__version__),
                   oracle='Native str.__mod__ on the actual scalar or one-element tuple. No copied parser.',
                   case_count=len(rows), registered_test_count=(len(rows)+group_size-1)//group_size,
                   cases=rows)
    return json.dumps(payload, ensure_ascii=False, indent=2) + '\n', formatted(code)


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--check', action='store_true')
    args = p.parse_args()
    data, code = generate()
    for path, content in [(ROOT/'testdata/scalar_percent_reference.json', data),
                          (ROOT/'ticker/scalar_percent_reference_wbtest.mbt', code)]:
        if args.check:
            if path.read_text() != content:
                raise SystemExit('reference differs: ' + str(path))
        else:
            path.write_text(content)
    rows = json.loads(data)['cases']
    print('Scalar native percent', len(rows), 'cases;', json.loads(data)['registered_test_count'], 'registered tests;', dict(collections.Counter(r['error'].split(':')[0] if r['error'] else 'success' for r in rows)))


if __name__ == '__main__':
    main()
