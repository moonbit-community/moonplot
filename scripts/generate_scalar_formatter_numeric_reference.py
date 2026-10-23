"""Complete pinned ScalarFormatter numeric AST and independent mathematical profile.

Only power expressions and math.log10 are redirected in the mathematical copy;
all ScalarFormatter control flow, dtype promotion, NumPy round and formatting
remain the original AST. Decimal 180/320 independent agreement certifies the
portable base-ten power/log profile. Actual Darwin observations stay alongside
mathematical values, including any differences; no source expectation is edited.
"""
from pathlib import Path
import argparse, ast, copy, decimal, hashlib, json, math, random, struct, sys, types, warnings
import numpy as np
from formatter_reference_source import load_scalar_formatter
from generate_auto_date_reference import formatted
ROOT=Path(__file__).resolve().parents[1]
D=decimal.Decimal

def bits(x):return struct.unpack('>Q',struct.pack('>d',float(x)))[0]
def moon(s):
    if s is None:return "()"
    if isinstance(s,bool):return str(s).lower()
    if isinstance(s,int):return str(s)
    if isinstance(s,float):return str(bits(s))+'UL.reinterpret_as_double()'
    # Moon raw JSON escapes need scalar braces, but literal backslashes remain.
    text=json.dumps(s,ensure_ascii=False)
    return text.replace('\\b','\\u{8}').replace('\\f','\\u{c}')
def num(x):
    if isinstance(x,np.bool_):return {'kind':'NumpyBool','value':bool(x)}
    if isinstance(x,np.int64):return {'kind':'NumpyInt64','value':str(int(x))}
    if isinstance(x,np.float64):return {'kind':'NumpyFloat64','bits':bits(x)}
    if isinstance(x,bool):return {'kind':'Boolean','value':x}
    if isinstance(x,int):return {'kind':'Integer','value':str(x)}
    return {'kind':'Number','bits':bits(x)}
def ncode(x):
    if x is None:return 'None'
    k=x['kind']
    if 'bits'in x:v=str(x['bits'])+'UL.reinterpret_as_double()'
    elif k=='Integer':v='@bigint.BigInt::from_string('+moon(x['value'])+')'
    elif k=='NumpyInt64':v=x['value']+'L'
    else:v=moon(x['value'])
    return 'ScalarNumber::'+k+'('+v+')'
def js(x):
    if isinstance(x,(float,np.floating)):return {'bits':bits(x)}
    if isinstance(x,np.integer):return int(x)
    if isinstance(x,np.bool_):return bool(x)
    if isinstance(x,np.ndarray):return {'dtype':str(x.dtype),'values':[js(v) for v in x]}
    if isinstance(x,dict):return {k:js(v) for k,v in x.items()}
    if isinstance(x,(list,tuple)):return [js(v) for v in x]
    return x

def stable_decimal(op,*values):
    result=[]
    for p in (180,320):
        with decimal.localcontext() as ctx:
            ctx.prec=p;ctx.Emax=999999;ctx.Emin=-999999
            ds=[D.from_float(float(v)) if isinstance(v,(float,np.floating)) else D(int(v)) for v in values]
            result.append(float(ds[0].log10() if op=='log10' else D(10).__pow__(ds[0])))
    if bits(result[0])!=bits(result[1]):raise AssertionError(('unstable Decimal',op,values))
    return result[0]

def math_pow(base,exponent):
    if base not in (10,10.):return base**exponent
    if isinstance(base,int) and isinstance(exponent,(int,np.integer,bool,np.bool_)):
        return base**exponent
    x=float(exponent)
    numpy=isinstance(exponent,np.generic)
    if math.isnan(x):v=x
    elif x==math.inf:v=math.inf
    elif x==-math.inf:v=0.
    elif x>=309:v=math.inf
    elif x<=-324:v=0.
    else:v=stable_decimal('pow',x)
    if math.isinf(v) and math.isfinite(x) and not numpy:raise OverflowError(34,'Result too large')
    return np.float64(v) if numpy else v

def math_log10(value):
    if value<=0:raise ValueError('math domain error')
    if isinstance(value,(int,bool)):
        return stable_decimal('log10',int(value))
    x=float(value)
    if not math.isfinite(x):return x
    return stable_decimal('log10',x)

class PowerTransform(ast.NodeTransformer):
    def visit_BinOp(self,node):
        node=self.generic_visit(node)
        if isinstance(node.op,ast.Pow):return ast.copy_location(ast.Call(func=ast.Name(id='_scalar_math_power',ctx=ast.Load()),args=[node.left,node.right],keywords=[]),node)
        return node

def profile_namespace(path):
    ns=load_scalar_formatter(path)
    proxy=types.SimpleNamespace(**{key:getattr(math,key) for key in dir(math) if not key.startswith('__')})
    proxy.log10=math_log10
    ns['math']=proxy;ns['_scalar_math_power']=math_pow
    tree=ast.parse(path.read_bytes());node=next(n for n in tree.body if isinstance(n,ast.ClassDef) and n.name=='ScalarFormatter')
    node=PowerTransform().visit(node)
    exec(compile(ast.fix_missing_locations(ast.Module(body=[node],type_ignores=[])),str(path), 'exec'),ns)
    original=ns['cbook']._g_sig_digits
    glob=dict(original.__globals__,math=proxy)
    ns['cbook']._g_sig_digits=types.FunctionType(original.__code__,glob)
    return ns

class Axis:
    def __init__(self,view):self.view=view
    def get_view_interval(self):return self.view

def observed(fn):
    with warnings.catch_warnings(record=True) as rec:
        warnings.simplefilter('always')
        try:r={'value':fn(),'error':None}
        except (TypeError,ValueError,ZeroDivisionError,OverflowError,IndexError,AttributeError) as e:r={'error':type(e).__name__+': '+str(e)}
    r['runtime_warnings']=[{'category':type(v.message).__name__,'message':str(v.message)} for v in rec]
    return r

def state(f):return {'offset':None if f.offset is None else num(f.offset),'order':num(f._orderOfMagnitude),'pattern':f._format}
def err_assert(expression,result):
    if result['error']:
        return '  assert_eq(try { ignore('+expression+'); "unexpected success" } catch { @core.DataError::InvalidTicks(message~) => message; _ => "unexpected error" }, '+moon(result['error'])+')\n'
    return '  assert_eq('+expression+', '+moon(result['value'])+')\n'
def state_assert(f,s):
    return ('  verify_scalar_numeric_optional('+f+'.offset(), '+('None' if s['offset'] is None else 'Some('+ncode(s['offset'])+')')+')\n'
            +'  verify_scalar_numeric_number('+f+'.order_of_magnitude(), '+ncode(s['order'])+')\n'
            +'  assert_eq('+f+'.format_pattern(), '+moon(s['pattern'])+')\n')
def arrcode(values):return '['+', '.join(moon(float(v)) for v in values)+']'
def viewcode(view):
    if isinstance(view,np.ndarray):
        if view.dtype.kind=='i':return 'FormatterViewInterval::NdArray(TickValues::from_int64_array(['+', '.join(str(int(v))+'L' for v in view)+']))'
        return 'FormatterViewInterval::NdArray(TickValues::from_array('+arrcode(view)+'))'
    if all(isinstance(v,int) for v in view):return 'FormatterViewInterval::Integers(['+', '.join('@bigint.BigInt::from_string('+moon(str(v))+')' for v in view)+'])'
    return 'FormatterViewInterval::Sequence('+arrcode(view)+')'
def loccode(values):
    if isinstance(values,np.ndarray):
        if values.dtype.kind=='i':return 'set_locs_view(TickValues::from_int64_array(['+', '.join(str(int(v))+'L' for v in values)+']))'
        return 'set_locs_view(TickValues::from_array('+arrcode(values)+'))'
    return 'set_locs('+arrcode(values)+')'

def count_observations(value):
    if isinstance(value,dict):return (1 if 'error' in value else 0)+sum(count_observations(v) for v in value.values())
    if isinstance(value,list):return sum(count_observations(v) for v in value)
    return 0

def generate(path):
    source=load_scalar_formatter(path); profile=profile_namespace(path)
    cases=[];code='''// Independent complete ScalarFormatter numerical AST, mathematical primitive profile.
///|
fn verify_scalar_numeric_number(actual : ScalarNumber, expected : ScalarNumber) -> Unit raise {
  match (actual, expected) {
    (Number(a), Number(b)) | (NumpyFloat64(a), NumpyFloat64(b)) => {
      if b.is_nan() { assert_true(a.is_nan()) } else { assert_eq(a.reinterpret_as_uint64(), b.reinterpret_as_uint64()) }
    }
    _ => assert_eq(actual, expected)
  }
}
///|
fn verify_scalar_numeric_optional(actual : ScalarNumber?, expected : ScalarNumber?) -> Unit raise {
  match (actual, expected) {
    (Some(a), Some(b)) => verify_scalar_numeric_number(a,b)
    (None,None) => ()
    _ => fail("unexpected scalar optional")
  }
}
'''
    def add(label,inputs,actual,expected,body):
        nonlocal code
        case={'id':len(cases),'label':label,'inputs':js(inputs),'source':js(actual),'mathematical':js(expected)};cases.append(case)
        code+='\n///|\ntest "scalar numeric '+str(case['id'])+' '+label+'" {\n  let previous_minus = @config.unicode_minus()\n  defer { @config.set_unicode_minus(previous_minus) }\n  @config.set_unicode_minus(true)\n'+body+'}\n'
    def setup(ns,offset=False,science=True,limits=None,view=(0,1),mathtext=False,tex=False):
        f=ns['ScalarFormatter'](useOffset=offset,useMathText=mathtext,useLocale=False,usetex=tex)
        f._offset_threshold=4;f._scientific=science;f._powerlimits=limits if limits is not None else [-5,6]
        if view is not None:f.axis=Axis(view)
        return f
    def prelude(offset=False,science=True,limits=None,view=(0,1),mathtext=False,tex=False):
        text='  let previous_threshold = @config.formatter_offset_threshold()\n  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))\n'
        text+='  let formatter = ScalarFormatter::new(use_offset=Some('+ncode(num(offset))+'), use_math_text=Some('+moon(mathtext)+'), use_locale=Some(false), usetex=Some('+moon(tex)+'))\n'
        text+='  @config.set_formatter_offset_threshold(previous_threshold)\n  formatter.set_scientific('+moon(science)+')\n'
        lim=limits if limits is not None else [-5,6]
        text+='  formatter.set_power_limits(ScalarPowerLimits::Values(['+', '.join(ncode(num(v)) for v in lim)+']))\n'
        if view is not None:text+='  let axis = FormatterAxisBinding::new()\n  axis.set_view_interval('+viewcode(view)+')\n  formatter.set_axis(Some(axis))\n'
        return text
    prepare=[]
    for values,view in [([0.,.25,.5,.75,1.],(0.,1.)),([100000.,100002.,100004.],(100000.,100004.)),([-100004.,-100002.,-100000.],(-100004.,-100000.)),([999999.,1000000.,1000001.],(999999.,1000001.)),([1e-14,math.nextafter(1e-14,math.inf)],(0.,1e-13)),([5e-324,1e-323],(0.,1e-322)),([0.,1.,math.nan],(0.,1.)),([0.,1.,math.inf],(0.,1.)),([math.nan],(0.,1.)),([math.inf],(0.,1.)),([1.],(0.,2.)),([0.],(0.,0.)),([1.,1.],(0.,2.)),([1e308,math.nextafter(1e308,math.inf)],(1e308,math.nextafter(1e308,math.inf))),([math.nextafter(100.,0.),100.],(0.,100.)),([0.,1.,10000.],(0.,1.)),([100000.,100002.,1e10],(100000.,100002.))]:
        for offset in (False,True):
            for science in (False,True):prepare.append(dict(values=values,view=view,offset=offset,science=science))
    for origin in ('float','int'):
        for vals in [[-9223372036854775808,-9223372036854775807],[-1,0,1],[9007199254740992,9007199254740994],[9223372036854775806,9223372036854775807]]:
            values=np.array(vals,dtype=np.int64 if origin=='int' else np.float64)
            for offset in (False,1):
                for science in (False,True):prepare.append(dict(values=values,view=[-10**400,10**400],offset=offset,science=science))
    for limit in (2.5,3.5,-2.5,0.,math.nan,math.inf,-math.inf,400,-400,np.int64(2),np.float64(3.5),True,np.bool_(True)):
        prepare.append(dict(values=[1.,2.,3.],view=None,offset=False,science=True,limits=[limit,limit]))
    for vals in ([1.],[math.nan],np.array([1],dtype=np.int64),np.array([1.],dtype=np.float64)):
        for view in ([0,10**100],[0,10**400],[-10**100,10**100]):prepare.append(dict(values=vals,view=view,offset=False,science=False))
    for shape in ([],[0.],[0.,1.,2.]):prepare.append(dict(values=[1.],view=shape,offset=False,science=False))
    for values in ([],[0.,1.],[1.]):prepare.append(dict(values=values,view=None,offset=False,science=False))
    for item in prepare:
        vals=item.pop('values');kwargs=item
        actual=setup(source,**kwargs);expected=setup(profile,**kwargs)
        a=observed(lambda:actual.set_locs(vals));m=observed(lambda:expected.set_locs(vals))
        a['state']=state(actual);m['state']=state(expected)
        body=prelude(**kwargs)+err_assert('formatter.'+loccode(vals),m)+state_assert('formatter',m['state'])
        for v in list(vals)[:2]+[0.,-0.,1e-8,math.nan]:
            aa=observed(lambda v=v:actual(v));mm=observed(lambda v=v:expected(v))
            a.setdefault('calls',[]).append({'input':num(v),**aa});m.setdefault('calls',[]).append({'input':num(v),**mm})
            body+=err_assert('formatter.call_value('+ncode(num(v))+')',mm)
        aa=observed(actual.get_offset);mm=observed(expected.get_offset);a['offset_text']=aa;m['offset_text']=mm
        body+=err_assert('formatter.get_offset()',mm)
        add('complete prepare and failed-state calls',dict(values=[num(v) for v in vals],container=type(vals).__name__,**kwargs),a,m,body)
    # Full-source data/short work directly, independently of prepared state.
    values=[0.,-0.,1.,-1.,1.23456789005,1.99999999999,9.99999999999,1e-4,5e-324,math.inf,math.nan,sys.float_info.max,True,False,10**400,-10**400,np.int64(-9223372036854775808),np.int64(9007199254740993),np.bool_(True),np.bool_(False)]
    values += [np.float64(v) for v in values[:12]]
    for v in values:
        for mathtext,tex in ((False,False),(True,False),(False,True)):
            f=setup(source,mathtext=mathtext,tex=tex);g=setup(profile,mathtext=mathtext,tex=tex)
            a=observed(lambda:f.format_data(v));m=observed(lambda:g.format_data(v))
            body=prelude(mathtext=mathtext,tex=tex)+err_assert('formatter.format_data_value('+ncode(num(v))+')',m)
            add('format data scalar origin',dict(value=num(v),mathtext=mathtext,tex=tex),a,m,body)
    for view in (None,(0.,1.),(1.,0.),(0.,0.),(math.nan,math.nan),(0.,math.inf),[0,10**400],np.array([0,1],dtype=np.int64)):
        for v in (0.,-0.,1.,math.nan,math.inf,sys.float_info.max,True,np.bool_(True),np.int64(9007199254740993),10**400):
            f=setup(source,view=view);g=setup(profile,view=view)
            a=observed(lambda:f.format_data_short(v));m=observed(lambda:g.format_data_short(v))
            body=prelude(view=view)+err_assert('formatter.format_data_short_value('+ncode(num(v))+')',m)
            add('short integral bypass and raw view',dict(value=num(v),view=view),a,m,body)
    # Raw slots expose integer deadzone and integer-vs-float exponent semantics.
    for pattern in ('%r','%x','%d','plain','', '%1.2f'):
        for v in (0.,-0.,5e-9,1e-8,np.float64(math.nan),np.int64(1)):
            f=setup(source,science=False);g=setup(profile,science=False)
            for obj in (f,g):obj.set_locs([0.,1.]);obj._format=pattern
            a=observed(lambda:f(v));m=observed(lambda:g(v))
            body=prelude(science=False)+'  formatter.set_locs([0.0,1.0])\n  formatter.set_format_pattern('+moon(pattern)+')\n'+err_assert('formatter.call_value('+ncode(num(v))+')',m)
            add('raw format deadzone origin',dict(pattern=pattern,value=num(v)),a,m,body)
    # Raw offsets/orders are consumed only after locations exist. The original
    # class provides the operation ordering and NumPy scalar promotion oracle.
    raw_offsets=[None,0,-0.,True,np.bool_(True),np.int64(-9223372036854775808),np.float64(0.),2**100]
    raw_values=[1.,np.float64(1.),np.int64(1),True,np.bool_(True),math.nan]
    for offset in raw_offsets:
        for v in raw_values:
            f=setup(source,science=False);g=setup(profile,science=False)
            for obj in (f,g):obj.set_locs([0.,1.]);obj.offset=offset;obj._format='%r'
            a=observed(lambda:f(v));m=observed(lambda:g(v))
            body=prelude(science=False)+'  formatter.set_locs([0.0,1.0])\n  formatter.set_offset('+('None' if offset is None else 'Some('+ncode(num(offset))+')')+')\n  formatter.set_format_pattern("%r")\n'+err_assert('formatter.call_value('+ncode(num(v))+')',m)
            add('raw offset full numeric origins',dict(offset=None if offset is None else num(offset),value=num(v)),a,m,body)
    for order in [400,-400,3.5,-3.5,np.float64(3.5),np.int64(19),np.int64(20),np.int64(-1),True,np.bool_(True),math.inf,math.nan,10**400,-10**400]:
        for mathtext in (False,True):
            # Avoid materializing an impossible integer power only in the
            # mathematical offset branch; record it as an allocation omission.
            if isinstance(order,int) and order>10000 and mathtext:continue
            f=setup(source,science=False,mathtext=mathtext);g=setup(profile,science=False,mathtext=mathtext)
            for obj in (f,g):obj.set_locs([0.,1.]);obj._orderOfMagnitude=order
            a={'call':observed(lambda:f(1.)), 'offset':observed(f.get_offset)}
            m={'call':observed(lambda:g(1.)), 'offset':observed(g.get_offset)}
            body=prelude(science=False,mathtext=mathtext)+'  formatter.set_locs([0.0,1.0])\n  formatter.set_order_of_magnitude('+ncode(num(order))+')\n'+err_assert('formatter.call(1.0)',m['call'])+err_assert('formatter.get_offset()',m['offset'])
            add('cached exponent int-base versus float-base',dict(order=num(order),mathtext=mathtext),a,m,body)
    # Fixed mathematical primitive profile, separately sourced original operations.
    primitive=[]
    exps=list(range(-324,309))+[-323.9,-308.5,-100.25,-5.5,-.5,-2**-54,2**-54,.5,1.5,3.5,100.125,308.25,308.3,308.5]
    rng=random.Random(3131)
    exps += [rng.uniform(-323.99,308.26) for _ in range(120)]
    for x in exps:
        actual=observed(lambda x=x:float(10.**x));expected=observed(lambda x=x:math_pow(10.,x))
        body='  let actual = scalar_math_pow10('+moon(float(x))+')\n'
        if expected['error']: # The IEEE primitive intentionally precedes Python overflow wrapper.
            body+='  assert_true(actual.is_inf())\n'
        elif math.isnan(expected['value']):body+='  assert_true(actual.is_nan())\n'
        else:body+='  assert_eq(actual.reinterpret_as_uint64(), '+str(bits(expected['value']))+'UL)\n'
        add('portable power mathematical profile',dict(exponent=num(x)),actual,expected,body)
    for x in (1,10**400,10**400+10**385,2**1000,10**1000-1):
        actual=observed(lambda x=x:math.log10(x));expected=observed(lambda x=x:math_log10(x))
        body='  assert_eq(scalar_math_log10('+ncode(num(x))+').reinterpret_as_uint64(), '+str(bits(expected['value']))+'UL)\n'
        add('big integer logarithm',dict(value=num(x)),actual,expected,body)
    for x in [0.,-0.,5e-324,1e-14,math.nextafter(1e-14,math.inf),1.23456789012345,-1.23456789012345,sys.float_info.max,math.inf,math.nan]:
        for p in (0,1,8,9,10,22,33,100,308,328,-1,-22):
            a=observed(lambda x=x,p=p:float(np.round(np.float64(x),decimals=p)))
            body='  let actual = scalar_math_numpy_round('+moon(x)+', '+str(p)+')\n'
            if math.isnan(a['value']):body+='  assert_true(actual.is_nan())\n'
            else:body+='  assert_eq(actual.reinterpret_as_uint64(), '+str(bits(a['value']))+'UL)\n'
            add('native NumPy repeated-factor round',dict(value=num(x),decimals=p),a,a,body)
    # Reentrant set_locs replaces the retained handle inside a view read. The
    # full original source decides which stage keeps or rereads that handle.
    for mode in ('offset_capture','format_length_reread'):
        out=[]
        for ns in (source,profile):
            f=setup(ns,offset=mode=='offset_capture',science=False,view=None)
            class ReentrantAxis:
                def get_view_interval(self):
                    f.set_useOffset(False);f.set_locs([0.,1.])
                    return (100000.,100004.) if mode=='offset_capture' else (.25,2.125)
            f.axis=ReentrantAxis()
            vals=[100000.,100002.,100004.] if mode=='offset_capture' else [1.]
            result=observed(lambda:f.set_locs(vals));result['state']=state(f)
            result['call']=observed(lambda:f(1.));result['offset']=observed(f.get_offset);result['retained']=list(f._locs)
            out.append(result)
        body=prelude(offset=mode=='offset_capture',science=False,view=None)
        interval=[100000.,100004.] if mode=='offset_capture' else [.25,2.125]
        body+='  let axis = FormatterAxisBinding::new()\n  axis.bind_view_interval(() => {\n    formatter.set_use_offset(Some(ScalarNumber::Boolean(false)))\n    formatter.set_locs([0.0,1.0])\n    FormatterViewInterval::Sequence('+arrcode(interval)+')\n  })\n  formatter.set_axis(Some(axis))\n'
        body+=err_assert('formatter.'+loccode(vals),out[1])+state_assert('formatter',out[1]['state'])
        body+=err_assert('formatter.call(1.0)',out[1]['call'])+err_assert('formatter.get_offset()',out[1]['offset'])
        body+='  assert_eq(formatter.locations().get(0),0.0)\n  assert_eq(formatter.locations().length(),2)\n'
        add('reentrant '+mode,dict(values=[num(v) for v in vals]),out[0],out[1],body)
    # Full source array, last point after 100000 changes refinement. No cap.
    values=np.zeros(200001);values[-1]=0.000123456789
    f=setup(source,science=False);g=setup(profile,science=False)
    a=observed(lambda:f.set_locs(values));m=observed(lambda:g.set_locs(values));a['state']=state(f);m['state']=state(g)
    body=prelude(science=False)+'  let values = Array::make(200001,0.0)\n  values[200000] = '+moon(float(values[-1]))+'\n'+err_assert('formatter.set_locs(values)',m)+state_assert('formatter',m['state'])+'  assert_eq(formatter.locations().length(),200001)\n'
    for v in (0.,float(values[-1])):
        aa=observed(lambda v=v:f(v));mm=observed(lambda v=v:g(v));a.setdefault('calls',[]).append(aa);m.setdefault('calls',[]).append(mm);body+=err_assert('formatter.call('+moon(v)+')',mm)
    add('full array last point beyond legacy prefix',dict(count=200001,last=num(values[-1])),a,m,body)
    differences=[{'id':c['id'],'label':c['label'],'source':c['source'],'mathematical':c['mathematical']} for c in cases if c['source']!=c['mathematical']]
    payload={'source_hashes':source['source_hashes'],'python':sys.version.split()[0],'numpy':np.__version__,'scope':__doc__,'generated_test_count':len(cases),'source_observation_count':sum(count_observations(c['source']) for c in cases),'source_profile_differences':differences,'known_source_nontermination':[{'locs':['9007199254740992','9007199254740993'],'dtype':'int64','source_event':'external trace stopped at generator line event3001; not a Python exception','proof':'unequal original extrema map to identical float extrema and all later floor-div comparisons remain equal','library_boundary':'Unsupported: unequal integer extrema collapse to one float; upstream offset search does not terminate'}],'allocation_omissions':[{'domain':'math-mode offset with raw positive order10**400','reason':'exact integer power10**(10**400) cannot be allocated; no source call; plain offset and call float-overflow tested separately'}, {'domain':'integer 10**n with n>=715827883','reason':'result bit length >=3n+1 exceeds Int32 bit addressability; port structural Resource, not source exception; no giant allocation run'}],'cases':cases}
    return json.dumps(js(payload),indent=2,allow_nan=False)+'\n',formatted(code)

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('ticker',type=Path);p.add_argument('--check',action='store_true');args=p.parse_args()
    out=generate(args.ticker)
    for name,content in zip(('testdata/scalar_formatter_numeric_reference.json','ticker/scalar_formatter_numeric_reference_wbtest.mbt'),out):
        path=ROOT/name
        if args.check:
            if not path.exists() or path.read_text()!=content:raise SystemExit('reference differs: '+name)
        else:path.write_text(content)
    data=json.loads(out[0]);print('Scalar numeric:',data['generated_test_count'],'tests;',len(data['source_profile_differences']),'dual-profile differences')
if __name__=='__main__':main()
