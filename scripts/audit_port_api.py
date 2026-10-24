#!/usr/bin/env python3
"""Reproducible *API attachment* audit, not a Python semantic coverage claim.

Reads the 41 tracked interfaces without invoking Moon. Curated correspondence
rules below identify source APIs; AST resolution checks that candidate methods
actually exist and follows inheritance. The independent upstream inventory is
joined by canonical IDs/aliases/definition locations, never by bare name alone.
Root/pyplot/Figure forwarding, dtype bridges and as_* adapters cannot multiply
the numerator. Source references support scoped verification, not full domains.
"""
from __future__ import annotations

import argparse
import ast
import collections
import hashlib
import json
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_SOURCE = ROOT / '.moonagent/audits/2026-10-24/matplotlib-d3ca9172e392048ec242b90e8423e88d1a3000b2'
OUTPUT = ROOT / 'testdata/port_api_mapping.json'
SCHEMA = 'mathplotlib.port-api-mapping.v1'
PORT_BASELINE = 'f742c79e36a1b749e863e53668b69532b39321d5'
STATUS_SCORES = {
    'verified scoped': (0.75, 0.75),
    'partial prototype': (0.5, 0.5),
    'thin payload or convenience': (0.25, 0.25),
    'unverified': (0.0, 0.5),
    'absent': (0.0, 0.0),
}

# These source-backed families can receive scoped 0.75 verification. Full-
# contract 1 is reserved for the individually justified query exceptions in
# apply_breadth. The guides state input/math/source and host limitations.
TICKER_GUIDES = {
    'MultipleLocator': 'multiple_locator',
    'IndexLocator': 'named_numeric_locator', 'FixedLocator': 'named_numeric_locator',
    'LinearLocator': 'named_numeric_locator',
    'MaxNLocator': 'maxn_locator', 'AutoLocator': 'maxn_locator',
    'AutoMinorLocator': 'auto_minor_locator', 'NullLocator': 'auto_minor_locator',
    'LogLocator': 'log_locator', 'SymmetricalLogLocator': 'symlog_locator',
    'AsinhLocator': 'asinh_locator', 'LogitLocator': 'logit_locator',
    'BaseFormatter': 'basic_formatter', 'NullFormatter': 'basic_formatter',
    'FixedFormatter': 'basic_formatter', 'FuncFormatter': 'basic_formatter',
    'FormatStrFormatter': 'string_formatter', 'StrMethodFormatter': 'string_formatter',
    'PercentFormatter': 'percent_formatter', 'ScalarFormatter': 'scalar_formatter',
    'EngFormatter': 'eng_formatter', 'LogFormatter': 'log_formatter',
    'LogFormatterExponent': 'log_formatter', 'LogFormatterMathtext': 'log_formatter',
    'LogFormatterSciNotation': 'log_formatter', 'LogitFormatter': 'logit_formatter',
}
DATE_CLASSES = {
    'AutoDateLocator', 'AutoDateFormatter', 'ConciseDateFormatter', 'DateFormatter',
    'DateConverter', 'ConciseDateConverter', 'RRuleLocator', 'YearLocator',
    'MonthLocator', 'DayLocator', 'WeekdayLocator', 'HourLocator', 'MinuteLocator',
    'SecondLocator', 'MicrosecondLocator', 'DateLocator',
}
DATE_GUIDES = {
    'AutoDateLocator': 'auto_locator', 'AutoDateFormatter': 'auto_date',
    'ConciseDateFormatter': 'concise_date', 'DateFormatter': 'date_format',
    'DateConverter': 'date_converter', 'ConciseDateConverter': 'date_converter',
    'RRuleWrapper': 'rrule_wrapper', 'RRuleLocator': 'rrule_wrapper',
    'YearLocator': 'year_locator', 'MicrosecondLocator': 'microsecond_locator',
}
CLASS_TARGETS = {
    ('scene', 'Axes'): 'matplotlib.axes.Axes',
    ('scene', 'Figure'): 'matplotlib.figure.Figure',
    ('scene', 'SubFigure'): 'matplotlib.figure.SubFigure',
    ('scene', 'SecondaryAxis'): 'matplotlib.axes._secondary_axes.SecondaryAxis',
    ('scene', 'Line2D'): 'matplotlib.lines.Line2D',
    ('scene', 'Spine'): 'matplotlib.spines.Spine',
    ('scene', 'PathCollection'): 'matplotlib.collections.PathCollection',
    ('scene', 'ContourSet'): 'matplotlib.contour.ContourSet',
    ('scene', 'StreamplotSet'): 'matplotlib.streamplot.StreamplotSet',
    ('scene', 'Table'): 'matplotlib.table.Table',
    ('scene', 'TableCell'): 'matplotlib.table.Cell',
    ('scene', 'Triangulation'): 'matplotlib.tri.Triangulation',
    ('scene', 'TriFinder'): 'matplotlib.tri.TrapezoidMapTriFinder',
    ('scene', 'Container'): 'matplotlib.container.Container',
    ('scene/axis', 'Axis'): 'matplotlib.axis.Axis',
    ('scene/axis', 'CategoryUnits'): 'matplotlib.category.UnitData',
    ('scene/gridspec', 'GridSpec'): 'matplotlib.gridspec.GridSpec',
    ('scene/gridspec', 'SubplotSpec'): 'matplotlib.gridspec.SubplotSpec',
    ('scene/colorbar', 'Colorbar'): 'matplotlib.colorbar.Colorbar',
    ('transforms', 'Affine2D'): 'matplotlib.transforms.Affine2D',
    ('transforms', 'BBox'): 'matplotlib.transforms.Bbox',
    ('transforms', 'Transform2D'): 'matplotlib.transforms.Transform',
    ('transforms', 'Path'): 'matplotlib.path.Path',
    ('transforms', 'BezierSegment'): 'matplotlib.bezier.BezierSegment',
    ('config', 'RcParams'): 'matplotlib.RcParams',
}
for name in TICKER_GUIDES:
    CLASS_TARGETS['ticker', name] = 'matplotlib.ticker.' + ('Formatter' if name == 'BaseFormatter' else name)
for name in DATE_CLASSES:
    CLASS_TARGETS['ticker/date', name] = 'matplotlib.dates.' + name
CLASS_TARGETS['ticker/date', 'RRuleWrapper'] = 'matplotlib.dates.rrulewrapper'
for name in ['Normalize', 'LogNorm', 'SymLogNorm', 'TwoSlopeNorm', 'PowerNorm', 'CenteredNorm', 'BoundaryNorm']:
    CLASS_TARGETS['core/colors', name] = 'matplotlib.colors.' + name
CLASS_TARGETS['core/colors', 'ColorMap'] = 'matplotlib.colors.Colormap'

# These source class aliases are definition lookup only, not numerator entries.
SOURCE_CLASS_ALIASES = {
    'matplotlib.axes.Axes': 'matplotlib.axes._axes.Axes',
    'matplotlib.tri.Triangulation': 'matplotlib.tri._triangulation.Triangulation',
    'matplotlib.tri.TrapezoidMapTriFinder': 'matplotlib.tri._trifinder.TrapezoidMapTriFinder',
}
TICKER_METHODS = {
    'call': '__call__', 'call_value': '__call__', 'call_key': '__call__',
    'new': '__init__', 'from_list': '__init__', 'from_view': '__init__',
    'format_ticks_view': 'format_ticks', 'format_ticks_integers': 'format_ticks',
    'format_ticks_keys': 'format_ticks', 'format_data_value': 'format_data',
    'format_data_key': 'format_data', 'format_data_short_value': 'format_data_short',
    'format_data_short_masked': 'format_data_short', 'set_locs_view': 'set_locs',
    'set_locs_keys': 'set_locs', 'set_locs_checked': 'set_locs',
    'set_locs_view_checked': 'set_locs', 'set_locs_integers_checked': 'set_locs',
    'get_offset_checked': 'get_offset',
    'get_use_offset': 'get_useOffset', 'set_use_offset': 'set_useOffset',
    'get_use_locale': 'get_useLocale', 'set_use_locale': 'set_useLocale',
    'get_use_math_text': 'get_useMathText', 'set_use_math_text': 'set_useMathText',
    'format_eng_value': 'format_eng',
}
DATE_METHODS = {
    'new': '__init__', 'format_value': '__call__', 'format_values': 'format_ticks',
    'format_array': 'format_ticks', 'format_dates': 'format_ticks',
    'format_ticks': 'format_ticks', 'unit_scale': '_get_unit',
    'convert_value': 'convert', 'default_unit': 'default_units',
    'get_locator_for_range': 'get_locator',
    'format': '__call__', 'tick_values_checked': 'tick_values',
}
SCENE_METHODS = {
    'get_xlim_checked': 'get_xlim', 'get_ylim_checked': 'get_ylim',
    'clear_checked': 'clear', 'relim_checked': 'relim',
    'line': 'plot', 'plot_line': 'plot', 'plot_category': 'plot',
    'plot_category_y': 'plot', 'plot_date_units': 'plot', 'plot_masked': 'plot',
    'set_x_limits': 'set_xlim', 'set_y_limits': 'set_ylim',
    'set_x_label': 'set_xlabel', 'set_y_label': 'set_ylabel',
    'set_x_scale': 'set_xscale', 'set_y_scale': 'set_yscale',
    'set_x_margin': 'set_xmargin', 'set_y_margin': 'set_ymargin',
    'set_x_ticks': 'set_xticks', 'set_y_ticks': 'set_yticks',
    'set_x_tick_labels': 'set_xticklabels', 'set_y_tick_labels': 'set_yticklabels',
    'set_aspect_equal': 'set_aspect', 'set_aspect_auto': 'set_aspect',
    'rect': 'get_position', 'reset_position': 'reset_position',
    'xaxis_date': 'xaxis_date', 'yaxis_date': 'yaxis_date',
}
AXIS_METHODS = {
    'axis': '__init__', 'clear': 'clear', 'set_locator': 'set_major_locator',
    'set_named_formatter': 'set_major_formatter', 'set_formatter': 'set_major_formatter',
    'set_minor_named_formatter': 'set_minor_formatter',
    'set_date_locator': 'set_major_locator', 'set_date_formatter': 'set_major_formatter',
    'set_minor_date_locator': 'set_minor_locator', 'set_minor_date_formatter': 'set_minor_formatter',
    'locator': 'get_major_locator', 'named_formatter': 'get_major_formatter',
    'date_locator': 'get_major_locator', 'date_formatter': 'get_major_formatter',
    'minor_locator': 'get_minor_locator', 'minor_named_formatter': 'get_minor_formatter',
    'minor_date_locator': 'get_minor_locator', 'minor_date_formatter': 'get_minor_formatter',
    'tick_values_checked': 'get_majorticklocs', 'tick_values': 'get_majorticklocs',
    'minor_tick_values_checked': 'get_minorticklocs', 'minor_tick_values': 'get_minorticklocs',
    'set_source_ticks': 'set_ticks', 'set_scale': '_set_scale',
    'set_tick_labels': 'set_ticklabels', 'tick_labels_checked': 'get_majorticklabels',
    'minor_tick_labels_checked': 'get_minorticklabels', 'set_unit_tag': 'set_units',
    'update_date_units': 'update_units', 'update_category_units': 'update_units',
    'convert_date_units': 'convert_units', 'convert_category_units': 'convert_units',
    'update_unit_axisinfo': '_update_axisinfo', 'have_units': 'have_units',
    'get_minpos': 'get_minpos', 'get_tick_space': 'get_tick_space',
    'view_interval_checked': 'get_view_interval', 'data_interval': 'get_data_interval',
    'set_view_limits': 'set_view_interval', 'set_label': 'set_label_text',
    'set_tick_position': 'set_ticks_position', 'set_minor_overlap_removal': 'remove_overlapping_locs',
    'inverted': 'get_inverted', 'coordinate_scale_name': 'get_scale',
    'unit_tag': 'get_units', 'set_category_units': 'set_units',
    'tick_labels': 'get_majorticklabels', 'minor_tick_labels': 'get_minorticklabels',
}
LINE_METHODS = {
    'data_values_checked': 'get_data', 'x_values_checked': 'get_xdata',
    'y_values_checked': 'get_ydata', 'xy_values_checked': 'get_xydata',
    'path_values_checked': 'get_path', 'recache_checked': 'recache',
    'stale': 'stale',
}
LINE_GUIDES = {
    **{n: 'line_data' for n in ['get_data', 'get_xdata', 'get_ydata', 'set_data', 'set_xdata', 'set_ydata', 'get_xydata', 'recache']},
    'remove': 'line_remove', 'get_visible': 'line_visible', 'set_visible': 'line_visible',
    'get_linewidth': 'line_width', 'set_linewidth': 'line_width',
    'get_color': 'line_color', 'set_color': 'line_color',
    'get_alpha': 'line_alpha', 'set_alpha': 'line_alpha',
    'get_linestyle': 'line_style', 'set_linestyle': 'line_style',
    'get_drawstyle': 'line_drawstyle', 'set_drawstyle': 'line_drawstyle', 'get_path': 'line_drawstyle',
    'get_gapcolor': 'line_gapcolor', 'set_gapcolor': 'line_gapcolor', 'is_dashed': 'line_gapcolor',
    'set_dashes': 'line_dashes',
}
SCENE_VERIFIED = {
    'autoscale': 'autoscale', 'autoscale_view': 'autoscale', 'relim': 'relim_visible',
    'update_datalim': 'autoscale', 'set_autoscale_on': 'autoscale',
    'get_autoscale_on': 'autoscale', 'set_autoscalex_on': 'autoscale',
    'set_autoscaley_on': 'autoscale', 'get_autoscalex_on': 'autoscale',
    'get_autoscaley_on': 'autoscale', 'clear': 'initial_clear',
    'set_xscale': 'scale_lifecycle', 'set_yscale': 'scale_lifecycle',
}
SECONDARY_GUIDES = {
    'set_functions': 'secondary_functions', 'reset_functions': 'secondary_functions',
    'set_location': 'secondary_transform', 'set_alignment': 'secondary_position',
    'apply_aspect': 'secondary_position', 'prepare_draw': 'secondary_lifecycle',
}
METHOD_RENAMES = {
    'transforms': {'apply': 'transform', 'apply_all': 'transform',
                   'matrix': 'get_matrix', 'inverse': 'inverted', 'then': '__add__',
                   'rotated': 'rotate', 'scaled': 'scale', 'translated': 'translate', 'skewed': 'skew',
                   'interval_x': 'intervalx', 'interval_y': 'intervaly',
                   'min_point': 'min', 'max_point': 'max', 'size': 'size',
                   'extents': 'get_extents', 'evaluate': '__call__',
                   'split_x': 'splitx', 'split_y': 'splity', 'contains_point': 'contains',
                   'contains_x': 'containsx', 'contains_y': 'containsy',
                   'fully_contains_x': 'fully_containsx', 'fully_contains_y': 'fully_containsy',
                   'compose': '__add__', 'length': '__len__', 'affine': 'get_affine'},
    'core/colors': {'transform': '__call__', 'transform_array': '__call__',
                    'sample': '__call__', 'sample_extended': '__call__',
                    'index': '__call__', 'new': '__init__', 'autoscale_none': 'autoscale_None',
                    'bad': 'get_bad', 'over': 'get_over', 'under': 'get_under'},
    'scene/gridspec': {'gridspec': '__init__', 'grid': 'get_gridspec',
                      'subplot': '__getitem__', 'cell_spec': '__getitem__'},
}

RC_FUNCTIONS = {
    'axes_autolimit_mode': ['axes.autolimit_mode'], 'classic_mode': ['_internal.classic_mode'],
    'color_cycle': ['axes.prop_cycle'], 'date_converter': ['date.converter'],
    'date_epoch': ['date.epoch'], 'date_interval_multiples': ['date.interval_multiples'],
    'date_autoformats': ['date.autoformatter.' + x for x in ['year', 'month', 'day', 'hour', 'minute', 'second', 'microsecond']],
    'date_autoformatter': ['date.autoformatter.' + x for x in ['year', 'month', 'day', 'hour', 'minute', 'second', 'microsecond']],
    'formatter_limits': ['axes.formatter.limits'], 'formatter_min_exponent': ['axes.formatter.min_exponent'],
    'formatter_offset_threshold': ['axes.formatter.offset_threshold'],
    'formatter_use_locale': ['axes.formatter.use_locale'],
    'formatter_use_math_text': ['axes.formatter.use_mathtext'],
    'formatter_use_offset': ['axes.formatter.useoffset'], 'text_usetex': ['text.usetex'],
    'unicode_minus': ['axes.unicode_minus'], 'timezone': ['timezone'],
    'lines_scale_dashes': ['lines.scale_dashes'],
    'lines_dashed_pattern': ['lines.dashed_pattern'], 'lines_dashdot_pattern': ['lines.dashdot_pattern'],
    'lines_dotted_pattern': ['lines.dotted_pattern'],
    'minor_tick_divisions': ['xtick.minor.ndivs', 'ytick.minor.ndivs'],
    'minor_ticks_visible': ['xtick.minor.visible', 'ytick.minor.visible'],
    'x_margin': ['axes.xmargin'], 'y_margin': ['axes.ymargin'],
    'grid_visible': ['axes.grid'], 'grid_color': ['grid.color'], 'grid_linewidth': ['grid.linewidth'],
    'grid': ['axes.grid', 'grid.color', 'grid.linewidth'],
}


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def tracked(pattern: str) -> list[str]:
    return subprocess.check_output(['git', 'ls-files', pattern], cwd=ROOT, text=True).splitlines()


def read_interfaces(ref=None) -> tuple[list[dict], list[dict]]:
    declarations, files = [], []
    names = tracked('*pkg.generated.mbti') if ref is None else [n for n in subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', ref], cwd=ROOT, text=True).splitlines() if n.endswith('pkg.generated.mbti')]
    for name in names:
        path = ROOT / name
        package = str(path.parent.relative_to(ROOT))
        package = '' if package == '.' else package
        raw = path.read_bytes() if ref is None else subprocess.check_output(['git', 'show', ref + ':' + name], cwd=ROOT)
        files.append({'path': name, 'sha256': hashlib.sha256(raw).hexdigest()})
        for line, text in enumerate(raw.decode().splitlines(), 1):
            match = re.match(r'pub fn ([^ (]+)', text)
            kind = 'method' if match and '::' in match[1] else 'function'
            if not match:
                match = re.match(r'pub(?:\(all\))? (?:struct|enum|type|suberror) (\w+)', text)
                kind = 'type'
            if not match:
                match = re.match(r'pub using @([^ ]+) \{type (\w+)\}', text)
                if match:
                    declarations.append({'id': f'moon:{package}:alias:{match[2]}', 'package': package,
                                         'symbol': match[2], 'kind': 'reexport', 'interface': name,
                                         'line': line, 'signature': text, 'reexports': match[1]})
                continue
            symbol = match[1]
            declarations.append({'id': f'moon:{package}:{symbol}', 'package': package,
                                 'symbol': symbol, 'kind': kind, 'interface': name,
                                 'line': line, 'signature': text})
    return declarations, files


def production_index() -> dict[tuple[str, str], list[dict]]:
    result = collections.defaultdict(list)
    for name in tracked('*.mbt'):
        if name.endswith(('_test.mbt', '_wbtest.mbt')):
            continue
        path = ROOT / name
        package = str(path.parent.relative_to(ROOT))
        package = '' if package == '.' else package
        for line, text in enumerate(path.read_text().splitlines(), 1):
            match = re.match(r'(?:pub(?:\(all\))?\s+)?(?:fn|struct|enum|type)\s+([^ (\[{]+)', text)
            if match:
                result[package, match[1]].append({'path': name, 'line': line})
    return result


class Source:
    def __init__(self, root: Path):
        self.root = root
        self.lib = root / 'lib/matplotlib'
        self.classes, self.functions, self.modules = {}, {}, {}
        for path in self.lib.rglob('*.py'):
            relative = path.relative_to(root)
            module = 'matplotlib.' + '.'.join(path.relative_to(self.lib).with_suffix('').parts)
            module = module.removesuffix('.__init__')
            try:
                tree = ast.parse(path.read_bytes())
            except (SyntaxError, UnicodeError):
                continue
            imports = {}
            for node in tree.body:
                if isinstance(node, ast.ImportFrom):
                    parent = module.split('.')
                    if path.name != '__init__.py':
                        parent.pop()
                    base = parent[:len(parent) - node.level + 1] if node.level else []
                    prefix = '.'.join(base + ([node.module] if node.module else []))
                    for alias in node.names:
                        imports[alias.asname or alias.name] = prefix + '.' + alias.name
                if isinstance(node, (ast.ClassDef, ast.FunctionDef, ast.AsyncFunctionDef)):
                    q = module + '.' + node.name
                    evidence = {'path': str(relative), 'line': node.lineno, 'sha256': sha(path)}
                    if isinstance(node, ast.ClassDef):
                        self.classes[q] = (node, imports, evidence)
                    else:
                        self.functions[q] = evidence
            self.modules[module] = (path, imports)
        # Generated Python classes such as LogNorm have no ClassDef in .py.
        # The fixed official public stub supplies inheritance/name evidence;
        # this fallback does not upgrade their prototype semantics.
        for path in self.lib.rglob('*.pyi'):
            module = 'matplotlib.' + '.'.join(path.relative_to(self.lib).with_suffix('').parts)
            module = module.removesuffix('.__init__')
            try:
                tree = ast.parse(path.read_bytes())
            except (SyntaxError, UnicodeError):
                continue
            imports = self.modules.get(module, (None, {}))[1]
            for node in tree.body:
                q = module + '.' + getattr(node, 'name', '')
                if isinstance(node, ast.ClassDef) and q not in self.classes:
                    self.classes[q] = (node, imports, {'path': str(path.relative_to(root)), 'line': node.lineno, 'sha256': sha(path), 'format': 'stub-generated-class fallback'})

    def class_entry(self, q):
        return self.classes.get(SOURCE_CLASS_ALIASES.get(q, q))

    def method(self, q: str, name: str, seen=None):
        seen = set() if seen is None else seen
        q = SOURCE_CLASS_ALIASES.get(q, q)
        if q in seen:
            return None
        seen.add(q)
        entry = self.class_entry(q)
        if not entry:
            return None
        node, imports, evidence = entry
        for child in node.body:
            if isinstance(child, (ast.FunctionDef, ast.AsyncFunctionDef)) and child.name == name:
                return {'qualified_name': q + '.' + name, 'path': evidence['path'],
                        'line': child.lineno, 'sha256': evidence['sha256'],
                        'property': any(isinstance(d, ast.Name) and d.id == 'property' for d in child.decorator_list)}
        for base in node.bases:
            if isinstance(base, ast.Name):
                bq = imports.get(base.id, q.rsplit('.', 1)[0] + '.' + base.id)
            elif isinstance(base, ast.Attribute):
                prefix = ast.unparse(base.value)
                bq = imports.get(prefix, prefix) + '.' + base.attr
                if prefix == 'mticker':
                    bq = 'matplotlib.ticker.' + base.attr
                if prefix == 'mtransforms':
                    bq = 'matplotlib.transforms.' + base.attr
                if prefix == 'martist':
                    bq = 'matplotlib.artist.' + base.attr
            else:
                continue
            found = self.method(bq, name, seen)
            if found:
                return found
        return None


def guide(name: str) -> dict:
    p = ROOT / ('testdata/' + name + '_README.md')
    return {'path': str(p.relative_to(ROOT)), 'sha256': sha(p)} if p.exists() else {'path': str(p.relative_to(ROOT)), 'missing': True}


def attach(entry, target=None, status='unverified', reason='', refs=(), group=None, source=None, role='direct'):
    entry.update(canonical_candidate=None if target is None else 'api:' + target,
                 status='partial prototype' if status == 'thin payload or convenience' else status,
                 maturity_detail=status, score_lower=STATUS_SCORES[status][0], score_upper=STATUS_SCORES[status][1],
                 reason=reason, evidence=list(refs), mapping_role=role)
    if group:
        entry['capability_group'] = group
    if source:
        entry['upstream_definition'] = source
    return entry


def scoped_class(package, owner):
    if package == 'ticker' and owner in TICKER_GUIDES:
        return 'verified scoped', [guide(TICKER_GUIDES[owner])], 'Named source-AST family; typed/math/host limits remain in guide.'
    if package == 'ticker/date' and owner in DATE_CLASSES | {'RRuleWrapper'}:
        return 'verified scoped', [guide(DATE_GUIDES.get(owner, 'rrule_wrapper'))], 'Source-referenced date/recurrence profile, not arbitrary datetime/dateutil/OS protocol.'
    if package == 'scene' and owner == 'Line2D':
        return 'partial prototype', [guide('line_data')], 'Stable typed Line handle and accepted selected methods; most Artist/marker/GUI constructor properties remain absent.'
    if package == 'scene' and owner == 'SecondaryAxis':
        return 'verified scoped', [guide('secondary_lifecycle'), guide('secondary_transform')], 'Accepted secondary numeric lifecycle and immutable Affine location profile; no general Transform/GUI protocol.'
    return 'partial prototype', [{'path': 'COMPATIBILITY.md'}], 'Concrete implementation exists, but class-wide parameters/object model or semantic parity remains partial.'


def resolve_method(entry, source, target_class, name, status, refs, reason, role='direct'):
    found = source.method(target_class, name)
    if found:
        # Constructors and the type declaration are one class-attachment unit.
        target = target_class if name == '__init__' else target_class + '.' + name
        return attach(entry, target, status, reason, refs, source=found, role=role)
    return attach(entry, status='unverified', reason='No matching original method/property after AST inheritance lookup; name or field convenience is not evidence of a migrated API.',
                  refs=refs, group=target_class, role='unresolved convenience')


def scene_base_name(name):
    if name in SCENE_METHODS:
        return SCENE_METHODS[name]
    for base in ['imshow', 'scatter', 'bar', 'pcolor', 'pcolormesh', 'fill_between', 'fill_betweenx', 'streamplot', 'tricontourf', 'tricontour', 'tripcolor', 'triplot']:
        if name.startswith(base + '_'):
            return base
    return name


def map_declaration(entry, source):
    p, symbol, kind = entry['package'], entry['symbol'], entry['kind']
    if kind == 'reexport':
        return attach(entry, reason='Reexport of another Moon package; never a new upstream unit.', role='reexport')
    if p.startswith(('integration/', 'internal/', 'cmd/')):
        return attach(entry, reason='Internal transport/runtime or isolated integration harness, not an additional public Matplotlib API.', role='excluded internal')
    if symbol.split('::')[-1] in {'equal', 'not_equal', 'to_repr', 'compare', 'op_lt', 'op_le', 'op_gt', 'op_ge'}:
        return attach(entry, reason='Moon derived trait implementation, not a Matplotlib public API.', role='language adapter')
    if p == '':
        return attach(entry, reason='Root convenience forwarding/reexport; represented by defining package correspondence, no duplicate credit.', role='root facade')
    owner, name = symbol.split('::', 1) if '::' in symbol else (None, symbol)
    if p == 'transforms' and name == 'apply_delta':
        return attach(entry, reason='Delta-only transform excludes translation; native transform_affine includes it. Do not falsely join these methods by numerical similarity.', group='matplotlib.transforms.AffineDeltaTransform', role='delta math helper')
    if p == 'ticker/scale' and owner == 'Scale':
        families = ['Linear', 'Log', 'SymmetricalLog', 'Asinh', 'Logit']
        if kind == 'type':
            targets = ['matplotlib.scale.' + f + 'Scale' for f in families]
        elif name == 'transform':
            targets = ['matplotlib.transforms.Transform.transform'] + ['matplotlib.scale.' + f + 'Transform.transform_non_affine' for f in families[1:]]
        elif name == 'inverse':
            targets = ['matplotlib.transforms.Transform.transform'] + ['matplotlib.scale.' + f + '.transform_non_affine' for f in ['InvertedLogTransform', 'InvertedSymmetricalLogTransform', 'InvertedAsinhTransform', 'LogisticTransform']]
        elif name == 'limit_range_for_scale':
            targets = ['matplotlib.scale.' + f + 'Scale.limit_range_for_scale' for f in families]
        else:
            targets = []
        if targets:
            attach(entry, targets[0], 'partial prototype', 'One typed sum represents five built-in scale profiles; log base/transform object mutability/general user scales remain narrowed. Each original variant resolves and deduplicates independently.', refs=[{'path': 'ticker/scale/scale.mbt'}, guide('scale_defaults')], role='explicit five-variant dispatch')
            entry['additional_canonical_candidates'] = ['api:' + t for t in targets[1:]]
            return entry
    if p == 'core/colors' and owner in {'Rgb', 'Rgba'}:
        if name == 'to_rgba':
            return attach(entry, 'matplotlib.colors.to_rgba', 'partial prototype', 'Typed RGB scalar carrier conversion; not arbitrary native tuple/list/masked/color-string inputs.', refs=[{'path': 'core/colors/color.mbt'}], role='RGB typed conversion')
        if name == 'to_css':
            return attach(entry, 'matplotlib.colors.to_hex', 'thin payload or convenience', 'Opaque RGB gives hexadecimal text, but alpha uses rgba(...) CSS rather than native to_hex keep_alpha; only a partial color-serialization convenience.', refs=[{'path': 'core/colors/color.mbt', 'line': 271}], role='color serialization subset')
    if p == 'config':
        if name == 'reset':
            return attach(entry, 'matplotlib.rcdefaults', 'thin payload or convenience', 'Resets only implemented typed configuration keys, not the full native rc/style/font/backend registry.', refs=[{'path': 'config/config.mbt'}], role='subset rc reset')
        key = name.removeprefix('set_')
        if key in RC_FUNCTIONS:
            keys = RC_FUNCTIONS[key]
            status = 'partial prototype' if key in {'color_cycle', 'grid', 'grid_color', 'grid_visible', 'grid_linewidth', 'x_margin', 'y_margin'} else 'verified scoped'
            entry = attach(entry, status=status, reason='Typed rc getter/setter/snapshot projection; one key counts once across accessors. Does not implement arbitrary RcParams mapping/validators/style sheets.', refs=[{'path': 'config/config.mbt'}, {'path': 'config/line_styles.mbt'}], role='rc accessor')
            entry['rc_candidates'] = ['rc:' + k for k in keys]
            return entry
        if kind == 'type' and name == 'RcParams':
            return attach(entry, 'matplotlib.RcParams', 'thin payload or convenience', 'Typed subset snapshot, not the general validated mutable RcParams dict.', refs=[{'path': 'config/config.mbt'}])
        return attach(entry, reason='Configuration carrier, host locale value or reset helper; no extra API unit beyond individual rc keys.', role='config adapter')
    if owner and name.startswith(('as_', 'bind_')):
        return attach(entry, reason='Typed inheritance/context adapter; mapped class/method source behavior is counted elsewhere.', group=CLASS_TARGETS.get((p, owner)), role='typed adapter')
    if name in {'copy', 'with_offset', 'with_timezone', 'with_locator', 'with_locator_unit', 'with_scale', 'with_scaled', 'with_usetex', 'with_default_format'}:
        return attach(entry, reason='Moon copy/immutable builder convenience; Python copy/attribute assignment is not a separately migrated Matplotlib method.', group=CLASS_TARGETS.get((p, owner)), role='typed builder')
    if (p, owner or name) in CLASS_TARGETS:
        cls = CLASS_TARGETS[p, owner or name]
        status, refs, reason = scoped_class(p, owner or name)
        if kind == 'type':
            se = source.class_entry(cls)
            return attach(entry, cls, status, reason, refs, source=None if not se else se[2], role='class attachment')
        if p == 'ticker':
            n = TICKER_METHODS.get(name, name)
            return resolve_method(entry, source, cls, n, status, refs, reason, 'constructor' if n == '__init__' else 'dtype/call bridge' if n != name else 'direct')
        if p == 'ticker/date':
            n = DATE_METHODS.get(name, name)
            return resolve_method(entry, source, cls, n, status, refs, reason, 'constructor' if n == '__init__' else 'date scalar/batch bridge' if n != name else 'direct')
        if p == 'scene' and owner == 'Line2D':
            n = LINE_METHODS.get(name, name)
            g = LINE_GUIDES.get(n)
            if g:
                status, refs, reason = 'verified scoped', [guide(g)], 'Accepted source-referenced Line method within documented typed input, cache/path and render profile.'
            return resolve_method(entry, source, cls, n, status, refs, reason, 'typed processed view' if n != name else 'direct')
        if p == 'scene' and owner in {'Axes', 'Figure'}:
            n = scene_base_name(name)
            actual_cls = cls
            role = 'direct'
            if owner == 'Figure' and name == 'axes':
                return resolve_method(entry, source, cls, 'gca', 'thin payload or convenience', refs,
                                      'Default-panel convenience, not native Figure.axes List[Axes] and not Artist.axes owning-parent property. Native gca/current-panel selection is implemented separately.', 'default-panel convenience')
            # Figure's plotting facade delegates to current Axes; do not count
            # its extra methods as a second plotting system.
            if owner == 'Figure' and n not in {'clear', 'add_axes', 'add_subplot', 'subplots', 'subplots_adjust', 'add_subfigure', 'subfigures', 'gca', 'sca', 'delaxes', 'get_axes', 'suptitle', 'text'}:
                actual_cls, role = 'matplotlib.axes.Axes', 'Figure current-Axes forwarding'
            if n in SCENE_VERIFIED:
                status, refs = 'verified scoped', [guide(SCENE_VERIFIED[n])]
                reason = 'Accepted lifecycle/range source route for built-in typed geometry/units; not arbitrary Artist/converter/GUI protocol.'
            elif name in {'to_svg', 'to_svg_checked'}:
                return attach(entry, 'matplotlib.backends.backend_svg.FigureCanvasSVG.print_svg', 'thin payload or convenience', 'Custom IR SVG serialization, not full native RendererSVG/Text/font/backend protocol.', refs=[{'path': 'backend/svg/render.mbt'}, {'path': 'scene/svg.mbt'}], role='SVG output convenience')
            return resolve_method(entry, source, actual_cls, n, status, refs, reason, role)
        if p == 'scene' and owner == 'SecondaryAxis':
            n = {'reset_functions': 'set_functions', 'prepare_draw': 'draw'}.get(name, name)
            if name in SECONDARY_GUIDES:
                refs = [guide(SECONDARY_GUIDES[name])]
            # Role convenience names are represented by Axis, not fictional
            # Secondary methods absent from the original class.
            if name in AXIS_METHODS:
                return resolve_method(entry, source, 'matplotlib.axis.Axis', AXIS_METHODS[name], 'verified scoped', refs, reason, 'child Axis delegation')
            return resolve_method(entry, source, cls, n, status, refs, reason)
        if p == 'scene/axis' and owner == 'Axis':
            if name in AXIS_METHODS:
                n = AXIS_METHODS[name]
                if n.startswith('_'):
                    return attach(entry, status='verified scoped', reason='Accepted private source lifecycle/context stage, not a new public API numerator unit.', refs=[guide('units_lifecycle'), guide('scale_lifecycle')], group=cls + '.' + n, role='private source stage')
                target = cls
                if n in {'get_tick_space', 'get_minpos', 'get_view_interval', 'set_view_interval', 'get_data_interval', 'set_ticks_position'}:
                    target = 'matplotlib.axis.XAxis'
                    entry['orientation_peer_candidate'] = 'api:matplotlib.axis.YAxis.' + n
                return resolve_method(entry, source, target, n, 'verified scoped', [guide('units_lifecycle'), guide('scale_lifecycle'), guide('autoscale')], 'Accepted typed Axis role/unit/query bridge, with provider and shared-state boundaries.', 'typed Axis bridge')
            return resolve_method(entry, source, cls, name, 'unverified', refs, 'Public adapter existence alone does not prove equivalent Axis public protocol.')
        renames = METHOD_RENAMES.get(p, {})
        n = '__init__' if name == 'new' else renames.get(name, name)
        if p == 'scene/axis' and owner == 'CategoryUnits' and name == 'encode':
            n = 'update'
        if p == 'core/colors' and name in {'set_vmin', 'set_vmax', 'set_clip', 'set_halfrange', 'set_vcenter'}:
            # Many Python normalization setters are property assignment, not
            # separately callable source methods.
            n = name[4:]
        return resolve_method(entry, source, cls, n, status, refs, reason, 'renamed projection' if n != name else 'direct')
    if p == 'pyplot':
        n = scene_base_name(name)
        if n in {'rcdefaults', 'savefig_svg'}:
            target = 'matplotlib.rcdefaults' if n == 'rcdefaults' else 'matplotlib.pyplot.savefig'
            return attach(entry, target, 'thin payload or convenience', 'Facade to the implemented rc subset or SVG-String output, not the whole native rc/backend contract.', refs=[{'path': 'pyplot/state.mbt'}], role='subset facade')
        own = {'figure', 'gcf', 'gca', 'sca', 'close', 'close_all', 'fignum_exists', 'get_fignums', 'clf', 'cla', 'show', 'savefig', 'axes', 'subplot', 'subplots'}
        if n in own:
            n = {'close_all': 'close'}.get(n, n)
            target = 'matplotlib.pyplot.' + n
            return attach(entry, target, 'partial prototype', 'Stateful facade exists with typed/static-SVG host limits; source pyplot side effects and host behavior are not fully migrated.', refs=[{'path': 'pyplot/state.mbt'}], role='stateful pyplot')
        return resolve_method(entry, source, 'matplotlib.axes.Axes', n, 'partial prototype', [{'path': 'pyplot/state.mbt'}, {'path': 'COMPATIBILITY.md'}], 'Forwarded current-Axes typed subset; not another independent implementation.', 'pyplot forwarding')
    if not owner:
        return map_function(entry, source)
    # No name-only class match: values like Histogram, NumericArray, Scale,
    # FormatterLocations and DateTime can be useful without implementing a
    # native Matplotlib class. Record their group/external boundary explicitly.
    if p == 'ticker/date' and owner in {'DateTime', 'DateTimeZone', 'RRule', 'RRuleSet', 'RelativeDelta', 'RelativeWeekday', 'TimeDelta', 'RRuleDateTime', 'DateParserContext', 'DateStringParser'}:
        return attach(entry, reason='Python datetime/dateutil/tzdb/input representation support; not another Matplotlib API unit.', group='dependency:datetime/dateutil/tzdb', role='dependency bridge')
    return attach(entry, reason='Port-specific data carrier, legacy convenience or unresolved correspondence. No same-name completion assumption.', group=p, role='port-specific/unresolved')


def map_function(entry, source):
    p, n = entry['package'], entry['symbol']
    constructors = {
        'ticker': {'multiple_locator': 'MultipleLocator', 'fixed_locator': 'FixedLocator', 'linear_locator': 'LinearLocator', 'log_locator': 'LogLocator', 'maxn_locator': 'MaxNLocator', 'auto_minor_locator': 'AutoMinorLocator',
                   'scalar_formatter': 'ScalarFormatter', 'fixed_formatter': 'FixedFormatter', 'func_formatter': 'FuncFormatter', 'null_formatter': 'NullFormatter', 'percent_formatter': 'PercentFormatter', 'eng_formatter': 'EngFormatter', 'log_formatter': 'LogFormatter', 'format_str_formatter': 'FormatStrFormatter', 'str_method_formatter': 'StrMethodFormatter'},
        'ticker/date': {'auto_date_formatter': 'AutoDateFormatter', 'concise_date_formatter': 'ConciseDateFormatter', 'date_formatter': 'DateFormatter', 'day_locator': 'DayLocator', 'hour_locator': 'HourLocator', 'hour_locator_at': 'HourLocator', 'minute_locator': 'MinuteLocator', 'minute_locator_at': 'MinuteLocator', 'month_locator': 'MonthLocator', 'month_locator_on': 'MonthLocator', 'second_locator': 'SecondLocator', 'second_locator_at': 'SecondLocator', 'weekday_locator': 'WeekdayLocator', 'year_locator': 'YearLocator', 'microsecond_locator': 'MicrosecondLocator', 'rrule_locator': 'RRuleLocator'},
            'core/colors': {'normalize': 'Normalize', 'log_norm': 'LogNorm', 'symlog_norm': 'SymLogNorm', 'power_norm': 'PowerNorm', 'centered_norm': 'CenteredNorm', 'two_slope_norm': 'TwoSlopeNorm', 'boundary_norm': 'BoundaryNorm', 'listed_colormap': 'ListedColormap', 'custom_colormap': 'LinearSegmentedColormap'},
        'ticker/scale': {'linear_scale': 'LinearScale', 'log_scale': 'LogScale', 'symlog_scale': 'SymmetricalLogScale', 'asinh_scale': 'AsinhScale', 'logit_scale': 'LogitScale'},
    }
    if n in constructors.get(p, {}):
        c = constructors[p][n]
        module = {'ticker': 'ticker', 'ticker/date': 'dates', 'core/colors': 'colors', 'ticker/scale': 'scale'}[p]
        # Legacy pure formatter/locator convenience helpers have deliberately
        # retained older behavior; named class acceptance does not upgrade them.
        return attach(entry, 'matplotlib.' + module + '.' + c, 'thin payload or convenience', 'Legacy/typed factory is a bounded convenience; does not add credit to an already mapped named class.', refs=[{'path': 'COMPATIBILITY.md'}], role='constructor convenience')
    if p == 'ticker/date':
        names = {'date2num', 'num2date', 'num2timedelta', 'drange', 'datestr2num', 'get_epoch', 'set_epoch'}
        n = {'num2timedeltas': 'num2timedelta', 'datestrs2num': 'datestr2num'}.get(n, n)
        if n in names:
            return attach(entry, 'matplotlib.dates.' + n, 'verified scoped', 'Accepted typed date conversion/epoch/parser profile; dynamic Python containers and host date parsing remain documented boundaries.', refs=[guide('date_epoch'), guide('date_parser'), guide('date_range')], role='date function')
    function_targets = {
        ('scene', 'figure'): 'matplotlib.figure.Figure',
        ('scene', 'triangulation'): 'matplotlib.tri.Triangulation',
        ('scene', 'trifinder'): 'matplotlib.tri.TrapezoidMapTriFinder',
        ('scene', 'violin_stats'): 'matplotlib.cbook.violin_stats',
        ('scene/boxplot', 'box_stats'): 'matplotlib.cbook.boxplot_stats',
        ('scene/gridspec', 'gridspec'): 'matplotlib.gridspec.GridSpec',
        ('scene/colorbar', 'colorbar'): 'matplotlib.colorbar.Colorbar',
        ('core/colors', 'parse_color'): 'matplotlib.colors.to_rgba',
        ('core/colors', 'colormap'): 'matplotlib.cm.ColormapRegistry.get_cmap',
        ('core/colors', 'find_colormap'): 'matplotlib.cm.ColormapRegistry.get_cmap',
        ('transforms', 'identity'): 'matplotlib.transforms.Affine2D',
        ('transforms', 'translation'): 'matplotlib.transforms.Affine2D.translate',
        ('transforms', 'scaling'): 'matplotlib.transforms.Affine2D.scale',
        ('transforms', 'rotation'): 'matplotlib.transforms.Affine2D.rotate',
        ('transforms', 'rotation_degrees'): 'matplotlib.transforms.Affine2D.rotate_deg',
        ('transforms', 'skew'): 'matplotlib.transforms.Affine2D.skew',
        ('transforms', 'skew_degrees'): 'matplotlib.transforms.Affine2D.skew_deg',
        ('transforms', 'affine_from_values'): 'matplotlib.transforms.Affine2D.from_values',
        ('transforms', 'bbox'): 'matplotlib.transforms.Bbox',
        ('transforms', 'bbox_from_bounds'): 'matplotlib.transforms.Bbox.from_bounds',
        ('transforms', 'unit_bbox'): 'matplotlib.transforms.Bbox.unit',
        ('transforms', 'null_bbox'): 'matplotlib.transforms.Bbox.null',
        ('transforms', 'identity_transform'): 'matplotlib.transforms.IdentityTransform',
        ('transforms', 'affine_transform'): 'matplotlib.transforms.Affine2D',
        ('transforms', 'blended_transform'): 'matplotlib.transforms.BlendedGenericTransform',
        ('transforms', 'composite_transform'): 'matplotlib.transforms.CompositeGenericTransform',
        ('transforms', 'bbox_transform'): 'matplotlib.transforms.BboxTransform',
        ('transforms', 'bbox_transform_from'): 'matplotlib.transforms.BboxTransformFrom',
        ('transforms', 'bbox_transform_to'): 'matplotlib.transforms.BboxTransformTo',
        ('transforms', 'scaled_translation'): 'matplotlib.transforms.ScaledTranslation',
        ('transforms', 'path'): 'matplotlib.path.Path',
        ('transforms', 'polygon_path'): 'matplotlib.path.Path',
        ('transforms', 'rectangle_path'): 'matplotlib.path.Path.unit_rectangle',
        ('transforms', 'quadratic_bezier'): 'matplotlib.bezier.BezierSegment',
        ('transforms', 'cubic_bezier'): 'matplotlib.bezier.BezierSegment',
    }
    if (p, n) in function_targets:
        return attach(entry, function_targets[p, n], 'partial prototype', 'Curated mathematical/data constructor correspondence; immutable/bounded input or return model differs from native object protocol.', refs=[{'path': 'COMPATIBILITY.md'}], role='curated constructor/function')
    return attach(entry, reason='No audited one-to-one public Matplotlib correspondence; helper/group exists but does not earn a name-based unit.', group=p, role='port helper')


def apply_breadth(entry):
    """Fixed before publishing numbers: scoped validation is not full breadth.

    These are per-unit policy adjustments with inspectable reasons, not hidden
    group percentage multipliers. Root/C explicitly reviewed the domain traps.
    """
    target = entry.get('canonical_candidate', '') or ''
    if not target and 'capability_group' not in entry:
        entry['capability_group'] = 'port:' + (entry['package'] or 'root facade')
    if entry['status'] == 'verified scoped':
        entry['breadth_limit'] = 'Deep source-verified main behavior, but valid dynamic Python/NumPy inputs, alias/container or host/math profiles are materially narrowed; score 0.75, not full-contract 1.'
    if target.startswith('api:matplotlib.lines.Line2D.'):
        method = target.rsplit('.', 1)[1]
        if method in {'get_linewidth', 'get_linestyle', 'get_drawstyle', 'is_dashed'}:
            entry['score_lower'] = entry['score_upper'] = 1.0
            entry['breadth_limit'] = 'No-argument query covers the complete reachable native canonical String/Double/Bool result contract of this Line method; setter/constructor breadth is scored separately.'
        elif method in {'set_color', 'get_color'}:
            entry['breadth_limit'] = 'String colors are deeply verified; native RGB(A) tuple/list/array color carriers are not exposed.'
        elif method == 'set_linestyle':
            entry['breadth_limit'] = 'Native custom (offset, dash-sequence) tuples and non-String inputs are outside this String setter.'
        elif method == 'set_dashes':
            entry['breadth_limit'] = 'Snapshot maps immutable tuple input; native mutable-list alias history is retained as source-only.'
        elif method == 'get_path':
            entry['breadth_limit'] = 'Returns a borrowed vertices TickValues bridge, not the native full Path object/codes/metadata/read-only/interpolation protocol.'
    if target == 'api:matplotlib.ticker.ScalarFormatter.get_useOffset':
        entry['score_lower'] = entry['score_upper'] = 1.0
        entry['breadth_limit'] = 'No-argument getter of normalized auto-offset Boolean: native set_useOffset stores bool for Boolean input and sets False for explicit offsets; setter numeric breadth is scored separately.'
    if target in {'api:matplotlib.axes.Axes.text', 'api:matplotlib.axes.Axes.annotate', 'api:matplotlib.figure.Figure.text'}:
        entry['status'] = 'partial prototype'
        entry['maturity_detail'] = 'thin payload or convenience'
        entry['score_lower'] = entry['score_upper'] = .25
        entry['breadth_limit'] = 'Limited positional/String/color payload, returns Unit rather than full mutable Text/Annotation; Figure text delegates to data-space Axes rather than native Figure-coordinate Text. Typography/kwargs/layout/interaction are absent.'
    if target in {'api:matplotlib.axis.Axis.get_majorticklabels', 'api:matplotlib.axis.Axis.get_minorticklabels'}:
        entry['status'] = 'partial prototype'
        entry['maturity_detail'] = 'thin payload or convenience'
        entry['score_lower'] = entry['score_upper'] = .25
        entry['breadth_limit'] = 'Returns Array[String] labels, not the source List[Text] with independent transforms/style/visibility/Artist state.'
    if target == 'api:matplotlib.axes._secondary_axes.SecondaryAxis.draw':
        entry['status'] = 'partial prototype'
        entry['score_lower'] = entry['score_upper'] = .5
        entry['breadth_limit'] = 'Numeric prepare_draw implements lifecycle preparation; full native BaseDraw/Axis/Text/renderer method is not provided by that entry.'
    if entry['package'] == 'transforms' and entry['symbol'].endswith(('::then', '::compose')):
        entry['source_equivalent_expression'] = 'other + self (reversed operands), not self + other'
        entry['breadth_limit'] = 'Immutable affine composition convention differs: Moon self*other applies other first; native self+other applies self first. Maps composition ability with reversed operands, not identical positional semantics.'
        entry['mapping_role'] = 'explicit reverse-argument composition adapter'
    if target == 'api:matplotlib.pyplot.savefig':
        entry['status'] = 'partial prototype'
        entry['maturity_detail'] = 'thin payload or convenience'
        entry['score_lower'] = entry['score_upper'] = .25
        entry['breadth_limit'] = 'Returns an SVG String; no native filename/format/dpi/bbox/metadata/backend canvas contract.'
    if target == 'api:matplotlib.figure.Figure.clear':
        entry['status'] = 'partial prototype'
        entry['score_lower'] = entry['score_upper'] = .5
        entry['breadth_limit'] = 'Port convenience retains panels; native Figure.clear removes Axes. Axis/Axes source clear acceptance does not upgrade Figure.clear.'


def inherited_breadth(row, links):
    q = row.get('qualified_name') or ''
    if q.startswith('matplotlib.artist.Artist.') and links:
        row['score_lower'] = min(row['score_lower'], .5)
        row['score_upper'] = min(row['score_upper'], .5)
        row['hard_verified'] = False
        row['status'] = 'partial prototype'
        row['uncertainty'].append('Inherited canonical Artist method has only selected Line/Spine/Axes support; general Text/Patch/Collection/GUI Artist contracts are not implemented. Alias dedup is not owner breadth.')
        row['score_lower'] = .25
        row['uncertainty'].append('Owner-wide usable contract vs selected subtype implementation warrants explicit 0.25..0.5 scoring sensitivity; this is not a statistical confidence interval.')
    if q in {'matplotlib.transforms.Transform', 'matplotlib.transforms.CompositeGenericTransform', 'matplotlib.transforms.BlendedGenericTransform'} and links:
        row['score_lower'] = .25
        row['score_upper'] = .5
        row['uncertainty'].append('Only immutable affine transform-tree roles exist; generic mutable/non-affine invalidation graph is missing. Thin graph carrier vs mathematical composition prototype is a 0.25..0.5 classification sensitivity.')
    if q in {'matplotlib.axis.Axis.update_units', 'matplotlib.axis.Axis.convert_units', 'matplotlib.axis.Axis.set_units', 'matplotlib.axis.Axis.get_units'} and links:
        row['score_lower'] = .5
        row['score_upper'] = .75
        row['uncertainty'].append('Built-in Date/Category conversion and unit state are deeply verified, but arbitrary converter/registry/custom units are not exposed. Broad core protocol vs verified common typed profile is an explicit 0.5..0.75 classification sensitivity.')


def inventory_lookup(inventory):
    lookup = collections.defaultdict(set)
    items = inventory.get('items', [])
    for item in items:
        key = item['id']
        for value in [item.get('qualified_name'), item.get('defined_as'), *item.get('aliases', [])]:
            if isinstance(value, str):
                lookup[value.removeprefix('api:')].add(key)
            elif isinstance(value, dict):
                q = value.get('qualified_name') or value.get('name')
                if q:
                    lookup[q.removeprefix('api:')].add(key)
    return lookup, {i['id']: i for i in items}


def join_inventory(declarations, inventory):
    lookup, units = inventory_lookup(inventory)
    attached = collections.defaultdict(list)
    for entry in declarations:
        candidate = entry.get('canonical_candidate')
        requested = ([] if not candidate else [candidate]) + entry.get('additional_canonical_candidates', [])
        if entry.get('orientation_peer_candidate'):
            requested.append(entry['orientation_peer_candidate'])
        resolved, missing = set(), []
        for index, target in enumerate(requested):
            candidates = set(lookup.get(target.removeprefix('api:'), set()))
            definition = entry.get('upstream_definition', {}).get('qualified_name')
            if not candidates and index == 0 and definition:
                candidates |= lookup.get(definition, set())
            if len(candidates) == 1:
                resolved.update(candidates)
            elif candidates:
                entry.setdefault('ambiguous_inventory_ids', []).extend(sorted(candidates))
            else:
                missing.append(target)
        if resolved:
            entry['upstream_ids'] = sorted(resolved)
            entry['upstream_id'] = sorted(resolved)[0]
            for key in resolved:
                attached[key].append(entry)
        if missing:
            entry['unjoined_candidates'] = missing
            entry['join_issue'] = 'Candidate is absent from independently declared public inventory; no attachment credit for that candidate.'
        if entry.get('ambiguous_inventory_ids'):
            entry['join_issue'] = 'Candidate resolves to multiple inventory units; ambiguous candidates excluded from hard numerator until reviewed.'
    rows = []
    for key, original in sorted(units.items()):
        links = attached.get(key, [])
        lower = max((e['score_lower'] for e in links), default=0.0)
        upper = max((e['score_upper'] for e in links), default=0.0)
        verified = lower == 1.0
        row = {'id': key, 'qualified_name': original.get('qualified_name'), 'kind': original.get('kind'), 'group': original.get('group'), 'scope': original.get('scope'),
               'upstream_defined_as': original.get('defined_as'), 'upstream_sources': original.get('sources', []),
               'status': 'verified scoped' if lower >= .75 else 'partial prototype' if lower in {.5, .25} else 'unverified' if links else 'absent',
               'score_lower': lower, 'score_upper': upper, 'hard_verified': verified,
               'moon_ids': [e['id'] for e in links], 'uncertainty': [] if links else ['No audited public Moon correspondence; absence includes unimplemented systems, not a proved unreachable feature.']}
        inherited_breadth(row, links)
        rows.append(row)
    return rows


def rc_rows(declarations, inventory):
    inventory_rc = inventory.get('rc_keys', []) if inventory else []
    keys = {}
    for item in inventory_rc:
        if isinstance(item, str):
            keys['rc:' + item.removeprefix('rc:')] = {'key': item.removeprefix('rc:')}
        else:
            key = item.get('key') or item.get('name') or item['id'].removeprefix('rc:')
            keys['rc:' + key] = item
    links = collections.defaultdict(list)
    for e in declarations:
        for key in e.get('rc_candidates', []):
            links[key].append(e)
    all_keys = sorted(keys or links)
    rows = []
    for key in all_keys:
        es = links.get(key, [])
        rows.append({'id': key, 'key': key[3:], 'scope': keys.get(key, {}).get('scope', 'public'), 'status': max(es, key=lambda e:e['score_lower'])['status'] if es else 'absent',
                     'score_lower': max((e['score_lower'] for e in es), default=0.0),
                     'score_upper': max((e['score_upper'] for e in es), default=0.0),
                     'hard_verified': any(e['score_lower'] == 1.0 for e in es),
                     'moon_ids': [e['id'] for e in es]})
    return rows


def summarize(rows):
    count = len(rows)
    hard = sum(r['hard_verified'] for r in rows)
    lower = sum(r['score_lower'] for r in rows)
    upper = sum(r['score_upper'] for r in rows)
    return {'denominator': count, 'hard_verified_numerator': hard,
            'full_contract_numerator': hard,
            'source_verified_main_profile_units': sum(r['score_lower'] >= .75 for r in rows),
            'nonzero_correspondence_units': sum(r['score_upper'] > 0 for r in rows),
            'weighted_api_equivalents_lower': lower, 'weighted_api_equivalents_upper': upper,
            'hard_attachment_percent': None if not count else 100 * hard / count,
            'weighted_attachment_percent_lower': None if not count else 100 * lower / count,
            'weighted_attachment_percent_upper': None if not count else 100 * upper / count,
            'status_counts': dict(sorted(collections.Counter(r['status'] for r in rows).items()))}


def historical_presence(ref, source, inventory, current_units, current_rc):
    declarations, files = read_interfaces(ref)
    for e in declarations:
        map_declaration(e, source)
        apply_breadth(e)
    rows = join_inventory(declarations, inventory)
    rc = rc_rows(declarations, inventory)
    old_ids = {r['id'] for r in rows if r['score_upper'] > 0}
    new_ids = {r['id'] for r in current_units if r['score_upper'] > 0}
    old_rc = {r['id'] for r in rc if r['score_upper'] > 0}
    new_rc = {r['id'] for r in current_rc if r['score_upper'] > 0}
    runtime_ids = {r['id'] for r in current_units if r.get('scope') == 'runtime'}
    public_rc_ids = {r['id'] for r in current_rc if r.get('scope') == 'public'}
    def counts(before, after):
        return {'historical': len(before), 'current': len(after), 'added': len(after-before), 'removed': len(before-after),
                'historical_ids': sorted(before), 'current_ids': sorted(after), 'added_ids': sorted(after-before), 'removed_ids': sorted(before-after)}
    return {
        'ref': subprocess.check_output(['git', 'rev-parse', ref], cwd=ROOT, text=True).strip(),
        'comparison_contract': 'Interface presence only, using identical canonical mapping rules/inventory. No current source-acceptance grade is assigned retrospectively; internal-kernel, error-order and wiring improvements without new public APIs are invisible to this delta.',
        'interfaces': files, 'moon_declaration_count': len(declarations),
        'historical_api_ids': sorted(old_ids), 'current_api_ids': sorted(new_ids),
        'added_api_ids': sorted(new_ids - old_ids), 'removed_api_ids': sorted(old_ids - new_ids),
        'historical_rc_ids': sorted(old_rc), 'current_rc_ids': sorted(new_rc),
        'added_rc_ids': sorted(new_rc - old_rc), 'removed_rc_ids': sorted(old_rc - new_rc),
        'api_presence_counts': {'historical': len(old_ids), 'current': len(new_ids), 'added': len(new_ids-old_ids), 'removed': len(old_ids-new_ids)},
        'rc_presence_counts': {'historical': len(old_rc), 'current': len(new_rc), 'added': len(new_rc-old_rc), 'removed': len(old_rc-new_rc)},
        'runtime_api_presence': counts(old_ids & runtime_ids, new_ids & runtime_ids),
        'public_rc_presence': counts(old_rc & public_rc_ids, new_rc & public_rc_ids),
        'runtime_api_plus_public_rc_presence': counts((old_ids & runtime_ids) | (old_rc & public_rc_ids), (new_ids & runtime_ids) | (new_rc & public_rc_ids)),
        'historical_unverified_correspondence_ids': [r['id'] for r in rows if r['score_lower'] == 0 and r['score_upper'] > 0],
        'current_unverified_correspondence_ids': [r['id'] for r in current_units if r['score_lower'] == 0 and r['score_upper'] > 0],
        'historical_links': [{'moon_id': e['id'], 'upstream_ids': e.get('upstream_ids', []), 'rc_ids': e.get('rc_candidates', [])} for e in declarations if e.get('upstream_ids') or e.get('rc_candidates')],
    }


def build(source_root, inventory_path=None, history_ref=None):
    declarations, interfaces = read_interfaces()
    prod = production_index()
    source = Source(source_root)
    for e in declarations:
        e['implementation'] = prod.get((e['package'], e['symbol']), [])
        if not e['implementation'] and '::' in e['symbol']:
            e['implementation'] = prod.get((e['package'], e['symbol'].split('::')[0]), [])
            e['implementation_note'] = 'Type declaration is fallback evidence for generated accessors; no explicit implementation method found.'
        map_declaration(e, source)
        apply_breadth(e)
    inventory_bytes = inventory_path.read_bytes() if inventory_path else None
    inventory = json.loads(inventory_bytes) if inventory_bytes else None
    units = join_inventory(declarations, inventory) if inventory else []
    rc = rc_rows(declarations, inventory)
    by_group = collections.defaultdict(list)
    for row in units:
        by_group[str(row.get('group'))].append(row)
    production_manifest = [{'path': p, 'sha256': sha(ROOT / p)} for p in tracked('*.mbt') if not p.endswith(('_test.mbt', '_wbtest.mbt'))]
    result = {
        'schema': SCHEMA, 'port_baseline': subprocess.check_output(['git', 'rev-parse', PORT_BASELINE], cwd=ROOT, text=True).strip(),
        'upstream_source_root': str(source_root.relative_to(ROOT)) if source_root.is_relative_to(ROOT) else str(source_root),
        'upstream_inventory': None if inventory_path is None else {'path': str(inventory_path.relative_to(ROOT)), 'sha256': hashlib.sha256(inventory_bytes).hexdigest()},
        'audit_script_sha256': sha(Path(__file__)), 'production_manifest': production_manifest,
        'methodology': {
            'unit': 'Independent canonical upstream class/function/method/property/protocol; classes and their constructors share one attachment credit.',
            'score_contract': {'1': 'Complete corresponding public query/contract with no identified material valid-domain gap; hard numerator only.', '0.75': 'Deep accepted main behavior but a materially narrowed valid input/owner/container/host/math domain.', '0.5': 'Actual prototype with major parameters/object behavior missing.', '0.25': 'Thin payload or convenience while the main object/protocol is absent.', '0': 'No mapped implementation.', 'unverified': '0..0.5 explicit unresolved interval.'},
            'dedup': 'Maximum evidence-backed score per canonical upstream id, never sum Moon wrappers/overloads/forwarding/inherited reachability.',
            'rc': 'Separate denominator retained; any combined index uses the explicitly fixed equal-unit weighting below.',
            'combined_primary_index': 'Root explicitly fixed equal weight per canonical runtime API or rc key before publishing results. Combined index below is reported alongside separate API/rc and group sensitivities; not semantic or effort coverage.',
            'scope': 'API attachment estimate only, not complete Python semantics, parameter combinations, image fidelity, host support or effort remaining.',
            'verification': 'Existing accepted original-source guides and code inspection; this audit runs no Moon gates and does not infer maturity from test counts/LOC.',
            'unverified_bounds': '0..0.5 is an explicit unresolved mapping interval, not free credit in the hard numerator.',
            'absent': 'No mapped public implementation in the inspected port, including major unimplemented classes/systems.',
        },
        'interface_files': interfaces, 'moon_declarations': declarations,
        'upstream_units': units, 'rc_keys': rc,
        'summary': {'interfaces': len(interfaces), 'moon_declarations': len(declarations),
                    'mapped_unique_api_units': len({i for e in declarations for i in e.get('upstream_ids', [])}),
                    'unjoined_candidates': sum('join_issue' in e for e in declarations),
                    'api': summarize(units), 'runtime_api': summarize([r for r in units if r.get('scope') == 'runtime']),
                    'rc': summarize(rc), 'public_rc': summarize([r for r in rc if r.get('scope') == 'public']),
                    'runtime_api_and_public_rc_equal_unit_index': summarize([r for r in units if r.get('scope') == 'runtime'] + [r for r in rc if r.get('scope') == 'public']),
                    'runtime_static_groups_without_text_gui_toolkits': summarize([r for r in units if r.get('scope') == 'runtime' and r.get('group') in {'data_color_transform_path', 'objects_axes_layout', 'plots_2d', 'ticker_dates_units', 'svg_ir', 'pyplot_config_style'}]),
                    'groups': {g: summarize(rs) for g, rs in sorted(by_group.items())}},
        'limitations': [
            'No callable is scored complete solely because a Moon spelling equals a source spelling.',
            'A verified scoped status normally scores 0.75 because the documented typed/source/math profile materially narrows valid public domains. Only a few individually justified full-contract queries score 1.',
            'Unresolved convenience fields, adapters and external datetime/dateutil support do not count as Matplotlib methods.',
            'Public API granularity weights a tiny getter like a large class; inspect group and strict/method-only sensitivities before interpreting a percentage.',
            'Private implementation algorithms and helpers do not grow the public API numerator; their influence appears in linked public behavior.',
            'Class attachment is downgraded when a large object/constructor protocol remains missing even if several methods are verified.',
            'Lower/upper bounds are classification sensitivities of the audited correspondence model, not statistical confidence intervals or mathematical bounds on all Python semantics. Unrecognized possible correspondences remain explicit rather than receiving free optimistic credit.',
        ],
    }
    if inventory and history_ref:
        result['historical_presence'] = historical_presence(history_ref, source, inventory, units, rc)
    return result


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--source-root', type=Path, default=DEFAULT_SOURCE)
    ap.add_argument('--inventory', type=Path, default=ROOT / 'testdata/upstream_api_inventory.json')
    ap.add_argument('--history-ref', default='6dea404', help='Interface-only historical comparison, never retrospective acceptance grading.')
    ap.add_argument('--output', type=Path, default=OUTPUT)
    ap.add_argument('--check', action='store_true')
    args = ap.parse_args()
    data = build(args.source_root.resolve(), args.inventory.resolve() if args.inventory else None, args.history_ref)
    text = json.dumps(data, ensure_ascii=False, indent=2) + '\n'
    if args.check:
        if args.output.read_text() != text:
            raise SystemExit('port API mapping differs; rerun generation and review input hashes')
    else:
        args.output.write_text(text)
    print(json.dumps(data['summary'], ensure_ascii=False, sort_keys=True))


if __name__ == '__main__':
    main()
