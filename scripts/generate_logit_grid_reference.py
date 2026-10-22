"""Pinned complete Logit AST with separate original and mathematical profiles.

Logit's own log10 / Python-integer ideal powers use the accepted portable math
profile. A bounded MaxN correction replaces only the two original scale_range
10**power AST expressions with independently correctly rounded Fraction powers;
all other inherited MaxN arithmetic is unchanged. The original profile is intact.
"""
from pathlib import Path
import argparse
import ast
import builtins
import hashlib
import json
import math
import sys
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_asinh_math_reference import stable_math
from generate_log_params_reference import load as load_base, NUMPY_SHA
from generate_multiple_locator_reference import clean, TICKER_SHA
from generate_symlog_grid_reference import power

ROOT=Path(__file__).resolve().parents[1]
CAP=100000
BUDGET=250000


class EnumerationBudget(Exception):pass


class ScaleDecimalPowerCorrection(ast.NodeTransformer):
    """Change only the two decimal powers in the complete original function."""
    def __init__(self):self.replacements=0
    def visit_BinOp(self,node):
        node=self.generic_visit(node)
        if isinstance(node.op,ast.Pow)and isinstance(node.left,ast.Constant)and node.left.value==10:
            self.replacements+=1
            return ast.copy_location(ast.Call(func=ast.Name(id='_logit_scale_decimal_power',ctx=ast.Load()),args=[node.left,node.right],keywords=[]),node)
        return node


class MathematicalInteger(int):
    def __rpow__(self,base):return power(base,float(self))
    def __neg__(self):return MathematicalInteger(-int(self))
    def __sub__(self,other):return MathematicalInteger(int(self)-other)


class SourceNumpy:
    def __init__(self,mathematical,target):self.mathematical,self.target,self.events=mathematical,target,[]
    def __getattr__(self,name):return getattr(np,name)
    def log10(self,value):
        if self.mathematical and sys._getframe(1).f_code is self.target:return np.float64(stable_math('log10',float(value))[0])
        return np.log10(value)
    def arange(self,*args,**kwargs):
        if len(args)>=2:
            delta=args[1]-args[0];step=args[2]if len(args)>2 else 1
            with np.errstate(all='ignore'):ratio=delta/step
            if math.isfinite(float(ratio))and BUDGET<float(ratio)<2**60:
                self.events.append(dict(operation='arange',arguments=[str(x)for x in args],independent_budget_omission=True));raise EnumerationBudget()
        values=np.arange(*args,**kwargs)
        self.events.append(dict(operation='arange',arguments=[str(x)for x in args],dtype=str(values.dtype),observed_length=len(values)))
        return values


class Projection:
    def __init__(self,owner):self.owner=owner;self.reads=0
    @property
    def name(self):
        owner=self.owner;owner.events.append('projection');values=owner.spec['projection'];value=values[min(self.reads,len(values)-1)];self.reads+=1
        if value=='FAIL':raise ValueError('fixture projection')
        return value


class Axis:
    def __init__(self,events,spec):
        self.events,self.spec,self.space_read=events,spec,0
        if 'projection'in spec:self.axes=Projection(self)
    def __getattribute__(self,name):
        keys=dict(get_tick_space='space',get_minpos='minpos',get_view_interval='view')
        if name in keys and keys[name]not in object.__getattribute__(self,'spec'):raise AttributeError('fixture missing '+name)
        return object.__getattribute__(self,name)
    def get_tick_space(self):
        self.events.append('space');values=self.spec['space'];value=values[min(self.space_read,len(values)-1)];self.space_read+=1;return value
    def get_minpos(self):
        self.events.append('minpos')
        if self.spec.get('fail')=='minpos':raise ValueError('fixture minpos')
        return self.spec['minpos']
    def get_view_interval(self):
        self.events.append('view')
        if self.spec.get('fail')=='view':raise ValueError('fixture view')
        return self.spec['view']


def load(path):
    ns=load_base(path);tree=ast.parse(path.read_text());node=next(n for n in tree.body if isinstance(n,ast.ClassDef)and n.name=='LogitLocator')
    exec(compile(ast.Module(body=[node],type_ignores=[]),str(path),'exec'),ns)
    inner=next(n for n in ast.walk(node)if isinstance(n,ast.FunctionDef)and n.name=='ideal_ticks')
    exec(compile(ast.Module(body=[inner],type_ignores=[]),str(path),'exec'),ns)
    ns['_logit_original_scale_range']=ns['scale_range']
    scale_node=next(n for n in tree.body if isinstance(n,ast.FunctionDef)and n.name=='scale_range')
    correction=ScaleDecimalPowerCorrection();scale_node=correction.visit(scale_node)
    if correction.replacements!=2:raise ValueError('pinned scale_range decimal-power locations differ')
    ns['_logit_scale_decimal_power']=power
    exec(compile(ast.fix_missing_locations(ast.Module(body=[scale_node],type_ignores=[])),str(path),'exec'),ns)
    ns['_logit_mathematical_scale_range']=ns['scale_range']
    ns['scale_range']=ns['_logit_original_scale_range']
    return ns


def observe(ns,case,mathematical):
    events=[];ns['external_warnings'].clear();ns['mpl'].rcParams['axes.autolimit_mode']=case['mode']
    ns['scale_range']=ns['_logit_mathematical_scale_range'if mathematical else'_logit_original_scale_range']
    locator=ns['LogitLocator'](case['minor'],nbins=case['nbins'])
    if case['params']:locator.set_params(**case['params'])
    if case['axis']is not None:locator.axis=Axis(events,case['axis'])
    target=locator.tick_values.__code__;proxy=SourceNumpy(mathematical,target);ns['np']=proxy
    def source_range(*args):
        original=builtins.range(*args)
        return (MathematicalInteger(x)for x in original)if mathematical and sys._getframe(1).f_code is target else original
    ns['range']=source_range;captured={}
    def trace(frame,event,argument):
        if frame.f_code is target:
            if event in['line','return','exception']:captured.update(frame.f_locals)
            return trace
        return None
    sys.settrace(trace)
    try:
        if case['method']=='call':values=locator()
        else:values=getattr(locator,case['method'])(*case['bounds'])
        values=[float(x)for x in values];length=len(values);result=dict(source_error=None,observed_length=length,eager_length=min(length,CAP))
        if length<=3000:result['values']=values
        else:
            indices=sorted(set(list(range(8))+list(range(min(length,CAP)-4,min(length,CAP)))+list(range(min(length,CAP)//2-2,min(length,CAP)//2+2))))
            result['samples']=[[index,values[index]]for index in indices];result['full_last']=values[-4:]
    except EnumerationBudget:result=dict(source_error=None,query_omitted=True,reason='Independent allocation budget before arange; no source error or result inferred')
    except Exception as exc:result=dict(source_error=type(exc).__name__,message=str(exc))
    finally:sys.settrace(None)
    result.update(events=events,warnings=ns['external_warnings'][:],numpy_events=proxy.events)
    result['locals']={name:dict(type=type(captured[name]).__name__,value=str(captured[name]))for name in['nbins','vmin','vmax','binf','bsup','numideal','subsampling_factor']if name in captured}
    return result


def parameters(params):
    args=[]
    for key,value in params.items():
        if key=='steps':args.append('steps='+('None'if value is None else'Some(TickValues::from_array('+moon([float(x)for x in value])+'))'))
        elif key=='prune':args.append('prune='+('None'if value is None else'Some('+moon(value)+')'))
        else:args.append(key+'='+moon(value))
    return ', '.join(args)


def bindings(spec):
    if spec is None:return ''
    code=''
    if 'space'in spec:
        code+='  let space_values = '+moon([float(x)for x in spec['space']])+'\n  let space_index = [0]\n  locator.bind_tick_space(() => { events.push("space"); let index = Int32::min(space_index[0], space_values.length() - 1); space_index[0] += 1; space_values[index] })\n'
    if 'projection'in spec:
        code+='  let projection_values = '+moon(spec['projection'])+'\n  let projection_index = [0]\n  locator.bind_projection(() => { events.push("projection"); let index = Int32::min(projection_index[0], projection_values.length() - 1); projection_index[0] += 1; let value = projection_values[index]; if value == "FAIL" { raise @core.DataError::InvalidTicks(message="fixture projection") }; value })\n'
    if 'minpos'in spec:
        body='raise @core.DataError::InvalidTicks(message="fixture minpos")'if spec.get('fail')=='minpos'else moon(float(spec['minpos']))
        code+='  locator.bind_minpos(() => { events.push("minpos"); '+body+' })\n'
    if 'view'in spec:
        body='raise @core.DataError::InvalidTicks(message="fixture view")'if spec.get('fail')=='view'else '('+moon(float(spec['view'][0]))+', '+moon(float(spec['view'][1]))+')'
        code+='  locator.bind_view_interval(() => { events.push("view"); '+body+' })\n'
    return code


def test_code(case,result,index):
    if result.get('query_omitted'):return ''
    bins='None'if case['nbins']is None else'Some(MaxNBins::Auto)'if case['nbins']=='auto'else'Some(MaxNBins::Count('+str(case['nbins'])+'))'
    code='\n///|\ntest '+moon('Logit grid '+str(index)+' '+case['label'])+' {\n'
    code+='  let previous_mode = @config.axes_autolimit_mode()\n  defer @config.set_axes_autolimit_mode(previous_mode)\n  @config.set_axes_autolimit_mode('+moon(case['mode'])+')\n'
    code+='  let locator = LogitLocator::new(minor='+moon(case['minor'])+', nbins='+bins+')\n'
    if case['params']:code+='  locator.set_params('+parameters(case['params'])+')\n'
    code+='  let events : Array[String] = []\n'+bindings(case['axis'])
    query='locator.call()'if case['method']=='call'else'locator.'+case['method']+'('+moon(case['bounds'][0])+', '+moon(case['bounds'][1])+')'
    if result['source_error']:code+='  assert_true(try { ignore('+query+'); false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })\n'
    elif case['method']in['nonsingular','view_limits']:code+='  let (lower, upper) = '+query+'\n  verify_logit_grid_bits([lower, upper], '+moon(result['values'])+')\n'
    elif 'values'in result:code+='  verify_logit_grid_bits('+query+', '+moon(result['values'])+')\n'
    else:
        code+='  let ticks = '+query+'\n  assert_eq(ticks.length(), '+str(result['eager_length'])+')\n'
        code+='  verify_logit_grid_bits(['+', '.join('ticks['+str(i)+']'for i,v in result['samples'])+'], '+moon([v for i,v in result['samples']])+')\n'
    code+='  assert_eq(events, '+moon(result['events'])+')\n  assert_eq(locator.warnings(), '+moon(result['warnings'])+')\n'
    return code+'}\n'


def generate(path):
    ns=load(path);cases=[]
    def add(label,bounds=(1e-4,.9999),minor=False,nbins='auto',axis=None,params=None,method='tick_values',mode='data'):
        cases.append(dict(label=label,bounds=[float(x)for x in bounds],minor=minor,nbins=nbins,axis=axis,params=params or{},method=method,mode=mode))
    def context(space=(9.,),minpos=1e-7,projection=('rectilinear',),**extra):return dict(space=list(space),minpos=minpos,projection=list(projection),**extra)
    for bounds in[(0.,1.),(1.,0.),(-1.,0.),(1.,2.),(-1.,.9),(.1,2.),(.5,.5),(.1,.1),(.9,.9),(5e-324,math.nextafter(1.,0.)),(math.nan,.5),(.1,math.inf),(.49,.51),(.1,.2),(.8,.9),(math.nextafter(.9,0.),math.nextafter(.9,1.))]:
        for minor in[False,True]:add('nonsingular phases and raw neighbor preservation',bounds=bounds,minor=minor)
    for nbins in[-2147483648,-1000,-20,-5,-2,-1,0,1,2,3,4,9,100,2147483647,None]:
        for minor in[False,True]:
            for bounds in[(1e-4,.9999),(.49,.51)]:add('explicit budget and sparse minor strategy',bounds=bounds,minor=minor,nbins=nbins)
    for space in[-math.inf,-10.,0.,1.,1.5,2.,2.5,3.5,10.,100.,math.nan,math.inf]:
        for bounds in[(1e-4,.9999),(.49,.51)]:
            for minor in[False,True]:add('first auto space only minimum two',bounds=bounds,minor=minor,axis=context(space=(space,)))
    for minpos in[-math.inf,math.inf,math.nan,-1.,-0.,0.,5e-324,1e-100,1e-7,.5,.6,.9,1.,2.]:
        for bounds in[(0.,1.),(.1,.9),(-1.,.9)]:
            for method in['tick_values','nonsingular']:add('raw own minpos and late integer errors',bounds=bounds,nbins=1000,axis=context(minpos=minpos),method=method)
    for params in[dict(integer=True),dict(symmetric=True),dict(prune='both'),dict(steps=[1,3,10]),dict(steps=None),dict(min_n_ticks=10)]:
        for bounds in[(1e-4,.9999),(.49,.51)]:
            for minor in[False,True]:add('inherited fields affect fallback only',bounds=bounds,nbins=7,params=params,minor=minor)
    for spec in[context(space=(9.,2.)),context(projection=('rectilinear','3d')),context(projection=('rectilinear','FAIL')),context(space=(math.nan,)),context(space=(math.nan,),projection=('rectilinear','FAIL'))]:
        for integer in[False,True]:add('dynamic fallback context and deferred empty guard',bounds=(.49,.51),axis=spec,params=dict(integer=integer))
    for spec in[dict(projection=['polar']),dict(projection=['rectilinear']),dict(space=[9.]),dict(minpos=1e-7),context(fail='minpos'),context(projection=('FAIL',))]:
        for nbins in['auto',9]:add('projection gate and missing bound providers',nbins=nbins,axis=spec)
    for mode in['data','round_numbers']:
        for spec in[context(projection=('3d',)),context(projection=('polar',)),context(projection=('FAIL',)),dict(minpos=.5)]:add('inherited view limits bypass own logit gates',axis=spec,bounds=(-.1,1.1),method='view_limits',mode=mode)
    for minor in[False,True]:
        for nbins in[2,9,1000]:add('complete extreme double raw ideals',bounds=(5e-324,math.nextafter(1.,0.)),nbins=nbins,minor=minor)
    for view in[(1e-4,.9999),(.49,.51)]:add('call dispatch retains own logit strategy',bounds=view,axis=context(view=list(view)),method='call')
    add('full fallback125001 before cap',bounds=(.375,.625),nbins=125000)
    add('full fallback200001 before cap',bounds=(.4,.6),nbins=200000)
    add('full fallback199999 prune before cap',bounds=(.4,.6),nbins=200000,params=dict(prune='both'))
    add('independent allocation omission',bounds=(.49,.51),nbins=1000000)
    code='''// Complete original Logit AST; MaxN scale_range has only its bounded decimal-power correction.

///|
fn verify_logit_grid_bits(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}
'''
    rows=[];differences=[]
    for index,case in enumerate(cases):
        actual=observe(ns,case,False);mathematical=observe(ns,case,True)
        different=any(json.dumps(clean(actual.get(k)),sort_keys=True)!=json.dumps(clean(mathematical.get(k)),sort_keys=True)for k in['source_error','observed_length','values','samples','events','warnings'])
        if different:differences.append(index)
        rows.append(dict(case=case,original_source=actual,mathematical_profile=mathematical,source_profile_difference=different));code+=test_code(case,mathematical,index)
    powers=[]
    for phase in range(-324,17):
        original=float(ns['ideal_ticks'](phase));mathematical=float(ns['ideal_ticks'](MathematicalInteger(phase)))
        powers.append(dict(phase=phase,original_source=original,mathematical_profile=mathematical))
        code+='\n///|\ntest '+moon('Logit original ideal integer phase '+str(phase))+' { verify_logit_grid_bits([logit_grid_ideal('+str(phase)+')], ['+moon(mathematical)+']) }\n'
    payload=dict(ticker_source_sha256=TICKER_SHA,class_source_segment_sha256='8d6943a96527afac582bed4ff88a689d2d8fd4cb7f45f2882e7cb687e4e5d70d',
                 original_profile=dict(python=sys.version.split()[0],numpy=np.__version__,numpy_core_sha256=NUMPY_SHA,platform='fixed Darwin arm64'),
                 source_bodies=['Complete original LogitLocator class','Complete original MaxNLocator/scale_range/_Edge_integer/nonsingular','Original nested ideal_ticks function','Real NumPy arange/multiply/subtract/array'],
                 mathematical_boundary='Logit-frame specialized log10 and Python-int ideal powers use independent Decimal180/320/Fraction values. The only inherited MaxN correction is the two 10**power expressions in the complete original scale_range AST, evaluated by independent correctly rounded Fraction powers. All other inherited MaxN arithmetic is unchanged; original_source retains both original powers. Raw order, repeated values and underflow zero are preserved; no Asinh sortedset/canonical-NaN rule.',
                 maxn_bounded_correction=dict(function='scale_range',original_decimal_power_expressions=2,replacement='Independent Fraction exact-input power followed by one binary64 rounding for finite integer decimal phases; IEEE wrapper for nonfinite exponent',unchanged='Original math.log10, floor division, copysign, all other MaxN arithmetic, state, provider order, grid, prune and cap'),
                 allocation_budget=BUDGET,port_cap=CAP,source_profile_differences=differences,cases=rows,integer_ideal_phases=powers)
    return clean(payload),formatted(code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore',RuntimeWarning);payload,code=generate(args.ticker)
    outputs={ROOT/'testdata/logit_grid_reference.json':json.dumps(payload,indent=2,allow_nan=False)+'\n',ROOT/'ticker/logit_grid_reference_wbtest.mbt':code}
    for path,text in outputs.items():
        if args.check:
            if not path.exists()or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    rows=payload['cases'];omitted=sum(bool(r['mathematical_profile'].get('query_omitted'))for r in rows)
    print('Logit grid:',len(rows),'dualAST cases,',len(payload['integer_ideal_phases']),'full phase powers,',len(rows)-omitted+len(payload['integer_ideal_phases']),'generated tests,',len(payload['source_profile_differences']),'source/math differences,',omitted,'independent omissions')


if __name__=='__main__':main()
