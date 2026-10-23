"""Complete original EngFormatter and actual Axis/draw/secondary references.

Controlled units/Text/renderer storage sinks and the inherited D31 NumPy affine
primitive are explicit. No Moon implementation generates expected outputs.
"""
from pathlib import Path
import argparse,ast,copy,functools,hashlib,json,math,numbers,sys,types,locale,warnings
from collections import Counter
from operator import attrgetter
import numpy as np
from formatter_reference_source import load_eng_formatter
from generate_basic_formatter_axis_reference import load as load_axis
from generate_auto_date_reference import formatted,moon
ROOT=Path(__file__).resolve().parents[1]
GROUP_SIZE=32


def load(path):
    ns,tr,Axes,Secondary,old=load_axis(path)
    old_rc=dict(ns['mpl'].rcParams)
    real=load_eng_formatter(path)
    for key,value in old_rc.items():
        if key not in real['mpl'].rcParams:real['mpl'].rcParams._set(key,value)
    for name in ['TickHelper','Formatter','NullFormatter','FixedFormatter','FuncFormatter','ScalarFormatter','EngFormatter','_api','mpl','cbook','locale','Integral','itertools']:
        ns[name]=real[name]
    ns['warning_messages']=real['external_warnings']
    tree=ast.parse(path.read_text())
    for name in ['Locator','NullLocator','FixedLocator','LinearLocator','MultipleLocator','IndexLocator','AutoMinorLocator','MaxNLocator','AutoLocator','LogLocator','SymmetricalLogLocator','AsinhLocator','LogitLocator']:
        node=next(n for n in tree.body if isinstance(n,ast.ClassDef)and n.name==name)
        exec(compile(ast.Module(body=[node],type_ignores=[]),str(path),'exec'),ns)
    ns['mticker']=types.SimpleNamespace(**{name:ns[name]for name in ['TickHelper','Formatter','NullFormatter','FixedFormatter','FuncFormatter','ScalarFormatter','EngFormatter','Locator','FixedLocator','NullLocator']})
    return ns,tr,Axes,Secondary,real


def collect(path):
    P=Path(path)
    ns,tr,Axes,Secondary,real=load(P)
    source=P.read_text();tree=ast.parse(source)
    eng=next(n for n in tree.body if isinstance(n,ast.ClassDef)and n.name=='EngFormatter')
    F=ns['EngFormatter'];events=[];rows=[]
    def clean(v):
     if isinstance(v,np.ndarray):return {'dtype':str(v.dtype),'values':[clean(x)for x in v]}
     if isinstance(v,(tuple,list)):return[clean(x)for x in v]
     if isinstance(v,(float,np.floating)):return {'type':type(v).__name__,'hex':float(v).hex(),'repr':repr(v)}
     if isinstance(v,(bool,np.bool_)):return {'type':type(v).__name__,'value':bool(v)}
     if isinstance(v,np.integer):return {'type':type(v).__name__,'value':str(v)}
     if isinstance(v,dict):return{k:clean(x)for k,x in v.items()}
     return v

    def state(f):return {'locs':clean(f._locs),'offset':clean(f.offset),'order':clean(f._orderOfMagnitude),'format':f._format,'auto':clean(f._useOffset),'axis':getattr(vars(f.axis).get('axes')if f.axis is not None else None,'label',None)}
    def new(**kw):return F(unit='Hz',useMathText=False,usetex=False,**kw)
    def obs(label,action,f=None,**meta):
     events.clear()
     with warnings.catch_warnings(record=True)as captured:
      warnings.simplefilter('always')
      try:value,error,message=clean(action()),None,None
      except Exception as exc:value,error,message=None,type(exc).__name__,str(exc)
     row=dict(label=label,value=value,error=error,message=message,events=events.copy(),unicode_minus=bool(ns['mpl'].rcParams['axes.unicode_minus']),runtime_warnings=[dict(category=type(w.message).__name__,message=str(w.message))for w in captured],**meta)
     if f is not None:row['state_after']=state(f)
     rows.append(row);return row
    class Provider:
     def __init__(self,fn):self.fn=fn;self.count=0
     def get_view_interval(self):
      self.count+=1;events.append('view'+str(self.count));return self.fn(self.count)
     def __getattr__(self,key):
      if key=='__name__':raise AttributeError(key)
      raise RuntimeError('unexpected axis capability '+key)

    for count in [0,1,3]:
     for offset in [False,True,1000000.]:
      for science in [False,True]:
       f=new(useOffset=offset);f.set_scientific(science);f.set_powerlimits((7,7));f.set_axis(Provider(lambda n:np.array([1000000.,1000004.])))
       values=np.array([1000000.,1000002.,1000004.][:count]);obs('nonempty preparation exact only-view dependencies',lambda:(f.set_locs(values),state(f))[1],f,count=count,offset=offset,science=science)
    for method,value in [('__call__',1000002.),('format_data',1000002.),('format_eng',1000002.),('format_data_short',.123456789),('format_data_short',1000002),('get_offset',None)]:
     f=new();obs('unbound method',lambda:getattr(f,method)()if value is None else getattr(f,method)(value),f,method=method,input=clean(value))
    for where in [1,2,3]:
     f=new(useOffset=True);f.set_axis(Provider(lambda n:(_ for _ in()).throw(ValueError('view stage '+str(n)))if n==where else np.array([1000000.,1000004.])))
     obs('view error preserves earlier state',lambda:f.set_locs(np.array([1000001.])),f,where=where)
    for view in [(0.,0.),(2.,2.),(1000004.,1000000.),(math.nan,1.),(1.,math.nan),(-math.inf,math.inf),(1.,math.inf)]:
     f=new(useOffset=False);f.set_axis(Provider(lambda n:np.array(view)));obs('raw view domain and sorted span',lambda:f.set_locs(np.array([1.,2.])),f,view=clean(view))
    for label,view in [('numpy int64 wrapped span',np.array([-2**63,2**63-1],dtype=np.int64)),('Python integer giant span',[-10**400,10**400]),('Python float ordinary span',[1000000.,1000004.])]:
     f=new(useOffset=False);f.set_axis(Provider(lambda n:view));obs('view origin transports scalar span before log',lambda:f.set_locs(np.array([0.,1.])),f,profile=label,view=clean(view))
    f=new(useOffset=True);f.set_axis(Provider(lambda n:np.array([1000000.,1000004.])if n==1 else np.array([0.,2000000.])));values=np.array([1000000.,1000002.,1000004.]);obs('first view midpoint versus independently read offset view',lambda:{'labels':f.format_ticks(values),'offset':f.get_offset()},f)
    for views in [[(1000000.,1000004.),(0.,1.)],[(0.,2000000.),(1000000.,1000004.)]]:
     f=new(useOffset=True);f.set_axis(Provider(lambda n:np.array(views[min(n-1,1)])));values=np.array([1000000.,1000002.,1000004.]);obs('first versus second live view independently controls stage',lambda:{'labels':f.format_ticks(values),'offset':f.get_offset()},f,views=clean(views))
    for dtype,view in [('float64',[1000000.,1000004.]),('int64',[1000000,1000004])]:
     f=new(useOffset=True);f.set_axis(Provider(lambda n:np.array(view,dtype=dtype)));obs('engineering midpoint retains view scalar origin',lambda:{'labels':f.format_ticks(np.array([1000000.,1000002.,1000004.])),'offset':f.get_offset()},f,dtype=dtype)
    for values in [[1000000.,1000002.,1000004.],[999999.,1000000.,1000002.,1000004.,1000005.],[1000000.0001,1000000.0002,1000000.0003,2000000.]]:
     f=new(useOffset=True);f.set_axis(Provider(lambda n:np.array([1000000.,1000004.])));obs('full raw locations retained before display filtering',lambda:{'labels':f.format_ticks(np.array(values)),'offset':f.get_offset()},f,values=clean(values))
    f=new(useOffset=True);f.set_axis(Provider(lambda n:np.array([1000000.,1000004.])));f.set_locs(np.array([1000000.,1000002.,1000004.]));before=state(f)
    obs('empty assignment retains caches but call reverts to engineering independent format',lambda:(f.set_locs([]),{'label':f(1000002.),'offset':f.get_offset(),'before':before})[1],f)
    f=new(useOffset=False);f._locs=np.array([1.,2.]);f._orderOfMagnitude=6
    obs('zero offset suppresses offset text regardless nonzero cached order',lambda:f.get_offset(),f)
    f=new(useOffset=False);f._locs=np.array([1.,2.]);f.set_useOffset(math.nan)
    obs('offset read can fail late without reading axis',lambda:f.get_offset(),f)
    # Real Bbox interval getter rather than a copied binding algorithm.
    axispath=P.with_name('axis.py');axis_tree=ast.parse(axispath.read_text());axisnode=next(n for n in axis_tree.body if isinstance(n,ast.ClassDef)and n.name=='Axis')
    factory=next(n for n in axis_tree.body if isinstance(n,ast.FunctionDef)and n.name=='_make_getset_interval');exec(compile(ast.Module(body=[factory],type_ignores=[]),str(axispath),'exec'),ns)
    Axis=type(Axes().xaxis);getters={name:ns['_make_getset_interval']('view','viewLim','interval'+name)[0]for name in ['x','y']}
    Axes.viewLim=property(lambda a:a._viewLim)
    def getview(self):events.append(self.axes.label+'.view.'+self.axis_name);return getters[self.axis_name](self)
    Axis.get_view_interval=getview
    basepath=P.parent/'axes/_base.py';basenode=next(n for n in ast.parse(basepath.read_text()).body if isinstance(n,ast.ClassDef)and n.name=='_AxesBase')
    for name in ['get_xaxis_transform','get_yaxis_transform']:
     method=next(n for n in basenode.body if isinstance(n,ast.FunctionDef)and n.name==name);exec(compile(ast.Module(body=[method],type_ignores=[]),str(basepath),'exec'),ns);setattr(Axes,name,ns[name])
    # Complete original Axis.draw, with only renderer/Text/layout storage sinks.
    draw=copy.deepcopy(next(n for n in axisnode.body if isinstance(n,ast.FunctionDef)and n.name=='draw'));draw.decorator_list=[];exec(compile(ast.Module(body=[draw],type_ignores=[]),str(axispath),'exec'),ns)
    class Renderer:
     def open_group(self,*a,**k):pass
     def close_group(self,*a,**k):pass
    class Text:
     def __init__(self,name):self.name=name;self.text=''
     def draw(self,r):events.append(self.name+'.draw')
     def set_text(self,t):self.text=t;events.append((self.name+'.text',t))
    def preparedraw(axis):
     axis.get_visible=lambda:True;axis.get_gid=lambda:None;axis._get_ticklabel_bboxes=lambda t,r:([],[])
     axis._update_label_position=lambda r:events.append('label.position');axis.label=Text('axislabel');axis.offsetText=Text('offset');axis._update_offset_text_position=lambda*a:None
     old=axis._get_tick
     def tick(*a,**k):
      t=old(*a,**k);t.draw=lambda r:events.append(('tick.draw',float(t.get_loc()),t.label1.text));return t
     axis._get_tick=tick

    def drawresult(axis,f):
     preparedraw(axis)
     def trace(frame,event,arg):
      if event=='call'and frame.f_code.co_filename==str(P)and frame.f_locals.get('self')is f and frame.f_code.co_name in ['set_locs','__call__','get_offset','format_data']:
       events.append('Eng.'+frame.f_code.co_name)
      return trace
     sys.settrace(trace)
     try:ns['draw'](axis,Renderer())
     finally:sys.settrace(None)
     return {'offset':axis.offsetText.text,'state':state(f)}
    for name in ['x','y']:
     for profile in ['auto','no-offset','same-major-minor','minor-mutates-offset','minor-mutates-unit','Null-after-state','late-places-error']:
      axes=Axes(label='draw-'+name);getattr(axes,'set_'+name+'lim')((1000000.,1000004.));axis=axes._axis_map[name];axis.__name__=name+'axis'
      f=new(useOffset=profile!='no-offset');axis.set_major_formatter(f);axis.set_major_locator(ns['FixedLocator'](np.array([999999.,1000000.,1000002.,1000004.,1000005.])));axis.set_minor_locator(ns['FixedLocator'](np.array([1000001.])))
      if profile=='same-major-minor':axis.set_minor_formatter(f)
      elif profile=='minor-mutates-offset':axis.set_minor_formatter(ns['FuncFormatter'](lambda v,p:(f.set_useOffset(2000000.),'minor')[1]))
      elif profile=='minor-mutates-unit':axis.set_minor_formatter(ns['FuncFormatter'](lambda v,p:(setattr(f,'unit','s'),'minor')[1]))
      elif profile=='late-places-error':axis.set_minor_formatter(ns['FuncFormatter'](lambda v,p:(setattr(f,'places',-1),'minor')[1]))
      else:axis.set_minor_formatter(ns['NullFormatter']())
      if profile=='Null-after-state':
       f.set_locs(np.array([1000000.,1000002.,1000004.]));axis.set_major_locator(ns['NullLocator']());axis.set_minor_locator(ns['NullLocator']())
      obs('complete original Axis.draw engineering offset lifecycle',lambda:drawresult(axis,f),f,name=name,profile=profile)
    for name in ['x','y']:
     a,b=Axes(label='first'),Axes(label='second');getattr(a,'set_'+name+'lim')((1000000.,1000004.));getattr(b,'set_'+name+'lim')((0.,2000000.));aa,bb=a._axis_map[name],b._axis_map[name]
     f=new(useOffset=True);aa.set_major_formatter(f);firstcopy=copy.copy(f);bb.major,bb.minor=aa.major,aa.minor
     group=ns['Grouper']();group.join(b,a);a._shared_axes[name]=b._shared_axes[name]=group;bb.set_major_formatter(f);external=copy.copy(f);values=np.array([1000000.,1000002.,1000004.])
     obs('actual shared setter last owner versus old copy',lambda:{'live':f.format_ticks(values),'offset':f.get_offset(),'copy':firstcopy.format_ticks(values),'copyoffset':firstcopy.get_offset()},f,name=name)
     figure=ns['FigureBase']();figure._axobservers=types.SimpleNamespace(process=lambda*a:None);figure._root_figure=types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda*a:None));figure._remove_axes(b,owners=[[a,b]])
     obs('actual Figure removal rebind versus detached external',lambda:{'live':f.format_ticks(values),'offset':f.get_offset(),'external':external.format_ticks(values),'externaloffset':external.get_offset()},f,name=name)
    for name in ['x','y']:
     parent=Axes(label='parent');getattr(parent,'set_'+name+'lim')((1000000.,1000004.));child=Secondary(parent,name);child.label='secondary';child._viewLim.intervalx=(0.,1.);child._viewLim.intervaly=(0.,1.);axis=child._axis;axis.__name__=name+'axis';f=new(useOffset=True);axis.set_major_formatter(f);values=np.array([2000005.,2000009.,2000013.])
     obs('secondary actual own Bbox before synchronization',lambda:{'labels':f.format_ticks(values),'offset':f.get_offset(),'view':axis.get_view_interval()},f,name=name)
     child._set_lims();obs('secondary original set_lims synchronization',lambda:{'labels':f.format_ticks(values),'offset':f.get_offset(),'view':axis.get_view_interval()},f,name=name)
     getattr(parent,'set_'+name+'lim')((1000000.,1000100.));obs('secondary parent mutation remains stale before sync',lambda:{'labels':f.format_ticks(values),'offset':f.get_offset(),'view':axis.get_view_interval()},f,name=name)
     child._set_lims();obs('secondary original sync after parent mutation',lambda:{'labels':f.format_ticks(values),'offset':f.get_offset(),'view':axis.get_view_interval()},f,name=name)
    # Cursor paths inherit Scalar, not engineering units; original complete transforms.
    for name in ['x','y']:
     axes=Axes(bounds=(40.,60.,1000.,800.),label='cursor');getattr(axes,'set_'+name+'lim')((0.,1.));axis=axes._axis_map[name];axis.__name__=name+'axis';f=new(useOffset=True);axis.set_major_formatter(f)
     for value in [.123456789,1000000,np.int64(9007199254740993),np.ma.masked]:
      obs('inherited cursor uses existing physical context and no engineering unit',lambda:f.format_data_short(value),f,name=name,input='masked'if value is np.ma.masked else repr(value))
    # Inherited data-short on dummy exercises source singleton bbox default.
    f=new();f.create_dummy_axis();obs('dummy inherited short fallback',lambda:f.format_data_short(.123456789),f)
    # Locale is forced false only by constructor, then inherited mutable state applies
    # to offset-path/cursor, not engineering format_data or no-offset __call__.
    saved=locale._override_localeconv.copy();locale._override_localeconv.update(decimal_point=',',thousands_sep='.',grouping=[3,0])
    try:
     f=new(useOffset=True);f.set_useLocale(True);f.set_axis(Provider(lambda n:np.array([1000000.,1000004.])));f.set_locs(np.array([1000000.,1000002.,1000004.]));obs('later locale override splits engineering data and numeric offset path',lambda:{'call':f(1000001.5),'data':f.format_data(1234.5),'short':f.format_data_short(1234.5),'offset':f.get_offset()},f)
    finally:locale._override_localeconv.clear();locale._override_localeconv.update(saved)
    for minus in [True,False]:
     ns['mpl'].rcParams['axes.unicode_minus']=minus;f=F(unit='unit-hyphen-',places=2,useMathText=False,usetex=False)
     obs('call and offset fix_minus differ from direct format_data',lambda:{'call':f(-1.),'data':f.format_data(-1.)},f,minus_flag=minus)
    basepath=P.parent/'axes/_base.py';tree=ast.parse(basepath.read_text());base=next(n for n in tree.body if isinstance(n,ast.ClassDef)and n.name=='_AxesBase')
    axispath=P.with_name('axis.py');axisnode=next(n for n in ast.parse(axispath.read_text()).body if isinstance(n,ast.ClassDef)and n.name=='Axis');Axis=type(Axes().xaxis)
    for name in ['_get_axis_name','_get_shared_axes','_set_axes_scale']:
     method=next(n for n in axisnode.body if isinstance(n,ast.FunctionDef)and n.name==name);exec(compile(ast.Module(body=[method],type_ignores=[]),str(axispath),'exec'),ns);setattr(Axis,name,ns[name])
    Axis.set_ticks_position=lambda *a,**k:None;Axis.set_label_position=lambda*a,**k:None;Axis.set_ticks=lambda*a,**k:None
    class ArtistSink:
     def set_figure(self,figure):self._parent_figure=figure
    class Patch:
     zorder=-1
     def get_animated(self):return False
     def get_zorder(self):return -1
     def draw(self,r):pass
    class Spines:
     def __getitem__(self,key):return self
     def set_visible(self,v):pass
     def values(self):return []
    ns.update(ArtistSink=ArtistSink,attrgetter=attrgetter,mimage=types.SimpleNamespace(_draw_list_compositing_images=lambda*a:None))
    methods=[]
    for name in ['set_figure','_set_lim_and_transforms','_update_transScale','get_position','_set_position','set_axes_locator','get_axes_locator','get_aspect','apply_aspect','get_xaxis_transform','get_yaxis_transform','_update_title_position','draw']:
     method=copy.deepcopy(next(n for n in base.body if isinstance(n,ast.FunctionDef)and n.name==name))
     if name=='draw':method.decorator_list=[]
     methods.append(method)
    skel=ast.ClassDef(name='OriginalBaseMethods',bases=[ast.Name(id='ArtistSink',ctx=ast.Load())],keywords=[],body=methods,decorator_list=[])
    exec(compile(ast.fix_missing_locations(ast.Module(body=[skel],type_ignores=[])),str(basepath),'exec'),ns)
    class FullBase(ns['OriginalBaseMethods'],Axes):
     def __init__(self,figure,bounds,**kwargs):
      Axes.__init__(self)
      self._position=tr['Bbox'].from_bounds(*bounds);self._originalPosition=self._position.frozen()
      self._aspect='auto';self._box_aspect=None;self._adjustable='box';self._anchor='C';self._axes_locator=None
      self._stale_viewlims={'x':False,'y':False};self.callbacks=types.SimpleNamespace(process=lambda*a:None)
      self.set_figure(figure);self._update_transScale();self.spines=Spines()
      self.patch=Patch();self.axison=True;self._frameon=False;self._autotitlepos=None;self._rasterization_zorder=None
      self.title=self._left_title=self._right_title=types.SimpleNamespace(get_text=lambda:'')
     def get_figure(self,**kwargs):return self._parent_figure
     def get_visible(self):return True
     def get_gid(self):return None
     def get_children(self):return[self.patch]
     def get_animated(self):return False
     def get_zorder(self):return 0
     def _unstale_viewLim(self):pass
     def set_xticks(self,*a,**k):pass
     def set_yticks(self,*a,**k):pass
     def set_xscale(self,value,**kwargs):self.xaxis._set_axes_scale(value,**kwargs)
     def set_yscale(self,value,**kwargs):self.yaxis._set_axes_scale(value,**kwargs)
     def set_xlim(self,bounds,**kwargs):return self.xaxis._set_lim(*bounds,emit=False,auto=False)
     def set_ylim(self,bounds,**kwargs):return self.yaxis._set_lim(*bounds,emit=False,auto=False)
     def autoscale_view(self,**kwargs):raise AssertionError('linear/function default NS must not autoscale')
    ns.update(_AxesBase=FullBase,functools=functools,numbers=numbers,Axis=Axis,transforms=types.SimpleNamespace(**tr),Transform=tr['Transform'])
    locator=next(n for n in tree.body if isinstance(n,ast.ClassDef)and n.name=='_TransformedBoundsLocator');exec(compile(ast.Module(body=[locator],type_ignores=[]),str(basepath),'exec'),ns)
    spath=P.parent/'axes/_secondary_axes.py';node=next(n for n in ast.parse(spath.read_text()).body if isinstance(n,ast.ClassDef)and n.name=='SecondaryAxis');exec(compile(ast.Module(body=[node],type_ignores=[]),str(spath),'exec'),ns)
    fpath=P.with_name('figure.py');fclass=next(n for n in ast.parse(fpath.read_text()).body if isinstance(n,ast.ClassDef)and n.name=='FigureBase');layout=next(n for n in fclass.body if isinstance(n,ast.FunctionDef)and n.name=='_get_draw_artists');exec(compile(ast.Module(body=[layout],type_ignores=[]),str(fpath),'exec'),ns)
    class Renderer:
     def open_group(self,*a,**k):pass
     def close_group(self,*a,**k):pass
    physical_rows=[]
    for name in ['x','y']:
     for mapping in ['identity','affine']:
      fig=types.SimpleNamespace(transSubfigure=tr['BboxTransformTo'](tr['Bbox'].from_bounds(0.,0.,1000.,800.)),canvas=types.SimpleNamespace(is_saving=lambda:False),suppressComposite=None)
      parent=Axes(bounds=(40.,60.,100.,80.),label='physical-parent');parent.get_figure=lambda **k:fig
      getattr(parent,'set_'+name+'lim')((0.,1.))
      functions=(lambda x:x,lambda x:x)if mapping=='identity'else(lambda x:2*x+5,lambda x:(x-5)/2)
      child=ns['SecondaryAxis'](parent,name,'top'if name=='x'else'right',functions);child.label='physical-secondary';child._axis.__name__=name+'axis'
      f=new();child._axis.set_major_formatter(f)
      def snap(stage,value):
       captured={}
       def trace(frame,event,arg):
        if event=='return'and frame.f_code.co_filename==str(P)and frame.f_code.co_name=='format_data_short'and frame.f_locals.get('self')is f:captured.update({k:clean(frame.f_locals[k])for k in ['delta','screen_xy','neighbor_values','fmt']if k in frame.f_locals})
        return trace
       import sys
       sys.settrace(trace)
       try:label=f.format_data_short(value)
       finally:sys.settrace(None)
       physical_rows.append(dict(name=name,mapping=mapping,stage=stage,bbox=clean(child.bbox.bounds),active=clean(child._position.bounds),original=clean(child._originalPosition.bounds),view=clean(child._axis.get_view_interval()),label=label,locals=captured))
      snap('complete constructor before sync',.123456789)
      child.apply_aspect();value=.123456789 if mapping=='identity'else 6.123456789
      snap('direct apply_aspect(None)',value)
      parent.apply_aspect=lambda *a:None;parent.get_axes_locator=lambda:None;parent.get_children=lambda:[child];parent.get_animated=lambda:False;parent.get_zorder=lambda:0
      fig.patch=Patch();fig._localaxes=[parent];fig.get_children=lambda:[fig.patch,parent]
      ns['_get_draw_artists'](fig,Renderer())
      snap('original Figure layout locator position',value)
      child.draw(Renderer())
      snap('complete original child draw',value)
      child.apply_aspect()
      snap('direct apply_aspect(None) after frame',value)
    for row in physical_rows:
        rows.append(dict(label='complete secondary physical geometry stages',value=row,error=None,message=None,events=[]))

    assert len(physical_rows)==20
    for row in rows[-20:]:row['label']='complete original Eng secondary physical stage'
    # Full original Secondary Axis visibility transforms can mutate live offset
    # parameters after all labels but before the final get_offset query.
    for name in ['x','y']:
     fig=types.SimpleNamespace(transSubfigure=tr['BboxTransformTo'](tr['Bbox'].from_bounds(0.,0.,1000.,800.)),canvas=types.SimpleNamespace(is_saving=lambda:False),suppressComposite=None)
     parent=Axes(label='inverse-parent');parent.get_figure=lambda **k:fig;getattr(parent,'set_'+name+'lim')((1000000.,1000004.))
     f=new(useOffset=True)
     def inverse(values):f.unit='after';events.append('inverse changes engineering unit');return(values-5)/2
     child=ns['SecondaryAxis'](parent,name,'top'if name=='x'else'right',(lambda values:2*values+5,inverse));child.label='inverse-secondary';axis=child._axis
     axis.set_major_locator(ns['FixedLocator'](np.array([2000005.,2000009.,2000013.])));axis.set_minor_locator(ns['NullLocator']());axis.set_major_formatter(f);child._set_lims();f.unit='Hz'
     obs('actual secondary inverse transform mutates unit before final engineering offset',lambda:drawresult(axis,f),f,name=name)
    return {'host_profile':real['scalar_host_profile'],'runtime':{'python':sys.version.split()[0],'numpy':np.__version__},'source_hashes':{**real['source_hashes'],**{str(p.relative_to(P.parent)):hashlib.sha256(p.read_bytes()).hexdigest()for p in [P.with_name('axis.py'),P.with_name('cbook.py'),P.with_name('figure.py'),P.parent/'axes/_base.py',P.with_name('transforms.py'),P.parent/'axes/_secondary_axes.py']}},'eng_class_hash':hashlib.sha256(ast.get_source_segment(source,eng).encode()).hexdigest(),'observations':rows,'counts':dict(total=len(rows),**Counter(r['error']or'success'for r in rows))}


def quote(value):return json.dumps(value,ensure_ascii=False)
def number(value):
    if isinstance(value,dict):value=float.fromhex(value['hex'])
    return moon(float(value))
def array(values):return '['+', '.join(number(x)for x in values)+']'
def boolean(value):
    while isinstance(value,dict):value=value['value']
    return bool(value)
def scalar(value):
    if isinstance(value,dict):
        kind=value['type']
        if kind in ['float','float64']:return '@ticker.ScalarNumber::'+('Number'if kind=='float'else'NumpyFloat64')+'('+number(value)+')'
        if kind=='int64':return '@ticker.ScalarNumber::NumpyInt64('+value['value']+'L)'
        if kind in ['bool','bool_']:return '@ticker.ScalarNumber::'+('Boolean'if kind=='bool'else'NumpyBool')+'('+str(boolean(value)).lower()+')'
        raise AssertionError(value)
    if isinstance(value,bool):return '@ticker.ScalarNumber::Boolean('+str(value).lower()+')'
    if isinstance(value,float):return '@ticker.ScalarNumber::Number('+number(value)+')'
    if not isinstance(value,int):raise AssertionError(value)
    return '@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string('+quote(str(value))+'))'


def emit(payload):
    tests=[];white=[]
    def ctor(offset=False,name='f',unit='Hz'):
        return '  let '+name+' = @ticker.EngFormatter::new(unit='+quote(unit)+', use_offset=Some('+scalar(offset)+'), use_math_text=Some(false), usetex=Some(false))\n  '+name+'.as_scalar_formatter().set_power_limits(@ticker.ScalarPowerLimits::Integers([@bigint.BigInt::from_int(-5), @bigint.BigInt::from_int(6)]))\n'
    def bind(view='[1000000.0, 1000004.0]',carrier=None):
        if carrier is None:carrier='@ticker.FormatterViewInterval::NdArray(@ticker.TickValues::from_array('+view+'))'
        return '  let binding = @ticker.FormatterAxisBinding::new()\n  binding.set_view_interval('+carrier+')\n  f.set_axis(Some(binding))\n'
    def check(row,expr,expected=None):
        if row['error']:
            return '  let failed = try { ignore('+expr+'); false } catch {\n    @core.DataError::InvalidTicks(message~) => { assert_eq(message, '+quote(row['error']+': '+row['message'])+'); true }\n    _ => false\n  }\n  assert_true(failed)\n'
        if expected is None:expected=row['value']
        if expected is None:return '  '+expr+'\n'
        return '  assert_eq('+expr+', '+(quote(expected)if isinstance(expected,str)else'['+', '.join(quote(v)for v in expected)+']')+')\n'
    def state(expected,name='f'):
        parent=name+'.as_scalar_formatter()';offset=expected['offset']
        if isinstance(offset,dict)and offset.get('hex')=='nan':
            code='  match '+parent+'.offset() { Some(@ticker.ScalarNumber::Number(value)) => assert_true(value.is_nan()); _ => fail("expected raw Python NaN offset") }\n'
        else:code='  assert_eq('+parent+'.offset(), Some('+scalar(offset)+'))\n'
        code+='  assert_eq('+parent+'.order_of_magnitude(), '+scalar(expected['order'])+')\n  assert_eq('+parent+'.format_pattern(), '+quote(expected['format'])+')\n  assert_eq('+parent+'.get_use_offset(), '+str(boolean(expected['auto'])).lower()+')\n'
        locs=expected['locs']['values']if isinstance(expected['locs'],dict)else expected['locs']
        code+='  assert_eq('+name+'.locations().length(), '+str(len(locs))+')\n'
        for i,x in enumerate(locs):
            if isinstance(x,dict)and x.get('hex')=='nan':code+='  assert_true('+name+'.locations().get('+str(i)+').is_nan())\n'
            else:code+='  assert_eq('+name+'.locations().get('+str(i)+').reinterpret_as_uint64(), ('+number(x)+').reinterpret_as_uint64())\n'
        return code
    def axis_scene(name,lo=1000000.,hi=1000004.):
        return '  let figure = @scene.figure(width=320, height=200)\n  let axes = figure.axes()\n  axes.set_x_limits('+number(lo)+', '+number(hi)+')\n  axes.set_y_limits('+number(lo)+', '+number(hi)+')\n  axes.set_x_locator(@ticker.NullLocator::new().as_locator())\n  axes.set_y_locator(@ticker.NullLocator::new().as_locator())\n  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n  let axis = axes.'+name+'_axis()\n'
    fixture='''  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
'''
    for case,row in enumerate(payload['observations']):
        label=row['label'];v=row['value'];name=row.get('name','x');body=''
        if label=='nonempty preparation exact only-view dependencies':
            body=ctor(row['offset'])+'  f.as_scalar_formatter().set_scientific('+str(row['science']).lower()+')\n  f.as_scalar_formatter().set_power_limits(@ticker.ScalarPowerLimits::Integers([@bigint.BigInt::from_int(7), @bigint.BigInt::from_int(7)]))\n  let reads = @ref.Ref(0)\n  let binding = @ticker.FormatterAxisBinding::new()\n  binding.bind_view_interval(() => { reads.val += 1; @ticker.FormatterViewInterval::NdArray(@ticker.TickValues::from_array([1000000.0, 1000004.0])) })\n  f.set_axis(Some(binding))\n  f.set_locs_view(@ticker.TickValues::from_array('+array([1e6,1e6+2,1e6+4][:row['count']])+'))\n  assert_eq(reads.val, '+str(len(row['events']))+')\n'
        elif label=='unbound method':
            body=ctor();method=row['method'];inp=row['input']
            if method=='get_offset':expr='f.get_offset()'
            elif method=='format_data_short'and isinstance(inp,int):expr='f.format_data_short_value('+scalar(inp)+')'
            else:expr='f.'+('call'if method=='__call__'else method)+'('+number(inp)+')'
            body+=check(row,expr)
        elif label=='view error preserves earlier state':
            body=ctor(True)+'''  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    if reads.val == '''+str(row['where'])+''' { raise @core.DataError::InvalidTicks(message="ValueError: view stage '''+str(row['where'])+'''") }
    @ticker.FormatterViewInterval::NdArray(@ticker.TickValues::from_array([1000000.0, 1000004.0]))
  })
  f.set_axis(Some(binding))
'''+check(row,'f.set_locs_view(@ticker.TickValues::from_array([1000001.0]))')+'  assert_eq(reads.val, '+str(row['where'])+')\n'
        elif label in ['raw view domain and sorted span','view origin transports scalar span before log']:
            body=ctor(False);view=row['view'];carrier=None
            if label=='view origin transports scalar span before log':
                if row['profile']=='numpy int64 wrapped span':carrier='@ticker.FormatterViewInterval::NdArray(@ticker.TickValues::from_int64_array([-9223372036854775807L - 1L, 9223372036854775807L]))'
                elif row['profile']=='Python integer giant span':carrier='@ticker.FormatterViewInterval::Integers(['+', '.join('@bigint.BigInt::from_string('+quote(str(x))+')'for x in view)+'])'
                else:carrier='@ticker.FormatterViewInterval::Sequence('+array(view)+')'
                values='[0.0, 1.0]'
            else:values='[1.0, 2.0]'
            body+=bind(array(view)if carrier is None else'',carrier)+check(row,'f.set_locs_view(@ticker.TickValues::from_array('+values+'))')
        elif label in ['first view midpoint versus independently read offset view','first versus second live view independently controls stage']:
            views=row.get('views',[[1000000.,1000004.],[0.,2000000.]])
            body=ctor(True)+'''  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => { reads.val += 1; @ticker.FormatterViewInterval::NdArray(@ticker.TickValues::from_array(if reads.val == 1 { '''+array(views[0])+''' } else { '''+array(views[1])+''' })) })
  f.set_axis(Some(binding))
'''+check(row,'f.format_ticks_view(@ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]))',v['labels'])+'  assert_eq(reads.val, 2)\n  assert_eq(f.get_offset(), '+quote(v['offset'])+')\n'
        elif label=='engineering midpoint retains view scalar origin':
            carrier='@ticker.FormatterViewInterval::NdArray(@ticker.TickValues::from_int64_array([1000000L, 1000004L]))'if row['dtype']=='int64'else None
            body=ctor(True)+bind(carrier=carrier)+check(row,'f.format_ticks_view(@ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]))',v['labels'])+'  assert_eq(f.get_offset(), '+quote(v['offset'])+')\n'
        elif label=='full raw locations retained before display filtering':
            body=ctor(True)+bind()+check(row,'f.format_ticks_view(@ticker.TickValues::from_array('+array(row['values'])+'))',v['labels'])+'  assert_eq(f.get_offset(), '+quote(v['offset'])+')\n'
        elif label=='empty assignment retains caches but call reverts to engineering independent format':
            body=ctor(True)+bind()+'  f.set_locs_view(@ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]))\n'+state(v['before'])+'  f.set_locs([])\n  assert_eq(f.call(1000002.0), '+quote(v['label'])+')\n  assert_eq(f.get_offset(), '+quote(v['offset'])+')\n'
        elif label in ['zero offset suppresses offset text regardless nonzero cached order','offset read can fail late without reading axis']:
            body=ctor(False)+'  let live : Array[Double] = []\n  f.set_locs(live)\n  live.push(1.0)\n  live.push(2.0)\n'
            if label.startswith('zero'):body+='  f.as_scalar_formatter().set_order_of_magnitude(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(6)))\n'
            else:body+='  f.as_scalar_formatter().set_use_offset(Some(@ticker.ScalarNumber::Number(0.0 / 0.0)))\n'
            body+=check(row,'f.get_offset()')
        elif label=='complete original Axis.draw engineering offset lifecycle':
            profile=row['profile'];body=axis_scene(name)+ctor(profile!='no-offset')+'  axis.set_named_formatter(f.as_base_formatter())\n  axis.set_locator(@ticker.FixedLocator::new([999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0]).as_locator())\n  axis.set_minor_locator(@ticker.FixedLocator::new([1000001.0]).as_minor_locator())\n'
            if profile=='same-major-minor':body+='  axis.set_minor_named_formatter(f.as_base_formatter())\n'
            elif profile.startswith('minor-mutates')or profile=='late-places-error':
                mutate={'minor-mutates-offset':'f.as_scalar_formatter().set_use_offset(Some(@ticker.ScalarNumber::Number(2000000.0)))','minor-mutates-unit':'f.set_unit("s")','late-places-error':'f.set_places(Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(-1))))'}[profile]
                body+='  axis.set_minor_named_formatter(@ticker.FuncFormatter::new((_, _) => { '+mutate+'; "minor" }).as_base_formatter())\n'
            else:body+='  axis.set_minor_named_formatter(@ticker.NullFormatter::new().as_base_formatter())\n'
            if profile=='Null-after-state':body+='  f.set_locs_view(@ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]))\n  axis.set_locator(@ticker.NullLocator::new().as_locator())\n  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n'
            if row['error']:body+=check(row,'figure.to_svg_checked()')
            else:
                body+='  let svg = figure.to_svg_checked()\n'
                if v['offset']:body+='  assert_eq(svg.split('+quote('>'+v['offset']+'<')+').count() - 1, 1)\n'
                else:body+='  assert_eq(f.get_offset(), "")\n'
                for text,count in Counter(event[2]for event in row['events']if isinstance(event,(tuple,list))and event[0]=='tick.draw').items():
                    if text:body+='  assert_eq(svg.split('+quote('>'+text+'<')+').count() - 1, '+str(count)+')\n'
                if not any(isinstance(event,(tuple,list))and event[0]=='tick.draw'for event in row['events']):body+='  assert_true(!svg.contains(">−2<"))\n'
        elif label in ['actual shared setter last owner versus old copy','actual Figure removal rebind versus detached external']:
            body='''  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_'''+name+'''=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.'''+name+'''_axis()
  let b = second.'''+name+'''_axis()
  a.set_limits(1000000.0, 1000004.0)
  b.set_limits(0.0, 2000000.0)
  a.bind_view_interval(() => { (1000000.0, 1000004.0) })
  b.bind_view_interval(() => { (0.0, 2000000.0) })
'''+ctor(True)+'''  first.set_'''+name+'''_named_formatter(f.as_base_formatter())
  let old = f.copy()
  second.set_'''+name+'''_named_formatter(f.as_base_formatter())
  let external = f.copy()
  let values = @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0])
'''
            if label.startswith('actual Figure'):
                body+='  second.remove()\n'+check(row,'f.format_ticks_view(values)',v['live'])+'  assert_eq(f.get_offset(), '+quote(v['offset'])+')\n'+check(row,'external.format_ticks_view(values)',v['external'])+'  assert_eq(external.get_offset(), '+quote(v['externaloffset'])+')\n  assert_eq(f.axis(), Some(a.formatter_axis_binding()))\n  assert_eq(external.axis(), Some(b.formatter_axis_binding()))\n  ignore(old)\n'
            else:body+=check(row,'f.format_ticks_view(values)',v['live'])+'  assert_eq(f.get_offset(), '+quote(v['offset'])+')\n'+check(row,'old.format_ticks_view(values)',v['copy'])+'  assert_eq(old.get_offset(), '+quote(v['copyoffset'])+')\n  assert_eq(f.axis(), Some(b.formatter_axis_binding()))\n  ignore(external)\n'
        elif label in ['secondary actual own Bbox before synchronization','secondary original set_lims synchronization','secondary parent mutation remains stale before sync','secondary original sync after parent mutation']:
            body=axis_scene(name)+ctor(True)+'  let secondary = axes.secondary_'+name+'axis(value => value * 2.0 + 5.0, value => (value - 5.0) / 2.0)\n  secondary.set_named_formatter(f.as_base_formatter())\n'
            if not label.startswith('secondary actual'):body+='  secondary.apply_aspect()\n'
            if 'parent mutation'in label:body+='  axes.set_'+name+'_limits(1000000.0, 1000100.0)\n'
            if label=='secondary original sync after parent mutation':body+='  secondary.apply_aspect()\n'
            body+=check(row,'f.format_ticks_view(@ticker.TickValues::from_array([2000005.0, 2000009.0, 2000013.0]))',v['labels'])+'  assert_eq(f.get_offset(), '+quote(v['offset'])+')\n  ignore(axis)\n'
        elif label=='inherited cursor uses existing physical context and no engineering unit':
            body='  let axis = @axis.axis()\n  axis.set_limits(0.0, 1.0)\n  axis.bind_formatter_geometry(() => { ('+('40.0, 1000.0'if name=='x'else'60.0, 800.0')+') })\n'+ctor(True)+'  axis.set_named_formatter(f.as_base_formatter())\n'
            inp=row['input']
            if inp=='masked':expr='f.format_data_short_masked()'
            elif inp.startswith('np.int64'):expr='f.format_data_short_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L))'
            elif inp=='1000000':expr='f.format_data_short_value(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(1000000)))'
            else:expr='f.format_data_short(0.123456789)'
            body+=check(row,expr)
        elif label=='dummy inherited short fallback':body=ctor()+'  f.create_dummy_axis()\n'+check(row,'f.format_data_short(0.123456789)')
        elif label=='later locale override splits engineering data and numeric offset path':
            body=ctor(True)+bind()+'  @config.set_numeric_locale(@config.NumericLocale::new(decimal_point=",", thousands_sep=".", grouping=[3, 0]))\n  f.as_scalar_formatter().set_use_locale(Some(true))\n  f.set_locs_view(@ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]))\n'
            for method,value,field in [('call','1000001.5','call'),('format_data','1234.5','data'),('format_data_short','1234.5','short'),('get_offset','','offset')]:body+='  assert_eq(f.'+method+'('+value+'), '+quote(v[field])+')\n'
        elif label=='call and offset fix_minus differ from direct format_data':
            body=ctor(unit='unit-hyphen-')+'  f.set_places(Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(2))))\n  assert_eq(f.call(-1.0), '+quote(v['call'])+')\n  assert_eq(f.format_data(-1.0), '+quote(v['data'])+')\n'
        elif label=='complete original Eng secondary physical stage':
            from generate_scalar_axis_reference import emit as scalar_axis_emit
            clone=dict(row,label='complete secondary physical geometry stages')
            _,physical,_,_=scalar_axis_emit(dict(observations=[clone],inverse_profiles=[]))
            import re
            match=re.search(r'test [^\n]+ \{\n(.*)\n\}',physical,re.S);body=match[1]+'\n'
            body=body.replace('@ticker.ScalarFormatter::new(','@ticker.EngFormatter::new(unit="Hz",').replace(', use_locale=Some(false)','').replace('    use_locale=Some(false),\n','').replace('use_offset=Some(@ticker.ScalarNumber::Boolean(true))','use_offset=Some(@ticker.ScalarNumber::Boolean(false))')
            # Whitebox scope has the same scene imports as the D31 fixture;
            # the copied fixture has its own Bool cleanup and needs no BigInt.
            white.append((case,label,body));continue
        elif label=='actual secondary inverse transform mutates unit before final engineering offset':
            body=axis_scene(name)+ctor(True)+'''  let secondary = axes.secondary_'''+name+'''axis(value => value * 2.0 + 5.0, value => { f.set_unit("after"); (value - 5.0) / 2.0 })
  secondary.set_locator(@ticker.FixedLocator::new([2000005.0, 2000009.0, 2000013.0]).as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  f.set_unit("Hz")
  let svg = figure.to_svg_checked()
  assert_eq(svg.split('''+quote('>'+v['offset']+'<')+''').count() - 1, 1)
  assert_eq(f.get_offset(), '''+quote(v['offset'])+''')
  assert_eq(f.unit(), "after")
  ignore(axis)
'''
        else:raise AssertionError(label)
        if 'state_after'in row:body+=state(row['state_after'])
        tests.append((case,label,fixture+'  @config.set_unicode_minus('+str(row.get('unicode_minus',True)).lower()+')\n'+body))
    def grouped(cases,suffix):
        code='// Complete original EngFormatter and actual Axis lifecycle.\n\n'
        for case,label,body in cases:code+='///|\n// Original source case '+str(case)+': '+label+'\nfn eng_axis_'+suffix+'_case_'+str(case)+'() -> Unit raise {\n'+body+'}\n\n'
        groups=0
        for start in range(0,len(cases),GROUP_SIZE):
            items=cases[start:start+GROUP_SIZE];groups+=1
            code+='///|\ntest '+quote('Eng original '+suffix+' axis cases '+str(items[0][0])+'..'+str(items[-1][0]))+' {\n'
            for case,_,_ in items:code+='  try { eng_axis_'+suffix+'_case_'+str(case)+'() } catch { error => fail('+quote('Eng original axis case '+str(case)+' failed: ')+' + error.to_string()) }\n'
            code+='}\n\n'
        return code,groups
    code,n=grouped(tests,'scene');wb,m=grouped(white,'physical')
    return code,wb,n,m,len(tests),len(white)


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    payload=collect(args.ticker);code,wb,n,m,regular,physical=emit(payload)
    payload['scope']='Complete original Eng/Scalar/Formatter with real _api/deprecation, original Axis._set_formatter/_update_ticks/draw/generated Bbox intervals, original Grouper/Figure._remove_axes and complete Secondary/base/Figure physical methods. Explicit identity units/Text/GUI sinks; inherited D31 native affine primitive profile, no Moon-algorithm oracle or GUI/LAPACK parity claim.'
    payload['counts'].update(query_group_size=GROUP_SIZE,scene_case_count=regular,physical_case_count=physical,registered_scene_groups=n,registered_physical_groups=m,registered_test_count=n+m)
    outputs={ROOT/'testdata/eng_formatter_axis_reference.json':json.dumps(payload,ensure_ascii=False,indent=2)+'\n',ROOT/'scene/eng_formatter_axis_reference_test.mbt':formatted(code),ROOT/'scene/eng_formatter_axis_reference_wbtest.mbt':formatted(wb)}
    for path,content in outputs.items():
        if args.check:
            if not path.exists()or path.read_text()!=content:raise SystemExit('stale reference '+str(path))
        else:path.write_text(content)
    print(payload['counts'],'checked'if args.check else'generated')
if __name__=='__main__':main()
