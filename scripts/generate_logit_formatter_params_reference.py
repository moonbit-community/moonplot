"""Complete pinned LogitFormatter state and NumPy snapshot references.

All expectations execute original class/helper bodies or their actual NumPy
array stage. No port formatter, numeric set or dtype implementation is an oracle.
"""
from pathlib import Path
import argparse,copy,itertools,json,math,warnings
import numpy as np
from formatter_reference_source import load_logit_formatter
from generate_auto_date_reference import formatted
from generate_basic_formatter_params_reference import clean
from generate_scalar_formatter_numeric_reference import moon as numeric_moon,num,ncode
from generate_log_float_text_reference import moon as string_moon
from generate_eng_formatter_params_reference import number,number_code
ROOT=Path(__file__).resolve().parents[1]
def moon(value):
    return string_moon(value) if isinstance(value,str) else numeric_moon(value)

FIELDS=('use_overline','one_half','minor','minor_threshold','minor_number')
GETTERS=('overline','one_half','minor','minor_threshold','minor_number')

def raw(value):
    if value is None:return {'kind':'NoneValue'}
    if isinstance(value,str):return {'kind':'Text','value':value}
    return {'kind':'Numeric','value':number(value)}
def rcode(record):
    if not isinstance(record,dict):record=raw(record)
    if record['kind']=='NoneValue':return 'LogValue::NoneValue'
    if record['kind']=='Text':return 'LogValue::Text('+moon(record['value'])+')'
    return 'LogValue::Numeric('+number_code(record['value'])+')'
def array_record(values):
    dtype=str(values.dtype)
    projected=[]
    for value in values:
        projected.append(num(int(value)) if dtype=='uint64' else num(value))
    return {'dtype':dtype,'length':len(values),'values':projected,
            'uint64':[str(int(x)) for x in values] if dtype=='uint64' else None}
def snapshot(f):
    return {'raw':{field:raw(getattr(f,'_'+field)) for field in FIELDS},
            'locations':array_record(f._locs) if isinstance(f._locs,np.ndarray) and f._locs.ndim==1 and f._locs.dtype.kind in 'biufO' else {'dtype':type(f._locs).__name__,'length':len(f._locs)},
            'labelled':sorted([num(x) for x in f._labelled],key=lambda item:json.dumps(item,sort_keys=True))}

def generate(path):
    ns=load_logit_formatter(path);F=ns['LogitFormatter'];observations=[];cases=[];source_only=[]
    code='''// Complete original LogitFormatter plus actual NumPy array promotion.

///|
fn logit_params_number_equal(actual : ScalarNumber, expected : ScalarNumber) -> Bool {
  match (actual,expected) {
    (Number(a),Number(b)) | (NumpyFloat64(a),NumpyFloat64(b)) =>
      a.reinterpret_as_uint64() == b.reinterpret_as_uint64()
    _ => actual == expected
  }
}

///|
fn logit_params_number(actual : ScalarNumber, expected : ScalarNumber) -> Unit raise {
  assert_true(logit_params_number_equal(actual,expected))
}

///|
fn logit_params_raw(actual : LogValue, expected : LogValue) -> Unit raise {
  match (actual,expected) {
    (Numeric(a),Numeric(b)) => logit_params_number(a,b)
    _ => assert_eq(actual,expected)
  }
}

///|
fn logit_params_labels(formatter : LogitFormatter, expected : Array[ScalarNumber]) -> Unit raise {
  let actual=formatter.labelled()
  assert_eq(actual.length(),expected.length())
  for value in expected {
    assert_true(actual.any(key => logit_params_number_equal(key.value(),value)))
  }
}
'''
    def observe(label,action,origin='complete original LogitFormatter AST'):
        ns['warning_records'].clear()
        with warnings.catch_warnings(record=True) as caught:
            warnings.simplefilter('always')
            try: result={'value':action(),'source_error':None}
            except (TypeError,ValueError,ZeroDivisionError,OverflowError,IndexError,KeyError,AttributeError) as exc:
                result={'value':None,'source_error':type(exc).__name__,'message':str(exc)}
        result.update(label=label,origin=origin,warnings=list(ns['warning_records']),runtime_warnings=[{'category':type(w.message).__name__,'message':str(w.message)} for w in caught])
        observations.append(result);return result
    def add(label,body,records):
        nonlocal code
        index=len(cases);code+='\n///|\nfn logit_params_case_'+str(index)+'() -> Unit raise {\n'+body+'}\n'
        cases.append({'label':label,'observations':records})
    def assertion(expr,result):
        if result['source_error']:
            return ('  let error=try { ignore('+expr+'); "unexpected success" } catch { @core.DataError::InvalidTicks(message~) => message; _ => "unexpected error" }\n'
                    '  assert_eq(error,'+moon(result['source_error']+': '+result['message'])+')\n')
        if result['value'] is None:return '  '+expr+'\n'
        if isinstance(result['value'],list):return '  assert_eq('+expr+', ['+', '.join(moon(v) for v in result['value'])+'])\n'
        return '  assert_eq('+expr+','+moon(result['value'])+')\n'
    def location_assert(name,record):
        dtype=record['dtype'];body='  let locations='+name+'.locations()\n  assert_eq(locations.length(),'+str(record['length'])+')\n'
        if dtype=='list':return '  {\n'+body+'  assert_true(locations is FormatterLocations::Sequence(_))\n  }\n'
        if dtype in ('float64','int64'):
            body+='  let view=match locations { FormatterLocations::NdArray(view) => view; _ => abort("expected ndarray") }\n  assert_eq(view.is_int64(),'+str(dtype=='int64').lower()+')\n'
        else:
            body+='  let array=match locations { FormatterLocations::Typed(array) => array; _ => abort("expected typed ndarray") }\n  assert_eq(array.dtype(),'+moon(dtype)+')\n'
        for i,item in enumerate(record['values']):
            body+='  logit_params_number(locations.get_value('+str(i)+'),'+ncode(item)+')\n'
            if dtype=='uint64':body+='  assert_eq(array.get_uint64('+str(i)+'),'+record['uint64'][i]+'UL)\n'
        return '  {\n'+body+'  }\n'
    def state_assert(name,record,locations=True):
        body=''
        for field,getter in zip(FIELDS,GETTERS):body+='  logit_params_raw('+name+'.'+getter+'(),'+rcode(record['raw'][field])+')\n'
        body+='  logit_params_labels('+name+', ['+', '.join(ncode(v) for v in record['labelled'])+'])\n'
        if locations:body+=location_assert(name,record['locations'])
        return body
    def keys_code(values,name='keys'):
        return '  let '+name+' : Array[LogitKey]=['+', '.join('LogitKey::new('+ncode(num(v))+')' for v in values)+']\n'

    # No conversion/default-reset on any standard raw argument.
    values=[None,False,True,0,-1,0.,-0.,.5,float('nan'),float('inf'),float('-inf'),'','False','A-B',np.float64(.5),np.int64(-2),np.bool_(True),np.bool_(False),10**100]
    for field in FIELDS:
        for value in values:
            f=F(**{field:value});result=observe('constructor raw '+field,lambda f=f:snapshot(f))
            add('constructor raw '+field,'  let formatter=LogitFormatter::new('+field+'='+rcode(value)+')\n'+state_assert('formatter',result['value']),[result])

    # Four raw setters preserve old cache/locations and rebind only their slot.
    setters=[('use_overline','use_overline'),('set_one_half','one_half'),('set_minor_threshold','minor_threshold'),('set_minor_number','minor_number')]
    for setter,field in setters:
        for value in values:
            f=F(minor=True,minor_number=20);f.set_locs([.2,.3]);old=f._locs;cache=f._labelled
            write=observe('raw setter '+setter,lambda f=f,setter=setter,value=value:getattr(f,setter)(value))
            state=observe('setter preserved cache and snapshot',lambda f=f:snapshot(f))
            identities=observe('setter identities',lambda f=f,old=old,cache=cache:{'locations_same':f._locs is old,'cache_same':f._labelled is cache})
            body='  let formatter=LogitFormatter::new(minor='+rcode(True)+',minor_number='+rcode(20)+')\n  formatter.set_locs([0.2,0.3])\n  let locations=formatter.locations()\n  let cache=logit_formatter_state(formatter.as_base_formatter()).labelled\n'
            body+=assertion('formatter.'+setter+'('+rcode(value)+')',write)+state_assert('formatter',state['value'])
            body+='  assert_true(physical_equal(cache,logit_formatter_state(formatter.as_base_formatter()).labelled))\n  let prior=match locations { NdArray(view)=>view; _=>abort("ndarray") }\n  let current=match formatter.locations() { NdArray(view)=>view; _=>abort("ndarray") }\n  assert_true(physical_equal(prior,current))\n'
            add('raw setter stale cache '+field,body,[write,state,identities])

    # Inferred dtype: actual original class invokes np.array before all scans.
    atoms=[False,True,0,-1,2**63-1,2**63,2**64-1,2**64,-2**63-1,.2,-0.,float('nan'),np.float64(.3),np.int64(-2),np.bool_(True)]
    arrays=[[]]+[[x] for x in atoms]+[list(xs) for xs in itertools.product(atoms,repeat=2)]
    core=[True,1,2**63,2**64,np.float64(.2),np.int64(-2),np.bool_(False)]
    arrays += [list(xs) for xs in itertools.product(core,repeat=3) if sum(isinstance(v,(float,np.floating)) for v in xs)==1]
    for values2 in arrays:
        f=F();prepared=observe('original np.array dtype materialization',lambda f=f,values2=values2:f.set_locs(values2))
        state=observe('dtype snapshot values/origins',lambda f=f:array_record(f._locs))
        body=keys_code(values2)+'  let formatter=LogitFormatter::new()\n  formatter.set_locs_keys(keys)\n'+location_assert('formatter',state['value'])
        add('one-dimensional snapshot '+state['value']['dtype'],body,[prepared,state])

    # Views materialize exact data/dtype and detach owner/stride.
    specs=[('signed',np.array([.2,.3,.4]),lambda a:a[::-1],2,-1,3),('zero',np.array([.2,.3]),lambda a:np.lib.stride_tricks.as_strided(a[:1],shape=(3,),strides=(0,)),0,0,3),('int64',np.array([2**53+1,0,-1],dtype=np.int64),lambda a:a[::-1],2,-1,3)]
    for label,owner,make_view,start,stride,length in specs:
        original=owner.copy();view=make_view(owner);f=F();f.set_locs(view)
        before=observe('independent signed/zero/int snapshot',lambda f=f:array_record(f._locs))
        owner[start]=0
        after=observe('owner mutation leaves snapshot',lambda f=f:array_record(f._locs))
        isint=owner.dtype==np.int64
        body='  let owner='+('['+', '.join(str(int(x))+'L' for x in original)+']' if isint else '['+', '.join(moon(float(x)) for x in original)+']')+'\n'
        body+='  let full='+('TickValues::from_int64_array(owner)' if isint else 'TickValues::from_array(owner)')+'\n  let view=full.view('+str(start)+','+str(stride)+','+str(length)+')\n  let formatter=LogitFormatter::new()\n  formatter.set_locs_view(view)\n'
        body+=location_assert('formatter',before['value'])+'  owner['+str(start)+']='+('0L' if isint else '0.0')+'\n'
        # isolate local binding names while retaining every value assertion.
        body+='  {\n'+location_assert('formatter',after['value'])+'  }\n'
        add('view snapshot detaches '+label,body,[before,after])

    # Delayed scalar comparison, integer slicing and NumPy unary-minus errors.
    counts=[None,'6',-2,-1,0,1,2,3,4,.5,2.,3.5,float('nan'),float('inf'),float('-inf'),False,True,np.bool_(False),np.bool_(True),np.int64(-9223372036854775808),np.int64(2),np.float64(2),10**100,-10**100]
    for field in ('minor_threshold','minor_number'):
        for value in counts:
            f=F(minor=True,**{field:value})
            result=observe('delayed '+field,lambda f=f:f.set_locs([.02,.3,.8]))
            state=observe('partial state after count consumption',lambda f=f:snapshot(f))
            body='  let formatter=LogitFormatter::new(minor='+rcode(True)+','+field+'='+rcode(value)+')\n'+assertion('formatter.set_locs([0.02,0.3,0.8])',result)+state_assert('formatter',state['value'])
            add('delayed '+field,body,[result,state])
    for minor in (False,True,None,''):
        for locs in ([],[.1,.5,.9],[.2,.3]):
            f=F(minor=minor,minor_threshold=None,minor_number=None)
            result=observe('minor/ideal bypass of invalid counts',lambda f=f,locs=locs:f.set_locs(locs))
            state=observe('bypass raw slots retained',lambda f=f:snapshot(f))
            body='  let formatter=LogitFormatter::new(minor='+rcode(minor)+',minor_threshold=LogValue::NoneValue,minor_number=LogValue::NoneValue)\n'+assertion('formatter.set_locs(['+', '.join(moon(v) for v in locs)+'])',result)+state_assert('formatter',state['value'])
            add('count branch bypass',body,[result,state])

    # Source %s of one_half is delayed, including the real native digit limit.
    for value in values+[10**4300]:
        f=F(one_half=value);result=observe('one_half consumed by percent s',lambda f=f:f(.5))
        add('one_half stringification','  let formatter=LogitFormatter::new(one_half='+rcode(value)+')\n'+assertion('formatter.call(0.5)',result),[result])
    for value in values:
        f=F(use_overline=value);result=observe('raw overline branch truth',lambda f=f:f(.9))
        add('overline late truth','  let formatter=LogitFormatter::new(use_overline='+rcode(value)+')\n'+assertion('formatter.call(0.9)',result),[result])

    # Shared mutable set with independent snapshot and parameter rebind slots.
    f=F(minor=True,minor_number=20);f.set_locs([.2,.3]);g=copy.copy(f);old=g._locs
    identity=observe('shallow initial identities',lambda:{'locations_same':g._locs is f._locs,'cache_same':g._labelled is f._labelled})
    g.set_locs([.4,.6]);statef=observe('copy prepare changes original whitelist',lambda:snapshot(f));stateg=observe('copy new snapshot independent',lambda:snapshot(g))
    body='  let formatter=LogitFormatter::new(minor='+rcode(True)+',minor_number='+rcode(20)+')\n  formatter.set_locs([0.2,0.3])\n  let copied=formatter.copy()\n  assert_true(physical_equal(logit_formatter_state(formatter.as_base_formatter()).labelled,logit_formatter_state(copied.as_base_formatter()).labelled))\n  copied.set_locs([0.4,0.6])\n'+state_assert('formatter',statef['value'])+state_assert('copied',stateg['value'])
    body+='  let exported=formatter.labelled()\n  exported.clear()\n  assert_eq(formatter.labelled().length(),2)\n'
    add('copy shared mutable set independent snapshots',body,[identity,statef,stateg])
    g.set_minor_threshold(None);failed=observe('failed copy preparation clears shared set',lambda:g.set_locs([.7,.8]));statef=observe('original observes clear after failure',lambda:snapshot(f));stateg=observe('copy failure preserves new snapshot',lambda:snapshot(g))
    body='  let formatter=LogitFormatter::new(minor='+rcode(True)+',minor_number='+rcode(20)+')\n  formatter.set_locs([0.2,0.3])\n  let copied=formatter.copy()\n  copied.set_minor_threshold(LogValue::NoneValue)\n'+assertion('copied.set_locs([0.7,0.8])',failed)+state_assert('formatter',statef['value'])+state_assert('copied',stateg['value'])
    add('copy failed prepare shared clear',body,[failed,statef,stateg])

    # Same-handle NaN and original list versus new ndarray scalar occurrences.
    for origin,nan in [('python',float('nan')),('numpy',np.float64(np.nan))]:
        f=F(minor=True,minor_number=20);f.set_locs([-.2,nan]);same=observe('same NaN identity call',lambda:f(nan));different=observe('fresh NaN call',lambda:f(float('nan') if origin=='python' else np.float64(np.nan)))
        body='  let formatter=LogitFormatter::new(minor='+rcode(True)+',minor_number='+rcode(20)+')\n  let identity=LogitKey::new('+ncode(num(nan))+')\n  formatter.set_locs_keys([LogitKey::new(ScalarNumber::Number(-0.2)),identity])\n'+assertion('formatter.call_key(identity)',same)+assertion('formatter.call_value('+ncode(num(nan))+')',different)
        add('explicit '+origin+' NaN identity',body,[same,different])
    for kind,locs in [('list',[-.2,float('nan')]),('ndarray',np.array([-.2,np.nan]))]:
        f=F(minor=True,minor_number=20);result=observe('original '+kind+' batch identities',lambda f=f,locs=locs:f.format_ticks(locs))
        expr='formatter.format_ticks([-0.2,0.0/0.0])' if kind=='list' else 'formatter.format_ticks_view(TickValues::from_array([-0.2,0.0/0.0]))'
        body='  let formatter=LogitFormatter::new(minor='+rcode(True)+',minor_number='+rcode(20)+')\n'+assertion(expr,result)
        add('batch identity '+kind,body,[result])

    # Parent state keeps default list identity and live wrapper identity.
    f=F();other=F();f.create_dummy_axis(minpos=.37);g=copy.copy(f)
    identity=observe('inherited axis/default locations identity',lambda:{'shared_default_locs':f._locs is other._locs,'copy_axis_same':g.axis is f.axis,'dummy_minpos':num(f.axis.get_minpos()),'offset':f.get_offset()})
    body='''  let formatter=LogitFormatter::new()
  let other=LogitFormatter::new()
  let first=match formatter.locations() { Sequence(values)=>values; _=>abort("list") }
  let second=match other.locations() { Sequence(values)=>values; _=>abort("list") }
  assert_true(physical_equal(first,second))
  let base=formatter.as_base_formatter()
  let family_view=base.logit_formatter().unwrap()
  assert_true(physical_equal(base,family_view.as_base_formatter()))
  formatter.create_dummy_axis(minpos=0.37)
  let copied=formatter.copy()
  assert_eq(formatter.axis(),copied.axis())
  assert_eq(formatter.axis().unwrap().dummy_minpos(),Some(0.37))
  assert_eq(formatter.get_offset(),"")
  family_view.set_one_half(LogValue::Text("live"))
  assert_eq(formatter.one_half(),LogValue::Text("live"))
  copied.set_one_half(LogValue::Text("independent"))
  assert_eq(formatter.one_half(),LogValue::Text("live"))
'''
    add('parent identity and independent copy slots',body,[identity])
    for value in (.37,-0.,np.float64(.37),np.int64(0),False,np.bool_(True),math.nan,math.inf):
        f=F(minor=True);result=observe('short ignores minor and axis',lambda f=f,value=value:f.format_data_short(value))
        body='  let formatter=LogitFormatter::new(minor='+rcode(True)+')\n'+assertion('formatter.format_data_short_value('+ncode(num(value))+')',result)
        add('inherited short scalar origin',body,[result])

    # Runtime parameter containers and unsupported dimensions are retained source
    # observations rather than passing typed fixtures or substituted errors.
    for field in FIELDS:
        for raw_value in ([1,2],np.array([1,2])):
            f=F(**{field:raw_value});result=observe('source-only standard container '+field,lambda f=f: f(.5) if field=='one_half' else f(.9) if field=='use_overline' else f.set_locs([.2,.3]))
            source_only.append({'domain':'raw parameter list/ndarray outside LogValue carrier','field':field,'observation':result})
    for label,locs in [('scalar',.2),('none',None),('ragged',[[.2],[.3,.4]]),('2d',np.array([[.2,.3]])),('object',[object()])]:
        f=F(minor=True);result=observe('source-only locations '+label,lambda f=f,locs=locs:f.set_locs(locs))
        source_only.append({'domain':'0D/2D/ragged/arbitrary dynamic object outside numeric 1D bridge','label':label,'observation':result})

    for start in range(0,len(cases),32):
        code+='\n///|\ntest "logit formatter parameters source group '+str(start//32)+'" {\n'
        for index in range(start,min(start+32,len(cases))):code+='  logit_params_case_'+str(index)+'()\n'
        code+='}\n'
    document={'metadata':{'source_hashes':ns['source_hashes'],'host_profile':ns['logit_host_profile'],'source_observations':len(observations),'cases':len(cases),'registered_groups':(len(cases)+31)//32,'source_only':len(source_only),'dtype_profile':'actual np.array; Float64/Int64 snapshots; Bool/UInt64/Object readonly NumericArray; UInt64 public get_value projects exact Python Integer','identity_profile':'original Python/NumPy keys retained in Sequence; NdArray yields new scalar keys each lookup; mutable cache shared across copy; NaN hash host profile owned by Root','typed_boundary':'six numeric origins/Text/None raw slots; arbitrary parameter containers and 0D/2D/object protocols explicitly source-only','native_math':'parameter oracle uses original elementary functions; B separately records portable mathematical differences'},'observations':observations,'cases':cases,'source_only':source_only}
    return json.dumps(clean(document),ensure_ascii=False,indent=2,allow_nan=False)+'\n',formatted(code)

def main():
    parser=argparse.ArgumentParser();parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    data,tests=generate(args.ticker)
    files=[(ROOT/'testdata/logit_formatter_params_reference.json',data),(ROOT/'ticker/logit_formatter_params_reference_wbtest.mbt',tests)]
    for path,content in files:
        if args.check:
            if not path.exists() or path.read_text()!=content:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(content)
    meta=json.loads(data)['metadata'];print('LogitFormatter parameter source observations:',meta['source_observations'],'cases:',meta['cases'],'groups:',meta['registered_groups'],'source-only:',meta['source_only'])
if __name__=='__main__':main()
