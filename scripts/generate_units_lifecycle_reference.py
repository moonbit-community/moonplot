"""Pinned original Axis date/category units and typed range reference.

Source numeric, graph and presentation hosts are explicit; no port is an oracle.
"""
from pathlib import Path
import argparse,ast,collections,contextlib,copy,datetime as dt,functools,hashlib,itertools,json,logging,math,numbers,sys,types,urllib.request,warnings,weakref
from decimal import Decimal
import numpy as np
import dateutil.parser
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_autoscale_reference as actual
from generate_axis_initial_clear_reference import load as axis_load
from generate_scale_defaults_reference import moon
from generate_auto_date_reference import formatted
from generate_date_converter_reference import load_reference as date_load
P=ROOT/'.moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py'
UNIT_SOURCES={'units.py':'ecefa595cf24dc6a5da2d52cdad59c1068285071d7f98ee8d11edffb526f7b79','category.py':'52c67cadb003007f7a61fa630fe3750cb4dc4bf710c25b332084366516a25a6e'}
for name,expected in UNIT_SOURCES.items():
 path=ROOT/'.moonagent/checkpoints/D38-source'/name
 if not path.exists():
  raw=urllib.request.urlopen('https://raw.githubusercontent.com/matplotlib/matplotlib/v3.11.2/lib/matplotlib/'+name,timeout=30).read()
  if hashlib.sha256(raw).hexdigest()!=expected:raise ValueError('fixed units dependency differs: '+name)
  path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(raw)
 if hashlib.sha256(path.read_bytes()).hexdigest()!=expected:raise ValueError('fixed units dependency differs: '+name)
ns,Parent=axis_load(P)
for node in ast.parse(P.read_bytes()).body:
 if isinstance(node,ast.ClassDef)and node.name in['_Edge_integer','MultipleLocator']:
  exec(compile(ast.Module(body=[node],type_ignores=[]),str(P),'exec'),ns)
CB=P.with_name('cbook.py');cbtree=ast.parse(CB.read_bytes())
cbns=dict(np=np,math=math,collections=collections,contextlib=contextlib,functools=functools,itertools=itertools,sys=sys,weakref=weakref,_api=ns['_api'])
cnames={'_StrongRef','_UnhashDict','CallbackRegistry','_exception_printer','_weak_or_strong_ref','_unpack_to_numpy','_is_torch_array','_is_jax_array','_is_mlx_array','_is_tensorflow_array','_safe_first_finite','safe_first_element','is_scalar_or_string','Grouper','_OrderedSet'}
for node in cbtree.body:
 if isinstance(node,(ast.FunctionDef,ast.ClassDef))and node.name in cnames:exec(compile(ast.Module(body=[node],type_ignores=[]),str(CB),'exec'),cbns)
book=types.SimpleNamespace(**{n:cbns[n]for n in cnames})
# Actual units module, including Registry, AxisInfo and native-support test.
u=types.SimpleNamespace();ud=dict(np=np,ma=np.ma,Decimal=Decimal,Number=numbers.Number,cbook=book)
up=ROOT/'.moonagent/checkpoints/D38-source/units.py'
for node in ast.parse(up.read_bytes()).body:
 if not isinstance(node,(ast.Import,ast.ImportFrom,ast.Expr)):exec(compile(ast.Module(body=[node],type_ignores=[]),str(up),'exec'),ud)
u.__dict__.update({k:v for k,v in ud.items()if not k.startswith('__')})
# Recompile complete date classes under the real accepted ticker identity and
# real helpers/RcParams. The accepted fixed numeric epoch is a declared input.
dref=date_load(P.with_name('dates.py'))
for key,value in dref['mpl'].rcParams.items():ns['mpl'].rcParams._set(key,value)
dref.update(cbook=book,units=u,ticker=types.SimpleNamespace(Locator=ns['Locator'],Formatter=ns['Formatter'],MultipleLocator=ns['MultipleLocator']),Locator=ns['Locator'],mpl=ns['mpl'],_api=ns['_api'])
for key,value in [('timezone','UTC'),('date.converter','auto'),('date.interval_multiples',True),('date.epoch','1970-01-01T00:00:00')]:ns['mpl'].rcParams._set(key,value)
dref['_epoch']=None
for node in ast.parse(P.with_name('dates.py').read_bytes()).body:
 if isinstance(node,ast.FunctionDef)and node.name in['_get_tzinfo','get_epoch','set_epoch']:
  exec(compile(ast.Module(body=[node],type_ignores=[]),str(P.with_name('dates.py')),'exec'),dref)
date_names={'DateFormatter','ConciseDateFormatter','DateLocator','RRuleLocator','AutoDateLocator','YearLocator','MicrosecondLocator','AutoDateFormatter','DateConverter','ConciseDateConverter','_SwitchableDateConverter'}
for node in ast.parse(P.with_name('dates.py').read_bytes()).body:
 if isinstance(node,ast.ClassDef)and node.name in date_names:exec(compile(ast.Module(body=[node],type_ignores=[]),str(P.with_name('dates.py')),'exec'),dref)
for typ in[np.datetime64,dt.date,dt.datetime]:u.registry[typ]=dref['_SwitchableDateConverter']()
# Complete categorical classes and the original shared registry assignments.
cp=ROOT/'.moonagent/checkpoints/D38-source/category.py';cat=dict(np=np,OrderedDict=collections.OrderedDict,dateutil=dateutil,itertools=itertools,logging=logging,_api=ns['_api'],cbook=book,ticker=dref['ticker'],units=u)
for node in ast.parse(cp.read_bytes()).body:
 if not isinstance(node,(ast.Import,ast.ImportFrom,ast.Expr)):exec(compile(ast.Module(body=[node],type_ignores=[]),str(cp),'exec'),cat)
ns.update(munits=u)
axisnode=next(n for n in ast.parse(P.with_name('axis.py').read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='Axis')
methods=['update_units','_update_axisinfo','have_units','convert_units','get_converter','set_converter','_set_converter','set_units','get_units','_get_shared_axes','_get_shared_axis','_set_lim','limit_range_for_scale','_set_autoscale_on','_get_autoscale_on']
for node in axisnode.body:
 if isinstance(node,ast.FunctionDef)and node.name in methods:
  exec(compile(ast.Module(body=[copy.deepcopy(node)],type_ignores=[]),str(P.with_name('axis.py')),'exec'),ns);setattr(Parent,node.name,ns[node.name])
xnode=next(n for n in ast.parse(P.with_name('axis.py').read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='XAxis')
node=next(n for n in xnode.body if isinstance(n,ast.FunctionDef)and n.name=='set_default_intervals')
exec(compile(ast.Module(body=[node],type_ignores=[]),str(P.with_name('axis.py')),'exec'),ns)
original_default=ns['set_default_intervals']
transnode=next(n for n in ast.parse(P.with_name('transforms.py').read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='Bbox')
boxmethods={}
for node in transnode.body:
 if isinstance(node,ast.FunctionDef)and node.name in['mutatedx','mutatedy']:
  exec(compile(ast.Module(body=[node],type_ignores=[]),str(P.with_name('transforms.py')),'exec'),ns);boxmethods[node.name]=ns[node.name]
class Box:
 def __init__(self,points):self._points=np.array(points);self._points_orig=self._points.copy()
 intervalx=property(lambda s:s._points[:,0],lambda s,v:s._points.__setitem__((slice(None),0),v))
 intervaly=property(lambda s:s._points[:,1],lambda s,v:s._points.__setitem__((slice(None),1),v))
 mutatedx=boxmethods['mutatedx'];mutatedy=boxmethods['mutatedy']
class Host(actual.clear.Axes):
 # Complete original sharex/y are inherited. Storage/presentation are the same
 # declared unitless source host used by D36, with real shared Ticker identity.
 def __init__(self,figure,index,sharex=None):
  self.index=index;self.figure=figure;self.name='rectilinear';self.events=[]
  self._shared_axes=figure.groups;self._sharex=self._sharey=None;self._stale_viewlims={'x':False,'y':False}
  self.dataLim=Box([[math.inf,math.inf],[-math.inf,-math.inf]]);self.viewLim=Box([[0.,0.],[1.,1.]])
  self.callbacks=book.CallbackRegistry(exception_handler=None,signals=['xlim_changed','ylim_changed'])
  self.xaxis=Axis(self,'x');self.yaxis=Axis(self,'y');self._axis_map={'x':self.xaxis,'y':self.yaxis}
  if sharex is not None:self.sharex(sharex)
 def get_figure(self,**kwargs):return self.figure
class Axis(Parent):
 def __init__(self,host,which='x'):
  self.trace=[];self.__name__=which+'axis';self.axes=host;super().__init__(name=str(host.index)+'.'+which,which=which,axes=host)
  self.callbacks=book.CallbackRegistry(exception_handler=None,signals=['units']);self._converter_is_explicit=False
  def observe_unit():
   self.trace.append('units-callback');self.axes.figure.unit_events.append(self.axes.index)
  self.callbacks.connect('units',observe_unit)
 @property
 def view(self):return getattr(self.axes.viewLim,'interval'+self.axis_name)
 @view.setter
 def view(self,value):setattr(self.axes.viewLim,'interval'+self.axis_name,value)
 def set_default_intervals(self):self.trace.append('default_intervals');return original_default(self)
 def set_major_locator(self,v):self.trace.append('major.locator');return super().set_major_locator(v)
 def set_minor_locator(self,v):self.trace.append('minor.locator');return super().set_minor_locator(v)
 def set_major_formatter(self,v):self.trace.append('major.formatter');return super().set_major_formatter(v)
 def set_minor_formatter(self,v):self.trace.append('minor.formatter');return super().set_minor_formatter(v)
 def set_label_text(self,v):self.trace.append('label:'+v);return super().set_label_text(v)
 def convert_units(self,x):return ns['convert_units'](self,x)

def setup(shared=False):
 figure=actual.Figure();figure.unit_events=[];hosts=[Host(figure,0)]
 if shared:hosts.append(Host(figure,1,sharex=hosts[0]))
 axes=[h.xaxis for h in hosts]
 for a in axes:a.trace.clear()
 return axes

def state(a):
 c=a.get_converter();units=a.units
 return {'converter':type(c).__name__ if c else None,'explicit':a._converter_is_explicit,
 'unit':None if units is None else list(units._mapping.items())if hasattr(units,'_mapping')else str(units),
 'slots':[type(v).__name__ for v in[a.major.locator,a.minor.locator,a.major.formatter,a.minor.formatter]],
 'flags':[a.isDefault_majloc,a.isDefault_minloc,a.isDefault_majfmt,a.isDefault_minfmt],
 'locs':list(a.major.locator())if isinstance(a.major.locator,cat['StrCategoryLocator'])else None,
 'view':a.axes.viewLim.intervalx.tolist(),'trace':a.trace.copy()}


def load_units_source(ticker_path=P):
 if Path(ticker_path).resolve()!=P.resolve():raise ValueError('pinned source tree required')
 return ns,Axis,Host



def unit_snapshot(a):
 result=state(a);result.pop('trace')
 result['unit_kind']=None if a.units is None else'Category'if hasattr(a.units,'_mapping')else'Date'
 result['unit_seconds']=int(a.units.utcoffset(dt.datetime(1970,1,1)).total_seconds())if result['unit_kind']=='Date'else None
 values=[0.,1.,2.]
 formatter=a.major.formatter
 result['labels']=formatter.format_ticks(values)if isinstance(formatter,(cat['StrCategoryFormatter'],dref['DateFormatter'],dref['ConciseDateFormatter'],dref['AutoDateFormatter'],ns['FuncFormatter'],ns['NullFormatter']))else None
 result['offset']=formatter.get_offset()if result['labels']is not None else None
 result['roles']=['Category'if isinstance(v,(cat['StrCategoryLocator'],cat['StrCategoryFormatter']))else'Date'if isinstance(v,(dref['DateLocator'],dref['AutoDateFormatter'],dref['DateFormatter'],dref['ConciseDateFormatter']))else'Numeric'for v in[a.major.locator,a.minor.locator,a.major.formatter,a.minor.formatter]]
 result['interval_multiples']=a.major.locator.interval_multiples if isinstance(a.major.locator,dref['AutoDateLocator'])else None
 return result

def apply_unit(axes,op):
 a=axes[op.get('panel',0)];kind=op['kind']
 if kind=='category':return a.update_units(op['values'])
 if kind=='date':
  zone=None if op.get('zone')is None else dt.timezone(dt.timedelta(seconds=op['zone']))
  return a.update_units([dt.datetime(2024,1,1,tzinfo=zone)]if not op.get('empty')else[])
 if kind=='unit_zone':return a.set_units(None if op['zone']is None else dt.timezone(dt.timedelta(seconds=op['zone'])))
 if kind=='info':return a._update_axisinfo()
 if kind=='rc':
  ns['mpl'].rcParams._set('date.converter',op['mode']);ns['mpl'].rcParams._set('date.interval_multiples',op['multiple']);return
 if kind=='explicit':return a.set_converter(dref['DateConverter'](interval_multiples=op['multiple']))
 if kind=='scale':return a._set_scale('linear')
 raise ValueError('unknown units operation '+kind)

def observe_units(label,ops,*,mask=0,shared=False,fail_callback=None):
 ns['mpl'].rcParams._set('date.converter','auto');ns['mpl'].rcParams._set('date.interval_multiples',True);dref['_epoch']='1970-01-01T00:00:00'
 axes=setup(shared)
 custom=[]
 for bit,name,value in[(1,'set_major_locator',ns['FixedLocator']([99.])),(2,'set_major_formatter',ns['FuncFormatter'](lambda value,pos:'custom')),(4,'set_minor_locator',ns['FixedLocator']([.25,.75])),(8,'set_minor_formatter',ns['FuncFormatter'](lambda value,pos:'minor'))]:
  if mask&bit:getattr(axes[0],name)(value);custom.append((name,value))
 if fail_callback is not None:
  def poison():raise ValueError('units callback failure')
  axes[fail_callback].callbacks.connect('units',poison)
 stages=[]
 for op in ops:
  ns['external_warnings'].clear();axes[0].axes.figure.unit_events.clear()
  for a in axes:a.trace.clear()
  before=[unit_snapshot(a)for a in axes]
  try:ret=apply_unit(axes,op);error=None
  except Exception as exc:ret=None;error={'type':type(exc).__name__,'message':str(exc)}
  stages.append({'operation':op,'before':before,'after':[unit_snapshot(a)for a in axes],'result':ret,'error':error,
    'callbacks':[str(i)for i in axes[0].axes.figure.unit_events],
    'events':[a.trace.copy()for a in axes],'warnings':ns['external_warnings'].copy(),
    'custom_retained':[getattr(axes[0],{'set_major_locator':'major','set_minor_locator':'minor','set_major_formatter':'major','set_minor_formatter':'minor'}[name]).locator is value if name.endswith('locator')else getattr(axes[0],{'set_major_formatter':'major','set_minor_formatter':'minor'}[name]).formatter is value for name,value in custom],
    'shared_unit_identity':len(axes)==2 and axes[0].units is not None and axes[0].units is axes[1].units,
    'shared_ticker_identity':len(axes)==2 and axes[0].major is axes[1].major and axes[0].minor is axes[1].minor})
  if error:break
 return {'label':label,'mask':mask,'shared':shared,'fail_callback':fail_callback,'stages':stages}

def range_namespace(epoch):
 r=dict(dref);r['_epoch']=epoch;r['ticker']=types.SimpleNamespace(Locator=actual.ns['Locator'],Formatter=actual.ns['Formatter'],MultipleLocator=ns['MultipleLocator'])
 names={'_get_tzinfo','get_epoch','date2num','num2date','_dt64_to_ordinalf','_from_ordinalf'}
 classes={'DateFormatter','ConciseDateFormatter','DateLocator','RRuleLocator','AutoDateLocator','YearLocator','MicrosecondLocator','AutoDateFormatter'}
 for node in ast.parse(P.with_name('dates.py').read_bytes()).body:
  if isinstance(node,ast.FunctionDef)and node.name in names or isinstance(node,ast.ClassDef)and node.name in classes:
   exec(compile(ast.Module(body=[node],type_ignores=[]),str(P.with_name('dates.py')),'exec'),r)
 r['_from_ordinalf_np_vectorized']=np.vectorize(r['_from_ordinalf'],otypes='O')
 r.update(OrderedDict=collections.OrderedDict,units=u)
 for node in ast.parse(cp.read_bytes()).body:
  if isinstance(node,ast.ClassDef)and node.name in{'StrCategoryLocator','StrCategoryFormatter'}:exec(compile(ast.Module(body=[node],type_ignores=[]),str(cp),'exec'),r)
 return r

def source_locator(r,family):
 if family=='category':return r['StrCategoryLocator']({'first':0,'second':1})
 if family=='auto':return r['AutoDateLocator'](tz=dt.timezone.utc)
 if family=='base':return r['DateLocator'](tz=dt.timezone.utc)
 return r['MicrosecondLocator'](float(family.removeprefix('micro')),tz=dt.timezone.utc)

def collect_ranges():
 rows=[]
 for epoch in['1970-01-01T00:00:00','2000-01-01T00:00:00']:
  r=range_namespace(epoch)
  for family in['base','auto','micro0.5']:
   loc=source_locator(r,family)
   for bounds in[(math.inf,-math.inf),(10000.,10000.),(10000.,10000.+1e-7),(2.,0.)]:
    rows.append({'kind':'ns','epoch':epoch,'family':family,'bounds':list(bounds),'result':list(loc.nonsingular(*bounds))})
   for bounds in[(10000.,10000.),(10000.,10000.+1e-7)]:
    rows.append({'kind':'view','epoch':epoch,'family':family,'bounds':list(bounds),'result':list(loc.view_limits(*bounds))})
 r=range_namespace('1970-01-01T00:00:00');loc=source_locator(r,'category');fmt=r['StrCategoryFormatter'](loc._units)
 for bounds in[(math.inf,-math.inf),(0.,0.),(4.,4.),(2.,0.)]:
  for method in['nonsingular','view_limits']:
   rows.append({'kind':'ns'if method=='nonsingular'else'view','epoch':'1970-01-01T00:00:00','family':'category','bounds':list(bounds),'result':list(getattr(loc,method)(*bounds))})
 rows.append({'kind':'category_ticks','result':loc.tick_values(math.nan,math.inf)})
 rows.append({'kind':'category_labels','values':[0.,1.,2.,-.5,.5,1.5],'result':fmt.format_ticks([0.,1.,2.,-.5,.5,1.5])})
 loc._units['third']=2
 rows.append({'kind':'category_live_ticks','result':loc()})
 rows.append({'kind':'category_live_labels','values':[0.,1.,2.],'result':fmt.format_ticks([0.,1.,2.])})
 for family in['category','auto','base','micro0.5']:
  for label,bounds in[('empty',None),('point0',(0.,0.)),('point10000',(10000.,10000.)),('narrow',(10000.,10000.+1e-7))]:
   f,panels=actual.setup(data=False,view=(0.,1.));a=panels[0];a.xaxis.set_major_locator(source_locator(r,family))
   if bounds is not None:a.dataLim.intervalx=np.array(bounds)
   a.autoscale_view(scaley=False)
   rows.append({'kind':'autoscale','epoch':'1970-01-01T00:00:00','family':family,'label':label,'bounds':None if bounds is None else list(bounds),'initial':[0.,1.],'result':list(a.xaxis.view)})
 for family in['micro0.1','micro0.01']:
  f,panels=actual.setup(data=False,view=(0.,1.));a=panels[0];a.xaxis.set_major_locator(source_locator(r,family));a.dataLim.intervalx=np.array([10000.,10000.]);a.autoscale_view(scaley=False)
  rows.append({'kind':'autoscale','epoch':'1970-01-01T00:00:00','family':family,'label':'point10000','bounds':[10000.,10000.],'initial':[0.,1.],'result':list(a.xaxis.view)})
 f,panels=actual.setup(data=False,view=(100.,200.));a=panels[0];a.xaxis.set_major_locator(source_locator(r,'auto'));a.autoscale_view(scaley=False)
 rows.append({'kind':'autoscale','epoch':'1970-01-01T00:00:00','family':'auto','label':'empty mutated','bounds':None,'initial':[100.,200.],'result':list(a.xaxis.view)})
 return rows

def collect():
 cases=[]
 for shared in[False,True]:
  for mask in[0,1,2,4,8,15]:
   cases.append(observe_units('category first/repeat mask '+str(mask)+' shared '+str(shared),[{'kind':'category','values':['b','a','b']},{'kind':'category','values':['c','a'],'panel':1 if shared else 0}],mask=mask,shared=shared))
 for zone in[None,0,10800]:
  cases.append(observe_units('date first/rc-repeat/new timezone '+str(zone),[{'kind':'date','zone':zone},{'kind':'rc','mode':'concise','multiple':False},{'kind':'date','zone':zone},{'kind':'unit_zone','zone':3600}]))
 cases.append(observe_units('date shared preserves explicit formatter',[{'kind':'date','zone':0},{'kind':'date','zone':10800,'panel':1}],mask=2,shared=True))
 for aware in[False,True]:
  cases.append(observe_units('explicit DateConverter initial '+str(aware),[{'kind':'explicit','multiple':False},{'kind':'date','zone':0 if aware else None}]))
 for kind in['category','date']:
  op={'kind':kind,'values':[],'empty':True}
  cases.append(observe_units('empty homogeneous sequence '+kind,[op]))
 cases.append(observe_units('same converter after numeric scale keeps numeric defaults',[{'kind':'category','values':['a']},{'kind':'scale'},{'kind':'category','values':['b']}]))
 for fail in[0,1]:cases.append(observe_units('shared callback partial '+str(fail),[{'kind':'category','values':['a']}],shared=True,fail_callback=fail))
 for i,case in enumerate(cases):case['id']=i
 ranges=collect_ranges()
 return {'source_hashes':{**ns['source_hashes'],'units.py':UNIT_SOURCES['units.py'],'category.py':UNIT_SOURCES['category.py'],'dates.py':hashlib.sha256(P.with_name('dates.py').read_bytes()).hexdigest()},
  'numpy_binary_sha256':hashlib.sha256(Path(np._core._multiarray_umath.__file__).read_bytes()).hexdigest(),
  'counts':{'unit_cases':len(cases),'unit_stages':sum(len(c['stages'])for c in cases),'range_cases':len(ranges),'cases':len(cases)+len(ranges),'registered_groups':math.ceil((len(cases)+len(ranges))/32)},'unit_cases':cases,'range_cases':ranges,
  'scope':'Complete original Axis units and real registry/date/category/callback source; actual original sharex creates shared Ticker holders. Unit Axis presentation/Bbox storage and units-event observer are explicit hosts. Range corpus executes original locator policies and complete original autoscale+final-limit bodies. Moon tests separate Axis unit graph and candidate/local-finalization profiles; no arbitrary Python converter or full artist-recache claim.'}

HEADER='''// Generated from pinned original units and typed-locator source; do not edit.

///|
fn units_ref_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn units_ref_pair(actual : (Double, Double), expected : Array[Double]) -> Unit raise {
  units_ref_double(actual.0, expected[0])
  units_ref_double(actual.1, expected[1])
}

///|
fn units_ref_roles(value : Axis) -> Array[String] {
  [value.tickers.major_locator_kind, value.tickers.minor_locator_kind,
   value.tickers.major_formatter_kind, value.tickers.minor_formatter_kind]
  .map(kind => match kind { Numeric => "Numeric"; Date => "Date"; Category => "Category" })
}

///|
fn units_ref_labels(value : Axis) -> Array[String] raise @core.DataError {
  match value.tickers.major_formatter_kind {
    Date => value.tickers.date_formatter.unwrap().format_values([0.0, 1.0, 2.0])
    Category => value.tickers.category_formatter_units.unwrap().format_values([0.0, 1.0, 2.0])
    Numeric => value.tickers.named_formatter.unwrap().format_ticks([0.0, 1.0, 2.0])
  }
}

///|
fn units_ref_offset(value : Axis) -> String {
  match value.tickers.major_formatter_kind {
    Date => value.tickers.date_formatter.unwrap().offset_label([0.0, 1.0, 2.0])
    _ => ""
  }
}
'''

def zone_moon(seconds):return '@date.fixed_timezone_seconds('+str(seconds)+')'
def date_input_moon(op):
 if op.get('empty'):return '[]'
 if op.get('zone')is None:return '[@date.RRuleDateTime::naive(@date.datetime(2024, 1, 1))]'
 seconds=op['zone']
 return '[@date.RRuleDateTime::aware(@date.datetime(2024, 1, 1, offset_seconds='+str(seconds)+'))]'
def unit_action_moon(op):
 value='axes['+str(op.get('panel',0))+']';kind=op['kind']
 if kind=='category':return value+'.update_category_units('+moon(op['values'])+')'
 if kind=='date':return value+'.update_date_units('+date_input_moon(op)+')'
 if kind=='unit_zone':return value+'.set_unit_tag('+('None'if op['zone']is None else'Some(AxisUnitTag::Date('+zone_moon(op['zone'])+'))')+')'
 if kind=='info':return value+'.update_unit_axisinfo()'
 if kind=='explicit':return value+'.set_explicit_date_converter(@date.DateConverter::new(interval_multiples='+moon(op['multiple'])+'))'
 if kind=='scale':return value+'.set_scale(@scale.linear_scale())'
 if kind=='rc':return '@config.set_date_converter('+moon(op['mode'])+')\n@config.set_date_interval_multiples('+moon(op['multiple'])+')'
 raise ValueError(kind)

def assert_unit_snapshot(source,i):
 v='axes['+str(i)+']';out=[]
 kind={'StrCategoryConverter':'category','_SwitchableDateConverter':'default_date','DateConverter':'explicit_date',None:None}[source['converter']]
 out += ['assert_eq('+v+'.unit_converter_kind(), '+('None'if kind is None else'Some('+moon(kind)+')')+')',
         'assert_eq('+v+'.unit_converter_explicit(), '+moon(source['explicit'])+')',
         'assert_eq(units_ref_roles('+v+'), '+moon(source['roles'])+')',
         'assert_eq(['+v+'.is_default_locator(), '+v+'.is_default_locator(minor=true), '+v+'.is_default_formatter(), '+v+'.is_default_formatter(minor=true)], '+moon(source['flags'])+')',
         'units_ref_pair(('+v+'.stored_view_limits().lower(), '+v+'.stored_view_limits().upper()), '+moon(source['view'])+')']
 if source['unit_kind']is None:out.append('assert_true('+v+'.unit_tag() is None)')
 elif source['unit_kind']=='Category':
  out += ['assert_true('+v+'.unit_tag() is Some(Category(_)))','assert_eq('+v+'.get_category_units().unwrap().labels(), '+moon([x[0]for x in source['unit']])+')']
 else:
  out += ['match '+v+'.unit_tag() { Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), '+str(source['unit_seconds'])+'); _ => fail("expected date unit") }']
 if source['locs']is not None:out.append('assert_eq('+v+'.tick_values_checked(@core.limits(0.0, 2.0)), '+moon([float(x)for x in source['locs']])+')')
 if source['labels']is not None:
  out.append('assert_eq(units_ref_labels('+v+'), '+moon(source['labels'])+')')
  out.append('assert_eq(units_ref_offset('+v+'), '+moon(source['offset'])+')')
 if source['interval_multiples']is not None:out.append('assert_eq('+v+'.auto_date_locator().unwrap().interval_multiples(), '+moon(source['interval_multiples'])+')')
 return out

def render_unit(case):
 out=['///|','fn units_source_case_'+str(case['id'])+'() -> Unit raise {',
      'let old_mode = @config.date_converter()','let old_multiple = @config.date_interval_multiples()',
      'defer { @config.set_date_converter(old_mode); @config.set_date_interval_multiples(old_multiple) }',
      '@config.set_date_converter("auto")','@config.set_date_interval_multiples(true)',
      'let axes = '+('[axis(), axis()]'if case['shared']else'[axis()]')]
 if case['shared']:
  out += ['axes[1].share_numeric_tickers(axes[0])','for value in axes { value.bind_unit_group(() => [axes[1], axes[0]]) }']
 mask=case['mask']
 if mask&1:out += ['let custom_locator = @ticker.FixedLocator::new([99.0])','axes[0].set_locator(custom_locator.as_locator())']
 if mask&2:out += ['let custom_formatter = @ticker.FuncFormatter::new(fn(_, _) { "custom" }).as_base_formatter()','axes[0].set_named_formatter(custom_formatter)']
 if mask&4:out += ['let custom_minor_locator = @ticker.FixedLocator::new([0.25, 0.75])','axes[0].set_minor_locator(custom_minor_locator.as_minor_locator())']
 if mask&8:out += ['let custom_minor_formatter = @ticker.FuncFormatter::new(fn(_, _) { "minor" }).as_base_formatter()','axes[0].set_minor_named_formatter(custom_minor_formatter)']
 out += ['let callbacks : Array[String] = []']
 for i in range(2 if case['shared']else 1):
  poison=case['fail_callback']==i
  out += ['axes['+str(i)+'].bind_units_changed('+('fn() -> Unit raise @core.DataError {'if poison else'() => {'),
          'callbacks.push('+moon(str(i))+')']
  if poison:out += ['raise @core.DataError::InvalidTicks(message="units callback failure")']
  out += ['})']
 for stage in case['stages']:
  op=stage['operation'];expr=unit_action_moon(op);result=stage['result']
  out += ['callbacks.clear()']
  if stage['error']:
   failure_call='ignore('+expr+')'if op['kind']in['category','date']else expr
   out += ['let failed = try { '+failure_call+'; false } catch { @core.DataError::InvalidTicks(message~) => message == '+moon(stage['error']['message'])+'; _ => false }','assert_true(failed)']
  elif isinstance(result,bool):out += ['assert_eq('+expr+', '+moon(result)+')']
  else:out += [expr]
  for i,snapshot in enumerate(stage['after']):out += assert_unit_snapshot(snapshot,i)
  out += ['assert_eq(callbacks, '+moon(stage['callbacks'])+')']
  if stage['shared_unit_identity']:out += ['assert_true(physical_equal(axes[0].get_category_units().unwrap(), axes[1].get_category_units().unwrap()))']if stage['after'][0]['unit_kind']=='Category'else[]
  if stage['shared_ticker_identity']:out += ['assert_true(physical_equal(axes[0].tickers, axes[1].tickers))']
  if mask&2:out += ['assert_true(physical_equal(axes[0].named_formatter().unwrap(), custom_formatter))']
  if mask&8:out += ['assert_true(physical_equal(axes[0].minor_named_formatter().unwrap(), custom_minor_formatter))']
 out+=['}'];return '\n'.join(out)

def locator_moon(family):
 if family=='auto':return '@date.AutoDateLocator::new(tz="UTC").as_locator()'
 if family=='base':return '@date.date_locator(tz="UTC")'
 return '@date.MicrosecondLocator::new(interval='+moon(float(family.removeprefix('micro')))+', tz="UTC").as_locator()'

def render_range(case,index):
 out=['///|','fn units_source_case_'+str(index)+'() -> Unit raise {']
 family=case.get('family','category');epoch=case.get('epoch','1970-01-01T00:00:00')
 out += ['let old_epoch = @config.date_epoch()','defer @config.set_date_epoch(old_epoch)','@config.set_date_epoch('+moon(epoch)+')','let value = axis()']
 if family=='category':
  out += ['let units = CategoryUnits::new(["first", "second"])','value.tickers.major_locator_kind = Category','value.tickers.major_formatter_kind = Category',
          'value.tickers.category_locator_units = Some(units)','value.tickers.category_formatter_units = Some(units)','value.tickers.locator = None']
 else:
  out += ['value.tickers.major_locator_kind = Date','value.tickers.date_locator = Some('+locator_moon(family)+')',
          'value.tickers.automatic_date_locator = None','value.tickers.locator = None']
 kind=case['kind']
 if kind=='ns':out += ['units_ref_pair(value.locator_nonsingular('+moon(case['bounds'][0])+', '+moon(case['bounds'][1])+'), '+moon(case['result'])+')']
 elif kind=='view':out += ['let limits = value.locator_view_limits_checked('+moon(case['bounds'][0])+', '+moon(case['bounds'][1])+')','units_ref_pair((limits.lower(), limits.upper()), '+moon(case['result'])+')']
 elif kind=='autoscale':
  out += ['value.stored_view = @core.limits('+moon(case['initial'][0])+', '+moon(case['initial'][1])+')','value.set_autoscale_on(true)','value.bind_minpos(() => 0.001)']
  endpoints=case['bounds']if case['bounds']is not None else[math.inf,-math.inf]
  out += ['if value.autoscale_bounds_checked('+moon(endpoints)+', margin=0.05, stickies=[], tight=false, data_minpos=Some(() => [1.0 / 0.0])) is Some(candidate) {',
          'ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))','}',
          'units_ref_pair((value.stored_view_limits().lower(), value.stored_view_limits().upper()), '+moon(case['result'])+')']
 elif kind=='category_ticks':out += ['assert_eq(value.tick_values_checked(@core.limits(0.0 / 0.0, 1.0 / 0.0)), '+moon([float(v)for v in case['result']])+')']
 elif kind=='category_labels':out += ['assert_eq(units.format_values('+moon(case['values'])+'), '+moon(case['result'])+')']
 elif kind=='category_live_ticks':out += ['ignore(units.encode(["third"]))','assert_eq(value.tick_values_checked(@core.limits(-1.0, 3.0)), '+moon([float(v)for v in case['result']])+')']
 elif kind=='category_live_labels':out += ['ignore(units.encode(["third"]))','assert_eq(units.format_values('+moon(case['values'])+'), '+moon(case['result'])+')']
 out += ['}'];return '\n'.join(out)

def render(payload):
 cases=payload['unit_cases'];ranges=payload['range_cases'];chunks=[HEADER]+[render_unit(c)for c in cases]
 isolated={len(cases)+i for i,c in enumerate(ranges)if c.get('epoch','1970-01-01T00:00:00')!='1970-01-01T00:00:00'}
 chunks += [render_range(c,len(cases)+i)for i,c in enumerate(ranges)if len(cases)+i not in isolated]
 labels=[c['label']for c in cases]+[c.get('family','category')+'/'+c['kind']+'/'+c.get('label',str(i))for i,c in enumerate(ranges)]
 for start in range(0,len(labels),32):
  calls=['units_source_case_'+str(i)+'() catch { error => fail('+moon('units source case '+str(i)+' ['+labels[i]+']: ')+' + error.to_string()) }'for i in range(start,min(start+32,len(labels)))if i not in isolated]
  chunks.append('///|\ntest "original units lifecycle group '+str(start//32)+'" {\n'+'\n'.join(calls)+'\n}')
 return formatted('\n\n'.join(chunks)+'\n')


def render_epoch(payload):
 # The date epoch is intentionally a process/package singleton. The established
 # epoch_2000 test driver selects it once before invoking this helper. All18
 # source rows retain their original IDs/values and use public object APIs.
 chunks=['// Generated by scripts/generate_units_lifecycle_reference.py; do not edit.\n\n///|\nfn units_epoch_ref_double(actual : Double, expected : Double) -> Unit raise {\n  if expected.is_nan() { assert_true(actual.is_nan()) }\n  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }\n}\n\n///|\nfn units_epoch_ref_pair(actual : (Double, Double), expected : Array[Double]) -> Unit raise {\n  units_epoch_ref_double(actual.0, expected[0])\n  units_epoch_ref_double(actual.1, expected[1])\n}\n']
 calls=[]
 for offset,case in enumerate(payload['range_cases']):
  if case.get('epoch','1970-01-01T00:00:00')=='1970-01-01T00:00:00':continue
  if case['epoch']!='2000-01-01T00:00:00':raise ValueError('missing isolated epoch driver')
  index=len(payload['unit_cases'])+offset
  out=['///|','fn units_epoch_source_case_'+str(index)+'() -> Unit raise {','let locator = '+locator_moon(case['family'])]
  if case['kind']=='ns':
   out+=['units_epoch_ref_pair(locator.nonsingular('+moon(case['bounds'][0])+', '+moon(case['bounds'][1])+'), '+moon(case['result'])+')']
  elif case['kind']=='view':
   out+=['let value = @axis.axis()','value.set_date_locator(locator)','value.request_autoscale()',
         'let result = value.view_limits_checked(@core.limits('+moon(case['bounds'][0])+', '+moon(case['bounds'][1])+'))',
         'units_epoch_ref_pair((result.lower(), result.upper()), '+moon(case['result'])+')']
  else:raise ValueError('unexpected isolated query kind')
  out+=['}'];chunks.append('\n'.join(out))
  label='units source case '+str(index)+' ['+case['family']+'/'+case['kind']+'/epoch2000]: '
  calls.append('units_epoch_source_case_'+str(index)+'() catch { error => fail('+moon(label)+' + error.to_string()) }')
 chunks.append('///|\nfn verify_units_lifecycle_epoch_reference() -> Unit raise {\nassert_eq(@date.get_epoch(), "2000-01-01T00:00:00")\n'+'\n'.join(calls)+'\n}')
 return formatted('\n\n'.join(chunks)+'\n')

def main():
 ap=argparse.ArgumentParser();ap.add_argument('ticker',nargs='?',type=Path,default=P);ap.add_argument('--check',action='store_true');args=ap.parse_args();load_units_source(args.ticker)
 payload=collect();code=render(payload);outputs={ROOT/'testdata/units_lifecycle_reference.json':json.dumps(actual.json_safe(payload),ensure_ascii=False,indent=2,allow_nan=False)+'\n',ROOT/'scene/axis/units_lifecycle_reference_wbtest.mbt':code,ROOT/'tests/integration/epoch_2000/units_lifecycle_reference_test.mbt':render_epoch(payload)}
 for path,content in outputs.items():
  if args.check:
   if not path.exists()or path.read_text()!=content:raise SystemExit('generated units reference differs: '+str(path))
  else:path.write_text(content)
 print(json.dumps({'check':args.check,**payload['counts'],'json_sha256':hashlib.sha256(outputs[ROOT/'testdata/units_lifecycle_reference.json'].encode()).hexdigest()}))
if __name__=='__main__':main()
