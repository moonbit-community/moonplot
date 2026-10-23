"""Complete original log-formatter family with actual Axis/context/draw bodies.

Explicit unit/Text/renderer sinks are inherited from accepted Axis references;
no Moon formatter or translated numeric algorithm supplies expected values.
"""
from pathlib import Path
import argparse,ast,copy,hashlib,json,math,sys,types,warnings
from collections import Counter
import numpy as np
from formatter_reference_source import load_log_formatters
from generate_basic_formatter_axis_reference import load as load_axis
from generate_auto_date_reference import formatted,moon
ROOT=Path(__file__).resolve().parents[1]
GROUP_SIZE=32
CLASSES=['LogFormatter','LogFormatterExponent','LogFormatterMathtext','LogFormatterSciNotation']


def load(path):
    ns,tr,Axes,Secondary,old=load_axis(path)
    old_rc=dict(ns['mpl'].rcParams)
    real=load_log_formatters(path)
    for key,value in old_rc.items():
        if key not in real['mpl'].rcParams:real['mpl'].rcParams._set(key,value)
    for name in ['TickHelper','Formatter','NullFormatter','FixedFormatter','FuncFormatter','ScalarFormatter','_api','mpl','cbook']+CLASSES:
        ns[name]=real[name]
    ns['warning_messages']=real['external_warnings']
    tree=ast.parse(path.read_text())
    for name in ['Locator','NullLocator','FixedLocator','LinearLocator','MultipleLocator','IndexLocator','AutoMinorLocator','MaxNLocator','AutoLocator','LogLocator','SymmetricalLogLocator','AsinhLocator','LogitLocator']:
        node=next(n for n in tree.body if isinstance(n,ast.ClassDef)and n.name==name)
        exec(compile(ast.Module(body=[node],type_ignores=[]),str(path),'exec'),ns)
    ns['mticker']=types.SimpleNamespace(**{name:ns[name]for name in ['TickHelper','Formatter','NullFormatter','FixedFormatter','FuncFormatter','ScalarFormatter','Locator','FixedLocator','NullLocator']+CLASSES})
    return ns,tr,Axes,Secondary,real


def collect(path):
    P=Path(path);ns,tr,Axes,Secondary,real=load(P)
    source=P.read_text();tree=ast.parse(source);classes=CLASSES;cpath=P.with_name('cbook.py')
    ns['mpl'].rcParams._set('_internal.classic_mode',False)
    ns['mpl'].rcParams._set('axes.formatter.min_exponent',0)
    events=[];rows=[]
    def clean(v):
     if isinstance(v,np.ndarray):return dict(dtype=str(v.dtype),values=[clean(x)for x in v])
     if isinstance(v,set):return dict(set=sorted([clean(x)for x in v],key=repr))
     if isinstance(v,(list,tuple)):return[clean(x)for x in v]
     if isinstance(v,(bool,np.bool_)):return bool(v)
     if isinstance(v,(float,np.floating)):return dict(type=type(v).__name__,hex=float(v).hex())
     if isinstance(v,np.integer):return dict(type=type(v).__name__,value=str(v))
     if isinstance(v,dict):return{k:clean(x)for k,x in v.items()}
     return v
    def state(f):return dict(locs=clean(f._locs),sublabels=clean(f._sublabels),label_only=f.labelOnlyBase,linthresh=clean(f._linthresh),axis=getattr(vars(f.axis).get('axes')if f.axis is not None else None,'label',None))
    def obs(label,fn,f=None,**meta):
     events.clear()
     with warnings.catch_warnings(record=True)as w:
      warnings.simplefilter('always')
      try:value,error,message=clean(fn()),None,None
      except Exception as exc:value,error,message=None,type(exc).__name__,str(exc)
     row=dict(label=label,value=value,error=error,message=message,events=events.copy(),runtime_warnings=[str(x.message)for x in w],**meta)
     if f is not None:row['state_after']=state(f)
     rows.append(row);return row
    class TransformProbe:
     def __init__(self,value=None,error=None):self.value,self.error=value,error
     @property
     def linthresh(self):
      events.append('transform.linthresh')
      if self.error:raise self.error('linthresh probe')
      if self.value is None:raise AttributeError('no linthresh')
      return self.value
    class AxisProbe:
     def __init__(self,view=(1.,2.),threshold=None,transform_error=None,attr_error=None,view_error=None):self.view,self.threshold,self.transform_error,self.attr_error,self.view_error=view,threshold,transform_error,attr_error,view_error
     def get_transform(self):
      events.append('axis.get_transform')
      if self.transform_error:raise self.transform_error('transform probe')
      return TransformProbe(self.threshold,self.attr_error)
     def get_view_interval(self):
      events.append('axis.view')
      if self.view_error:raise self.view_error('view probe')
      return self.view
     def __getattr__(self,key):raise RuntimeError('unexpected axis capability '+key)
    # set_locs ignores every input and keeps prior _locs; empty is not an early exit.
    for clsname in classes:
     for explicit in [None,2.]:
      for locs in [None,[],np.array([1.,2.])]:
       f=ns[clsname](linthresh=explicit);sentinel=[777.];ns['Formatter'].set_locs(f,sentinel);axis=AxisProbe(view=(-2.,2.)if explicit else(1.,2.));f.set_axis(axis)
       obs('ignored locations and only real context dependencies',lambda:(f.set_locs(locs),dict(retains=f._locs is sentinel,state=state(f)))[1],f,cls=clsname,explicit=explicit,input=clean(locs))
     for threshold in [math.inf,-math.inf]:
      f=ns[clsname](minor_thresholds=(threshold,math.nan));obs('infinite first threshold returns before all axis access',lambda:f.set_locs(None),f,cls=clsname,first=clean(threshold))
     for fault in ['transform-attribute','attribute-attribute','transform-value','view-value','view-attribute']:
      f=ns[clsname]();f.set_axis(AxisProbe(transform_error=AttributeError if fault=='transform-attribute'else ValueError if fault=='transform-value'else None,attr_error=AttributeError if fault=='attribute-attribute'else None,view_error=ValueError if fault=='view-value'else AttributeError if fault=='view-attribute'else None))
      obs('AttributeError-only transform fallback and view order',lambda:f.set_locs([]),f,cls=clsname,fault=fault)
     for method in ['__call__','format_data','format_data_short','get_offset']:
      f=ns[clsname]();obs('unbound direct data short offset methods',lambda:getattr(f,method)(2.)if method!='get_offset'else f.get_offset(),f,cls=clsname,method=method)
     f=ns[clsname](labelOnlyBase=True);obs('zero and label-only early call gates bypass axis',lambda:[f(0.),f(2.)],f,cls=clsname)
     f=ns[clsname](labelOnlyBase=True);f.set_axis(AxisProbe(view_error=ValueError));obs('format_data temporarily disables label-only and restores after result or error',lambda:f.format_data(2.),f,cls=clsname)
     f=ns[clsname](labelOnlyBase=True);f._sublabels={1};f.set_axis(AxisProbe(view_error=ValueError));obs('format_data preserves cached sublabel gate while disabling label-only',lambda:f.format_data(2.),f,cls=clsname)
     f=ns[clsname]();axis=AxisProbe();f.set_axis(axis)
     obs('narrow context preparation',lambda:(f.set_locs([]),f(2.))[1],f,cls=clsname)
     axis.view=(1.,1e6);obs('direct call retains cached filter after view change',lambda:f(2.),f,cls=clsname)
     obs('next empty preparation updates cached filter from new view',lambda:(f.set_locs([]),f(2.))[1],f,cls=clsname)
     f=ns[clsname](linthresh=2.);f.set_axis(AxisProbe(view=(-2.,2.),transform_error=ValueError));obs('explicit linthresh bypasses transform provider',lambda:(f.set_locs(None),f(2.))[1],f,cls=clsname)
    # A bound transform is consumed live only at subsequent preparation.
    for clsname in classes:
     f=ns[clsname]();axis=AxisProbe(view=(-2.,2.),threshold=2.);f.set_axis(axis)
     obs('live threshold initial symlog preparation',lambda:(f.set_locs([]),f(2.))[1],f,cls=clsname)
     axis.threshold=None;obs('transform threshold change alone retains old cache',lambda:f(2.),f,cls=clsname)
     obs('next preparation resolves current transform threshold again',lambda:(f.set_locs([]),f(2.))[1],f,cls=clsname)
    # Exact original Bbox interval getter for actual Axis/Secondary contexts.
    axispath=P.with_name('axis.py');atree=ast.parse(axispath.read_text());anode=next(n for n in atree.body if isinstance(n,ast.ClassDef)and n.name=='Axis');Axis=type(Axes().xaxis)
    factory=next(n for n in atree.body if isinstance(n,ast.FunctionDef)and n.name=='_make_getset_interval');exec(compile(ast.Module(body=[factory],type_ignores=[]),str(axispath),'exec'),ns)
    getters={n:ns['_make_getset_interval']('view','viewLim','interval'+n)[0]for n in ['x','y']};Axes.viewLim=property(lambda a:a._viewLim)
    def getview(self):events.append(self.axes.label+'.view.'+self.axis_name);return getters[self.axis_name](self)
    Axis.get_view_interval=getview
    original_transform=Axis.get_transform
    def gettransform(self):events.append(self.axes.label+'.transform.'+self.axis_name);return original_transform(self)
    Axis.get_transform=gettransform
    for clsname in classes:
     for name in ['x','y']:
      for scale,view in [('linear',(-2.,2.)),('log',(1.,100.)),('symlog',(-2.,2.))]:
       axes=Axes(label=scale);getattr(axes,'set_'+name+'scale')(scale);getattr(axes,'set_'+name+'lim')(view);axis=axes._axis_map[name];f=ns[clsname]();axis.set_major_formatter(f)
       obs('actual primary scale transform threshold context',lambda:dict(labels=f.format_ticks(np.array([-2.,-1.,0.,1.,2.,5.,10.])),transform=type(axis.get_transform()).__name__,threshold=getattr(axis.get_transform(),'linthresh',None)),f,cls=clsname,name=name,scale=scale)
      for scale in ['log','symlog']:
       parent=Axes(label='parent-'+scale);getattr(parent,'set_'+name+'scale')(scale);getattr(parent,'set_'+name+'lim')((1.,100.)if scale=='log'else(-2.,2.));child=Secondary(parent,name);child.label='secondary';child._functions=(lambda x:x,lambda x:x);child._parentscale=None;child._set_scale();child._set_lims();axis=child._axis;f=ns[clsname]();axis.set_major_formatter(f)
       obs('actual secondary own transform never inherits parent linthresh attribute',lambda:dict(labels=f.format_ticks(np.array([-2.,-1.,0.,1.,2.,5.,10.])),view=axis.get_view_interval(),transform=type(axis.get_transform()).__name__,threshold=getattr(axis.get_transform(),'linthresh',None)),f,cls=clsname,name=name,parent_scale=scale)
    # Complete Axis.draw, Text/layout/renderer storage only.
    draw=copy.deepcopy(next(n for n in anode.body if isinstance(n,ast.FunctionDef)and n.name=='draw'));draw.decorator_list=[];exec(compile(ast.Module(body=[draw],type_ignores=[]),str(axispath),'exec'),ns)
    class Renderer:
     def open_group(self,*a,**k):pass
     def close_group(self,*a,**k):pass
    class Text:
     def __init__(self,name):self.name,self.text=name,''
     def draw(self,r):events.append(self.name+'.draw')
     def set_text(self,value):self.text=value;events.append((self.name+'.text',value))
    def complete_draw(axis,f):
     axis.get_visible=lambda:True;axis.get_gid=lambda:None;axis._get_ticklabel_bboxes=lambda t,r:([],[]);axis._update_label_position=lambda r:None;axis._update_offset_text_position=lambda*a:None;axis.label=Text('label');axis.offsetText=Text('offset');old=axis._get_tick
     def tick(*a,**k):
      t=old(*a,**k);t.draw=lambda r:events.append(('tick.draw',float(t.get_loc()),t.label1.text));return t
     axis._get_tick=tick
     def trace(frame,event,arg):
      if event=='call'and frame.f_code.co_filename==str(P)and frame.f_code.co_name in ['set_locs','__call__','get_offset']and frame.f_locals.get('self')is f:events.append('formatter.'+frame.f_code.co_name)
      return trace
     sys.settrace(trace)
     try:ns['draw'](axis,Renderer())
     finally:sys.settrace(None)
     return dict(offset=axis.offsetText.text,state=state(f))
    for clsname in classes:
     for name in ['x','y']:
      for profile in ['normal','Null-after-cache','minor-replaces-major','offscreen-error']:
       axes=Axes(label='draw');getattr(axes,'set_'+name+'scale')('log');getattr(axes,'set_'+name+'lim')((1.,100.));axis=axes._axis_map[name];f=ns[clsname]();axis.set_major_formatter(f)
       values=[.5,1.,2.,10.,100.,200.]if profile!='offscreen-error'else[1.,math.nan,10.]
       axis.set_major_locator(ns['FixedLocator'](np.array(values)));axis.set_minor_locator(ns['FixedLocator'](np.array([3.,4.,5.])));axis.set_minor_formatter(ns['NullFormatter']())
       if profile=='Null-after-cache':
        f.set_locs([]);axis.set_major_locator(ns['NullLocator']());axis.set_minor_locator(ns['NullLocator']())
       elif profile=='minor-replaces-major':
        replacement=ns['FuncFormatter'](lambda v,p:'replacement');replacement.set_offset_string('late replacement offset')
        axis.set_minor_formatter(ns['FuncFormatter'](lambda v,p:(axis.set_major_formatter(replacement),'minor')[1]))
       elif profile=='offscreen-error':axis.set_minor_formatter(ns['FuncFormatter'](lambda v,p:(events.append('unexpected minor callback'),'minor')[1]))
       obs('complete actual Axis.draw full batch Null and late current offset',lambda:complete_draw(axis,f),f,cls=clsname,name=name,profile=profile,raw=clean(values))
    for clsname in classes:
     for name in ['x','y']:
      a,b=Axes(label='first'),Axes(label='second');getattr(a,'set_'+name+'lim')((1.,2.));getattr(b,'set_'+name+'lim')((1.,1e6));aa,bb=a._axis_map[name],b._axis_map[name];f=ns[clsname]();aa.set_major_formatter(f);f.set_locs([]);old=copy.copy(f)
      bb.major,bb.minor=aa.major,aa.minor;group=ns['Grouper']();group.join(b,a);a._shared_axes[name]=b._shared_axes[name]=group;bb.set_major_formatter(f)
      obs('shared owner binding does not invalidate cache before preparation',lambda:dict(direct=f(2.),live=f.format_ticks(np.array([1.,2.])),old=old.format_ticks(np.array([1.,2.]))),f,cls=clsname,name=name)
      external=copy.copy(f);fig=ns['FigureBase']();fig._axobservers=types.SimpleNamespace(process=lambda*a:None);fig._root_figure=types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda*a:None));fig._remove_axes(b,owners=[[a,b]])
      obs('actual shared removal rebind and detached-copy cache/view',lambda:dict(live=f.format_ticks(np.array([1.,2.])),external=external.format_ticks(np.array([1.,2.])),live_owner=f.axis.axes.label,external_owner=external.axis.axes.label),f,cls=clsname,name=name)
    # Offset/short and sign behavior is context independent for this family.
    for clsname in classes:
     f=ns[clsname]();f.set_axis(AxisProbe(view_error=ValueError,transform_error=ValueError))
     obs('short and offset never read view transform or pixel context',lambda:dict(short=f.format_data_short(-1e-3),offset=f.get_offset()),f,cls=clsname)
    return dict(counts=dict(total=len(rows),**Counter(r['error']or'success'for r in rows)),source_hashes={**real['source_hashes'],**{str(p.relative_to(P.parent)):hashlib.sha256(p.read_bytes()).hexdigest()for p in [P.with_name('axis.py'),cpath,P.with_name('transforms.py'),P.with_name('figure.py'),P.parent/'axes/_base.py',P.parent/'axes/_secondary_axes.py']}},class_hashes={n:hashlib.sha256(ast.get_source_segment(source,next(c for c in tree.body if isinstance(c,ast.ClassDef)and c.name==n)).encode()).hexdigest()for n in classes},observations=rows)


def quote(v):return json.dumps(v,ensure_ascii=False)
def number(v):
    if isinstance(v,dict):v=float.fromhex(v['hex'])
    return moon(float(v))
def array(v):return '['+', '.join(number(x)for x in v)+']'
def log_number(value):return '@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number('+number(value)+'))'
def parent(name,cls):return name if cls=='LogFormatter'else name+'.as_log_formatter()'


def emit(payload):
    cases=[]
    def ctor(cls,explicit=None,label=False,thresholds=None):
        args=['label_only_base=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean('+str(label).lower()+'))']
        if explicit is not None:args.append('linthresh='+log_number(explicit))
        if thresholds is not None:args.append('minor_thresholds=Some(@ticker.LogMinorThresholds::Tuple(@ticker.LogThresholdTuple::new(['+', '.join(log_number(v)for v in thresholds)+'])))')
        return '  let f = @ticker.'+cls+'::new('+', '.join(args)+')\n'
    def check(row,expr,expect=None):
        if row['error']:
            return '  let failed = try { ignore('+expr+'); false } catch {\n    @core.DataError::InvalidTicks(message~) => { assert_eq(message, '+quote(row['error']+': '+row['message'])+'); true }\n    _ => false\n  }\n  assert_true(failed)\n'
        if expect is None:expect=row['value']
        if expect is None:return '  '+expr+'\n'
        return '  assert_eq('+expr+', '+(quote(expect)if isinstance(expect,str)else'['+', '.join(quote(x)for x in expect)+']')+')\n'
    def bind(view='[1.0, 2.0]',threshold='None',fault=None):
        code='  let binding = @ticker.FormatterAxisBinding::new()\n  let events : Array[String] = []\n'
        transform_error={'transform-attribute':'AttributeError: transform probe','attribute-attribute':'AttributeError: linthresh probe','transform-value':'ValueError: transform probe'}.get(fault)
        if transform_error:code+='  binding.bind_transform_linthresh(() => { events.push("probe"); raise @core.DataError::InvalidTicks(message='+quote(transform_error)+') })\n'
        else:code+='  binding.bind_transform_linthresh(() => { events.push("probe"); '+threshold+' })\n'
        view_error={'view-value':'ValueError: view probe','view-attribute':'AttributeError: view probe'}.get(fault)
        if view_error:code+='  binding.bind_view_interval(() => { events.push("view"); raise @core.DataError::InvalidTicks(message='+quote(view_error)+') })\n'
        else:code+='  binding.bind_view_interval(() => { events.push("view"); @ticker.FormatterViewInterval::Sequence('+view+') })\n'
        return code+'  f.set_axis(Some(binding))\n'
    def state(expected,cls):
        p=parent('f',cls);code='  assert_true('+p+'.label_only_base() is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean('+str(expected['label_only']).lower()+')))\n'
        cache=expected['sublabels']
        if cache is None:code+='  assert_true('+p+'.sublabels() is None)\n'
        else:
            values=cache['set'];code+='  let sublabels = '+p+'.sublabels().unwrap()\n  assert_eq(sublabels.length(), '+str(len(values))+')\n'
            for v in values:code+='  assert_true(sublabels.contains('+number(v)+'))\n'
        locs=expected['locs']['values']if isinstance(expected['locs'],dict)else expected['locs']
        code+='  assert_eq(f.as_base_formatter().locations().length(), '+str(len(locs))+')\n'
        for i,x in enumerate(locs):code+='  assert_eq(f.as_base_formatter().locations().get('+str(i)+'), '+number(x)+')\n'
        return code
    def axis_scene(name,scale='log',view=(1.,100.)):
        return '  let figure = @scene.figure(width=400, height=300)\n  let axes = figure.axes()\n  axes.set_x_limits('+number(view[0])+', '+number(view[1])+')\n  axes.set_y_limits('+number(view[0])+', '+number(view[1])+')\n  axes.set_x_locator(@ticker.NullLocator::new().as_locator())\n  axes.set_y_locator(@ticker.NullLocator::new().as_locator())\n  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n  let axis = axes.'+name+'_axis()\n  axis.set_scale('+{'linear':'@scale.linear_scale()','log':'@scale.log_scale()','symlog':'@scale.symlog_scale(linthresh=2.0)'}[scale]+')\n'
    fixture='''  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
'''
    for index,row in enumerate(payload['observations']):
        cls=row['cls'];label=row['label'];v=row['value'];name=row.get('name','x');p=parent('f',cls)
        if label=='ignored locations and only real context dependencies':
            body=ctor(cls,row['explicit'])+'''  let retained = match f.as_base_formatter().locations() { @ticker.FormatterLocations::Sequence(values) => values; _ => fail("fresh source list expected") }
  let saved = retained.copy()
  defer { retained.clear(); for value in saved { retained.push(value) } }
  retained.clear()
  retained.push(777.0)
'''+bind('[-2.0, 2.0]'if row['explicit']is not None else'[1.0, 2.0]')
            inp=row['input']
            if inp is None:body+='  f.set_locs()\n'
            elif isinstance(inp,dict):body+='  f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0]))\n'
            else:body+='  f.set_locs(locations=[])\n'
            body+='  assert_eq(events, '+('['+quote('view')+']'if row['explicit']is not None else'['+quote('probe')+', '+quote('view')+']')+')\n'
            body+='  match f.as_base_formatter().locations() { @ticker.FormatterLocations::Sequence(values) => assert_true(physical_equal(retained, values)); _ => fail("ignored input replaced source list") }\n'
        elif label=='infinite first threshold returns before all axis access':body=ctor(cls,thresholds=[row['first'],float('nan')])+check(row,'f.set_locs()')
        elif label=='AttributeError-only transform fallback and view order':
            body=ctor(cls)+bind(fault=row['fault'])+check(row,'f.set_locs(locations=[])')
            expected=['probe']if row['fault']=='transform-value'else['probe','view']
            body+='  assert_eq(events, ['+', '.join(quote(x)for x in expected)+'])\n'
        elif label=='unbound direct data short offset methods':body=ctor(cls)+check(row,'f.'+('call'if row['method']=='__call__'else row['method'])+'('+(''if row['method']=='get_offset'else'2.0')+')')
        elif label=='zero and label-only early call gates bypass axis':body=ctor(cls,label=True)+'  assert_eq([f.call(0.0), f.call(2.0)], ['+', '.join(quote(x)for x in v)+'])\n'
        elif label=='format_data temporarily disables label-only and restores after result or error':body=ctor(cls,label=True)+bind(fault='view-value')+check(row,'f.format_data(2.0)')
        elif label=='format_data preserves cached sublabel gate while disabling label-only':
            body=ctor(cls,label=True)+bind('[1.0, 1000000.0]')+'  f.set_locs()\n  binding.bind_view_interval(() => { raise @core.DataError::InvalidTicks(message="ValueError: view probe") })\n'+check(row,'f.format_data(2.0)')
        elif label in ['narrow context preparation','direct call retains cached filter after view change','next empty preparation updates cached filter from new view']:
            body=ctor(cls)+bind()+'  f.set_locs(locations=[])\n'
            if label!='narrow context preparation':body+='  binding.set_view_interval(@ticker.FormatterViewInterval::Sequence([1.0, 1000000.0]))\n'
            if label=='next empty preparation updates cached filter from new view':body+='  f.set_locs(locations=[])\n'
            body+=check(row,'f.call(2.0)')
        elif label=='explicit linthresh bypasses transform provider':body=ctor(cls,2.)+bind('[-2.0, 2.0]',fault='transform-value')+'  f.set_locs()\n'+check(row,'f.call(2.0)')
        elif label in ['live threshold initial symlog preparation','transform threshold change alone retains old cache','next preparation resolves current transform threshold again']:
            body=ctor(cls)+bind('[-2.0, 2.0]','Some(@ticker.ScalarNumber::Number(2.0))')+'  f.set_locs(locations=[])\n'
            if label!='live threshold initial symlog preparation':body+='  binding.clear_transform_linthresh()\n'
            if label=='next preparation resolves current transform threshold again':body+='  f.set_locs(locations=[])\n'
            body+=check(row,'f.call(2.0)')
        elif label=='actual primary scale transform threshold context':
            scale=row['scale'];view=(1.,100.)if scale=='log'else(-2.,2.)
            body=axis_scene(name,scale,view)+ctor(cls)+'  axis.set_named_formatter(f.as_base_formatter())\n'+check(row,'f.format_ticks_view(@ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]))',v['labels'])
        elif label=='actual secondary own transform never inherits parent linthresh attribute':
            scale=row['parent_scale'];view=(1.,100.)if scale=='log'else(-2.,2.)
            body=axis_scene(name,scale,view)+ctor(cls)+'  let secondary = axes.secondary_'+name+'axis(fn(value) { return value }, fn(value) { return value })\n  secondary.set_named_formatter(f.as_base_formatter())\n  secondary.apply_aspect()\n  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)\n'+check(row,'f.format_ticks_view(@ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]))',v['labels'])+'  ignore(axis)\n'
        elif label=='complete actual Axis.draw full batch Null and late current offset':
            profile=row['profile'];body=axis_scene(name)+ctor(cls)+'  axis.set_named_formatter(f.as_base_formatter())\n  axis.set_locator(@ticker.FixedLocator::new('+array(row['raw'])+').as_locator())\n  axis.set_minor_locator(@ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator())\n  axis.set_minor_named_formatter(@ticker.NullFormatter::new().as_base_formatter())\n'
            if profile=='Null-after-cache':body+='  f.set_locs(locations=[])\n  axis.set_locator(@ticker.NullLocator::new().as_locator())\n  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n'
            elif profile=='minor-replaces-major':body+='''  let replacement = @ticker.FuncFormatter::new((_, _) => "replacement")
  replacement.set_offset_string("late replacement offset")
  axis.set_minor_named_formatter(@ticker.FuncFormatter::new((_, _) => { axis.set_named_formatter(replacement.as_base_formatter()); "minor" }).as_base_formatter())
'''
            elif profile=='offscreen-error':body+='  let minor_reads = @ref.Ref(0)\n  axis.set_minor_named_formatter(@ticker.FuncFormatter::new((_, _) => { minor_reads.val += 1; "minor" }).as_base_formatter())\n'
            if row['error']:body+=check(row,'figure.to_svg_checked()')+'  assert_eq(minor_reads.val, 0)\n'
            else:
                body+='  let svg = figure.to_svg_checked()\n'
                if v['offset']:body+='  assert_eq(svg.split('+quote('>'+v['offset']+'<')+').count() - 1, 1)\n'
                else:body+='  assert_eq(f.get_offset(), "")\n'
                for text,count in Counter(event[2]for event in row['events']if isinstance(event,(tuple,list))and event[0]=='tick.draw').items():
                    if text:body+='  assert_eq(svg.split('+quote('>'+text+'<')+').count() - 1, '+str(count)+')\n'
                if not any(isinstance(event,(tuple,list))and event[0]=='tick.draw'for event in row['events']):body+='  ignore(svg)\n'
        elif label in ['shared owner binding does not invalidate cache before preparation','actual shared removal rebind and detached-copy cache/view']:
            body='''  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_'''+name+'''=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.'''+name+'''_axis()
  let b = second.'''+name+'''_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => { (1.0, 2.0) })
  b.bind_view_interval(() => { (1.0, 1000000.0) })
'''+ctor(cls)+'''  first.set_'''+name+'''_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_'''+name+'''_named_formatter(f.as_base_formatter())
'''
            if label.startswith('actual shared'):
                body+='  ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])))\n  let external = f.copy()\n  second.remove()\n'+check(row,'f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0]))',v['live'])+check(row,'external.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0]))',v['external'])+'  assert_eq(f.axis(), Some(a.formatter_axis_binding()))\n  assert_eq(external.axis(), Some(b.formatter_axis_binding()))\n  ignore(old)\n'
            else:body+=check(row,'f.call(2.0)',v['direct'])+check(row,'f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0]))',v['live'])+check(row,'old.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0]))',v['old'])+'  assert_eq(f.axis(), Some(b.formatter_axis_binding()))\n'
        elif label=='short and offset never read view transform or pixel context':body=ctor(cls)+bind(fault='transform-value')+'  binding.bind_view_interval(() => { raise @core.DataError::InvalidTicks(message="ValueError: view probe") })\n  binding.bind_short_format_delta(_ => { raise @core.DataError::InvalidTicks(message="ValueError: pixel must not be used") })\n  assert_eq(f.format_data_short(-0.001), '+quote(v['short'])+')\n  assert_eq(f.get_offset(), '+quote(v['offset'])+')\n'
        else:raise AssertionError(label)
        body+=state(row['state_after'],cls)
        cases.append((index,label,fixture+body))
    code='// Complete original LogFormatter family and actual Axis lifecycle.\n\n'
    for i,label,body in cases:code+='///|\n// Original source case '+str(i)+': '+label+'\nfn log_formatter_axis_case_'+str(i)+'() -> Unit raise {\n'+body+'}\n\n'
    groups=0
    for start in range(0,len(cases),GROUP_SIZE):
        rows=cases[start:start+GROUP_SIZE];groups+=1
        code+='///|\ntest '+quote('LogFormatter original axis cases '+str(rows[0][0])+'..'+str(rows[-1][0]))+' {\n'
        for i,_,_ in rows:code+='  try { log_formatter_axis_case_'+str(i)+'() } catch { error => fail('+quote('LogFormatter original axis case '+str(i)+' failed: ')+' + error.to_string()) }\n'
        code+='}\n\n'
    return code,groups


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    payload=collect(args.ticker);code,groups=emit(payload)
    payload['scope']='Complete original four LogFormatter classes and real Formatter/API/deprecation/cbook helpers; actual Axis formatter installation/update_ticks/draw/generated Bbox getters, actual Scale/Secondary transforms and Grouper/Figure removal. Explicit unit/Text/renderer sinks; native numeric class methods, no Moon algorithm oracle. Opaque logical sublabels compare membership, not invented set iteration order.'
    payload['counts'].update(query_group_size=GROUP_SIZE,private_case_count=len(payload['observations']),registered_test_count=groups)
    outputs={ROOT/'testdata/log_formatter_axis_reference.json':json.dumps(payload,ensure_ascii=False,indent=2)+'\n',ROOT/'scene/log_formatter_axis_reference_test.mbt':formatted(code)}
    for path,value in outputs.items():
        if args.check:
            if not path.exists()or path.read_text()!=value:raise SystemExit('stale reference '+str(path))
        else:path.write_text(value)
    print(payload['counts'],'checked'if args.check else'generated')
if __name__=='__main__':main()
