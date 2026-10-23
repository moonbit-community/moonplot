"""Complete original ScalarFormatter / Axis draw and physical reference.

The shared source loader supplies real API/deprecation/font dependencies. Original
Bbox/transform Python bodies use the stated pre-existing NumPy affine primitive;
raw np.linalg.inv and independent exact-ratio inverse profiles are both recorded.
"""
from pathlib import Path
import argparse,ast,copy,hashlib,json,math,itertools,locale,sys,types,functools,numbers
from operator import attrgetter
from fractions import Fraction
import numpy as np
from formatter_reference_source import load_scalar_formatter
from generate_basic_formatter_axis_reference import load as load_axis
from generate_auto_date_reference import formatted,moon
ROOT=Path(__file__).resolve().parents[1]


def load(path):
    ns,tr,Axes,Secondary,old=load_axis(path)
    old_rc=dict(ns['mpl'].rcParams)
    real=load_scalar_formatter(path)
    for key,value in old_rc.items():
        if key not in real['mpl'].rcParams:real['mpl'].rcParams._set(key,value)
    for name in ['TickHelper','Formatter','NullFormatter','FixedFormatter','FuncFormatter','ScalarFormatter','_api','mpl','cbook','locale','Integral','itertools']:
        ns[name]=real[name]
    ns['warning_messages']=real['external_warnings']
    tree=ast.parse(path.read_text())
    for name in ['Locator','NullLocator','FixedLocator','LinearLocator','MultipleLocator','IndexLocator','AutoMinorLocator','MaxNLocator','AutoLocator','LogLocator','SymmetricalLogLocator','AsinhLocator','LogitLocator']:
        node=next(n for n in tree.body if isinstance(n,ast.ClassDef)and n.name==name)
        exec(compile(ast.Module(body=[node],type_ignores=[]),str(path),'exec'),ns)
    ns['mticker']=types.SimpleNamespace(**{name:ns[name]for name in ['TickHelper','Formatter','NullFormatter','FixedFormatter','FuncFormatter','ScalarFormatter','Locator','FixedLocator','NullLocator']})
    return ns,tr,Axes,Secondary,real


def collect(path):
    P=Path(path)
    ns,tr,Axes,Secondary,real=load(P)
    F=ns['ScalarFormatter'];rows=[];events=[]
    def new(**kw):return F(useMathText=False,useLocale=False,usetex=False,**kw)
    def clean(v):
     if isinstance(v,np.ndarray):return dict(dtype=str(v.dtype),values=[clean(x)for x in v])
     if isinstance(v,(list,tuple)):return[clean(x)for x in v]
     if isinstance(v,(float,np.floating)):return dict(type=type(v).__name__,repr=repr(v),hex=float(v).hex())
     if isinstance(v,np.integer):return dict(type=type(v).__name__,value=str(v))
     if isinstance(v,dict):return{k:clean(x)for k,x in v.items()}
     return v
    def state(f):return dict(locs=clean(f._locs),offset=clean(f.offset),order=clean(f._orderOfMagnitude),format=f._format)
    def obs(label,action,**meta):
     events.clear()
     try:value,error,message=clean(action()),None,None
     except Exception as e:value,error,message=None,type(e).__name__,str(e)
     row=dict(label=label,value=value,error=error,message=message,events=events.copy(),**meta);rows.append(row);return row
    class Provider:
     def __init__(self,fn):self.fn=fn;self.count=0
     def get_view_interval(self):
      self.count+=1;events.append('view'+str(self.count));return self.fn(self.count)
     def __getattr__(self,key):raise RuntimeError('unexpected axis capability:'+key)
    # Silent __name__ miss must be the normal Python getattr default for Dummy path.
    class ViewOnly:
     def __init__(self,fn):self.fn=fn;self.count=0
     def get_view_interval(self):self.count+=1;events.append('view'+str(self.count));return self.fn(self.count)
    for count in [0,1,2,4]:
     for offset in [True,False,1000000.]:
      for science,power in [(True,None),(False,None),(True,(3,3))]:
       f=new(useOffset=offset);f.set_scientific(science)
       if power:f.set_powerlimits(power)
       axis=Provider(lambda i:np.array([1000000.,1000004.]));f.set_axis(axis)
       locs=np.array([1000000.,1000002.,1000004.,2000000.][:count])
       obs('set_locs exact axis dependency/order',lambda:(f.set_locs(locs),state(f))[1],count=count,offset=offset,science=science,power=power)
    for where in [1,2,3]:
     f=new();axis=Provider(lambda i:(_ for _ in()).throw(ValueError('view stage '+str(i)))if i==where else np.array([1000000.,1000004.]));f.set_axis(axis)
     row=obs('view error partial state singleton',lambda:f.set_locs(np.array([1000001.])),where=where);row['state_after']=state(f)
    for values in [[],[1000000.,1000002.,1000004.,2000000.],[999999.,1000000.,1000002.,1000004.,1000005.],[math.nan,1000001.],[math.inf,1000001.]]:
     f=new();axis=ViewOnly(lambda i:np.array([1000000.,1000004.]));f.set_axis(axis)
     row=obs('full locations versus visible offset/order',lambda:dict(labels=f.format_ticks(np.array(values)),offset=f.get_offset(),state=state(f)),values=clean(values));row['state_after']=state(f)
    for method in ['__call__','format_data','format_data_short','get_offset']:
     f=new()
     obs('unbound method',lambda:getattr(f,method)(1.)if method!='get_offset'else f.get_offset(),method=method)
    f=new();f.set_scientific(False);f.set_useOffset(False)
    obs('unbound nonempty works when both view consumers disabled',lambda:dict(labels=f.format_ticks(np.array([1.,2.])),offset=f.get_offset(),state=state(f)))
    f=new();axis=ViewOnly(lambda i:np.array([1000000.,1000004.]));f.set_axis(axis)
    f.format_ticks(np.array([1000000.,1000002.,1000004.]));before=state(f)
    obs('empty locations preserve numerical state and empty output',lambda:(f.set_locs([]),dict(before=before,after=state(f),call=f(1000002.),offset=f.get_offset()))[1])
    # Real numeric Bbox + original generated view getter and complete transforms.
    axispath=P.with_name('axis.py');factory=next(n for n in ast.parse(axispath.read_text()).body if isinstance(n,ast.FunctionDef)and n.name=='_make_getset_interval')
    exec(compile(ast.Module(body=[factory],type_ignores=[]),str(axispath),'exec'),ns)
    axis_type=type(Axes().xaxis);getters={name:ns['_make_getset_interval']('view','viewLim','interval'+name)[0]for name in ['x','y']}
    Axes.viewLim=property(lambda s:s._viewLim)
    def actualget(self):events.append(self.axis_name+'.view');return getters[self.axis_name](self)
    axis_type.get_view_interval=actualget
    basepath=P.parent/'axes/_base.py';base=next(n for n in ast.parse(basepath.read_text()).body if isinstance(n,ast.ClassDef)and n.name=='_AxesBase')
    for method in ['get_xaxis_transform','get_yaxis_transform']:
     n=next(n for n in base.body if isinstance(n,ast.FunctionDef)and n.name==method);exec(compile(ast.Module(body=[n],type_ignores=[]),str(basepath),'exec'),ns);setattr(Axes,method,ns[method])
    for name in ['x','y']:
     for width in [100.,400.,1000.]:
      axes=Axes(bounds=(40.,60.,width,300.),label='pixel');getattr(axes,'set_'+name+'lim')((0.,1.));axis=axes._axis_map[name];axis.__name__=name+'axis';f=new();axis.set_major_formatter(f)
      obs('actual pixel-neighbor short format linear',lambda:dict(label=f.format_data_short(.123456789),bbox=axes.bbox.bounds),name=name,width=width)
     for scale,bounds,value in [('log',(1.,1000.),13.123456789),('symlog',(-100.,100.),.123456789),('asinh',(-100.,100.),.123456789),('logit',(.01,.99),.123456789)]:
      axes=Axes(label='nonlinear-pixel');axis=axes._axis_map[name];axis._scale=ns['mscale'].scale_factory(scale,axis);axes._update_transScale();getattr(axes,'set_'+name+'lim')(bounds);axis.__name__=name+'axis';f=new();axis.set_major_formatter(f)
      obs('actual pixel-neighbor short format nonlinear',lambda:dict(label=f.format_data_short(value),view=axis.get_view_interval()),name=name,scale=scale)
    # Dummy path contrasts normal axes. Data interval and tick space are never read.
    f=new();f.create_dummy_axis();f.axis.set_view_interval(0.,1.)
    obs('dummy short format range fallback',lambda:f.format_data_short(.123456789))
    # Complete source Axis.draw with only Text/layout/renderer sinks, hence offset order observed.
    a_tree=ast.parse(axispath.read_text());ac=next(n for n in a_tree.body if isinstance(n,ast.ClassDef)and n.name=='Axis')
    draw=copy.deepcopy(next(n for n in ac.body if isinstance(n,ast.FunctionDef)and n.name=='draw'));draw.decorator_list=[]
    exec(compile(ast.Module(body=[draw],type_ignores=[]),str(axispath),'exec'),ns)
    class R:
     def open_group(self,*a,**k):pass
     def close_group(self,*a,**k):pass
    class T:
     def __init__(self,kind):self.kind=kind;self.text=''
     def set_text(self,v):self.text=v;events.append((self.kind+'.set_text',v))
     def draw(self,r):events.append(self.kind+'.draw')
    for name in ['x','y']:
     for profile in ['separate','sharedformatter','minor-mutates-major','null-major-after-state']:
      axes=Axes(label='draw');getattr(axes,'set_'+name+'lim')((1000000.,1000004.));axis=axes._axis_map[name];major=new();minor=new()
      axis.set_major_locator(ns['FixedLocator'](np.array([999999.,1000000.,1000002.,1000004.,1000005.])))
      axis.set_minor_locator(ns['FixedLocator'](np.array([1000001.,1000003.])))
      axis.set_major_formatter(major);axis.set_minor_formatter(minor)
      if profile=='sharedformatter':axis.set_minor_formatter(major)
      if profile=='minor-mutates-major':axis.set_minor_formatter(ns['FuncFormatter'](lambda v,p:(major.set_useOffset(2000000.),str(p))[1]))
      if profile=='null-major-after-state':
       major.format_ticks(np.array([1000000.,1000002.,1000004.]));axis.set_major_locator(ns['NullLocator']());axis.set_minor_locator(ns['NullLocator']())
      axis.get_visible=lambda:True;axis.get_gid=lambda:None;axis._get_ticklabel_bboxes=lambda t,r:([],[])
      axis._update_label_position=lambda r:events.append('label.position');axis.label=T('axislabel');axis.offsetText=T('offset')
      axis._update_offset_text_position=lambda*a:events.append('offset.position')
      # Tick drawing is a storage sink after real _update_ticks positions/labels.
      old_get=axis._get_tick
      def gettick(*a,**k):
       tick=old_get(*a,**k);tick.draw=lambda r:events.append(('tick.draw',float(tick.get_loc()),tick.label1.text));return tick
      axis._get_tick=gettick
      obs('complete Axis.draw offset order',lambda:(ns['draw'](axis,R()),dict(offset=axis.offsetText.text,major=state(major),minor=state(minor)))[1],name=name,profile=profile)
    # Shared real Grouper/removal with controlled local views.
    for name in ['x','y']:
     a,b=Axes(label='first'),Axes(label='second');getattr(a,'set_'+name+'lim')((1000000.,1000004.));getattr(b,'set_'+name+'lim')((0.,2000000.))
     aa,bb=a._axis_map[name],b._axis_map[name];f=new();aa.set_major_formatter(f);oldcopy=copy.copy(f)
     bb.major,bb.minor=aa.major,aa.minor;group=ns['Grouper']();group.join(b,a);a._shared_axes[name]=b._shared_axes[name]=group;bb.set_major_formatter(f);external=copy.copy(f)
     locs=np.array([1000000.,1000002.,1000004.])
     obs('shared last setter controls preparation view',lambda:dict(live=f.format_ticks(locs),live_offset=f.get_offset(),copy=oldcopy.format_ticks(locs),copy_offset=oldcopy.get_offset()),name=name)
     figure=ns['FigureBase']();figure._axobservers=types.SimpleNamespace(process=lambda*a:None);figure._root_figure=types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda*a:None));figure._remove_axes(b,owners=[[a,b]])
     obs('shared deletion installed versus detached external',lambda:dict(live=f.format_ticks(locs),live_offset=f.get_offset(),external=external.format_ticks(locs),external_offset=external.get_offset()),name=name)
    for name in ['x','y']:
     parent=Axes(label='parent');getattr(parent,'set_'+name+'lim')((1000000.,1000004.));child=Secondary(parent,name);child.label='child';child._viewLim.intervalx=(0.,1.);child._viewLim.intervaly=(0.,1.);f=new();child._axis.set_major_formatter(f)
     locs=np.array([2000005.,2000009.,2000013.]);obs('secondary before own sync full preparation',lambda:dict(labels=f.format_ticks(locs),offset=f.get_offset(),state=state(f)),name=name)
     child._set_lims();obs('secondary after own sync full preparation',lambda:dict(labels=f.format_ticks(locs),offset=f.get_offset(),state=state(f),view=child._axis.get_view_interval()),name=name)
    for offset in [math.nan,math.inf,-math.inf]:
     f=new(useOffset=False);f.set_scientific(False);f.set_locs(np.array([1.,2.]));f.set_useOffset(offset)
     obs('offset query can raise after successful batch',lambda:dict(call=f(1.),offset=f.get_offset()),offset=clean(offset))
    # Null skips batch, but complete original Axis.draw always asks major offset.
    for name in ['x','y']:
     for kind in ['Fixed','Func']:
      for has_locs in [False,True]:
       for offset in ['', 'fixed/function offset']:
        axes=Axes(label='null-draw');axis=axes._axis_map[name]
        f=ns['FixedFormatter'](['A','B'])if kind=='Fixed'else ns['FuncFormatter'](lambda*v:(_ for _ in()).throw(ValueError('Null must not call formatter')))
        f.set_offset_string(offset)
        if has_locs:f.set_locs(np.array([0.,1.]))
        axis.set_major_formatter(f);axis.set_major_locator(ns['NullLocator']());axis.set_minor_locator(ns['NullLocator']())
        axis.get_visible=lambda:True;axis.get_gid=lambda:None;axis._get_ticklabel_bboxes=lambda t,r:([],[])
        axis._update_label_position=lambda r:events.append('label.position');axis.label=T('axislabel');axis.offsetText=T('offset')
        axis._update_offset_text_position=lambda*a:events.append('offset.position')
        def drawtraced():
         def trace(frame,event,arg):
          if event=='call'and frame.f_code.co_filename==str(P)and frame.f_code.co_name=='get_offset'and frame.f_locals.get('self')is f:events.append('formatter.get_offset')
          return trace
         sys.settrace(trace)
         try:ns['draw'](axis,R())
         finally:sys.settrace(None)
         return dict(offset=axis.offsetText.text,locs=clean(f._locs))
        obs('complete Null Axis.draw Fixed/Func still queries offset',drawtraced,name=name,kind=kind,has_locs=has_locs,configured_offset=offset)
    f=new();f.set_axis(ViewOnly(lambda i:np.array([1000000.,1000004.])if i==1 else np.array([0.,2000000.])))
    obs('each preparation stage reads live view independently',lambda:dict(labels=f.format_ticks(np.array([1000000.,1000002.,1000004.])),offset=f.get_offset(),state=state(f)))
    f=new();f.set_axis(ViewOnly(lambda i:np.array([1000000.,1000000.001])))
    obs('offscreen full locations determine format precision',lambda:dict(labels=f.format_ticks(np.array([1000000.0001,1000000.0002,1000000.0003,2000000.])),offset=f.get_offset(),state=state(f)))
    for name in ['x','y']:
     for origin in [0.,40.,-40.,1000000.,-1000000.,1e9,-1e9]:
      axes=Axes(bounds=(origin,60.,1000.,300.)if name=='x'else(40.,origin,400.,1000.),label='pixel-origin')
      getattr(axes,'set_'+name+'lim')((0.,1.));axis=axes._axis_map[name];axis.__name__=name+'axis';f=new();axis.set_major_formatter(f)
      captured={}
      def shorttrace():
       def trace(frame,event,arg):
        if event=='return'and frame.f_code.co_filename==str(P)and frame.f_code.co_name=='format_data_short'and frame.f_locals.get('self')is f:
         captured.update({k:clean(frame.f_locals[k])for k in ['delta','screen_xy','neighbor_values','fmt']if k in frame.f_locals})
        return trace
       sys.settrace(trace)
       try:label=f.format_data_short(.123456789)
       finally:sys.settrace(None)
       return dict(label=label,locals=captured,affine=clean((getattr(axes,'get_'+name+'axis_transform')().get_affine().get_matrix()).flatten()))
      obs('pixel-origin affine ordering near precision threshold',shorttrace,name=name,origin=origin)
    for value in [np.ma.masked,1,np.int64(-9223372036854775808),math.inf,math.nan]:
     f=new();f.set_axis(ViewOnly(lambda i:(_ for _ in()).throw(ValueError('short view read'))))
     obs('short masked/integral skip axis but float special still reads',lambda:f.format_data_short(value),input='masked'if value is np.ma.masked else type(value).__name__+':'+str(value))

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
    for name in ['x','y']:
        fig=types.SimpleNamespace(transSubfigure=tr['BboxTransformTo'](tr['Bbox'].from_bounds(0.,0.,1000.,800.)),canvas=types.SimpleNamespace(is_saving=lambda:False),suppressComposite=None)
        parent=Axes(label='inverse-order-parent');parent.get_figure=lambda **k:fig
        getattr(parent,'set_'+name+'lim')((0.,1.))
        effects=[]
        def major_callback(value,pos):
            major.set_offset_string('from-format');effects.append('major-format');return str(pos)
        major=ns['FuncFormatter'](major_callback)
        def inverse(values):
            major.set_offset_string('from-inverse');effects.append('inverse-transform');return values
        child=ns['SecondaryAxis'](parent,name,'top'if name=='x'else'right',(lambda values:values,inverse))
        child.label='inverse-order-secondary';axis=child._axis
        axis.set_major_locator(ns['FixedLocator'](np.array([0.,.5,1.])))
        axis.set_minor_locator(ns['NullLocator']());axis.set_major_formatter(major);child._set_lims()
        axis.get_visible=lambda:True;axis.get_gid=lambda:None;axis._get_ticklabel_bboxes=lambda t,r:([],[])
        axis._update_label_position=lambda r:None;axis.label=T('axislabel');axis.offsetText=T('offset');axis._update_offset_text_position=lambda*a:None
        old_get=axis._get_tick
        def drawable_tick(*a,**k):
            tick=old_get(*a,**k);tick.draw=lambda r:None;return tick
        axis._get_tick=drawable_tick
        def draw_with_offset_trace():
            def trace(frame,event,arg):
                if event=='call'and frame.f_code.co_filename==str(P)and frame.f_code.co_name=='get_offset'and frame.f_locals.get('self')is major:effects.append('major-get-offset')
                return trace
            sys.settrace(trace)
            try:ns['draw'](axis,Renderer())
            finally:sys.settrace(None)
            return dict(offset=axis.offsetText.text,effects=effects.copy())
        obs('secondary inverse mutation precedes major offset',draw_with_offset_trace,name=name)
    inverse_profiles=[]
    original_inv=tr['inv']
    def exact_inverse(matrix):
        if matrix.shape!=(3,3)or matrix[0,1]!=0 or matrix[1,0]!=0 or matrix[2,0]!=0 or matrix[2,1]!=0 or matrix[2,2]!=1:
            raise AssertionError('mathematical inverse fixture requires separable affine')
        a,d,e,f=(Fraction.from_float(float(matrix[i,j]))for i,j in [(0,0),(1,1),(0,2),(1,2)])
        return np.array([[float(1/a),0.,float(-e/a)],[0.,float(1/d),float(-f/d)],[0.,0.,1.]])
    inverse_cases=[(.1,.9,40.,400.,.123456789),(1.1,9.9,1e6,333.,1.23456789),(1e6,1e6+4,40.,400.,1e6+1.23456789),(-.3,4.7,37.,291.,.123456789),(-123.456,789.123,1e9,457.,123.456789),(.01,.99,40.,400.,.123456789)]
    try:
        for lower,upper,origin,length,value in inverse_cases:
            outputs={}
            for profile in ['original','mathematical']:
                tr['inv']=original_inv if profile=='original'else exact_inverse
                axes=Axes(bounds=(origin,60.,length,300.));axes.set_xlim((lower,upper));axis=axes.xaxis;axis.__name__='xaxis';f=new();axis.set_major_formatter(f)
                transform=axes.get_xaxis_transform()
                outputs[profile]=dict(matrix=clean(transform.get_affine().get_matrix().flatten()),inverse=clean(transform.inverted().get_affine().get_matrix().flatten()),label=f.format_data_short(value))
            inverse_profiles.append(dict(lower=lower,upper=upper,origin=origin,length=length,value=value,profiles=outputs,label_difference=outputs['original']['label']!=outputs['mathematical']['label']))
    finally:tr['inv']=original_inv
    hashes={**real['source_hashes'],**{str(p.relative_to(P.parent)):hashlib.sha256(p.read_bytes()).hexdigest()for p in [P.with_name('axis.py'),P.with_name('cbook.py'),P.with_name('figure.py'),P.parent/'axes/_base.py',P.with_name('transforms.py'),P.parent/'axes/_secondary_axes.py']}}
    return dict(source_hashes=hashes,host_profile=real['scalar_host_profile'],runtime=dict(python=sys.version.split()[0],numpy=np.__version__),scope='Complete original ScalarFormatter, actual Axis formatter installation/update_ticks/draw, real generated Bbox view getters, original Grouper/Figure removal; actual original SecondaryAxis plus original base position/set_figure/apply_aspect/draw and Figure layout. Identity unit/Text/GUI and known constructor storage sinks. Complete original transforms Python with pre-existing explicit NumPy affine product primitive; no installed Matplotlib C binary. Six raw native inverse / exact Fraction closed-form mathematical profiles retained separately, never rewrite original labels.',observations=rows,inverse_profiles=inverse_profiles)


def quote(value):return json.dumps(value,ensure_ascii=False)
def num(value):
    if isinstance(value,dict):value=float.fromhex(value['hex'])
    return moon(float(value))
def arr(values):return '['+', '.join(num(x)for x in values)+']'
def scalar(value):
    if isinstance(value,dict):
        kind=value['type']
        if kind in ['float','float64']:return '@ticker.ScalarNumber::'+('Number'if kind=='float'else'NumpyFloat64')+'('+num(value)+')'
        if kind=='int64':return '@ticker.ScalarNumber::NumpyInt64('+value['value']+'L)'
        if kind in ['bool','bool_']:return '@ticker.ScalarNumber::'+('Boolean'if kind=='bool'else'NumpyBool')+'('+str(value['value']).lower()+')'
        raise AssertionError(value)
    if isinstance(value,bool):return '@ticker.ScalarNumber::Boolean('+str(value).lower()+')'
    if isinstance(value,float):return '@ticker.ScalarNumber::Number('+num(value)+')'
    if not isinstance(value,int):raise AssertionError(('unsupported raw numeric fixture',value))
    return '@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string('+quote(str(value))+'))'

def emit(payload):
    tests=[];wb=[]
    fixture='''  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
'''
    def add(label,body,white=False):
        group=wb if white else tests
        active_fixture=fixture
        if white:
            active_fixture='\n'.join(line for line in fixture.split('\n')if 'threshold'not in line and 'set_formatter_offset_threshold'not in line)
            body=body.replace('  f.set_power_limits(@ticker.ScalarPowerLimits::Integers([@bigint.BigInt::from_int(-5), @bigint.BigInt::from_int(6)]))\n','')
        group.append('///|\ntest '+quote('Scalar original axis '+str(len(tests)+len(wb))+' '+label)+' {\n'+active_fixture+body+'}\n')
    def ctor(offset=True,name='f'):
        return '  let '+name+' = @ticker.ScalarFormatter::new(use_offset=Some('+scalar(offset)+'), use_math_text=Some(false), use_locale=Some(false), usetex=Some(false))\n  '+name+'.set_power_limits(@ticker.ScalarPowerLimits::Integers([@bigint.BigInt::from_int(-5), @bigint.BigInt::from_int(6)]))\n'
    def bind(view='[1000000.0, 1000004.0]',f='f'):
        return '  let binding = @ticker.FormatterAxisBinding::new()\n  binding.set_view_interval(@ticker.FormatterViewInterval::NdArray(@ticker.TickValues::from_array('+view+')))\n  '+f+'.set_axis(Some(binding))\n'
    def check(row,expr,value=None):
        if row.get('error'):
            return '  let failed = try { ignore('+expr+'); false } catch {\n    @core.DataError::InvalidTicks(message~) => { assert_eq(message, '+quote(row['error']+': '+row['message'])+'); true }\n    _ => false\n  }\n  assert_true(failed)\n'
        if value is None:value=row['value']
        expect=quote(value)if isinstance(value,str)else '['+', '.join(quote(v)for v in value)+']'
        return '  assert_eq('+expr+', '+expect+')\n'
    def state(value,f='f'):
        code='  assert_eq('+f+'.offset(), Some('+scalar(value['offset'])+'))\n  assert_eq('+f+'.order_of_magnitude(), '+scalar(value['order'])+')\n  assert_eq('+f+'.format_pattern(), '+quote(value['format'])+')\n'
        locs=value['locs']['values']if isinstance(value['locs'],dict)else value['locs']
        code+='  assert_eq('+f+'.locations().length(), '+str(len(locs))+')\n'
        for i,x in enumerate(locs):
            if isinstance(x,dict)and x.get('hex')=='nan':code+='  assert_true('+f+'.locations().get('+str(i)+').is_nan())\n'
            else:code+='  assert_eq('+f+'.locations().get('+str(i)+'), '+num(x)+')\n'
        return code
    def axis_scene(name,lo=1000000.,hi=1000004.):
        return '  let figure = @scene.figure(width=320, height=200)\n  let axes = figure.axes()\n  axes.set_x_limits('+num(lo)+', '+num(hi)+')\n  axes.set_y_limits('+num(lo)+', '+num(hi)+')\n  axes.set_x_locator(@ticker.NullLocator::new().as_locator())\n  axes.set_y_locator(@ticker.NullLocator::new().as_locator())\n  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n  let axis = axes.'+name+'_axis()\n'
    def geometry(origin,length,lo,hi,scale='@scale.linear_scale()'):
        return '  let axis = @axis.axis()\n  axis.set_limits('+num(lo)+', '+num(hi)+')\n  axis.set_scale('+scale+')\n  axis.bind_formatter_geometry(() => { ('+num(origin)+', '+num(length)+') })\n  axis.set_named_formatter(f.as_base_formatter())\n'
    for row in payload['observations']:
        label=row['label'];v=row.get('value');name=row.get('name','x');body=''
        if label=='set_locs exact axis dependency/order':
            body=ctor(row['offset'])+'  f.set_scientific('+str(row['science']).lower()+')\n'
            if row['power']:body+='  f.set_power_limits(@ticker.ScalarPowerLimits::Integers([@bigint.BigInt::from_int(3), @bigint.BigInt::from_int(3)]))\n'
            body+='''  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => { calls.val += 1; @ticker.FormatterViewInterval::NdArray(@ticker.TickValues::from_array([1000000.0, 1000004.0])) })
  f.set_axis(Some(binding))
'''
            body+='  f.set_locs_view(@ticker.TickValues::from_array('+arr(v['locs']['values'])+'))\n  assert_eq(calls.val, '+str(len(row['events']))+')\n'+state(v)
        elif label=='view error partial state singleton':
            body=ctor()+'''  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    if calls.val == '''+str(row['where'])+''' { raise @core.DataError::InvalidTicks(message="ValueError: view stage '''+str(row['where'])+'''") }
    @ticker.FormatterViewInterval::NdArray(@ticker.TickValues::from_array([1000000.0, 1000004.0]))
  })
  f.set_axis(Some(binding))
'''+check(row,'f.set_locs_view(@ticker.TickValues::from_array([1000001.0]))')+'  assert_eq(calls.val, '+str(row['where'])+')\n'+state(row['state_after'])
        elif label=='full locations versus visible offset/order':
            body=ctor()+bind()+check(row,'f.format_ticks_view(@ticker.TickValues::from_array('+arr(row['values'])+'))',None if row['error']else v['labels'])
            if not row['error']:body+='  assert_eq(f.get_offset(), '+quote(v['offset'])+')\n'
            body+=state(row['state_after'])
        elif label=='unbound method':
            body=ctor();method='call'if row['method']=='__call__'else row['method']
            body+=check(row,'f.'+method+'('+(''if method=='get_offset'else'1.0')+')')
        elif label=='unbound nonempty works when both view consumers disabled':
            body=ctor(False)+'  f.set_scientific(false)\n'+check(row,'f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0]))',v['labels'])+'  assert_eq(f.get_offset(), '+quote(v['offset'])+')\n'+state(v['state'])
        elif label=='empty locations preserve numerical state and empty output':
            body=ctor()+bind()+'  ignore(f.format_ticks_view(@ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0])))\n'+state(v['before'])+'  f.set_locs([])\n'+state(v['after'])+'  assert_eq(f.call(1000002.0), '+quote(v['call'])+')\n  assert_eq(f.get_offset(), '+quote(v['offset'])+')\n'
        elif label=='actual pixel-neighbor short format linear':
            length=row['width']if name=='x'else 300.;origin=40. if name=='x'else 60.
            body=ctor()+geometry(origin,length,0.,1.)+check(row,'f.format_data_short(0.123456789)',v['label'])
        elif label=='actual pixel-neighbor short format nonlinear':
            scale=row['scale'];spec={'log':(1.,1000.,13.123456789,'@scale.log_scale()'),'symlog':(-100.,100.,.123456789,'@scale.symlog_scale(linthresh=2.0)'),'asinh':(-100.,100.,.123456789,'@scale.asinh_scale()'),'logit':(.01,.99,.123456789,'@scale.logit_scale()')}
            lo,hi,value,kind=spec[scale];origin,length=(40.,400.)if name=='x'else(60.,300.)
            body=ctor()+geometry(origin,length,lo,hi,kind)+check(row,'f.format_data_short('+num(value)+')',v['label'])
        elif label=='dummy short format range fallback':
            body=ctor()+'  f.create_dummy_axis()\n  f.axis().unwrap().set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 1.0]))\n'+check(row,'f.format_data_short(0.123456789)')
        elif label=='complete Axis.draw offset order':
            profile=row['profile'];body=axis_scene(name)+ctor(name='major')
            body+='  let major_locs = [999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0]\n  axis.set_locator(@ticker.FixedLocator::new(major_locs).as_locator())\n  axis.set_minor_locator(@ticker.FixedLocator::new([1000001.0, 1000003.0]).as_minor_locator())\n  axis.set_named_formatter(major.as_base_formatter())\n'
            if profile=='sharedformatter':body+='  axis.set_minor_named_formatter(major.as_base_formatter())\n'
            elif profile=='minor-mutates-major':body+='''  axis.set_minor_named_formatter(@ticker.FuncFormatter::new((_, pos) => {
    major.set_use_offset(Some(@ticker.ScalarNumber::Number(2000000.0)))
    pos.unwrap().to_string()
  }).as_base_formatter())
'''
            elif profile=='null-major-after-state':
                body+='  ignore(major.format_ticks_view(@ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0])))\n  axis.set_locator(@ticker.NullLocator::new().as_locator())\n  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n'
            else:body+=ctor(name='minor')+'  axis.set_minor_named_formatter(minor.as_base_formatter())\n'
            body+='  let svg = figure.to_svg_checked()\n  assert_eq(svg.split('+quote('>'+v['offset']+'<')+').count() - 1, 1)\n'
            from collections import Counter
            labels=Counter(event[2]for event in row['events']if isinstance(event,(tuple,list))and event[0]=='tick.draw')
            for text,count in labels.items():body+='  assert_eq(svg.split('+quote('>'+text+'<')+').count() - 1, '+str(count)+')\n'
            body+=state(v['major'],'major')
            if profile=='separate':body+=state(v['minor'],'minor')
        elif label in ['shared last setter controls preparation view','shared deletion installed versus detached external']:
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
'''+ctor()+'''  first.set_'''+name+'''_named_formatter(f.as_base_formatter())
  let old = f.copy()
  second.set_'''+name+'''_named_formatter(f.as_base_formatter())
  let external = f.copy()
  let values = @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0])
'''
            if label.startswith('shared deletion'):
                body+='  second.remove()\n'+check(row,'f.format_ticks_view(values)',v['live'])+'  assert_eq(f.get_offset(), '+quote(v['live_offset'])+')\n'+check(row,'external.format_ticks_view(values)',v['external'])+'  assert_eq(external.get_offset(), '+quote(v['external_offset'])+')\n  assert_eq(f.axis(), Some(a.formatter_axis_binding()))\n  assert_eq(external.axis(), Some(b.formatter_axis_binding()))\n  ignore(old)\n'
            else:
                body+=check(row,'f.format_ticks_view(values)',v['live'])+'  assert_eq(f.get_offset(), '+quote(v['live_offset'])+')\n'+check(row,'old.format_ticks_view(values)',v['copy'])+'  assert_eq(old.get_offset(), '+quote(v['copy_offset'])+')\n  assert_eq(f.axis(), Some(b.formatter_axis_binding()))\n  ignore(external)\n'
        elif label in ['secondary before own sync full preparation','secondary after own sync full preparation']:
            body=axis_scene(name)+ctor()+'  let secondary = axes.secondary_'+name+'axis(value => value * 2.0 + 5.0, value => (value - 5.0) / 2.0)\n  secondary.set_named_formatter(f.as_base_formatter())\n'
            if label.startswith('secondary after'):body+='  secondary.apply_aspect()\n'
            body+=check(row,'f.format_ticks_view(@ticker.TickValues::from_array([2000005.0, 2000009.0, 2000013.0]))',v['labels'])+'  assert_eq(f.get_offset(), '+quote(v['offset'])+')\n'+state(v['state'])+'  ignore(axis)\n'
        elif label=='offset query can raise after successful batch':
            body=ctor(False)+'  f.set_scientific(false)\n  ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])))\n  f.set_use_offset(Some('+scalar(row['offset'])+'))\n'+check(row,'f.get_offset()')
        elif label=='complete Null Axis.draw Fixed/Func still queries offset':
            body=axis_scene(name)
            if row['kind']=='Fixed':body+='  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()\n  formatter.fixed_formatter().unwrap().set_offset_string('+quote(row['configured_offset'])+')\n'
            else:body+='  let named = @ticker.FuncFormatter::new((_, _) => { raise @core.DataError::InvalidTicks(message="Null must not call formatter") })\n  named.set_offset_string('+quote(row['configured_offset'])+')\n  let formatter = named.as_base_formatter()\n'
            if row['has_locs']:body+='  formatter.set_locs_view_checked(@ticker.TickValues::from_array([0.0, 1.0]))\n'
            body+='  axis.set_named_formatter(formatter)\n  let svg = figure.to_svg_checked()\n'
            if v['offset']:body+='  assert_eq(svg.split('+quote('>'+v['offset']+'<')+').count() - 1, 1)\n'
            else:body+='  assert_eq(formatter.get_offset_checked(), "")\n  assert_true(!svg.contains(">A<"))\n'
            body+='  assert_eq(formatter.locations().length(), '+('2'if row['has_locs']else'0')+')\n'
        elif label=='each preparation stage reads live view independently':
            body=ctor()+'''  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(@ticker.TickValues::from_array(if reads.val == 1 { [1000000.0, 1000004.0] } else { [0.0, 2000000.0] }))
  })
  f.set_axis(Some(binding))
'''+check(row,'f.format_ticks_view(@ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]))',v['labels'])+'  assert_eq(reads.val, 2)\n  assert_eq(f.get_offset(), '+quote(v['offset'])+')\n'+state(v['state'])
        elif label=='offscreen full locations determine format precision':
            values=v['state']['locs']['values'];body=ctor()+bind('[1000000.0, 1000000.001]')+check(row,'f.format_ticks_view(@ticker.TickValues::from_array('+arr(values)+'))',v['labels'])+'  assert_eq(f.get_offset(), '+quote(v['offset'])+')\n'+state(v['state'])
        elif label=='pixel-origin affine ordering near precision threshold':
            body=ctor()+geometry(row['origin'],1000.,0.,1.)+check(row,'f.format_data_short(0.123456789)',v['label'])
        elif label=='short masked/integral skip axis but float special still reads':
            body=ctor()+'''  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => { calls.val += 1; raise @core.DataError::InvalidTicks(message="ValueError: short view read") })
  f.set_axis(Some(binding))
'''
            inp=row['input']
            if inp=='masked':expr='f.format_data_short_masked()'
            elif inp.startswith('int64:'):expr='f.format_data_short_value(@ticker.ScalarNumber::NumpyInt64(-9223372036854775807L - 1L))'
            elif inp.startswith('int:'):expr='f.format_data_short_value(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(1)))'
            else:expr='f.format_data_short('+('1.0 / 0.0'if inp.endswith('inf')else'0.0 / 0.0')+')'
            body+=check(row,expr)+'  assert_eq(calls.val, '+str(len(row['events']))+')\n'
        elif label=='secondary inverse mutation precedes major offset':
            body=axis_scene(name,0.,1.)+'''  let slot : @ref.Ref[@ticker.FuncFormatter?] = @ref.Ref(None)
  let major = @ticker.FuncFormatter::new((_, pos) => {
    slot.val.unwrap().set_offset_string("from-format")
    pos.unwrap().to_string()
  })
  slot.val = Some(major)
  let secondary = axes.secondary_'''+name+'''axis(fn(value) { return value }, value => {
    major.set_offset_string("from-inverse")
    value
  })
  secondary.set_locator(@ticker.FixedLocator::new([0.0, 0.5, 1.0]).as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(major.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(svg.split('''+quote('>'+v['offset']+'<')+''').count() - 1, 1)
  assert_true(!svg.contains(">from-format<"))
  assert_eq(major.get_offset(), '''+quote(v['offset'])+''')
  ignore(axis)
'''
        elif label=='complete secondary physical geometry stages':
            name=v['name'];body='''  let figure = @scene.figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
'''+ctor()
            if v['mapping']=='identity':body+='  let secondary = axes.secondary_'+name+'axis(fn(value) { return value }, fn(value) { return value })\n'
            else:body+='  let secondary = axes.secondary_'+name+'axis(value => value * 2.0 + 5.0, value => (value - 5.0) / 2.0)\n'
            body+='  secondary.set_locator(@ticker.NullLocator::new().as_locator())\n  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n  secondary.set_named_formatter(f.as_base_formatter())\n'
            stage=v['stage']
            if stage!='complete constructor before sync':body+='  secondary.apply_aspect()\n'
            if stage in ['original Figure layout locator position','complete original child draw','direct apply_aspect(None) after frame']:body+='  ignore(figure.to_svg_checked())\n'
            if stage=='direct apply_aspect(None) after frame':body+='  secondary.apply_aspect()\n'
            val=.123456789 if v['mapping']=='identity'or stage=='complete constructor before sync'else 6.123456789
            body+='  assert_eq(f.format_data_short('+num(val)+'), '+quote(v['label'])+')\n'
            bounds=v['bbox'];origin=bounds[0 if name=='x'else 1];length=bounds[2 if name=='x'else 3]
            body+='  let (origin, length) = secondary.formatter_geometry()\n  assert_eq(origin, '+num(origin)+')\n  assert_eq(length, '+num(length)+')\n'
            add(label+' '+stage,body.replace('@scene.',''),white=True);continue
        else:raise AssertionError(label)
        add(label,body)
    for index,row in enumerate(payload['inverse_profiles']):
        body=ctor()+geometry(row['origin'],row['length'],row['lower'],row['upper'])+'  assert_eq(f.format_data_short('+num(row['value'])+'), '+quote(row['profiles']['mathematical']['label'])+')\n'
        add('explicit mathematical affine inverse profile '+str(index),body)
    return '// Generated from complete original Scalar/Axis lifecycle.\n\n'+'\n'.join(tests),'// Original source physical rectangles; known SVG72 direction geometry.\n\n'+'\n'.join(wb),len(tests),len(wb)


def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('ticker',type=Path);ap.add_argument('--check',action='store_true');a=ap.parse_args()
    p=collect(a.ticker);code,wb,n,m=emit(p);p['counts']=dict(original_axis_stages=len(p['observations']),inverse_profiles=len(p['inverse_profiles']),inverse_label_differences=sum(r['label_difference']for r in p['inverse_profiles']),generated_scene=n,generated_geometry_whitebox=m)
    outputs={ROOT/'testdata/scalar_axis_reference.json':json.dumps(p,ensure_ascii=False,indent=2)+'\n',ROOT/'scene/scalar_axis_reference_test.mbt':formatted(code),ROOT/'scene/scalar_axis_reference_wbtest.mbt':formatted(wb)}
    for path,value in outputs.items():
        if a.check:
            if not path.exists()or path.read_text()!=value:raise SystemExit('stale reference '+str(path))
        else:path.write_text(value)
    print(p['counts'],'checked'if a.check else'generated')
if __name__=='__main__':main()
