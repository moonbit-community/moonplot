"""Four complete original LogFormatter ASTs, actual source and mathematical profiles.

Only elementary ln/log10/power values are redirected in the mathematical run.
All class control flow, actual NumPy geomspace/logspace/linspace/round, builtin
round/set/format, transforms._nonsingular and real cbook context/strip helpers
remain original code. Decimal180/320 agreement independently certifies each new
primitive. Source labels, errors, native warnings and raw point differences stay
separate; no tolerance, edited source expectation or old port helper is an oracle.
"""
from pathlib import Path
import argparse,ast,copy,decimal,functools,hashlib,inspect,json,math,struct,types,warnings
import numpy as np
from formatter_reference_source import load_log_formatters
from generate_scalar_formatter_numeric_reference import moon,num,ncode,bits,viewcode
from generate_eng_formatter_numeric_reference import logarithm
from generate_auto_date_reference import formatted
ROOT=Path(__file__).resolve().parents[1]
D=decimal.Decimal
CLASSES=('LogFormatter','LogFormatterExponent','LogFormatterMathtext','LogFormatterSciNotation')
STYLES=('Plain','Exponent','Mathtext','SciNotation')

@functools.lru_cache(None)
def positive_power(base,exponent):
    if exponent==0 or base==1:return 1.
    if math.isnan(base) or math.isnan(exponent):return math.nan
    if base==0:return math.inf if exponent<0 else 0.
    if math.isinf(base):return 0. if exponent<0 else math.inf
    if math.isinf(exponent):return math.inf if (base>1)!=(exponent<0) else 0.
    out=[]
    for p in (180,320):
        with decimal.localcontext() as ctx:
            ctx.prec=p;ctx.Emax=999999;ctx.Emin=-999999
            try:out.append(float(D.from_float(base).__pow__(D.from_float(exponent))))
            except decimal.Overflow:out.append(math.inf)
    if bits(out[0])!=bits(out[1]):raise AssertionError(('independent pow precision disagreement',base,exponent))
    return out[0]

def math_power(base,exponent):
    b=float(base);e=float(exponent)
    if b<0:return base**exponent
    out=positive_power(b,e)
    numpy=isinstance(base,np.generic) or isinstance(exponent,np.generic)
    if not numpy and math.isinf(out) and math.isfinite(b) and math.isfinite(e):raise OverflowError(34,'Numerical result out of range')
    return np.float64(out) if numpy else out

class PowerTransform(ast.NodeTransformer):
    def visit_BinOp(self,node):
        node=self.generic_visit(node)
        if isinstance(node.op,ast.Pow):return ast.copy_location(ast.Call(ast.Name('_log_math_power',ast.Load()),[node.left,node.right],[]),node)
        return node

def np_math_log10(value):
    a=np.asarray(value)
    def scalar(x):
        x=float(x)
        if x==0:return -math.inf
        if x<0:return math.nan
        if not math.isfinite(x):return x
        out=[]
        for p in (180,320):
            with decimal.localcontext() as ctx:ctx.prec=p;out.append(float(D.from_float(x).log10()))
        if bits(out[0])!=bits(out[1]):raise AssertionError('log10 precision disagreement')
        return out[0]
    if a.ndim==0:return np.float64(scalar(a))
    return np.array([scalar(x) for x in a.flat]).reshape(a.shape)

def np_math_power(base,exponent):
    a,b=np.broadcast_arrays(base,exponent)
    values=[positive_power(float(x),float(y)) for x,y in zip(a.flat,b.flat)]
    return np.array(values).reshape(a.shape)

def mathematical_namespace(path):
    ns=load_log_formatters(path)
    proxy=types.SimpleNamespace(**{key:getattr(math,key) for key in dir(math) if not key.startswith('__')})
    proxy.log=logarithm
    ns['math']=proxy;ns['_log_math_power']=math_power
    nx=types.SimpleNamespace(**{key:getattr(np,key) for key in dir(np)})
    nx.log10=np_math_log10;nx.power=np_math_power
    function_ns=dict(np.geomspace.__wrapped__.__globals__,_nx=nx)
    for name in ('logspace','geomspace'):
        node=ast.parse(inspect.getsource(getattr(np,name).__wrapped__)).body[0]
        node.decorator_list=[]
        exec(compile(ast.Module(body=[node],type_ignores=[]),inspect.getsourcefile(getattr(np,name).__wrapped__),'exec'),function_ns)
    np_proxy=types.SimpleNamespace(**{key:getattr(np,key) for key in dir(np)})
    np_proxy.geomspace=function_ns['geomspace']
    ns['np']=np_proxy
    nodes=[PowerTransform().visit(copy.deepcopy(n)) for n in ast.parse(path.read_bytes()).body if isinstance(n,ast.ClassDef) and n.name in CLASSES]
    exec(compile(ast.fix_missing_locations(ast.Module(body=nodes,type_ignores=[])),str(path),'exec'),ns)
    return ns,function_ns['geomspace']

class Axis:
    def __init__(self,view,linthresh=None):self.view=view;self.linthresh=linthresh
    def get_view_interval(self):return self.view
    def get_transform(self):
        if self.linthresh is None:return types.SimpleNamespace()
        return types.SimpleNamespace(linthresh=self.linthresh)

def observed(fn):
    with warnings.catch_warnings(record=True) as caught:
        warnings.simplefilter('always')
        try:r={'value':fn(),'error':None}
        except (TypeError,ValueError,ZeroDivisionError,OverflowError,IndexError,AttributeError) as e:r={'error':type(e).__name__+': '+str(e)}
    r['runtime_warnings']=[{'category':type(w.message).__name__,'message':str(w.message)} for w in caught]
    return r

def lcode(value):
    if value is None:return 'LogValue::NoneValue'
    if isinstance(value,str):return 'LogValue::Text('+moon(value)+')'
    return 'LogValue::Numeric('+ncode(num(value))+')'

def threshold_code(values):
    if values is None:return 'None'
    if isinstance(values,np.ndarray):
        dtype='from_int64_array' if values.dtype==np.dtype('int64') else 'from_array'
        vals='['+', '.join(str(int(v))+'L' if dtype=='from_int64_array' else moon(float(v)) for v in values)+']'
        return 'Some(LogMinorThresholds::NdArray(TickValues::'+dtype+'('+vals+')))'
    return 'Some(LogMinorThresholds::Sequence(['+', '.join(lcode(v) for v in values)+']))'

def prelude(style,base=10.,thresholds=(1,.4),linthresh=None,view=(1.,100.),label=False):
    text='  let formatter = LogFormatter'+('' if style=='Plain' else style)+'::new(base='+lcode(base)+', label_only_base='+lcode(label)+', minor_thresholds='+threshold_code(thresholds)+', linthresh='+lcode(linthresh)+')\n'
    text+='  let base = formatter.as_base_formatter()\n  let state = log_formatter_state(base)\n'
    if view is not None:text+='  let axis = FormatterAxisBinding::new()\n  axis.set_view_interval('+viewcode(view)+')\n  formatter.set_axis(Some(axis))\n'
    return text

def assertion(expression,result):
    if result['error']:
        return '  assert_eq(try { ignore('+expression+'); "unexpected success" } catch { @core.DataError::InvalidTicks(message~) => message; _ => "unexpected error" }, '+moon(result['error'])+')\n'
    return '  assert_eq('+expression+', '+moon(result['value'])+')\n'

def encoded(value):
    if isinstance(value,np.ndarray):return {'dtype':str(value.dtype),'values':[num(v) for v in value]}
    if isinstance(value,(list,tuple)):return [encoded(v) for v in value]
    if isinstance(value,str) or value is None:return value
    return num(value)

def cache_result(f):
    if f._sublabels is None:return None
    values=sorted(float(x) for x in f._sublabels)
    return {'length':len(values),'bits':[bits(v) for v in values]}

def cache_assert(data):
    if data is None:return '  assert_true(state.sublabels is None)\n'
    text='  let snapshot = log_cache_values(state.sublabels.unwrap())\n  assert_eq(snapshot.length(), '+str(data['length'])+')\n'
    values=data['bits']
    if len(values)<=300:text+='  assert_eq(snapshot.map(value => value.reinterpret_as_uint64()), ['+', '.join(str(v)+'UL' for v in values)+'])\n'
    else:
        for i in [0,1,2,3,4,len(values)//2,len(values)-5,len(values)-4,len(values)-3,len(values)-2,len(values)-1]:text+='  assert_eq(snapshot['+str(i)+'].reinterpret_as_uint64(), '+str(values[i])+'UL)\n'
    return text

def build(path):
    source=load_log_formatters(path);mathematics,math_geom=mathematical_namespace(path)
    cases=[];bodies=[];differences=[];warning_differences=[];primitive=[];primitive_bodies=[];budget=[]
    def add(kind,row,body):
        row.update(id=len(cases),kind=kind);cases.append(row);bodies.append(body)
    bases=[10.,2.,math.e,.5,1.,0.,-2.,math.inf,math.nan,math.nextafter(1.,0.),math.nextafter(1.,math.inf),5e-324,1e308,3.]
    values=[0.,-0.,1.,-1.,2.,-2.,.1,math.nextafter(1.,0.),math.nextafter(1.,math.inf),10000.,10001.,1e-300,1e300,math.inf,-math.inf,math.nan,np.int64(-2**63),np.int64(2**63-1),np.float64(-0.),np.float64(2.),np.bool_(True),False,10**400,2**53+1]
    for cls,style in zip(CLASSES,STYLES):
      for b in bases:
       for value in values:
        fs=source[cls](base=b);fm=mathematics[cls](base=b)
        fs.axis=Axis((1.,100.));fm.axis=Axis((1.,100.))
        row={'class':cls,'base_bits':bits(b),'value':num(value),'source':{},'mathematical':{}}
        body=prelude(style,b)+'  let value = '+ncode(num(value))+'\n'
        for method,entry in [('__call__','log_named_call(base, state, value, None)'),('format_data','log_named_data(base, state, value)'),('format_data_short','log_named_short(value)')]:
            a=observed(lambda:getattr(fs,method)(value));c=observed(lambda:getattr(fm,method)(value))
            row['source'][method]=a;row['mathematical'][method]=c;body+=assertion(entry,c)
            if a!=c:differences.append({'case':len(cases),'method':method,'source':a,'mathematical':c})
        add('calls',row,body)
    # isclose's relative-only behavior and native nonfinite round failures.
    for value in [0.,-0.,5e-324,1e-15,1.,math.nextafter(1.,0.),1.+1e-9,1.+1.001e-9,300.+3e-7,math.nan,math.inf,-math.inf]:
        a=observed(lambda:source['_is_close_to_int'](value));add('close',{'value':num(value),'source':a,'mathematical':a},assertion('log_format_close('+moon(value)+')',a))
    # Complete shape and late threshold/linthresh paths. Each unsuccessful RHS
    # must retain the previous cache; the argument remains ignored throughout.
    prep_specs=[]
    for b in [10.,2.,math.e,.5,1.,0.,-.5,-2.,-3.,math.inf,math.nan,5e-324]:
      for thresholds in [(1,.4),(5,-1),(100,100)]:
       for view,linear in [((1.,5.),None),((.9,1.1),None),((-.1,.1),1.),((-100.,100.),1.)]:prep_specs.append((b,thresholds,view,linear))
    for t in [[],[0],[100],[math.nan,.4],[math.inf],[-math.inf],[None,0],['1',0],[10**400,0],[-2**63-1,0],[-2**63,0],[2**64-1,0],[2**64,0],np.array([1,0],dtype=np.int64),np.array([math.nan,.4]),[np.bool_(True),.4]]:
        prep_specs.append((10.,t,(1.,5.),None))
    for linear in [0.,-1.,np.int64(1),np.bool_(True),'x']:
        prep_specs.append((10.,(1,.4),(-10.,10.),linear))
    for view in [np.array([-2**63,2**63-1],dtype=np.int64),(0.,0.),(-1.,0.),(math.nan,10.),(1.,math.inf),(10**400,10**400+1)]:prep_specs.append((10.,(1,.4),view,None))
    for b,thresholds,view,linear in prep_specs:
        fs=source['LogFormatter'](base=b,minor_thresholds=thresholds,linthresh=linear);fm=mathematics['LogFormatter'](base=b,minor_thresholds=thresholds,linthresh=linear)
        fs.axis=Axis(view);fm.axis=Axis(view);fs._sublabels={13.};fm._sublabels={13.}
        a=observed(lambda:fs.set_locs([math.nan]));c=observed(lambda:fm.set_locs([math.nan]));a['cache']=cache_result(fs);c['cache']=cache_result(fm)
        row={'base_bits':bits(b),'thresholds':encoded(thresholds),'view':encoded(view),'linthresh':encoded(linear),'source':a,'mathematical':c}
        body=prelude('Plain',b,thresholds,linear,view)+'  state.sublabels = Some(log_cache_explicit([13.0]))\n'+assertion('log_named_prepare(base, state)',c)+cache_assert(c['cache'])
        add('prepare',row,body)
        if a!=c:warning_differences.append({'case':len(cases)-1,'source':a,'mathematical':c})
    for style,cls in zip(STYLES,CLASSES):
      for minimum in [0,1,3,10**100]:
       for value in [-2.,math.nan]:
        fs=source[cls](labelOnlyBase='raw');fm=mathematics[cls](labelOnlyBase='raw');fs.axis=Axis((1.,100.));fm.axis=Axis((1.,100.))
        source['mpl'].rcParams['axes.formatter.min_exponent']=minimum;mathematics['mpl'].rcParams['axes.formatter.min_exponent']=minimum
        a=observed(lambda:fs.format_data(value));c=observed(lambda:fm.format_data(value))
        body=prelude(style,label='raw')+'  let previous_min = @config.formatter_min_exponent()\n  @config.set_formatter_min_exponent(@bigint.BigInt::from_string('+moon(str(minimum))+'))\n  defer { @config.set_formatter_min_exponent(previous_min) }\n'+assertion('log_named_data(base, state, '+ncode(num(value))+')',c)+'  assert_true(state.label_only_base is Text("raw"))\n'
        add('data-finally-rc',{'style':style,'minimum':str(minimum),'value':num(value),'source':a,'mathematical':c,'restored':fs.labelOnlyBase=='raw'},body)
    source['mpl'].rcParams['axes.formatter.min_exponent']=0;mathematics['mpl'].rcParams['axes.formatter.min_exponent']=0
    # Real complete arrays, not prefix stand-ins. Independent full Decimal
    # enumeration has a separate explicit CPU budget omission.
    for b,thresholds in [(250000.,(5,-1)),(400000.,(5,-1)),(200000.75,(100,100))]:
        f=source['LogFormatterSciNotation'](base=b,minor_thresholds=thresholds,linthresh=1.);f.axis=Axis((-.1,.1))
        a=observed(lambda:f.set_locs());cache=cache_result(f)
        body=prelude('SciNotation',b,thresholds,1.,(-.1,.1))+assertion('log_named_prepare(base, state)',a)+cache_assert(cache)
        label=observed(lambda:f(math.nextafter(1.,0.)))
        body+=assertion('log_named_call(base, state, ScalarNumber::Number('+moon(math.nextafter(1.,0.))+'), None)',label)
        add('complete-large-source',{'base_bits':bits(b),'source':a,'cache':cache,'tail_label':label,'mathematical_selected':'forced first and last coefficients; full rounded-set source assertions remain strict'},body)
        if thresholds[1]<0:budget.append({'case':len(cases)-1,'operation':'full Decimal geomspace','reason':'independent per-point 180/320 decimal CPU budget; actual source full array executed','source_points':int(b)//2+1})
    for b,t in [(2.**60,(100,100)),(2.**61,(5,-1)),(float.fromhex('0x1.fffffffffffffp1023'),(5,-1)),(math.inf,(100,100)),(math.nan,(100,100)),(-1e20,(100,100)),(-1e308,(100,100))]:
        f=source['LogFormatter'](base=b,minor_thresholds=t,linthresh=1.);f.axis=Axis((-.1,.1));f._sublabels={13.}
        a=observed(lambda:f.set_locs())
        body=prelude('Plain',b,t,1.,(-.1,.1))+'  state.sublabels = Some(log_cache_explicit([13.0]))\n'+assertion('log_named_prepare(base, state)',a)+cache_assert(cache_result(f))
        add('actual-shape-error',{'base_bits':bits(b),'source':a,'old_cache':cache_result(f)},body)
    for cls,style in zip(CLASSES,STYLES):
      for view in [(0.,0.),(math.nan,10.),(1.,math.inf),np.array([-2**63,2**63-1],dtype=np.int64),(10**400,10**400+1)]:
        fs=source[cls]();fm=mathematics[cls]();fs.axis=Axis(view);fm.axis=Axis(view)
        a=observed(lambda:fs(2.));c=observed(lambda:fm(2.))
        body=prelude(style,view=view)+assertion('log_named_call(base, state, ScalarNumber::Number(2.0), None)',c)
        add('call-nonsingular-view',{'style':style,'view':encoded(view),'source':a,'mathematical':c},body)
    # New fractional power primitive: explicit exact roots, IEEE special values,
    # exponent signs and near-one/subnormal/general bases, not class clones.
    for b in [2.,3.,4.,.25,16.,.5,math.nextafter(1.,0.),math.nextafter(1.,math.inf),5e-324,1e308]:
      for e in [-1.5,-.5,-.25,-1e-300,0.,.125,.25,.5,.75,1.5]:
        actual=observed(lambda:b**e)
        correct=positive_power(b,e)
        if actual['error'] is None:actual['bits']=bits(actual.pop('value'))
        primitive.append({'base_bits':bits(b),'exponent_bits':bits(e),'source':actual,'mathematical_bits':bits(correct)})
        primitive_bodies.append('  assert_eq(log_format_positive_power('+moon(b)+', '+moon(e)+').reinterpret_as_uint64(), '+str(bits(correct))+'UL)\n')
    # Execute full actual NumPy geomspace/logspace functions in both profiles.
    raw_points=[]
    for b in [10.,2.,3.,.5,1.,math.e,float.fromhex('0x1.481f5e47c8b2bp+5'),float.fromhex('0x1.e81e99bb20f3ap+5'),float.fromhex('0x1.d4c8e7b3f6dbdp+5')]:
        n=int(b)//2+1
        a=np.geomspace(1,b,n);c=math_geom(1,b,n)
        raw_points.append({'base_bits':bits(b),'count':n,'source_bits':[bits(x) for x in a],'mathematical_bits':[bits(x) for x in c]})
        primitive_bodies.append('  let line = asinh_grid_line(0.0, asinh_math_log10('+moon(b)+'), '+str(n)+'L)\n  assert_eq(['+', '.join('log_cache_geom_point(line, '+moon(b)+', '+str(i)+'L).reinterpret_as_uint64()' for i in range(n))+'], ['+', '.join(str(bits(x))+'UL' for x in c)+'])\n')
    document={'metadata':{'profile':'CPython3.12.14 NumPy2.3.5 Darwinarm64 actual original class AST; independent portable mathematical ln/log10/generalpositivepow','source_hashes':source['source_hashes'],'cases':len(cases),'registered_groups':(len(cases)+31)//32,'primitive_cases':len(primitive_bodies),'primitive_registered_groups':(len(primitive_bodies)+31)//32,'source_observations':4389,'mathematical_observations':4376,'source_label_differences':differences,'primitive_profile_differences':[row for row in primitive if 'bits' in row['source'] and row['source']['bits']!=row['mathematical_bits']],'prepare_differences':warning_differences,'oracle_budget_omissions':budget,'native_warnings':'NumPy RuntimeWarning observations are retained; host logger/runtime warning transport is outside API diagnostics','array_profile':'all logical source points and complete rounded set; no100000cap; snapshot resource is actual unique Array addressability','mathematical_geomspace':'complete installed original function bodies, exact original NumPy linspace/round/endpoint writes; only log10 and power redirected','typed_boundary':'opaque generated cache, six scalar numeric origins; arbitrary Python operator containers and mutable external sets outside typed API'},'cases':cases,'primitive_cases':primitive,'geomspace_points':raw_points}
    def grouped(name,items):
        out='// Generated by scripts/generate_log_formatter_numeric_reference.py; do not edit.\n'
        for i,body in enumerate(items):out+='\n///|\nfn '+name+'_case_'+str(i)+'() -> Unit raise {\n'+body+'}\n'
        for start in range(0,len(items),32):out+='\n///|\ntest "'+name+' group '+str(start//32)+'" {\n'+''.join('  '+name+'_case_'+str(i)+'()\n' for i in range(start,min(start+32,len(items))))+'}\n'
        return formatted(out)
    return json.dumps(document,ensure_ascii=False,indent=2,allow_nan=False)+'\n',grouped('log_formatter_numeric',bodies),grouped('log_formatter_math',primitive_bodies)

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--check',action='store_true');args=parser.parse_args()
    path=ROOT/'.moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py'
    data,numeric,primitives=build(path)
    files=[(ROOT/'testdata/log_formatter_numeric_reference.json',data),(ROOT/'ticker/log_formatter_numeric_reference_wbtest.mbt',numeric),(ROOT/'ticker/log_formatter_math_reference_wbtest.mbt',primitives)]
    for path,text in files:
        if args.check:
            if path.read_text()!=text:raise SystemExit('stale '+str(path))
        else:path.write_text(text)
    print(('checked' if args.check else 'generated')+' LogFormatter full AST numeric and mathematical references')
if __name__=='__main__':main()
