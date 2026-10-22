"""Execute pinned LogLocator parameter, alias, context and range bodies.

The supported parameter input is Double bases, typed raw budgets and 1D native
Float64/Int64 subs. Original shape failures are documented but are not invented
as reachable typed states. Fixtures supply rc/provider values and warning sinks.
"""
from pathlib import Path
import argparse
import ast
import copy
import hashlib
import json
import math
import sys
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_maxn_params_reference import load as load_base, source_view
from generate_multiple_locator_reference import clean, TICKER_SHA, TRANSFORMS_SHA, RC_SHA, RCSETUP_SHA
from generate_fixed_locator_reference import API_SHA

ROOT = Path(__file__).resolve().parents[1]
NUMPY_SHA = "44fdecc68c23ac6dd5825dc124c801086f7f68dc15ab008ed584ed6a47be6305"


def load(path):
    ns = load_base(path)
    if hashlib.sha256(Path(np._core._multiarray_umath.__file__).read_bytes()).hexdigest() != NUMPY_SHA:
        raise ValueError("fixed NumPy core differs")
    ns['__name__'] = 'matplotlib.ticker'
    ns['external_warnings'] = []
    ns['_api'].warn_external = ns['external_warnings'].append
    tree = ast.parse(path.read_text())
    for name in ['_decade_less_equal', '_decade_greater_equal', '_decade_less', '_decade_greater', 'AutoLocator', 'LogLocator']:
        node = next(n for n in tree.body if isinstance(n, (ast.ClassDef, ast.FunctionDef)) and n.name == name)
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(path), 'exec'), ns)
    return ns


def number(value, space=False):
    cls = '@ticker.LogTickSpace' if space else '@ticker.LogNumTicks'
    if isinstance(value, int):
        return cls + '::Integer(@bigint.BigInt::from_string(' + moon(str(value)) + '))'
    if isinstance(value, str):
        return cls + '::Text(' + moon(value) + ')'
    return cls + '::Number(' + moon(value) + ')'


def subs(value):
    if isinstance(value, str):
        return '@ticker.LogSubs::Text(' + moon(value) + ')'
    return '@ticker.LogSubs::Values(@ticker.TickValues::from_array(' + moon([float(x) for x in value]) + '))'


def state(locator):
    return dict(base=locator._base, subs=locator._subs if isinstance(locator._subs, str) else locator._subs.tolist(),
                numticks=locator.numticks)


def state_code(value, name='locator'):
    return ('  verify_log_params_base(' + name + '.base(), ' + moon(value['base']) + ')\n'
            + '  verify_log_params_subs(' + name + '.subs(), ' + subs(value['subs']) + ')\n'
            + '  verify_log_params_numticks(' + name + '.numticks(), ' + number(value['numticks']) + ')\n')


def error_assert(expr):
    return '  assert_true(try { ignore(' + expr + '); false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })\n'


def observe(ns, function):
    ns['external_warnings'].clear()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore', RuntimeWarning)
        try:
            result = function()
            result = [float(x) for x in result] if result is not None else None
            error = None
        except (ValueError, TypeError, AttributeError, OverflowError, ZeroDivisionError, AssertionError) as exc:
            result, error = None, type(exc).__name__
    return dict(values=result, error=error, warnings=ns['external_warnings'][:])


class Axis:
    def __init__(self, events, view=(1., 100.), space=9, minpos=.01, shared=(.01,), fail=None):
        self.events, self.view, self.space, self.minimum, self.shared, self.fail = events, view, space, minpos, shared, fail
    def read(self, label, value):
        self.events.append(label)
        if self.fail == label:
            raise ValueError('fixture ' + label)
        return value
    def get_view_interval(self):
        return self.read('view', self.view)
    def get_tick_space(self):
        return self.read('space', self.space)
    def get_minpos(self):
        return self.read('minpos', self.minimum)
    def _get_shared_axis(self):
        self.read('shared', None)
        owner = self
        class Shared:
            def __init__(self, index, value):
                self.index, self.value = index, value
            def get_minpos(self):
                return owner.read('shared ' + str(self.index), self.value)
        return [Shared(i, v) for i, v in enumerate(self.shared)]


def bindings(spec, name='locator'):
    code = ''
    fail = spec.get('fail')
    for label, method, value in [
        ('view','view_interval','(' + moon(float(spec.get('view',[1.,100.])[0])) + ', ' + moon(float(spec.get('view',[1.,100.])[1])) + ')'),
        ('space','tick_space',number(spec.get('space',9),space=True)),
        ('minpos','minpos',moon(float(spec.get('minpos',.01))))]:
        body = 'raise @core.DataError::InvalidTicks(message="fixture ' + label + '")' if fail == label else value
        effect = ' raise @core.DataError' if fail == label else ''
        code += '  ' + name + '.bind_' + method + '(fn()' + effect + ' { events.push(' + moon(label) + '); ' + body + ' })\n'
    sequence = ['events.push("shared")']
    shared = spec.get('shared',[.01])
    for index, value in enumerate(shared):
        sequence.append('events.push(' + moon('shared ' + str(index)) + ')')
        if fail == 'shared ' + str(index):
            sequence.append('raise @core.DataError::InvalidTicks(message="fixture shared item")')
            break
    if fail == 'shared':
        body = 'events.push("shared"); raise @core.DataError::InvalidTicks(message="fixture shared")'
    else:
        body = '; '.join(sequence) + ('; ' + moon([float(x) for x in shared]) if not (fail and fail.startswith('shared ')) else '')
    effect = ' raise @core.DataError' if fail and fail.startswith('shared') else ''
    code += '  ' + name + '.bind_shared_minpos(fn()' + effect + ' { ' + body + ' })\n'
    return code


def result_code(observation, expr, name='locator'):
    code = error_assert(expr) if observation['error'] else '  verify_log_params_values(' + expr + ', ' + moon(observation['values']) + ')\n'
    return code + '  assert_eq(' + name + '.warnings(), ' + moon(observation['warnings']) + ')\n'


def generate(path):
    ns = load(path)
    Log, rc = ns['LogLocator'], ns['mpl'].rcParams
    code = '''// Generated original LogLocator parameter, alias, provider and range observations.

///|
fn verify_log_params_base(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn verify_log_params_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected { verify_log_params_base(actual[index], value) }
}

///|
fn verify_log_params_numticks(actual : @ticker.LogNumTicks, expected : @ticker.LogNumTicks) -> Unit raise {
  match (actual, expected) {
    (@ticker.LogNumTicks::Text(a), @ticker.LogNumTicks::Text(b)) => assert_eq(a, b)
    (@ticker.LogNumTicks::Integer(a), @ticker.LogNumTicks::Integer(b)) => assert_eq(a, b)
    (@ticker.LogNumTicks::Number(a), @ticker.LogNumTicks::Number(b)) => verify_log_params_base(a, b)
    _ => fail("unexpected log numticks dtype")
  }
}

///|
fn verify_log_params_subs(actual : @ticker.LogSubs, expected : @ticker.LogSubs) -> Unit raise {
  match (actual, expected) {
    (@ticker.LogSubs::Text(a), @ticker.LogSubs::Text(b)) => assert_eq(a, b)
    (@ticker.LogSubs::Values(a), @ticker.LogSubs::Values(b)) => verify_log_params_values(a.to_array(), b.to_array())
    _ => fail("unexpected log subs kind")
  }
}
'''
    constructors = []
    constructor_specs = []
    for classic in [False,True]:
        constructor_specs += [(classic,dict())]
        for value in [None,'auto','all','AUTO','bad',[],[1.,2.5],[-1.,0.,math.nan,math.inf]]:
            constructor_specs.append((classic,dict(subs=value)))
        for value in [None,'auto','AUTO',0,1,-1,2.5,.5,math.nan,math.inf,-math.inf,2**63,10**400]:
            constructor_specs.append((classic,dict(numticks=value)))
    for base in [0.,1.,-2.,math.nan,math.inf,-math.inf,2.,2.5,math.nextafter(1.,math.inf)]:
        constructor_specs.append((False,dict(base=base)))
    for index,(classic,params) in enumerate(constructor_specs):
        rc['_internal.classic_mode'] = classic
        try:
            locator, error = Log(**params), None
        except (ValueError,TypeError) as exc:
            locator,error=None,type(exc).__name__
        code += '\n///|\ntest ' + moon('Log original constructor ' + str(index)) + ' {\n  let previous = @config.classic_mode()\n  defer @config.set_classic_mode(previous)\n  @config.set_classic_mode(' + moon(classic) + ')\n'
        args=[]
        for key,value in params.items():
            if key=='base': args.append('base='+moon(value))
            elif key=='subs': args.append('subs=None' if value is None else 'subs=Some('+subs(value)+')')
            else: args.append('numticks=None' if value is None else 'numticks=Some('+number(value)+')')
        expr='@ticker.LogLocator::new('+', '.join(args)+')'
        if error: code += error_assert(expr)
        else:
            code += '  let locator = '+expr+'\n'+state_code(state(locator))+'  assert_eq(locator.warnings(), [])\n'
        code += '}\n'
        constructors.append(dict(classic=classic,params=params,error=error,state=None if locator is None else state(locator)))

    rc['_internal.classic_mode']=False
    updates=[]
    specs=[dict(),dict(base=None,subs=None,numticks=None),dict(base=2.),dict(subs='auto'),dict(subs='all'),dict(subs=[]),dict(subs=[-1.,0.,math.nan,math.inf]),dict(numticks=2.5),dict(numticks='AUTO'),dict(numticks=10**400),dict(base=2.,subs='AUTO',numticks=99),dict(base=-2.,subs='bad',numticks=99),dict(base=math.nan,subs='all',numticks=math.inf),dict(base=0.,subs=None,numticks=-1)]
    for index,params in enumerate(specs):
        locator=Log(base=10.,subs=np.array([1.,2.]),numticks=9)
        observation=observe(ns,lambda:locator.set_params(**params))
        args=[]
        for key,value in params.items():
            args.append(key+'=None' if value is None else key+'=Some('+(subs(value) if key=='subs' else number(value) if key=='numticks' else moon(value))+')')
        expr='locator.set_params('+', '.join(args)+')'
        code+='\n///|\ntest '+moon('Log original partial parameter update '+str(index))+' {\n  let locator = @ticker.LogLocator::new(subs=Some('+subs([1.,2.])+'), numticks=Some('+number(9)+'))\n'
        code+=error_assert(expr) if observation['error'] else '  '+expr+'\n'
        code+=state_code(state(locator))+'}\n'
        updates.append(dict(params=params,state=state(locator),**observation))

    alias_rows=[]
    aliases=[('contiguous',False,[1.,2.,5.],[]),('signed',False,[5.,2.,1.],[(-1,-1,3)]),('nested',False,[1.,0.,2.,0.,5.],[(0,1,5),(4,-2,3)]),('zero stride',False,[2.],[(0,0,3)]),('empty',False,[],[]),('nonfinite',False,[-1.,0.,math.nan,math.inf],[]),('integer normalized',True,[1,2,5],[]),('integer signed normalized',True,[5,2,1],[(-1,-1,3)]),('integer zero stride normalized',True,[2],[(0,0,3)]),('integer large normalized',True,[2**53+1,2**63-1],[])]
    for label,is_integer,initial,slices in aliases:
        owner=np.array(initial,dtype=np.int64 if is_integer else np.float64); selected=owner; positions=np.arange(len(owner))
        for start,stride,length in slices:
            selected=source_view(selected,start,stride,length);positions=source_view(positions,start,stride,length)
        locator=Log(subs=selected);shallow=copy.copy(locator)
        stages=[dict(owner=owner.tolist(),state=state(locator))]
        if len(selected): owner[int(positions[0])]=7
        stages.append(dict(owner=owner.tolist(),state=state(locator)))
        if len(selected): locator._subs[-1]=8.25
        stages.append(dict(owner=owner.tolist(),state=state(locator),copy=state(shallow)))
        shallow.set_params(base=2.,subs='auto',numticks=3)
        stages.append(dict(owner=owner.tolist(),state=state(locator),copy=state(shallow)))
        code+='\n///|\ntest '+moon('Log original subs alias '+label)+' {\n'
        literal='['+', '.join(str(int(v))+'L' for v in initial)+']' if is_integer else moon(initial)
        code+='  let owner = '+literal+'\n'
        expr='@ticker.TickValues::from_int64_array(owner)' if is_integer else '@ticker.TickValues::from_array(owner)'
        for start,stride,length in slices:expr+='.view('+str(start)+', '+str(stride)+', '+str(length)+')'
        code+='  let locator = @ticker.LogLocator::new(subs=Some(@ticker.LogSubs::Values('+expr+')))\n  let shallow = locator.copy()\n'+state_code(stages[0]['state'])
        if len(selected):code+='  owner['+str(int(positions[0]))+'] = '+('7L' if is_integer else '7.0')+'\n'
        code+=state_code(stages[1]['state'])
        if len(selected):code+='  guard locator.subs() is @ticker.LogSubs::Values(normalized) else { fail("expected numeric subs") }\n  normalized.set(-1, 8.25)\n'
        code+=state_code(stages[2]['state'])+state_code(stages[2]['copy'],'shallow')
        own=stages[2]['owner'];code+=('  assert_eq(owner, ['+', '.join(str(int(v))+'L' for v in own)+'])\n' if is_integer else '  verify_log_params_values(owner, '+moon(own)+')\n')
        code+='  shallow.set_params(base=Some(2.0), subs=Some(@ticker.LogSubs::Text("auto")), numticks=Some('+number(3)+'))\n'
        code+=state_code(stages[3]['state'])+state_code(stages[3]['copy'],'shallow')+'}\n'
        alias_rows.append(dict(label=label,integer=is_integer,initial=initial,slices=slices,borrowed=locator._subs is selected,stages=stages))

    ranges=[]
    range_specs=[]
    for base in [10.,2.,2.5,1.,0.,-2.,math.nan,math.inf]:
        for bounds in [(0.,0.),(1.,1.),(.001,.001),(1.,100.),(-1.,10.),(-math.inf,math.inf),(math.nan,1.),(10.,1.)]:
            range_specs.append(dict(base=base,bounds=bounds,shared=[.01]))
    for shared in [[math.inf],[math.nan,.01],[.01,math.nan],[.1,0.],[-.1,.01],[]]:
        for bounds in [(-1.,10.),(1.,1.)]:range_specs.append(dict(base=10.,bounds=bounds,shared=shared))
    for index,spec in enumerate(range_specs):
        events=[];axis=Axis(events,shared=spec['shared']);locator=Log(base=spec['base']);locator.set_axis(axis)
        code+='\n///|\ntest '+moon('Log original nonsingular and live autolimits '+str(index))+' {\n  let previous = @config.axes_autolimit_mode()\n  defer @config.set_axes_autolimit_mode(previous)\n  let events : Array[String] = []\n  let locator = @ticker.LogLocator::new(base='+moon(spec['base'])+')\n'+bindings(spec)
        observations=[]
        for method,mode in [('nonsingular','data'),('view_limits','data'),('view_limits','round_numbers')]:
            rc['axes.autolimit_mode']=mode;events.clear()
            observation=observe(ns,lambda:getattr(locator,method)(*spec['bounds']))
            observation['events']=events[:];observations.append(dict(method=method,mode=mode,**observation))
            code+='  @config.set_axes_autolimit_mode('+moon(mode)+')\n  events.clear()\n'
            expr='locator.'+method+'('+moon(spec['bounds'][0])+', '+moon(spec['bounds'][1])+')'
            if observation['error']:code+=error_assert(expr)
            else:code+='  let (lo, hi) = '+expr+'\n  verify_log_params_values([lo, hi], '+moon(observation['values'])+')\n'
            code+='  assert_eq(events, '+moon(observation['events'])+')\n  assert_eq(locator.warnings(), '+moon(observation['warnings'])+')\n'
        code+='}\n';ranges.append(dict(spec=spec,observations=observations))

    providers=[]
    provider_specs=[dict(label='call view then automatic space'),dict(label='call view before space error',fail='space'),dict(label='call view error first',fail='view'),dict(label='negative call reads own minpos',view=[-1.,100.]),dict(label='own minpos error after space',view=[-1.,100.],fail='minpos'),dict(label='explicit budget skips space',view=[-1.,100.],count=9,fail='space'),dict(label='reversed positive first does not read own minpos',view=[100.,-1.]),dict(label='nonsingular shared error',method='nonsingular',fail='shared'),dict(label='nonsingular item error',method='nonsingular',shared=[.01,.02],fail='shared 1'),dict(label='nonsingular nonpositive skips errors',method='nonsingular',view=[-1.,0.],fail='shared'),dict(label='nonsingular nonfinite skips errors',method='nonsingular',view=[math.nan,math.inf],fail='shared')]
    for index,spec in enumerate(provider_specs):
        events=[];axis=Axis(events,view=spec.get('view',[1.,100.]),space=spec.get('space',9),shared=spec.get('shared',[.01]),fail=spec.get('fail'));locator=Log(numticks=spec.get('count'));locator.set_axis(axis)
        method=spec.get('method','call');view=spec.get('view',[1.,100.]);expr='locator.call()' if method=='call' else 'locator.nonsingular('+moon(view[0])+', '+moon(view[1])+')'
        observation=observe(ns,locator if method=='call' else lambda:locator.nonsingular(*view));observation['events']=events[:]
        code+='\n///|\ntest '+moon('Log original provider order '+spec['label'])+' {\n  let old_classic = @config.classic_mode()\n  defer @config.set_classic_mode(old_classic)\n  @config.set_classic_mode(false)\n  let events : Array[String] = []\n  let locator = @ticker.LogLocator::new(numticks='+('Some('+number(spec['count'])+')' if 'count' in spec else 'None')+')\n'+bindings(spec)
        if method=='nonsingular' and not observation['error']:
            code+='  let (lo, hi) = '+expr+'\n  verify_log_params_values([lo, hi], '+moon(observation['values'])+')\n  assert_eq(locator.warnings(), '+moon(observation['warnings'])+')\n'
        else:code+=result_code(observation,expr)
        code+='  assert_eq(events, '+moon(events)+')\n}\n';providers.append(dict(spec=spec,**observation))

    spaces=[]
    for index,value in enumerate([0.,-0.,-1.,2.,9.,float(2**53),1e100,sys.float_info.max,.5,-.5,math.nan,math.inf,-math.inf]):
        error=not math.isfinite(value) or not value.is_integer()
        expected=None if error else int(value)
        code+='\n///|\ntest '+moon('Log tick space integer transport '+str(index))+' {\n'
        expr='@ticker.LogTickSpace::from_integer('+moon(value)+')'
        code+=error_assert(expr) if error else '  assert_eq('+expr+', '+number(expected,space=True)+')\n'
        code+='}\n';spaces.append(dict(value=value,source_integer=expected,rejected=error))

    rc['_internal.classic_mode']=True
    locator=Log();shallow=copy.copy(locator)
    capture_states=[dict(state=state(locator),copy=state(shallow))]
    rc['_internal.classic_mode']=False
    locator.set_params(base=None,subs=None,numticks=None)
    capture_states.append(dict(state=state(locator),copy=state(shallow)))
    locator.numticks='AUTO'
    capture_states.append(dict(state=state(locator),copy=state(shallow)))
    code+='\n///|\ntest "Log original classic capture raw property and shallow scalar independence" {\n  let previous = @config.classic_mode()\n  defer @config.set_classic_mode(previous)\n  @config.set_classic_mode(true)\n  let locator = @ticker.LogLocator::new()\n  let shallow = locator.copy()\n'
    code+=state_code(capture_states[0]['state'])+state_code(capture_states[0]['copy'],'shallow')
    code+='  @config.set_classic_mode(false)\n  locator.set_params(base=None, subs=None, numticks=None)\n'+state_code(capture_states[1]['state'])+state_code(capture_states[1]['copy'],'shallow')
    code+='  locator.set_numticks(@ticker.LogNumTicks::Text("AUTO"))\n'+state_code(capture_states[2]['state'])+state_code(capture_states[2]['copy'],'shallow')+'}\n'

    unbound=[]
    for index,bounds in enumerate([(1.,10.),(1.,1.),(-1.,10.),(-1.,0.),(math.nan,math.inf)]):
        locator=Log()
        observation=observe(ns,lambda:locator.nonsingular(*bounds))
        code+='\n///|\ntest '+moon('Log original unbound nonsingular '+str(index))+' {\n  let locator = @ticker.LogLocator::new()\n'
        expr='locator.nonsingular('+moon(bounds[0])+', '+moon(bounds[1])+')'
        if observation['error']:code+=error_assert(expr)
        else:code+='  let (lo, hi) = '+expr+'\n  verify_log_params_values([lo, hi], '+moon(observation['values'])+')\n'
        code+='  assert_eq(locator.warnings(), '+moon(observation['warnings'])+')\n}\n'
        unbound.append(dict(bounds=bounds,**observation))

    payload=dict(source='Matplotlib v3.11.2',ticker_sha256=TICKER_SHA,transforms_sha256=TRANSFORMS_SHA,api_sha256=API_SHA,rcsetup_sha256=RCSETUP_SHA,matplotlibrc_sha256=RC_SHA,numpy_core_sha256=NUMPY_SHA,python=sys.version.split()[0],numpy=np.__version__,
                 scope='Original LogLocator/Locator/_api and decade helpers execute; typed 1D native Float64/Int64 subs, raw numeric/text budgets and provider fixtures. Dynamic coercion, readonly flags and scalar/2D failed-shape mutation remain outside the typed input domain. External warnings use a sink; NumPy runtime warnings/logger routing are not migrated.',
                 constructors=constructors,updates=updates,aliases=alias_rows,ranges=ranges,providers=providers,integer_space_transport=spaces,classic_copy_states=capture_states,unbound_nonsingular=unbound)
    return json.dumps(clean(payload),indent=2,allow_nan=False)+'\n',formatted(code)


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    outputs=generate(args.ticker)
    for name,content in zip(['testdata/log_params_reference.json','ticker/log_params_reference_test.mbt'],outputs):
        path=ROOT/name
        if args.check:
            if not path.exists() or path.read_text()!=content:raise SystemExit('reference differs: '+name)
        else:path.write_text(content)
    p=json.loads(outputs[0]);print('Log params reference:',len(p['constructors']),'constructors,',len(p['updates']),'updates,',len(p['aliases']),'aliases,',len(p['ranges']),'ranges x3,',len(p['providers']),'provider cases,',len(p['integer_space_transport']),'integer transports')


if __name__=='__main__':main()
