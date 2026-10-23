"""Complete original Axes.__clear and limit/share reference for the typed Scene lifecycle.

Numeric context, artist/text/patch/font presentation, Figure ownership and the
unitless conversion boundary are declared host capabilities. No port is used.
"""
from pathlib import Path
import argparse, ast, collections, copy, hashlib, json, math, numbers, sys, types
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'scripts'))
from generate_axis_initial_clear_reference import load
from generate_scale_defaults_reference import moon
from generate_auto_date_reference import formatted

P = ROOT / '.moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py'
ns, BaseAxis = load(P)
SOURCES = {
    'axes/_base.py': 'ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b',
    'axis.py': 'f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0',
    'cbook.py': 'e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643',
    'figure.py': 'b440ab0a5be03cb39b13529a2fec497d2d96deb083e3e56d6220593e3ec567da',
    'gridspec.py': 'df8395306765d9b93f98d6b2e867836a9b2b0786cf5b39a26103309c4331afde',
}
trees = {}
for name, expected in SOURCES.items():
    raw = (P.parent / name).read_bytes()
    if hashlib.sha256(raw).hexdigest() != expected:
        raise ValueError('fixed source differs: ' + name)
    trees[name] = ast.parse(raw)

def original_class(file, name, methods=None):
    node = copy.deepcopy(next(n for n in trees[file].body
                             if isinstance(n, ast.ClassDef) and n.name == name))
    if methods is not None:
        node.bases = []
        node.decorator_list = []
        node.body = [n for n in node.body
                     if isinstance(n, ast.FunctionDef) and n.name in methods]
    exec(compile(ast.Module(body=[node], type_ignores=[]), str(P.parent / file), 'exec'), ns)

ns['collections'] = collections
ns['Real'] = numbers.Real
ns['weakref'] = __import__('weakref')
original_class('cbook.py', 'Grouper')
original_class('cbook.py', '_OrderedSet')
original_class('axes/_base.py', '_AxesBase', {'__clear', 'sharex', 'sharey', '_validate_converted_limits'})
original_class('figure.py', 'FigureBase', {'_remove_axes'})
original_class('gridspec.py', 'GridSpecBase', {'subplots'})

axis_node = next(n for n in trees['axis.py'].body
                 if isinstance(n, ast.ClassDef) and n.name == 'Axis')
for name in ['_set_lim', 'limit_range_for_scale', '_set_autoscale_on', '_get_autoscale_on']:
    node = copy.deepcopy(next(n for n in axis_node.body
                              if isinstance(n, ast.FunctionDef) and n.name == name))
    exec(compile(ast.Module(body=[node], type_ignores=[]), str(P.with_name('axis.py')), 'exec'), ns)
    setattr(BaseAxis, name, ns[name])

class FontSink:
    def __init__(self, **kwargs): self.kwargs = kwargs
    def copy(self): return FontSink(**self.kwargs)

class PatchSink:
    def __init__(self): self.visible = True
    def get_visible(self): return self.visible
    def set_visible(self, value): self.visible = value
    def set_figure(self, value): self.figure = value
    def set_facecolor(self, value): pass
    def set_edgecolor(self, value): pass
    def set_linewidth(self, value): pass
    def set_transform(self, value): pass

ns['font_manager'] = types.SimpleNamespace(FontProperties=FontSink)
ns['_process_plot_var_args'] = lambda *args: types.SimpleNamespace(args=args)
for key, value in [('axes.xmargin', .05), ('axes.ymargin', .05),
                   ('axes.grid.axis', 'both'), ('axes.titlesize', 'large'),
                   ('axes.titleweight', 'normal'), ('axes.titley', None),
                   ('axes.titlepad', 6.)]:
    ns['mpl'].rcParams._set(key, value)

class Axis(BaseAxis):
    def clear(self):
        if hasattr(self.axes, 'events'): self.axes.events.append(['axis.clear', self.axes.index, self.axis_name])
        super().clear()
    def _set_scale(self, value, **kwargs):
        if hasattr(self.axes, 'events'): self.axes.events.append(['axis.scale', self.axes.index, self.axis_name, value])
        super()._set_scale(value, **kwargs)
    def set_minor_locator(self, value):
        if hasattr(self.axes, 'events'): self.axes.events.append(['minor.install', self.axes.index, self.axis_name, type(value).__name__])
        super().set_minor_locator(value)
    def get_minpos(self):
        self.axes.figure.minpos_reads.append([self.axes.index, self.axis_name])
        if self.axes.figure.fail_minpos == (self.axes.index, self.axis_name):
            raise ValueError('late minpos provider failure')
        return super().get_minpos()
    def set_clip_path(self, patch): self.clip_path = patch
    def convert_units(self, value): return value  # Unitless typed numeric inputs.
    def get_figure(self, **kwargs): return self.axes.figure

class Axes(ns['_AxesBase']):
    def __init__(self, figure, index, sharex=None, sharey=None):
        self.figure = figure; self.index = index; self.events = figure.events
        self.axes = self; self.name = 'rectilinear'; self._axis_names = ['x', 'y']
        self._shared_axes = figure.groups; self._twinned_axes = figure.twins
        self._sharex = self._sharey = None
        self._stale_viewlims = {'x': False, 'y': False}
        self.xaxis = Axis('axes' + str(index) + '.x', 'x', axes=self)
        self.yaxis = Axis('axes' + str(index) + '.y', 'y', axes=self)
        self._axis_map = {'x': self.xaxis, 'y': self.yaxis}
        self.callbacks = ns['cbook'].CallbackRegistry(signals=['xlim_changed', 'ylim_changed'])
        self.spines = {name: types.SimpleNamespace(_clear=lambda: None)
                       for name in ['left', 'right', 'top', 'bottom']}
        self.patch = PatchSink(); self._children = []
        self._facecolor = 'white'; self.transAxes = object(); self.child_axes = []
        if sharex is not None: self.sharex(sharex)
        if sharey is not None: self.sharey(sharey)
    def _process_unit_info(self, *args, **kwargs): pass
    def get_figure(self, **kwargs): return self.figure
    def get_xlim(self):
        if self.figure.fail_view == (self.index, 'x'): raise ValueError('late view provider failure')
        return self.xaxis.view
    def get_ylim(self):
        if self.figure.fail_view == (self.index, 'y'): raise ValueError('late view provider failure')
        return self.yaxis.view
    def set_xlim(self, first, last, *, emit=True, auto=False):
        return self.xaxis._set_lim(first, last, emit=emit, auto=auto)
    def set_ylim(self, first, last, *, emit=True, auto=False):
        return self.yaxis._set_lim(first, last, emit=emit, auto=auto)
    def get_autoscalex_on(self): return self.xaxis._get_autoscale_on()
    def get_autoscaley_on(self): return self.yaxis._get_autoscale_on()
    def _update_transScale(self): self.events.append(['transform', self.index])
    def grid(self, *args, **kwargs): pass
    def _set_title_offset_trans(self, points): pass
    def _set_artist_props(self, artist): pass
    def _gen_axes_patch(self): return PatchSink()
    def set_axis_on(self): pass
    def _label_outer_xaxis(self, **kwargs): pass
    def _label_outer_yaxis(self, **kwargs): pass

class Figure(ns['FigureBase']):
    def __init__(self):
        self.groups = {name: ns['Grouper']() for name in ['x', 'y']}
        self.twins = ns['Grouper'](); self.events = []
        self._axobservers = types.SimpleNamespace(process=lambda *args: None)
        self._root_figure = types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda *args: None))
        self.minpos_reads = []
        self.fail_minpos = None
        self.fail_view = None
        self.created = []
        self.active = []
    def add_subplot(self, spec, **kwargs):
        axes = Axes(self, len(self.created), **kwargs)
        self.created.append(axes); self.active.append(axes)
        return axes

class Grid(ns['GridSpecBase']):
    def __init__(self, figure, rows, columns):
        self.figure = figure; self._nrows = rows; self._ncols = columns
    def __getitem__(self, index): return index

def describe(axes, figure, active):
    rows = []
    for a in axes:
        coordinates = {}
        for name, axis in a._axis_map.items():
            coordinates[name] = {
                'geometry': axis.get_scale(), 'view': list(axis.view),
                'auto': axis._get_autoscale_on(),
                'classes': [type(v).__name__ for v in [axis.major.locator, axis.minor.locator,
                                                      axis.major.formatter, axis.minor.formatter]],
                'flags': [axis.isDefault_majloc, axis.isDefault_minloc,
                          axis.isDefault_majfmt, axis.isDefault_minfmt],
                'owners': [v.axis.axes.index for v in [axis.major.locator, axis.minor.locator,
                                                       axis.major.formatter, axis.minor.formatter]],
                'group': [v.index for v in figure.groups[name].get_siblings(a)],
                'share_target': None if getattr(a, '_share' + name) is None else getattr(a, '_share' + name).index,
                'shared_handles_with_first': [v is reference for v, reference in zip(
                    [axis.major.locator, axis.minor.locator, axis.major.formatter, axis.minor.formatter],
                    [axes[0]._axis_map[name].major.locator, axes[0]._axis_map[name].minor.locator,
                     axes[0]._axis_map[name].major.formatter, axes[0]._axis_map[name].minor.formatter])],
            }
        rows.append({'index': a.index, 'active': a in active,
                     'children': len(a._children), 'coordinates': coordinates})
    return rows


def make_graph(visible, *, shared=True, initial_log=True, descending=False, entry='grid'):
    rc = ns['mpl'].rcParams
    rc['xtick.minor.visible'], rc['ytick.minor.visible'] = visible
    figure = Figure()
    if entry == 'grid':
        mode = 'all' if shared else 'none'
        axes = list(Grid(figure, 1, 3 if shared else 1).subplots(
            sharex=mode, sharey=mode, squeeze=False).flat)
    else:
        axes = [figure.add_subplot(None)]
    # This is the final original Axes construction phase; the full graphical
    # Axes.__init__ body is not claimed by these typed allocation projections.
    if not initial_log:
        for axis in axes: axis._AxesBase__clear()
    else:
        for axis in axes:
            for name, item in axis._axis_map.items():
                item._set_scale('log')
                item.view = (20., 10.) if descending else (10., 20.)
                if name == 'y': item.view = (40., 30.) if descending else (30., 40.)
                item._autoscale_on = False
            axis._children = [types.SimpleNamespace(_remove_method=object(), _parent_figure=figure, axes=axis)]
    return figure, axes


def observe_case(visible, removed, requester, *, descending=False, repeats=1,
                 fail_minpos=None, fail_view=None, entry='grid', aggregate=None):
    figure, axes = make_graph(visible, descending=descending, entry=entry,
                              initial_log=entry == 'grid')
    if removed is not None:
        figure._remove_axes(axes[removed], owners=[figure.active])
        axes[removed].xaxis.view = (200., 100.) if descending else (100., 200.)
        axes[removed].yaxis.view = (400., 300.) if descending else (300., 400.)
    before = describe(axes, figure, figure.active)
    figure.fail_minpos = fail_minpos; figure.fail_view = fail_view
    figure.events.clear(); figure.minpos_reads.clear()
    error = None
    try:
        if aggregate is not None:
            # Figure/SubFigure retain-panel convenience: execute actual source
            # Axes.__clear exactly once per selected unique active panel.
            for axis in axes: axis._AxesBase__clear()
        else:
            for _ in range(repeats): axes[requester]._AxesBase__clear()
    except Exception as exc:
        error = {'type': type(exc).__name__, 'message': str(exc)}
    return {'visible': list(visible), 'removed': removed, 'requester': requester,
            'descending': descending, 'repeats': repeats,
            'fail_minpos': fail_minpos, 'fail_view': fail_view,
            'entry': entry, 'aggregate': aggregate, 'before': before,
            'after': describe(axes, figure, figure.active), 'error': error,
            'minpos_reads': [str(i) + '.' + name for i, name in figure.minpos_reads],
            'events': copy.deepcopy(figure.events)}


def collect():
    cases = []
    for visible in [(False, False), (True, True), (True, False), (False, True)]:
        for removed in [None, 0, 1]:
            for requester in range(3):
                cases.append(observe_case(visible, removed, requester))
    for requester in [0, 1, 2]:
        cases.append(observe_case((True, False), None, requester, descending=True))
    cases.append(observe_case((False, True), 0, 1, descending=True))
    for requester in [0, 1]:
        cases.append(observe_case((True, True), 0, requester, repeats=2))
    for bad in [(0, 'x'), (1, 'x'), (0, 'y')]:
        cases.append(observe_case((True, False), None, 0, fail_minpos=bad))
    for bad in [(0, 'x'), (0, 'y')]:
        cases.append(observe_case((True, True), 0, 1, fail_view=bad))
    for entry in ['default', 'add_axes', 'add_subplot']:
        cases.append(observe_case((False, True), None, 0, entry=entry))
    for aggregate in ['Figure', 'SubFigure']:
        cases.append(observe_case((True, True), None, 0, aggregate=aggregate))
    for descending in [False, True]:
        case = observe_case((True, True), 0, 1, descending=descending)
        case['builtin_views'] = True
        cases.append(case)
    for index, case in enumerate(cases): case['id'] = index
    return {'source_hashes': {**ns['source_hashes'], **SOURCES},
            'numpy_binary_sha256': hashlib.sha256(Path(np._core._multiarray_umath.__file__).read_bytes()).hexdigest(),
            'cases': cases, 'counts': {'cases': len(cases), 'registered_groups': math.ceil(len(cases) / 32),
                'complete_axes_clear_calls': sum(3 if c['aggregate'] else c['repeats'] for c in cases)},
            'scope': 'Complete original Axes.__clear, Axis constructor/clear/_set_lim, sharex/y, Grouper, GridSpec.subplots and Figure.remove; controlled unitless numeric views and presentation sinks. Figure/SubFigure are explicit retain-panel once-per-Axes convenience projections, not original Figure.clear deletion. Allocation entries project actual Axis initialization plus the final original Axes.__clear stage, not full graphical Axes.__init__.'}


HEADER = '''// Generated by scripts/generate_axes_clear_reference.py; do not edit.

///|
fn axes_clear_axis(panel : Axes, horizontal : Bool) -> @axis.Axis {
  if horizontal { panel.state.val.x_axis } else { panel.state.val.y_axis }
}

///|
fn axes_clear_major_class(value : @ticker.Locator) -> String {
  match value {
    @ticker.Locator::NamedAuto(_) => "AutoLocator"
    @ticker.Locator::NamedLog(_) => "LogLocator"
    _ => "unexpected"
  }
}

///|
fn axes_clear_minor_class(value : @ticker.MinorLocator) -> String {
  match value {
    @ticker.MinorLocator::Null(_) => "NullLocator"
    @ticker.MinorLocator::NamedAutoMinor(_) => "AutoMinorLocator"
    @ticker.MinorLocator::NamedLog(_) => "LogLocator"
    _ => "unexpected"
  }
}

///|
fn axes_clear_same_major(left : @ticker.Locator, right : @ticker.Locator) -> Bool {
  match (left, right) {
    (@ticker.Locator::NamedAuto(first), @ticker.Locator::NamedAuto(second)) => physical_equal(first, second)
    (@ticker.Locator::NamedLog(first), @ticker.Locator::NamedLog(second)) => physical_equal(first, second)
    _ => false
  }
}

///|
fn axes_clear_same_minor(left : @ticker.MinorLocator, right : @ticker.MinorLocator) -> Bool {
  match (left, right) {
    (@ticker.MinorLocator::Null(first), @ticker.MinorLocator::Null(second)) => physical_equal(first, second)
    (@ticker.MinorLocator::NamedAutoMinor(first), @ticker.MinorLocator::NamedAutoMinor(second)) => physical_equal(first, second)
    (@ticker.MinorLocator::NamedLog(first), @ticker.MinorLocator::NamedLog(second)) => physical_equal(first, second)
    _ => false
  }
}

///|
fn axes_clear_formatter_class(value : @ticker.BaseFormatter) -> String {
  if value.scalar_formatter() is Some(_) { "ScalarFormatter" }
  else if value.log_formatter_sci_notation() is Some(_) { "LogFormatterSciNotation" }
  else if value.null_formatter() is Some(_) { "NullFormatter" }
  else { "unexpected" }
}

///|
fn axes_clear_geometry(value : @axis.Axis) -> String {
  if value.scale().is_log() { "log" } else { "linear" }
}

///|
fn axes_clear_group_indices(panel : Axes, panels : Array[Axes], horizontal : Bool) -> Array[Int] {
  let states = if horizontal { panel.x_group_states() } else { panel.y_group_states() }
  states.map(state => {
    let mut found = -1
    for index, item in panels {
      if physical_equal(state, item.state) { found = index }
    }
    found
  })
}

///|
fn axes_clear_bind_stored_views(panels : Array[Axes]) -> Unit {
  for panel in panels {
    for horizontal in [true, false] {
      let axis = axes_clear_axis(panel, horizontal)
      axis.bind_view_interval(() => {
        let view = axis.current_view_limits().unwrap_or(@core.limits(0.0, 1.0))
        (view.lower(), view.upper())
      })
    }
  }
}

///|
fn axes_clear_locator_view(value : @ticker.Locator) -> (Double, Double) raise @core.DataError {
  match value {
    @ticker.Locator::NamedAuto(value) => value.view_interval_provider().unwrap()()
    @ticker.Locator::NamedLog(value) => value.view_interval_provider().unwrap()()
    _ => (0.0 / 0.0, 0.0 / 0.0)
  }
}

///|
fn axes_clear_minor_view(value : @ticker.MinorLocator) -> (Double, Double) raise @core.DataError {
  match value {
    @ticker.MinorLocator::NamedAutoMinor(value) => value.view_interval_provider().unwrap()()
    @ticker.MinorLocator::NamedLog(value) => value.view_interval_provider().unwrap()()
    _ => (0.0 / 0.0, 0.0 / 0.0)
  }
}

///|
priv struct AxesClearCoordinate {
  geometry : String
  lower : Double
  upper : Double
  automatic : Bool
  group : Array[Int]
  classes : Array[String]
  flags : Array[Bool]
  owners : Array[Int]
  shared : Array[Bool]
  target : Int
}

///|
priv struct AxesClearPanel {
  active : Bool
  children : Int
  x : AxesClearCoordinate
  y : AxesClearCoordinate
}

///|
fn axes_clear_check_coordinate(
  panel : Axes,
  panels : Array[Axes],
  horizontal : Bool,
  expected : AxesClearCoordinate,
) -> Unit raise {
  let axis = axes_clear_axis(panel, horizontal)
  let first = axes_clear_axis(panels[0], horizontal)
  assert_eq(axes_clear_geometry(axis), expected.geometry)
  assert_eq(axis.current_view_limits().map(v => [v.lower(), v.upper()]), Some([expected.lower, expected.upper]))
  assert_eq(axis.limits() is None, expected.automatic)
  assert_eq(axes_clear_group_indices(panel, panels, horizontal), expected.group)
  assert_eq([
    axes_clear_major_class(axis.locator().unwrap()),
    axes_clear_minor_class(axis.minor_locator().unwrap()),
    axes_clear_formatter_class(axis.named_formatter().unwrap()),
    axes_clear_formatter_class(axis.minor_named_formatter().unwrap()),
  ], expected.classes)
  assert_eq([
    axis.is_default_locator(), axis.is_default_locator(minor=true),
    axis.is_default_formatter(), axis.is_default_formatter(minor=true),
  ], expected.flags)
  assert_eq(axis.named_formatter().unwrap().axis(), Some(axes_clear_axis(panels[expected.owners[2]], horizontal).formatter_axis_binding()))
  assert_eq(axis.minor_named_formatter().unwrap().axis(), Some(axes_clear_axis(panels[expected.owners[3]], horizontal).formatter_axis_binding()))
  assert_eq([
    axes_clear_same_major(axis.locator().unwrap(), first.locator().unwrap()),
    axes_clear_same_minor(axis.minor_locator().unwrap(), first.minor_locator().unwrap()),
    physical_equal(axis.named_formatter().unwrap(), first.named_formatter().unwrap()),
    physical_equal(axis.minor_named_formatter().unwrap(), first.minor_named_formatter().unwrap()),
  ], expected.shared)
  let target = if horizontal { panel.state.val.share_x_target } else { panel.state.val.share_y_target }
  if expected.target < 0 { assert_true(target is None) }
  else { assert_true(physical_equal(target.unwrap(), panels[expected.target].state)) }
}

///|
fn axes_clear_check(
  fig : Figure,
  panels : Array[Axes],
  reads : Array[String],
  expected_reads : Array[String],
  expected : Array[AxesClearPanel],
) -> Unit raise {
  assert_eq(fig.axes_list().length(), expected.filter(row => row.active).length())
  assert_eq(reads, expected_reads)
  for index, row in expected {
    let panel = panels[index]
    assert_eq(panel.is_attached(), row.active)
    assert_eq(panel.state.val.artists.length(), row.children)
    axes_clear_check_coordinate(panel, panels, true, row.x)
    axes_clear_check_coordinate(panel, panels, false, row.y)
  }
  // Public provider witness disambiguates retained locator owners after all
  // source view assertions, including owners outside current Figure membership.
  for index, panel in panels {
    panel.state.val.x_axis.bind_view_interval(() => (index.to_double() + 2.0, index.to_double() + 3.0))
    panel.state.val.y_axis.bind_view_interval(() => (index.to_double() + 12.0, index.to_double() + 13.0))
  }
  for index, row in expected {
    for horizontal in [true, false] {
      let axis = axes_clear_axis(panels[index], horizontal)
      let state = if horizontal { row.x } else { row.y }
      let addition = if horizontal { 2.0 } else { 12.0 }
      assert_eq(axes_clear_locator_view(axis.locator().unwrap()), (state.owners[0].to_double() + addition, state.owners[0].to_double() + addition + 1.0))
      if state.classes[1] != "NullLocator" {
        assert_eq(axes_clear_minor_view(axis.minor_locator().unwrap()), (state.owners[1].to_double() + addition, state.owners[1].to_double() + addition + 1.0))
      }
    }
  }
}
'''


def setup_moon(case):
    out = ['  let old_x = @config.minor_ticks_visible(horizontal=true)',
           '  let old_y = @config.minor_ticks_visible(horizontal=false)',
           '  defer { @config.set_minor_ticks_visible(old_x, horizontal=true); @config.set_minor_ticks_visible(old_y, horizontal=false) }',
           '  @config.set_minor_ticks_visible(' + moon(case['visible'][0]) + ', horizontal=true)',
           '  @config.set_minor_ticks_visible(' + moon(case['visible'][1]) + ', horizontal=false)',
           '  let fig = figure(width=400, height=300)']
    if case['aggregate'] == 'SubFigure':
        out += ['  let outer = fig.grid_spec(1, 1)',
                '  let sub = fig.add_subfigure(outer.cell_spec(0, 0))',
                '  let nested = sub.add_subfigure(outer.cell_spec(0, 0))',
                '  let grid = fig.grid_spec(1, 3)',
                '  let panels = nested.subplots_with_grid(grid.with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All))']
    elif case['entry'] == 'grid':
        out += ['  let panels = fig.subplots(1, 3, share_x=true, share_y=true)']
    elif case['entry'] == 'default':
        out += ['  let panels = [fig.axes()]']
    elif case['entry'] == 'add_axes':
        out += ['  let panels = [fig.add_axes(0.1, 0.1, 0.8, 0.8)]']
    else:
        out += ['  let grid = fig.grid_spec(1, 1)', '  let panels = [fig.add_subplot(grid.cell_spec(0, 0))]']
    if case['entry'] == 'grid':
        xv = [20., 10.] if case['descending'] else [10., 20.]
        yv = [40., 30.] if case['descending'] else [30., 40.]
        out += ['  for panel in panels {',
                '    panel.state.val.x_axis.set_scale(@scale.log_scale())',
                '    panel.state.val.y_axis.set_scale(@scale.log_scale())',
                '    panel.state.val.x_axis.set_limits(' + ', '.join(moon(v) for v in xv) + ')',
                '    panel.state.val.y_axis.set_limits(' + ', '.join(moon(v) for v in yv) + ')',
                '    panel.plot([10.0, 20.0], [30.0, 40.0])', '  }']
    if case['removed'] is not None:
        index = case['removed']; xv = [200., 100.] if case['descending'] else [100., 200.]
        yv = [400., 300.] if case['descending'] else [300., 400.]
        out += ['  panels[' + str(index) + '].remove()',
                '  panels[' + str(index) + '].state.val.x_axis.set_limits(' + ', '.join(moon(v) for v in xv) + ')',
                '  panels[' + str(index) + '].state.val.y_axis.set_limits(' + ', '.join(moon(v) for v in yv) + ')']
    if not case.get('builtin_views', False):
        out += ['  axes_clear_bind_stored_views(panels)']
    out += ['  let reads : Array[String] = []',
            '  for index, panel in panels {',
            '    panel.state.val.x_axis.bind_minpos(() => { reads.push(index.to_string() + ".x"); 0.001 })',
            '    panel.state.val.y_axis.bind_minpos(() => { reads.push(index.to_string() + ".y"); 0.001 })', '  }']
    for key, method, message, result in [('fail_minpos', 'bind_minpos', 'late minpos provider failure', 'Double'),
                                        ('fail_view', 'bind_view_interval', 'late view provider failure', '(Double, Double)')]:
        if case[key] is not None:
            index, name = case[key]
            body = 'reads.push(' + moon(str(index) + '.' + name) + '); ' if key == 'fail_minpos' else ''
            out += ['  panels[' + str(index) + '].state.val.' + name + '_axis.' + method + '(fn() -> ' + result + ' raise @core.DataError { ' + body + 'raise @core.DataError::InvalidTicks(message=' + moon(message) + ') })']
    return '\n'.join(out) + '\n'


def checks(case):
    out = ['  let expected : Array[AxesClearPanel] = [']
    for row in case['after']:
        out += ['    { active: ' + moon(row['active']) + ', children: ' + str(row['children']) + ',']
        for name in ['x', 'y']:
            state = row['coordinates'][name]
            fields = ['geometry: ' + moon(state['geometry']),
                      'lower: ' + moon(state['view'][0]), 'upper: ' + moon(state['view'][1]),
                      'automatic: ' + moon(state['auto']), 'group: ' + moon(state['group']),
                      'classes: ' + moon(state['classes']), 'flags: ' + moon(state['flags']),
                      'owners: ' + moon(state['owners']), 'shared: ' + moon(state['shared_handles_with_first']),
                      'target: ' + str(-1 if state['share_target'] is None else state['share_target'])]
            out += ['      ' + name + ': { ' + ', '.join(fields) + ' },']
        out += ['    },']
    out += ['  ]', '  axes_clear_check(fig, panels, reads, ' + moon(case['minpos_reads']) + ', expected)']
    return '\n'.join(out) + '\n'


def render(payload):
    code = HEADER
    for case in payload['cases']:
        code += '\n///|\nfn axes_clear_source_case_' + str(case['id']) + '() -> Unit raise {\n'
        code += setup_moon(case)
        call = ('fig.clear_checked()' if case['aggregate'] == 'Figure' else
                'sub.clear_checked()' if case['aggregate'] == 'SubFigure' else
                'panels[' + str(case['requester']) + '].clear_checked()')
        if case['error'] is None:
            for _ in range(case['repeats'] if case['aggregate'] is None else 1): code += '  ' + call + '\n'
        else:
            code += '  let raised = try { ' + call + '; false } catch {\n'
            code += '    @core.DataError::InvalidTicks(message~) => message == ' + moon(case['error']['message']) + '\n    _ => false\n  }\n  assert_true(raised)\n'
        code += checks(case) + '}\n'
    for offset in range(0, len(payload['cases']), 32):
        code += '\n///|\ntest "original Axes clear lifecycle group ' + str(offset // 32) + '" {\n'
        for case in payload['cases'][offset:offset + 32]:
            code += '  axes_clear_source_case_' + str(case['id']) + '()\n'
        code += '}\n'
    return formatted(code)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true'); args = parser.parse_args()
    payload = collect()
    raw = json.dumps(payload, indent=2, allow_nan=False) + '\n'
    outputs = {ROOT / 'testdata/axes_clear_reference.json': raw,
               ROOT / 'scene/axes_clear_reference_wbtest.mbt': render(payload)}
    for path, content in outputs.items():
        if args.check:
            if path.read_text() != content: raise SystemExit('axes clear reference differs: ' + str(path))
        else: path.write_text(content)
    print(json.dumps({**payload['counts'], 'errors': sum(c['error'] is not None for c in payload['cases']),
                      'json_sha256': hashlib.sha256(raw.encode()).hexdigest(), 'check': args.check}))


if __name__ == '__main__': main()
