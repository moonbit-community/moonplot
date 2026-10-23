"""Actual shared Axis scale installation, Grouper ordering and complete draw.

The original GridSpec.subplots/sharex/sharey/_set_axes_scale/_remove_axes and
Axis.draw bodies run against controlled graph, view and Text/renderer sinks.
No Moon implementation or translated installation model supplies expectations.
"""
from pathlib import Path
import argparse,ast,copy,hashlib,json,math,types,warnings,weakref
import numpy as np
from generate_scale_lifecycle_reference import load as load_lifecycle
from generate_scale_defaults_reference import moon
from generate_auto_date_reference import formatted
ROOT=Path(__file__).resolve().parents[1]
P=ROOT/'.moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py'
HASHES={'cbook.py':'e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643',
 'gridspec.py':'df8395306765d9b93f98d6b2e867836a9b2b0786cf5b39a26103309c4331afde',
 'axes/_base.py':'ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b',
 'figure.py':'b440ab0a5be03cb39b13529a2fec497d2d96deb083e3e56d6220593e3ec567da'}
PROFILES={'linear':('LinearScale',{}),'log':('LogScale',{}),'symlog':('SymmetricalLogScale',{'linthresh':1.}),
 'asinh':('AsinhScale',{'linear_width':1.}),'logit':('LogitScale',{})}

def load(path):
 ns,Axis=load_lifecycle(path);ns['weakref']=weakref
 for file,sha in HASHES.items():
  if hashlib.sha256((path.parent/file).read_bytes()).hexdigest()!=sha:raise ValueError('fixed source differs '+file)
 def cls(file,name,methods=None):
  node=copy.deepcopy(next(n for n in ast.parse((path.parent/file).read_bytes()).body if isinstance(n,ast.ClassDef)and n.name==name))
  if methods is not None:
   node.bases=[];node.decorator_list=[];node.body=[n for n in node.body if isinstance(n,ast.FunctionDef)and n.name in methods]
  exec(compile(ast.Module(body=[node],type_ignores=[]),str(path.parent/file),'exec'),ns)
 cls('cbook.py','Grouper');cls('axes/_base.py','_AxesBase',{'sharex','sharey'});cls('gridspec.py','GridSpecBase',{'subplots'});cls('figure.py','FigureBase',{'_remove_axes'})
 for name in ['FixedLocator','LinearLocator']:
  node=next(n for n in ast.parse(path.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name==name)
  exec(compile(ast.Module(body=[node],type_ignores=[]),str(path),'exec'),ns)
 for name in ['_is_decade','_is_close_to_int']:
  node=next(n for n in ast.parse(path.read_bytes()).body if isinstance(n,ast.FunctionDef)and n.name==name)
  exec(compile(ast.Module(body=[node],type_ignores=[]),str(path),'exec'),ns)
 ns['mticker'].FixedLocator=ns['FixedLocator']
 return ns,Axis

def fixtures(ns,Axis):
 class Axes(ns['_AxesBase']):
  def __init__(self,figure,sharex=None,sharey=None):
   self.figure=figure;self.index=len(figure.created);self.name='rectilinear';self.label='axes'+str(self.index)
   self._sharex=self._sharey=None;self._shared_axes=figure.groups;self._twinned_axes=figure.twins
   self._axis_names=['x','y'];self.xaxis=Axis(self.label+'.x','x');self.yaxis=Axis(self.label+'.y','y');self._axis_map={'x':self.xaxis,'y':self.yaxis}
   for axis in self._axis_map.values():axis.axes=self;axis.view=(.01,.99)
   if sharex is not None:self.sharex(sharex)
   if sharey is not None:self.sharey(sharey)
  def get_xlim(self):return self.xaxis.view
  def get_ylim(self):return self.yaxis.view
  def set_xlim(self,first,last,**kwargs):self.xaxis.view=(first,last)
  def set_ylim(self,first,last,**kwargs):self.yaxis.view=(first,last)
  def get_autoscalex_on(self):return False
  def get_autoscaley_on(self):return False
  def _label_outer_xaxis(self,**kwargs):pass
  def _label_outer_yaxis(self,**kwargs):pass
  def _update_transScale(self):self.figure.events.append(['transform',self.index])
  def autoscale_view(self,**kwargs):self.figure.events.append(['autoscale',self.index,kwargs])
 class Figure(ns['FigureBase']):
  def __init__(self):
   self.created=[];self.groups={name:ns['Grouper']()for name in ['x','y']};self.twins=ns['Grouper']();self.events=[]
   self._axobservers=types.SimpleNamespace(process=lambda*a:None);self._root_figure=types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda*a:None))
  def add_subplot(self,spec,**kwargs):
   axes=Axes(self,**kwargs);self.created.append(axes);return axes
 class Grid(ns['GridSpecBase']):
  def __init__(self,figure,rows,columns):self.figure=figure;self._nrows=rows;self._ncols=columns
  def __getitem__(self,index):return index
 return Figure,Grid

def reset(ns,x,y):
 rc=ns['mpl'].rcParams
 for key,value in [('xtick.minor.visible',x),('ytick.minor.visible',y),('_internal.classic_mode',False),('axes.formatter.useoffset',True),('axes.formatter.use_mathtext',False),('axes.formatter.use_locale',False),('text.usetex',False),('axes.unicode_minus',True),('axes.formatter.min_exponent',0),('axes.formatter.offset_threshold',4),('axes.formatter.limits',[-5,6])]:rc[key]=value

def handles(axis):return [axis.major.locator,axis.minor.locator,axis.major.formatter,axis.minor.formatter]

def snapshot(figure,axis_name,members,label):
 current=[ax._axis_map[axis_name]for ax in members];first=current[0]
 for axis in current:axis.view=(axis.axes.index+2.,axis.axes.index+3.)
 return {'stage':label,'members':[ax.index for ax in members],
  'classes':[type(v).__name__ for v in handles(first)],
  'flags':[first.isDefault_majloc,first.isDefault_minloc,first.isDefault_majfmt,first.isDefault_minfmt],
  'shared_slots':[all(handles(axis)[slot]is handles(first)[slot]for axis in current)for slot in range(4)],
  'shared_major_holder':all(axis.major is first.major for axis in current),
  'shared_minor_holder':all(axis.minor is first.minor for axis in current),
  'formatter_owners':[formatter.axis.axes.index for formatter in [first.major.formatter,first.minor.formatter]],
  'locator_owner':first.major.locator.axis.axes.index,
  'locator_owner_view':list(first.major.locator.axis.get_view_interval()),
  'events':copy.deepcopy(figure.events)}

def draw(ns,Axis,axis):
 ap=P.with_name('axis.py');anode=next(n for n in ast.parse(ap.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='Axis')
 for name in ['_tick_group_visible','_update_ticks','get_majorticklocs','get_minorticklocs','get_major_ticks','get_minor_ticks','draw']:
  node=copy.deepcopy(next(n for n in anode.body if isinstance(n,ast.FunctionDef)and n.name==name));node.decorator_list=[]
  exec(compile(ast.Module(body=[node],type_ignores=[]),str(ap),'exec'),ns)
  setattr(Axis,name,staticmethod(ns[name])if name=='_tick_group_visible'else ns[name])
 tree=ast.parse(P.with_name('transforms.py').read_bytes());node=next(n for n in tree.body if isinstance(n,ast.FunctionDef)and n.name=='_interval_contains_close')
 exec(compile(ast.Module(body=[node],type_ignores=[]),str(P.with_name('transforms.py')),'exec'),ns);ns['mtransforms']._interval_contains_close=ns['_interval_contains_close']
 class Text:
  def __init__(self):self.text=''
  def set_text(self,text):self.text=text
  def draw(self,renderer):pass
 class Tick:
  def __init__(self):self.label1=Text();self.label2=Text();self.value=0.
  def update_position(self,value):self.value=value
  def get_loc(self):return self.value
  def draw(self,renderer):visible.append([float(self.value),self.label1.text])
 class Renderer:
  def open_group(self,*a,**k):pass
  def close_group(self,*a,**k):pass
 visible=[];axis._major_tick_kw={};axis._minor_tick_kw={};axis.majorTicks=[];axis.minorTicks=[];axis.remove_overlapping_locs=True
 axis._get_tick=lambda major:Tick();axis._copy_tick_props=lambda*a:None;axis.get_visible=lambda:True;axis.get_gid=lambda:None;axis._get_ticklabel_bboxes=lambda*a:([],[]);axis._update_label_position=lambda*a:None;axis._update_offset_text_position=lambda*a:None;axis.label=Text();axis.offsetText=Text()
 axis.draw(Renderer())
 return {'visible':visible,'offset':axis.offsetText.text}

def collect():
 ns,Axis=load(P);Figure,Grid=fixtures(ns,Axis);cases=[]
 specifications=[(name,profile,mode,'Figure')for name in ['x','y']for profile in PROFILES for mode in ['all','row','col']]
 specifications += [(name,'log',mode,'SubFigure')for name in ['x','y']for mode in ['all','row','col']]
 for name,profile,mode,host in specifications:
  reset(ns,False,True);figure=Figure();axes=list(Grid(figure,2,2).subplots(sharex=mode if name=='x'else'none',sharey=mode if name=='y'else'none',squeeze=False).flat)
  requester=axes[0];group=figure.groups[name];members=list(group.get_siblings(requester));target=requester._axis_map[name]
  scale_class,kwargs=PROFILES[profile];value=ns[scale_class](None,**kwargs);figure.events.clear();target._set_axes_scale(value)
  stages=[snapshot(figure,name,members,'installed')];previous=handles(target);external_locator=copy.copy(target.major.locator);external_formatter=copy.copy(target.major.formatter)
  members[-1]._axis_map[name].set_minor_formatter(ns['NullFormatter']());stages.append(snapshot(figure,name,members,'direct member override'))
  figure.events.clear();target._set_axes_scale(value);stage=snapshot(figure,name,members,'repeated same scale');stage['all_handles_replaced']=all(a is not b for a,b in zip(previous,handles(target)));stages.append(stage)
  owner=target.major.formatter.axis.axes;active=axes.copy();figure._remove_axes(owner,owners=[active]);remaining=list(group.get_siblings(next(ax for ax in members if ax is not owner)))
  stage=snapshot(figure,name,remaining,'removed last owner');stage['external_formatter_owner']=external_formatter.axis.axes.index;stage['external_locator_owner']=external_locator.axis.axes.index;stage['external_locator_view']=list(external_locator.axis.get_view_interval());stages.append(stage)
  cases.append({'id':len(cases),'kind':'shared','axis':name,'profile':profile,'mode':mode,'host':host,'rows':2,'columns':2,'requester':0,'removed':owner.index,'stages':stages})
 for name in ['x','y']:
  for profile in PROFILES:
   reset(ns,False,False);figure=Figure();axes=list(Grid(figure,1,2).subplots(sharex=name=='x',sharey=name=='y',squeeze=False).flat);axis=axes[0]._axis_map[name];scale_class,kwargs=PROFILES[profile];axis._set_axes_scale(ns[scale_class](None,**kwargs))
   for ax in axes:ax._axis_map[name].view=(.01,.99)
   raw=np.array([.01,.2,.5,.8,.99]);axis.set_major_locator(ns['FixedLocator'](raw));axis.set_minor_locator(ns['NullLocator']())
   expected=draw(ns,Axis,axis);cases.append({'id':len(cases),'kind':'draw','axis':name,'profile':profile,'raw':raw.tolist(),'value':expected})
 for name in ['x','y']:
  for profile in PROFILES:
   for explicit in [False,True]:
    reset(ns,False,False);figure=Figure();axes=list(Grid(figure,1,1).subplots(squeeze=False).flat);axis=axes[0]._axis_map[name]
    old=axis.major.locator.nonsingular(-np.inf,np.inf);figure.events.clear();cls,kwargs=PROFILES[profile];axis._set_axes_scale(ns[cls](None,**kwargs));new=axis.major.locator.nonsingular(-np.inf,np.inf)
    cases.append({'id':len(cases),'kind':'schedule','axis':name,'profile':profile,'explicit':explicit,'old_default_limits':list(old),'new_default_limits':list(new),'autoscale_requested':any(event[0]=='autoscale'for event in figure.events),'events':copy.deepcopy(figure.events)})
 for name in ['x','y']:
  reset(ns,False,False);figure=Figure();axes=list(Grid(figure,1,3).subplots(sharex='all',sharey='all',squeeze=False).flat);axis=axes[0]._axis_map[name]
  for ax in axes:ax._axis_map[name].view=(1.,10.)
  axis.set_major_locator(ns['FixedLocator']([1.,10.]));axis.set_major_formatter(ns['FixedFormatter'](['one','ten']))
  def stage(label):
   return {'stage':label,'geometries':[ax._axis_map[name].get_scale()for ax in axes],'same_major_holder':all(ax._axis_map[name].major is axis.major for ax in axes),'flags':[axis.isDefault_majloc,axis.isDefault_minloc,axis.isDefault_majfmt,axis.isDefault_minfmt],'locator_owner':axis.major.locator.axis.axes.index,'formatter_owner':axis.major.formatter.axis.axes.index}
  stages=[stage('shared fixed ticks')];removed=axes[1];active=axes.copy();figure._remove_axes(removed,owners=[active]);stages.append(stage('removed group member'))
  removed_axis=removed._axis_map[name];removed_axis.view=(100.,200.);removed_axis._set_axes_scale(ns['LogScale'](None));stages.append(stage('removed scale replaces aliased defaults'))
  removed_axis.set_major_locator(ns['FixedLocator']([100.]));removed_axis.set_major_formatter(ns['FixedFormatter'](['detached']));stages.append(stage('removed fixed ticks and labels'))
  for ax in active:ax._axis_map[name].view=(5.,15.);ax._axis_map[name].set_minor_locator(ns['NullLocator']())
  raw=axis.get_majorticklocs();labels=axis.major.formatter.format_ticks(raw);visible=[draw(ns,Axis,ax._axis_map[name])for ax in active]
  cases.append({'id':len(cases),'kind':'detached','axis':name,'profile':'log','stages':stages,'raw_ticks':raw.tolist(),'raw_labels':labels,'survivor_view':[5.,15.],'removed_view':list(removed_axis.view),'visible':visible})
 return {'source_hashes':{**ns['source_hashes'],**HASHES},'cases':cases,'counts':{'cases':len(cases),'source_stages':sum(len(c.get('stages',[]))or 1 for c in cases),'registered_groups':math.ceil(len(cases)/32)},'scope':'Actual complete original shared/default/scale bodies and Grouper; view, autoscale scheduling, Text and renderer sinks. No complete constructor/clear/units or secondary lifecycle claim; no Moon algorithm oracle.'}

def scale(profile):return {'linear':'@scale.linear_scale()','log':'@scale.log_scale()','symlog':'@scale.symlog_scale(linthresh=1.0)','asinh':'@scale.asinh_scale()','logit':'@scale.logit_scale()'}[profile]

def setup(case):
 text='  let figure = @scene.figure(width=400, height=300)\n'
 if case.get('host')=='SubFigure':
  text+='  let outer = figure.grid_spec(1, 1)\n  let sub = figure.add_subfigure(outer.cell_spec(0, 0))\n  let grid = figure.grid_spec(2, 2)\n  let axes = sub.subplots_with_grid(grid.with_shared_axes('
 else:text+='  let grid = figure.grid_spec(2, 2)\n  let axes = figure.subplots_with_grid(grid.with_shared_axes('
 mode={'all':'All','row':'Row','col':'Column'}[case['mode']];text+=('@gridspec.ShareMode::'+mode if case['axis']=='x'else'@gridspec.ShareMode::None')+', '+('@gridspec.ShareMode::'+mode if case['axis']=='y'else'@gridspec.ShareMode::None')+'))\n'
 for name in ['x','y']:text+='  for axes in axes { axes.set_'+name+'_limits(0.01, 0.99) }\n'
 return text

def checks(stage,name):
 members=stage['members'];first='axes['+str(members[0])+'].'+name+'_axis()';text=''
 for i in members:text+='  axes['+str(i)+'].'+name+'_axis().bind_view_interval(() => ('+str(i+2)+'.0, '+str(i+3)+'.0))\n'
 for i in members:
  axis='axes['+str(i)+'].'+name+'_axis()'
  text+='  assert_eq(shared_scale_major_class('+axis+'.locator().unwrap()), '+moon(stage['classes'][0])+')\n  assert_eq(shared_scale_minor_class('+axis+'.minor_locator().unwrap()), '+moon(stage['classes'][1])+')\n'
  text+='  assert_eq(shared_scale_formatter_class('+axis+'.named_formatter().unwrap()), '+moon(stage['classes'][2])+')\n  assert_eq(shared_scale_formatter_class('+axis+'.minor_named_formatter().unwrap()), '+moon(stage['classes'][3])+')\n'
  text+='  assert_eq(['+axis+'.is_default_locator(), '+axis+'.is_default_locator(minor=true), '+axis+'.is_default_formatter(), '+axis+'.is_default_formatter(minor=true)], '+moon(stage['flags'])+')\n'
  for minor in [False,True]:
   getter='minor_named_formatter'if minor else'named_formatter';owner=stage['formatter_owners'][1 if minor else 0]
   if i!=members[0]:text+='  assert_true(physical_equal('+axis+'.'+getter+'().unwrap(), '+first+'.'+getter+'().unwrap()))\n'
   text+='  assert_eq('+axis+'.'+getter+'().unwrap().axis(), Some(axes['+str(owner)+'].'+name+'_axis().formatter_axis_binding()))\n'
  if i!=members[0]:text+='  assert_true(shared_scale_same_locator('+axis+'.locator().unwrap(), '+first+'.locator().unwrap()))\n  assert_true(shared_scale_same_minor('+axis+'.minor_locator().unwrap(), '+first+'.minor_locator().unwrap()))\n'
 text+='  assert_eq(shared_scale_locator_view('+first+'.locator().unwrap()), ('+', '.join(str(int(v))+'.0'for v in stage['locator_owner_view'])+'))\n'
 return text

def render(payload):
 header='''// Generated by scripts/generate_shared_scale_defaults_reference.py; do not edit.

///|
fn shared_scale_major_class(value : @ticker.Locator) -> String {
  match value {
    @ticker.Locator::NamedAuto(_) => "AutoLocator"
    @ticker.Locator::NamedLog(_) => "LogLocator"
    @ticker.Locator::NamedSymLog(_) => "SymmetricalLogLocator"
    @ticker.Locator::NamedAsinh(_) => "AsinhLocator"
    @ticker.Locator::NamedLogit(_) => "LogitLocator"
    _ => "unexpected"
  }
}

///|
fn shared_scale_minor_class(value : @ticker.MinorLocator) -> String {
  match value {
    @ticker.MinorLocator::Null(_) => "NullLocator"
    @ticker.MinorLocator::NamedAutoMinor(_) => "AutoMinorLocator"
    @ticker.MinorLocator::NamedLog(_) => "LogLocator"
    @ticker.MinorLocator::NamedSymLog(_) => "SymmetricalLogLocator"
    @ticker.MinorLocator::NamedAsinh(_) => "AsinhLocator"
    @ticker.MinorLocator::NamedLogit(_) => "LogitLocator"
    _ => "unexpected"
  }
}

///|
fn shared_scale_formatter_class(value : @ticker.BaseFormatter) -> String {
  if value.scalar_formatter() is Some(_) { "ScalarFormatter" }
  else if value.log_formatter_sci_notation() is Some(_) { "LogFormatterSciNotation" }
  else if value.logit_formatter() is Some(_) { "LogitFormatter" }
  else if value.null_formatter() is Some(_) { "NullFormatter" }
  else { "unexpected" }
}

///|
fn shared_scale_same_minor(left : @ticker.MinorLocator, right : @ticker.MinorLocator) -> Bool {
  match (left, right) {
    (@ticker.MinorLocator::Null(a), @ticker.MinorLocator::Null(b)) => physical_equal(a, b)
    (@ticker.MinorLocator::NamedAutoMinor(a), @ticker.MinorLocator::NamedAutoMinor(b)) => physical_equal(a, b)
    (@ticker.MinorLocator::NamedLog(a), @ticker.MinorLocator::NamedLog(b)) => physical_equal(a, b)
    (@ticker.MinorLocator::NamedSymLog(a), @ticker.MinorLocator::NamedSymLog(b)) => physical_equal(a, b)
    (@ticker.MinorLocator::NamedAsinh(a), @ticker.MinorLocator::NamedAsinh(b)) => physical_equal(a, b)
    (@ticker.MinorLocator::NamedLogit(a), @ticker.MinorLocator::NamedLogit(b)) => physical_equal(a, b)
    _ => false
  }
}

///|
fn shared_scale_same_locator(left : @ticker.Locator, right : @ticker.Locator) -> Bool {
  match (left, right) {
    (@ticker.Locator::NamedAuto(a), @ticker.Locator::NamedAuto(b)) => physical_equal(a, b)
    (@ticker.Locator::NamedLog(a), @ticker.Locator::NamedLog(b)) => physical_equal(a, b)
    (@ticker.Locator::NamedSymLog(a), @ticker.Locator::NamedSymLog(b)) => physical_equal(a, b)
    (@ticker.Locator::NamedAsinh(a), @ticker.Locator::NamedAsinh(b)) => physical_equal(a, b)
    (@ticker.Locator::NamedLogit(a), @ticker.Locator::NamedLogit(b)) => physical_equal(a, b)
    _ => false
  }
}

///|
fn shared_scale_locator_view(value : @ticker.Locator) -> (Double, Double) raise @core.DataError {
  match value {
    @ticker.Locator::NamedAuto(value) => value.view_interval_provider().unwrap()()
    @ticker.Locator::NamedLog(value) => value.view_interval_provider().unwrap()()
    @ticker.Locator::NamedSymLog(value) => value.view_interval_provider().unwrap()()
    @ticker.Locator::NamedAsinh(value) => value.view_interval_provider().unwrap()()
    @ticker.Locator::NamedLogit(value) => value.view_interval_provider().unwrap()()
    _ => abort("expected named default")
  }
}
'''
 bodies=[]
 for case in payload['cases']:
  name=case['axis'];body='  let saved = @config.rc_params()\n  defer {\n    @config.set_classic_mode(saved.classic_mode())\n    @config.set_minor_ticks_visible(saved.minor_ticks_visible())\n    @config.set_minor_ticks_visible(saved.minor_ticks_visible(horizontal=false), horizontal=false)\n    @config.set_formatter_use_offset(saved.formatter_use_offset())\n    @config.set_formatter_use_math_text(saved.formatter_use_math_text())\n    @config.set_formatter_use_locale(saved.formatter_use_locale())\n    @config.set_text_usetex(saved.text_usetex())\n    @config.set_unicode_minus(saved.unicode_minus())\n    @config.set_formatter_min_exponent(saved.formatter_min_exponent())\n    @config.set_formatter_offset_threshold(saved.formatter_offset_threshold())\n    try! @config.set_formatter_limits(saved.formatter_limits())\n  }\n  @config.set_classic_mode(false)\n  @config.set_minor_ticks_visible(false)\n  @config.set_minor_ticks_visible('+('true'if case['kind']=='shared'else'false')+', horizontal=false)\n  @config.set_formatter_use_offset(true)\n  @config.set_formatter_use_math_text(false)\n  @config.set_formatter_use_locale(false)\n  @config.set_text_usetex(false)\n  @config.set_unicode_minus(true)\n  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))\n  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))\n  @config.set_formatter_limits([@bigint.BigInt::from_int(-5), @bigint.BigInt::from_int(6)])\n'
  if case['kind']=='shared':
   body+=setup(case)+'  let axis_handles = axes.map(axes => axes.'+name+'_axis())\n  axes[0].set_'+name+'_scale('+scale(case['profile'])+')\n'+checks(case['stages'][0],name)
   body+='  let previous_locator = axes[0].'+name+'_axis().locator().unwrap()\n  let previous_formatter = axes[0].'+name+'_axis().named_formatter().unwrap()\n  let external_formatter = previous_formatter.copy()\n'
   target=case['stages'][0]['members'][-1];body+='  axes['+str(target)+'].'+name+'_axis().set_minor_named_formatter(@ticker.NullFormatter::new().as_base_formatter())\n'+checks(case['stages'][1],name)
   body+='  axes[0].set_'+name+'_scale('+scale(case['profile'])+')\n  assert_true(!shared_scale_same_locator(previous_locator, axes[0].'+name+'_axis().locator().unwrap()))\n  assert_true(!physical_equal(previous_formatter, axes[0].'+name+'_axis().named_formatter().unwrap()))\n'+checks(case['stages'][2],name)
   body+='  axes['+str(case['removed'])+'].remove()\n'+checks(case['stages'][3],name)
   stage=case['stages'][3];body+='  assert_eq(external_formatter.axis(), Some(axes['+str(stage['external_formatter_owner'])+'].'+name+'_axis().formatter_axis_binding()))\n  assert_eq(shared_scale_locator_view(previous_locator), ('+', '.join(str(int(v))+'.0'for v in stage['external_locator_view'])+'))\n'
   for index in range(4):body=body.replace('axes['+str(index)+'].'+name+'_axis()', 'axis_handles['+str(index)+']')
  elif case['kind']=='draw':
   body+='  let figure = @scene.figure(width=400, height=300)\n  let axes = figure.axes()\n  axes.set_x_limits(0.01, 0.99)\n  axes.set_y_limits(0.01, 0.99)\n  axes.set_'+name+'_scale('+scale(case['profile'])+')\n  let axis = axes.'+name+'_axis()\n  let raw = '+moon(case['raw'])+'\n  axis.set_locator(@ticker.FixedLocator::new(raw).as_locator())\n  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n  let labels = axis.tick_labels_checked(raw)\n  assert_eq(labels, '+moon([v[1]for v in case['value']['visible']])+')\n  let svg = figure.to_svg_checked()\n'
   for label in sorted(set(v[1]for v in case['value']['visible']if v[1])):body+='  assert_true(svg.contains('+moon(label)+'))\n'
   if case['value']['offset']:body+='  assert_true(svg.contains('+moon(case['value']['offset'])+'))\n'
  elif case['kind']=='schedule':
   body+='  let figure = @scene.figure()\n  let axes = figure.axes()\n  let axis = axes.'+name+'_axis()\n'
   if case['explicit']:body+='  axis.set_limits(0.98, 0.02)\n'
   else:body+='  axis.set_auto_limits(0.98, 0.02)\n'
   body+='  axes.set_'+name+'_scale('+scale(case['profile'])+')\n'
   if case['autoscale_requested']and not case['explicit']:body+='  // D35 records the force call; D37 executes its full source body.\n  // With no data, the already-mutated provisional viewport is retained.\n'
   body+='  let view = axis.current_view_limits().unwrap()\n  assert_eq((view.lower(), view.upper()), (0.98, 0.02))\n'
  else:
   body+='  let figure = @scene.figure()\n  let axes = figure.subplots(1, 3, share_x=true, share_y=true)\n  axes[0].set_'+name+'_limits(1.0, 10.0)\n  axes[0].set_'+name+'_ticks([1.0, 10.0])\n  axes[0].set_'+name+'_tick_labels(["one", "ten"])\n  axes[1].remove()\n  axes[1].set_'+name+'_limits(100.0, 200.0)\n  axes[1].set_'+name+'_scale(@scale.log_scale())\n  axes[1].set_'+name+'_ticks([100.0])\n  axes[1].set_'+name+'_tick_labels(["detached"])\n  axes[0].set_'+name+'_limits(5.0, 15.0)\n  axes[0].'+name+'_axis().set_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n'
   for index in [0,2]:
    axis='axes['+str(index)+'].'+name+'_axis()';body+='  assert_eq('+axis+'.ticks(), Some('+moon(case['raw_ticks'])+'))\n  assert_eq('+axis+'.tick_labels_checked('+moon(case['raw_ticks'])+'), '+moon(case['raw_labels'])+')\n  assert_true(!'+axis+'.is_default_locator())\n  assert_true(!'+axis+'.is_default_formatter())\n  assert_true(!'+axis+'.scale().is_log())\n  let view_'+str(index)+' = '+axis+'.limits().unwrap()\n  assert_eq((view_'+str(index)+'.lower(), view_'+str(index)+'.upper()), (5.0, 15.0))\n'
   body+='  let removed_view = axes[1].'+name+'_axis().limits().unwrap()\n  assert_eq((removed_view.lower(), removed_view.upper()), (100.0, 200.0))\n  let svg = figure.to_svg_checked()\n  assert_true(!svg.contains(">detached<"))\n  assert_true(!svg.contains(">one<"))\n  assert_true(!svg.contains(">ten<"))\n'
  bodies.append(body)
 for i,body in enumerate(bodies):header+='\n///|\nfn shared_scale_defaults_case_'+str(i)+'() -> Unit raise {\n'+body+'}\n'
 for start in range(0,len(bodies),32):header+='\n///|\ntest "actual shared scale defaults group '+str(start//32)+'" {\n'+''.join('  shared_scale_defaults_case_'+str(i)+'()\n'for i in range(start,min(start+32,len(bodies))))+'}\n'
 return formatted(header)

def main():
 p=argparse.ArgumentParser();p.add_argument('--check',action='store_true');args=p.parse_args();payload=collect();data=json.dumps(payload,indent=2,allow_nan=False)+'\n';tests=render(payload)
 for path,text in [(ROOT/'testdata/shared_scale_defaults_reference.json',data),(ROOT/'scene/shared_scale_defaults_reference_test.mbt',tests)]:
  if args.check:
   if path.read_text()!=text:raise SystemExit('stale '+str(path))
  else:path.write_text(text)
 print(('checked'if args.check else'generated')+' '+json.dumps(payload['counts']))
if __name__=='__main__':main()
