"""Complete original LogitFormatter and actual Axis/Secondary draw evidence.

No Moon algorithm or port sort is used to generate expected observations.
"""
from pathlib import Path
import argparse,ast,copy,hashlib,json,math,sys,types,warnings
from collections import Counter
import numpy as np
from generate_basic_formatter_axis_reference import load as load_axis
from formatter_reference_source import load_logit_formatter
from generate_auto_date_reference import formatted,moon
ROOT=Path(__file__).resolve().parents[1]
P=ROOT/'.moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py'

def load(path):
    ns,tr,Axes,Secondary,old=load_axis(path)
    real=load_logit_formatter(path)
    for k,v in dict(ns['mpl'].rcParams).items():
        if k not in real['mpl'].rcParams:real['mpl'].rcParams[k]=v
    for name in ['TickHelper','Formatter','NullFormatter','FixedFormatter','FuncFormatter','LogitFormatter','_api','mpl']:
        ns[name]=real[name]
    ns['warning_messages']=real['external_warnings']
    tree=ast.parse(path.read_text())
    for name in ['Locator','NullLocator','FixedLocator','LinearLocator','MultipleLocator','IndexLocator','AutoMinorLocator','MaxNLocator','AutoLocator','LogLocator','SymmetricalLogLocator','AsinhLocator','LogitLocator']:
        node=next(n for n in tree.body if isinstance(n,ast.ClassDef)and n.name==name)
        exec(compile(ast.Module(body=[node],type_ignores=[]),str(path),'exec'),ns)
    ns['mticker']=types.SimpleNamespace(**{name:ns[name]for name in ['TickHelper','Formatter','NullFormatter','FixedFormatter','FuncFormatter','Locator','FixedLocator','NullLocator','LogitFormatter']})
    class DefaultFormatter(ns['Formatter']):
        def __init__(self,*a,**k):pass
        def __call__(self,value,pos=None):return str(value)
    ns['ScalarFormatter']=DefaultFormatter
    ns['LogFormatterSciNotation']=DefaultFormatter
    return ns,tr,Axes,Secondary,real

def collect():
    ns,tr,Axes,Secondary,real=load(P)
    tree=ast.parse(P.read_text())
    ns['mticker'].LogitFormatter=ns['LogitFormatter'];F=ns['LogitFormatter'];events=[];rows=[]
    def clean(x):
     if isinstance(x,np.ndarray):return {'dtype':str(x.dtype),'shape':list(x.shape),'values':[clean(v)for v in x.flat]}
     if isinstance(x,(bool,np.bool_)):return bool(x)
     if isinstance(x,(float,np.floating)):return {'type':type(x).__name__,'hex':float(x).hex()}
     if isinstance(x,np.integer):return {'type':type(x).__name__,'value':str(x)}
     if isinstance(x,set):return {'set':sorted([clean(v)for v in x],key=repr)}
     if isinstance(x,(tuple,list)):return [clean(v)for v in x]
     if isinstance(x,dict):return {k:clean(v)for k,v in x.items()}
     return x

    def state(f):return {'locs':clean(f._locs),'labelled':clean(f._labelled),'axis':getattr(getattr(f.axis,'axes',None),'label',None),'minor':clean(f._minor)}
    def obs(label,fn,f=None,**meta):
     events.clear()
     with warnings.catch_warnings(record=True)as w:
      warnings.simplefilter('always')
      try:value,error,message=clean(fn()),None,None
      except Exception as e:value,error,message=None,type(e).__name__,str(e)
     row={'id':len(rows),'label':label,'value':value,'error':error,'message':message,'events':events.copy(),'warnings':[{'category':type(e.message).__name__,'message':str(e.message)}for e in w],**meta}
     if f is not None:row['state']=state(f)
     rows.append(row);return row
    class Poison:
     axes=None
     def __getattr__(self,key):raise RuntimeError('unexpected axis capability '+key)
    # Only genuine context dependencies: absolutely none on this formatter.
    for minor in [False,True]:
     for axis_kind in ['none','poison','dummy']:
      f=F(minor=minor)
      if axis_kind=='poison':f.set_axis(Poison())
      elif axis_kind=='dummy':f.create_dummy_axis()
      for method,arg in [('set_locs',np.array([.03,.2,.5,.8,.97])),('__call__',.2),('format_data',.2),('format_data_short',.2),('get_offset',None)]:
       obs('formatter operations do not read axis context',lambda: getattr(f,method)()if arg is None else getattr(f,method)(arg),f,minor=minor,axis_kind=axis_kind,method=method)
    # Standard original array inputs: origin/order/duplicates/empty and invalids.
    inputs=[[],[.001,.01,.1,.5,.9,.99,.999],[.03,.2,.5,.8,.97],[.8,.03,.5,.97,.2],[.2,.2,.5],[.5,.5],np.array([0,1],dtype=np.int64),np.array([0.,1.]),np.array([.03,.2,.5,.8,.97])[::-1],np.array([.2,.5,.8])[::2],[.2,math.nan],[.2,math.inf],[.2,-math.inf],[-.1,.2,1.1]]
    for minor in [False,True]:
     for values in inputs:
      f=F(minor=minor);f.set_axis(Poison());obs('complete batch retains dtype order and empty semantics',lambda:f.format_ticks(values),f,minor=minor,input=clean(values))
    # Class takes a new ndarray snapshot before cached labels are cleared.
    for dtype in ['float64','int64']:
     original=np.array([.03,.2,.5,.8,.97]if dtype=='float64'else[0,1],dtype=dtype);f=F(minor=True)
     f.set_locs(original);c=copy.copy(f);old=f._locs
     def owner_mutation():
      original[0]=.123 if dtype=='float64' else 42
      return {'same_input':f._locs is original,'copy_shared_locs':f._locs is c._locs,'values':f._locs,'input':original}
     obs('set_locs copies ndarray but shallowcopy shares captured snapshot',owner_mutation,f,dtype=dtype)
     def reprepare():
      f.set_locs(np.array([.17,.23,.62]));return {'cache_shared':f._labelled is c._labelled,'copy_cache':c._labelled,'locs_still_old':c._locs is old,'live_locs_new':f._locs is not old}
     obs('preparation clears shared copied set but rebinds only receiver locations',reprepare,f,dtype=dtype)
    f=F(minor=True);f.set_locs([.03,.2,.5,.8,.97]);c=copy.copy(f)
    obs('failed preparation stores new locs and clears shared cache first',lambda:f.set_locs([math.nan,.2]),f)
    obs('copy observes cleared cache but keeps old location snapshot',lambda:state(c),c)
    # Actual original Axis.draw. Explicit Text/layout/renderer sinks; numerical transforms real.
    axispath=P.with_name('axis.py');atree=ast.parse(axispath.read_text());anode=next(n for n in atree.body if isinstance(n,ast.ClassDef)and n.name=='Axis')
    draw=copy.deepcopy(next(n for n in anode.body if isinstance(n,ast.FunctionDef)and n.name=='draw'));draw.decorator_list=[];exec(compile(ast.Module(body=[draw],type_ignores=[]),str(axispath),'exec'),ns)
    class Renderer:
     def open_group(self,*a,**k):pass
     def close_group(self,*a,**k):pass
    class Text:
     def __init__(self,name):self.name=name;self.text=''
     def draw(self,r):events.append(self.name+'.draw')
     def set_text(self,s):self.text=s;events.append((self.name+'.text',s))
    def prepare_draw(axis):
     axis.get_visible=lambda:True;axis.get_gid=lambda:None;axis._get_ticklabel_bboxes=lambda t,r:([],[]);axis._update_label_position=lambda r:None;axis._update_offset_text_position=lambda*a:None;axis.label=Text('label');axis.offsetText=Text('offset');old=axis._get_tick
     def tick(*a,**kw):
      t=old(*a,**kw);t.draw=lambda r:events.append(('tick.draw',float(t.get_loc()),t.label1.text));return t
     axis._get_tick=tick

    def draw_result(axis,formatters):
     prepare_draw(axis)
     def trace(frame,event,arg):
      if event=='call'and frame.f_code.co_filename==str(P)and frame.f_code.co_name in ['set_locs','__call__','get_offset','format_data']:
       f=frame.f_locals.get('self')
       if id(f)in formatters:
        tag=formatters[id(f)];method=frame.f_code.co_name;events.append((tag+'.'+method,clean(frame.f_locals.get('locs')if method=='set_locs'else frame.f_locals.get('x'))))
      return trace
     sys.settrace(trace)
     try:ns['draw'](axis,Renderer())
     finally:sys.settrace(None)
     return {'offset':axis.offsetText.text,'visible':[(e[1],e[2])for e in events if isinstance(e,tuple)and e[0]=='tick.draw']}

    profiles=['regular','offscreen-neighbour','minor-unsorted','same-object','empty-major','Null-after-cache','major-offscreen-nan','minor-offscreen-nan','duplicate-major','minor-replaces-major']
    for name in ['x','y']:
     for scale in ['linear','logit']:
      for profile in profiles:
       axes=Axes(label='main');getattr(axes,'set_'+name+'scale')(scale);getattr(axes,'set_'+name+'lim')((.2,.8));axis=axes._axis_map[name];major=F();minor=F(minor=True);axis.set_major_formatter(major);axis.set_minor_formatter(minor)
       major_values=np.array([.01,.2,.5,.8,.99]);minor_values=np.array([.03,.23,.37,.63,.77,.97]);axis.remove_overlapping_locs=True
       if profile=='offscreen-neighbour':major_values=np.array([.199999,.2,.5,.8,.99])
       elif profile=='minor-unsorted':minor_values=np.array([.97,.23,.77,.03,.63,.37])
       elif profile=='same-object':minor=major;axis.set_minor_formatter(major)
       elif profile=='empty-major':major_values=np.array([])
       elif profile=='major-offscreen-nan':major_values=np.array([.2,math.nan,.8]);axis.set_minor_formatter(ns['FuncFormatter'](lambda v,p:(events.append('unexpected minor callback'),'minor')[1]))
       elif profile=='minor-offscreen-nan':minor_values=np.array([.23,math.nan,.77])
       elif profile=='duplicate-major':major_values=np.array([.2,.2,.5,.8])
       elif profile=='minor-replaces-major':
        replacement=ns['FuncFormatter'](lambda v,p:'replacement');replacement.set_offset_string('late offset');axis.set_minor_formatter(ns['FuncFormatter'](lambda v,p:(axis.set_major_formatter(replacement),'minor')[1]))
       axis.set_major_locator(ns['FixedLocator'](major_values));axis.set_minor_locator(ns['FixedLocator'](minor_values))
       if profile=='Null-after-cache':
        major.set_locs(np.array([.199999,.2,.5,.8]));minor.set_locs(np.array([.03,.23,.37,.63,.77,.97]));axis.set_major_locator(ns['NullLocator']());axis.set_minor_locator(ns['NullLocator']())
       obs('complete actual Axis draw full batches before visibility and offset',lambda:draw_result(axis,{id(major):'major',id(minor):'minor'}),major,name=name,scale=scale,profile=profile,major_raw=clean(major_values),minor_raw=clean(minor_values))
    # Actual shared setter and source Figure removal; owner changes no algorithm dependency.
    for name in ['x','y']:
     a,b=Axes(label='first'),Axes(label='second');aa,bb=a._axis_map[name],b._axis_map[name];getattr(a,'set_'+name+'lim')((.1,.9));getattr(b,'set_'+name+'lim')((.2,.8));f=F(minor=True);aa.set_major_formatter(f);f.set_locs(np.array([.03,.2,.5,.8,.97]));initial=copy.copy(f)
     bb.major,bb.minor=aa.major,aa.minor;group=ns['Grouper']();group.join(b,a);a._shared_axes[name]=b._shared_axes[name]=group;bb.set_major_formatter(f)
     obs('shared last setter changes owner without context reads or cache reset',lambda:{'owner':f.axis.axes.label,'copy_owner':initial.axis.axes.label,'labels':f.format_ticks(np.array([.2,.5,.8])),'shared_cache':f._labelled is initial._labelled},f,name=name)
     detached=copy.copy(f);fig=ns['FigureBase']();fig._axobservers=types.SimpleNamespace(process=lambda*a:None);fig._root_figure=types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda*a:None));fig._remove_axes(b,owners=[[a,b]])
     obs('source shared removal rebind leaves detached copy with old owner shared cache',lambda:{'owner':f.axis.axes.label,'detached_owner':detached.axis.axes.label,'labels':f.format_ticks(np.array([.17,.62])),'detached_labels':detached._labelled,'locs_same':f._locs is detached._locs},f,name=name)
    # Actual Secondary scale/lim synchronization + original Axis.draw uses own full locs.
    for name in ['x','y']:
     for scale in ['linear','log','logit']:
      for minor_mode in [False,True]:
       parent=Axes(label='parent');getattr(parent,'set_'+name+'scale')(scale);getattr(parent,'set_'+name+'lim')((.01,.99));child=Secondary(parent,name);child.label='secondary';child._functions=(lambda x:x*.5,lambda x:x*2);child._parentscale=None;child._set_scale();child._set_lims();axis=child._axis;f=F(minor=minor_mode);axis.set_major_formatter(f);axis.set_minor_formatter(ns['NullFormatter']());axis.set_major_locator(ns['FixedLocator'](np.array([.01,.2,.3,.5,.8,.99])));axis.set_minor_locator(ns['NullLocator']())
       obs('actual secondary own ticks format fully before inverse visibility',lambda:draw_result(axis,{id(f):'secondary'}),f,name=name,parent_scale=scale,minor_mode=minor_mode,own_view=clean(axis.get_view_interval()),transform=type(axis.get_transform()).__name__)
    # Empty Fixed vs Null must differ for cached class state even when nothing drawn.
    for minor in [False,True]:
     for kind in ['empty','null']:
      axes=Axes(label='empty');axes.set_xlim((.1,.9));axis=axes.xaxis;f=F(minor=minor);f.set_locs(np.array([.03,.2,.5,.8,.97]));axis.set_major_formatter(f);axis.set_major_locator(ns['NullLocator']()if kind=='null'else ns['FixedLocator'](np.array([])));axis.set_minor_locator(ns['NullLocator']());axis.set_minor_formatter(ns['NullFormatter']());obs('empty Fixed prepares empty whereas Null skips preparation but offset is still read',lambda:draw_result(axis,{id(f):'major'}),f,minor=minor,kind=kind)
    # Extra actualAxis adaptive/overlap profiles retain full raw location identities.
    for name in ['x','y']:
     for profile in ['adaptive-sorted','adaptive-reversed','adaptive-unsorted','threshold-fullcount','minor-overlap','minor-NdNaN','late-parameter']:
      axes=Axes(label='extra');getattr(axes,'set_'+name+'lim')((.2,.8));axis=axes._axis_map[name];major=F();minor=F(minor=True,minor_number=3)
      values=np.array([.03,.17,.23,.37,.63,.77,.83,.97])
      if profile=='adaptive-reversed':values=values[::-1]
      elif profile=='adaptive-unsorted':values=values[[6,1,5,0,7,3,2,4]]
      elif profile=='threshold-fullcount':values=np.linspace(.01,.99,26)
      elif profile=='minor-overlap':values=np.array([.17,.2,.23,.37,.5,.63,.77,.8,.83])
      elif profile=='minor-NdNaN':values=np.array([.23,math.nan,.77])
      axis.set_major_formatter(major);axis.set_minor_formatter(minor);axis.set_major_locator(ns['FixedLocator'](np.array([.2,.5,.8])));axis.set_minor_locator(ns['FixedLocator'](values))
      if profile=='late-parameter':
       axis.set_minor_formatter(ns['FuncFormatter'](lambda v,p:(major.set_one_half('late-half'),major.use_overline(True),'minor')[2]))
      obs('actual adaptive full minor batch overlap and late parameters',lambda:draw_result(axis,{id(major):'major',id(minor):'minor'}),minor,name=name,profile=profile,raw=clean(values),major_state=state(major))
    # Same numeric nan bits do not encode Python object identity; source-only domain evidence.
    for origin in ['PythonSequence','NumpyScalarSequence','NdArray']:
     nan=float('nan')if origin=='PythonSequence'else np.float64('nan')
     values=[.23,nan,.77]if origin!='NdArray'else np.array([.23,nan,.77]);f=F(minor=True)
     obs('original batch NaN membership retains container scalar identities',lambda:f.format_ticks(values),f,origin=origin,input=clean(values))
    for shape in ['reverse','nested','zero-stride','empty-int64']:
     owner=np.array([0,1,2,3],dtype=np.int64)
     values=owner[::-1]if shape=='reverse'else owner[::-1][1::2]if shape=='nested'else np.lib.stride_tricks.as_strided(owner[1:],shape=(3,),strides=(0,))if shape=='zero-stride'else owner[:0]
     f=F();f.set_locs(values);before=f._locs.copy();owner[:]=9
     obs('strided Int64 locations are copied in logical order with dtype',lambda:{'snapshot':f._locs,'input_after_mutation':values,'same_snapshot':np.array_equal(before,f._locs),'offset':f.get_offset()},f,profile=shape)
    # Actual complete source batches above the old generic tick budget, no prefix oracle.
    for minor in [False,True]:
     f=F(minor=minor);values=np.full(200001,.5)if not minor else np.linspace(.2,.8,200001)
     def whole_batch():
      labels=f.format_ticks(values)
      return {'raw_count':len(values),'label_count':len(labels),'loc_count':len(f._locs),'samples':[(i,labels[i])for i in [0,100000,200000]],'labelled_count':len(f._labelled)}
     obs('complete 200001 source batch is neither capped nor deduplicated',whole_batch,f,minor=minor)
    files=[P,P.with_name('axis.py'),P.with_name('transforms.py'),P.with_name('figure.py'),P.parent/'axes/_base.py',P.parent/'axes/_secondary_axes.py']
    out={'counts':dict(total=len(rows),**Counter(r['error']or'success'for r in rows)),'hashes':{str(p.relative_to(P.parent)):hashlib.sha256(p.read_bytes()).hexdigest()for p in files},'class_hash':hashlib.sha256(ast.get_source_segment(P.read_text(),next(n for n in tree.body if isinstance(n,ast.ClassDef)and n.name=='LogitFormatter')).encode()).hexdigest(),'observations':rows}
    out['shared_loader_source_hashes']=real['source_hashes']
    out['source_fixture_profile']='Actual named formatter/classes and actual Axis/Secondary methods; accepted DefaultFormatter fallback for unused implicit Scalar/Log defaults, units/Text/layout/renderer storage sinks'
    return out

def quote(x):return json.dumps(x,ensure_ascii=False)
def value(x):return float.fromhex(x['hex'])if isinstance(x,dict)and'hex'in x else float(x['value'])if isinstance(x,dict)and'value'in x else float(x)
def array(values):
    if isinstance(values,dict):values=values['values']
    return '['+', '.join(moon(value(v))for v in values)+']'
def check(row,expr,expected=None):
    if row['error']:
        return '  let failed = try { ignore('+expr+'); false } catch {\n    @core.DataError::InvalidTicks(message~) => { assert_eq(message, '+quote(row['error']+': '+row['message'])+'); true }\n    _ => false\n  }\n  assert_true(failed)\n'
    if expected is None:return '  ignore('+expr+')\n'
    return '  assert_eq('+expr+', '+quote(expected)+')\n'
def ctor(minor=False,name='f',number=None):
    args=['minor=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean('+str(minor).lower()+'))']
    if number is not None:args.append('minor_number=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int('+str(number)+')))')
    return '  let '+name+' = @ticker.LogitFormatter::new('+', '.join(args)+')\n'
def snapshot(row,name='f'):
    state=row['state'];locs=state['locs'];values=locs['values'] if isinstance(locs,dict) else locs;cache=state['labelled']['set']
    text='  assert_eq('+name+'.locations().length(), '+str(len(values))+')\n'
    if len(values)<1000:
        text+='  logit_axis_assert_values('+name+'.locations(), '+array(values)+')\n'
    if isinstance(locs,dict) and locs['dtype']in ['float64','int64']:
        text+='  assert_true('+name+'.locations() is @ticker.FormatterLocations::NdArray(_))\n  assert_eq('+name+'.locations().dtype(), Some('+quote(locs['dtype'])+'))\n'
    text+='  logit_axis_assert_labelled('+name+', '+array(cache)+')\n'
    return text

def scene(name,scale='linear',view=(.2,.8)):
    text='  let figure = @scene.figure(width=400, height=300)\n  let axes = figure.axes()\n  axes.set_x_limits('+moon(view[0])+', '+moon(view[1])+')\n  axes.set_y_limits('+moon(view[0])+', '+moon(view[1])+')\n'
    text+='  let axis = axes.'+name+'_axis()\n'
    if scale!='linear':text+='  axis.set_scale(@scale.'+scale+'_scale())\n'
    # Isolate the tested secondary/tick group after the real scale install,
    # which now replaces primary locators with its default objects.
    for n in ['x','y']:
        text+='  axes.set_'+n+'_locator(@ticker.NullLocator::new().as_locator())\n  axes.set_'+n+'_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n'
    return text

def svg_assert(row):
    if row['error']:return check(row,'figure.to_svg_checked()')
    text='  let svg = figure.to_svg_checked()\n'
    for label,count in Counter(v[1]for v in row['value']['visible']if v[1]).items():
        text+='  assert_eq(logit_axis_count(svg, '+quote(label)+'), '+str(count)+')\n'
    if row['value']['offset']:text+='  assert_true(svg.contains('+quote(row['value']['offset'])+'))\n'
    if not row['value']['visible']and not row['value']['offset']:text+='  ignore(svg)\n'
    return text

def emit(payload):
    bodies=[]
    for row in payload['observations']:
        i=row['id'];label=row['label'];body=''
        if i<30:
            body=ctor(row['minor'])
            if row['axis_kind']=='poison':body+='  let binding = @ticker.FormatterAxisBinding::new()\n  binding.bind_view_interval(() => { raise @core.DataError::InvalidTicks(message="unexpected view") })\n  binding.bind_transform_linthresh(() => { raise @core.DataError::InvalidTicks(message="unexpected transform") })\n  binding.bind_short_format_delta(_ => { raise @core.DataError::InvalidTicks(message="unexpected pixel") })\n  f.set_axis(Some(binding))\n'
            elif row['axis_kind']=='dummy':body+='  f.create_dummy_axis()\n'
            if row['method']!='set_locs':body+='  f.set_locs_view(@ticker.TickValues::from_array([0.03, 0.2, 0.5, 0.8, 0.97]))\n'
            expr={'set_locs':'f.set_locs_view(@ticker.TickValues::from_array([0.03, 0.2, 0.5, 0.8, 0.97]))','__call__':'f.call(0.2)','format_data':'f.format_data(0.2)','format_data_short':'f.format_data_short(0.2)','get_offset':'f.get_offset()'}[row['method']]
            body+=check(row,expr,row['value'])+snapshot(row)
        elif i<58:
            body=ctor(row['minor']);inp=row['input']
            if isinstance(inp,dict):
                if inp['dtype']=='int64':expr='f.format_ticks_view(@ticker.TickValues::from_int64_array(['+', '.join(v['value']+'L'for v in inp['values'])+']))'
                else:expr='f.format_ticks_view(@ticker.TickValues::from_array('+array(inp)+'))'
            else:expr='f.format_ticks('+array(inp)+')'
            body+=check(row,expr,row['value'])+snapshot(row)
        elif i in [58,59,60,61]:
            dtype=row['dtype'];is_int=dtype=='int64';owner='[0L, 1L]'if is_int else'[0.03, 0.2, 0.5, 0.8, 0.97]'
            body=ctor(True)+'  let owner = '+owner+'\n  let original = @ticker.TickValues::'+('from_int64_array'if is_int else'from_array')+'(owner)\n  f.set_locs_view(original)\n  let copied = f.copy()\n  owner[0] = '+('42L'if is_int else'0.123')+'\n'
            if i in [59,61]:body+='  f.set_locs_view(@ticker.TickValues::from_array([0.17, 0.23, 0.62]))\n  logit_axis_assert_labelled(copied, '+array(row['value']['copy_cache']['set'])+')\n  logit_axis_assert_values(copied.locations(), '+('[0.0, 1.0]'if is_int else'[0.03, 0.2, 0.5, 0.8, 0.97]')+')\n'
            else:body+='  logit_axis_assert_values(copied.locations(), '+array(row['value']['values'])+')\n'
            body+='  assert_true('+('!' if i in [59,61] else '')+'physical_equal(logit_axis_view(f), logit_axis_view(copied)))\n  assert_true(!physical_equal(original, logit_axis_view(f)))\n'
            body+=snapshot(row)
        elif i in [62,63]:
            body=ctor(True)+'  f.set_locs([0.03, 0.2, 0.5, 0.8, 0.97])\n  let copied = f.copy()\n'
            if i==62:body+=check(row,'f.set_locs([0.0 / 0.0, 0.2])')+snapshot(row)
            else:body+='  try { f.set_locs([0.0 / 0.0, 0.2]) } catch { _ => () }\n'+snapshot(row,'copied')
            if i==62:body+='  assert_eq(copied.labelled().length(), 0)\n'
        elif i<104:
            name=row['name'];profile=row['profile'];body=scene(name,row['scale'])+ctor(False,'major')+ctor(True,'minor')+'  axis.set_named_formatter(major.as_base_formatter())\n  axis.set_minor_named_formatter(minor.as_base_formatter())\n'
            if profile=='same-object':body+='  axis.set_minor_named_formatter(major.as_base_formatter())\n'
            if profile=='major-offscreen-nan':body+='  let minor_calls = @ref.Ref(0)\n  axis.set_minor_named_formatter(@ticker.FuncFormatter::new((_, _) => { minor_calls.val += 1; "minor" }).as_base_formatter())\n'
            if profile=='minor-replaces-major':body+='  let replacement = @ticker.FuncFormatter::new((_, _) => "replacement")\n  replacement.set_offset_string("late offset")\n  axis.set_minor_named_formatter(@ticker.FuncFormatter::new((_, _) => { axis.set_named_formatter(replacement.as_base_formatter()); "minor" }).as_base_formatter())\n'
            body+='  axis.set_locator(@ticker.FixedLocator::new('+array(row['major_raw'])+').as_locator())\n  axis.set_minor_locator(@ticker.FixedLocator::new('+array(row['minor_raw'])+').as_minor_locator())\n'
            if profile=='Null-after-cache':body+='  major.set_locs_view(@ticker.TickValues::from_array([0.199999, 0.2, 0.5, 0.8]))\n  minor.set_locs_view(@ticker.TickValues::from_array([0.03, 0.23, 0.37, 0.63, 0.77, 0.97]))\n  axis.set_locator(@ticker.NullLocator::new().as_locator())\n  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n'
            body+=svg_assert(row)+snapshot(row,'major')
            if profile=='major-offscreen-nan':body+='  assert_eq(minor_calls.val, 0)\n'
        elif i<108:
            name=row['name'];body='  let figure = @scene.figure()\n  let panels = figure.subplots(1, 2, share_'+name+'=true)\n  let first = panels[0].'+name+'_axis()\n  let second = panels[1].'+name+'_axis()\n  panels[0].set_'+name+'_limits(0.1, 0.9)\n  panels[1].set_'+name+'_limits(0.2, 0.8)\n'+ctor(True)+'  first.set_named_formatter(f.as_base_formatter())\n  f.set_locs_view(@ticker.TickValues::from_array([0.03, 0.2, 0.5, 0.8, 0.97]))\n  let initial = f.copy()\n  second.set_named_formatter(f.as_base_formatter())\n  assert_eq(f.axis(), Some(second.formatter_axis_binding()))\n  assert_eq(initial.axis(), Some(first.formatter_axis_binding()))\n'
            body+='  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([0.2, 0.5, 0.8])), '+quote(row['value']['labels']if i in [104,106]else['$\\mathdefault{0.2}$','$\\mathdefault{\\frac{1}{2}}$','$\\mathdefault{0.8}$'])+')\n'
            if i in [105,107]:body+='  let detached = f.copy()\n  let previous_binding = second.formatter_axis_binding()\n  panels[1].remove()\n  assert_eq(f.axis(), Some(first.formatter_axis_binding()))\n  assert_eq(detached.axis(), Some(previous_binding))\n  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([0.17, 0.62])), '+quote(row['value']['labels'])+')\n  logit_axis_assert_labelled(detached, '+array(row['value']['detached_labels']['set'])+')\n  assert_eq(detached.locations().length(), 3)\n'
            body+=snapshot(row)
        elif i<120:
            name=row['name'];body=scene(name,row['parent_scale'],(.01,.99))+('  ignore(axis)\n'if row['parent_scale']=='linear'else'')+'  let secondary = axes.secondary_'+name+'axis(value => value * 0.5, value => value * 2.0)\n  secondary.apply_aspect()\n'+ctor(row['minor_mode'])+'  secondary.set_named_formatter(f.as_base_formatter())\n  secondary.set_minor_named_formatter(@ticker.NullFormatter::new().as_base_formatter())\n  secondary.set_locator(@ticker.FixedLocator::new([0.01, 0.2, 0.3, 0.5, 0.8, 0.99]).as_locator())\n  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n'+svg_assert(row)+snapshot(row)
        elif i<124:
            body=scene('x','linear',(.1,.9))+ctor(row['minor'])+'  f.set_locs_view(@ticker.TickValues::from_array([0.03, 0.2, 0.5, 0.8, 0.97]))\n  axis.set_named_formatter(f.as_base_formatter())\n  axis.set_locator('+('@ticker.NullLocator::new().as_locator()'if row['kind']=='null'else'@ticker.FixedLocator::new([]).as_locator()')+')\n'+svg_assert(row)+snapshot(row)
        elif i<138:
            name=row['name'];body=scene(name)+ctor(False,'major')+ctor(True,'minor',3)+'  axis.set_named_formatter(major.as_base_formatter())\n  axis.set_minor_named_formatter(minor.as_base_formatter())\n  axis.set_locator(@ticker.FixedLocator::new([0.2, 0.5, 0.8]).as_locator())\n  axis.set_minor_locator(@ticker.FixedLocator::new('+array(row['raw'])+').as_minor_locator())\n'
            if row['profile']=='late-parameter':body+='  axis.set_minor_named_formatter(@ticker.FuncFormatter::new((_, _) => { major.set_one_half(@ticker.LogValue::Text("late-half")); major.use_overline(@ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true))); "minor" }).as_base_formatter())\n'
            body+=svg_assert(row)+snapshot(row,'minor')
        elif i<141:
            body=ctor(True)
            if row['origin']=='NdArray':expr='f.format_ticks_view(@ticker.TickValues::from_array([0.23, 0.0 / 0.0, 0.77]))'
            elif row['origin']=='PythonSequence':expr='f.format_ticks([0.23, 0.0 / 0.0, 0.77])'
            else:
                body+='  let keys = [@ticker.LogitKey::new(@ticker.ScalarNumber::Number(0.23)), @ticker.LogitKey::new(@ticker.ScalarNumber::NumpyFloat64(0.0 / 0.0)), @ticker.LogitKey::new(@ticker.ScalarNumber::Number(0.77))]\n'
                expr='f.format_ticks_keys(keys)'
            body+=check(row,expr,row['value'])+snapshot(row)
        elif i<145:
            body=ctor()+'  let owner = [0L, 1L, 2L, 3L]\n  let source = @ticker.TickValues::from_int64_array(owner)\n'
            profile=row['profile'];view={'reverse':'source.view(3, -1, 4)','nested':'source.view(3, -1, 4).view(1, 2, 2)','zero-stride':'source.view(1, 0, 3)','empty-int64':'source.view(0, 1, 0)'}[profile]
            body+='  let original = '+view+'\n  f.set_locs_view(original)\n  for index in 0..<owner.length() { owner[index] = 9L }\n'+snapshot(row)
        else:
            body=ctor(row['minor'])
            body+='  let values = '+('Array::makei(200001, index => if index == 200000 { 0.8 } else { 0.2 + index.to_double() * ((0.8 - 0.2) / 200000.0) })'if row['minor']else'Array::make(200001, 0.5)')+'\n  let labels = f.format_ticks_view(@ticker.TickValues::from_array(values))\n  assert_eq(labels.length(), 200001)\n  assert_eq(f.locations().length(), 200001)\n  assert_eq(f.labelled().length(), 0)\n  for label in labels { assert_eq(label, '+quote(row['value']['samples'][0][1])+') }\n'
        # Independent cases restore only the global field actually used by these
        # fixtures; failure cannot leak unicode-minus state to subsequent cases.
        body='  let saved = @config.unicode_minus()\n  defer @config.set_unicode_minus(saved)\n  @config.set_unicode_minus(true)\n'+body
        bodies.append(body)
    header='''// Generated by scripts/generate_logit_formatter_axis_reference.py; do not edit.

///|
fn logit_axis_view(formatter : @ticker.LogitFormatter) -> @ticker.TickValues {
  match formatter.locations() {
    @ticker.FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray fixture")
  }
}

///|
fn logit_axis_count(text : String, part : String) -> Int {
  text.split(part).count() - 1
}

///|
fn logit_axis_assert_values(actual : @ticker.FormatterLocations, expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<expected.length() {
    let value = actual.get(index)
    if expected[index].is_nan() { assert_true(value.is_nan()) }
    else { assert_eq(value.reinterpret_as_uint64(), expected[index].reinterpret_as_uint64()) }
  }
}

///|
fn logit_axis_assert_labelled(formatter : @ticker.LogitFormatter, expected : Array[Double]) -> Unit raise {
  let actual = formatter.labelled().map(key => match key.value() {
    @ticker.ScalarNumber::Number(value) | @ticker.ScalarNumber::NumpyFloat64(value) => value
    @ticker.ScalarNumber::NumpyInt64(value) => value.to_double()
    _ => abort("unexpected scalar in Float64/Int64 Axis fixture")
  })
  assert_eq(actual.length(), expected.length())
  for value in expected {
    assert_true(if value.is_nan() { actual.any(item => item.is_nan()) } else { actual.contains(value) })
  }
}
'''
    out=header
    for i,body in enumerate(bodies):out+='\n///|\nfn logit_formatter_axis_case_'+str(i)+'() -> Unit raise {\n'+body+'}\n'
    for start in range(0,len(bodies),32):out+='\n///|\ntest "LogitFormatter original actual Axis group '+str(start//32)+'" {\n'+''.join('  logit_formatter_axis_case_'+str(i)+'()\n'for i in range(start,min(start+32,len(bodies))))+'}\n'
    return formatted(out)

def main():
    global P
    parser=argparse.ArgumentParser();parser.add_argument('ticker',type=Path,nargs='?',default=P);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    P=args.ticker
    payload=collect();payload['registered_groups']=(len(payload['observations'])+31)//32
    payload['scope']='Complete original LogitFormatter/helpers and actual Axis installation/update_ticks/draw, Secondary transforms/lims, shared Grouper/Figure removal; explicit renderer/Text/layout storage sinks. Source math profile, no port algorithm oracle or new axis provider.'
    tests=emit(payload);data=json.dumps(payload,indent=2,allow_nan=False)+'\n'
    for path,text in [(ROOT/'testdata/logit_formatter_axis_reference.json',data),(ROOT/'scene/logit_formatter_axis_reference_test.mbt',tests)]:
        if args.check:
            if path.read_text()!=text:raise SystemExit('stale '+str(path))
        else:path.write_text(text)
    print(('checked'if args.check else'generated')+' '+str(payload['counts'])+' / '+str(payload['registered_groups'])+' registered groups')
if __name__=='__main__':main()
