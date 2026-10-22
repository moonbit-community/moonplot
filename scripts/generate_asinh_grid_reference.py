"""Complete original Asinh AST: real NumPy and independent mathematical profile.

Actual source collections remain distinct from portable math and canonical NaN
ordering. Safe allocation omissions never stand for an original result/error.
"""
from pathlib import Path
import argparse
import ast
import copy
import hashlib
import inspect
import json
import math
import operator
import random
import sys
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_asinh_params_reference import load, count_expr, subs_expr, source_subs
from generate_asinh_math_reference import stable_math
from generate_symlog_grid_reference import logarithm, power
from generate_multiple_locator_reference import clean, TICKER_SHA
from generate_maxn_params_reference import source_view

ROOT=Path(__file__).resolve().parents[1]
FUNCTION_BASE_SHA='413d696e597ff2b7ffdd9b06b4b42801e435392a82a9e006b4c4f33c013523fc'
CTORS_URL='https://raw.githubusercontent.com/numpy/numpy/v2.3.5/numpy/_core/src/multiarray/ctors.c'
CTORS_SHA='8deb3951b52e8342368daf8cf95dadfe40cb73621108ebe6ee0ab6e41d40f274'
CAP=100000
LINE_BUDGET=200001
OUTER_BUDGET=400000
MATH_CACHE={}


class EnumerationBudget(Exception):pass


def mathematical(function,value):
    value=float(value);key=(function,value.hex())
    if key not in MATH_CACHE:MATH_CACHE[key]=stable_math(function,value)[0]
    return MATH_CACHE[key]


class Exponents(np.ndarray):
    __array_priority__=10000
    def __rpow__(self,base):return np.array([power(base,v)for v in self],dtype=np.float64)


class Math:
    def __init__(self,profile):self.profile=profile
    def __getattr__(self,key):return getattr(math,key)
    def log(self,value):return float(logarithm(value))if self.profile else math.log(value)


class Numpy:
    def __init__(self,profile):self.profile=profile;self.events=[]
    def __getattr__(self,key):return getattr(np,key)
    def arcsinh(self,values):return np.array([mathematical('asinh',v)for v in values])if self.profile else np.arcsinh(values)
    def sinh(self,values):return np.array([mathematical('sinh',v)for v in values])if self.profile else np.sinh(values)
    def log(self,values):return np.array([logarithm(v)for v in values])if self.profile else np.log(values)
    def log10(self,values):return np.array([mathematical('log10',v)for v in values])if self.profile else np.log10(values)
    def floor(self,values):
        result=np.floor(values)
        return result.view(Exponents)if self.profile else result
    def linspace(self,first,last,count):
        event=dict(operation='original np.linspace',first=float(first),last=float(last),requested=str(count),requested_type=type(count).__name__);self.events.append(event)
        try:integer=operator.index(count)
        except TypeError:return np.linspace(first,last,count)
        # The true C length first rounds (integer-0)/1 to double. The rejected
        # whole-byte boundary is safe to call: NumPy checks before allocation.
        if 0<=integer<2**60 and float(integer)<2**60 and integer>LINE_BUDGET:
            event['independent_budget_omission']=True;raise EnumerationBudget('linspace allocation budget')
        result=np.linspace(first,last,count);event['observed_length']=len(result)
        return result
    def outer(self,first,second):
        size=np.asarray(second).size
        self.events.append(dict(operation='original np.outer',rows=len(first),columns=size))
        if len(first)*size>OUTER_BUDGET:raise EnumerationBudget('outer allocation budget')
        return np.outer(first,second)


def actual_subs(spec):
    if spec is not None and 'sequence_count'in spec:
        values=[float(x)for x in range(1,spec['sequence_count']+1)]
        return list(reversed(values))if spec.get('reverse')else values
    if spec is not None and spec['kind']=='ndarray':
        values=source_subs(spec)
        for view in spec.get('views',[]):values=source_view(values,*view)
        return values
    return source_subs(spec)


def expression_subs(spec):
    if spec is not None and 'sequence_count'in spec:
        n=spec['sequence_count'];value='('+str(n)+' - index)'if spec.get('reverse')else'(index + 1)'
        return 'Some(AsinhSubs::Sequence(Array::makei('+str(n)+', index => '+value+'.to_double())))'
    if spec is not None and spec['kind']=='ndarray'and spec.get('views'):
        raw=dict(spec);raw.pop('views');expr=subs_expr(raw).replace('@ticker.','')
        # Rewrite the TickValues argument, retaining its source dtype and view.
        ending='))'
        return expr[:-len(ending)]+''.join('.view('+', '.join(str(x)for x in v)+')'for v in spec['views'])+ending
    return subs_expr(spec).replace('@ticker.','')


def stable_values(values,canonical):
    values=[float(v)for v in values]
    if not canonical:return values
    numbers=sorted(v for v in values if not math.isnan(v))
    return numbers+[math.nan]*sum(math.isnan(v)for v in values)


def encoded_result(values,fallback):
    values=stable_values(values,not fallback)
    n=len(values);result=dict(observed_length=n,eager_length=min(n,CAP),nan_count=sum(math.isnan(v)for v in values))
    if n<=256:result['values']=values
    else:
        indices=sorted(set(list(range(8))+list(range(min(n,CAP)-4,min(n,CAP)))+list(range(min(n,CAP)//2-2,min(n,CAP)//2+2))))
        result['samples']=[[i,values[i]]for i in indices]
        result['full_last']=values[-4:]
    return result


def stage(value):
    if isinstance(value,np.ndarray):
        flat=value.flatten();return dict(dtype=str(value.dtype),length=len(flat),nan_count=int(np.isnan(flat).sum()),prefix=[float(v)for v in flat[:4]],last=[float(v)for v in flat[-4:]])
    return dict(type=type(value).__name__,value=float(value))


def observe(ns,case,profile):
    proxy=Numpy(profile);ns['np']=proxy;ns['math']=Math(profile)
    locator=ns['AsinhLocator'](case['width'],numticks=case['count'],base=case['base'],subs=actual_subs(case['subs']))
    captured={};target=locator.tick_values.__code__
    def trace(frame,event,argument):
        if frame.f_code is target:
            if event in['line','return','exception']:captured.update(frame.f_locals)
            return trace
        return None
    sys.settrace(trace)
    try:
        values=locator.tick_values(*case['bounds']);fallback=len(captured['ticks'])<2
        result=dict(source_error=None,fallback=fallback,**encoded_result(values,fallback))
        if not fallback and any(math.isnan(float(v))for v in values):
            result['source_nan_order_boundary']='Original Python hash/set order is nondeterministic; stable numeric multiset and NaN multiplicity recorded, numeric ascending/NaN-last is the explicit deterministic port profile.'
    except EnumerationBudget as exc:result=dict(source_error=None,query_omitted=True,reason=str(exc)+'; no original result or error inferred')
    except(ValueError,TypeError,OverflowError,ZeroDivisionError,IndexError,AttributeError)as exc:result=dict(source_error=type(exc).__name__,message=str(exc))
    finally:sys.settrace(None)
    result['events']=proxy.events
    result['stages']={k:stage(captured[k])for k in['ymin','ymax','ys','xs','pows','qs','ticks']if k in captured and k!='ticks'}
    return result


def different(a,b):
    return any(json.dumps(clean(a.get(k)),sort_keys=True)!=json.dumps(clean(b.get(k)),sort_keys=True)for k in['source_error','fallback','observed_length','values','samples'])


def test_code(case,result,index):
    if result.get('query_omitted'):return ''
    code='\n///|\ntest '+moon('Asinh grid '+str(index)+' '+case['label'])+' {\n'
    code+='  let locator = AsinhLocator::new('+moon(case['width'])+', numticks='+count_expr(case['count']).replace('@ticker.','')+', base='+moon(case['base'])+', subs='+expression_subs(case['subs'])+')\n'
    query='locator.tick_values('+moon(case['bounds'][0])+', '+moon(case['bounds'][1])+')'
    if result['source_error']:code+='  assert_true(try { ignore('+query+'); false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })\n'
    elif 'values'in result:code+='  verify_asinh_grid_bits('+query+', '+moon(result['values'])+')\n'
    else:
        code+='  let ticks = '+query+'\n  assert_eq(ticks.length(), '+str(result['eager_length'])+')\n'
        code+='  verify_asinh_grid_bits(['+', '.join('ticks['+str(i)+']'for i,v in result['samples'])+'], '+moon([v for i,v in result['samples']])+')\n'
    return code+'}\n'


class SampleArray(np.ndarray):
    def __array_finalize__(self,other):self.indices=getattr(other,'indices',None);self.full_length=getattr(other,'full_length',None)
    def __setitem__(self,key,value):
        if isinstance(key,tuple)and key==(-1,Ellipsis):
            for i,logical in enumerate(self.indices):
                if logical==self.full_length-1:super().__setitem__(i,value)
            return
        return super().__setitem__(key,value)


class SampleNumpy:
    def __init__(self,indices):self.indices=indices
    def __getattr__(self,name):return getattr(np,name)
    def arange(self,start,stop,dtype,**kwargs):
        if start!=0:raise ValueError('unexpected original linspace arange')
        values=np.array(self.indices,dtype=dtype).view(SampleArray);values.indices=self.indices;values.full_length=math.ceil((stop-start)/1)
        return values


def large_lines():
    original=inspect.unwrap(np.linspace);path=Path(inspect.getfile(original))
    if hashlib.sha256(path.read_bytes()).hexdigest()!=FUNCTION_BASE_SHA:raise ValueError('fixed linspace source differs')
    node=copy.deepcopy(next(n for n in ast.parse(path.read_text()).body if isinstance(n,ast.FunctionDef)and n.name=='linspace'));node.decorator_list=[]
    rows=[];code=''
    for count in[2**53+1,2**53+3,2**54-1,10**12]:
        length=math.ceil((count-0)/1);indices=[0,1,2,length-2,length-1]
        namespace=dict(original.__globals__);namespace['_nx']=SampleNumpy(indices)
        exec(compile(ast.Module(body=[node],type_ignores=[]),str(path),'exec'),namespace)
        values=[float(v)for v in namespace['linspace'](-1.,3.,count)]
        rows.append(dict(requested=str(count),c_arange_length=str(length),divisor=str(count-1),indices=[str(i)for i in indices],values=values,source_body='Unchanged original NumPy linspace; arange supplies only selected logical indices, terminal write routed to actual logical last index. No claim of full original allocation.'))
        code+='\n///|\ntest '+moon('Asinh full scalar linspace shape '+str(count))+' {\n  let line = asinh_grid_line(-1.0, 3.0, '+str(count)+'L)\n  assert_eq(line.requested, '+str(count)+'L)\n  assert_eq(line.count, '+str(length)+'L)\n  verify_asinh_grid_bits(['+', '.join('line.at('+str(i)+'L)'for i in indices)+'], '+moon(values)+')\n}\n'
    return rows,code


def generate(path):
    ns=load(path);cases=[]
    def add(label,width=1.,count=11,base=10.,subs=None,bounds=(-100.,100.)):
        cases.append(dict(label=label,width=float(width),count=count,base=float(base),subs=subs,bounds=[float(v)for v in bounds]))
    def seq(values):return dict(kind='sequence',values=values)
    def arr(values,integer=False,views=None):return dict(kind='ndarray',values=values,integer=integer,views=views or [])
    for width in[1.,-1.,0.,-0.,1e-300,1e300,5e-324,math.nan,math.inf,-math.inf]:
        for bounds in[(-100.,100.),(1.,2.),(0.,0.)]:add('complete width domain',width=width,bounds=bounds)
    for count in[None,-1,0,1,2,3,10,11,12,11.,2.5,math.nan,math.inf,10**100,'11']:
        for bounds in[(-100.,100.),(1.,2.),(0.,0.),(-100.,1.)]:add('raw integer index protocol and cross-zero timing',count=count,bounds=bounds)
    for base in[-10.,-0.,0.,.5,1.,math.nextafter(1.,math.inf),2.,3.,math.e,10.,math.nan,math.inf,-math.inf]:
        for bounds in[(-100.,100.),(1.,2.),(0.,0.)]:add('complete base domain',base=base,bounds=bounds)
    selected=[seq([]),seq([0.]),seq([-0.]),seq([1.]),seq([2.,5.]),seq([-1.,0.,1.]),seq([math.nan,math.inf]),
              arr([]),arr([0.]),arr([1.]),arr([2.]),arr([2.,5.]),arr([2**53+1],True),arr([1,2],True),
              dict(kind='number',value=0.),dict(kind='number',value=2.),dict(kind='number',value=math.nan),dict(kind='text',value=''),dict(kind='text',value='bad')]
    for subs in selected:
        for base in[10.,1.]:add('late subs truth scalar ndarray and NaN multiplicity',base=base,subs=subs)
    for bounds in[(100.,-100.),(2.,1.),(-0.,0.),(0.,-0.),(1.,1.),(math.nan,1.),(1.,math.nan),(math.inf,1.),(1.,math.inf),(-math.inf,math.inf),(-1e308,1e308),(5e-324,1e-300)]:add('ordered raw view and nonfinite stages',bounds=bounds)
    for base in[10.,2.,math.e,1.]:
        for width in[1.,.1]:
            for count in[10,11]:
                for bounds in[(-1.,1.),(-10.,10.),(-1000.,1000.),(0.,1.),(0.,10.),(0.,1000.),(1.,10.),(10.,1000.),(-10.,-1.),(-1000.,-10.),(1000.,-1000.),(-10.,9.),(-1.,.9999999999999999),(1.,1.),(1e-10,1e-9)]:add('common source and mathematical collection profile',base=base,width=width,count=count,bounds=bounds)
    rng=random.Random(260026);boundary=[]
    for index in range(1200):
        base=[10.,2.,math.e][index%3];width=10**rng.uniform(-6,6);endpoint=base**rng.randint(-10,10)
        endpoint=math.nextafter(endpoint,[0.,math.inf][index%2])if index%4 else endpoint
        bounds=(0.,endpoint)if index%2 else(-endpoint,endpoint)
        case=dict(label='actual source vs mathematical boundary collection',width=width,base=base,count=[3,10,11][index%3],subs=None,bounds=list(bounds))
        a=observe(ns,case,False);b=observe(ns,case,True)
        if different(a,b):boundary.append((case,a,b))
    for c,a,b in boundary:cases.append(c)
    for exponent in[-317,-292,-100,-24,-1,0,20,22,23,100,300]:
        point=10.**(exponent+1)
        add('decimal phase boundaries merged before set',base=1.,width=point,bounds=(math.nextafter(point,0.),math.nextafter(point,math.inf)),count=101)
    add('integer reverse ndarray view truth',subs=arr([0,2**53+1,0],True,[(1,-1,1)]))
    add('full source125000 fallback denominator',count=125000,bounds=(1.,2.))
    add('full source200001 grid before unique',count=200001)
    add('full source outer375000 sorted350000',count=3,bounds=(1.,100.),subs=dict(kind='sequence',sequence_count=125000,reverse=True))
    for count in[10**9,2**53+1,2**53+3]:add('independent original allocation omission',count=count)
    for count in[2**60-1,2**60-2,2**60-63,2**60-64,2**60]:add('actual rounded arange byte shape failure',count=count,bounds=(1.,2.))
    for base in[3.]:add('accepted integer power math and source profile',base=base,count=100,bounds=(-1e20,1e20))
    code='''// Complete original Asinh AST, independent mathematical primitives and explicit NaN ordering profile.

///|
fn verify_asinh_grid_bits(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}
'''
    rows=[];differences=[]
    for index,case in enumerate(cases):
        a=observe(ns,case,False);b=observe(ns,case,True);difference=different(a,b)
        rows.append(dict(case=case,original_source=a,mathematical_profile=b,source_profile_difference=difference))
        if difference:differences.append(index)
        code+=test_code(case,b,index)
    lines,line_code=large_lines();code+=line_code
    payload=dict(ticker_sha256=TICKER_SHA,numpy_function_base_sha256=FUNCTION_BASE_SHA,
                 source_bodies=['Original AsinhLocator full AST','Original NumPy linspace full body','Real NumPy ufuncs/outer and Python sorted(set)'],
                 mathematical_boundary='Only elementary asinh/sinh/log10/ln/integer power primitives replaced by independent exact-input Decimal180/320 and Fraction calculations. Both complete original AST runs are retained. Numeric ascending/first-sourcezero/individual NaNs-last is explicit deterministic profile; source NaN hash order is recorded as stable multiset, never as a unique order.',
                 cpp_arange_length_evidence=dict(url=CTORS_URL,sha256=CTORS_SHA,source_lines=[3189,3221,3260,3276,3386,3400],semantic_boundary='C source evidence: exact Python stop-start, Python true divide by1 yields float, then ceil-to-intp. Large-count sample AST probes replace only arange allocation; they are not full-array observations.'),
                 source_nan_nondeterminism_evidence=dict(readonly_repetitions=1000,base_infinity_observed_orders=[['-1','1','NaN'],['1','NaN','-1'],['NaN','-1','1']],nan_inf_subs_observed_patterns=38,scope='Historical fixed-runtime readonly observations in D26-asinh-grid-notes; counts are evidence, not exhaustive or stable platform guarantees.'),
                 allocation_budgets=dict(linspace=LINE_BUDGET,outer=OUTER_BUDGET),port_cap=CAP,
                 boundary_screen=dict(seed=260026,candidates=1200,collection_differences=len(boundary)),source_profile_differences=differences,
                 cases=rows,large_scalar_linspace=lines)
    return clean(payload),formatted(code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore',RuntimeWarning);payload,code=generate(args.ticker)
    outputs={ROOT/'testdata/asinh_grid_reference.json':json.dumps(payload,indent=2,allow_nan=False)+'\n',ROOT/'ticker/asinh_grid_reference_wbtest.mbt':code}
    for path,text in outputs.items():
        if args.check:
            if not path.exists()or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    rows=payload['cases'];omissions=sum(bool(r['mathematical_profile'].get('query_omitted'))for r in rows)
    print('Asinh grid:',len(rows),'dualAST cases,',len(rows)-omissions+len(payload['large_scalar_linspace']),'generated tests,',len(payload['source_profile_differences']),'source/math differences,',omissions,'independent omissions, boundary',payload['boundary_screen'])


if __name__=='__main__':main()
