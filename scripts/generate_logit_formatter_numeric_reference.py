"""Complete original LogitFormatter AST, native NumPy and independent math.

Class methods, original helpers, Python set/sorted/round and native formatting are
executed unchanged. Only positive finite elementary log/log10 values differ in
the mathematical namespace, with independent Decimal180/320 agreement. Native
warnings/errors and dtype are obtained from the actual ufunc before substitution.
No Moon helper, copied class algorithm, tolerance or truncated set is an oracle.
"""
from pathlib import Path
import argparse,ast,collections,decimal,functools,json,math,types,warnings
import numpy as np
from formatter_reference_source import load_logit_formatter
from generate_scalar_formatter_numeric_reference import moon as numeric_moon,num,ncode,bits
from generate_log_float_text_reference import moon as string_moon
from generate_auto_date_reference import formatted
ROOT=Path(__file__).resolve().parents[1]
D=decimal.Decimal
def moon(value):
    return string_moon(value) if isinstance(value,str) else numeric_moon(value)
@functools.lru_cache(None)
def primitive(kind,value):
    out=[]
    for p in (180,320):
        with decimal.localcontext() as ctx:
            ctx.prec=p;v=D.from_float(value)
            out.append(float(v.ln() if kind=='log' else v.log10()))
    if bits(out[0])!=bits(out[1]):raise AssertionError((kind,value,'independent Decimal disagreement'))
    return out[0]
class NumpyMath:
    def __getattr__(self,name):return getattr(np,name)
    def op(self,kind,value):
        actual=getattr(np,kind)(value)
        a=np.asarray(value);result=np.asarray(actual).copy()
        for index in np.ndindex(a.shape):
            x=float(a[index])
            if 0<x<math.inf:result[index]=primitive(kind,x)
        return result[()] if np.ndim(actual)==0 else result
    def log(self,value):return self.op('log',value)
    def log10(self,value):return self.op('log10',value)
def load_math(path):
    ns=load_logit_formatter(path);ns['np']=NumpyMath()
    proxy=types.SimpleNamespace(**{k:getattr(math,k) for k in dir(math)})
    def log10(x):
        if x<=0:raise ValueError('math domain error')
        return primitive('log10',float(x)) if math.isfinite(x) else float(x)
    proxy.log10=log10;ns['math']=proxy
    return ns

def observed(fn):
    with warnings.catch_warnings(record=True) as runtime:
        warnings.simplefilter('always')
        try:
            value=fn()
            r={'value':bool(value) if isinstance(value,np.bool_) else value,'error':None}
        except (TypeError,ValueError,ZeroDivisionError,OverflowError,IndexError,AttributeError) as e:r={'error':type(e).__name__+': '+str(e)}
    r['warnings']=[{'category':type(w.message).__name__,'message':str(w.message)} for w in runtime]
    return r

def encode(value):
    if isinstance(value,np.ndarray):return {'dtype':str(value.dtype),'values':[num(x) for x in value]}
    if isinstance(value,(tuple,list)):return [encode(x) for x in value]
    if value is None or isinstance(value,str):return value
    return num(value)
def lcode(value):
    if value is None:return 'LogValue::NoneValue'
    if isinstance(value,str):return 'LogValue::Text('+moon(value)+')'
    return 'LogValue::Numeric('+ncode(num(value))+')'
def prelude(minor=False,overline=False,number=6,threshold=25,half=r'\frac{1}{2}'):
    return '  let formatter = LogitFormatter::new(minor='+lcode(minor)+', use_overline='+lcode(overline)+', minor_number='+lcode(number)+', minor_threshold='+lcode(threshold)+', one_half='+lcode(half)+')\n  let base = formatter.as_base_formatter()\n  let state = logit_formatter_state(base)\n'
def input_code(locs):
    if isinstance(locs,np.ndarray):
        if locs.dtype==np.dtype('int64'):values='TickValues::from_int64_array(['+', '.join(str(int(x))+'L' for x in locs)+'])'
        else:values='TickValues::from_array(['+', '.join(moon(float(x)) for x in locs)+'])'
        return '  let input = LogitInput::from_view('+values+')\n'
    return '  let input_keys = ['+', '.join('LogitKey::new('+ncode(num(x))+')' for x in locs)+']\n  let input = LogitInput::from_keys(input_keys)\n'
def key_code(value,locs):
    if locs is not None and not isinstance(locs,np.ndarray):
        for i,x in enumerate(locs):
            if x is value:return 'input_keys['+str(i)+']'
    return 'LogitKey::new('+ncode(num(value))+')'
def assertion(expression,result):
    if result['error']:
        return '  assert_eq(try { ignore('+expression+'); "unexpected success" } catch { @core.DataError::InvalidTicks(message~) => message; _ => "unexpected error" }, '+moon(result['error'])+')\n'
    return '  assert_eq('+expression+', '+moon(result['value'])+')\n'
def number_assert(expression,value):
    record=num(value);kind=record['kind']
    if 'bits' in record:return '  assert_true('+expression+' is '+kind+'(number) && number.reinterpret_as_uint64() == '+str(record['bits'])+'UL)\n'
    return '  assert_eq('+expression+', '+ncode(record)+')\n'
def snapshot(f):
    a=f._locs
    if not isinstance(a,np.ndarray):return {'container':'list','values':[num(x) for x in a]}
    return {'container':'ndarray','dtype':str(a.dtype),'values':[num(int(x)) if a.dtype==np.dtype('uint64') else num(x) for x in a]}
def snapshot_assert(f):
    a=f._locs
    if not isinstance(a,np.ndarray):return ''
    out='  assert_eq(base.locations.length(), '+str(len(a))+')\n'
    if a.dtype==np.dtype('float64') or a.dtype==np.dtype('int64'):
        out+='  let snapshot = match base.locations { NdArray(values) => values; _ => abort("unexpected snapshot kind") }\n  assert_eq(snapshot.is_int64(), '+moon(a.dtype==np.dtype('int64'))+')\n'
        for i,x in enumerate(a):
            if a.dtype==np.dtype('int64'):out+='  assert_eq(snapshot.get_int64('+str(i)+'), '+str(int(x))+'L)\n'
            else:out+='  assert_eq(snapshot.get('+str(i)+').reinterpret_as_uint64(), '+str(bits(x))+'UL)\n'
    else:
        out+='  let snapshot = match base.locations { Typed(values) => values; _ => abort("unexpected typed snapshot kind") }\n  assert_eq(snapshot.dtype(), '+moon(str(a.dtype))+')\n'
        for i,x in enumerate(a):
            if a.dtype==np.dtype('uint64'):out+='  assert_eq(snapshot.get_uint64('+str(i)+'), '+str(int(x))+'UL)\n'
            else:out+=number_assert('snapshot.get_value('+str(i)+')',x)
    return out

def build(path):
    source=load_logit_formatter(path);mathematics=load_math(path)
    cases=[];bodies=[];diffs=[];primitive_cases=[];primitive_bodies=[];budget=[]
    source_observations=0;math_observations=0
    def add(kind,spec,a,c,body):
        nonlocal source_observations,math_observations
        record={'id':len(cases),'kind':kind,'spec':spec,'source':a}
        if c is not None:record['mathematical']=c
        if c is not None and a!=c:diffs.append(record)
        cases.append(record);bodies.append(body)
    values=[0.,-0.,-1.,1.,math.inf,-math.inf,math.nan,5e-324,1.23e-310,5e-309,1e-308,.0001,.001,.01,.05,.099999999,.1,.2,.25,.499999999,.5,.500000001,.75,.9,.900000001,.95,.98,.99,math.nextafter(1.,0.),np.float64(.2),np.float64(math.nan),np.int64(-2**63),np.int64(2**63-1),np.bool_(False),np.bool_(True),False,True,2**64,10**400]
    locations=[None,[],[.1],[.1,.2],[.2,.2],[.2,math.nan],[.1,math.inf],np.array([0,1,2],dtype=np.int64),[False,True],[2**63,2**64-1],[3,2**100],[.01,.05,.1,.2,.5,.8,.9,.95,.99]]
    for minor in [False,True]:
     for overline in [False,True]:
      for locs in locations:
       for value in values:
        fs=source['LogitFormatter'](minor=minor,use_overline=overline);fm=mathematics['LogitFormatter'](minor=minor,use_overline=overline)
        a={};c={};body=prelude(minor,overline)
        if locs is not None:
            body+=input_code(locs)
            a['prepare']=observed(lambda:fs.set_locs(locs));c['prepare']=observed(lambda:fm.set_locs(locs))
            source_observations+=1;math_observations+=1
            body+=assertion('logit_named_prepare(base, state, input)',c['prepare'])
        body+='  let key = '+key_code(value,locs)+'\n'
        for method,expression in [('__call__','logit_named_call(base, state, key, None)'),('format_data','formatter.format_data_key(key)'),('format_data_short','logit_named_short(key.value())')]:
            a[method]=observed(lambda:getattr(fs,method)(value));c[method]=observed(lambda:getattr(fm,method)(value));body+=assertion(expression,c[method])
            source_observations+=1;math_observations+=1
        add('methods',dict(minor=minor,overline=overline,locs=encode(locs),value=num(value)),a,c,body)
    # Complete preparation and selected-set cache membership in original input
    # identities. Raw count errors occur only at their actual consumption stage.
    minorlocs=[[.2],[.2,.3],[.2,.3,.4],[.21,.22,.29,.4,.41,.7,.8],[.8,.7,.41,.4,.29,.22,.21],np.array([.1,.2,.25,.5,.75,.8,.9]),np.array([0,1,2,3,4,5,6],dtype=np.int64),[.2,math.nan,.3,.4,.8,.9],[.2,math.inf,.3,.4,.8,.9],[.2,.2,.2,.4,.6,.8],[],[.1,.01,.5,.9,.99],[.23,0.,.3,1.,.9,.3,2.,.5,.9,.3,2.],[2**63],[2**63+1],[2**63+2],[3,2**100,4,5,6,7],[3,0,2**100,4,5,6],[3,np.float64(0),2**100,4,5,6],[3,np.int64(2),2**100,4,5,6],[3,2**2000,4,5,6,7],[3,False,2**100,4,5,6],[3,np.bool_(False),2**100,4,5,6]]
    for locs in minorlocs:
     for number in [0,1,2,6,-1,-6,1.,np.float64(1.),np.int64(0),np.int64(-2**63),np.bool_(True),10**100,-10**100,'x',None]:
        fs=source['LogitFormatter'](minor=True,minor_threshold=100,minor_number=number);fm=mathematics['LogitFormatter'](minor=True,minor_threshold=100,minor_number=number)
        a=observed(lambda:fs.set_locs(locs));c=observed(lambda:fm.set_locs(locs));source_observations+=1;math_observations+=1
        a['snapshot']=snapshot(fs);c['snapshot']=snapshot(fm)
        a['label_count']=len(fs._labelled);c['label_count']=len(fm._labelled)
        a['members']=[observed(lambda x=x:x in fs._labelled) for x in locs];c['members']=[observed(lambda x=x:x in fm._labelled) for x in locs]
        source_observations+=len(locs);math_observations+=len(locs)
        body=prelude(True,number=number,threshold=100)+input_code(locs)+assertion('logit_named_prepare(base, state, input)',c)+snapshot_assert(fm)+'  assert_eq(state.labelled.keys().length(), '+str(c['label_count'])+')\n'
        for i,r in enumerate(c['members']):body+=assertion('state.labelled.contains(input.key_at('+str(i)+'))',r)
        add('minor-selection',dict(locs=encode(locs),number=encode(number)),a,c,body)
    # Tolerance-adjacent whole-class labels, not a copied branch predicate.
    for center in [.5,.1,.01,.001,.9,.99,.999,1e-308]:
     for delta in [0.,1e-10,-1e-10,1e-8,-1e-8,1e-7,-1e-7]:
      value=center*(1+delta)
      for peers in [[value],[value,value+.1],[value,math.nextafter(value,math.inf)]]:
        fs=source['LogitFormatter']();fm=mathematics['LogitFormatter']();fs.set_locs(peers);fm.set_locs(peers)
        a=observed(lambda:fs(value));c=observed(lambda:fm(value));source_observations+=1;math_observations+=1
        body=prelude()+input_code(peers)+'  logit_named_prepare(base, state, input)\n'+assertion('logit_named_call(base, state, input_keys[0], None)',c)
        add('precision-boundary',dict(value=num(value),locs=encode(peers)),a,c,body)
    # Original scalar/dtype primitives; no port function supplies expectations.
    for value in [0.,-0.,5e-324,.1,.100000001,.5,.9,.99,math.nan,math.inf,np.int64(-2**63),np.int64(2**63-1),np.bool_(True),2**63,2**64-1,2**64,-2**63-1]:
        a=observed(lambda:source['_is_decade'](value,rtol=1e-7));c=observed(lambda:mathematics['_is_decade'](value,rtol=1e-7))
        primitive_cases.append({'kind':'is-decade','value':num(value),'source':a,'mathematical':c})
        primitive_bodies.append(assertion('logit_is_decade('+ncode(num(value))+')',c));source_observations+=1;math_observations+=1
    for value in [2**63,2**63+1,2**63+2,np.int64(-2**63),np.bool_(True),.5,.5000000001,math.nan,math.inf]:
        def half(ns):return ns['_is_close_to_int'](2*value) and int(ns['np'].round(2*value))==1
        a=observed(lambda:half(source));c=observed(lambda:half(mathematics))
        primitive_cases.append({'kind':'ideal-half','value':num(value),'source':a,'mathematical':c})
        primitive_bodies.append(assertion('logit_is_half('+ncode(num(value))+', numpy_round=true)',c));source_observations+=1;math_observations+=1
    # Full original shape above100000: source sort executes every location. The
    # independent full Decimal run has its own explicit CPU-budget omission.
    locs=np.linspace(.0001,.9999,200001)
    fs=source['LogitFormatter'](minor=True,minor_threshold=200002)
    a=observed(lambda:fs.set_locs(locs));source_observations+=1
    selected=sorted(float(x) for x in fs._labelled);a['selected_bits']=[bits(x) for x in selected];a['snapshot_count']=len(fs._locs)
    first=float(locs[0]);last=float(locs[-1]);step=(last-first)/(len(locs)-1)
    fixture=np.array([last if i==len(locs)-1 else float(i)*step+first for i in range(len(locs))])
    assert np.array_equal(locs.view(np.uint64),fixture.view(np.uint64)), 'large linspace fixture must preserve every original input bit'
    body=prelude(True,threshold=200002)+'  let values = Array::makei(200001, index => if index == 200000 { '+moon(last)+' } else { index.to_double() * '+moon(step)+' + '+moon(first)+' })\n  let input = LogitInput::from_view(TickValues::from_array(values))\n'+assertion('logit_named_prepare(base, state, input)',a)+'  assert_eq(base.locations.length(), 200001)\n  assert_eq(state.labelled.keys().length(), 6)\n'
    for value in selected:body+='  assert_true(state.labelled.contains(LogitKey::new(ScalarNumber::NumpyFloat64('+moon(value)+'))))\n'
    high=observed(lambda:fs(float(locs[-1])));a['tail_label']=high;source_observations+=1
    body+=assertion('logit_named_call(base, state, LogitKey::new(ScalarNumber::NumpyFloat64('+moon(float(locs[-1]))+')), None)',high)
    add('complete-large-source',{'count':200001},a,None,body)
    budget.append({'case':len(cases)-1,'operation':'complete per-point Decimal log on200001 values','reason':'independent mathematical enumeration CPU budget; actual source full shape/sort/selected-tail executed','not_source_error':True})
    # Append complete-class object partial-order counterexamples without
    # rewriting any earlier label/error/selection observation.
    object_inputs=[[2**64,.2,math.nan,.2001],[.2,math.nan,.2001,2**64],[math.nan,.2,.2001,2**64]]
    for peers in object_inputs:
        fs=source['LogitFormatter']();fm=mathematics['LogitFormatter']()
        a={'prepare':observed(lambda:fs.set_locs(peers))};c={'prepare':observed(lambda:fm.set_locs(peers))}
        a['call']=observed(lambda:fs(.2));c['call']=observed(lambda:fm(.2));source_observations+=2;math_observations+=2
        a['snapshot']=snapshot(fs);c['snapshot']=snapshot(fm)
        body=prelude()+input_code(peers)+assertion('logit_named_prepare(base, state, input)',c['prepare'])+snapshot_assert(fm)+assertion('logit_named_call(base, state, LogitKey::new(ScalarNumber::Number(0.2)), None)',c['call'])
        add('object-partial-sort',dict(locs=encode(peers),value=num(.2)),a,c,body)
    document={'metadata':{'source_hashes':source['source_hashes'],'runtime':'CPython3.12.14 NumPy2.3.5 Darwinarm64','actual_profile':'complete original ClassDef and both original helpers; native set/sorted/round/np.array/diff/minimum/format','mathematical_profile':'only finite positive elementary ln/log10 replaced; independent Decimal180/320 agreement; actual ufunc supplies dtype/error/native warning','numeric_cases':len(cases),'numeric_registered_groups':(len(cases)+31)//32,'primitive_cases':len(primitive_cases),'primitive_registered_groups':(len(primitive_cases)+31)//32,'source_observations':source_observations,'mathematical_observations':math_observations,'profile_differences':diffs,'native_warnings':'observations retained separately from API warning diagnostics','oracle_budget_omissions':budget,'nan_identity':'Sequence aliases use the exact same key handle where the source query is the same input object; ndarray indexing constructs fresh scalar keys','no_cap':'complete source vectors and selected set, no100000prefix limit'},'cases':cases,'primitives':primitive_cases}
    def grouped(name,items):
        out='// Generated by scripts/generate_logit_formatter_numeric_reference.py; do not edit.\n'
        for i,body in enumerate(items):out+='\n///|\nfn '+name+'_case_'+str(i)+'() -> Unit raise {\n'+body+'}\n'
        for start in range(0,len(items),32):out+='\n///|\ntest "'+name+' group '+str(start//32)+'" {\n'+''.join('  '+name+'_case_'+str(i)+'()\n' for i in range(start,min(start+32,len(items))))+'}\n'
        return formatted(out)
    return json.dumps(document,ensure_ascii=False,indent=2,allow_nan=False)+'\n',grouped('logit_formatter_numeric',bodies),grouped('logit_formatter_primitive',primitive_bodies)
def main():
    p=argparse.ArgumentParser();p.add_argument('--check',action='store_true');args=p.parse_args()
    outputs=build(ROOT/'.moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py')
    paths=[ROOT/'testdata/logit_formatter_numeric_reference.json',ROOT/'ticker/logit_formatter_numeric_reference_wbtest.mbt',ROOT/'ticker/logit_formatter_primitive_reference_wbtest.mbt']
    for path,text in zip(paths,outputs):
        if args.check:
            if path.read_text()!=text:raise SystemExit('stale '+str(path))
        else:path.write_text(text)
    print(('checked' if args.check else 'generated')+' original LogitFormatter numerical references')
if __name__=='__main__':main()
