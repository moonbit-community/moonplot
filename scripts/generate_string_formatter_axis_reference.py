"""Original string Formatter/Axis batches, dtype transport and SVG acceptance.

Reuse the accepted complete original Axis/Secondary AST fixture and real API
loader; execute the complete new formatter/helper classes in that namespace.
Only numeric Bbox, GUI, tick Text storage and affine primitives are fixture sinks.
"""
from pathlib import Path
import argparse
import ast
import hashlib
import html
import json
import string
import sys
import warnings

import numpy as np

from generate_basic_formatter_axis_reference import load as load_axis, run_update
from formatter_reference_source import load_string_formatters
from generate_auto_date_reference import formatted, moon
from generate_null_axis_reference import clean
from generate_symlog_axis_reference import arr

ROOT = Path(__file__).resolve().parents[1]


def load(path):
    ns, tr, Axes, Secondary, real = load_axis(path)
    metadata = load_string_formatters(path)['source_hashes']
    ns['string'] = string
    tree = ast.parse(path.read_text())
    for name in ['FormatStrFormatter', '_UnicodeMinusFormat', 'StrMethodFormatter']:
        node = next(n for n in tree.body if isinstance(n, ast.ClassDef) and n.name == name)
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(path), 'exec'), ns)
    return ns, Axes, Secondary, metadata


def generate(path):
    ns, Axes, Secondary, metadata = load(path)
    cases = []
    for secondary in [False, True]:
        for name in ['x', 'y']:
            for dtype in ['float64', 'int64']:
                for major_kind in ['FormatStrFormatter', 'StrMethodFormatter']:
                    for overlap in [False, True]:
                        parent = Axes(label='parent')
                        getattr(parent, 'set_' + name + 'lim')((0., 3.))
                        current = Secondary(parent, name)._axis if secondary else parent._axis_map[name]
                        current.remove_overlapping_locs = overlap
                        major_values = [3, 5, 9, 13] if secondary else [-1, 0, 2, 4]
                        minor_values = [1, 5, 7, 9, 11, 15] if secondary else [-2, 0, 1, 2, 3, 5]
                        major_array = np.array(major_values, dtype=dtype)
                        minor_array = np.array(minor_values, dtype=dtype)
                        current.set_major_locator(ns['FixedLocator'](major_array))
                        current.set_minor_locator(ns['FixedLocator'](minor_array))
                        minor_kind = 'StrMethodFormatter' if major_kind == 'FormatStrFormatter' else 'FormatStrFormatter'
                        major_fmt = 'M:%r' if major_kind == 'FormatStrFormatter' else 'M:{pos}:{x!r}'
                        minor_fmt = 'm:{pos}:{x:d}' if minor_kind == 'StrMethodFormatter' and dtype == 'int64' else 'm:{pos}:{x:.2f}' if minor_kind == 'StrMethodFormatter' else 'm:%s'
                        major, minor = ns[major_kind](major_fmt), ns[minor_kind](minor_fmt)
                        current.set_major_formatter(major)
                        current.set_minor_formatter(minor)
                        result = run_update(path, ns, current, {id(major): 'major', id(minor): 'minor'})
                        if result['error']:
                            raise RuntimeError(result)
                        labels = list(major.format_ticks(major._locs))
                        minor_labels = list(minor.format_ticks(minor._locs))
                        cases.append(dict(secondary=secondary, name=name, dtype=dtype, major_kind=major_kind,
                                          minor_kind=minor_kind, major_fmt=major_fmt, minor_fmt=minor_fmt,
                                          overlap=overlap, major_values=major_values, minor_values=minor_values,
                                          result=result, major_labels=labels, minor_labels=minor_labels,
                                          major_locs=major._locs.tolist(), minor_locs=minor._locs.tolist(),
                                          major_dtype=str(major._locs.dtype), minor_dtype=str(minor._locs.dtype),
                                          minor_shares_owner=np.shares_memory(minor._locs, minor_array),
                                          offset=major.get_offset()))
    errors = []
    for secondary in [False, True]:
        for name in ['x', 'y']:
            for level in ['major', 'minor']:
                for kind, invalid in [('FormatStrFormatter', '%x'), ('StrMethodFormatter', '{x:d}')]:
                    parent = Axes(label='parent')
                    getattr(parent, 'set_' + name + 'lim')((0., 3.))
                    current = Secondary(parent, name)._axis if secondary else parent._axis_map[name]
                    major_values = [3., 5., 9., 13.] if secondary else [-1., 0., 2., 4.]
                    minor_values = [1., 7., 11., 15.] if secondary else [-2., 1., 3., 5.]
                    current.set_major_locator(ns['FixedLocator'](np.array(major_values)))
                    current.set_minor_locator(ns['FixedLocator'](np.array(minor_values)))
                    major = ns[kind](invalid if level == 'major' else '%g' if kind == 'FormatStrFormatter' else '{x}')
                    minor = ns[kind](invalid if level == 'minor' else '%g' if kind == 'FormatStrFormatter' else '{x}')
                    current.set_major_formatter(major)
                    current.set_minor_formatter(minor)
                    result = run_update(path, ns, current, {id(major): 'major', id(minor): 'minor'})
                    if not result['error']:
                        raise RuntimeError('source error expected')
                    errors.append(dict(secondary=secondary, name=name, level=level, kind=kind,
                                       major_fmt=major.fmt, minor_fmt=minor.fmt,
                                       major_values=major_values, minor_values=minor_values,
                                       result=result, major_locs=clean(major._locs), minor_locs=clean(minor._locs)))
    return dict(source_hashes={**metadata, **{name: hashlib.sha256((path.parent / name).read_bytes()).hexdigest()
                                            for name in ['axis.py', 'figure.py', 'axes/_base.py', 'axes/_secondary_axes.py']}},
                python=sys.version.split()[0], numpy=np.__version__, cases=cases, errors=errors,
                scope='Full original Axis._update_ticks plus original named string classes, scalar dtype, overlap selection and failure stages. Scene public Figure SVG and private full numeric bundles consume the same labels. Numeric/GUI/Text/affine fixture sinks remain the accepted D28 profile; full Text object lifecycle and default scale installation remain deferred.')


def view(values, dtype):
    if dtype == 'int64':
        return '@ticker.TickValues::from_int64_array([' + ', '.join(str(v) + 'L' for v in values) + '])'
    return '@ticker.TickValues::from_array(' + arr(values) + ')'


def strings(values):
    return '[' + ', '.join(moon(v) for v in values) + ']'


def install(row):
    code = '  let major = @ticker.' + row.get('major_kind', row.get('kind')) + '::new(' + moon(row['major_fmt']) + ').as_base_formatter()\n'
    code += '  let minor = @ticker.' + row.get('minor_kind', row.get('kind')) + '::new(' + moon(row['minor_fmt']) + ').as_base_formatter()\n'
    code += '  let major_view = ' + view(row['major_values'], row.get('dtype', 'float64')) + '\n'
    code += '  let minor_view = ' + view(row['minor_values'], row.get('dtype', 'float64')) + '\n'
    code += '  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())\n'
    code += '  axis.set_minor_locator(@ticker.FixedLocator::from_view(minor_view).as_minor_locator())\n'
    code += '  axis.set_minor_overlap_removal(' + str(row.get('overlap', True)).lower() + ')\n'
    code += '  axis.set_named_formatter(major)\n  axis.set_minor_named_formatter(minor)\n'
    return code


def generated_scene(payload):
    code = '// Generated from complete original string Formatter / Axis / Secondary batches.\n'
    for index, row in enumerate(payload['cases'] + payload['errors']):
        error = row['result']['error']
        code += '\n///|\ntest ' + moon('string Formatter original public SVG ' + str(index)) + ' {\n'
        code += '  @config.set_unicode_minus(true)\n  defer { @config.set_unicode_minus(true) }\n'
        code += '  let figure = @scene.figure(width=300, height=160)\n  let axes = figure.axes()\n'
        code += '  axes.set_x_limits(0.0, 3.0)\n  axes.set_y_limits(0.0, 3.0)\n'
        code += '  axes.set_x_locator(@ticker.NullLocator::new().as_locator())\n  axes.set_y_locator(@ticker.NullLocator::new().as_locator())\n'
        code += '  let axis = ' + ('axes.secondary_' + row['name'] + 'axis(value => value * 2.0 + 5.0, value => (value - 5.0) / 2.0)' if row['secondary'] else 'axes.' + row['name'] + '_axis()') + '\n'
        code += install(row)
        if error:
            code += '  assert_true(try { ignore(figure.to_svg_checked()); false } catch { @core.DataError::InvalidTicks(message~) => message.has_prefix(' + moon(error + ':') + '); _ => false })\n'
        else:
            code += '  let svg = figure.to_svg_checked()\n'
            visible = [t['label'] for t in row['result']['values'] if t['label']]
            for label in sorted(set(visible)):
                token = '>' + html.escape(label, quote=False) + '<'
                code += '  assert_eq(svg.split(' + moon(token) + ').count() - 1, ' + str(visible.count(label)) + ')\n'
            all_labels = row['major_labels'] + row['minor_labels']
            for label in sorted(set(all_labels) - set(visible)):
                code += '  assert_true(!svg.contains(' + moon('>' + html.escape(label, quote=False) + '<') + '))\n'
        code += '  assert_eq(major.locations().length(), ' + str(len(row['major_locs'])) + ')\n'
        code += '  assert_eq(minor.locations().length(), ' + str(len(row['minor_locs'])) + ')\n'
        code += '  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))\n'
        code += '  assert_eq(major.get_offset(), "")\n}\n'
    return formatted(code)


def generated_backend(payload):
    code = '// Original ndarray dtype survives full formatter batching and overlap selection.\n'
    for index, row in enumerate(payload['cases']):
        if row['secondary']:
            continue
        code += '\n///|\ntest ' + moon('string Formatter original full retained bundle ' + str(index)) + ' {\n'
        code += '  @config.set_unicode_minus(true)\n  defer { @config.set_unicode_minus(true) }\n'
        code += '  let axis = @axis.axis()\n  axis.set_limits(0.0, 3.0)\n' + install(row)
        code += '  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))\n'
        code += '  assert_eq(bundle.major_labels, ' + strings(row['major_labels']) + ')\n'
        code += '  assert_eq(bundle.minor_labels, ' + strings(row['minor_labels']) + ')\n'
        code += '  assert_eq(bundle.major, ' + arr(row['major_locs']) + ')\n'
        code += '  assert_eq(bundle.minor, ' + arr(row['minor_locs']) + ')\n'
        code += '  minor_view.set(0, -3.0)\n'
        expected_first = -3. if row['minor_shares_owner'] else row['minor_locs'][0]
        code += '  assert_eq(minor.locations().get(0), ' + str(float(expected_first)) + ')\n}\n'
    return formatted(code)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('ticker', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    with warnings.catch_warnings(), np.errstate(all='ignore'):
        warnings.simplefilter('ignore', RuntimeWarning)
        payload = generate(args.ticker)
    outputs = {ROOT / 'testdata/string_formatter_axis_reference.json': json.dumps(clean(payload), indent=2, allow_nan=False) + '\n',
               ROOT / 'scene/string_formatter_axis_reference_test.mbt': generated_scene(payload),
               ROOT / 'backend/svg/string_formatter_axis_reference_wbtest.mbt': generated_backend(payload)}
    for target, content in outputs.items():
        if args.check:
            if not target.exists() or target.read_text() != content:
                raise SystemExit('reference differs: ' + str(target))
        else:
            target.write_text(content)
    print('string axis:', len(payload['cases']), 'successful original batches,', len(payload['errors']), 'original failure batches;',
          sum(content.count('\ntest ') for target, content in outputs.items() if target.suffix == '.mbt'), 'tests')


if __name__ == '__main__':
    main()
