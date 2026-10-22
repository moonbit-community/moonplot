"""Original SymLog transforms, Axis binding/overlap and secondary transform-tree evidence.

Complete pinned AST owns every locator, scale transform, overlap and view query.
The fixture supplies numeric bboxes, identity units, formatter/tick sinks and an
explicit affine-matrix C-kernel sink; it does not copy the locator/binding/mapping
algorithm. See JSON provenance for the remaining lifecycle boundaries.
"""
from pathlib import Path
import argparse
import ast
import copy
import functools
import hashlib
import inspect
import itertools
import json
import math
import textwrap
import types
import weakref
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_log_axis_reference import load as load_log, HASHES
from generate_null_axis_reference import observe, clean

ROOT = Path(__file__).resolve().parents[1]


def load(path):
    root = path.parent
    ns = load_log(path)
    api = ns['_api']
    api.deprecated = lambda *args, **kwargs: lambda value: value
    doc = types.SimpleNamespace(copy=lambda *args, **kwargs: lambda value: value)

    def affine_sink(values, matrix):
        values = np.asarray(values, dtype=float)
        return values @ matrix[:2, :2].T + matrix[:2, 2]

    tns = dict(__name__='original_transforms_probe', np=np, inv=np.linalg.inv,
               functools=functools, itertools=itertools, textwrap=textwrap,
               weakref=weakref, math=math, _api=api, _docstring=doc,
               affine_transform=affine_sink,
               count_bboxes_overlapping_bbox=lambda *a: (_ for _ in ()).throw(
                   RuntimeError('unused bbox C kernel')),
               Path=type('UnusedPathSink', (), {}))
    tree = ast.parse((root / 'transforms.py').read_text())
    tree.body = [node for node in tree.body if not isinstance(node, (ast.Import, ast.ImportFrom))]
    exec(compile(tree, str(root / 'transforms.py'), 'exec'), tns)
    transforms = types.SimpleNamespace(**{key: value for key, value in tns.items()
                                         if not key.startswith('__')})

    parsed = {name: ast.parse((root/name).read_text()) for name in
              ['scale.py', 'axis.py', 'axes/_base.py', 'axes/_secondary_axes.py', '_api/__init__.py']}

    def node(filename, name, method=None):
        result = next(n for n in parsed[filename].body
                      if isinstance(n, (ast.ClassDef, ast.FunctionDef)) and n.name == name)
        return next(n for n in result.body if isinstance(n, ast.FunctionDef) and n.name == method) if method else result

    def run(filename, name, method=None):
        result = node(filename, name, method)
        exec(compile(ast.Module(body=[result], type_ignores=[]), str(root/filename), 'exec'), ns)
        return ns[method or name]

    api.getitem_checked = run('_api/__init__.py', 'getitem_checked')
    ns.update(Transform=tns['Transform'], IdentityTransform=tns['IdentityTransform'],
              inspect=inspect, wraps=functools.wraps, _docstring=doc, mtransforms=transforms)
    ns['mpl'].rcParams.update({'xtick.minor.visible': False, 'ytick.minor.visible': False})

    class FormatterSink(ns['TickHelper']):
        def __init__(self, *args, **kwargs): pass
        def _set_locator(self, value): pass
        def format_ticks(self, values): return [str(float(value)) for value in values]

    for name in ['NullFormatter', 'ScalarFormatter', 'LogFormatterSciNotation']:
        ns[name] = FormatterSink
    # The complete locator is only needed by the original scale default setter.
    source_ticker = ast.parse((root/'ticker.py').read_text())
    sym_locator = next(n for n in source_ticker.body if isinstance(n, ast.ClassDef) and n.name == 'SymmetricalLogLocator')
    exec(compile(ast.Module(body=[sym_locator], type_ignores=[]), str(root/'ticker.py'), 'exec'), ns)
    for name in ['ScaleBase', '_make_axis_parameter_optional', 'LinearScale',
                 'FuncTransform', 'FuncScale', 'LogTransform', 'InvertedLogTransform',
                 'LogScale', 'FuncScaleLog', 'SymmetricalLogTransform',
                 'InvertedSymmetricalLogTransform', 'SymmetricalLogScale']:
        run('scale.py', name)
    ns['_scale_mapping'] = {name: ns[cls] for name, cls in
        [('linear', 'LinearScale'), ('function', 'FuncScale'), ('log', 'LogScale'),
         ('functionlog', 'FuncScaleLog'), ('symlog', 'SymmetricalLogScale')]}
    ns['_scale_has_axis_parameter'] = dict.fromkeys(ns['_scale_mapping'], True)
    factory = run('scale.py', 'scale_factory')
    ns['mscale'] = types.SimpleNamespace(ScaleBase=ns['ScaleBase'], scale_factory=factory)
    set_scale = run('axis.py', 'Axis', '_set_scale')
    set_transforms = run('axes/_base.py', '_AxesBase', '_set_lim_and_transforms')
    update_transforms = run('axes/_base.py', '_AxesBase', '_update_transScale')

    class Tick:
        def __init__(self, kind):
            self.kind = kind
            self.label1 = self.label2 = types.SimpleNamespace(set_text=lambda text: None)
        def update_position(self, value): self.value = value
        def get_loc(self): return self.value

    class Axis(ns['Axis']):
        _set_scale = set_scale
        def __init__(self, axes, name):
            self.axes, self.axis_name = axes, name
            self._major_tick_kw, self._minor_tick_kw = {}, {}
            self.remove_overlapping_locs = True
            self.major = types.SimpleNamespace(locator=None, formatter=FormatterSink())
            self.minor = types.SimpleNamespace(locator=None, formatter=FormatterSink())
        def get_view_interval(self):
            ns['events'].append(self.axes.label + '.view.' + self.axis_name)
            return self.axes.get_xlim() if self.axis_name == 'x' else self.axes.get_ylim()
        def get_major_ticks(self, count): return [Tick('major') for _ in range(count)]
        def get_minor_ticks(self, count): return [Tick('minor') for _ in range(count)]
        def set_major_formatter(self, formatter):
            self.major.formatter = formatter
        def set_minor_formatter(self, formatter):
            self.minor.formatter = formatter

    class Axes:
        _set_lim_and_transforms = set_transforms
        _update_transScale = update_transforms
        def __init__(self, bounds=(40., 60., 400., 300.), label='axes'):
            self.label, self.name = label, 'rectilinear'
            self._axis_names = ['x', 'y']
            self._shared_axes = {'x': ns['Grouper'](), 'y': ns['Grouper']()}
            self._twinned_axes = ns['Grouper']()
            self.bbox = tns['Bbox'].from_bounds(*bounds)
            self._viewLim = tns['Bbox'].from_extents(0., 0., 1., 1.)
            self.xaxis, self.yaxis = Axis(self, 'x'), Axis(self, 'y')
            self._axis_map = {'x': self.xaxis, 'y': self.yaxis}
            self._set_lim_and_transforms()
            self.xaxis._set_scale('linear')
            self.yaxis._set_scale('linear')
            self._update_transScale()
        def set_xscale(self, value, **kwargs):
            self.xaxis._set_scale(value, **kwargs)
            self._update_transScale()
        def set_yscale(self, value, **kwargs):
            self.yaxis._set_scale(value, **kwargs)
            self._update_transScale()
        def get_xlim(self): return tuple(self._viewLim.intervalx)
        def get_ylim(self): return tuple(self._viewLim.intervaly)
        def set_xlim(self, bounds): self._viewLim.intervalx = bounds
        def set_ylim(self, bounds): self._viewLim.intervaly = bounds

    class Secondary(Axes, ns['SecondaryAxis']):
        def __init__(self, parent, orientation):
            super().__init__((40., 360., 400., .001) if orientation == 'x'
                             else (440., 60., .001, 300.))
            self._parent, self._orientation = parent, orientation
            self._functions = (lambda values: 2*values+5, lambda values: (values-5)/2)
            self._parentscale, self._ticks_set = None, False
            self._axis = self.xaxis if orientation == 'x' else self.yaxis
            self._set_scale()
            self._set_lims()
    return ns, tns, Axes, Secondary


def generate(path):
    ns, transforms, Axes, Secondary = load(path)
    cls = ns['SymmetricalLogLocator']
    profiles = [
        ('ordinary base10', 10., 1., 1., [-math.inf, -1e308, -100., -10., -1., -0., 0., 1., 10., 100., 1e308, math.inf, math.nan]),
        ('source default threshold2 and boundary neighbors', 10., 2., 1., [-2.0000000000000004, -2., -1.9999999999999998, -5e-324, -0., 0., 5e-324, 1.9999999999999998, 2., 2.0000000000000004]),
        ('base2 custom linear stretch', 2., .5, 2., [-100., -1., -.5, -0., 0., .5, 1., 100.]),
        ('base e', math.e, 1., 1., [-100., -2., -1., 0., 1., 2., 100.]),
        ('tiny threshold avoids quotient overflow', 10., 1e-308, 1., [-1e308, -1., -1e-308, -5e-324, 0., 5e-324, 1e-308, 1., 1e308]),
        ('huge threshold', 10., 1e308, 1., [-math.inf, -1.7976931348623157e308, -1e308, -1., 0., 1., 1e308, 1.7976931348623157e308, math.inf]),
        ('base nextafter one', math.nextafter(1., 2.), 2., 1., [-1e308, -100., -2., 0., 2., 100., 1e308]),
        ('source accepts infinite base', math.inf, 2., 1., [-math.inf, -10., -2., -0., 0., 2., 10., math.inf, math.nan]),
        ('source accepts NaN base', math.nan, 2., 1., [-10., -2., -0., 0., 2., 10., math.nan]),
        ('source accepts infinite threshold', 10., math.inf, 1., [-math.inf, -1e308, -0., 0., 1e308, math.inf, math.nan]),
        ('source accepts NaN threshold', 10., math.nan, 1., [-10., -0., 0., 10., math.nan]),
        ('source accepts infinite stretch', 10., 2., math.inf, [-math.inf, -10., -0., 0., 10., math.inf, math.nan]),
        ('source accepts NaN stretch', 10., 2., math.nan, [-10., -0., 0., 10., math.nan]),
    ]
    transform_rows = []
    for label, base, threshold, stretch, values in profiles:
        transform = ns['SymmetricalLogTransform'](base, threshold, stretch)
        for inverse in [False, True]:
            active = transform.inverted() if inverse else transform
            actual = active.transform(np.asarray(values, dtype=float))
            transform_rows.append(dict(label=label, base=base, linthresh=threshold, linscale=stretch,
                inverse=inverse, values=values, result=actual.tolist()))

    specs = [
        ('linear raw neighbors', 'linear', (-100., 100.), [-100., -10., -1., 0., 1., 10., 100.], [1., 2.], True),
        ('symlog transformed overlap', 'symlog', (-100., 100.), [-100., -10., -1., 0., 1., 10., 100.], [1., 2.], True),
        ('reversed view', 'symlog', (100., -100.), [100., 10., 1., 0., -1., -10., -100.], [1., 2.], True),
        ('overlap disabled', 'symlog', (-100., 100.), [-100., -10., -1., 0., 1., 10., 100.], [1., 2.], False),
        ('strict simple range returns bounds and zero', 'symlog', (-.8, .8), [0.], [1., 2.], True),
        ('negative and zero subs retain raw order', 'symlog', (-100., 100.), [-10., 0., 10.], [0., 1., -1., 2.], True),
        ('mixed major duplicates retain input order', 'symlog', (-20., 20.), [10., -10., 0., 10.], [1., 2.], True),
        ('positive-only branch retains outer raw decade', 'symlog', (2.1, 40.), [10., 100.], [1., 2., 5.], True),
        ('nearby major removed in transformed span', 'symlog', (-100., 100.), [0., 1.000001, 10.], [1., 2.], True),
        ('log parent uses original clip transform', 'log', (1., 100.), [0., 1., 10., 100.], [0., 1., 2.], True),
        ('infinite span and positive infinite reference major', 'linear', (-math.inf, math.inf), [math.inf], [1.], True, math.inf),
        ('infinite span and negative infinite reference major', 'linear', (-math.inf, math.inf), [-math.inf], [1.], True, math.inf),
        ('infinite span and NaN reference major', 'linear', (-math.inf, math.inf), [math.nan], [1.], True, math.inf),
        ('infinite span and finite reference major', 'linear', (-math.inf, math.inf), [1.], [1.], True, math.inf),
    ]
    axis_rows = []
    for spec in specs:
        label, scale, view, majors, subs, overlap = spec[:6]
        threshold = spec[6] if len(spec) == 7 else 1.
        axes = Axes()
        axes.set_xscale(scale)
        axes.set_xlim(view)
        axis = axes.xaxis
        axis.remove_overlapping_locs = overlap
        axis.set_major_locator(ns['FixedLocator'](majors))
        minor = cls(base=10., linthresh=threshold, subs=np.array(subs))
        axis.set_minor_locator(minor)
        raw = observe(ns, minor)
        filtered = observe(ns, axis.get_minorticklocs)
        visible = axis._update_ticks()
        axis_rows.append(dict(label=label, scale=scale, view=view, majors=majors, subs=subs, overlap=overlap, linthresh=threshold,
            raw=raw, filtered=filtered,
            visible_major=[tick.value for tick in visible if tick.kind == 'major'],
            visible_minor=[tick.value for tick in visible if tick.kind == 'minor']))

    limits_rows = []
    for mode in ['data', 'round_numbers']:
        ns['mpl'].rcParams['axes.autolimit_mode'] = mode
        for view in [(-12., 15.), (15., -12.), (.2, .8), (0., 0.), (1., 1.), (math.nan, math.inf)]:
            locator = cls(base=10., linthresh=1.)
            limits_rows.append(dict(mode=mode, view=view,
                limits=observe(ns, lambda: locator.view_limits(*view)),
                nonsingular=observe(ns, lambda: locator.nonsingular(*view))))
    ns['mpl'].rcParams['axes.autolimit_mode'] = 'data'

    owners = []
    shared = []
    for name in ['x', 'y']:
        first, second = Axes(label='first'), Axes(label='second')
        first_axis, second_axis = first._axis_map[name], second._axis_map[name]
        getattr(first, 'set_'+name+'lim')((-100., 100.))
        getattr(second, 'set_'+name+'lim')((-.5, .5))
        locator = cls(base=10., linthresh=1.)
        stages = []
        first_axis.set_major_locator(locator)
        stages.append(observe(ns, locator))
        external = copy.copy(locator)
        second_axis.set_major_locator(locator)
        stages.append(observe(ns, locator))
        getattr(second, 'set_'+name+'lim')((-10., 10.))
        stages.append(observe(ns, locator))
        stages.append(observe(ns, external))
        owners.append(dict(name=name, stages=stages))

        first, second = Axes(label='first'), Axes(label='second')
        for axes in [first, second]: getattr(axes, 'set_'+name+'lim')((-100., 100.))
        first_axis, second_axis = first._axis_map[name], second._axis_map[name]
        second_axis.major, second_axis.minor = first_axis.major, first_axis.minor
        group = ns['Grouper'](); group.join(second, first)
        first._shared_axes[name] = second._shared_axes[name] = group
        major, minor = cls(base=10., linthresh=1.), cls(base=10., linthresh=1., subs=np.array([1., 2.]))
        second_axis.set_major_locator(major); second_axis.set_minor_locator(minor)
        external_major, external_minor = copy.copy(major), copy.copy(minor)
        before = [observe(ns, major), observe(ns, minor)]
        figure = ns['FigureBase']()
        figure._axobservers = types.SimpleNamespace(process=lambda *args: None)
        figure._root_figure = types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda *args: None))
        figure._remove_axes(second, owners=[[first, second]])
        after = [observe(ns, major), observe(ns, minor)]
        getattr(second, 'set_'+name+'lim')((-.5, .5))
        outside = [observe(ns, external_major), observe(ns, external_minor)]
        shared.append(dict(name=name, before=before, after=after, outside=outside,
            installed_owner=major.axis.axes.label, external_owner=external_major.axis.axes.label))

    secondary_rows = []
    for name in ['x', 'y']:
        for scale in ['symlog', 'log']:
            parent = Axes()
            getattr(parent, 'set_'+name+'scale')(scale)
            view = (-100., 100.) if scale == 'symlog' else (1., 100.)
            getattr(parent, 'set_'+name+'lim')(view)
            child = Secondary(parent, name)
            axis = child._axis
            major, minor = cls(base=10., linthresh=1.), cls(base=10., linthresh=1., subs=np.array([1., 2.]))
            axis.set_major_locator(major); axis.set_minor_locator(minor)
            raw_major, raw_minor = observe(ns, major), observe(ns, minor)
            filtered_minor = observe(ns, axis.get_minorticklocs)
            values = np.array([-215., -195., -95., 5., 105., 205., 225.] if scale == 'symlog'
                              else [5., 7., 25., 105., 205., 225.])
            axis.set_major_locator(ns['FixedLocator'](values)); axis.set_minor_locator(ns['NullLocator']())
            visible = [tick.value for tick in axis._update_ticks()]
            direction = 0 if name == 'x' else 1
            points = np.column_stack((values, np.ones(len(values)))) if direction == 0 else np.column_stack((np.ones(len(values)), values))
            display = (child._xaxis_transform if direction == 0 else child._yaxis_transform).transform(points)[:, direction]
            start, length = (40., 400.) if direction == 0 else (60., 300.)
            secondary_rows.append(dict(name=name, scale=scale, view=view,
                own_view=axis.get_view_interval(), own_scale=axis.get_scale(),
                raw_major=raw_major, raw_minor=raw_minor, filtered_minor=filtered_minor,
                values=values.tolist(), visible=visible,
                normalized=((display-start)/length).tolist(), source_display=display.tolist()))

    late = cls(base=10., linthresh=1.)
    late.set_params(numticks='bad')
    errors = dict(simple_before_consumption=observe(ns, lambda: late.tick_values(-.5, .5)),
                  general_consumes_bad_numticks=observe(ns, lambda: late.tick_values(-100., 100.)))
    late.set_params(numticks=15.)
    errors['recovered_contour_levels'] = observe(ns, lambda: late.tick_values(-100., 100.))

    return dict(source_hashes=HASHES,
        runtime='CPython3.12.14 / NumPy2.3.5 Darwin arm64, exact binary hash validated by committed loader',
        original_bodies=['complete transforms.py AST without imports', 'complete SymmetricalLogLocator AST',
            'original scale classes/constructors/transforms/default setters', 'Axis._set_scale/get_transform/get_scale',
            'Axis.set_major_locator/set_minor_locator/get_minorticklocs/_update_ticks',
            'Grouper and FigureBase._remove_axes', 'SecondaryAxis._set_scale/_set_lims',
            'Axes._set_lim_and_transforms/_update_transScale'],
        fixture_boundaries='Known numeric bboxes, bbox storage setters for already-valid explicit views, formatter/tick notification sinks, matrix-multiply affine C-kernel sink. No full figure layout, path/glyph backend, scale default lifecycle, units or GUI notifications. Source NaN/Inf accepted constructor profiles are exercised through raw Moon Scale fields; Moon factory intentionally keeps stronger finite validation and threshold1 default.',
        numeric_assertions='Direct locator arrays and zero signs stay bit-exact. Derived Scale math/physical display uses relative1e-12 with no absolute floor; NaN and signed infinities are classified explicitly.',
        transforms=transform_rows, axis=axis_rows, limits=limits_rows, owners=owners, shared=shared, secondary=secondary_rows,
        checked_error_source_evidence=errors)


def num(value):
    if isinstance(value, str) and value in ['nan', 'inf', '-inf']:
        return {'nan': '0.0 / 0.0', 'inf': '1.0 / 0.0', '-inf': '-1.0 / 0.0'}[value]
    return moon(float(value))


def arr(values):
    return '[' + ', '.join(num(value) for value in values) + ']'


def numbers_helper(name, strict=False):
    comparison = ('assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64())' if strict else
        'if value.is_inf() || value == 0.0 { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) } else { assert_true(Double::abs(actual[index] - value) <= Double::abs(value) * 1.0e-12) }')
    return f'''///|
fn {name}(actual : Array[Double], expected : Array[Double]) -> Unit raise {{
  assert_eq(actual.length(), expected.length())
  for index, value in expected {{
    if value.is_nan() {{ assert_true(actual[index].is_nan()) }} else {{ {comparison} }}
  }}
}}
'''


def locator(subs=None, threshold=1.):
    return '@ticker.SymmetricalLogLocator::new(base=10.0, linthresh='+num(threshold) + (
        ', subs=Some(@ticker.SymLogSubs::Values(@ticker.TickValues::from_array('+arr(subs)+')))' if subs is not None else '') + ')'


def generated_scale(payload):
    code = '// Original complete forward/inverse SymmetricalLogTransform bodies.\n\n' + numbers_helper('verify_symlog_scale_source')
    for index, row in enumerate(payload['transforms']):
        code += f'\n///|\ntest "SymLog original transform {index}: {row["label"]}" {{\n'
        code += '  let scale = @scale.Scale::SymLog(base='+num(row['base'])+', linthresh='+num(row['linthresh'])+', linscale='+num(row['linscale'])+')\n'
        code += '  let actual = '+arr(row['values'])+'.map(value => scale.'+('inverse' if row['inverse'] else 'transform')+'(value))\n'
        code += '  verify_symlog_scale_source(actual, '+arr(row['result'])+')\n}\n'
    return formatted(code)


def generated_scene(payload):
    code = '// Original SymmetricalLogLocator / Axis binding, raw overlap and view references.\n\n' + numbers_helper('verify_symlog_axis_source', strict=True)
    for index, row in enumerate(payload['axis']):
        code += f'\n///|\ntest "SymLog original Axis raw order and overlap {index}: {row["label"]}" {{\n'
        code += '  let axis = @axis.axis()\n  axis.set_tick_layout(100.0, true)\n'
        if row['scale'] == 'symlog': code += '  axis.set_scale(@scale.symlog_scale(linthresh=2.0))\n'
        elif row['scale'] == 'log': code += '  axis.set_scale(@scale.log_scale())\n'
        code += '  let view = @core.limits('+', '.join(num(v) for v in row['view'])+')\n'
        code += ('  axis.set_limits(view.lower(), view.upper())\n' if all(math.isfinite(v) for v in row['view']) else '  axis.bind_view_interval(() => (view.lower(), view.upper()))\n')
        code += '  axis.set_locator(@ticker.FixedLocator::new('+arr(row['majors'])+').as_locator())\n  let minor = '+locator(row['subs'], row['linthresh'])+'\n  axis.set_minor_locator(minor.as_minor_locator())\n'
        code += '  axis.set_minor_overlap_removal('+str(row['overlap']).lower()+')\n'
        code += '  verify_symlog_axis_source(minor.call(), '+arr(row['raw']['values'])+')\n'
        code += '  verify_symlog_axis_source(axis.minor_tick_values_checked(view), '+arr(row['filtered']['values'])+')\n'
        code += '  verify_symlog_axis_source(axis.tick_values_checked(view), '+arr(row['majors'])+')\n}\n'
    for index, row in enumerate(payload['limits']):
        code += f'\n///|\ntest "SymLog original Axis view and inherited nonsingular {index}" {{\n'
        code += '  let previous = @config.axes_autolimit_mode()\n  defer @config.set_axes_autolimit_mode(previous)\n  @config.set_axes_autolimit_mode('+moon(row['mode'])+')\n'
        code += '  let axis = @axis.axis()\n  axis.set_locator('+locator()+'.as_locator())\n'
        code += '  let bounds = @core.limits('+', '.join(num(v) for v in row['view'])+')\n'
        for key, expression in [('limits', 'axis.view_limits_checked(bounds)'), ('nonsingular', 'axis.numeric_nonsingular_bounds_checked(bounds.lower(), bounds.upper())')]:
            result = row[key]
            if result['error']:
                code += '  assert_true(try { ignore('+expression+'); false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })\n'
            else:
                code += '  { let actual = '+expression+'; verify_symlog_axis_source([actual.lower(), actual.upper()], '+arr(result['values'])+') }\n'
        code += '}\n'
    for row in payload['owners']:
        code += '\n///|\ntest "SymLog original last owner live view and independent copy '+row['name']+'" {\n'
        code += '  let first = @axis.axis()\n  let second = @axis.axis()\n  first.set_limits(-100.0, 100.0)\n  second.set_limits(-0.5, 0.5)\n  let locator = '+locator()+'\n  first.set_locator(locator.as_locator())\n'
        code += '  verify_symlog_axis_source(locator.call(), '+arr(row['stages'][0]['values'])+')\n  let external = locator.copy()\n  second.set_locator(locator.as_locator())\n'
        code += '  verify_symlog_axis_source(locator.call(), '+arr(row['stages'][1]['values'])+')\n  second.set_limits(-10.0, 10.0)\n'
        code += '  verify_symlog_axis_source(locator.call(), '+arr(row['stages'][2]['values'])+')\n  verify_symlog_axis_source(external.call(), '+arr(row['stages'][3]['values'])+')\n}\n'
    for row in payload['shared']:
        name = row['name']
        code += '\n///|\ntest "SymLog original shared major minor deletion and detached copies '+name+'" {\n'
        code += '  let figure = @scene.figure()\n  let axes = figure.subplots(1, 2, share_'+name+'=true)\n  axes[0].set_'+name+'_limits(-100.0, 100.0)\n  let major = '+locator()+'\n  let minor = '+locator([1.,2.])+'\n  axes[1].set_'+name+'_locator(major.as_locator())\n  axes[1].set_'+name+'_minor_locator(minor.as_minor_locator())\n'
        for i, active in enumerate(['major', 'minor']): code += '  verify_symlog_axis_source('+active+'.call(), '+arr(row['before'][i]['values'])+')\n'
        code += '  let external_major = major.copy()\n  let external_minor = minor.copy()\n  axes[1].remove()\n'
        for i, active in enumerate(['major', 'minor']): code += '  verify_symlog_axis_source('+active+'.call(), '+arr(row['after'][i]['values'])+')\n'
        code += '  axes[1].set_'+name+'_limits(-0.5, 0.5)\n'
        for i, active in enumerate(['external_major', 'external_minor']): code += '  verify_symlog_axis_source('+active+'.call(), '+arr(row['outside'][i]['values'])+')\n'
        for i, active in enumerate(['major', 'minor']): code += '  verify_symlog_axis_source('+active+'.call(), '+arr(row['after'][i]['values'])+')\n'
        code += '}\n'
    for index, row in enumerate(payload['secondary']):
        name = row['name']
        code += f'\n///|\ntest "SymLog original secondary own view function and raw overlap {index}" {{\n'
        code += '  let figure = @scene.figure()\n  let axes = figure.axes()\n  axes.set_'+name+'_scale('+('@scale.symlog_scale(linthresh=2.0)' if row['scale']=='symlog' else '@scale.log_scale()')+')\n'
        code += '  axes.set_'+name+'_limits('+', '.join(num(v) for v in row['view'])+')\n  let secondary = axes.secondary_'+name+'axis(value => 2.0 * value + 5.0, value => (value - 5.0) / 2.0)\n'
        code += '  let major = '+locator()+'\n  let minor = '+locator([1.,2.])+'\n  secondary.set_locator(major.as_locator())\n  secondary.set_minor_locator(minor.as_minor_locator())\n'
        code += '  verify_symlog_axis_source(major.call(), '+arr(row['raw_major']['values'])+')\n  verify_symlog_axis_source(minor.call(), '+arr(row['raw_minor']['values'])+')\n'
        code += '  verify_symlog_axis_source(secondary.tick_values_checked(), '+arr(row['raw_major']['values'])+')\n  verify_symlog_axis_source(secondary.minor_tick_values_checked(), '+arr(row['filtered_minor']['values'])+')\n}\n'
    return formatted(code)


def generated_backend(payload):
    code = '// Complete original secondary transform-tree fixed-bbox observations.\n\n' + numbers_helper('verify_symlog_display_source')
    for index, row in enumerate(payload['secondary']):
        horizontal = row['name'] == 'x'
        primary = '@ticker_scale.symlog_scale(linthresh=2.0)' if row['scale'] == 'symlog' else '@ticker_scale.log_scale()'
        code += f'\n///|\ntest "SymLog original secondary normalized position and visibility {index}" {{\n'
        code += '  let primary_scale = '+primary+'\n  let scale : Scale = { xmin: '+num(row['view'][0] if horizontal else 0.)+', xmax: '+num(row['view'][1] if horizontal else 1.)+', ymin: '+num(0. if horizontal else row['view'][0])+', ymax: '+num(1. if horizontal else row['view'][1])+', x_axis_scale: '+('primary_scale' if horizontal else '@ticker_scale.linear_scale()')+', y_axis_scale: '+('@ticker_scale.linear_scale()' if horizontal else 'primary_scale')+' }\n'
        code += '  let secondary = secondary_display_scale(scale, '+str(horizontal).lower()+')\n  let raw_values = '+arr(row['values'])+'\n  let actual : Array[Double] = []\n  let visible : Array[Double] = []\n'
        code += '  for value in raw_values {\n    let primary = (value - 5.0) / 2.0\n    if tick_in_view(primary, secondary.'+('x' if horizontal else 'y')+'_axis_scale, '+num(row['view'][0])+', '+num(row['view'][1])+') {\n      visible.push(value)\n      actual.push('+('map_x(secondary, 40.0, 400.0, primary)' if horizontal else 'map_y(secondary, 60.0, 300.0, primary)')+')\n    }\n  }\n'
        expected = [((40.+400.*n) if horizontal else (60.+300.*(1.-n))) for value, n in zip(row['values'], row['normalized']) if value in row['visible']]
        code += '  assert_eq(visible, '+arr(row['visible'])+')\n  verify_symlog_display_source(actual, '+arr(expected)+')\n}\n'
    for index, row in enumerate(payload['axis']):
        if not all(math.isfinite(value) for value in row['view']): continue
        code += f'\n///|\ntest "SymLog original primary transformed visibility {index}" {{\n'
        code += '  let scale = '+({'linear':'@ticker_scale.linear_scale()', 'log':'@ticker_scale.log_scale()', 'symlog':'@ticker_scale.symlog_scale(linthresh=2.0)'}[row['scale']])+'\n'
        for label, values in [('major', row['majors']), ('minor', row['filtered']['values'])]:
            code += '  let '+label+' = '+arr(values)+'.filter(value => tick_in_view(value, scale, '+', '.join(num(v) for v in row['view'])+'))\n'
            code += '  assert_eq('+label+', '+arr(row['visible_'+label])+')\n'
        code += '}\n'
    return formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('ticker', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    with warnings.catch_warnings(), np.errstate(all='ignore'):
        warnings.simplefilter('ignore', RuntimeWarning)
        payload = generate(args.ticker)
    outputs = {
        ROOT/'testdata/symlog_axis_reference.json': json.dumps(clean(payload), indent=2, allow_nan=False)+'\n',
        ROOT/'ticker/scale/symlog_reference_test.mbt': generated_scale(payload),
        ROOT/'scene/symlog_axis_reference_test.mbt': generated_scene(payload),
        ROOT/'backend/svg/symlog_locator_reference_wbtest.mbt': generated_backend(payload),
    }
    for path, content in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != content: raise SystemExit('reference differs: '+str(path))
        else: path.write_text(content)
    print('SymLog axis:', len(payload['transforms']), 'transform profiles,', len(payload['axis']), 'axis raw/filter/visibility,', len(payload['limits']), 'view profiles,', len(payload['owners']), 'owner traces x4,', len(payload['shared']), 'shared removal x6,', len(payload['secondary']), 'secondary transform trees; generated', sum(content.count('\ntest ') for path,content in outputs.items() if path.suffix=='.mbt'))


if __name__ == '__main__': main()
