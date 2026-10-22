"""Pinned AsinhLocator raw parameters, partial updates, aliases and providers.

Complete original AST bodies are the oracle. Numerical collection and primitive
profiles are separate references; these observations target stable object and
error protocols without replacing the original tick algorithm.
"""
from pathlib import Path
import argparse
import ast
import copy
import json
import math
import sys
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_log_params_reference import load as load_base, number, error_assert, NUMPY_SHA
from generate_maxn_params_reference import source_view
from generate_multiple_locator_reference import clean, TICKER_SHA, TRANSFORMS_SHA

ROOT = Path(__file__).resolve().parents[1]


def load(path):
    ns = load_base(path)
    node = next(n for n in ast.parse(path.read_text()).body
                if isinstance(n, ast.ClassDef) and n.name == 'AsinhLocator')
    exec(compile(ast.Module(body=[node], type_ignores=[]), str(path), 'exec'), ns)
    return ns


def seq(values): return dict(kind='sequence', values=values)
def arr(values, integer=False): return dict(kind='ndarray', values=values, integer=integer)
def scalar(value): return dict(kind='number', value=value)
def text(value): return dict(kind='text', value=value)


def source_subs(spec):
    if spec is None: return None
    if spec['kind'] == 'sequence': return [float(v) for v in spec['values']]
    if spec['kind'] == 'ndarray': return np.array(spec['values'], dtype=np.int64 if spec.get('integer') else np.float64)
    return spec['value']


def subs_expr(spec):
    if spec is None: return 'None'
    kind = spec['kind']
    if kind == 'sequence': body = 'Sequence(' + moon([float(v) for v in spec['values']]) + ')'
    elif kind == 'ndarray':
        literal = '[' + ', '.join(str(int(v)) + 'L' for v in spec['values']) + ']' if spec.get('integer') else moon([float(v) for v in spec['values']])
        body = 'NdArray(@ticker.TickValues::from_' + ('int64_array' if spec.get('integer') else 'array') + '(' + literal + '))'
    elif kind == 'number': body = 'Number(' + moon(spec['value']) + ')'
    else: body = 'Text(' + moon(spec['value']) + ')'
    return 'Some(@ticker.AsinhSubs::' + body + ')'


def count_expr(value): return 'None' if value is None else 'Some(' + number(value) + ')'


def snapshot(locator):
    value = locator.subs
    spec = None if value is None else arr(value.tolist(), value.dtype == np.dtype('int64')) if isinstance(value, np.ndarray) else seq(value[:]) if isinstance(value, list) else text(value) if isinstance(value, str) else scalar(value)
    return dict(linear_width=float(locator.linear_width), numticks=locator.numticks,
                symthresh=float(locator.symthresh), base=float(locator.base), subs=spec)


def state_code(state, name='locator'):
    return ('  verify_asinh_params_number(' + name + '.linear_width(), ' + moon(state['linear_width']) + ')\n'
            + '  verify_asinh_params_count(' + name + '.numticks(), ' + count_expr(state['numticks']) + ')\n'
            + '  verify_asinh_params_number(' + name + '.symthresh(), ' + moon(state['symthresh']) + ')\n'
            + '  verify_asinh_params_number(' + name + '.base(), ' + moon(state['base']) + ')\n'
            + '  verify_asinh_params_subs(' + name + '.subs(), ' + subs_expr(state['subs']) + ')\n')


def observe(fn):
    with warnings.catch_warnings():
        warnings.simplefilter('ignore', RuntimeWarning)
        try:
            result = fn()
            return dict(values=None if result is None else [float(v) for v in result], source_error=None)
        except (ValueError, TypeError, AttributeError, OverflowError, ZeroDivisionError, IndexError) as exc:
            return dict(values=None, source_error=type(exc).__name__)


def query_code(expr, result, pair=False):
    if result['source_error']: return error_assert(expr)
    if pair:
        return '  let (lo, hi) = ' + expr + '\n  verify_asinh_params_values([lo, hi], ' + moon(result['values']) + ')\n'
    return '  verify_asinh_params_values(' + expr + ', ' + moon(result['values']) + ')\n'


def arguments(spec, update=False):
    output = []
    if not update: output.append(moon(spec.get('linear_width', 1.)))
    for key in ['numticks', 'symthresh', 'base', 'subs']:
        if key not in spec: continue
        value = spec[key]
        expr = count_expr(value) if key == 'numticks' else subs_expr(value) if key == 'subs' else 'None' if value is None else ('Some(' + moon(value) + ')' if update else moon(value))
        output.append(key + '=' + expr)
    return ', '.join(output)


def source_args(spec):
    return {key: source_subs(value) if key == 'subs' else value for key, value in spec.items()}


def generate(path):
    ns = load(path)
    A, rc = ns['AsinhLocator'], ns['mpl'].rcParams
    code = '''// Complete original AsinhLocator object, update and alias observations.

///|
fn verify_asinh_params_number(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn verify_asinh_params_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected { verify_asinh_params_number(actual[index], value) }
}

///|
fn verify_asinh_params_count(actual : @ticker.LogNumTicks?, expected : @ticker.LogNumTicks?) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(@ticker.LogNumTicks::Text(a)), Some(@ticker.LogNumTicks::Text(b))) => assert_eq(a,b)
    (Some(@ticker.LogNumTicks::Integer(a)), Some(@ticker.LogNumTicks::Integer(b))) => assert_eq(a,b)
    (Some(@ticker.LogNumTicks::Number(a)), Some(@ticker.LogNumTicks::Number(b))) => verify_asinh_params_number(a,b)
    _ => fail("unexpected asinh count storage")
  }
}

///|
fn verify_asinh_params_subs(actual : @ticker.AsinhSubs?, expected : @ticker.AsinhSubs?) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(@ticker.AsinhSubs::Sequence(a)), Some(@ticker.AsinhSubs::Sequence(b))) => verify_asinh_params_values(a,b)
    (Some(@ticker.AsinhSubs::NdArray(a)), Some(@ticker.AsinhSubs::NdArray(b))) => verify_asinh_params_values(a.to_array(),b.to_array())
    (Some(@ticker.AsinhSubs::Number(a)), Some(@ticker.AsinhSubs::Number(b))) => verify_asinh_params_number(a,b)
    (Some(@ticker.AsinhSubs::Text(a)), Some(@ticker.AsinhSubs::Text(b))) => assert_eq(a,b)
    _ => fail("unexpected asinh subs storage")
  }
}
'''
    constructors = []
    specs = [dict()]
    for key, values in [('linear_width', [0., -0., -1., math.nan, math.inf, -math.inf, 5e-324, sys.float_info.max]),
                        ('symthresh', [0., -.2, math.nan, math.inf, -math.inf]),
                        ('base', [0., -0., -1., 1., 2., 2.5, math.nan, math.inf, -math.inf]),
                        ('numticks', [None, 0, 1, -1, 11., 2.5, math.nan, math.inf, 'auto', 2**63, 10**400]),
                        ('subs', [None, seq([]), seq([0.]), seq([2., 5.]), arr([]), arr([0.]), arr([2., 5.]), arr([2, 5], True), scalar(0.), scalar(2.), scalar(math.nan), text(''), text('auto')])]:
        specs.extend({key: value} for value in values)
    for index, spec in enumerate(specs):
        locator = A(**dict(linear_width=1., **source_args(spec))) if 'linear_width' not in spec else A(**source_args(spec))
        state = snapshot(locator)
        code += '\n///|\ntest ' + moon('Asinh original raw constructor ' + str(index)) + ' {\n  let locator = @ticker.AsinhLocator::new(' + arguments(spec) + ')\n' + state_code(state) + '  assert_true(locator.view_interval_provider() is None)\n}\n'
        constructors.append(dict(spec=spec, state=state))

    updates = []
    update_specs = [dict(), dict(numticks=None, symthresh=None, base=None, subs=None)]
    update_specs += [dict(numticks=3, symthresh=.4, base=2., subs=value) for value in [None, seq([]), seq([0.]), arr([]), arr([0], True), arr([2, 5], True), scalar(0.), scalar(2.), scalar(math.nan), text(''), text('auto')]]
    update_specs += [dict(numticks=value) for value in [0, -1, 11., math.nan, 'auto', 2**63, 10**400]]
    for index, spec in enumerate(update_specs):
        locator = A(1., subs=[2., 5.])
        outcome = observe(lambda: locator.set_params(**source_args(spec)))
        code += '\n///|\ntest ' + moon('Asinh original ordered partial update ' + str(index)) + ' {\n  let locator = @ticker.AsinhLocator::new(1.0, subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])))\n'
        expr = 'locator.set_params(' + arguments(spec, True) + ')'
        code += error_assert(expr) if outcome['source_error'] else '  ' + expr + '\n'
        code += state_code(snapshot(locator)) + '}\n'
        updates.append(dict(params=spec, observation=outcome, state=snapshot(locator)))

    consumption = []
    consume_specs = [(dict(numticks=value), (0., 0.)) for value in [None, -1, 11., 2.5, math.nan, math.inf, 'auto', 2**63, 10**400]]
    consume_specs += [(dict(numticks=0), bounds) for bounds in [(-1., 1.), (1., 2.)]]
    consume_specs += [(dict(subs=value), (0., 0.)) for value in [seq([]), seq([0.]), arr([]), arr([0.]), arr([2., 5.]), arr([2, 5], True), scalar(0.), scalar(2.), text(''), text('auto')]]
    for index, (spec, bounds) in enumerate(consume_specs):
        locator = A(**dict(linear_width=1., **source_args(spec)))
        obs = observe(lambda: locator.tick_values(*bounds))
        code += '\n///|\ntest ' + moon('Asinh original delayed parameter consumption ' + str(index)) + ' {\n  let locator = @ticker.AsinhLocator::new(' + arguments(spec) + ')\n' + query_code('locator.tick_values(' + moon(bounds[0]) + ', ' + moon(bounds[1]) + ')', obs) + '}\n'
        consumption.append(dict(spec=spec, bounds=bounds, observation=obs))

    aliases = []
    for label, integer, initial, slices in [('Float64 signed', False, [5.,2.,1.], [(-1,-1,3)]), ('Float64 nested', False, [1.,0.,2.,0.,5.], [(0,1,5),(4,-2,3)]), ('Int64 signed', True, [5,2,1], [(-1,-1,3)]), ('Int64 exact', True, [2**53+1,2**63-1], []), ('Int64 zero stride', True, [2], [(0,0,3)]), ('Float64 empty', False, [], [])]:
        owner = np.array(initial, dtype=np.int64 if integer else np.float64)
        selected, positions = owner, np.arange(len(owner))
        for start, stride, length in slices:
            selected = source_view(selected,start,stride,length); positions = source_view(positions,start,stride,length)
        locator = A(1.,subs=selected); shallow = copy.copy(locator)
        stages = [dict(state=snapshot(locator), owner=owner.tolist())]
        if len(selected): owner[int(positions[0])] = 3.75; selected[-1] = 7.75
        stages.append(dict(state=snapshot(locator), copy=snapshot(shallow), owner=owner.tolist()))
        shallow.set_params(numticks=3, subs=[])
        stages.append(dict(state=snapshot(locator), copy=snapshot(shallow), owner=owner.tolist()))
        literal = '[' + ', '.join(str(int(v))+'L' for v in initial) + ']' if integer else moon(initial)
        expr = '@ticker.TickValues::from_' + ('int64_array' if integer else 'array') + '(owner)'
        for start,stride,length in slices: expr += '.view(' + str(start)+', '+str(stride)+', '+str(length)+')'
        code += '\n///|\ntest ' + moon('Asinh original ndarray alias ' + label) + ' {\n  let owner = ' + literal + '\n  let locator = @ticker.AsinhLocator::new(1.0, subs=Some(@ticker.AsinhSubs::NdArray(' + expr + ')))\n  let shallow = locator.copy()\n' + state_code(stages[0]['state'])
        if len(selected):
            code += '  owner[' + str(int(positions[0])) + '] = ' + ('3L' if integer else '3.75') + '\n  guard locator.subs() is Some(@ticker.AsinhSubs::NdArray(values)) else { fail("expected ndarray subs") }\n  values.set(-1, 7.75)\n'
        code += state_code(stages[1]['state']) + state_code(stages[1]['copy'], 'shallow')
        literal = '[' + ', '.join(str(int(v))+'L' for v in stages[1]['owner']) + ']' if integer else moon(stages[1]['owner'])
        code += ('  assert_eq(owner, ' + literal + ')\n') if integer else '  verify_asinh_params_values(owner, ' + literal + ')\n'
        code += '  shallow.set_params(numticks=Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(3))), subs=Some(@ticker.AsinhSubs::Sequence([])))\n' + state_code(stages[2]['state']) + state_code(stages[2]['copy'], 'shallow') + '}\n'
        aliases.append(dict(label=label, integer=integer, slices=slices, exact_input_alias=locator.subs is selected, stages=stages))

    sequence_aliases=[]
    for initial in [[],[2.,5.]]:
        owner=initial[:];locator=A(1.,subs=owner);shallow=copy.copy(locator)
        stages=[dict(state=snapshot(locator),copy=snapshot(shallow))]
        owner.append(3.75);stages.append(dict(state=snapshot(locator),copy=snapshot(shallow)))
        locator.subs[-1]=7.75;stages.append(dict(state=snapshot(locator),copy=snapshot(shallow)))
        shallow.set_params(subs=[]);stages.append(dict(state=snapshot(locator),copy=snapshot(shallow)))
        owner.clear();locator.subs=owner;owner.append(2.);stages.append(dict(state=snapshot(locator),copy=snapshot(shallow)))
        owner.clear();locator.set_params(subs=owner);owner.append(5.);stages.append(dict(state=snapshot(locator),copy=snapshot(shallow)))
        code+='\n///|\ntest '+moon('Asinh original live list and empty reset '+str(len(sequence_aliases)))+' {\n  let owner = '+moon(initial)+'\n  let locator = @ticker.AsinhLocator::new(1.0, subs=Some(@ticker.AsinhSubs::Sequence(owner)))\n  let shallow = locator.copy()\n'
        for index,stage in enumerate(stages):
            if index==1:code+='  owner.push(3.75)\n'
            if index==2:code+='  guard locator.subs() is Some(@ticker.AsinhSubs::Sequence(values)) else { fail("expected sequence subs") }\n  values[values.length()-1] = 7.75\n'
            if index==3:code+='  shallow.set_params(subs=Some(@ticker.AsinhSubs::Sequence([])))\n'
            if index==4:code+='  owner.clear()\n  locator.set_subs(Some(@ticker.AsinhSubs::Sequence(owner)))\n  owner.push(2.0)\n'
            if index==5:code+='  owner.clear()\n  locator.set_params(subs=Some(@ticker.AsinhSubs::Sequence(owner)))\n  owner.push(5.0)\n'
            code+=state_code(stage['state'])+state_code(stage['copy'],'shallow')
        code+='}\n';sequence_aliases.append(dict(initial=initial,stages=stages))

    locator=A(1.);shallow=copy.copy(locator)
    locator.linear_width=-0.;locator.numticks=None;locator.symthresh=math.inf;locator.base=math.nan;locator.subs=0.
    raw_stages=[dict(state=snapshot(locator),copy=snapshot(shallow))]
    shallow.linear_width=2.;shallow.numticks=2.5;shallow.symthresh=-1.;shallow.base=0.;shallow.subs=[]
    raw_stages.append(dict(state=snapshot(locator),copy=snapshot(shallow)))
    code+='\n///|\ntest "Asinh original raw public slots bypass normalization" {\n  let locator = @ticker.AsinhLocator::new(1.0)\n  let shallow = locator.copy()\n  locator.set_linear_width(-0.0)\n  locator.set_numticks(None)\n  locator.set_symthresh((1.0 / 0.0))\n  locator.set_base((0.0 / 0.0))\n  locator.set_subs(Some(@ticker.AsinhSubs::Number(0.0)))\n'+state_code(raw_stages[0]['state'])+state_code(raw_stages[0]['copy'],'shallow')
    code+='  shallow.set_linear_width(2.0)\n  shallow.set_numticks(Some(@ticker.LogNumTicks::Number(2.5)))\n  shallow.set_symthresh(-1.0)\n  shallow.set_base(0.0)\n  shallow.set_subs(Some(@ticker.AsinhSubs::Sequence([])))\n'+state_code(raw_stages[1]['state'])+state_code(raw_stages[1]['copy'],'shallow')+'}\n'

    ranges = []
    for bounds in [(0.,0.), (1.,1.), (10.,-2.), (-math.inf,math.inf), (math.nan,1.), (5e-324,5e-324)]:
        locator = A(math.nan,numticks=None,symthresh=math.nan,base=math.nan,subs=np.array([]))
        code += '\n///|\ntest ' + moon('Asinh original inherited ranges ' + str(len(ranges))) + ' {\n  let previous = @config.axes_autolimit_mode()\n  defer @config.set_axes_autolimit_mode(previous)\n  let locator = @ticker.AsinhLocator::new(' + arguments(dict(linear_width=math.nan,numticks=None,symthresh=math.nan,base=math.nan,subs=arr([]))) + ')\n'
        observations=[]
        for mode in ['data','round_numbers']:
            rc['axes.autolimit_mode'] = mode;code += '  @config.set_axes_autolimit_mode(' + moon(mode) + ')\n'
            for method in ['nonsingular','view_limits']:
                obs=observe(lambda:getattr(locator,method)(*bounds));observations.append(dict(mode=mode,method=method,**obs))
                code += query_code('locator.' + method + '(' + moon(bounds[0]) + ', ' + moon(bounds[1]) + ')', obs, True)
        code += '}\n';ranges.append(dict(bounds=bounds,observations=observations))

    events=[]
    class Axis:
        def __init__(self,name,view):self.name,self.view=name,view
        def get_view_interval(self):events.append(self.name);return self.view
    a=Axis('first',(8.,-10.));b=Axis('second',(1.,2.));locator=A(1.,numticks=1);locator.set_axis(a);shallow=copy.copy(locator)
    stages=[]
    stages.append(dict(name='locator',observation=observe(locator)))
    a.view=(-10.,9.);stages.append(dict(name='shallow',observation=observe(shallow)))
    locator.set_axis(b);stages.append(dict(name='locator',observation=observe(locator)));stages.append(dict(name='shallow',observation=observe(shallow)))
    code += '\n///|\ntest "Asinh original owner view copy and rebind" {\n  let events : Array[String] = []\n  let view = Ref((8.0,-10.0))\n  let locator = @ticker.AsinhLocator::new(1.0, numticks=Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(1))))\n  locator.bind_view_interval(fn() { events.push("first"); view.val })\n  let shallow = locator.copy()\n'
    for index,stage in enumerate(stages):
        if index==1:code+='  view.val = (-10.0,9.0)\n'
        if index==2:code+='  locator.bind_view_interval(fn() { events.push("second"); (1.0,2.0) })\n'
        code+=query_code(stage['name']+'.call()',stage['observation'])
    code+='  assert_eq(events, '+moon(events)+')\n}\n'

    payload=dict(ticker_sha256=TICKER_SHA,transforms_sha256=TRANSFORMS_SHA,numpy_core_sha256=NUMPY_SHA,python=sys.version.split()[0],numpy=np.__version__,
                 scope='Complete original AsinhLocator AST and inherited ranges. Double fields project Python floats; Integer counts project Python integers, raw None and float/text are distinct. Sequence is borrowed mutable list of Double, NdArray native 1D Float64/Int64. Other dynamic types, NumPy scalar counts, multidimensional/readonly/resizing ndarray and heterogeneous/Int64 lists are outside typed domain. Numeric math/source collection evidence is independent. No warnings/logger source protocol is synthesized.',
                 constructors=constructors,updates=updates,consumption=consumption,aliases=aliases,sequence_aliases=sequence_aliases,raw_property_stages=raw_stages,ranges=ranges,view_copy_stages=stages,view_events=events)
    return json.dumps(clean(payload),indent=2,allow_nan=False)+'\n',formatted(code)


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore',RuntimeWarning);outputs=generate(args.ticker)
    for name,content in zip(['testdata/asinh_params_reference.json','ticker/asinh_params_reference_test.mbt'],outputs):
        path=ROOT/name
        if args.check:
            if not path.exists()or path.read_text()!=content:raise SystemExit('reference differs: '+name)
        else:path.write_text(content)
    p=json.loads(outputs[0]);print('Asinh params:',len(p['constructors']),'constructors,',len(p['updates']),'updates,',len(p['consumption']),'consumption,',len(p['aliases']),'ndarray aliases x3 stages,',len(p['sequence_aliases']),'sequence aliases x6 stages,',len(p['raw_property_stages']),'raw property stages,',len(p['ranges']),'ranges x4,',len(p['view_copy_stages']),'view/copy stages')


if __name__=='__main__':main()
