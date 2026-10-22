"""Execute original SymmetricalLogLocator grids, with source/math profiles separate.

The second execution changes only ln/integer-power primitives to independently
computed Decimal/Fraction values, implementing the accepted D24 mathematical
contract. The complete original class still decides regions, types, phase,
reverse, zero collapse and flatten. Allocation omissions are never source errors.
"""
from pathlib import Path
import argparse
import ast
import decimal
from fractions import Fraction
import hashlib
import json
import math
import sys
import types
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_log_params_reference import load, number
from generate_maxn_params_reference import source_view
from generate_multiple_locator_reference import clean, TICKER_SHA

ROOT=Path(__file__).resolve().parents[1]
SAFE_ALLOCATION=400000
CAP=100000
POWERS={}
LOGS={}


class EnumerationBudget(Exception):pass


def logarithm(value):
    value=float(value)
    if value not in LOGS:
        if value<=0 or not math.isfinite(value):result=float(np.log(value))
        else:
            with decimal.localcontext()as ctx:
                ctx.prec=180;first=float(decimal.Decimal.from_float(value).ln())
                ctx.prec=320;result=float(decimal.Decimal.from_float(value).ln())
            if first!=result:raise ValueError('ln precision not stable')
        LOGS[value]=result
    return np.float64(LOGS[value])


def power(base,exponent):
    base,exponent=float(base),float(exponent)
    key=(base.hex(),exponent.hex())
    if key not in POWERS:
        if base==0 or not math.isfinite(base)or not math.isfinite(exponent):result=float(np.float64(base)**np.float64(exponent))
        elif abs(exponent)<=2048:
            exact=Fraction.from_float(base)**int(exponent)
            try:result=float(exact)
            except OverflowError:result=math.copysign(math.inf,-1. if exact<0 else 1.)
        else:
            with decimal.localcontext()as ctx:
                ctx.prec=180;ctx.Emax=999999999999999999;ctx.Emin=-999999999999999999;ctx.traps[decimal.Overflow]=False
                first=float(decimal.Decimal.from_float(base)**int(exponent))
                ctx.prec=320;result=float(decimal.Decimal.from_float(base)**int(exponent))
            if first!=result:raise ValueError('power precision not stable')
        POWERS[key]=result
    return POWERS[key]


class MathematicalExponents(np.ndarray):
    __array_priority__=10000
    def __rpow__(self,base):return np.array([power(base,x)for x in self],dtype=np.float64)


class BoundedNumpy:
    def __init__(self,mathematical=False):self.mathematical=mathematical;self.events=[]
    def __getattr__(self,name):return getattr(np,name)
    def log(self,value):return logarithm(value)if self.mathematical else np.log(value)
    def arange(self,*args):
        start,stop,step=(0,args[0],1)if len(args)==1 else(args[0],args[1],args[2]if len(args)>2 else 1)
        event=dict(operation='np.arange',arguments=[str(x)for x in args],types=[type(x).__name__ for x in args]);self.events.append(event)
        with np.errstate(all='ignore'):estimate=(stop-start)/step
        if math.isfinite(estimate)and SAFE_ALLOCATION<estimate<2**60-64:
            event.update(independent_budget_omission=True,allocation_estimate=str(estimate));raise EnumerationBudget()
        result=np.arange(*args)
        event.update(observed_length=len(result),observed_dtype=str(result.dtype),prefix=[float(x)for x in result[:4]],last=[float(x)for x in result[-4:]])
        return result.view(MathematicalExponents)if self.mathematical else result
    def asarray(self,value,*args,**kwargs):
        result=np.asarray(value,*args,**kwargs)
        if result.ndim==1:
            frame=sys._getframe(1)
            decades=frame.f_locals.get('decades',[])
            estimate=len(result)*len(decades)
            if estimate>SAFE_ALLOCATION:
                self.events.append(dict(operation='late subs product guard',allocation_estimate=estimate,independent_budget_omission=True))
                raise EnumerationBudget()
        return result


def original_subs(spec):
    if spec is None:return None
    if spec['kind']in['text','number']:return spec['value']
    values=np.arange(1,spec['sequence_count']+1,dtype=np.float64)if 'sequence_count'in spec else np.array(spec['values'],dtype=spec.get('dtype','float64'))
    for view in spec.get('views',[]):values=source_view(values,*view)
    return values


def observe(ns,case,mathematical):
    proxy=BoundedNumpy(mathematical);ns['np']=proxy
    selected=original_subs(case['subs'])
    locator=ns['SymmetricalLogLocator'](base=case['base'],linthresh=case['threshold'],subs=selected)
    locator.numticks=case['numticks'];captured={};target=locator.tick_values.__code__
    def trace(frame,event,argument):
        if frame.f_code is target:
            if event in['line','exception','return']:captured.update(frame.f_locals)
            return trace
        return None
    sys.settrace(trace)
    try:
        values=locator.tick_values(*case['bounds']);size=len(values);eager=min(size,CAP)
        result=dict(source_error=None,observed_length=size,eager_length=eager,container=type(values).__name__)
        if isinstance(values,np.ndarray):result['dtype']=str(values.dtype)
        if size<=256:result['values']=[float(x)for x in values]
        else:
            indices=sorted(set(list(range(8))+list(range(max(0,eager-4),eager))+list(range(max(0,eager//2-2),min(eager,eager//2+2)))))
            result.update(samples=[[index,float(values[index])]for index in indices],full_last=[float(x)for x in values[-4:]])
    except EnumerationBudget:result=dict(source_error=None,query_omitted=True,reason='independent allocation budget; no original result or error inferred')
    except(ValueError,TypeError,OverflowError,ZeroDivisionError,IndexError,AttributeError)as error:result=dict(source_error=type(error).__name__,message=str(error))
    finally:sys.settrace(None)
    result['numpy_events']=proxy.events
    result['locals']={name:dict(type=type(captured[name]).__name__,value=str(captured[name]))for name in['has_a','has_b','has_c','a_lo','a_hi','c_lo','c_hi','total_ticks','stride']if name in captured}
    return result


def subs_expression(spec):
    if spec is None:return 'None'
    if spec['kind']=='text':return 'Some(SymLogSubs::Text('+moon(spec['value'])+'))'
    if spec['kind']=='number':return 'Some(SymLogSubs::Number('+moon(spec['value'])+'))'
    if 'sequence_count'in spec:expr='TickValues::from_array(Array::makei('+str(spec['sequence_count'])+', index => (index + 1).to_double()))'
    elif spec.get('dtype')=='int64':expr='TickValues::from_int64_array(['+', '.join(str(x)+'L'for x in spec['values'])+'])'
    else:expr='TickValues::from_array('+moon([float(x)for x in spec['values']])+')'
    for start,stride,length in spec.get('views',[]):expr+='.view('+str(start)+', '+str(stride)+', '+str(length)+')'
    return 'Some(SymLogSubs::Values('+expr+'))'


def test_case(case,result,index):
    if result.get('query_omitted'):return ''
    code='\n///|\ntest '+moon('SymLog original grid '+str(index)+' '+case['label'])+' {\n'
    code+='  let locator = SymmetricalLogLocator::new(base='+moon(case['base'])+', linthresh='+moon(case['threshold'])+', subs='+subs_expression(case['subs'])+')\n'
    code+='  locator.set_numticks('+number(case['numticks']).replace('@ticker.','')+')\n'
    expression='locator.tick_values('+moon(case['bounds'][0])+', '+moon(case['bounds'][1])+')'
    if result['source_error']:code+='  assert_true(try { ignore('+expression+'); false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })\n'
    elif 'values'in result:code+='  verify_symlog_grid_bits('+expression+', '+moon(result['values'])+')\n'
    else:
        code+='  let ticks = '+expression+'\n  assert_eq(ticks.length(), '+str(result['eager_length'])+')\n'
        code+='  verify_symlog_grid_bits(['+', '.join('ticks['+str(i)+']'for i,v in result['samples'])+'], '+moon([v for i,v in result['samples']])+')\n'
    return code+'}\n'


def generate(path):
    ns=load(path)
    node=next(x for x in ast.parse(path.read_text()).body if isinstance(x,ast.ClassDef)and x.name=='SymmetricalLogLocator')
    exec(compile(ast.Module(body=[node],type_ignores=[]),str(path),'exec'),ns)
    cases=[]
    def add(label,base=10.,threshold=1.,bounds=(-100.,100.),numticks=15,subs=None):
        cases.append(dict(label=label,base=float(base),threshold=float(threshold),bounds=[float(x)for x in bounds],numticks=numticks,subs=subs))
    def values(items,dtype='float64',views=None):return dict(kind='values',values=items,dtype=dtype,views=views or [])
    for bounds in[(-1.,1.),(-.5,.5),(-0.,.5),(-.5,-0.),(0.,.5),(-.5,0.),(0.,0.),(.5,.5),(1.,1.),(-1.,-1.),(1.,-1.),
                  (-1.,math.nextafter(1.,math.inf)),(math.nextafter(-1.,-math.inf),1.),(1.,10.),(-10.,-1.),(-.5,100.),(-100.,.5),(-100.,-2.),(2.,100.)]:
        add('simple set and three region boundaries',bounds=bounds)
    for base in[0.,-0.,.5,1.,-1.,math.nan,math.inf,-math.inf,2.,3.,math.e,math.nextafter(1.,math.inf),math.nextafter(1.,0.)]:
        for bounds in[(-.5,.5),(-100.,100.),(2.,100.)]:add('complete Double base domain',base=base,bounds=bounds)
    tiny=np.nextafter(0.,1.).item()
    for threshold in[0.,-0.,-1.,math.nan,math.inf,-math.inf,tiny,1e308]:
        for bounds in[(-.5,.5),(-100.,100.),(2.,100.)]:add('complete threshold domain',threshold=threshold,bounds=bounds)
    for numticks in[-10,-1,0,1,2,3,15,.5,1.,1.5,2.5,math.nan,math.inf,-math.inf,10**400,-10**400,'auto','', '3']:
        for bounds in[(-.5,.5),(0.,0.),(-100.,100.),(2.,100.)]:add('Python integer float and text budget timing',numticks=numticks,bounds=bounds)
    for selected in[values([]),values([1]),values([2,1]),values([2,2]),values([0]),values([-1]),values([math.nan]),values([math.inf]),
                    values([2**53+1,2**53+2],'int64'),values([-2**63,2**63-1],'int64'),dict(kind='text',value='auto'),dict(kind='number',value=2.)]:
        for bounds in[(-.5,.5),(-100.,100.),(0.,0.)]:add('late subs shape dtype and flatten order',subs=selected,bounds=bounds)
    for bounds in[(math.nan,10.),(1.,math.nan),(math.inf,10.),(1.,math.inf),(-math.inf,1.),(-math.inf,math.inf),(1e308,1e308),(tiny,1e-300),(-1e308,1e308)]:add('extreme and unordered bounds',bounds=bounds)
    for selected in[values([1.,2.]),values([math.inf,math.nan]),values([0.,-1.]),values([1,2],'int64')]:add('underflow zero decades expand only once',threshold=tiny,bounds=(-.5,.5),subs=selected)
    for base in[2.,3.,10.]:
        for budget in[2,4,15,100]:
            for bounds in[(-1e20,-2.),(-1e20,1e20),(2.,1e20)]:add('full exponent phase and reverse',base=base,numticks=budget,bounds=bounds)
    add('float negative stride input alias',subs=values([1.,0.,2.,0.,3.],views=[(4,-2,3)]))
    add('integer zero stride input alias',subs=values([2],'int64',[(0,0,5)]))
    add('full negative source cap',bounds=(-3.,-2.),subs=dict(kind='values',sequence_count=125000))
    add('full crossing source cap',bounds=(-3.,3.),subs=dict(kind='values',sequence_count=100000))
    add('independent huge phase allocation budget',base=math.nextafter(1.,math.inf),numticks=10**18)
    add('genuine arange byte size failure',base=math.nextafter(1.,math.inf),numticks=math.inf,bounds=(2.,1e308))
    add('logical repeated arange full reverse hand evidence',base=math.nextafter(1.,math.inf),threshold=1e50,numticks=10**20,bounds=(-1e100,-1e60))
    code='''// Complete original SymmetricalLogLocator AST; independent D24 mathematical primitives.

///|
fn verify_symlog_grid_bits(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}
'''
    rows=[];differences=[]
    for index,case in enumerate(cases):
        source=observe(ns,case,False);mathematical=observe(ns,case,True)
        comparable=['source_error','observed_length','values','samples']
        different=any(json.dumps(clean(source.get(key)),sort_keys=True)!=json.dumps(clean(mathematical.get(key)),sort_keys=True)for key in comparable)
        row=dict(case=case,original_source=source,mathematical_profile=mathematical,source_profile_difference=different)
        rows.append(row)
        if different:differences.append(index)
        code+=test_case(case,mathematical,index)
    payload=dict(ticker_source_sha256=TICKER_SHA,numpy_binary_sha256=hashlib.sha256(Path(np._core._multiarray_umath.__file__).read_bytes()).hexdigest(),
                 executed_source_bodies=['SymmetricalLogLocator.__init__','SymmetricalLogLocator.tick_values','Locator.raise_if_exceeds','NumPy arange/asarray/power/multiply/array'],
                 oracle_boundary='Two complete unchanged original AST executions: actual NumPy primitives and independent exact-Fraction/Decimal180/320 mathematical ln/integer powers per accepted D24 contract. All source outputs remain recorded, and mathematical assertions are strict bits. Only allocation guard may omit unsafe enumeration; it never supplies an expected error/result.',
                 safe_allocation_limit=SAFE_ALLOCATION,port_eager_cap=CAP,source_profile_differences=differences,cases=rows)
    return clean(payload),formatted(code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore',RuntimeWarning);payload,code=generate(args.ticker)
    outputs={ROOT/'testdata/symlog_grid_reference.json':json.dumps(payload,indent=2,allow_nan=False)+'\n',ROOT/'ticker/symlog_grid_reference_wbtest.mbt':code}
    for path,text in outputs.items():
        if args.check:
            if not path.exists()or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    rows=payload['cases'];omissions=sum(bool(r['original_source'].get('query_omitted'))for r in rows)
    print('SymLog grids:',len(rows),'cases/two AST executions,',len(rows)-omissions,'generated assertions,',len(payload['source_profile_differences']),'source/math differences,',omissions,'independent omissions,',sum(r['original_source'].get('observed_length',0)>CAP for r in rows),'complete original arrays above cap')


if __name__=='__main__':main()
