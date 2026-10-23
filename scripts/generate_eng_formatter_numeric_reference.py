"""Complete pinned EngFormatter/Scalar AST numeric source and math reference.

The mathematical namespace redirects only base-ten power and math.log/log10
primitives. Class algorithms, NumPy dtype/clip/round, builtin format/float and
native errors remain actual upstream code. Decimal180/320 stable results define
the accepted portable mathematical profile; original observations stay separate.
Cases are private functions grouped32 per registered Moon test from the start.
"""
from pathlib import Path
import argparse,ast,copy,decimal,hashlib,inspect,json,math,sys,types,warnings
import numpy as np
from formatter_reference_source import load_eng_formatter
from generate_scalar_formatter_numeric_reference import (PowerTransform,math_pow,math_log10,moon,num as scalar_num,ncode,js,bits,arrcode,viewcode as scalar_viewcode,loccode,count_observations)
from generate_auto_date_reference import formatted
ROOT=Path(__file__).resolve().parents[1]
D=decimal.Decimal

def num(value):
    # Serialize a fixture integer without disabling the runtime's real4300
    # digit guard; its :d conversion must still fail inside the original class.
    if isinstance(value,int) and not isinstance(value,bool):
        return {'kind':'Integer','value':format(D(value),'f')}
    return scalar_num(value)

def viewcode(view):
    # A Python container can retain NumPy scalar elements. Preserve their
    # origin through a uniform typed ndarray interval rather than casting
    # np.int64 endpoints to a Python-float interval (which erases wrapping).
    if not isinstance(view,np.ndarray) and view and all(isinstance(v,np.int64) for v in view):
        return scalar_viewcode(np.array(view,dtype=np.int64))
    if not isinstance(view,np.ndarray) and view and all(isinstance(v,np.float64) for v in view):
        return scalar_viewcode(np.array(view,dtype=np.float64))
    return scalar_viewcode(view)

def natural_log(value):
    if value<=0:raise ValueError('math domain error')
    if not isinstance(value,(int,bool)):
        value=float(value)
        if not math.isfinite(value):return value
    result=[]
    for precision in (180,320):
        with decimal.localcontext() as ctx:
            ctx.prec=precision
            result.append(float((D(value) if isinstance(value,(int,bool)) else D.from_float(value)).ln()))
    if bits(result[0])!=bits(result[1]):raise AssertionError('independent ln precision disagreement')
    return result[0]

def logarithm(value,base=None):
    numerator=natural_log(value)
    return numerator if base is None else numerator/natural_log(base)

def mathematical_namespace(path):
    ns=load_eng_formatter(path)
    proxy=types.SimpleNamespace(**{k:getattr(math,k) for k in dir(math) if not k.startswith('__')})
    proxy.log10=math_log10;proxy.log=logarithm
    ns['math']=proxy;ns['_scalar_math_power']=math_pow
    for name in ('ScalarFormatter','EngFormatter'):
        node=next(n for n in ast.parse(path.read_bytes()).body if isinstance(n,ast.ClassDef) and n.name==name)
        exec(compile(ast.fix_missing_locations(ast.Module(body=[PowerTransform().visit(node)],type_ignores=[])),str(path),'exec'),ns)
    original=ns['cbook']._g_sig_digits
    ns['cbook']._g_sig_digits=types.FunctionType(original.__code__,dict(original.__globals__,math=proxy))
    return ns

class Axis:
    def __init__(self,view):self.view=view
    def get_view_interval(self):return self.view

def observed(fn):
    with warnings.catch_warnings(record=True) as runtime:
        warnings.simplefilter('always')
        try:r={'value':fn(),'error':None}
        except (TypeError,ValueError,ZeroDivisionError,OverflowError,IndexError,AttributeError,KeyError) as e:r={'error':type(e).__name__+': '+str(e)}
    r['runtime_warnings']=[{'category':type(w.message).__name__,'message':str(w.message)} for w in runtime]
    return r

def error_assert(expression,result):
    if result['error']:
        return '  assert_eq(try { ignore('+expression+'); "unexpected success" } catch { @core.DataError::InvalidTicks(message~) => message; _ => "unexpected error" }, '+moon(result['error'])+')\n'
    return '  assert_eq('+expression+', '+moon(result['value'])+')\n'

def setup(ns,places=None,unit='',sep=' ',mathtext=False,tex=False,offset=False,view=None,prefixes=None):
    f=ns['EngFormatter'](unit=unit,places=places,sep=sep,useMathText=mathtext,usetex=tex,useOffset=offset)
    f._offset_threshold=4
    f.ENG_PREFIXES=dict(ns['EngFormatter'].ENG_PREFIXES) if prefixes is None else prefixes.copy()
    if view is not None:f.axis=Axis(view)
    return f

def prelude(places=None,unit='',sep=' ',mathtext=False,tex=False,offset=False,view=None,prefixes=None):
    text='  let previous_threshold = @config.formatter_offset_threshold()\n  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))\n'
    text+='  let formatter = EngFormatter::new(unit='+moon(unit)+', places='+('None' if places is None else 'Some('+ncode(num(places))+')')+', sep='+moon(sep)+', use_math_text=Some('+moon(mathtext)+'), usetex=Some('+moon(tex)+'), use_offset=Some('+ncode(num(offset))+'))\n'
    text+='  @config.set_formatter_offset_threshold(previous_threshold)\n  let state = eng_formatter_state(formatter)\n'
    if prefixes is None:text+='  formatter.set_prefixes(EngPrefixes::si())\n'
    else:
        text+='  let table = EngPrefixes::new()\n'
        for k,v in prefixes.items():text+='  table.set('+ncode(num(k))+', '+moon(v)+')\n'
        text+='  formatter.set_prefixes(table)\n'
    if view is not None:text+='  let axis = FormatterAxisBinding::new()\n  axis.set_view_interval('+viewcode(view)+')\n  formatter.set_axis(Some(axis))\n'
    return text

def state(f):return {'offset':None if f.offset is None else num(f.offset),'order':num(f._orderOfMagnitude),'pattern':f._format}
def state_assert(s):
    return '  verify_eng_numeric_optional(state.scalar.offset, '+('None' if s['offset'] is None else 'Some('+ncode(s['offset'])+')')+')\n  verify_eng_numeric_number(state.scalar.order, '+ncode(s['order'])+')\n  assert_eq(state.scalar.format_pattern, '+moon(s['pattern'])+')\n'

def without_runtime_warnings(value):
    if isinstance(value,dict):return {k:without_runtime_warnings(v) for k,v in value.items() if k!='runtime_warnings'}
    if isinstance(value,list):return [without_runtime_warnings(v) for v in value]
    return value

def generate(path):
    original=load_eng_formatter(path);mathematical=mathematical_namespace(path)
    cases=[];functions=[]
    code='''// Full original EngFormatter/Scalar algorithms. Portable primitive math is explicit.
///|
fn verify_eng_numeric_number(actual : ScalarNumber, expected : ScalarNumber) -> Unit raise {
  match (actual,expected) {
    (Number(a),Number(b)) | (NumpyFloat64(a),NumpyFloat64(b)) => {
      if b.is_nan() { assert_true(a.is_nan()) } else { assert_eq(a.reinterpret_as_uint64(),b.reinterpret_as_uint64()) }
    }
    _ => assert_eq(actual,expected)
  }
}
///|
fn verify_eng_numeric_optional(actual : ScalarNumber?, expected : ScalarNumber?) -> Unit raise {
  match (actual,expected) { (Some(a),Some(b)) => verify_eng_numeric_number(a,b); (None,None) => (); _ => fail("unexpected scalar optional") }
}
'''
    def add(label,inputs,actual,expected,body):
        if 'state.' not in body:
            body=body.replace('  let state = eng_formatter_state(formatter)\n','')
        index=len(cases);cases.append({'id':index,'label':label,'inputs':js(inputs),'source':js(actual),'mathematical':js(expected)})
        functions.append('\n///|\nfn eng_numeric_case_'+str(index)+'() -> Unit raise {\n  let previous_minus = @config.unicode_minus()\n  defer { @config.set_unicode_minus(previous_minus) }\n  @config.set_unicode_minus(true)\n'+body+'}\n')
    values=[0.,-0.,1.,-1.,999.4999999999999,999.5,999.9999,999999.9,1e-30,1e30,1e33,5e-324,math.inf,-math.inf,math.nan,sys.float_info.max,True,False,np.bool_(True),np.bool_(False),0,1,-1,2**63-1,-2**63,10**100,10**308,10**309,10**400,-10**400,np.int64(-2**63),np.int64(2**63-1),np.int64(2**53+1)]
    values += [np.float64(v) for v in values[:16]]
    places=[None,-1,0,1,2,6,101,1100,2147483648,10**100,1.,np.float64(1.)]
    for v in values:
        for precision in places:
            f=setup(original,places=precision);g=setup(mathematical,places=precision)
            a=observed(lambda:f.format_data(v));m=observed(lambda:g.format_data(v))
            body=prelude(places=precision)+error_assert('formatter.format_data_value('+ncode(num(v))+')',m)
            add('format data origins and precision',dict(value=num(v),places=None if precision is None else num(precision)),a,m,body)
    # Native format conversion precedes numeric stages only for :d itself.
    precision=10**4300
    for v in (0.,math.nan):
        f=setup(original,places=precision);g=setup(mathematical,places=precision)
        a=observed(lambda:f.format_data(v));m=observed(lambda:g.format_data(v))
        add('places native integer digit limit',dict(places='10**4300',value=num(v)),a,m,prelude(places=precision)+error_assert('formatter.format_data_value('+ncode(num(v))+')',m))
    for exponent in range(-30,31,3):
        x=10.**exponent
        for v in (math.nextafter(x,0.),x,math.nextafter(x,math.inf)):
            for precision in (None,0,2):
                f=setup(original,places=precision,unit='Hz');g=setup(mathematical,places=precision,unit='Hz')
                a=observed(lambda:f.format_data(v));m=observed(lambda:g.format_data(v))
                add('SI rounded log neighborhood',dict(exponent=exponent,value=num(v),places=precision),a,m,prelude(places=precision,unit='Hz')+error_assert('formatter.format_data('+moon(v)+')',m))
    for v in (math.nextafter(999.5,0.),999.5,math.nextafter(999.5,math.inf),999.9999,999999.9,1e33,-999.5,-1e33):
        for precision in (None,0,1,2):
            f=setup(original,places=precision);g=setup(mathematical,places=precision)
            a=observed(lambda:f.format_data(v));m=observed(lambda:g.format_data(v))
            add('round then one-step prefix promotion',dict(value=num(v),places=precision),a,m,prelude(places=precision)+error_assert('formatter.format_data('+moon(v)+')',m))
    tables=[('fractional',{-1.5:'lo',-1:'a',0:'',1:'b',1.5:'hi'}),('fractional_int_alias',{-.5:'lo',0:'',.5:'hi'}),('zero_denominator',{-330:'underflow'}),('inf_denominator',{330:'overflow'}),('holes',{-3:'m',3:'k'}),('wide_int',{-10**100:'L',0:'',3:'k',300:'X',10**100:'H'}),('huge_positive',{10**100:'A',10**101:'B'}),('nan_first',{math.nan:'nan',0:'',3:'k'}),('nan_last',{0:'',3:'k',math.nan:'nan'}),('empty',{}),('bool',{False:'f',True:'t'}),('npbool',{np.bool_(False):'f',np.bool_(True):'t'}),('npfloat',{np.float64(-3):'m',np.float64(0):'',np.float64(3):'k'}),('wide_ieee',{k:'e'+str(k) for k in range(-330,331,3)})]
    for name,table in tables:
        for v in (0.,1e-3,1.,1000.,1e300,5e-324,-5e-324):
            f=setup(original,prefixes=table);g=setup(mathematical,prefixes=table)
            a=observed(lambda:f.format_data(v));m=observed(lambda:g.format_data(v))
            add('live numeric prefix table '+name,dict(prefixes=[[num(k),v] for k,v in table.items()],value=num(v)),a,m,prelude(prefixes=table)+error_assert('formatter.format_data('+moon(v)+')',m))
    for mathtext,tex in ((False,False),(True,False),(False,True)):
        for unit,sep in [('', ' '),('V-s',' - '),('µΩ','\u202f'),('Hz','')]:
            for v in (-1.25,0.,999.9999):
                f=setup(original,places=2,mathtext=mathtext,tex=tex,unit=unit,sep=sep);g=setup(mathematical,places=2,mathtext=mathtext,tex=tex,unit=unit,sep=sep)
                a={'data':observed(lambda:f.format_data(v)),'alias':observed(lambda:f.format_eng(v)),'empty_call':observed(lambda:f(v))}
                m={'data':observed(lambda:g.format_data(v)),'alias':observed(lambda:g.format_eng(v)),'empty_call':observed(lambda:g(v))}
                body=prelude(places=2,mathtext=mathtext,tex=tex,unit=unit,sep=sep)+error_assert('formatter.format_data('+moon(v)+')',m['data'])+error_assert('formatter.format_eng('+moon(v)+')',m['alias'])+error_assert('formatter.call('+moon(v)+')',m['empty_call'])
                add('math wrappers and whole-result minus',dict(value=num(v),mathtext=mathtext,tex=tex,unit=unit,sep=sep),a,m,body)
    scenarios=[([0.,1.],[0.,1.]),([100000.,100006.],[100000.,100002.,100004.,100006.]),([-100006.,-100000.],[-100006.,-100004.,-100002.,-100000.]),([999999.,1000001.],[999999.,1000000.,1000001.]),([1.,1.],[1.,1.]),([0.,1e-12],[0.,1e-12]),([0.,1e-322],[5e-324,1e-323]),([0.,1.],[0.,1.,math.nan]),([0.,1.],[0.,1.,math.inf]),([0,10**400],[0.,1.]),([0.,2.],[1.]),([2.,0.],[1.]),([0.,1.],[]),(None,[0.,1.]),([np.int64(-2**63),np.int64(2**63-1)],np.array([0,1],dtype=np.int64))]
    for view,locs in scenarios:
        for offset in (False,True):
            for mathtext in (False,True):
                f=setup(original,view=view,offset=offset,mathtext=mathtext,unit='Hz',places=2);g=setup(mathematical,view=view,offset=offset,mathtext=mathtext,unit='Hz',places=2)
                for obj in (f,g):obj.set_scientific(False);obj.set_powerlimits([3.5,3.5])
                a=observed(lambda:f.set_locs(locs));m=observed(lambda:g.set_locs(locs));a['state']=state(f);m['state']=state(g)
                body=prelude(view=view,offset=offset,mathtext=mathtext,unit='Hz',places=2)+'  let scalar = formatter.as_scalar_formatter()\n  scalar.set_scientific(false)\n  scalar.set_power_limits(ScalarPowerLimits::Sequence([3.5,3.5]))\n'+error_assert('formatter.'+loccode(locs),m)+state_assert(m['state'])
                for v in list(locs)[:2]+[0.,np.bool_(True),math.nan]:
                    aa=observed(lambda v=v:f(v));mm=observed(lambda v=v:g(v));a.setdefault('calls',[]).append({'input':num(v),**aa});m.setdefault('calls',[]).append({'input':num(v),**mm});body+=error_assert('formatter.call_value('+ncode(num(v))+')',mm)
                a['offset']=observed(f.get_offset);m['offset']=observed(g.get_offset);body+=error_assert('formatter.get_offset()',m['offset'])
                add('prepare midpoint range and partial states',dict(view=view,locs=[num(v) for v in locs],offset=offset,mathtext=mathtext),a,m,body)
    for offset in (None,0,1.,-1.,np.bool_(True),math.nan):
        for order in (0,3.5,400,-400,np.int64(-1)):
            f=setup(original);g=setup(mathematical)
            for obj in (f,g):obj._locs=[0.,1.];obj.offset=offset;obj._orderOfMagnitude=order;obj._format='%r'
            a={'call':observed(lambda:f(0.)),'offset':observed(f.get_offset)};m={'call':observed(lambda:g(0.)),'offset':observed(g.get_offset)}
            body=prelude()+'  formatter.base.locations = FormatterLocations::Sequence([0.0,1.0])\n  state.scalar.offset = '+('None' if offset is None else 'Some('+ncode(num(offset))+')')+'\n  state.scalar.order = '+ncode(num(order))+'\n  state.scalar.format_pattern = "%r"\n'+error_assert('formatter.call(0.0)',m['call'])+error_assert('formatter.get_offset()',m['offset'])
            add('raw offset truth and integer-base scale',dict(offset=None if offset is None else num(offset),order=num(order)),a,m,body)
    # Inherited short keeps origin-sensitive Boolean float16 spacing and no unit.
    for view in ([0.,0.],[0.,1.],[1.,0.]):
        for v in (np.bool_(True),np.bool_(False),True,np.int64(2**53+1),1.):
            f=setup(original,view=view,unit='Hz');g=setup(mathematical,view=view,unit='Hz')
            a=observed(lambda:f.format_data_short(v));m=observed(lambda:g.format_data_short(v))
            add('inherited short scalar dtype spacing',dict(view=view,value=num(v)),a,m,prelude(view=view,unit='Hz')+error_assert('formatter.format_data_short_value('+ncode(num(v))+')',m))
    # Independent primitive oracle for weak-scalar clip and IEEE signed-zero ties.
    bounds=[(-30,30),(-0.,0.),(0.,-0.),(-0.,-0.),(False,True),(np.bool_(False),np.bool_(True)),(-1.5,1.5),(-10**100,10**100),(10**100,10**101),(-10**101,-10**100),(0.,10**400),(-10**400,0.),(-10**400,np.int64(30)),(np.int64(-30),10**400),(math.nan,30),(-30,math.nan),(np.float64(-3.),np.int64(3)),(-1.,10**100),(10**100,1e101),(-0.,10**400),(-10**400,-0.),(np.bool_(False),1.5),(-.5,np.bool_(True)),(False,np.float64(1.5))]
    for lo,hi in bounds:
        for phase in (-3,0,3):
            a=observed(lambda:num(np.clip(phase,lo,hi)))
            expression='eng_math_clip(@bigint.BigInt::from_int('+str(phase)+'), '+ncode(num(lo))+', '+ncode(num(hi))+')'
            body=error_assert(expression,a) if a['error'] else '  verify_eng_numeric_number('+expression+', '+ncode(a['value'])+')\n'
            add('NumPy clip scalar origin',dict(phase=phase,lower=num(lo),upper=num(hi)),a,a,body)
    for v in [1.,1e-323,1e-30,.001,10.,1000.,1e30,sys.float_info.max,10**400,10**400-1,2**10000,10**4300,np.int64(2**53+1),np.bool_(True)]:
        a=observed(lambda:math.log(v));m=observed(lambda:natural_log(v))
        body='  assert_eq(eng_math_natural_log('+ncode(num(v))+').reinterpret_as_uint64(), '+str(bits(m['value']))+'UL)\n'
        add('rounded natural logarithm mathematical profile',dict(value=num(v)),a,m,body)
        aa=observed(lambda:math.log(v,1000));mm=observed(lambda:logarithm(v,1000))
        body='  let numerator = eng_math_natural_log('+ncode(num(v))+')\n  assert_eq((numerator / log_grid_natural_log(1000.0)).reinterpret_as_uint64(), '+str(bits(mm['value']))+'UL)\n'
        add('rounded ln operands then division',dict(value=num(v)),aa,mm,body)
    for value in [1.2345,2.6755,2.6785,-1.2345,0.,-0.]:
        for v in (value,np.float64(value)):
            actual=observed(lambda:num(round(v,3)))
            body='  verify_eng_numeric_number(scalar_math_round_digits('+ncode(num(v))+',3), '+ncode(actual['value'])+')\n'
            add('midpoint round3 preserves Python versus NumPy',dict(value=num(v)),actual,actual,body)
    # Full source array: refinement sees the final point beyond100000.
    values=np.zeros(200001);values[-1]=0.000123456789
    f=setup(original,view=[0.,1.]);g=setup(mathematical,view=[0.,1.])
    a=observed(lambda:f.set_locs(values));m=observed(lambda:g.set_locs(values));a['state']=state(f);m['state']=state(g)
    body=prelude(view=[0.,1.])+'  let values = Array::make(200001,0.0)\n  values[200000] = '+moon(float(values[-1]))+'\n'+error_assert('formatter.set_locs(values)',m)+state_assert(m['state'])+'  assert_eq(formatter.locations().length(),200001)\n'
    add('full inherited refinement beyond prefix',dict(count=200001,last=num(values[-1])),a,m,body)
    code+=''.join(functions)
    for start in range(0,len(cases),32):
        code+='\n///|\ntest "engineering numeric original group '+str(start//32)+' cases '+str(start)+'-'+str(min(start+31,len(cases)-1))+'" {\n'
        for index in range(start,min(start+32,len(cases))):code+='  eng_numeric_case_'+str(index)+'()\n'
        code+='}\n'
    differences=[dict(id=c['id'],label=c['label'],source=c['source'],mathematical=c['mathematical']) for c in cases if c['source']!=c['mathematical']]
    node=next(n for n in ast.parse(path.read_bytes()).body if isinstance(n,ast.ClassDef) and n.name=='EngFormatter')
    import numpy._core._methods as methods
    methods_path=Path(inspect.getsourcefile(methods))
    payload=dict(source_hashes=original['source_hashes'],eng_class_hash=hashlib.sha256(ast.get_source_segment(path.read_text(),node).encode()).hexdigest(),numpy_methods_hash=hashlib.sha256(methods_path.read_bytes()).hexdigest(),python=sys.version.split()[0],numpy=np.__version__,scope=__doc__,case_count=len(cases),registered_test_count=(len(cases)+31)//32,source_observation_count=sum(count_observations(c['source']) for c in cases),source_profile_differences=differences,numeric_profile_difference_count=sum(without_runtime_warnings(c['source'])!=without_runtime_warnings(c['mathematical']) for c in cases),native_warning_only_difference_count=sum(c['source']!=c['mathematical'] and without_runtime_warnings(c['source'])==without_runtime_warnings(c['mathematical']) for c in cases),allocation_omissions=[dict(domain='native-valid near Int32 maximum fixed precision',reason='GiB output not allocated; independent oracle budget, not Python error. Portable String-addressability Resource checked separately.')],cases=cases)
    return json.dumps(js(payload),indent=2,allow_nan=False)+'\n',formatted(code)

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    outputs=generate(args.ticker)
    for name,content in zip(('testdata/eng_formatter_numeric_reference.json','ticker/eng_formatter_numeric_reference_wbtest.mbt'),outputs):
        target=ROOT/name
        if args.check:
            if not target.exists() or target.read_text()!=content:raise SystemExit('reference differs: '+name)
        else:target.write_text(content)
    data=json.loads(outputs[0]);print('Eng numeric:',data['case_count'],'cases;',data['registered_test_count'],'registered;',data['source_observation_count'],'source observations;',len(data['source_profile_differences']),'source/math differences')
if __name__=='__main__':main()
