"""Execute original LogitLocator/MaxN parameter, context and range methods.

The source API helpers and full classes remain the oracle. Fixtures supply only
axis getters and warning recording; no port numerical code manufactures values.
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
from generate_log_params_reference import load as load_base, error_assert, NUMPY_SHA
from generate_maxn_params_reference import snapshot as maxn_snapshot, bins, option_string, source_view
from generate_multiple_locator_reference import clean, TICKER_SHA, TRANSFORMS_SHA

ROOT=Path(__file__).resolve().parents[1]


def load(path):
    ns=load_base(path)
    node=next(n for n in ast.parse(path.read_text()).body if isinstance(n,ast.ClassDef) and n.name=='LogitLocator')
    exec(compile(ast.Module(body=[node],type_ignores=[]),str(path),'exec'),ns)
    return ns


def snapshot(locator):
    return dict(minor=locator.minor,**maxn_snapshot(locator),steps_dtype=str(locator._steps.dtype))


def state_code(state,name='locator'):
    return ('  assert_eq('+name+'.minor(), '+moon(state['minor'])+')\n'
            +'  verify_logit_params_state('+name+'.as_maxn_locator(), '+bins(state['nbins'])+', '+moon(state['integer'])+', '+moon(state['symmetric'])+', '+option_string(state['prune'])+', '+str(state['min_n_ticks'])+', '+moon(state['steps'])+', '+moon(state['extended_steps'])+')\n')


def arguments(spec,constructor=False):
    args=[]
    for key,value in spec.items():
        if key=='nbins':expr=('None'if value is None else'Some('+bins(value)+')')if constructor else bins(value)
        elif key=='minor':expr=moon(value)if constructor else'None'if value is None else'Some('+moon(value)+')'
        elif key=='steps':expr='None'if value is None else'Some(@ticker.TickValues::from_array('+moon([float(v)for v in value])+'))'
        elif key=='prune':expr=option_string(value)
        else:expr=moon(value)
        args.append(key+'='+expr)
    return ', '.join(args)


def observe(ns,fn):
    ns['external_warnings'].clear()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore',RuntimeWarning)
        try:r=fn();values=None if r is None else list(map(float,r));error=None
        except (ValueError,TypeError,AttributeError,NotImplementedError,ZeroDivisionError,OverflowError,IndexError)as exc:values=None;error=type(exc).__name__
    return dict(values=values,source_error=error,warnings=ns['external_warnings'][:])


def query_code(expr,obs,pair=False):
    if obs['source_error']:code=error_assert(expr)
    elif pair:code='  let (lower, upper) = '+expr+'\n  verify_logit_params_values([lower, upper], '+moon(obs['values'])+')\n'
    else:code='  verify_logit_params_values('+expr+', '+moon(obs['values'])+')\n'
    return code+'  assert_eq(locator.warnings(), '+moon(obs['warnings'])+')\n'


def bind_source(locator,spec,events):
    if not spec:return
    counts={}
    def read(name,value):
        events.append(name);counts[name]=counts.get(name,0)+1
        if spec.get('fail')==name and counts[name]==spec.get('fail_at',1):raise ValueError('fixture '+name)
        return value
    axis=types.SimpleNamespace()
    if 'space'in spec:axis.get_tick_space=lambda:read('space',spec['space'])
    if 'minpos'in spec:axis.get_minpos=lambda:read('minpos',spec['minpos'])
    if 'view'in spec:axis.get_view_interval=lambda:read('view',spec['view'])
    if 'projection'in spec:
        class Projection:
            @property
            def name(self):return read('projection',spec['projection'])
        axis.axes=Projection()
    locator.set_axis(axis)


def bind_code(spec):
    code=''
    for key,method in [('space','tick_space'),('minpos','minpos'),('view','view_interval'),('projection','projection')]:
        if key not in spec:continue
        value=spec[key]
        expr='('+moon(value[0])+', '+moon(value[1])+')'if key=='view'else moon(float(value))if key in ['space','minpos']else moon(value)
        body='events.push('+moon(key)+'); '+expr
        effect=''
        if spec.get('fail')==key:
            if key=='space':raise ValueError('raising tick space outside typed callback domain')
            code+='  let '+key+'_reads = Ref(0)\n'
            body='events.push('+moon(key)+'); '+key+'_reads.val += 1; if '+key+'_reads.val == '+str(spec.get('fail_at',1))+' { raise @core.DataError::InvalidTicks(message="fixture '+key+'") }; '+expr
            effect=' raise @core.DataError'
        code+='  locator.bind_'+method+'(fn()'+effect+' { '+body+' })\n'
    return code


def generate(path):
    ns=load(path);L=ns['LogitLocator'];rc=ns['mpl'].rcParams
    code='''// Complete pinned LogitLocator and inherited MaxN object protocols.

///|
fn verify_logit_params_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}

///|
fn verify_logit_params_state(
  state : @ticker.MaxNLocator, nbins : @ticker.MaxNBins, integer : Bool,
  symmetric : Bool, prune : String?, min_ticks : Int32,
  steps : Array[Double], extended : Array[Double],
) -> Unit raise {
  assert_eq(state.nbins(),nbins)
  assert_eq(state.integer(),integer)
  assert_eq(state.symmetric(),symmetric)
  assert_eq(state.prune(),prune)
  assert_eq(state.min_n_ticks(),min_ticks)
  verify_logit_params_values(state.steps().to_array(),steps)
  verify_logit_params_values(state.extended_steps(),extended)
}
'''
    constructors=[];dispatch=[]
    class Trace(L):
        def set_params(self,*args,**kwargs):
            dispatch.append(dict(minor_before=self._minor,keys=list(kwargs)))
            return super().set_params(*args,**kwargs)
    for classic in [False,True]:
        rc['_internal.classic_mode']=classic
        for minor in [False,True]:
            for budget in ['omitted',None,'auto',0,-1,1,3,2147483647]:
                spec=dict(minor=minor)
                if budget!='omitted':spec['nbins']=budget
                obj=Trace(**spec);state=snapshot(obj)
                code+='\n///|\ntest '+moon('Logit original constructor '+str(len(constructors)))+' {\n  let old = @config.classic_mode()\n  defer @config.set_classic_mode(old)\n  @config.set_classic_mode('+moon(classic)+')\n  let locator = @ticker.LogitLocator::new('+arguments(spec,True)+')\n'+state_code(state)+'  assert_eq(locator.warnings(), [])\n}\n'
                constructors.append(dict(classic=classic,params=spec,state=state,virtual_dispatch=dispatch[-1]))
    updates=[]
    specs=[{},dict(minor=None),dict(minor=True),dict(minor=False,nbins=3),dict(minor=True,steps=None,prune=None),dict(minor=True,nbins=3,symmetric=True,prune='bad',min_n_ticks=7,steps=[1,2,10],integer=True),dict(minor=True,nbins=3,symmetric=True,prune='both',min_n_ticks=7,steps=[2,1],integer=True),dict(minor=True,steps=[]),dict(minor=True,steps=[1]),dict(minor=True,steps=[2,4,8],integer=True),dict(minor=True,steps=[1,math.nan,10]),dict(minor=True,min_n_ticks=0),dict(minor=True,min_n_ticks=-3),dict(minor=True,nbins=0),dict(minor=True,nbins=-1),dict(prune='upper',integer=True,symmetric=True),dict(steps=None)]
    for spec in specs:
        locator=L();obs=observe(ns,lambda:locator.set_params(**spec));state=snapshot(locator)
        code+='\n///|\ntest '+moon('Logit original partial update '+str(len(updates)))+' {\n  let locator = @ticker.LogitLocator::new()\n'
        expr='locator.set_params('+arguments(spec)+')'
        code+=error_assert(expr)if obs['source_error']else'  '+expr+'\n'
        code+=state_code(state)+'}\n';updates.append(dict(params=spec,observation=obs,state=state))

    locator=L();property_stages=[]
    code+='\n///|\ntest "Logit original minor property None keeps" {\n  let locator = @ticker.LogitLocator::new()\n'
    for value in [None,True,None,False]:
        locator.minor=value;property_stages.append(snapshot(locator));code+='  locator.set_minor('+('None'if value is None else'Some('+moon(value)+')')+')\n'+state_code(snapshot(locator))
    code+='}\n'

    aliases=[]
    for label,integer,initial,slices in [('float signed',False,[10.,5.,2.,1.],[(-1,-1,4)]),('integer signed',True,[10,5,2,1],[(-1,-1,4)]),('float normalized copy',False,[2.,4.,8.],[]),('integer normalized copy',True,[2,4,8],[])]:
        owner=np.array(initial,dtype=np.int64 if integer else np.float64);selected=owner;positions=np.arange(len(owner))
        for start,stride,length in slices:selected=source_view(selected,start,stride,length);positions=source_view(positions,start,stride,length)
        locator=L();locator.set_params(steps=selected);shallow=copy.copy(locator)
        stages=[dict(state=snapshot(locator),copy=snapshot(shallow),owner=owner.tolist())]
        owner[int(positions[0])]=1.25;locator._steps[1]=3.75
        stages.append(dict(state=snapshot(locator),copy=snapshot(shallow),owner=owner.tolist()))
        shallow.set_params(minor=True,nbins=4,steps=None)
        stages.append(dict(state=snapshot(locator),copy=snapshot(shallow),owner=owner.tolist()))
        literal='['+', '.join(str(int(v))+'L'for v in initial)+']'if integer else moon(initial)
        expr='@ticker.TickValues::from_'+('int64_array'if integer else'array')+'(owner)'
        for start,stride,length in slices:expr+='.view('+str(start)+', '+str(stride)+', '+str(length)+')'
        code+='\n///|\ntest '+moon('Logit original shared inherited steps '+label)+' {\n  let owner = '+literal+'\n  let locator = @ticker.LogitLocator::new()\n  locator.set_params(steps=Some('+expr+'))\n  let shallow = locator.copy()\n'+state_code(stages[0]['state'])
        code+='  owner['+str(int(positions[0]))+'] = '+('1L'if integer else'1.25')+'\n  locator.as_maxn_locator().steps().set(1,3.75)\n'+state_code(stages[1]['state'])+state_code(stages[1]['copy'],'shallow')
        own='['+', '.join(str(int(v))+'L'for v in stages[1]['owner'])+']'if integer else moon(stages[1]['owner'])
        code+=('  assert_eq(owner, '+own+')\n')if integer else'  verify_logit_params_values(owner, '+own+')\n'
        code+='  shallow.set_params(minor=Some(true), nbins=@ticker.MaxNBins::Count(4), steps=None)\n'+state_code(stages[2]['state'])+state_code(stages[2]['copy'],'shallow')+'}\n'
        aliases.append(dict(label=label,integer=integer,initial=initial,slices=slices,shares_memory=bool(np.shares_memory(selected,locator._steps)),stages=stages))

    queries=[]
    qspecs=[]
    for bounds in [(0.,0.),(1.,1.),(-2.,-1.),(1.,2.),(math.nan,.8),(-math.inf,math.inf),(.2,.8),(.5,.5),(0.,1.),(.8,.2)]:
        qspecs.append(dict(method='nonsingular',bounds=bounds,context={}))
    for minimum in [0.,-.1,.01,math.nan,math.inf,-math.inf,1.,2.]:
        qspecs.append(dict(method='nonsingular',bounds=(0.,1.),context=dict(minpos=minimum)))
    qspecs += [dict(method='nonsingular',bounds=bounds,context=dict(projection='rectilinear'))for bounds in [(.2,.8),(math.nan,.8),(-2.,-1.)]]
    for projection in ['rectilinear','polar','3d']:
        ctx=dict(projection=projection,space=9.,minpos=.01,view=(.01,.99))
        for minor,budget,method,bounds,mode in [(False,'auto','tick_values',(.01,.99),'data'),(True,'auto','tick_values',(.4,.6),'data'),(False,'auto','tick_values',(.4,.6),'data'),(False,4,'tick_values',(.4,.6),'data'),(False,'auto','call',(),'data'),(False,'auto','view_limits',(.4,.6),'data'),(False,'auto','view_limits',(.4,.6),'round_numbers')]:
            qspecs.append(dict(method=method,bounds=bounds,context=ctx,minor=minor,nbins=budget,mode=mode))
    for space in [0.,2.5,100.,math.nan,math.inf,-math.inf]:
        for bounds in [(.01,.99),(.4,.6)]:qspecs.append(dict(method='tick_values',bounds=bounds,context=dict(space=space,minpos=.01)))
    for method,ctx,bounds in [('tick_values',dict(minpos=.01),(.2,.8)),('tick_values',dict(space=9.),(.2,.8)),('call',dict(view=(.2,.8)),()),('call',dict(view=(.2,.8),projection='rectilinear',space=9.,minpos=.01,fail='view'),()),('call',dict(view=(.2,.8),projection='rectilinear',space=9.,minpos=.01,fail='projection'),()),('call',dict(view=(.2,.8),projection='rectilinear',space=9.,minpos=.01,fail='minpos'),()),('tick_values',dict(projection='rectilinear',space=9.,minpos=.01,fail='projection',fail_at=2),(.4,.6)),('view_limits',dict(projection='rectilinear',space=9.,minpos=.01,fail='projection'),(.4,.6))]:
        qspecs.append(dict(method=method,bounds=bounds,context=ctx,mode='round_numbers'if method=='view_limits'else'data'))
    for spec in qspecs:
        locator=L(minor=spec.get('minor',False),nbins=spec.get('nbins','auto'));events=[];bind_source(locator,spec['context'],events);rc['axes.autolimit_mode']=spec.get('mode','data')
        method=spec['method'];bounds=spec['bounds'];obs=observe(ns,lambda:locator()if method=='call'else getattr(locator,method)(*bounds))
        code+='\n///|\ntest '+moon('Logit original context and range '+str(len(queries)))+' {\n  let old = @config.axes_autolimit_mode()\n  defer @config.set_axes_autolimit_mode(old)\n  @config.set_axes_autolimit_mode('+moon(spec.get('mode','data'))+')\n  let events : Array[String] = []\n  let locator = @ticker.LogitLocator::new(minor='+moon(spec.get('minor',False))+', nbins=Some('+bins(spec.get('nbins','auto'))+'))\n'+bind_code(spec['context'])
        expr='locator.'+method+'('+', '.join(moon(v)for v in bounds)+')'
        code+=query_code(expr,obs,method in ['nonsingular','view_limits'])+'  assert_eq(events, '+moon(events)+')\n}\n'
        queries.append(dict(**spec,observation=obs,events=events))

    events=[];minimum=[.01]
    first=types.SimpleNamespace(get_minpos=lambda:(events.append('first'),minimum[0])[1])
    second=types.SimpleNamespace(get_minpos=lambda:(events.append('second'),.2)[1])
    locator=L();locator.set_axis(first);shallow=copy.copy(locator);provider_stages=[]
    provider_stages.append(dict(name='locator',observation=observe(ns,lambda:locator.nonsingular(0.,1.))))
    minimum[0]=.02;provider_stages.append(dict(name='shallow',observation=observe(ns,lambda:shallow.nonsingular(0.,1.))))
    locator.set_axis(second);provider_stages.append(dict(name='locator',observation=observe(ns,lambda:locator.nonsingular(0.,1.))))
    provider_stages.append(dict(name='shallow',observation=observe(ns,lambda:shallow.nonsingular(0.,1.))))
    code+='\n///|\ntest "Logit original provider closure copy and rebind" {\n  let events : Array[String] = []\n  let minimum = Ref(0.01)\n  let locator = @ticker.LogitLocator::new()\n  locator.bind_minpos(fn() { events.push("first"); minimum.val })\n  let shallow = locator.copy()\n'
    for index,stage in enumerate(provider_stages):
        if index==1:code+='  minimum.val = 0.02\n'
        if index==2:code+='  locator.bind_minpos(fn() { events.push("second"); 0.2 })\n'
        code+=query_code(stage['name']+'.nonsingular(0.0,1.0)',stage['observation'],True)
    code+='  assert_eq(events, '+moon(events)+')\n}\n'

    payload=dict(ticker_sha256=TICKER_SHA,transforms_sha256=TRANSFORMS_SHA,numpy_core_sha256=NUMPY_SHA,python=sys.version.split()[0],numpy=np.__version__,
                 scope='Complete original LogitLocator/MaxN methods and real API validation. Bool minor, Auto/Int32 nbins, existing Bool/Int32/nullable prune/Float64 or Int64 1D steps. Constructor nbins omission differs from explicit None. Raw unsupported nbins None/text/hugeinteger setter slots and dynamic minor truthiness are excluded, not mapped to keep. Projection/view/minpos fixtures may raise; tick-space fixture follows existing pure Double domain. Recent-operation copied warnings are a typed port protocol around the source warning sink; MAXTICKS logger remains separate. Portable math profile is covered independently by the numerical generator.',
                 constructors=constructors,updates=updates,minor_property_stages=property_stages,aliases=aliases,queries=queries,provider_copy_stages=provider_stages,provider_events=events)
    return json.dumps(clean(payload),indent=2,allow_nan=False)+'\n',formatted(code)


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    outputs=generate(args.ticker)
    for name,content in zip(['testdata/logit_params_reference.json','ticker/logit_params_reference_test.mbt'],outputs):
        target=ROOT/name
        if args.check:
            if not target.exists()or target.read_text()!=content:raise SystemExit('reference differs: '+name)
        else:target.write_text(content)
    p=json.loads(outputs[0]);print('Logit params:',len(p['constructors']),'constructors,',len(p['updates']),'partial updates,',len(p['minor_property_stages']),'property stages,',len(p['aliases']),'aliases x3,',len(p['queries']),'context/range queries,',len(p['provider_copy_stages']),'provider copy stages')


if __name__=='__main__':main()
