"""Complete original Percent/Axis/Secondary view and draw-order reference.

The numeric Bbox and GUI/Text/super-draw sinks are explicit; original formatter,
interval getters, binding, Grouper/removal and frame sorting bodies execute.
"""
from pathlib import Path
import argparse
import json
from formatter_reference_source import load_percent_formatter
from generate_auto_date_reference import formatted, moon

ROOT = Path(__file__).resolve().parents[1]


def collect_source(path):
    from pathlib import Path
    import ast,copy,hashlib,json,math,sys,types,warnings,functools,numbers
    import numpy as np
    sys.path.insert(0,str(Path.cwd()/'scripts'))
    from generate_basic_formatter_axis_reference import load as load_axis,run_update
    P=Path(path)
    ns,tr,Axes,Secondary,real=load_axis(P)
    percent_ns=load_percent_formatter(P)
    ns['mpl'].rcParams['text.usetex']=percent_ns['mpl'].rcParams['text.usetex']
    node=next(n for n in ast.parse(P.read_text()).body if isinstance(n,ast.ClassDef) and n.name=='PercentFormatter')
    exec(compile(ast.Module(body=[node],type_ignores=[]),str(P),'exec'),ns)
    axis_path=P.with_name('axis.py')
    factory=next(n for n in ast.parse(axis_path.read_text()).body if isinstance(n,ast.FunctionDef) and n.name=='_make_getset_interval')
    exec(compile(ast.Module(body=[factory],type_ignores=[]),str(axis_path),'exec'),ns)
    getters={name:ns['_make_getset_interval']('view','viewLim','interval'+name)[0] for name in ['x','y']}
    Axes.viewLim=property(lambda self:self._viewLim) # Explicit no-autoscale Bbox sink.
    ActualAxis=type(Axes().xaxis)
    view_events=[]
    def actual_view(self):
        view_events.append(self.axes.label+'.view.'+self.axis_name)
        return getters[self.axis_name](self)
    ActualAxis.get_view_interval=actual_view
    rows=[]
    def clean(x):
        if isinstance(x,np.ndarray):return {'dtype':str(x.dtype),'values':[clean(v)for v in x]}
        if isinstance(x,(list,tuple)):return [clean(v)for v in x]
        if isinstance(x,(float,np.floating)):return {'type':type(x).__name__,'repr':repr(x),'hex':float(x).hex()}
        if isinstance(x,np.integer):return {'type':type(x).__name__,'value':str(x)}
        if isinstance(x,dict):return {k:clean(v)for k,v in x.items()}
        return x
    def observe(label,action,**meta):
        view_events.clear()
        try:value,error=clean(action()),None;message=None
        except Exception as exc:value,error,message=None,type(exc).__name__,str(exc)
        row=dict(label=label,value=value,error=error,message=message,view_events=list(view_events),**meta)
        rows.append(row);return row
    F=ns['PercentFormatter']
    for decimals in [None,2]:
        f=F(decimals=decimals)
        observe('unbound call reads axis first',lambda:f(-1.),decimals=decimals)
        observe('unbound direct format_pct bypasses axis',lambda:f.format_pct(-1.,1.),decimals=decimals)
        observe('unbound empty batch never reads axis',lambda:f.format_ticks([]),decimals=decimals)
        observe('unbound nonempty batch fails after set_locs',lambda:f.format_ticks([1.]),decimals=decimals)
        assert f._locs==[1.]
        f.create_dummy_axis(minpos=-1.)
        observe('dummy default exact view and label',lambda:dict(view=f.axis.get_view_interval(),label=f(-1.),minpos=f.axis.get_minpos()),decimals=decimals)
        for view in [(0.,100.),(0.,10.),(0.,1.),(100.,0.),(2.,2.),(math.nan,1.),(-math.inf,math.inf)]:
            f.axis.set_view_interval(*view)
            observe('dummy mutable range query',lambda:f(-1.),decimals=decimals,view=clean(view))
        old=f.axis;f.create_dummy_axis(minpos=99.)
        observe('dummy create is no-op while bound',lambda:dict(same=f.axis is old,minpos=f.axis.get_minpos()),decimals=decimals)
        copied=copy.copy(f);f.set_axis(None);f.create_dummy_axis(minpos=3.)
        observe('copy retains old dummy and new dummy resets view',lambda:dict(old_view=copied.axis.get_view_interval(),new_view=f.axis.get_view_interval(),same=copied.axis is f.axis),decimals=decimals)

    class Provider:
        def __init__(self,fn,label='provider'):self.fn=fn;self.label=label;self.count=0
        def get_view_interval(self):
            self.count+=1;view_events.append(self.label+'.view.'+str(self.count));return self.fn(self.count)

    f=F(); p=Provider(lambda i:(0.,10.**(3-i)))
    f.set_axis(p)
    observe('batch reads changing view once per value',lambda:f.format_ticks([1.,1.,1.]))
    observe('batch original locs retained',lambda:dict(locs=f._locs,calls=p.count))
    for method in ['__call__','format_data','format_data_short']:
        f=F(decimals=2);p=Provider(lambda i:(0.,1.));f.set_axis(p)
        observe('all inherited calls use view',lambda:getattr(f,method)(-1.),method=method)
    for decimals in [None,2]:
        def poison(i):raise ValueError('poison view')
        f=F(xmax=0,decimals=decimals);p=Provider(poison);f.set_axis(p)
        observe('view failure precedes x zero division',lambda:f(1.),decimals=decimals)
    f=F()
    def mutate_decimals(i):f.decimals=0;return(0.,1.)
    f.set_axis(Provider(mutate_decimals))
    observe('view callback parameter mutation is visible same call',lambda:f(1.))
    f=F()
    def mutate_rc(i):ns['mpl'].rcParams['axes.unicode_minus']=i%2==0;return(0.,1.)
    f.set_axis(Provider(mutate_rc));ns['mpl'].rcParams['axes.unicode_minus']=True
    observe('view callback changes rc before same-call fix_minus',lambda:f.format_ticks([-1.,-1.,-1.]))
    ns['mpl'].rcParams['axes.unicode_minus']=True

    for name in ['x','y']:
        axes=Axes(label='real-'+name);getattr(axes,'set_'+name+'lim')((0.,4.))
        axis=axes._axis_map[name];f=F();getattr(axis,'set_major_formatter')(f)
        observe('actual generated Axis getter reads Bbox Float64',lambda:dict(view=axis.get_view_interval(),label=f(1.)),name=name)
        getattr(axes,'set_'+name+'lim')((0.,100.))
        observe('actual primary view change observed immediately',lambda:f(1.),name=name)
        child=Secondary(axes,name);child.label='secondary-'+name
        f=F();child._axis.set_major_formatter(f)
        getattr(axes,'set_'+name+'lim')((0.,4.));child._set_lims()
        observe('secondary uses own stored converted range',lambda:dict(parent=getattr(axes,'get_'+name+'lim')(),own=child._axis.get_view_interval(),label=f(1.)),name=name)
        getattr(axes,'set_'+name+'lim')((0.,.04))
        observe('secondary parent changed before _set_lims keeps own range',lambda:dict(own=child._axis.get_view_interval(),label=f(1.)),name=name)
        child._set_lims()
        observe('secondary original _set_lims refreshes own range',lambda:dict(own=child._axis.get_view_interval(),label=f(1.)),name=name)

    for name in ['x','y']:
        first,second=Axes(label='first'),Axes(label='second')
        getattr(first,'set_'+name+'lim')((0.,1.));getattr(second,'set_'+name+'lim')((0.,100.))
        a,b=first._axis_map[name],second._axis_map[name]
        major,minor=F(),F()
        a.set_major_formatter(major);a.set_minor_formatter(minor)
        old_major,old_minor=copy.copy(major),copy.copy(minor)
        b.major,b.minor=a.major,a.minor
        group=ns['Grouper']();group.join(second,first)
        first._shared_axes[name]=second._shared_axes[name]=group
        b.set_major_formatter(major);b.set_minor_formatter(minor)
        detached_major,detached_minor=copy.copy(major),copy.copy(minor)
        observe('shared last formatter setter owns both live reads',lambda:dict(installed=[major(1.),minor(1.)],oldcopy=[old_major(1.),old_minor(1.)],owners=[major.axis.axes.label,minor.axis.axes.label]),name=name)
        figure=ns['FigureBase']();figure._axobservers=types.SimpleNamespace(process=lambda *a:None)
        figure._root_figure=types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda *a:None))
        observe('original shared deletion rebinds both installed',lambda:figure._remove_axes(second,owners=[[first,second]]),name=name)
        observe('shared deletion live rebind vs external copies',lambda:dict(installed=[major(1.),minor(1.)],external=[detached_major(1.),detached_minor(1.)],owners=[major.axis.axes.label,minor.axis.axes.label]),name=name)

    with warnings.catch_warnings(),np.errstate(all='ignore'):
        warnings.simplefilter('ignore',RuntimeWarning)
        for decimals in [None,2]:
            for profile in ['dummy-default','dummy-PythonFloat','dummy-NumPyFloat','actual-axis']:
                f=F(xmax=0.,decimals=decimals)
                if profile=='actual-axis':
                    axis=Axes(label='actual-zero').xaxis;axis.set_major_formatter(f)
                else:
                    f.create_dummy_axis()
                    if profile=='dummy-PythonFloat':f.axis.set_view_interval(0.,1.)
                    if profile=='dummy-NumPyFloat':f.axis.set_view_interval(np.float64(0.),np.float64(1.))
                observe('view scalar origin controls second conversion',lambda:f(np.float64(1.)),decimals=decimals,profile=profile)

    with warnings.catch_warnings(),np.errstate(all='ignore'):
        warnings.simplefilter('ignore',RuntimeWarning)
        for xmax in [100.,0.]:
            for bounds in [(-9223372036854775808,9223372036854775807),(-9223372036854775808,0),(9223372036854775807,-9223372036854775808)]:
                f=F(xmax=xmax);view=np.array(bounds,dtype=np.int64);f.set_axis(Provider(lambda i:view))
                observe('NdArray Int64 view subtraction and abs retain wrap',lambda:dict(label=f(np.float64(1.)),range=abs(view[1]-view[0])),xmax=xmax,bounds=[str(v)for v in bounds])

    # Complete original SecondaryAxis class, with styling/GUI super-method sinks.
    # Original _set_axes_scale also executes so a constructor scale change cannot
    # silently skip a source-triggered autoscale. On this linear->function profile
    # original old/new nonsingular defaults are equal, hence no autoscale is invoked.
    for name in ['_get_axis_name','_get_shared_axes','_set_axes_scale']:
        method=next(n for n in ast.parse(axis_path.read_text()).body if isinstance(n,ast.ClassDef) and n.name=='Axis')
        method=next(n for n in method.body if isinstance(n,ast.FunctionDef) and n.name==name)
        exec(compile(ast.Module(body=[method],type_ignores=[]),str(axis_path),'exec'),ns)
        setattr(ActualAxis,name,ns[name])
    ActualAxis.set_ticks_position=lambda self,*a,**k:None
    ActualAxis.set_label_position=lambda self,*a,**k:None
    ActualAxis.set_ticks=lambda self,*a,**k:None
    Axes.get_figure=lambda self,**k:types.SimpleNamespace()
    class SpineSink:
        def __getitem__(self,key):return self
        def set_visible(self,value):pass
    class BaseSink(Axes):
        def __init__(self,figure,bounds,**kwargs):
            super().__init__();self.spines=SpineSink();self.sync_events=[]
        def set_axes_locator(self,locator):self.locator_sink=locator
        def set_xticks(self,*args,**kwargs):pass
        def set_yticks(self,*args,**kwargs):pass
        def set_xscale(self,value,**kwargs):self.xaxis._set_axes_scale(value,**kwargs)
        def set_yscale(self,value,**kwargs):self.yaxis._set_axes_scale(value,**kwargs)
        def autoscale_view(self,**kwargs):raise AssertionError('unexpected constructor autoscale')
        def apply_aspect(self,position=None):self.sync_events.append('super.apply_aspect')
        def draw(self,renderer):
            self.sync_events.append('super.draw')
            self.draw_label=self._axis.get_major_formatter()(1.)
    class LocatorSink:
        def __init__(self,bounds,transform):self.bounds,self.transform=bounds,transform
    full=dict(ns,_AxesBase=BaseSink,_TransformedBoundsLocator=LocatorSink,Axis=ActualAxis,
              functools=functools,numbers=numbers,transforms=tr,Transform=tr['Transform'] if isinstance(tr,dict) else tr.Transform)
    if isinstance(tr,dict):full['transforms']=types.SimpleNamespace(**tr)
    secondary_path=P.parent/'axes/_secondary_axes.py'
    complete_secondary=next(n for n in ast.parse(secondary_path.read_text()).body if isinstance(n,ast.ClassDef) and n.name=='SecondaryAxis')
    exec(compile(ast.Module(body=[complete_secondary],type_ignores=[]),str(secondary_path),'exec'),full)
    for name in ['x','y']:
        parent=Axes(label='constructor-parent');getattr(parent,'set_'+name+'lim')((0.,4.))
        child=full['SecondaryAxis'](parent,name,'top' if name=='x' else'right',(lambda x:2*x+5,lambda x:(x-5)/2))
        child.label='constructor-secondary';f=F();child._axis.set_major_formatter(f)
        observe('complete Secondary constructor before first sync',lambda:dict(own=child._axis.get_view_interval(),label=f(1.)),name=name)
        child.apply_aspect()
        observe('complete original apply_aspect syncs before delegate',lambda:dict(own=child._axis.get_view_interval(),label=f(1.),events=child.sync_events.copy()),name=name)
        getattr(parent,'set_'+name+'lim')((0.,.04))
        observe('complete Secondary remains stale after parent change',lambda:dict(own=child._axis.get_view_interval(),label=f(1.)),name=name)
        child.draw(None)
        observe('complete original draw syncs before super formats',lambda:dict(own=child._axis.get_view_interval(),label=f(1.),delegate_label=child.draw_label,events=child.sync_events.copy()),name=name)

    metadata=dict(source_hashes={name:hashlib.sha256((P.parent/name).read_bytes()).hexdigest()for name in ['ticker.py','axis.py','transforms.py','figure.py','cbook.py','axes/_secondary_axes.py','axes/_base.py']},
     percent_class_hash=hashlib.sha256(ast.get_source_segment(P.read_text(),node).encode()).hexdigest(),
     getset_factory_hash=hashlib.sha256(ast.get_source_segment(axis_path.read_text(),factory).encode()).hexdigest(),
     runtime=dict(python=sys.version.split()[0],numpy=np.__version__))

    from operator import attrgetter
    frame=[]
    base_tree=ast.parse((P.parent/'axes/_base.py').read_text())
    base_node=next(n for n in base_tree.body if isinstance(n,ast.ClassDef) and n.name=='_AxesBase')
    def get_method(tree,cls,name):return next(n for n in next(n for n in tree.body if isinstance(n,ast.ClassDef) and n.name==cls).body if isinstance(n,ast.FunctionDef) and n.name==name)
    draw=get_method(base_tree,'_AxesBase','draw');draw=copy.deepcopy(draw);draw.decorator_list=[]
    title=get_method(base_tree,'_AxesBase','_update_title_position')
    figure_tree=ast.parse((P.parent/'figure.py').read_text());layout=get_method(figure_tree,'FigureBase','_get_draw_artists')
    def draw_list(renderer,axes,artists,*args):
        frame.append(('artist_order',[(getattr(a,'frame_label','?'),a.zorder)for a in artists]))
        for artist in artists:artist.draw(renderer)
    globals_draw=dict(ns,attrgetter=attrgetter,mimage=types.SimpleNamespace(_draw_list_compositing_images=draw_list))
    exec(compile(ast.Module(body=[draw,title,layout],type_ignores=[]),str(P.parent/'axes/_base.py'),'exec'),globals_draw)
    class Renderer:
        def open_group(self,*a,**k):pass
        def close_group(self,*a,**k):pass
    class DummyPatch:
        zorder=-1;frame_label='patch'
        def draw(self,r):pass
        def get_animated(self):return False
        def get_zorder(self):return self.zorder
    for orientation in ['x','y']:
        frame.clear();parent=Axes(label='frame-parent');getattr(parent,'set_'+orientation+'lim')((0.,4.))
        child=full['SecondaryAxis'](parent,orientation,'top'if orientation=='x'else'right',(lambda x:2*x+5,lambda x:(x-5)/2))
        child.label='frame-secondary';child.zorder=0;child.frame_label='secondary';child.get_animated=lambda:False
        child.get_zorder=lambda:child.zorder;child.get_axes_locator=lambda:None
        percent_secondary=F();child._axis.set_major_formatter(percent_secondary)
        # Original Secondary draw -> controlled super.draw observes its formatter.
        primary=parent._axis_map[orientation]
        primary_percent=F();primary_percent.set_axis(primary)
        callback_rows=[]
        def callback(value,pos):
            if pos==0:getattr(parent,'set_'+orientation+'lim')((0.,.04))
            r=dict(pos=pos,primary=primary_percent(1.),secondary=percent_secondary(1.),secondary_own=clean(child._axis.get_view_interval()))
            callback_rows.append(r);frame.append(('parent.callback',r));return str(pos)
        primary.set_major_locator(ns['FixedLocator'](np.array([0.,1.,2.])))
        primary.set_minor_locator(ns['FixedLocator'](np.array([.25,.5])))
        primary.set_major_formatter(ns['FuncFormatter'](callback))
        primary.set_minor_formatter(F())
        for name,axis in parent._axis_map.items():
            axis.zorder=1.5;axis.frame_label='primary-'+name;axis.get_animated=lambda:False
            if axis is not primary:
                axis.set_major_locator(ns['NullLocator']());axis.set_minor_locator(ns['NullLocator']())
            def axisdraw(renderer,axis=axis):
                ticks=axis._update_ticks();frame.append((axis.frame_label+'.draw',[(float(t.get_loc()),t.label1.text)for t in ticks]))
            axis.draw=axisdraw
        patch=DummyPatch();parent.patch=patch;parent.zorder=0;parent.get_animated=lambda:False;parent.get_zorder=lambda:0
        parent.get_children=lambda:[parent.xaxis,parent.yaxis,child,patch]
        parent.get_visible=lambda:True;parent._unstale_viewLim=lambda:None;parent.get_gid=lambda:None
        parent.get_axes_locator=lambda:None;parent.apply_aspect=lambda *a:frame.append(('parent.apply_aspect',None))
        parent.axison=True;parent._frameon=False;parent.spines={};parent._autotitlepos=None
        parent.title=parent._left_title=parent._right_title=types.SimpleNamespace(get_text=lambda:'')
        parent._update_title_position=lambda r:globals_draw['_update_title_position'](parent,r)
        parent._rasterization_zorder=None
        fig=types.SimpleNamespace(canvas=types.SimpleNamespace(is_saving=lambda:False),suppressComposite=None)
        parent.get_figure=lambda **k:fig
        fig.patch=DummyPatch();fig._localaxes=[parent];fig.get_children=lambda:[fig.patch,parent]
        before=percent_secondary(1.)
        globals_draw['_get_draw_artists'](fig,Renderer())
        after_layout=percent_secondary(1.)
        globals_draw['draw'](parent,Renderer())
        after_frame=percent_secondary(1.)
        first_draw_label=child.draw_label
        child.draw(Renderer())
        row=dict(name=orientation,before_layout=before,after_layout=after_layout,parent_callbacks=callback_rows,
                 default_secondary_draw_label=first_draw_label,after_parent_draw=after_frame,after_explicit_child_draw=child.draw_label,
                 trace=frame.copy())
        rows.append(dict(label='complete original Figure layout and Axes draw ordered callbacks',value=row,error=None,message=None,view_events=[]))


    # Source setter stage for secondary synchronization, with identity units and
    # GUI broadcast disabled, retaining the complete actual validation/NS body.
    axis_node=next(n for n in ast.parse(axis_path.read_text()).body if isinstance(n,ast.ClassDef) and n.name=='Axis')
    for name in ['_set_lim','limit_range_for_scale','_get_autoscale_on','_set_autoscale_on']:
        method=next(n for n in axis_node.body if isinstance(n,ast.FunctionDef) and n.name==name)
        exec(compile(ast.Module(body=[method],type_ignores=[]),str(axis_path),'exec'),ns)
        setattr(ActualAxis,name,ns[name])
    method=get_method(base_tree,'_AxesBase','_validate_converted_limits')
    exec(compile(ast.Module(body=[method],type_ignores=[]),str(P.parent/'axes/_base.py'),'exec'),ns)
    Axes._validate_converted_limits=ns['_validate_converted_limits']
    Axes._process_unit_info=lambda *a,**k:None
    ActualAxis.convert_units=lambda self,value:value
    ActualAxis.get_minpos=lambda self:np.inf
    for name in ['x','y']:
        actual_setter=ns['_make_getset_interval']('view','viewLim','interval'+name)[1]
        # Dispatch through original generated setter for either concrete axis name.
        if name=='x':xsetter=actual_setter
        else:ysetter=actual_setter
    ActualAxis.set_view_interval=lambda self,lo,hi,**kwargs:(xsetter if self.axis_name=='x' else ysetter)(self,lo,hi,**kwargs)
    for name in ['x','y']:
        for mode in ['equal5','equal0','tiny','maxfinite','nan','inf','overflow']:
            parent=Axes(label='setter-parent');getattr(parent,'set_'+name+'lim')((0.,4.))
            child=full['SecondaryAxis'](parent,name,'top'if name=='x'else'right',(lambda x:2*x+5,lambda x:(x-5)/2))
            child.label='setter-secondary';child._stale_viewlims={'x':False,'y':False}
            for axis in child._axis_map.values():axis._autoscale_on=False
            def checked_set(bounds,child=child):return child._axis._set_lim(*bounds,emit=False,auto=False)
            setattr(child,'set_'+name+'lim',checked_set)
            constants={'equal5':5.,'equal0':0.,'tiny':math.ulp(0.),'maxfinite':sys.float_info.max,'nan':math.nan,'inf':math.inf}
            if mode=='overflow':
                getattr(parent,'set_'+name+'lim')((0.,sys.float_info.max))
                forward=lambda values:values*2
            else:forward=lambda values,v=constants[mode]:np.full_like(values,v)
            child._functions=(forward,lambda values:values)
            result=observe('secondary sync uses original _set_lim validation',lambda:child._set_lims(),name=name,mode=mode)
            result['own_after']=clean(child._axis.get_view_interval())

    # A log parent installs a functionlog scale during the real constructor.
    # Its changed locator default invokes original autoscale_view before any
    # parent limits are forwarded.  Use null dataLim and real Bbox mutation flags.
    class LogBaseSink(BaseSink):
        def __init__(self,*args,**kwargs):
            super().__init__(*args,**kwargs)
            self.dataLim=tr['Bbox'].null()
            self._tight=False;self._xmargin=self._ymargin=.05
            self.use_sticky_edges=True;self._stale_viewlims={'x':False,'y':False}
            self.callbacks=types.SimpleNamespace(process=lambda *a:None)
            self._request_autoscale_view=lambda *a,**k:None
            for axis in self._axis_map.values():axis._autoscale_on=True
        autoscale_view=Axes.autoscale_view
        _process_unit_info=lambda self,values,*a,**k:[v[1]for v in values]
        set_xlim=ns['asinh_set_xlim_checked']
        set_ylim=ns['asinh_set_ylim_checked']
    log_full=dict(full,_AxesBase=LogBaseSink)
    exec(compile(ast.Module(body=[complete_secondary],type_ignores=[]),str(secondary_path),'exec'),log_full)
    for name in ['x','y']:
        for mapping in ['identity','affine']:
            parent=Axes(label='log-constructor-parent')
            getattr(parent,'set_'+name+'scale')('log')
            getattr(parent,'set_'+name+'lim')((1.,100.))
            functions=(lambda x:x,lambda x:x)if mapping=='identity'else(lambda x:2*x+5,lambda x:(x-5)/2)
            child=log_full['SecondaryAxis'](parent,name,'top'if name=='x'else'right',functions)
            child.label='log-constructor-secondary';f=F();child._axis.set_major_formatter(f)
            observe('log-parent complete constructor autoscale default',lambda:dict(own=child._axis.get_view_interval(),label=f(1.)),name=name,mapping=mapping)
            child.apply_aspect()
            observe('log-parent original apply_aspect clamps functionlog limits',lambda:dict(own=child._axis.get_view_interval(),label=f(1.)),name=name,mapping=mapping)

    for name in ['x','y']:
        for failure in [None,'major','minor']:
            axes=Axes(label='fullbatch');getattr(axes,'set_'+name+'lim')((0.,4.))
            current=axes._axis_map[name]
            current.set_major_locator(ns['FixedLocator'](np.array([-1.,0.,2.,5.])))
            current.set_minor_locator(ns['FixedLocator'](np.array([-2.,0.,1.,2.,3.,6.])))
            major,minor=F(),F();current.set_major_formatter(major);current.set_minor_formatter(minor)
            if failure:
                def poison(i):raise ValueError('poison '+failure+' range')
                (major if failure=='major'else minor).set_axis(Provider(poison))
            result=run_update(P,ns,current,{id(major):'major',id(minor):'minor'})
            rows.append(dict(label='original update_ticks Percent full batches precede visibility',name=name,failure=failure,result=result))

    metadata["source_hashes"].update(percent_ns["source_hashes"])
    metadata["source_hashes"]["artist.py"]=hashlib.sha256((P.parent/"artist.py").read_bytes()).hexdigest()
    with warnings.catch_warnings(),np.errstate(all='ignore'):
        warnings.simplefilter('ignore',RuntimeWarning)
        for raw in [0,False]:
            for profile in ['dummy-default','PythonFloat','NumPyFloat','NumPyInt64']:
                f=F();f.xmax=raw;f.create_dummy_axis()
                if profile=='PythonFloat':f.axis.set_view_interval(0.,1.)
                elif profile=='NumPyFloat':f.axis.set_view_interval(np.float64(0.),np.float64(1.))
                elif profile=='NumPyInt64':f.axis.set_view_interval(np.int64(0),np.int64(1))
                observe('raw integer zero xmax preserves dummy range origin',lambda:f.format_ticks(np.array([1.])),raw='Boolean'if raw is False else'Integer',profile=profile)
    f=F()
    def later_poison(i):
        if i==2:raise ValueError('second view fails')
        return(0.,1.)
    provider=Provider(later_poison);f.set_axis(provider)
    late=observe('later provider error preserves full batch locations',lambda:f.format_ticks([1.,2.,3.]))
    late['calls']=provider.count;late['locations']=clean(f._locs)
    for view in [[],[1.],[0.,1.,2.]]:
        f=F(xmax=0.);f.set_axis(Provider(lambda i,view=view:view))
        observe('view unpack precedes percent conversion',lambda:f(1.),view=clean(view))
    return dict(metadata=metadata, observations=rows)


def number(value):
    from generate_symlog_axis_reference import num
    if isinstance(value,dict):value=float.fromhex(value['hex'])
    return num(value)


def array(values):
    return '['+', '.join(number(v)for v in values)+']'


def quoted(value):return json.dumps(value,ensure_ascii=False)


def emit_tests(reference):
    tests=[]
    fixture='''  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
'''
    def add(label,body):
        tests.append('///|\ntest '+quoted('PercentFormatter original axis '+str(len(tests))+' '+label)+' {\n'+fixture+body+'}\n')
    def ctor(row,xmax=None):
        args=[]
        if row.get('decimals')is not None:args.append('decimals=@ticker.PercentDecimals::Number('+number(row['decimals'])+')')
        if xmax is not None:args.append('xmax=@ticker.PercentXMax::Number('+number(xmax)+')')
        return '  let f = @ticker.PercentFormatter::new('+', '.join(args)+')\n'
    def check(row,expr,value=None):
        if row.get('error'):
            return '  let failed = try {\n    ignore('+expr+')\n    false\n  } catch {\n    @core.DataError::InvalidTicks(message~) => {\n      assert_eq(message, '+quoted(row['error']+': '+row['message'])+')\n      true\n    }\n    _ => false\n  }\n  assert_true(failed)\n'
        if value is None:value=row['value']
        expected=quoted(value) if isinstance(value,str)else '['+', '.join(quoted(v)for v in value)+']'
        return '  assert_eq('+expr+', '+expected+')\n'
    def binding(view):
        return '  let binding = @ticker.FormatterAxisBinding::new()\n  binding.set_view_interval('+view+')\n  f.set_axis(Some(binding))\n'
    def scene(name):
        return '  let figure = @scene.figure(width=300, height=180)\n  let axes = figure.axes()\n  axes.set_x_limits(0.0, 4.0)\n  axes.set_y_limits(0.0, 4.0)\n  axes.set_x_locator(@ticker.NullLocator::new().as_locator())\n  axes.set_y_locator(@ticker.NullLocator::new().as_locator())\n  let axis = axes.'+name+'_axis()\n  ignore(axis)\n'
    def secondary(name,forward='value * 2.0 + 5.0',inverse='(value - 5.0) / 2.0'):
        return '  let secondary = axes.secondary_'+name+'axis(fn('+('value'if forward.startswith('value') else'_')+') { return '+forward+' }, fn(value) { return '+inverse+' })\n  secondary.set_named_formatter(f.as_base_formatter())\n'
    def view_assert(view,owner='binding',relative=False):
        vals=view['values'] if isinstance(view,dict) else view
        body='  match '+owner+'.view_interval() {\n    @ticker.FormatterViewInterval::NdArray(view) => {\n      assert_eq(view.length(), 2)\n'
        for i,v in enumerate(vals):
            expected=number(v)
            if relative and float.fromhex(v['hex']) not in [0.,float('inf'),float('-inf')]:
                body+='      assert_true((view.get('+str(i)+') / '+expected+' - 1.0).abs() <= 1.0e-12)\n'
            else:body+='      assert_eq(view.get('+str(i)+'), '+expected+')\n'
        return body+'    }\n    _ => fail("expected the real axis ndarray view")\n  }\n'
    for row in reference['observations']:
        label=row['label'];body='';v=row.get('value');name=row.get('name','x')
        if label in ['unbound call reads axis first','unbound direct format_pct bypasses axis','unbound empty batch never reads axis','unbound nonempty batch fails after set_locs']:
            body=ctor(row)
            expr={'unbound call reads axis first':'f.call(-1.0)','unbound direct format_pct bypasses axis':'f.format_pct(-1.0, 1.0)','unbound empty batch never reads axis':'f.format_ticks([])','unbound nonempty batch fails after set_locs':'f.format_ticks([1.0])'}[label]
            body+=check(row,expr)
            if label.endswith('after set_locs'):body+='  assert_eq(f.locations().length(), 1)\n  assert_eq(f.locations().get(0), 1.0)\n'
        elif label=='dummy default exact view and label':
            body=ctor(row)+'  f.create_dummy_axis(minpos=-1.0)\n'+check(row,'f.call(-1.0)',v['label'])+'''  let binding = f.axis().unwrap()
  assert_eq(binding.dummy_minpos(), Some(-1.0))
  match binding.view_interval() {
    @ticker.FormatterViewInterval::Integers(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view[0].to_string(), "0")
      assert_eq(view[1].to_string(), "1")
    }
    _ => fail("dummy defaults must retain Python integers")
  }
'''
        elif label=='dummy mutable range query':
            body=ctor(row)+'  f.create_dummy_axis()\n  f.axis().unwrap().set_view_interval(@ticker.FormatterViewInterval::Sequence('+array(row['view'])+'))\n'+check(row,'f.call(-1.0)')
        elif label=='dummy create is no-op while bound':
            body=ctor(row)+'''  f.create_dummy_axis(minpos=-1.0)
  let old = f.axis()
  f.create_dummy_axis(minpos=99.0)
  assert_eq(f.axis(), old)
  assert_eq(f.axis().unwrap().dummy_minpos(), Some(-1.0))
'''
        elif label=='copy retains old dummy and new dummy resets view':
            body=ctor(row)+'''  f.create_dummy_axis(minpos=-1.0)
  f.axis().unwrap().set_view_interval(@ticker.FormatterViewInterval::Sequence([@double.neg_infinity, @double.infinity]))
  let copied = f.copy()
  f.set_axis(None)
  f.create_dummy_axis(minpos=3.0)
  assert_true(copied.axis() != f.axis())
  assert_eq(copied.axis().unwrap().dummy_minpos(), Some(-1.0))
  assert_eq(f.axis().unwrap().dummy_minpos(), Some(3.0))
  match copied.axis().unwrap().view_interval() {
    @ticker.FormatterViewInterval::Sequence(view) => assert_eq(view, [@double.neg_infinity, @double.infinity])
    _ => fail("copy must retain old interval object")
  }
  match f.axis().unwrap().view_interval() {
    @ticker.FormatterViewInterval::Integers(view) => {
      assert_eq(view[0].to_string(), "0")
      assert_eq(view[1].to_string(), "1")
    }
    _ => fail("new dummy must restore the integer default")
  }
'''
        elif label in ['batch reads changing view once per value','batch original locs retained']:
            body=ctor(row)+'''  let count = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    count.val += 1
    let upper = if count.val == 1 { 100.0 } else if count.val == 2 { 10.0 } else { 1.0 }
    @ticker.FormatterViewInterval::Sequence([0.0, upper])
  })
  f.set_axis(Some(binding))
'''+check({'value':['1%','1.0%','1.00%']},'f.format_ticks([1.0, 1.0, 1.0])')+'''  assert_eq(count.val, 3)
  assert_eq(f.locations().length(), 3)
  assert_eq(f.locations().get(2), 1.0)
'''
        elif label=='all inherited calls use view':
            body=ctor(dict(decimals=2))+binding('@ticker.FormatterViewInterval::Sequence([0.0, 1.0])')
            method='call'if row['method']=='__call__'else row['method']
            body+=check(row,'f.'+method+'(-1.0)')
        elif label=='view failure precedes x zero division':
            body=ctor(row,0.)+'''  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    raise @core.DataError::InvalidTicks(message="ValueError: poison view")
  })
  f.set_axis(Some(binding))
'''+check(row,'f.call(1.0)')+'  assert_eq(calls.val, 1)\n'
        elif label=='view callback parameter mutation is visible same call':
            body=ctor(row)+'''  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    f.set_decimals(@ticker.PercentDecimals::Number(0.0))
    @ticker.FormatterViewInterval::Sequence([0.0, 1.0])
  })
  f.set_axis(Some(binding))
'''+check(row,'f.call(1.0)')
        elif label=='view callback changes rc before same-call fix_minus':
            body=ctor(row)+'''  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @config.set_unicode_minus(calls.val % 2 == 0)
    @ticker.FormatterViewInterval::Sequence([0.0, 1.0])
  })
  f.set_axis(Some(binding))
'''+check(row,'f.format_ticks([-1.0, -1.0, -1.0])')+'  assert_eq(calls.val, 3)\n'
        elif label in ['actual generated Axis getter reads Bbox Float64','actual primary view change observed immediately']:
            body=scene(name)+ctor(row)+'  axis.set_named_formatter(f.as_base_formatter())\n'
            if label.endswith('immediately'):body+='  axes.set_'+name+'_limits(0.0, 100.0)\n'+check(row,'f.call(1.0)')
            else:body+=check(row,'f.call(1.0)',v['label'])+view_assert(v['view'],'axis.formatter_axis_binding()')
        elif label in ['secondary uses own stored converted range','secondary parent changed before _set_lims keeps own range','secondary original _set_lims refreshes own range','complete Secondary constructor before first sync','complete original apply_aspect syncs before delegate','complete Secondary remains stale after parent change','complete original draw syncs before super formats']:
            body=scene(name)+ctor(row)+secondary(name)
            if label not in ['complete Secondary constructor before first sync']:body+='  secondary.apply_aspect()\n'
            if label in ['secondary parent changed before _set_lims keeps own range','secondary original _set_lims refreshes own range','complete Secondary remains stale after parent change','complete original draw syncs before super formats']:
                body+='  axes.set_'+name+'_limits(0.0, 0.04)\n'
            if label=='secondary original _set_lims refreshes own range':body+='  secondary.apply_aspect()\n'
            if label=='complete original draw syncs before super formats':body+='  ignore(figure.to_svg_checked())\n'
            body+=check(row,'f.call(1.0)',v['label'])+view_assert(v['own'],'secondary.formatter_axis_binding()')
        elif label in ['shared last formatter setter owns both live reads','original shared deletion rebinds both installed','shared deletion live rebind vs external copies']:
            body='''  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_'''+name+'''=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.'''+name+'''_axis()
  let b = second.'''+name+'''_axis()
  a.set_limits(0.0, 1.0)
  b.set_limits(0.0, 100.0)
  a.bind_view_interval(() => { (0.0, 1.0) })
  b.bind_view_interval(() => { (0.0, 100.0) })
  let major = @ticker.PercentFormatter::new()
  let minor = @ticker.PercentFormatter::new()
  first.set_'''+name+'''_named_formatter(major.as_base_formatter())
  first.set_'''+name+'''_minor_named_formatter(minor.as_base_formatter())
  let old_major = major.copy()
  let old_minor = minor.copy()
  second.set_'''+name+'''_named_formatter(major.as_base_formatter())
  second.set_'''+name+'''_minor_named_formatter(minor.as_base_formatter())
  let external_major = major.copy()
  let external_minor = minor.copy()
  assert_eq([major.call(1.0), minor.call(1.0)], ["1%", "1%"])
  assert_eq([old_major.call(1.0), old_minor.call(1.0)], ["1.00%", "1.00%"])
  assert_eq(major.axis(), Some(b.formatter_axis_binding()))
  assert_eq(minor.axis(), Some(b.formatter_axis_binding()))
'''
            if label!='shared last formatter setter owns both live reads':body+='''  second.remove()
  assert_eq([major.call(1.0), minor.call(1.0)], ["1.00%", "1.00%"])
  assert_eq([external_major.call(1.0), external_minor.call(1.0)], ["1%", "1%"])
  assert_eq(major.axis(), Some(a.formatter_axis_binding()))
  assert_eq(minor.axis(), Some(a.formatter_axis_binding()))
'''
            else:body+='  assert_eq(external_major.axis(), external_minor.axis())\n'
        elif label=='view scalar origin controls second conversion':
            body=ctor(row,0.)
            profile=row['profile']
            if profile=='actual-axis':body=scene('x')+body+'  axes.set_x_limits(0.0, 1.0)\n  axis.set_named_formatter(f.as_base_formatter())\n'
            else:
                body+='  f.create_dummy_axis()\n'
                if profile!='dummy-default':
                    view='@ticker.FormatterViewInterval::Sequence([0.0, 1.0])'if profile=='dummy-PythonFloat'else'@ticker.FormatterViewInterval::NdArray(@ticker.TickValues::from_array([0.0, 1.0]))'
                    body+='  f.axis().unwrap().set_view_interval('+view+')\n'
            body+=check(row,'f.format_ticks_view(@ticker.TickValues::from_array([1.0]))',None if row.get('error')else[row['value']])
        elif label=='NdArray Int64 view subtraction and abs retain wrap':
            ints='['+', '.join(s+'L'if s!='-9223372036854775808'else'(-9223372036854775807L - 1L)'for s in row['bounds'])+']'
            body=ctor(row,row['xmax'])+binding('@ticker.FormatterViewInterval::NdArray(@ticker.TickValues::from_int64_array('+ints+'))')+check(row,'f.format_ticks_view(@ticker.TickValues::from_array([1.0]))',None if row.get('error')else[v['label']])
        elif label=='complete original Figure layout and Axes draw ordered callbacks':
            name=v['name'];body=scene(name)+ctor(row)+secondary(name)+'''  let secondary_percent = f
  secondary.set_locator(@ticker.FixedLocator::new([5.0, 7.0, 13.0]).as_locator())
  assert_eq(secondary_percent.call(1.0), '''+quoted(v['before_layout'])+''')
  let primary_percent = @ticker.PercentFormatter::new()
  primary_percent.set_axis(Some(axis.formatter_axis_binding()))
  let events : Array[String] = []
  let formatter = @ticker.FuncFormatter::new((_, pos) => {
    if pos == Some(0) { axes.set_'''+name+'''_limits(0.0, 0.04) }
    events.push(primary_percent.call(1.0) + "|" + secondary_percent.call(1.0))
    pos.unwrap().to_string()
  })
  axis.set_locator(@ticker.FixedLocator::new([0.0, 1.0, 2.0]).as_locator())
  axis.set_minor_locator(@ticker.FixedLocator::new([0.25, 0.5]).as_minor_locator())
  axis.set_named_formatter(formatter.as_base_formatter())
  axis.set_minor_named_formatter(@ticker.PercentFormatter::new().as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(events, '''+'['+', '.join(quoted(x['primary']+'|'+x['secondary'])for x in v['parent_callbacks'])+'''])
  assert_eq(secondary_percent.call(1.0), '''+quoted(v['after_parent_draw'])+''')
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_true(!svg.contains(">1<"))
  assert_true(!svg.contains(">2<"))
  secondary.apply_aspect()
  assert_eq(secondary_percent.call(1.0), '''+quoted(v['after_explicit_child_draw'])+''')
'''
        elif label=='secondary sync uses original _set_lim validation':
            constants={'equal5':'5.0','equal0':'0.0','tiny':'4.9406564584124654e-324','maxfinite':'@double.max_value','nan':'@double.not_a_number','inf':'@double.infinity'}
            mode=row['mode'];forward='value * 2.0'if mode=='overflow'else constants[mode]
            body=scene(name)+ctor(row)
            if mode=='overflow':body+='  axes.set_'+name+'_limits(0.0, @double.max_value)\n'
            body+=secondary(name,forward,'value')
            if row.get('error'):
                body+=check(row,'secondary.apply_aspect()')
            else:body+='  secondary.apply_aspect()\n'
            body+=view_assert(row['own_after'],'secondary.formatter_axis_binding()')
        elif label.startswith('log-parent '):
            body=scene(name)+ctor(row)+'  axes.set_'+name+'_limits(1.0, 100.0)\n  axes.set_'+name+'_scale(@scale.log_scale())\n'
            if row['mapping']=='identity':body+=secondary(name,'value','value')
            else:body+=secondary(name)
            if 'apply_aspect' in label:body+='  secondary.apply_aspect()\n'
            body+=check(row,'f.call(1.0)',v['label'])+view_assert(v['own'],'secondary.formatter_axis_binding()',relative=True)
        elif label=='later provider error preserves full batch locations':
            body=ctor(row)+'''  let count = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    count.val += 1
    if count.val == 2 { raise @core.DataError::InvalidTicks(message="ValueError: second view fails") }
    @ticker.FormatterViewInterval::Sequence([0.0, 1.0])
  })
  f.set_axis(Some(binding))
'''+check(row,'f.format_ticks([1.0, 2.0, 3.0])')+'  assert_eq(count.val, '+str(row['calls'])+')\n  assert_eq(f.locations().length(), 3)\n  assert_eq(f.locations().get(2), 3.0)\n'
        elif label=='view unpack precedes percent conversion':
            body=ctor(row,0.)+binding('@ticker.FormatterViewInterval::Sequence('+array(row['view'])+')')+check(row,'f.call(1.0)')
        elif label=='raw integer zero xmax preserves dummy range origin':
            body=ctor(row)+'  f.set_xmax(@ticker.PercentXMax::'+('Boolean(false)'if row['raw']=='Boolean'else'Integer(@bigint.BigInt::from_int(0))')+')\n  f.create_dummy_axis()\n'
            profile=row['profile']
            if profile!='dummy-default':
                views={'PythonFloat':'@ticker.FormatterViewInterval::Sequence([0.0, 1.0])','NumPyFloat':'@ticker.FormatterViewInterval::NdArray(@ticker.TickValues::from_array([0.0, 1.0]))','NumPyInt64':'@ticker.FormatterViewInterval::NdArray(@ticker.TickValues::from_int64_array([0L, 1L]))'}
                body+='  f.axis().unwrap().set_view_interval('+views[profile]+')\n'
            body+=check(row,'f.format_ticks_view(@ticker.TickValues::from_array([1.0]))')
        elif label=='original update_ticks Percent full batches precede visibility':
            result=row['result'];body=scene(name)+'''  let major = @ticker.PercentFormatter::new()
  let minor = @ticker.PercentFormatter::new()
  axis.set_locator(@ticker.FixedLocator::new([-1.0, 0.0, 2.0, 5.0]).as_locator())
  axis.set_minor_locator(@ticker.FixedLocator::new([-2.0, 0.0, 1.0, 2.0, 3.0, 6.0]).as_minor_locator())
  axis.set_named_formatter(major.as_base_formatter())
  axis.set_minor_named_formatter(minor.as_base_formatter())
'''
            if row['failure']:
                level=row['failure'];body+='''  let poison = @ticker.FormatterAxisBinding::new()
  poison.bind_view_interval(() => { raise @core.DataError::InvalidTicks(message="ValueError: poison '''+level+''' range") })
  '''+level+'''.set_axis(Some(poison))
'''+check(dict(error=result['error'],message=result['message']),'figure.to_svg_checked()')
            else:
                body+='  let svg = figure.to_svg_checked()\n'
                for tick in result['values']:body+='  assert_eq(svg.split('+quoted('>'+tick['label']+'<')+').count() - 1, 1)\n'
                for label_hidden in ['−1.00%','5.00%','−2.00%','6.00%']:body+='  assert_true(!svg.contains('+quoted('>'+label_hidden+'<')+'))\n'
            for entry in result['set_locs']:
                level=entry['level'];body+='  assert_eq('+level+'.locations().length(), '+str(len(entry['values']))+')\n'
                for i,val in enumerate(entry['values']):body+='  assert_eq('+level+'.locations().get('+str(i)+'), '+number(val)+')\n'
            if row['failure']=='major':body+='  assert_eq(minor.locations().length(), 0)\n'
        else:raise AssertionError(label)
        add(label,body)
    return '// Generated from complete pinned Percent/Axis/Secondary/Figure AST bodies.\n\n'+'\n'.join(tests),len(tests)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('ticker',type=Path)
    parser.add_argument('--check',action='store_true')
    args=parser.parse_args()
    reference=collect_source(args.ticker)
    code,count=emit_tests(reference)
    reference['metadata']['scope']='Complete original PercentFormatter, real _api/deprecation, generated Bbox interval getters, Axis binding/update_ticks/set_lim, Grouper/Figure removal, complete SecondaryAxis, original Figure layout and Axes draw sorting; GUI/Text/units/constructor storage sinks are explicit. Fixed default data/.05 margin log-constructor profile, not full implicit scale/default lifecycle.'
    reference['metadata']['counts']=dict(observations=len(reference['observations']),generated_tests=count)
    outputs={ROOT/'testdata/percent_formatter_axis_reference.json':json.dumps(reference,ensure_ascii=False,indent=2)+'\n',ROOT/'scene/percent_formatter_axis_reference_test.mbt':formatted(code)}
    for path,content in outputs.items():
        if args.check:
            if not path.exists()or path.read_text()!=content:raise SystemExit('stale reference: '+str(path))
        else:path.write_text(content)
    print(str(len(reference['observations']))+' original source observations, '+str(count)+' generated axis tests'+(' checked'if args.check else' generated'))


if __name__=='__main__':main()
