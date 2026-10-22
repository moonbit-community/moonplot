"""Execute pinned SymmetricalLogLocator construction, raw storage and ranges.

Source AST methods are the oracle. Scale records and view callbacks are fixtures;
raw 1D Float64/Int64 arrays are never normalized as LogLocator Float64 inputs.
"""
from pathlib import Path
import argparse
import ast
import copy
import json
import math
import sys
import types
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_log_params_reference import load as load_base, number, error_assert, NUMPY_SHA
from generate_maxn_params_reference import source_view
from generate_multiple_locator_reference import clean, TICKER_SHA, TRANSFORMS_SHA, RC_SHA, RCSETUP_SHA
from generate_fixed_locator_reference import API_SHA

ROOT=Path(__file__).resolve().parents[1]


def load(path):
    ns=load_base(path)
    node=next(n for n in ast.parse(path.read_text()).body if isinstance(n,ast.ClassDef) and n.name=='SymmetricalLogLocator')
    exec(compile(ast.Module(body=[node],type_ignores=[]),str(path),'exec'),ns)
    return ns


def subs(value):
    if isinstance(value,str):return '@ticker.SymLogSubs::Text('+moon(value)+')'
    if isinstance(value,(int,float)):return '@ticker.SymLogSubs::Number('+moon(float(value))+')'
    return '@ticker.SymLogSubs::Values(@ticker.TickValues::from_array('+moon([float(v) for v in value])+'))'


def snapshot(locator):
    s=locator._subs
    return dict(base=locator._base,linthresh=locator._linthresh,numticks=locator.numticks,
                subs=s if isinstance(s,(str,int,float)) else s.tolist() if isinstance(s,np.ndarray) else list(s),
                subs_dtype=str(s.dtype) if isinstance(s,np.ndarray) else type(s).__name__)


def state_code(value,name='locator'):
    return ('  verify_symlog_params_number('+name+'.base(), '+moon(value['base'])+')\n'
            +'  verify_symlog_params_number('+name+'.linthresh(), '+moon(value['linthresh'])+')\n'
            +'  verify_symlog_params_numticks('+name+'.numticks(), '+number(value['numticks'])+')\n'
            +'  verify_symlog_params_subs('+name+'.subs(), '+subs(value['subs'])+')\n')


def observe(function):
    with warnings.catch_warnings():
        warnings.simplefilter('ignore',RuntimeWarning)
        try:
            result=function();return dict(values=None if result is None else [float(v) for v in result],source_error=None)
        except (ValueError,TypeError,AttributeError,OverflowError,ZeroDivisionError,IndexError,AssertionError) as exc:
            return dict(values=None,source_error=type(exc).__name__)


def query_code(expr,result,tuple_result=False):
    if result['source_error']:return error_assert(expr)
    if tuple_result:return '  let (lo, hi) = '+expr+'\n  verify_symlog_params_values([lo, hi], '+moon(result['values'])+')\n'
    return '  verify_symlog_params_values('+expr+', '+moon(result['values'])+')\n'


def ctor_arguments(spec):
    args=[]
    for key in ['base','linthresh']:
        if spec.get(key) is not None:args.append(key+'='+moon(spec[key]))
    if 'transform' in spec:
        t=spec['transform']
        if t=='linear':args.append('transform=@scale.Scale::Linear')
        elif t=='log':args.append('transform=@scale.Scale::Log')
        else:args.append('transform=@scale.Scale::SymLog(base='+moon(t['base'])+', linthresh='+moon(t['linthresh'])+', linscale='+moon(t['linscale'])+')')
    if spec.get('subs') is not None:args.append('subs=Some('+subs(spec['subs'])+')')
    return ', '.join(args)


def source_arguments(spec):
    result=dict(spec)
    if 'transform' in spec:
        t=spec['transform']
        if t=='linear':result['transform']=types.SimpleNamespace()
        elif t=='log':result['transform']=types.SimpleNamespace(base=10.)
        else:result['transform']=types.SimpleNamespace(**t)
    return result


def generate(path):
    ns=load(path);Sym=ns['SymmetricalLogLocator'];rc=ns['mpl'].rcParams
    code='''// Generated pinned SymmetricalLogLocator raw parameter, alias and range observations.

///|
fn verify_symlog_params_number(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn verify_symlog_params_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected { verify_symlog_params_number(actual[index], value) }
}

///|
fn verify_symlog_params_numticks(actual : @ticker.LogNumTicks, expected : @ticker.LogNumTicks) -> Unit raise {
  match (actual, expected) {
    (@ticker.LogNumTicks::Text(a), @ticker.LogNumTicks::Text(b)) => assert_eq(a, b)
    (@ticker.LogNumTicks::Integer(a), @ticker.LogNumTicks::Integer(b)) => assert_eq(a, b)
    (@ticker.LogNumTicks::Number(a), @ticker.LogNumTicks::Number(b)) => verify_symlog_params_number(a, b)
    _ => fail("unexpected symlog count storage")
  }
}

///|
fn verify_symlog_params_subs(actual : @ticker.SymLogSubs, expected : @ticker.SymLogSubs) -> Unit raise {
  match (actual, expected) {
    (@ticker.SymLogSubs::Text(a), @ticker.SymLogSubs::Text(b)) => assert_eq(a, b)
    (@ticker.SymLogSubs::Number(a), @ticker.SymLogSubs::Number(b)) => verify_symlog_params_number(a, b)
    (@ticker.SymLogSubs::Values(a), @ticker.SymLogSubs::Values(b)) => verify_symlog_params_values(a.to_array(), b.to_array())
    _ => fail("unexpected symlog subs storage")
  }
}
'''
    specs=[{},dict(base=10.),dict(linthresh=1.),dict(base=None,linthresh=1.),dict(base=10.,linthresh=None),dict(base=10.,linthresh=1.)]
    for t in ['linear','log',dict(base=2.,linthresh=.5,linscale=1.),dict(base=0.,linthresh=math.nan,linscale=-1.)]:
        specs.append(dict(transform=t,base=999.,linthresh=999.))
    raw=[0.,-0.,-1.,1.,2.,2.5,math.nan,math.inf,-math.inf,sys.float_info.max,5e-324,math.nextafter(1.,math.inf)]
    specs += [dict(base=v,linthresh=1.) for v in raw]+[dict(base=10.,linthresh=v) for v in raw]
    for s in [None,[],[1.],[2.,1.],[-1.,0.,math.nan,math.inf],'auto','all','bad',0.,math.nan,math.inf]:specs.append(dict(base=10.,linthresh=1.,subs=s))
    constructors=[]
    for index,spec in enumerate(specs):
        try:locator,error=Sym(**source_arguments(spec)),None
        except (ValueError,TypeError,AttributeError) as exc:locator,error=None,type(exc).__name__
        code+='\n///|\ntest '+moon('SymLog original constructor '+str(index))+' {\n'
        expr='@ticker.SymmetricalLogLocator::new('+ctor_arguments(spec)+')'
        if error:code+=error_assert(expr)
        else:code+='  let locator = '+expr+'\n'+state_code(snapshot(locator))+'  assert_true(locator.view_interval_provider() is None)\n'
        code+='}\n';constructors.append(dict(spec=spec,source_error=error,state=None if locator is None else snapshot(locator)))

    updates=[]
    params=[{},dict(subs=None,numticks=None),dict(subs=[]),dict(subs='auto'),dict(subs='all',numticks=2),dict(subs=0.,numticks=1),dict(subs=math.nan,numticks=math.inf),dict(subs=[2.,1.],numticks=2.5),dict(subs=[-1.,0.,math.nan,math.inf],numticks=-1)]
    params += [dict(numticks=n) for n in [0,1,-1,.5,2.5,math.nan,math.inf,-math.inf,'auto','bad',2**63,10**400]]
    for index,spec in enumerate(params):
        locator=Sym(base=10.,linthresh=1.);locator.set_params(**spec)
        simple=observe(lambda:locator.tick_values(-.5,.5));general=observe(lambda:locator.tick_values(-100.,100.))
        code+='\n///|\ntest '+moon('SymLog original raw update and delayed consumption '+str(index))+' {\n  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)\n'
        args=[]
        if spec.get('subs') is not None:args.append('subs='+subs(spec['subs']))
        if spec.get('numticks') is not None:args.append('numticks='+number(spec['numticks']))
        code+='  locator.set_params('+', '.join(args)+')\n'+state_code(snapshot(locator))
        code+=query_code('locator.tick_values(-0.5, 0.5)',simple)+query_code('locator.tick_values(-100.0, 100.0)',general)+'}\n'
        updates.append(dict(params=spec,state=snapshot(locator),simple=simple,general=general))

    aliases=[]
    alias_specs=[('float contiguous',False,[1.,2.,5.],[]),('float signed',False,[5.,2.,1.],[(-1,-1,3)]),('float nested',False,[1.,0.,2.,0.,5.],[(0,1,5),(4,-2,3)]),('float zero stride',False,[2.],[(0,0,3)]),('float empty',False,[],[]),('float nonfinite',False,[-1.,0.,math.nan,math.inf],[]),('integer contiguous',True,[1,2,5],[]),('integer signed',True,[5,2,1],[(-1,-1,3)]),('integer zero stride',True,[2],[(0,0,3)]),('integer exact large',True,[2**53+1,2**63-1],[])]
    for label,integer,initial,slices in alias_specs:
        owner=np.array(initial,dtype=np.int64 if integer else np.float64);selected=owner;positions=np.arange(len(owner))
        for start,stride,length in slices:selected=source_view(selected,start,stride,length);positions=source_view(positions,start,stride,length)
        locator=Sym(base=10.,linthresh=1.,subs=selected);shallow=copy.copy(locator)
        stages=[dict(owner=owner.tolist(),state=snapshot(locator))]
        if len(selected):owner[int(positions[0])]=1.25
        stages.append(dict(owner=owner.tolist(),state=snapshot(locator)))
        if len(selected):locator._subs[-1]=3.75
        stages.append(dict(owner=owner.tolist(),state=snapshot(locator),copy=snapshot(shallow)))
        shallow.set_params(numticks=3,subs='bad')
        stages.append(dict(owner=owner.tolist(),state=snapshot(locator),copy=snapshot(shallow)))
        code+='\n///|\ntest '+moon('SymLog original retained subs alias '+label)+' {\n'
        literal='['+', '.join(str(int(v))+'L' for v in initial)+']' if integer else moon(initial)
        code+='  let owner = '+literal+'\n';expr='@ticker.TickValues::from_int64_array(owner)' if integer else '@ticker.TickValues::from_array(owner)'
        for start,stride,length in slices:expr+='.view('+str(start)+', '+str(stride)+', '+str(length)+')'
        code+='  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=Some(@ticker.SymLogSubs::Values('+expr+')))\n  let shallow = locator.copy()\n'+state_code(stages[0]['state'])
        if len(selected):code+='  owner['+str(int(positions[0]))+'] = '+('1L' if integer else '1.25')+'\n'
        code+=state_code(stages[1]['state'])
        if len(selected):code+='  guard locator.subs() is @ticker.SymLogSubs::Values(values) else { fail("expected numeric subs") }\n  values.set(-1, 3.75)\n'
        code+=state_code(stages[2]['state'])+state_code(stages[2]['copy'],'shallow')
        literal='['+', '.join(str(int(v))+'L' for v in stages[2]['owner'])+']' if integer else moon(stages[2]['owner'])
        code+=('  assert_eq(owner, '+literal+')\n') if integer else '  verify_symlog_params_values(owner, '+literal+')\n'
        code+='  shallow.set_params(numticks='+number(3)+', subs=@ticker.SymLogSubs::Text("bad"))\n'+state_code(stages[3]['state'])+state_code(stages[3]['copy'],'shallow')+'}\n'
        aliases.append(dict(label=label,integer=integer,initial=initial,slices=slices,shares_exact_input=locator._subs is selected,stages=stages))

    ranges=[]
    range_specs=[(base,bounds) for base in [10.,2.,2.5,1.,0.,-2.,math.nan,math.inf]
                 for bounds in [(0.,0.),(.001,.001),(1.,1.),(-1.,1.),(10.,-2.),(-math.inf,math.inf),(math.nan,1.)]]
    # Keep the original observations in place. These distinguish the original
    # Python-float zero short circuit from NumPy scalars produced by rounding.
    range_specs.extend((0.,bounds) for bounds in [(-0.,0.),(0.,-0.),(-0.,-0.)])
    range_specs.extend((-0.,bounds) for bounds in [(0.,0.),(-0.,0.),(0.,-0.),(-0.,-0.),(1.,1.)])
    range_specs.extend((base,bounds) for base in [0.,-0.]
                       for bounds in [(0.,1.),(-1.,0.),(5e-324,5e-324)])
    for base,bounds in range_specs:
        locator=Sym(base=base,linthresh=1.)
        code+='\n///|\ntest '+moon('SymLog original post-round nonsingular '+str(len(ranges)))+' {\n  let previous = @config.axes_autolimit_mode()\n  defer @config.set_axes_autolimit_mode(previous)\n  let locator = @ticker.SymmetricalLogLocator::new(base='+moon(base)+', linthresh=1.0)\n'
        observations=[]
        for method,mode in [('nonsingular','data'),('view_limits','data'),('view_limits','round_numbers')]:
            rc['axes.autolimit_mode']=mode;obs=observe(lambda:getattr(locator,method)(*bounds));observations.append(dict(method=method,mode=mode,**obs))
            code+='  @config.set_axes_autolimit_mode('+moon(mode)+')\n'+query_code('locator.'+method+'('+moon(bounds[0])+', '+moon(bounds[1])+')',obs,True)
        code+='}\n';ranges.append(dict(base=base,bounds=bounds,observations=observations))

    events=[]
    class Axis:
        def __init__(self,name,view):self.name,self.view=name,view
        def get_view_interval(self):events.append(self.name);return self.view
    a=Axis('first',(-10.,10.));b=Axis('second',(.2,.8));locator=Sym(base=10.,linthresh=1.);locator.set_axis(a);shallow=copy.copy(locator)
    stages=[]
    for name,obj in [('locator',locator),('shallow',shallow)]:stages.append(dict(name=name,query=observe(obj)))
    a.view=(-100.,100.);stages.append(dict(name='shallow',query=observe(shallow)))
    locator.set_axis(b);stages.append(dict(name='locator',query=observe(locator)));stages.append(dict(name='shallow',query=observe(shallow)))
    code+='\n///|\ntest "SymLog original view provider shallow copy and rebind" {\n  let events : Array[String] = []\n  let view = Ref((-10.0, 10.0))\n  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)\n  locator.bind_view_interval(fn() { events.push("first"); view.val })\n  let shallow = locator.copy()\n'
    for i,stage in enumerate(stages):
        if i==2:code+='  view.val = (-100.0, 100.0)\n'
        if i==3:code+='  locator.bind_view_interval(fn() { events.push("second"); (0.2, 0.8) })\n'
        code+=query_code(stage['name']+'.call()',stage['query'])
    code+='  assert_eq(events, '+moon(events)+')\n}\n'

    payload=dict(source='Matplotlib v3.11.2',ticker_sha256=TICKER_SHA,transforms_sha256=TRANSFORMS_SHA,api_sha256=API_SHA,rcsetup_sha256=RCSETUP_SHA,matplotlibrc_sha256=RC_SHA,numpy_core_sha256=NUMPY_SHA,python=sys.version.split()[0],numpy=np.__version__,
        scope='Complete original SymmetricalLogLocator and inherited Locator/decade bodies execute. Existing typed Scale records project source transform base/linthresh fields; non-SymLog variants project missing attributes. Raw 1D Float64/Int64 and scalar Double/text subs are retained; dynamic objects, readonly/other dtype and NDArray shape remain outside typed domain. Double base and direct bounds project Python float, preserving zero helper short circuits versus generated NumPy scalars at strict decade division. NumPy runtime warnings/logger host routing are not migrated. D24 mathematical/source primitive compatibility boundary remains explicit.',
        constructors=constructors,updates=updates,aliases=aliases,ranges=ranges,view_copy_stages=stages,view_events=events)
    return json.dumps(clean(payload),indent=2,allow_nan=False)+'\n',formatted(code)


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args();outputs=generate(args.ticker)
    for name,content in zip(['testdata/symlog_params_reference.json','ticker/symlog_params_reference_test.mbt'],outputs):
        path=ROOT/name
        if args.check:
            if not path.exists() or path.read_text()!=content:raise SystemExit('reference differs: '+name)
        else:path.write_text(content)
    p=json.loads(outputs[0]);print('SymLog params reference:',len(p['constructors']),'constructors,',len(p['updates']),'updates x2 consumption,',len(p['aliases']),'aliases x4 stages,',len(p['ranges']),'ranges x3,',len(p['view_copy_stages']),'view/copy stages')


if __name__=='__main__':main()
