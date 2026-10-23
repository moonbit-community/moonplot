"""Pinned complete Secondary class and actual numeric lifecycle reference.

Superclass graphical construction is an explicit storage/style host. Its actual
set_figure/_set_lim_and_transforms establish real original Bboxes. Full original
Secondary __init__, function scales, Axis setters and autoscale bodies execute.
"""
from pathlib import Path
import argparse,ast,copy,functools,hashlib,json,math,numbers,sys,types,warnings
import numpy as np
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_autoscale_reference as actual
from generate_log_formatter_axis_reference import load as graph_load
from generate_numeric_axis_reference import load as font_load
P=actual.P;ns=actual.ns
_,tr,_,_,_=graph_load(P);font=font_load(P)
secondary_path=P.parent/'axes/_secondary_axes.py'
SECONDARY_SHA='b2aaaae077e03ff6538d1a4bf8a69c3476eed0e27120aa567de138c794599a93'
if hashlib.sha256(secondary_path.read_bytes()).hexdigest()!=SECONDARY_SHA:raise ValueError('fixed secondary source differs')
ns.update(Transform=tr['Transform'],IdentityTransform=tr['IdentityTransform'],mtransforms=types.SimpleNamespace(**tr),transforms=types.SimpleNamespace(**tr))
# Complete function transforms / scales under the same actual transform identity.
scale_path=P.with_name('scale.py');scale_tree=ast.parse(scale_path.read_bytes())
for node in scale_tree.body:
 if isinstance(node,ast.ClassDef)and node.name in{'FuncTransform','FuncScale','LogTransform','InvertedLogTransform','FuncScaleLog'}:
  exec(compile(ast.Module(body=[node],type_ignores=[]),str(scale_path),'exec'),ns)
for name in['FuncScale','FuncScaleLog']:ns['_scale_mapping'][ns[name].name]=ns[name]
registry=next(n for n in scale_tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id=='_scale_has_axis_parameter'for t in n.targets))
exec(compile(ast.Module(body=[registry],type_ignores=[]),str(scale_path),'exec'),ns)
ns.update(functools=functools,numbers=numbers)
for name in ['NullLocator','FixedLocator']:setattr(ns['mticker'],name,ns[name])
ns['mtext'].FontProperties=font['mtext'].FontProperties
for key,value in [('xtick.labelsize',10.),('ytick.labelsize',10.),('font.size',10.),('axes.autolimit_mode','data')]:ns['mpl'].rcParams._set(key,value)
axis_tree=ast.parse(P.with_name('axis.py').read_bytes());axis_node=next(n for n in axis_tree.body if isinstance(n,ast.ClassDef)and n.name=='Axis')
for node in axis_node.body:
 if isinstance(node,ast.FunctionDef)and node.name in{'_get_tick_label_size','set_ticks','_set_tick_locations'}:
  exec(compile(ast.Module(body=[node],type_ignores=[]),str(P.with_name('axis.py')),'exec'),ns)
for node in axis_tree.body:
 if isinstance(node,ast.FunctionDef)and node.name=='_make_getset_interval':exec(compile(ast.Module(body=[node],type_ignores=[]),str(P.with_name('axis.py')),'exec'),ns)
for name in['x','y']:
 cls=next(n for n in axis_tree.body if isinstance(n,ast.ClassDef)and n.name==name.upper()+'Axis')
 for node in cls.body:
  if isinstance(node,ast.FunctionDef)and node.name in{'get_tick_space','get_minpos'}:
   exec(compile(ast.Module(body=[copy.deepcopy(node)],type_ignores=[]),str(P.with_name('axis.py')),'exec'),ns)
   ns[name+'_'+node.name]=ns[node.name]
intervals={name:ns['_make_getset_interval']('view','viewLim','interval'+name)for name in['x','y']}
class NumericAxis(actual.clear.Axis):
 @property
 def view(self):return getattr(self.axes._viewLim,'interval'+self.axis_name)if hasattr(self,'axes')else self._initial_view
 @view.setter
 def view(self,v):
  if hasattr(self,'axes'):setattr(self.axes._viewLim,'interval'+self.axis_name,v)
  else:self._initial_view=v
 @property
 def data(self):return getattr(self.axes.dataLim,'interval'+self.axis_name)if hasattr(self,'axes')else self._initial_data
 @data.setter
 def data(self,v):
  if hasattr(self,'axes'):setattr(self.axes.dataLim,'interval'+self.axis_name,v)
  else:self._initial_data=v
 def get_view_interval(self):return intervals[self.axis_name][0](self)
 def set_view_interval(self,lower,upper,ignore=False):return intervals[self.axis_name][1](self,lower,upper,ignore=ignore)
 def get_data_interval(self):return self.data
 def get_minpos(self):
  self.axes.figure.events.append(['axis.minpos',self.axes.index,self.axis_name])
  return ns[self.axis_name+'_get_minpos'](self)
 def get_tick_space(self):return ns[self.axis_name+'_get_tick_space'](self)
 def get_figure(self,**kwargs):return self.axes.figure
 def set_ticks_position(self,value):self.presentation_tick_position=value
 def set_label_position(self,value):self.presentation_label_position=value
 def get_major_ticks(self,n):return [object()for _ in range(n)]
 def get_minor_ticks(self,n):return [object()for _ in range(n)]
 _get_tick_label_size=ns['_get_tick_label_size'];set_ticks=ns['set_ticks'];_set_tick_locations=ns['_set_tick_locations']
actual.clear.Axis=NumericAxis
base_tree=ast.parse((P.parent/'axes/_base.py').read_bytes());base=next(n for n in base_tree.body if isinstance(n,ast.ClassDef)and n.name=='_AxesBase')
class ArtistFigureSink:
 def set_figure(self,figure):self.figure=figure
ns['ArtistFigureSink']=ArtistFigureSink
names={'set_figure','_set_lim_and_transforms','_update_transScale','get_position','_set_position','apply_aspect'}
cl=ast.ClassDef(name='OriginalNumericGeometry',bases=[ast.Name(id='ArtistFigureSink',ctx=ast.Load())],keywords=[],body=[copy.deepcopy(n)for n in base.body if isinstance(n,ast.FunctionDef)and n.name in names],decorator_list=[])
exec(compile(ast.fix_missing_locations(ast.Module(body=[cl],type_ignores=[])),str(P.parent/'axes/_base.py'),'exec'),ns)
node=next(n for n in base_tree.body if isinstance(n,ast.ClassDef)and n.name=='_TransformedBoundsLocator')
exec(compile(ast.Module(body=[node],type_ignores=[]),str(P.parent/'axes/_base.py'),'exec'),ns)
class Spine:
 def set_visible(self,value):self.visible=value
 def set_color(self,value):self.color=value
class Spines(dict):
 def __getitem__(self,key):
  if isinstance(key,list):
   items=[super(Spines,self).__getitem__(k)for k in key]
   return types.SimpleNamespace(set_visible=lambda v:[i.set_visible(v)for i in items])
  return super().__getitem__(key)
class NumericBase(actual.Axes,ns['OriginalNumericGeometry']):
 def __init__(self,figure,rect,index=None,**kwargs):
  self._position=tr['Bbox'].from_bounds(*rect);self._originalPosition=self._position.frozen()
  self._viewLim=tr['Bbox'].unit();self.dataLim=tr['Bbox'].null()
  actual.Axes.__init__(self,figure,len(figure.created)if index is None else index)
  self.set_figure(figure)
  self._aspect='auto';self._box_aspect=None;self._adjustable='box';self._anchor='C';self._axes_locator=None
  self.spines=Spines({name:Spine()for name in['left','right','top','bottom']})
  self._tight=None;self._xmargin=self._ymargin=.05
  self._update_transScale()
 def set_xscale(self,name,**kwargs):return self.xaxis._set_axes_scale(name,**kwargs)
 def set_yscale(self,name,**kwargs):return self.yaxis._set_axes_scale(name,**kwargs)
 def set_xticks(self,*args,**kwargs):return self.xaxis.set_ticks(*args,**kwargs)
 def set_yticks(self,*args,**kwargs):return self.yaxis.set_ticks(*args,**kwargs)
 def set_axes_locator(self,value):self._axes_locator=value
 def get_axes_locator(self):return self._axes_locator
 def get_aspect(self):return self._aspect
 def draw(self,renderer):self.figure.events.append(['super.draw',self.index])
 _update_transScale=ns['OriginalNumericGeometry']._update_transScale
 get_position=ns['OriginalNumericGeometry'].get_position
 _set_position=ns['OriginalNumericGeometry']._set_position
 apply_aspect=ns['OriginalNumericGeometry'].apply_aspect
 _set_lim_and_transforms=ns['OriginalNumericGeometry']._set_lim_and_transforms
class Figure(actual.Figure):
 def __init__(self,width=320.,height=240.,dpi=72.):
  super().__init__();self.transSubfigure=tr['Affine2D']().scale(width,height);self.dpi_scale_trans=tr['Affine2D']().scale(dpi);self.width=width;self.height=height;self.dpi=dpi
ns['_AxesBase']=NumericBase;ns['Axis']=NumericAxis
secondary=next(n for n in ast.parse(secondary_path.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='SecondaryAxis')
exec(compile(ast.Module(body=[secondary],type_ignores=[]),str(secondary_path),'exec'),ns)
Secondary=ns['SecondaryAxis']


def load_secondary_source(path=P):
 if Path(path).resolve()!=P.resolve():raise ValueError('fixed source tree required')
 return {'namespace':ns,'Figure':Figure,'Axes':NumericBase,'Axis':NumericAxis,'Secondary':Secondary,'transforms':tr}

def source_hashes():
 return {**ns['source_hashes'],'axes/_secondary_axes.py':SECONDARY_SHA,
  'axes/_base.py':hashlib.sha256((P.parent/'axes/_base.py').read_bytes()).hexdigest(),
  'scale.py':hashlib.sha256(scale_path.read_bytes()).hexdigest(),'axis.py':hashlib.sha256(P.with_name('axis.py').read_bytes()).hexdigest(),
  'transforms.py':hashlib.sha256(P.with_name('transforms.py').read_bytes()).hexdigest(),
  'font_manager.py':hashlib.sha256(P.with_name('font_manager.py').read_bytes()).hexdigest()}

def collect():
 for axis in ["x", "y"]:ns["mpl"].rcParams._set(axis+"tick.minor.visible",False)
 rows=[]
 def parent(family='linear',orientation='x'):
  fig=Figure();a=NumericBase(fig,[.2,.2,.4,.6],index=0);fig.created.append(a);fig.active.append(a)
  getattr(a,'set_'+orientation+'scale')(family,**({'linthresh':2.}if family=='symlog'else{}))
  getattr(a,'set_'+orientation+'lim')((10.,20.)if family!='logit'else(.1,.8))
  return fig,a

 def snapshot(s):
  a=s._axis
  return {'orientation':s._orientation,'parentscale':s._parentscale,'scale':a.get_scale(),'view':a.get_view_interval().tolist(),
  'data':a.get_data_interval().tolist(),'minpos':float(a.get_minpos()),'space':int(a.get_tick_space()),
  'rect':list(s._position.bounds),'original_rect':list(s._originalPosition.bounds),'bbox':[s.bbox.width,s.bbox.height],
  'classes':[type(x).__name__ for x in[a.major.locator,a.minor.locator,a.major.formatter,a.minor.formatter]],
  'flags':[getattr(a,k)for k in['isDefault_majloc','isDefault_minloc','isDefault_majfmt','isDefault_minfmt']],
  'ticks':np.asarray(a.get_ticklocs()).tolist(),'geometry':[float(s.bbox.x0 if s._orientation=='x'else s.bbox.y0),float(s.bbox.width if s._orientation=='x'else s.bbox.height)],
   'auto':bool(a._get_autoscale_on()),'stale':bool(s._stale_viewlims[s._orientation]),'ticks_set':bool(s._ticks_set),
   'owners':[v.axis is a for v in[a.major.locator,a.minor.locator,a.major.formatter,a.minor.formatter]]}
 def observe(label,fig,s,fn,clear=True):
  if clear:fig.events.clear()
  try:fn();error=None
  except Exception as e:error={'type':type(e).__name__,'message':str(e)}
  operation_events=copy.deepcopy(fig.events)
  state=snapshot(s)
  rows.append({'label':label,'state':state,'events':operation_events,'error':error})
 for orientation in['x','y']:
  for family in['linear','log','symlog','asinh','logit']:
   fig,a=parent(family,orientation)
   fig.events.clear()
   s=Secondary(a,orientation,'top'if orientation=='x'else'right',(lambda x:2*x+5,lambda x:(x-5)/2))
   observe('constructor '+orientation+'/'+family,fig,s,lambda:None,clear=False)
   observe('aspect-only '+orientation+'/'+family,fig,s,s.apply_aspect)
   # Renderer supplies the real original bounds locator before draw. This is
   # a declared frame placement subchain, not a full Figure.draw invocation.
   observe('positioned aspect '+orientation+'/'+family,fig,s,lambda:s.apply_aspect(s.get_axes_locator()(s,None)))
   observe('draw after positioned aspect '+orientation+'/'+family,fig,s,lambda:s.draw(None))
 # Actual numeric order: old Fixed nonsingular runs before the name reset.
 fig,a=parent('linear','x')
 s=Secondary(a,'x','top',(lambda x:np.full_like(x,4.),lambda x:x))
 s._axis.set_major_locator(ns['FixedLocator']([]));a.set_xscale('log');a.set_xlim((10.,20.))
 observe('name-changing draw uses old Fixed nonsingular on constant endpoints',fig,s,lambda:s.draw(None))
 # Nonfinite scalar-function output is legal at construction but fails the real
 # Axis finite validation during _set_lims, before any changed-scale installer.
 fig,a=parent('linear','x')
 s=Secondary(a,'x','top',(lambda x:np.full_like(x,math.nan),lambda x:x))
 a.set_xscale('log');a.set_xlim((10.,20.))
 observe('name-changing draw finite validation fails before scale installation',fig,s,lambda:s.draw(None))

 cases=[]
 for index in range(10):
  orientation=['x','y'][index//5];family=['linear','log','symlog','asinh','logit'][index%5]
  cases.append({'id':len(cases),'label':'complete numeric lifecycle '+orientation+'/'+family,'kind':'lifecycle','orientation':orientation,'family':family,'stages':rows[index*4:index*4+4]})
 for index in[40,41]:cases.append({'id':len(cases),'label':rows[index]['label'],'kind':'old_fixed'if index==40 else'finite_error','orientation':'x','family':'linear','stages':[rows[index]]})

 def handles(s):return [s._axis.major.locator,s._axis.minor.locator,s._axis.major.formatter,s._axis.minor.formatter]
 for orientation in['x','y']:
  for mode in['same_name_rc','changed_nonlog_rc','changed_no_latch','latched_current_custom']:
   for axis in['x','y']:ns['mpl'].rcParams._set(axis+'tick.minor.visible',False)
   fig,a=parent('linear',orientation)
   s=Secondary(a,orientation,'top'if orientation=='x'else'right',(lambda x:2*x+5,lambda x:(x-5)/2))
   if mode=='latched_current_custom':s.set_ticks([2.,3.])
   if mode!='same_name_rc':
    s._axis.set_major_locator(ns['FixedLocator']([4.,7.]))
    s._axis.set_minor_locator(ns['FixedLocator']([5.]))
    s._axis.set_major_formatter(ns['FixedFormatter'](['A','B']))
    s._axis.set_minor_formatter(ns['FuncFormatter'](lambda x,pos:'minor'))
   old=handles(s);before=snapshot(s);old_latch=s._ticks_set
   ns['mpl'].rcParams._set(orientation+'tick.minor.visible',True)
   if mode!='same_name_rc':
    getattr(a,'set_'+orientation+'scale')('symlog',linthresh=2.)if mode=='changed_nonlog_rc'else getattr(a,'set_'+orientation+'scale')('log')
    getattr(a,'set_'+orientation+'lim')((10.,20.))
   observe('source slot/latch '+orientation+'/'+mode,fig,s,lambda:s.draw(None))
   after=snapshot(s)
   record=rows[-1]
   record.update(before=before,retains=[v is w for v,w in zip(old,handles(s))],old_owners_retained=[v.axis is s._axis for v in old],
    latch_before=old_latch,latch_after=s._ticks_set,owners_after=[v.axis is s._axis for v in handles(s)])
   cases.append({'id':len(cases),'label':record['label'],'kind':mode,'orientation':orientation,'family':'linear','stages':[record]})
 for inverted in[False,True]:
  fig,a=parent('linear','x')
  a._set_position([0.,0.,.4,.6])
  a.set_xlim((20.,10.)if inverted else(10.,20.))
  s=Secondary(a,'x','top',(lambda x:-x,lambda x:-x))
  observe('actual decreasing transData positions '+str(inverted),fig,s,lambda:s.apply_aspect(s.get_axes_locator()(s,None)))
  record=rows[-1]
  points=np.array([[-20.,.5],[-15.,.5],[-10.,.5]])
  record.update(input_positions=points.tolist(),display_positions=s.transData.transform(points).tolist(),
   transformed_view_bbox=tr['TransformedBbox'](s._viewLim,s.transScale).get_points().tolist(),
   pixel_stage_scope='Complete original child.transData geometry on a binary-width/origin-zero rectangle; separate backend generated assertions consume these exact original pixels.')
  cases.append({'id':len(cases),'label':record['label'],'kind':'decreasing','orientation':'x','family':'linear','inverted':inverted,'parent_rect':[0.,0.,.4,.6],'stages':[record]})
 # Actual source child registration, with an explicitly declared major-batch
 # superclass draw projection. This does not execute full graphical Axes.draw.
 artist_path=P.with_name('artist.py')
 callback=next(n for n in ast.parse(artist_path.read_bytes()).body if isinstance(n,ast.FunctionDef)and n.name=='_stale_axes_callback')
 exec(compile(ast.Module(body=[callback],type_ignores=[]),str(artist_path),'exec'),ns)
 ns['martist']=types.SimpleNamespace(_stale_axes_callback=ns['_stale_axes_callback'])
 register=next(n for n in base.body if isinstance(n,ast.FunctionDef)and n.name=='add_child_axes')
 exec(compile(ast.Module(body=[register],type_ignores=[]),str(P.parent/'axes/_base.py'),'exec'),ns)
 fig,a=parent('linear','x');a.set_ylim((10.,20.))
 y=Secondary(a,'y','right',(lambda v:v,lambda v:v))
 x=Secondary(a,'x','top',(lambda v:v,lambda v:v))
 ns['add_child_axes'](a,y);ns['add_child_axes'](a,x)
 order=[]
 def change_parent(v,pos):
  if pos==0:order.append('y.callback');a.set_xscale('log')
  return 'y'
 y._axis.set_major_formatter(ns['FuncFormatter'](change_parent))
 original_draw=NumericBase.draw
 def draw_batch(self,renderer):
  order.append(self._orientation+'.base.draw')
  axis=self._axis
  axis.major.formatter.format_ticks(axis.get_ticklocs())
 NumericBase.draw=draw_batch
 fig.events.clear()
 try:
  for child in a.child_axes:child.draw(None)
 finally:NumericBase.draw=original_draw
 rows.append({'label':'actual y-before-x registration and major-batch stagehost',
  'registration':[c._orientation for c in a.child_axes],'events':copy.deepcopy(fig.events),'batch_order':order,
  'parent_xscale':a.xaxis.get_scale(),'child_parent_caches':[c._parentscale for c in a.child_axes],
  'child_scales':[c._axis.get_scale()for c in a.child_axes],
  'projection':'linked to independent focused Scene to_svg creation-order hand test; no generated GUI/superdraw parity claim'})
 for i,row in enumerate(rows):row['source_id']=i
 return {'source_hashes':source_hashes(),'numpy_binary_sha256':hashlib.sha256(Path(np._core._multiarray_umath.__file__).read_bytes()).hexdigest(),
  'counts':{'source_observations':len(rows),'typed_cases':len(cases),'main_registered_groups':math.ceil(len(cases)/32),'placement_registered_groups':1,'registered_groups':math.ceil(len(cases)/32)+1,'hand_linked_observations':1},
  'source_profile':'Complete original Secondary ClassDef; complete original function scales/Axis/default/set_lim/autoscale/geometry/tickspace bodies. Graphical superclass constructor and super.draw are explicit numeric storage/style/presentation hosts. Full native Python transforms use the accepted affine numeric primitive capability. Not a full Figure/renderer/GUI constructor oracle; scalar mathematical mappings are the declared bridge.',
  'geometry':{'figure':[320.,240.],'dpi':72.,'font_size':10.,'parent_rect':[.2,.2,.4,.6]},
  'source_observations':rows,'cases':cases}

from generate_scale_defaults_reference import moon
from generate_auto_date_reference import formatted

HEADER='''// Generated from pinned complete Secondary/numeric lifecycle source; do not edit.

///|
fn secondary_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn secondary_source_numbers(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for i in 0..<actual.length() { secondary_source_double(actual[i], expected[i]) }
}

///|
fn secondary_source_major_class(value : @ticker.Locator) -> String {
  match value {
    @ticker.Locator::NamedAuto(_) => "AutoLocator"
    @ticker.Locator::NamedLog(_) => "LogLocator"
    @ticker.Locator::NamedFixed(_) => "FixedLocator"
    @ticker.Locator::Null(_) => "NullLocator"
    _ => "other"
  }
}

///|
fn secondary_source_minor_class(value : @ticker.MinorLocator) -> String {
  match value {
    @ticker.MinorLocator::NamedAutoMinor(_) => "AutoMinorLocator"
    @ticker.MinorLocator::NamedLog(_) => "LogLocator"
    @ticker.MinorLocator::NamedFixed(_) => "FixedLocator"
    @ticker.MinorLocator::Null(_) => "NullLocator"
    _ => "other"
  }
}

///|
fn secondary_source_formatter_class(value : @ticker.BaseFormatter) -> String {
  if value.scalar_formatter() is Some(_) { "ScalarFormatter" }
  else if value.log_formatter_sci_notation() is Some(_) { "LogFormatterSciNotation" }
  else if value.null_formatter() is Some(_) { "NullFormatter" }
  else if value.fixed_formatter() is Some(_) { "FixedFormatter" }
  else if value.func_formatter() is Some(_) { "FuncFormatter" }
  else { "other" }
}

///|
fn secondary_source_same_major(first : @ticker.Locator, last : @ticker.Locator) -> Bool {
  match (first, last) {
    (@ticker.Locator::NamedAuto(a), @ticker.Locator::NamedAuto(b)) => physical_equal(a,b)
    (@ticker.Locator::NamedLog(a), @ticker.Locator::NamedLog(b)) => physical_equal(a,b)
    (@ticker.Locator::NamedFixed(a), @ticker.Locator::NamedFixed(b)) => physical_equal(a,b)
    (@ticker.Locator::Null(a), @ticker.Locator::Null(b)) => physical_equal(a,b)
    _ => false
  }
}

///|
fn secondary_source_same_minor(first : @ticker.MinorLocator, last : @ticker.MinorLocator) -> Bool {
  match (first, last) {
    (@ticker.MinorLocator::NamedAutoMinor(a), @ticker.MinorLocator::NamedAutoMinor(b)) => physical_equal(a,b)
    (@ticker.MinorLocator::NamedLog(a), @ticker.MinorLocator::NamedLog(b)) => physical_equal(a,b)
    (@ticker.MinorLocator::NamedFixed(a), @ticker.MinorLocator::NamedFixed(b)) => physical_equal(a,b)
    (@ticker.MinorLocator::Null(a), @ticker.MinorLocator::Null(b)) => physical_equal(a,b)
    _ => false
  }
}
'''

def setup_code(case):
 direction=case['orientation'];family=case['family'];kind=case['kind']
 scale={'linear':'@scale.linear_scale()','log':'@scale.log_scale()','symlog':'@scale.symlog_scale(linthresh=2.0)','asinh':'@scale.asinh_scale()','logit':'@scale.logit_scale()'}[family]
 out=['let previous = @config.rc_params()','defer {',
      '@config.set_minor_ticks_visible(previous.minor_ticks_visible())','@config.set_minor_ticks_visible(previous.minor_ticks_visible(horizontal=false), horizontal=false)',
      '@config.set_classic_mode(previous.classic_mode())','try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())',
      'try! @config.set_x_margin(previous.x_margin())','try! @config.set_y_margin(previous.y_margin())',
      '@config.set_formatter_use_offset(previous.formatter_use_offset())','@config.set_formatter_use_math_text(previous.formatter_use_math_text())',
      '@config.set_formatter_use_locale(previous.formatter_use_locale())','@config.set_text_usetex(previous.text_usetex())','}',
      '@config.set_minor_ticks_visible(false)','@config.set_minor_ticks_visible(false, horizontal=false)',
      '@config.set_classic_mode(false)','@config.set_axes_autolimit_mode("data")','@config.set_x_margin(0.05)','@config.set_y_margin(0.05)',
      '@config.set_formatter_use_offset(true)','@config.set_formatter_use_math_text(false)','@config.set_formatter_use_locale(false)','@config.set_text_usetex(false)',
      'let figure = figure(width=320, height=240)','let parent = figure.axes()',
      'parent.set_'+direction+'_scale('+scale+')']
 bounds=[.1,.8]if family=='logit'else[20.,10.]if case.get('inverted')else[10.,20.]
 out+=['parent.set_'+direction+'lim('+moon(bounds[0])+', '+moon(bounds[1])+')']
 if kind=='decreasing':forward='value => -value';inverse=forward
 elif kind=='old_fixed':forward='value => { ignore(value); 4.0 }';inverse='value => value'
 elif kind=='finite_error':forward='value => { ignore(value); 0.0 / 0.0 }';inverse='value => value'
 else:forward='value => 2.0 * value + 5.0';inverse='value => (value - 5.0) / 2.0'
 out+=['let child = parent.secondary_'+direction+'axis('+forward+', '+inverse+')']
 return out

def assert_state(state):
 out=['assert_eq(child.parent_scale_name, Some('+moon(state['parentscale'])+'))',
      'assert_eq(child.numeric_axis.coordinate_scale_name(), '+moon(state['scale'])+')',
      'let view = child.numeric_axis.stored_view_limits()',
      'secondary_source_numbers([view.lower(), view.upper()], '+moon(state['view'])+')',
      'secondary_source_numbers([child.numeric_axis.data_interval().lower(), child.numeric_axis.data_interval().upper()], '+moon(state['data'])+')',
      'secondary_source_double(child.numeric_axis.get_minpos(), '+moon(float(state['minpos']))+')',
      'secondary_source_double(child.get_tick_space(), '+moon(float(state['space']))+')',
      'secondary_source_numbers([child.formatter_geometry.0, child.formatter_geometry.1], '+moon(state['geometry'])+')',
      'assert_eq(child.numeric_axis.autoscale_on(), '+moon(state['auto'])+')',
      'assert_eq(child.numeric_axis.autoscale_stale(), '+moon(state['stale'])+')',
      'assert_eq(child.ticks_set, '+moon(state['ticks_set'])+')',
      'assert_eq([secondary_source_major_class(child.numeric_axis.locator().unwrap()), secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()), secondary_source_formatter_class(child.numeric_axis.named_formatter().unwrap()), secondary_source_formatter_class(child.numeric_axis.minor_named_formatter().unwrap())], '+moon(state['classes'])+')',
      'assert_eq([child.numeric_axis.is_default_locator(), child.numeric_axis.is_default_locator(minor=true), child.numeric_axis.is_default_formatter(), child.numeric_axis.is_default_formatter(minor=true)], '+moon(state['flags'])+')',
      'secondary_source_numbers(child.tick_values_checked(), '+moon(state['ticks'])+')']
 # Formatters bind the stable own Axis; no parent context is substituted.
 out+=['assert_true(physical_equal(child.numeric_axis.named_formatter().unwrap().axis().unwrap(), child.numeric_axis.formatter_axis_binding()))',
       'assert_true(physical_equal(child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(), child.numeric_axis.formatter_axis_binding()))']
 return out

def stage_call(out,statement,row):
 if row['error']:
  out+=['let failed = try { '+statement+'; false } catch { @core.DataError::InvalidTicks(message~) => message == '+moon('ValueError: '+row['error']['message'])+'; _ => false }','assert_true(failed)']
 else:out+=[statement]
 out+=['{']+assert_state(row['state'])+['}']

def render_case(case):
 out=['///|','fn secondary_source_case_'+str(case['id'])+'() -> Unit raise {']+setup_code(case)
 kind=case['kind'];direction=case['orientation']
 if kind=='lifecycle':
  out+=['{']+assert_state(case['stages'][0]['state'])+['}']
  stage_call(out,'child.apply_aspect()',case['stages'][1])
  geometry=case['stages'][2]['state']['geometry']
  out+=['parent.'+direction+'_axis().bind_formatter_geometry(() => ('+moon(geometry[0])+', '+moon(geometry[1])+'))']
  stage_call(out,'child.synchronize_formatter_frame()',case['stages'][2])
  stage_call(out,'child.prepare_draw()',case['stages'][3])
 elif kind in['old_fixed','finite_error']:
  if kind=='old_fixed':out+=['child.set_locator(@ticker.FixedLocator::new([]).as_locator())']
  out+=['parent.set_x_scale(@scale.log_scale())','parent.set_xlim(10.0,20.0)']
  stage_call(out,'child.prepare_draw()',case['stages'][0])
 elif kind=='decreasing':
  geometry=case['stages'][0]['state']['geometry']
  out+=['parent.x_axis().bind_formatter_geometry(() => ('+moon(geometry[0])+', '+moon(geometry[1])+'))']
  stage_call(out,'child.synchronize_formatter_frame()',case['stages'][0])
 else:
  row=case['stages'][0]
  if kind=='latched_current_custom':out+=['child.set_ticks([2.0,3.0])']
  if kind!='same_name_rc':
   out+=['child.set_locator(@ticker.FixedLocator::new([4.0,7.0]).as_locator())',
         'child.set_minor_locator(@ticker.FixedLocator::new([5.0]).as_minor_locator())',
         'child.set_named_formatter(@ticker.FixedFormatter::new(["A","B"]).as_base_formatter())',
         'child.set_minor_named_formatter(@ticker.FuncFormatter::new((_, _) => "minor").as_base_formatter())']
  out+=['{']+assert_state(row['before'])+['}']
  out+=['let old_major = child.numeric_axis.locator().unwrap()','let old_minor = child.numeric_axis.minor_locator().unwrap()',
        'let old_major_formatter = child.numeric_axis.named_formatter().unwrap()','let old_minor_formatter = child.numeric_axis.minor_named_formatter().unwrap()',
        '@config.set_minor_ticks_visible(true, horizontal='+moon(direction=='x')+')']
  if kind!='same_name_rc':
   scale='@scale.symlog_scale(linthresh=2.0)'if kind=='changed_nonlog_rc'else'@scale.log_scale()'
   out+=['parent.set_'+direction+'_scale('+scale+')','parent.set_'+direction+'lim(10.0,20.0)']
  stage_call(out,'child.prepare_draw()',row)
  out+=['assert_eq([secondary_source_same_major(old_major, child.numeric_axis.locator().unwrap()), secondary_source_same_minor(old_minor, child.numeric_axis.minor_locator().unwrap()), physical_equal(old_major_formatter, child.numeric_axis.named_formatter().unwrap()), physical_equal(old_minor_formatter, child.numeric_axis.minor_named_formatter().unwrap())], '+moon(row['retains'])+')',
        'assert_true(physical_equal(old_major_formatter.axis().unwrap(), child.numeric_axis.formatter_axis_binding()))',
        'assert_true(physical_equal(old_minor_formatter.axis().unwrap(), child.numeric_axis.formatter_axis_binding()))']
 out+=['}'];return '\n'.join(out)

def render(payload):
 chunks=[HEADER]+[render_case(case)for case in payload['cases']]
 for start in range(0,len(payload['cases']),32):
  calls=['secondary_source_case_'+str(c['id'])+'() catch { error => fail('+moon('secondary source case '+str(c['id'])+' ['+c['label']+']: ')+' + error.to_string()) }'for c in payload['cases'][start:start+32]]
  chunks.append('///|\ntest "original secondary lifecycle group '+str(start//32)+'" {\n'+'\n'.join(calls)+'\n}')
 return formatted('\n\n'.join(chunks)+'\n')

PLACEMENT_HEADER='''// Generated from actual original child.transData positions; do not edit.

///|
fn secondary_placement_source_double(actual : Double, expected : Double) -> Unit raise {
  assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
}
'''
def render_placement(payload):
 chunks=[PLACEMENT_HEADER];calls=[]
 for case in payload['cases']:
  if case['kind']!='decreasing':continue
  row=case['stages'][0];state=row['state'];index=case['id'];values=[p[0]for p in row['input_positions']]
  view=state['view'];bounds=[p[0]for p in row['transformed_view_bbox']]
  out=['///|','fn secondary_placement_source_case_'+str(index)+'() -> Unit raise {',
       'let own = @axis.axis()','own.configure_function_scale(value => -value, value => -value)',
       'own.set_limits('+moon(view[0])+', '+moon(view[1])+')',
       'let transform = own.coordinate_transform()',
       'let values = '+moon(values),
       'let axis = @render.secondary_axis(@render.SecondaryLocation::Top, value => -value, value => -value, None, 6, None, Some(@ticker.FixedLocator::new(values).as_locator()), None,',
       'minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()),',
       'major_formatter_locations_provider=Some(() => @ticker.FormatterLocations::NdArray(@ticker.TickValues::from_array(values))),',
       'placement_provider=Some(() => @render.SecondaryPlacement::new('+moon(view[0])+', '+moon(view[1])+', transform)))',
       'let bundle = secondary_axis_bundle(axis, [], 10.0, 20.0)',
       'let placement = bundle.placement.unwrap()',
       'secondary_placement_source_double(placement.0, '+moon(bounds[0])+')',
       'secondary_placement_source_double(placement.1, '+moon(bounds[1])+')',
       'assert_eq(bundle.major.length(), '+str(len(values))+')']
  for i,p in enumerate(row['display_positions']):
   out+=['let fraction = secondary_tick_fraction(bundle, bundle.major['+str(i)+'].0, bundle.major['+str(i)+'].1, @ticker_scale.Scale::Linear, 10.0, 20.0).unwrap()',
         'secondary_placement_source_double('+moon(state['geometry'][0])+' + fraction * '+moon(state['geometry'][1])+', '+moon(p[0])+')']
  out+=['}'];chunks.append('\n'.join(out))
  calls.append('secondary_placement_source_case_'+str(index)+'() catch { error => fail('+moon('secondary placement source '+str(index)+': ')+' + error.to_string()) }')
 chunks.append('///|\ntest "original secondary decreasing placement group 0" {\n'+'\n'.join(calls)+'\n}')
 return formatted('\n\n'.join(chunks)+'\n')

def main():
 ap=argparse.ArgumentParser();ap.add_argument('ticker',nargs='?',type=Path,default=P);ap.add_argument('--check',action='store_true');args=ap.parse_args()
 load_secondary_source(args.ticker);payload=collect()
 outputs={ROOT/'testdata/secondary_lifecycle_reference.json':json.dumps(actual.json_safe(payload),ensure_ascii=False,indent=2,allow_nan=False)+'\n',
          ROOT/'scene/secondary_lifecycle_reference_wbtest.mbt':render(payload),
          ROOT/'backend/svg/secondary_placement_reference_wbtest.mbt':render_placement(payload)}
 for path,content in outputs.items():
  if args.check:
   if not path.exists()or path.read_text()!=content:raise SystemExit('generated secondary lifecycle differs: '+str(path))
  else:path.write_text(content)
 print(json.dumps({'check':args.check,**payload['counts'],'json_sha256':hashlib.sha256(outputs[ROOT/'testdata/secondary_lifecycle_reference.json'].encode()).hexdigest()}))
if __name__=='__main__':main()
