"""Generate pinned original Line unit-recache observations and typed Scene fixtures.

The complete original methods are executed under the declared short/default-style
Line and numeric Path storage host. No port algorithm is used as an oracle.
"""
from pathlib import Path
import argparse,ast,copy,datetime as dt,functools,hashlib,json,math,sys,types,urllib.request
import numpy as np
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_units_lifecycle_reference as ref
P=ref.P
LINES_SHA='e928511cec1f9ce19455008c1863d337b0dbd1c71ac2b8d40224c8d5c069e05c'
LINES_URL='https://raw.githubusercontent.com/matplotlib/matplotlib/v3.11.2/lib/matplotlib/lines.py'
L=ROOT/'.moonagent/checkpoints/D39-source/lines.py'
if not L.exists():
 raw=urllib.request.urlopen(LINES_URL,timeout=30).read()
 if hashlib.sha256(raw).hexdigest()!=LINES_SHA:raise ValueError('fixed Line2D source differs')
 L.parent.mkdir(parents=True,exist_ok=True);L.write_bytes(raw)
if hashlib.sha256(L.read_bytes()).hexdigest()!=LINES_SHA:raise ValueError('fixed Line2D source differs')
ns,UnitAxis,UnitsHost=ref.load_units_source()

ltree=ast.parse(L.read_bytes());line=next(n for n in ltree.body if isinstance(n,ast.ClassDef)and n.name=='Line2D')
class PathStorage:
 def __init__(self,vertices,_interpolation_steps=1):self.vertices=np.asarray(vertices);self._interpolation_steps=_interpolation_steps
lns={'np':np,'copy':copy,'Path':PathStorage}
cbtree=ast.parse(P.with_name('cbook.py').read_bytes())
node=next(n for n in cbtree.body if isinstance(n,ast.FunctionDef)and n.name=='_to_unmasked_float_array')
exec(compile(ast.Module(body=[node],type_ignores=[]),str(P.with_name('cbook.py')),'exec'),lns)
names={'set_data','set_xdata','set_ydata','get_data','get_xdata','get_ydata','get_xydata','get_path','recache','recache_always'}
methods={}
for n in line.body:
 if isinstance(n,ast.FunctionDef)and n.name in names:
  exec(compile(ast.Module(body=[copy.deepcopy(n)],type_ignores=[]),str(L),'exec'),lns);methods[n.name]=lns[n.name]
artist=next(n for n in ast.parse(P.with_name('artist.py').read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='Artist')
for n in artist.body:
 if isinstance(n,ast.FunctionDef)and n.name in{'convert_xunits','convert_yunits'}:
  exec(compile(ast.Module(body=[copy.deepcopy(n)],type_ignores=[]),str(P.with_name('artist.py')),'exec'),lns);methods[n.name]=lns[n.name]
class Line:
 _subslice_optim_min_size=1000
 def __init__(self,axes,x,y,name):
  self.axes=axes;self.name=name;self.stale=False;self._x=self._y=self._xy=None;self._path=None
  self._transformed_path=None;self._drawstyle='default';self._markevery=None;self._invalidx=self._invalidy=True
  self.set_data(x,y)
 def get_transform(self):return self.axes.transData
 def get_clip_on(self):return True
 def get_visible(self):return True
 def _get_in_autoscale(self):return True
for name,method in methods.items():setattr(Line,name,method)
original_recache=Line.recache
original_xconv=Line.convert_xunits;original_yconv=Line.convert_yunits

def traced_recache(self,always=False):
 self.axes.events.append(['recache.begin',self.name,always])
 try:result=original_recache(self,always=always)
 except Exception as exc:self.axes.events.append(['recache.error',self.name,type(exc).__name__]);raise
 self.axes.events.append(['recache.end',self.name]);return result
Line.recache=traced_recache

def traced_x(self,value):self.axes.events.append(['convert.x',self.name]);return original_xconv(self,value)
def traced_y(self,value):self.axes.events.append(['convert.y',self.name]);return original_yconv(self,value)
Line.convert_xunits=traced_x;Line.convert_yunits=traced_y

# Complete Bbox algorithms retained, with only numeric storage/Path capability.
bbox=next(n for n in ast.parse(P.with_name('transforms.py').read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='Bbox')
bns={'np':np,'Path':PathStorage};bboxmethods={}
for n in bbox.body:
 if isinstance(n,ast.FunctionDef)and n.name in{'update_from_path','update_from_data_xy','set_points','ignore','mutatedx','mutatedy'}:
  exec(compile(ast.Module(body=[copy.deepcopy(n)],type_ignores=[]),str(P.with_name('transforms.py')),'exec'),bns);bboxmethods[n.name]=bns[n.name]
class DataBox:
 def __init__(self):self._points=np.array([[math.inf,math.inf],[-math.inf,-math.inf]]);self._points_orig=self._points.copy();self._minpos=np.array([math.inf,math.inf]);self._ignore=False
 def invalidate(self):pass
 intervalx=property(lambda s:s._points[:,0]);intervaly=property(lambda s:s._points[:,1])
 minposx=property(lambda s:s._minpos[0]);minposy=property(lambda s:s._minpos[1])
 def get_points(self):return self._points
 @classmethod
 def null(cls):return cls()
for name,method in bboxmethods.items():setattr(DataBox,name,method)
base=next(n for n in ast.parse((P.parent/'axes/_base.py').read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='_AxesBase')
base_ns=dict(ns,functools=functools,mlines=types.SimpleNamespace(Line2D=Line),mtransforms=types.SimpleNamespace(Bbox=DataBox))
# Only Line instances enter this typed profile; styling, other artist classes
# and nonlinear paths are deliberately outside the declared source host.
base_methods={}
for n in base.body:
 if isinstance(n,ast.FunctionDef)and n.name in{'_unit_change_handler','_update_line_limits','relim','_request_autoscale_view'}:
  exec(compile(ast.Module(body=[copy.deepcopy(n)],type_ignores=[]),str(P.parent/'axes/_base.py'),'exec'),base_ns);base_methods[n.name]=base_ns[n.name]
class DataTransform:
 is_affine=True
 def contains_branch_separately(self,other):return True,True
class Axes(UnitsHost):
 def __init__(self,figure,index,sharex=None):
  super().__init__(figure,index,sharex)
  self._axis_names=['x','y']
  self.dataLim=DataBox();self._children=[];self.transData=DataTransform();self.ignore_existing_data_limits=True;self._tight=None
  for name,axis in self._axis_map.items():axis.callbacks.connect('units',self._unit_change_handler(name))
 @property
 def lines(self):return self._children
 def get_xscale(self):return self.xaxis.get_scale()
for name,method in base_methods.items():setattr(Axes,name,method)
original_relim=Axes.relim;original_request=Axes._request_autoscale_view

def relim(self,visible_only=False):self.events.append(['relim.begin']);r=original_relim(self,visible_only=visible_only);self.events.append(['relim.end']);return r
def request(self,axis='all',tight=None):self.events.append(['request',axis]);return original_request(self,axis=axis,tight=tight)
Axes.relim=relim;Axes._request_autoscale_view=request


def setup(*,xycategory=False):
 f=ref.actual.Figure();f.unit_events=[];a=Axes(f,0)
 a.xaxis.update_units(['a','b'])
 if xycategory:a.yaxis.update_units(['u','v'])
 a.events.clear();a._stale_viewlims={'x':False,'y':False}
 return a

def add(a,x,y,name):
 line=Line(a,x,y,name);a._children.append(line);line.recache();a._update_line_limits(line);return line

def raw(value):
 return [{'datetime':v.isoformat(),'offset_seconds':None if v.tzinfo is None else int(v.utcoffset().total_seconds())}if isinstance(v,dt.datetime)else v for v in value]

def snapshot(a):
 return {'xconverter':None if a.xaxis.get_converter()is None else type(a.xaxis.get_converter()).__name__,
 'yconverter':None if a.yaxis.get_converter()is None else type(a.yaxis.get_converter()).__name__,
 'xunit':list(a.xaxis.units._mapping.items())if hasattr(a.xaxis.units,'_mapping')else str(a.xaxis.units),
 'yunit':list(a.yaxis.units._mapping.items())if hasattr(a.yaxis.units,'_mapping')else str(a.yaxis.units),
 'data':a.dataLim._points.tolist(),'minpos':a.dataLim._minpos.tolist(),'ignore':a.ignore_existing_data_limits,'stale':a._stale_viewlims.copy(),
 'lines':[{'name':line.name,'xorig':raw(line.get_xdata()),'yorig':raw(line.get_ydata()),'xy':None if line._xy is None else line._xy.tolist(),'path':None if line._path is None else line._path.vertices.tolist(),'invalid':[line._invalidx,line._invalidy],
 'x_view_xy':line._xy is not None and np.shares_memory(line._x,line._xy),'y_view_xy':line._xy is not None and np.shares_memory(line._y,line._xy)}for line in a.lines]}

def load_line_source(path=P):
 if Path(path).resolve()!=P.resolve():raise ValueError('pinned source tree required')
 return {'namespace':ns,'Axis':UnitAxis,'Axes':Axes,'Line':Line,'source_hashes':source_hashes()}

def source_hashes():
 return {**ns['source_hashes'],'lines.py':LINES_SHA,
 'axis.py':hashlib.sha256(P.with_name('axis.py').read_bytes()).hexdigest(),
 'axes/_base.py':hashlib.sha256((P.parent/'axes/_base.py').read_bytes()).hexdigest(),
 'artist.py':hashlib.sha256(P.with_name('artist.py').read_bytes()).hexdigest(),
 'transforms.py':hashlib.sha256(P.with_name('transforms.py').read_bytes()).hexdigest(),
 'category.py':ref.UNIT_SOURCES['category.py'],'units.py':ref.UNIT_SOURCES['units.py']}

def collect():
 rows=[]
 def take(label,a,fn):
  a.events.clear();before=snapshot(a)
  try:fn();error=None
  except Exception as exc:error={'type':type(exc).__name__,'message':str(exc)}
  rows.append({'label':label,'before':before,'after':snapshot(a),'events':copy.deepcopy(a.events),'error':error})

 a=setup();cat=add(a,['a','b'],[10.,20.],'category');num=add(a,[-2.,5.],[30.,40.],'numeric')
 take('first replacement reverses original string vertices but native numeric unchanged',a,lambda:a.xaxis.set_units(ref.cat['UnitData'](['b','a'])))
 take('repeat replacement restores and extends ordering',a,lambda:a.xaxis.set_units(ref.cat['UnitData'](['a','b','c'])))
 take('missing original key appends during recache',a,lambda:a.xaxis.set_units(ref.cat['UnitData'](['z','b'])))
 take('same UnitData identity is no-op',a,lambda:a.xaxis.set_units(a.xaxis.units))
 take('equal-content different UnitData still recaches',a,lambda:a.xaxis.set_units(ref.cat['UnitData'](list(a.xaxis.units._mapping))))

 a=setup(xycategory=True);l=add(a,['a','b'],['u','v'],'both categories')
 l.set_ydata(['v','u']);a._stale_viewlims={'x':False,'y':False}
 take('x-only unit replacement force-reconverts y and requests only x',a,lambda:a.xaxis.set_units(ref.cat['UnitData'](['b','a'])))
 a=setup();first=add(a,['a','b'],[10.,20.],'first');bad=add(a,['a','b'],[30.,40.],'bad');last=add(a,['a','b'],[50.,60.],'last')
 bad.set_ydata(['not-numeric','bad'])
 a._stale_viewlims={'x':False,'y':False}
 take('second Line y conversion fails after first cache changes before relim request',a,lambda:a.xaxis.set_units(ref.cat['UnitData'](['b','a'])))

 a=setup();l=add(a,['a','b'],[10.,20.],'shape');l.set_ydata([10.,20.,30.]);a._stale_viewlims={'x':False,'y':False}
 take('broadcast error preserves old xy and dataLim while assigned new unit remains',a,lambda:a.xaxis.set_units(ref.cat['UnitData'](['b','a'])))

 a=setup();incoming=['a','b'];l=add(a,incoming,[10.,20.],'alias');incoming[0]='outside'
 take('external input list mutation does not change copied original',a,lambda:l.recache_always())
 l.get_xdata()[0]='b'
 take('borrowed original mutation does not itself invalidate cached xy',a,lambda:l.get_xydata())
 take('forced recache consumes borrowed original mutation',a,lambda:l.recache_always())
 take('set_xdata is lazy and copied',a,lambda:l.set_xdata(['a','b']))
 take('processed getter recaches invalid x with retained y',a,lambda:l.get_xdata(orig=False))
 take('set_data partial x write survives scalar y rejection',a,lambda:l.set_data(['b','a'],4.))

 a=setup();l=add(a,['a'],[1.,2.,3.],'broadcast singleton')
 take('singleton original broadcasts while retained original length stays one',a,lambda:l.recache_always())

 for index,row in enumerate(rows):
  row['id']=index
  row['projection']='source_only_lazy_line_api'if 9<=index<=13 else'controlled_sidecar'
  row['panels_before']=[row['before']];row['panels_after']=[row['after']]
  row['shared']=False
  row['operation']={'kind':'recache'}if index in[8,14]else{'kind':'unit','axis':'x','labels':[['b','a'],['a','b','c'],['z','b'],None,['z','b','a'],['b','a'],['b','a'],['b','a']][index]}if index<8 else None
  if index==3:row['operation']['kind']='same_unit'

 def extra(label,panels,action,operation):
  for panel in panels:panel.events.clear()
  before=[snapshot(panel)for panel in panels]
  try:action();error=None
  except Exception as exc:error={'type':type(exc).__name__,'message':str(exc)}
  after=[snapshot(panel)for panel in panels]
  events=[{'panel':i,'events':copy.deepcopy(panel.events)}for i,panel in enumerate(panels)]
  rows.append({'id':len(rows),'label':label,'projection':'controlled_sidecar',
   'panels_before':before,'panels_after':after,'shared':len(panels)>1,
   'operation':operation,'events':events,'error':error})

 dates=[dt.datetime(2024,1,1,tzinfo=dt.timezone.utc),dt.datetime(2024,1,2,tzinfo=dt.timezone(dt.timedelta(hours=3)))]
 a=setup();a.yaxis.update_units(dates);add(a,['a','b'],dates,'date y')
 a._stale_viewlims={'x':False,'y':False}
 extra('category x remap reconverts retained aware Date y', [a], lambda:a.xaxis.set_units(ref.cat['UnitData'](['b','a'])), {'kind':'unit','axis':'x','labels':['b','a']})
 f=ref.actual.Figure();f.unit_events=[];a=Axes(f,0)
 a.xaxis.update_units(dates);a.yaxis.update_units(['u','v']);add(a,dates,['u','v'],'date x')
 a._stale_viewlims={'x':False,'y':False}
 extra('category y remap reconverts retained aware Date x', [a], lambda:a.yaxis.set_units(ref.cat['UnitData'](['v','u'])), {'kind':'unit','axis':'y','labels':['v','u']})
 extra('timezone-only unit replacement keeps Date original instants',[a],lambda:a.xaxis.set_units(dt.timezone(dt.timedelta(hours=6))),{'kind':'zone','axis':'x','seconds':21600})

 for bad_panel in[None,0,1]:
  f=ref.actual.Figure();f.unit_events=[];a=Axes(f,0);b=Axes(f,1,sharex=a)
  a.xaxis.update_units(['a','b'])
  la=add(a,['a','b'],[10.,20.],'first panel');lb=add(b,['b','a'],[30.,40.],'second panel')
  if bad_panel is not None:[la,lb][bad_panel].set_ydata(['bad','data'])
  for panel in[a,b]:panel._stale_viewlims={'x':False,'y':False}
  extra('actual shared Ticker remap '+('success'if bad_panel is None else'conversion failure panel '+str(bad_panel)),[a,b],lambda:a.xaxis.set_units(ref.cat['UnitData'](['z','b'])),{'kind':'unit','axis':'x','labels':['z','b']})

 for x,y in[([],[1.]),(['a'],[])]:
  a=setup();add(a,x,y,'empty singleton');a._stale_viewlims={'x':False,'y':False}
  extra('empty/singleton broadcast '+str((len(x),len(y))),[a],lambda:a.xaxis.set_units(ref.cat['UnitData'](['b','a'])),{'kind':'unit','axis':'x','labels':['b','a']})

 a=setup();l=add(a,['a','b'],[10.,20.],'late broadcast');l.set_xdata(['fresh','b']);l.set_ydata([1.,2.,3.]);a._stale_viewlims={'x':False,'y':False}
 extra('x category append survives subsequent two-coordinate broadcast error',[a],lambda:a.xaxis.set_units(ref.cat['UnitData'](['z'])),{'kind':'unit','axis':'x','labels':['z']})
 count=len(rows);migrated=sum(row['projection']=='controlled_sidecar'for row in rows)
 return {'source_hashes':source_hashes(),'line_source_url':LINES_URL,
  'numpy_binary_sha256':hashlib.sha256(Path(np._core._multiarray_umath.__file__).read_bytes()).hexdigest(),
  'counts':{'source_observations':count,'typed_cases':migrated,'source_only_cases':count-migrated,'registered_groups':math.ceil(migrated/32)},
  'scope':'Complete original selected Line2D/Artist/Axes/Bbox methods and real Axis/registry/category/date/callbacks. Short default-style Lines, identity data transforms and numeric Path storage are explicit hosts. Cases09–13 preserve source-only public lazy getter/setter evidence; Moon tests use private original-coordinate/point-buffer fixtures and claim no public Line handles. Full Line graphical constructor/style/custom transforms and Collection original recache are outside this profile.',
  'cases':rows}

from generate_scale_defaults_reference import moon
from generate_auto_date_reference import formatted

HEADER='''// Generated from pinned original Line/units methods; do not edit.

///|
fn line_units_ref_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn line_units_ref_points(actual : Array[@core.Point], expected : Array[Array[Double]]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() {
    line_units_ref_double(actual[index].x(), expected[index][0])
    line_units_ref_double(actual[index].y(), expected[index][1])
  }
}

///|
fn line_units_ref_numbers(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() { line_units_ref_double(actual[index], expected[index]) }
}
'''

def zone_seconds(value):
 if value=='UTC':return 0
 if value.startswith('UTC'):
  sign=-1 if value[3]=='-'else 1
  fields=[int(v)for v in value[4:].split(':')]
  return sign*sum(v*d for v,d in zip(fields,[3600,60,1]))
 raise ValueError('unknown declared date unit '+value)

def rule_date(value):
 d=dt.datetime.fromisoformat(value['datetime']);offset=value['offset_seconds']
 out='@date.datetime('+', '.join(str(v)for v in[d.year,d.month,d.day])+', hour='+str(d.hour)+', minute='+str(d.minute)+', second='+str(d.second)+', microsecond='+str(d.microsecond)
 if offset is not None:out+=', offset_seconds='+str(offset)
 out+=')'
 return '@date.RRuleDateTime::'+('naive'if offset is None else'aware')+'('+out+')'

def original_code(values,*,empty_category=False):
 if values and isinstance(values[0],dict):return 'LineData::Date(['+', '.join(rule_date(v)for v in values)+'])'
 if values and isinstance(values[0],str)or not values and empty_category:return 'LineData::Category('+moon(values)+')'
 return 'LineData::Numeric('+moon([float(v)for v in values])+')'

def original_assert(value,expected,empty_category=False):
 if expected and isinstance(expected[0],dict):
  out=['match '+value+' { LineData::Date(values) => {','assert_eq(values.length(), '+str(len(expected))+')']
  for i,item in enumerate(expected):
   d=dt.datetime.fromisoformat(item['datetime']);v='values['+str(i)+']'
   out+=['assert_eq('+v+'.is_naive(), '+moon(item['offset_seconds']is None)+')',
         'assert_eq(['+', '.join(v+'.date().'+field+'()'for field in['year','month','day','hour','minute','second','microsecond','offset_seconds'])+'], '+moon([d.year,d.month,d.day,d.hour,d.minute,d.second,d.microsecond,item['offset_seconds']or 0])+')']
  return out+['}; _ => fail("expected Date original coordinate") }']
 if expected and isinstance(expected[0],str)or not expected and empty_category:
  return ['match '+value+' { LineData::Category(values) => assert_eq(values, '+moon(expected)+'); _ => fail("expected Category original coordinate") }']
 return ['match '+value+' { LineData::Numeric(values) => line_units_ref_numbers(values, '+moon([float(v)for v in expected])+'); _ => fail("expected Numeric original coordinate") }']

def assert_snapshot(s,i):
 panel='panels['+str(i)+']';state=panel+'.state.val';out=[]
 for axis in['x','y']:
  value=state+'.'+axis+'_axis';source=s[axis+'converter']
  kind={None:None,'StrCategoryConverter':'category','_SwitchableDateConverter':'default_date','DateConverter':'explicit_date'}[source]
  out+=['assert_eq('+value+'.unit_converter_kind(), '+('None'if kind is None else'Some('+moon(kind)+')')+')']
  unit=s[axis+'unit']
  if isinstance(unit,list):
   out+=['assert_eq('+value+'.get_category_units().unwrap().labels(), '+moon([a for a,_ in unit])+')']
  elif unit=='None':out+=['assert_true('+value+'.unit_tag() is None)']
  else:
   out+=['match '+value+'.unit_tag() { Some(@axis.AxisUnitTag::Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), '+str(zone_seconds(unit))+'); _ => fail("expected Date unit") }']
  out+=['assert_eq('+value+'.autoscale_stale(), '+moon(s['stale'][axis])+')']
  d=s['data'];coord=0 if axis=='x'else 1
  out+=['line_units_ref_double('+panel+'.data_limits(horizontal='+moon(axis=='x')+').lower(), '+moon(float(d[0][coord]))+')',
        'line_units_ref_double('+panel+'.data_limits(horizontal='+moon(axis=='x')+').upper(), '+moon(float(d[1][coord]))+')',
        'line_units_ref_double('+panel+'.data_minpos(horizontal='+moon(axis=='x')+'), '+moon(float(s['minpos'][coord]))+')']
 out+=['assert_eq('+panel+'.ignore_existing_data_limits(), '+moon(s['ignore'])+')',
       'assert_eq('+state+'.line_originals.length(), '+str(len(s['lines']))+')']
 for j,line in enumerate(s['lines']):
  original=state+'.line_originals['+str(j)+']'
  out+=['line_units_ref_points('+original+'.points, '+moon(line['xy'])+')',
        'match '+state+'.artists['+str(j)+'] { Artist::Line(points, _) => assert_true(physical_equal(points, '+original+'.points)); _ => fail("expected exact Line buffer") }']
  for axis in['x','y']:
   values=line[axis+'orig'];empty_category=not values and s[axis+'converter']=='StrCategoryConverter'
   out+=original_assert(original+'.'+axis,values,empty_category)
 return out

def render_case(row):
 index=row['id'];before=row['panels_before'];after=row['panels_after']
 out=['///|','fn line_units_source_case_'+str(index)+'() -> Unit raise {',
      'let old_mode = @config.date_converter()','let old_multiple = @config.date_interval_multiples()',
      'defer { @config.set_date_converter(old_mode); @config.set_date_interval_multiples(old_multiple) }',
      '@config.set_date_converter("auto")','@config.set_date_interval_multiples(true)',
      'let figure = figure()','let panels = '+('figure.subplots(1, 2, share_x=true)'if row['shared']else'[figure.axes()]')]
 # Real unit initialization occurs before controlled raw original/point seeding.
 # A shared peer's converter-only discovery must not run update_units/axisinfo.
 for i,s in enumerate(before):
  for axis in['x','y']:
   a='panels['+str(i)+'].state.val.'+axis+'_axis';unit=s[axis+'unit'];conv=s[axis+'converter']
   if isinstance(unit,list):
    labels=[key for key,_ in unit]
    if i==0 or axis=='y':out+=['ignore('+a+'.update_category_units('+moon(labels)+'))']
    elif conv=='StrCategoryConverter':out+=['ignore('+a+'.convert_category_units('+moon(labels)+'))']
   elif unit!='None':
    seconds=zone_seconds(unit)
    out+=['ignore('+a+'.update_date_units([@date.RRuleDateTime::aware(@date.datetime(2024, 1, 1, offset_seconds='+str(seconds)+'))]))']
   elif conv=='StrCategoryConverter':out+=[''+a+'.set_explicit_category_converter()']
   elif conv in['_SwitchableDateConverter','DateConverter']:
    out+=['ignore('+a+'.convert_date_units([@date.RRuleDateTime::aware(@date.datetime(2024, 1, 1))]))']
 for i,s in enumerate(before):
  panel='panels['+str(i)+']';state=panel+'.state.val'
  for j,line in enumerate(s['lines']):
   x=original_code(line['xorig'],empty_category=not line['xorig']and s['xconverter']=='StrCategoryConverter')
   y=original_code(line['yorig'],empty_category=not line['yorig']and s['yconverter']=='StrCategoryConverter')
   if index==8:
    out+=['let incoming = '+moon(line['xorig'])]
    x='LineData::Category(incoming)'
   out += [panel+'.attach_line_with_originals(['+', '.join('@core.point('+moon(float(p[0]))+', '+moon(float(p[1]))+')'for p in line['xy'])+'], '+x+', '+y+')']
   if index==8:out+=['incoming[0] = "outside"']
  out += [state+'.raw_x_data = @core.limits('+moon(float(s['data'][0][0]))+', '+moon(float(s['data'][1][0]))+')',
          state+'.raw_y_data = @core.limits('+moon(float(s['data'][0][1]))+', '+moon(float(s['data'][1][1]))+')',
          state+'.x_data_minpos = '+moon(float(s['minpos'][0])),state+'.y_data_minpos = '+moon(float(s['minpos'][1])),
          state+'.ignore_existing_data_limits = '+moon(s['ignore'])]
  for axis in['x','y']:
   out += [state+'.'+axis+'_axis.clear_autoscale_request()']
   if s['stale'][axis]:out += [state+'.'+axis+'_axis.request_autoscale()']
  out+=assert_snapshot(s,i)
 op=row['operation'];panel='panels[0]'
 if op['kind']=='recache':call=panel+'.recache_line_units()'
 elif op['kind']=='same_unit':call=panel+'.set_'+op['axis']+'_units('+panel+'.'+op['axis']+'_units())'
 elif op['kind']=='zone':call=panel+'.set_'+op['axis']+'_units(Some(@axis.AxisUnitTag::Date(@date.fixed_timezone_seconds('+str(op['seconds'])+'))))'
 else:
  out+=['let replacement = @axis.CategoryUnits::new('+moon(op['labels'])+')']
  call=panel+'.set_'+op['axis']+'_units(Some(@axis.AxisUnitTag::Category(replacement)))'
 if row['error']:
  # The source's wrapped Python ConversionError maps to the existing typed
  # DataError conversion boundary. Shape errors retain exact NumPy text.
  pattern='@core.DataError::InvalidTicks(message~) => message == '+moon(row['error']['message'])if row['error']['type']=='ValueError'else'@core.DataError::InvalidTicks(_) => true'
  out+=['let failed = try { '+call+'; false } catch { '+pattern+'; _ => false }','assert_true(failed)']
 else:out+=[call]
 for i,s in enumerate(after):out+=assert_snapshot(s,i)
 if row['shared']:
  same=after[0]['xunit']==after[1]['xunit']
  out+=['assert_eq(physical_equal(panels[0].state.val.x_axis.get_category_units().unwrap(), panels[1].state.val.x_axis.get_category_units().unwrap()), '+moon(same)+')']
 out+=['}'];return '\n'.join(out)

def render(payload):
 migrated=[row for row in payload['cases']if row['projection']=='controlled_sidecar']
 chunks=[HEADER]+[render_case(row)for row in migrated]
 for start in range(0,len(migrated),32):
  calls=['line_units_source_case_'+str(row['id'])+'() catch { error => fail('+moon('Line units source '+str(row['id'])+' ['+row['label']+']: ')+' + error.to_string()) }'for row in migrated[start:start+32]]
  chunks.append('///|\ntest "original Line unit recache group '+str(start//32)+'" {\n'+'\n'.join(calls)+'\n}')
 return formatted('\n\n'.join(chunks)+'\n')

def main():
 ap=argparse.ArgumentParser();ap.add_argument('ticker',nargs='?',type=Path,default=P);ap.add_argument('--check',action='store_true');args=ap.parse_args()
 load_line_source(args.ticker);payload=collect()
 outputs={ROOT/'testdata/line_units_reference.json':json.dumps(ref.actual.json_safe(payload),ensure_ascii=False,indent=2,allow_nan=False)+'\n',
          ROOT/'scene/line_units_reference_wbtest.mbt':render(payload)}
 for path,content in outputs.items():
  if args.check:
   if not path.exists()or path.read_text()!=content:raise SystemExit('generated Line units reference differs: '+str(path))
  else:path.write_text(content)
 print(json.dumps({'check':args.check,**payload['counts'],'json_sha256':hashlib.sha256(outputs[ROOT/'testdata/line_units_reference.json'].encode()).hexdigest()}))
if __name__=='__main__':main()
