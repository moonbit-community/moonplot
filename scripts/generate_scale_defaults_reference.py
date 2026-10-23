"""Execute original scale-default installers for the five current geometries.

The explicit install profile is narrower than complete mutable Python scale
objects. Full original class bodies, ticker constructors, API descriptors and
transform bases run; controlled setter sinks expose order and partial state.
"""
from pathlib import Path
import argparse,ast,copy,functools,hashlib,inspect,json,logging,math,sys,textwrap,types,warnings,weakref
import numpy as np
from formatter_reference_source import load_log_formatters
from generate_auto_date_reference import formatted
from generate_log_float_text_reference import moon as string_moon
from generate_scalar_formatter_numeric_reference import moon as numeric_moon,num,ncode
ROOT=Path(__file__).resolve().parents[1]
SCALE_SHA='4800482469b280454eb6e7a48f866ae7b146b27d1395644ffc09df0e91c9d7c1'
TRANSFORMS_SHA='109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8'
ARTIST_SHA='c55a81d86db60ab7b22fcd6e70401aa84558de5d1ba6e40a16c60f6f1f03be7a'
NAMES=('LinearScale','LogScale','SymmetricalLogScale','AsinhScale','LogitScale')

def moon(value):
    if isinstance(value,str):return string_moon(value)
    if isinstance(value,list):return '['+', '.join(moon(v) for v in value)+']'
    return numeric_moon(value)

def load_scale_defaults(path):
    """Return complete pinned scale/ticker namespace with a single class identity.

    Extra keys: _scale_artist_update_props, _scale_class_names, mscale,
    scale_host_profile. Axis fixtures and real Axis helper bodies are supplied
    by each caller. No setter or formatter algorithm is replaced here.
    """
    path=Path(path);ns=load_log_formatters(path)
    sources={}
    for name,expected in [('scale.py',SCALE_SHA),('transforms.py',TRANSFORMS_SHA),('artist.py',ARTIST_SHA)]:
        data=path.with_name(name).read_bytes()
        if hashlib.sha256(data).hexdigest()!=expected:raise ValueError('fixed source differs: '+name)
        sources[name]=data
    ns.update(functools=functools,_log=logging.getLogger('scale-defaults-reference'),logging=logging)
    names=('Locator','NullLocator','_Edge_integer','MaxNLocator','LogLocator','SymmetricalLogLocator','AsinhLocator','LogitLocator','AutoLocator','AutoMinorLocator','scale_range','LogitFormatter')
    for node in ast.parse(path.read_bytes()).body:
        if isinstance(node,(ast.ClassDef,ast.FunctionDef)) and node.name in names:
            exec(compile(ast.Module(body=[node],type_ignores=[]),str(path),'exec'),ns)
    tns=dict(np=np,DEBUG=False,weakref=weakref,functools=functools,textwrap=textwrap,math=math,_api=ns['_api'])
    transform_nodes=[n for n in ast.parse(sources['transforms.py']).body if isinstance(n,(ast.ClassDef,ast.FunctionDef)) and n.name in ('_make_str_method','TransformNode','Transform','AffineBase','Affine2DBase','IdentityTransform')]
    exec(compile(ast.Module(body=transform_nodes,type_ignores=[]),str(path.with_name('transforms.py')),'exec'),tns)
    ns.update(Transform=tns['Transform'],IdentityTransform=tns['IdentityTransform'],inspect=inspect,wraps=functools.wraps)
    names=('ScaleBase','_make_axis_parameter_optional','LinearScale','LogTransform','LogScale','SymmetricalLogTransform','SymmetricalLogScale','AsinhTransform','AsinhScale','LogitTransform','LogitScale')
    scale_nodes=[n for n in ast.parse(sources['scale.py']).body if isinstance(n,(ast.ClassDef,ast.FunctionDef)) and n.name in names]
    exec(compile(ast.Module(body=scale_nodes,type_ignores=[]),str(path.with_name('scale.py')),'exec'),ns)
    artist=next(n for n in ast.parse(sources['artist.py']).body if isinstance(n,ast.ClassDef) and n.name=='Artist')
    update_node=next(n for n in artist.body if isinstance(n,ast.FunctionDef) and n.name=='_update_props')
    helper_ns={}
    exec(compile(ast.Module(body=[update_node],type_ignores=[]),str(path.with_name('artist.py')),'exec'),helper_ns)
    ns['_scale_artist_update_props']=helper_ns['_update_props']
    ns['_scale_class_names']=NAMES
    ns['mscale']=types.SimpleNamespace(**{name:ns[name] for name in ('ScaleBase',)+NAMES})
    rc=ns['mpl'].rcParams
    for key in ('xtick.minor.visible','ytick.minor.visible'):
        rc.validate[key]=rc.validate['axes.formatter.useoffset'];rc[key]=False
    ns['source_hashes'].update({name:hashlib.sha256(data).hexdigest() for name,data in sources.items()})
    ns['scale_host_profile']={'source':'complete original five scales, constructors and required real transform bases; complete original ticker classes',
        'rc':'actual RcParams with real Bool validators; accepted Scalar empty-font-catalog profile',
        'axis':'controlled setter sinks or actual Axis bodies supplied separately; not a renderer emulator',
        'scope':'explicit typed geometry installation only; full named Scale objects/function/general Log/Asinh parameters and mutable auto table are outside this slice'}
    return ns


def _number(value):
    if isinstance(value,(int,np.integer)) and not isinstance(value,(bool,np.bool_)):return int(value)
    if isinstance(value,(float,np.floating)):return {'bits':int(np.float64(value).view(np.uint64))}
    if isinstance(value,(bool,np.bool_)):return bool(value)
    if isinstance(value,(tuple,list,np.ndarray)):return [_number(v) for v in value]
    return value

def ticker_snapshot(value):
    fields={
        'AutoLocator':('_nbins','_steps'), 'AutoMinorLocator':('ndivs',),
        'ScalarFormatter':('_useOffset','_usetex','_useMathText','_useLocale','_offset_threshold','_powerlimits'),
        'LogLocator':('_base','_subs','numticks'),
        'LogFormatterSciNotation':('_base','labelOnlyBase','minor_thresholds','_linthresh'),
        'SymmetricalLogLocator':('_base','_linthresh','_subs','numticks'),
        'AsinhLocator':('linear_width','numticks','symthresh','base','subs'),
        'LogitLocator':('_minor','_nbins','_steps'),
        'LogitFormatter':('_minor','_one_half','_use_overline','_minor_threshold','_minor_number')}
    name=type(value).__name__
    return {'class':name,'fields':{k:_number(getattr(value,k)) for k in fields.get(name,())}}


def generate(path):
    ns=load_scale_defaults(path);rc=ns['mpl'].rcParams;observations=[];cases=[];source_only=[]
    code='''// Complete original scale-default methods and actual ticker constructors.

///|
fn scale_defaults_number(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(),expected.reinterpret_as_uint64()) }
}
'''
    class AxisFixture:
        _update_props=ns['_scale_artist_update_props']
        def __init__(self,name='x',fail=None):self.axis_name=name;self.fail=fail;self.events=[];self.slots={};self.stale=False
        def put(self,slot,value):
            self.events.append(slot)
            if slot==self.fail:raise RuntimeError('controlled setter failure '+slot)
            self.slots[slot]=value;value.set_axis(self)
        def set_major_locator(self,v):return self.put('major_locator',v)
        def set_minor_locator(self,v):return self.put('minor_locator',v)
        def set_major_formatter(self,v):return self.put('major_formatter',v)
        def set_minor_formatter(self,v):return self.put('minor_formatter',v)
        def set(self,**kwargs):return self._update_props(kwargs,'unexpected {prop_name}')
        def pchanged(self):pass
    def observe(label,action):
        with warnings.catch_warnings(record=True) as caught:
            warnings.simplefilter('always')
            try:result={'value':action(),'source_error':None}
            except Exception as exc:result={'value':None,'source_error':type(exc).__name__,'message':str(exc)}
        result.update(label=label,runtime_warnings=[{'category':type(w.message).__name__,'message':str(w.message)} for w in caught]);observations.append(result);return result
    def add(label,body,records):
        nonlocal code
        i=len(cases);code+='\n///|\nfn scale_defaults_case_'+str(i)+'() -> Unit raise {\n'+body+'}\n';cases.append({'label':label,'observations':records})
    def prefix(config):
        return '''  let previous=@config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible(horizontal=false),horizontal=false)
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(previous.formatter_offset_threshold())
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
'''+''.join('  @config.'+name+'('+moon(value)+')\n' for name,value in [('set_classic_mode',config['classic']),('set_formatter_use_offset',config['offset']),('set_formatter_use_locale',config['locale']),('set_formatter_use_math_text',False),('set_text_usetex',False)])+'  @config.set_minor_ticks_visible('+moon(config['xvisible'])+')\n  @config.set_minor_ticks_visible('+moon(config['yvisible'])+',horizontal=false)\n  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int('+str(config['threshold'])+'))\n  @config.set_formatter_limits(['+', '.join('@bigint.BigInt::from_int('+str(x)+')' for x in config['limits'])+'])\n'
    def configure(config):
        for key,value in [('_internal.classic_mode',config['classic']),('xtick.minor.visible',config['xvisible']),('ytick.minor.visible',config['yvisible']),('axes.formatter.useoffset',config['offset']),('axes.formatter.use_locale',config['locale']),('axes.formatter.use_mathtext',False),('text.usetex',False),('axes.formatter.offset_threshold',config['threshold']),('axes.formatter.limits',config['limits'])]:rc[key]=value
    def source_scale(spec):
        return ns[spec['class']](**spec.get('kwargs',{}))
    def geometry(spec):
        k=spec['class'];args=spec.get('kwargs',{})
        if k=='LinearScale':return '@scale.Scale::Linear'
        if k=='LogScale':return '@scale.Scale::Log'
        if k=='SymmetricalLogScale':return '@scale.Scale::SymLog(linthresh='+moon(float(args['linthresh']))+',linscale='+moon(float(args['linscale']))+',base='+moon(float(args['base']))+')'
        if k=='AsinhScale':return '@scale.Scale::Asinh(linear_width='+moon(float(args['linear_width']))+')'
        return '@scale.Scale::Logit(clip='+moon(args['nonpositive']=='clip')+')'
    def scalar_int(value):return '@bigint.BigInt::from_string('+moon(str(value))+')'
    def raw_number(value):
        if value is None:return '@ticker.LogValue::NoneValue'
        if isinstance(value,bool):return '@ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean('+moon(value)+'))'
        if isinstance(value,str):return '@ticker.LogValue::Text('+moon(value)+')'
        if isinstance(value,int):return '@ticker.LogValue::Numeric(@ticker.ScalarNumber::Integer('+scalar_int(value)+'))'
        return '@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number('+moon(float(value))+'))'
    def budget(expr,value):
        if isinstance(value,str):return '  assert_eq('+expr+',@ticker.LogNumTicks::Text('+moon(value)+'))\n'
        return '  assert_eq('+expr+',@ticker.LogNumTicks::Integer('+scalar_int(value)+'))\n'
    def slot_assert(name,slot,obj):
        minor=slot.startswith('minor');isloc=slot.endswith('locator');kind=type(obj).__name__
        expr=name+('.minor_locator()' if minor else '.locator()')+'.unwrap()' if isloc else name+('.minor_named_formatter()' if minor else '.named_formatter()')+'.unwrap()'
        out='  {\n'
        if kind=='AutoLocator':
            out+='  let value='+expr+'.auto_locator().unwrap()\n  assert_eq(value.nbins(),'+('@ticker.MaxNBins::Auto' if obj._nbins=='auto' else '@ticker.MaxNBins::Count('+str(obj._nbins)+')')+')\n  assert_eq(value.steps().to_array(),'+moon([float(x) for x in obj._steps])+')\n'
        elif kind=='AutoMinorLocator':out+='  let value='+expr+'.auto_minor_locator().unwrap()\n  assert_true(value.ndivs() is None)\n'
        elif kind=='NullLocator':out+='  assert_true('+expr+'.null_locator() is Some(_))\n'
        elif kind=='ScalarFormatter':
            out+='  let value='+expr+'.scalar_formatter().unwrap()\n'
            for method,val in [('get_use_offset',obj.get_useOffset()),('get_use_locale',obj.get_useLocale()),('get_use_math_text',obj.get_useMathText()),('get_usetex',obj.get_usetex())]:out+='  assert_eq(value.'+method+'(),'+moon(bool(val))+')\n'
            out+='  assert_eq(value.offset_threshold(),'+scalar_int(obj._offset_threshold)+')\n  let limits=match value.power_limits() { @ticker.ScalarPowerLimits::Integers(values)=>values; _=>abort("integer limits") }\n  assert_eq(limits,['+', '.join(scalar_int(v) for v in obj._powerlimits)+'])\n'
        elif kind=='LogLocator':
            out+='  let value='+expr+'.log_locator().unwrap()\n  scale_defaults_number(value.base(),'+moon(float(obj._base))+')\n'+budget('value.numticks()',obj.numticks)
            if isinstance(obj._subs,str):out+='  let subs=match value.subs() { @ticker.LogSubs::Text(text)=>text; _=>abort("text subs") }\n  assert_eq(subs,'+moon(obj._subs)+')\n'
            else:out+='  let subs=match value.subs() { @ticker.LogSubs::Values(values)=>values; _=>abort("numeric subs") }\n  assert_eq(subs.to_array(),'+moon([float(x) for x in obj._subs])+')\n'
        elif kind=='LogFormatterSciNotation':
            out+='  let value='+expr+'.log_formatter_sci_notation().unwrap()\n  scale_defaults_number(value.base(),'+moon(float(obj._base))+')\n  assert_eq(value.label_only_base(),'+raw_number(obj.labelOnlyBase)+')\n  assert_eq(value.linthresh(),@ticker.LogValue::NoneValue)\n  let thresholds=match value.minor_thresholds() { Some(@ticker.LogMinorThresholds::Tuple(values))=>values; _=>abort("tuple") }\n'
            for i,v in enumerate(obj.minor_thresholds):out+='  assert_eq(thresholds.get('+str(i)+'),'+raw_number(v)+')\n'
        elif kind=='NullFormatter':out+='  assert_true('+expr+'.null_formatter() is Some(_))\n'
        elif kind=='SymmetricalLogLocator':
            out+='  let value='+expr+'.symlog_locator().unwrap()\n  scale_defaults_number(value.base(),'+moon(float(obj._base))+')\n  scale_defaults_number(value.linthresh(),'+moon(float(obj._linthresh))+')\n'+budget('value.numticks()',obj.numticks)+'  let subs=match value.subs() { @ticker.SymLogSubs::Values(values)=>values; _=>abort("values") }\n  assert_eq(subs.to_array(),'+moon([float(x) for x in obj._subs])+')\n'
        elif kind=='AsinhLocator':
            out+='  let value='+expr+'.asinh_locator().unwrap()\n'
            for method,v in [('linear_width',obj.linear_width),('symthresh',obj.symthresh),('base',obj.base)]:out+='  scale_defaults_number(value.'+method+'(),'+moon(float(v))+')\n'
            out+=budget('value.numticks().unwrap()',obj.numticks)
            if obj.subs is None:out+='  assert_true(value.subs() is None)\n'
            else:out+='  let subs=match value.subs() { Some(@ticker.AsinhSubs::Tuple(values))=>values; _=>abort("immutable tuple") }\n  assert_eq(subs.length(),'+str(len(obj.subs))+')\n  assert_eq(subs.values(),'+moon([float(x) for x in obj.subs])+')\n  assert_eq(subs,@ticker.asinh_default_minor_subs())\n'
        elif kind=='LogitLocator':
            out+='  let value='+expr+'.logit_locator().unwrap()\n  assert_eq(value.minor(),'+moon(obj.minor)+')\n  assert_eq(value.as_maxn_locator().nbins(),@ticker.MaxNBins::Auto)\n  assert_eq(value.as_maxn_locator().steps().to_array(),'+moon([float(x) for x in obj._steps])+')\n'
        elif kind=='LogitFormatter':
            out+='  let value='+expr+'.logit_formatter().unwrap()\n'
            for method,val in [('minor',obj._minor),('one_half',obj._one_half),('overline',obj._use_overline),('minor_threshold',obj._minor_threshold),('minor_number',obj._minor_number)]:out+='  assert_eq(value.'+method+'(),'+raw_number(val)+')\n'
        else:raise AssertionError(kind)
        return out+'  }\n'
    specs=[{'class':'LinearScale'},{'class':'LogScale'},
        {'class':'SymmetricalLogScale','kwargs':{'base':10.,'linthresh':1.,'linscale':1.}},
        {'class':'SymmetricalLogScale','kwargs':{'base':2.,'linthresh':2.,'linscale':.5}}]
    specs += [{'class':'AsinhScale','kwargs':{'linear_width':v}} for v in (.5,1.,3.,math.nan,math.inf)]
    specs += [{'class':'LogitScale','kwargs':{'nonpositive':v}} for v in ('mask','clip')]
    for spec in specs:
        for horizontal in (True,False):
            for visible in (True,False):
                for classic in (True,False):
                    config={'classic':classic,'xvisible':visible if horizontal else not visible,'yvisible':visible if not horizontal else not visible,'offset':not classic,'locale':classic,'threshold':2 if classic else 4,'limits':[-2,3] if classic else [-5,6]}
                    configure(config);obj=source_scale(spec);axis=AxisFixture('x' if horizontal else 'y');obj.set_default_locators_and_formatters(axis)
                    result=observe('complete default objects '+spec['class'],lambda axis=axis:{'events':list(axis.events),'slots':{k:ticker_snapshot(v) for k,v in axis.slots.items()}})
                    body=prefix(config)+'  let value=axis()\n  value.set_tick_layout(400.0,'+moon(horizontal)+')\n  value.set_scale('+geometry(spec)+')\n'
                    for slot,obj0 in axis.slots.items():body+=slot_assert('value',slot,obj0)
                    add(spec['class']+' explicit geometry defaults',body,[result])
    # Reinstallation refreshes ticker identity while leaving retained old objects.
    for spec in specs:
        config={'classic':False,'xvisible':False,'yvisible':False,'offset':True,'locale':False,'threshold':4,'limits':[-5,6]};configure(config);obj=source_scale(spec);axis=AxisFixture();obj.set_default_locators_and_formatters(axis);old=dict(axis.slots);obj.set_default_locators_and_formatters(axis)
        result=observe('same scale creates fresh four objects',lambda old=old,axis=axis:{k:old[k] is not v for k,v in axis.slots.items()})
        body=prefix(config)+'  let value=axis()\n  let geometry='+geometry(spec)+'\n  value.set_scale(geometry)\n  let major=value.named_formatter().unwrap()\n  let minor=value.minor_named_formatter().unwrap()\n  value.set_scale(geometry)\n  assert_true(!physical_equal(major,value.named_formatter().unwrap()))\n  assert_true(!physical_equal(minor,value.minor_named_formatter().unwrap()))\n'
        for slot,obj0 in axis.slots.items():body+=slot_assert('value',slot,obj0)
        add('same profile reinstalls '+spec['class'],body,[result])
    # The scale does not capture rc; reinstall sees current rc while old objects retain state.
    for spec in (specs[0],specs[1],specs[2],specs[5],specs[-1]):
        oldconfig={'classic':False,'xvisible':False,'yvisible':False,'offset':True,'locale':False,'threshold':4,'limits':[-5,6]}
        newconfig={'classic':True,'xvisible':True,'yvisible':True,'offset':False,'locale':True,'threshold':2,'limits':[-2,3]}
        configure(oldconfig);obj=source_scale(spec);axis=AxisFixture();obj.set_default_locators_and_formatters(axis);old=dict(axis.slots)
        before=observe('rc retained old formatter and locator',lambda old=old:{k:ticker_snapshot(v) for k,v in old.items()})
        configure(newconfig);obj.set_default_locators_and_formatters(axis)
        after=observe('same scale reads new rc at reinstall',lambda axis=axis,old=old:{'slots':{k:ticker_snapshot(v) for k,v in axis.slots.items()},'old':{k:ticker_snapshot(v) for k,v in old.items()}})
        body=prefix(oldconfig)+'  let value=axis()\n  let geometry='+geometry(spec)+'\n  value.set_scale(geometry)\n  let retained_major=value.named_formatter().unwrap()\n'
        body+='  @config.set_classic_mode(true)\n  @config.set_minor_ticks_visible(true)\n  @config.set_minor_ticks_visible(true,horizontal=false)\n  @config.set_formatter_use_offset(false)\n  @config.set_formatter_use_locale(true)\n  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))\n  @config.set_formatter_limits([@bigint.BigInt::from_int(-2),@bigint.BigInt::from_int(3)])\n  value.set_scale(geometry)\n  assert_true(!physical_equal(retained_major,value.named_formatter().unwrap()))\n'
        for slot,obj0 in axis.slots.items():body+=slot_assert('value',slot,obj0)
        if spec['class']=='LinearScale':body+='  let retained=retained_major.scalar_formatter().unwrap()\n  assert_true(retained.get_use_offset())\n  assert_true(!retained.get_use_locale())\n  assert_eq(retained.offset_threshold(),@bigint.BigInt::from_int(4))\n'
        elif spec['class']!='LogitScale':body+='  let retained=retained_major.log_formatter_sci_notation().unwrap()\n  let thresholds=match retained.minor_thresholds() { Some(@ticker.LogMinorThresholds::Tuple(values))=>values; _=>abort("tuple") }\n  assert_eq(thresholds.get(0),@ticker.LogValue::Numeric(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(1))))\n'
        add('install-time rc recapture '+spec['class'],body,[before,after])
    # Immutable tuple constructor/copy/reset and actual tuple numeric consumption.
    for values in ((),(2.,5.),(0.,),(math.nan,1.)):
        source=ns['AsinhLocator'](1.,subs=values);copied=copy.copy(source)
        identity=observe('Asinh tuple shallow identity',lambda source=source,copied=copied:source.subs is copied.subs)
        source.set_params(subs=())
        cleared=observe('Asinh empty tuple set_params resets None',lambda source=source:source.subs is None)
        body='  let owner='+moon(list(values))+'\n  let tuple=@ticker.AsinhSubsTuple::new(owner)\n  let locator=@ticker.AsinhLocator::new(1.0,subs=Some(@ticker.AsinhSubs::Tuple(tuple)))\n  let copied=locator.copy()\n  let copy_tuple=match copied.subs() { Some(@ticker.AsinhSubs::Tuple(value))=>value; _=>abort("tuple") }\n  assert_eq(copy_tuple,tuple)\n  let exported=tuple.values()\n  exported.clear()\n  assert_eq(tuple.length(),'+str(len(values))+')\n  owner.clear()\n  assert_eq(tuple.length(),'+str(len(values))+')\n  locator.set_params(subs=Some(@ticker.AsinhSubs::Tuple(@ticker.AsinhSubsTuple::new([]))))\n  assert_true(locator.subs() is None)\n  assert_eq(copy_tuple.length(),'+str(len(values))+')\n'
        add('immutable tuple alias and empty reset',body,[identity,cleared])
    for values in ((),(2.,5.),(0.,),(-1.,1.)):
        locator=ns['AsinhLocator'](1.,subs=values)
        result=observe('original tuple tick_values',lambda locator=locator:_number(locator.tick_values(-100.,100.)))
        if result['source_error']:raise AssertionError(result)
        expected=[float(np.array(v['bits'],dtype=np.uint64).view(np.float64)) if isinstance(v,dict) else float(v) for v in result['value']]
        body='  let locator=@ticker.AsinhLocator::new(1.0,subs=Some(@ticker.AsinhSubs::Tuple(@ticker.AsinhSubsTuple::new('+moon(list(values))+'))))\n  let values=locator.tick_values(-100.0,100.0)\n  let expected='+moon(expected)+'\n  assert_eq(values.length(),expected.length())\n  for index,value in values { scale_defaults_number(value,expected[index]) }\n'
        add('tuple numeric consumption',body,[result])
    # Controlled setter failures are original method ordering evidence, not
    # invented user callback support in the typed Axis public API.
    for spec in specs[:4]+[specs[5],specs[-1]]:
        for slot in ('major_locator','major_formatter','minor_locator','minor_formatter'):
            config={'classic':False,'xvisible':False,'yvisible':False,'offset':True,'locale':False,'threshold':4,'limits':[-5,6]};configure(config);obj=source_scale(spec);axis=AxisFixture(fail=slot)
            result=observe('controlled original setter failure',lambda obj=obj,axis=axis:obj.set_default_locators_and_formatters(axis))
            source_only.append({'profile':spec,'failed_slot':slot,'events':axis.events,'installed_slots':list(axis.slots),'observation':result})
    for first in range(0,len(cases),32):
        code+='\n///|\ntest "scale default parameters source group '+str(first//32)+'" {\n'+''.join('  scale_defaults_case_'+str(i)+'()\n' for i in range(first,min(first+32,len(cases))))+'}\n'
    document={'metadata':{'source_hashes':ns['source_hashes'],'host_profile':ns['scale_host_profile'],'source_observations':len(observations),'cases':len(cases),'registered_groups':(len(cases)+31)//32,'source_only_ordering':len(source_only),'tuple_profile':'immutable Double numeric tuple projection; shared base10 default handle; no mutable class dictionary API','boundary':'five existing typed geometries explicit install only; no constructor/clear/units/secondary lifecycle claim; native elementary source bits retained'},'cases':cases,'source_only_ordering':source_only}
    return json.dumps(document,indent=2,ensure_ascii=False,allow_nan=False)+'\n',formatted(code)


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('ticker',type=Path);p.add_argument('--check',action='store_true');a=p.parse_args()
    data,tests=generate(a.ticker)
    for path,content in [(ROOT/'testdata/scale_defaults_reference.json',data),(ROOT/'scene/axis/scale_defaults_reference_wbtest.mbt',tests)]:
        if a.check:
            if path.read_text()!=content:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(content)
    m=json.loads(data)['metadata'];print('scale default params:',m['source_observations'],'observations;',m['cases'],'cases;',m['registered_groups'],'groups;',m['source_only_ordering'],'ordering diagnostics')
if __name__=='__main__':main()
