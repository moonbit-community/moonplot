"""Complete original autoscale, lazy shared view and final-limit reference."""
from pathlib import Path
import argparse, ast, copy, hashlib, json, math, sys, types, warnings
import numpy as np
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'scripts'))
import generate_axes_clear_reference as clear
from generate_scale_defaults_reference import moon
from generate_auto_date_reference import formatted
ns=clear.ns;P=clear.P
basepath=P.parent/'axes/_base.py'
tree=ast.parse(basepath.read_bytes())
base=next(n for n in tree.body if isinstance(n,ast.ClassDef)and n.name=='_AxesBase')
METHODS=['_unstale_viewLim','viewLim','_request_autoscale_view','autoscale','autoscale_view',
         'get_xlim','get_ylim','set_xlim','set_ylim','get_xbound','get_ybound','set_xbound','set_ybound',
         'margins','set_xmargin','set_ymargin']
methods={}
for node in base.body:
    if isinstance(node,ast.FunctionDef)and node.name in METHODS:
        exec(compile(ast.Module(body=[copy.deepcopy(node)],type_ignores=[]),str(basepath),'exec'),ns)
        methods[node.name]=ns[node.name]
api=P.parent/'_api/__init__.py'
node=next(n for n in ast.parse(api.read_bytes()).body if isinstance(n,ast.FunctionDef)and n.name=='getitem_checked')
exec(compile(ast.Module(body=[node],type_ignores=[]),str(api),'exec'),ns)
ns['_api'].getitem_checked=ns['getitem_checked']
scale=P.with_name('scale.py')
for node in ast.parse(scale.read_bytes()).body:
    if isinstance(node,ast.ClassDef)and node.name in ['InvertedLogTransform','InvertedSymmetricalLogTransform','InvertedAsinhTransform','LogisticTransform']:
        exec(compile(ast.Module(body=[node],type_ignores=[]),str(scale),'exec'),ns)
for node in ast.parse(P.read_bytes()).body:
    if isinstance(node,ast.FunctionDef)and node.name in ['_decade_less_equal','_decade_greater_equal','_decade_less','_decade_greater']:
        exec(compile(ast.Module(body=[node],type_ignores=[]),str(P),'exec'),ns)
trans=P.with_name('transforms.py')
bbox=next(n for n in ast.parse(trans.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='Bbox')
bboxmethods={}
for node in bbox.body:
    if isinstance(node,ast.FunctionDef)and node.name in ['mutatedx','mutatedy']:
        exec(compile(ast.Module(body=[node],type_ignores=[]),str(trans),'exec'),ns)
        bboxmethods[node.name]=ns[node.name]

class ViewBox:
    def __init__(self,axes):self.axes=axes;self._points_orig=np.array([[0.,0.],[1.,1.]])
    @property
    def _points(self):return np.array([self.axes.xaxis.view,self.axes.yaxis.view]).T
    @property
    def intervalx(self):return np.array(self.axes.read_view('x'))
    @property
    def intervaly(self):return np.array(self.axes.read_view('y'))
    mutatedx=bboxmethods['mutatedx'];mutatedy=bboxmethods['mutatedy']

class DataBox:
    def __init__(self,axes):
        self.axes=axes;self.intervalx=np.array([math.inf,-math.inf]);self.intervaly=self.intervalx.copy()
        self._minposx=self._minposy=math.inf
    def read(self,name):
        self.axes.figure.events.append(['data.minpos',self.axes.index,name])
        if self.axes.figure.fail_data_minpos==(self.axes.index,name):raise ValueError('shared data minpos failure')
        return getattr(self,'_minpos'+name)
    minposx=property(lambda self:self.read('x'))
    minposy=property(lambda self:self.read('y'))

class Axes(clear.Axes):
    def __init__(self,*args,**kwargs):
        self._tight=False;self._xmargin=self._ymargin=.05;self.use_sticky_edges=True
        super().__init__(*args,**kwargs)
        self._viewLim=ViewBox(self);self.dataLim=DataBox(self)
        self.stickies=[];self.view_queries={'x':0,'y':0}
    def read_view(self,name):
        self.view_queries[name]+=1
        self.figure.view_reads.append([self.index,name])
        if self.figure.fail_view_query==(self.index,name,self.view_queries[name]):raise ValueError('view query '+str(self.view_queries[name])+' failed')
        return self._axis_map[name].view
    def _get_data_children(self):return self.stickies
    def get_xscale(self):return self.xaxis.get_scale()
    def get_yscale(self):return self.yaxis.get_scale()
    def set_autoscalex_on(self,value):self.xaxis._set_autoscale_on(value)
    def set_autoscaley_on(self,value):self.yaxis._set_autoscale_on(value)
    def xaxis_inverted(self):return self.xaxis.get_inverted()
    def yaxis_inverted(self):return self.yaxis.get_inverted()
for name,value in methods.items():setattr(Axes,name,value)
original_autoscale_view=Axes.autoscale_view
def traced_autoscale_view(self,*args,**kwargs):
    self.figure.events.append(['autoscale_view',self.index,copy.deepcopy(kwargs)])
    return original_autoscale_view(self,*args,**kwargs)
Axes.autoscale_view=traced_autoscale_view

class Figure(clear.Figure):
    def __init__(self):super().__init__();self.fail_data_minpos=None;self.fail_view_query=None;self.view_reads=[]
    def add_subplot(self,spec,**kwargs):
        axes=Axes(self,len(self.created),**kwargs);self.created.append(axes);self.active.append(axes);return axes

def setup(*,family='linear',shared=False,data=True,auto=True,view=(100.,200.),tight=False):
    ns['mpl'].rcParams._set('axes.autolimit_mode','data')
    f=Figure();axes=list(clear.Grid(f,1,2 if shared else 1).subplots(sharex='all'if shared else'none',sharey='all'if shared else'none',squeeze=False).flat)
    for index,a in enumerate(axes):
        a.xaxis._set_scale(family,**({'linthresh':2.}if family=='symlog'else{}))
        a.xaxis.view=view;a.yaxis.view=(300.,400.);a.xaxis._autoscale_on=auto;a.yaxis._autoscale_on=False
        a._tight=tight
        if data:
            x=([.1,.8]if family=='logit'else[-10.,20.]if family in ['symlog','asinh']else[10.,20.])
            a.dataLim.intervalx=np.array(x)+index*10.;a.dataLim.intervaly=np.array([30.,40.])
            a.dataLim._minposx=.01;a.dataLim._minposy=30.
        a._stale_viewlims={'x':False,'y':False}
    f.events.clear();f.minpos_reads.clear();f.view_reads.clear()
    for axis in axes:axis.view_queries={'x':0,'y':0}
    return f,axes

def state(f,axes):
    return [{'index':a.index,'xview':list(a.xaxis.view),'yview':list(a.yaxis.view),
             'auto':[a.get_autoscalex_on(),a.get_autoscaley_on()],
             'mutated':[bool(a._viewLim.mutatedx()),bool(a._viewLim.mutatedy())],
             'stale':dict(a._stale_viewlims),'tight':a._tight,'margins':[a._xmargin,a._ymargin],
             'scale':a.get_xscale(),'yscale':a.get_yscale(),'active':a in f.active,
             'group':[v.index for v in f.groups['x'].get_siblings(a)],
             'data':[a.dataLim.intervalx.tolist(),a.dataLim.intervaly.tolist()],
             'minpos':[a.dataLim._minposx,a.dataLim._minposy],
             'own_minpos':[a.xaxis.minpos,a.yaxis.minpos],
             'stickies':[{'x':list(v._sticky_edges.x),'y':list(v._sticky_edges.y)}for v in a.stickies],
             'use_sticky':a.use_sticky_edges}for a in axes]

# The real Axis.get_inverted reads the authoritative view independently of
# get_xbound/get_xlim. Both reads project to the checked Moon view callback.
axisnode=next(n for n in ast.parse(P.with_name('axis.py').read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='Axis')
node=next(n for n in axisnode.body if isinstance(n,ast.FunctionDef)and n.name=='get_inverted')
exec(compile(ast.Module(body=[copy.deepcopy(node)],type_ignores=[]),str(P.with_name('axis.py')),'exec'),ns)
clear.Axis.get_inverted=ns['get_inverted']
def axis_view(self):
    if not hasattr(self.axes,'_viewLim'):return self.view
    self.axes._unstale_viewLim()
    return getattr(self.axes._viewLim,'interval'+self.axis_name)
clear.Axis.get_view_interval=axis_view


def perform(axes, action):
    a=axes[action.get('panel',0)];kind=action['kind']
    if kind=='view':return a.autoscale_view(**action.get('kwargs',{}))
    if kind=='autoscale':return a.autoscale(**action.get('kwargs',{}))
    if kind=='request':return a._request_autoscale_view(**action.get('kwargs',{}))
    if kind=='unstale':return a._unstale_viewLim()
    if kind=='get':return a.get_xlim() if action.get('horizontal',True)else a.get_ylim()
    if kind=='scale':return a.xaxis._set_axes_scale(action['family'],**({'linthresh':2.}if action['family']=='symlog'else{}))
    if kind=='margin':return a.set_xmargin(action['value'])
    raise ValueError('unknown operation '+kind)


def collect():
    rows=[]
    def take(label,f,axes,actions):
        f.events.clear();f.minpos_reads.clear();f.view_reads.clear()
        for a in axes:a.view_queries={'x':0,'y':0}
        before=state(f,axes)
        with warnings.catch_warnings(record=True)as seen,np.errstate(all='ignore'):
            warnings.simplefilter('always')
            try:
                for action in actions:perform(axes,action)
                error=None
            except Exception as e:error={'type':type(e).__name__,'message':str(e)}
        rows.append({'label':label,'before':before,'after':state(f,axes),'actions':copy.deepcopy(actions),'error':error,
                     'round':ns['mpl'].rcParams['axes.autolimit_mode']=='round_numbers',
                     'events':copy.deepcopy(f.events),'own_reads':[str(i)+'.'+n for i,n in f.minpos_reads],
                     'view_reads':[str(i)+'.'+n for i,n in f.view_reads],
                     'fail_minpos':f.fail_minpos,'fail_data_minpos':f.fail_data_minpos,'fail_view_query':f.fail_view_query,
                     'warnings':[str(w.message)for w in seen]})
    def view(panel=0,**kw):return {'kind':'view','panel':panel,'kwargs':kw}
    for family in ['linear','log','symlog','asinh','logit']:
        f,a=setup(family=family);take('complete five-scale '+family,f,a,[view(scaley=False)])
    for auto in [False,True]:
        for tight in [None,False,True]:
            f,a=setup(auto=auto);take('eager view auto '+str(auto)+' tight '+str(tight),f,a,[view(tight=tight,scaley=False)])
    f,a=setup();take('unselected directions still update tight',f,a,[view(tight=True,scalex=False,scaley=False)])
    for enable in [None,False,True]:
        for axis in ['x','both']:
            f,a=setup(auto=False);take('lazy enable '+str(enable)+' '+axis,f,a,[{'kind':'autoscale','kwargs':{'enable':enable,'axis':axis,'tight':True}}])
    for view0 in [(100.,200.),(0.,1.)]:
        f,a=setup(data=False,view=view0);take('empty current mutation '+str(view0),f,a,[view(scaley=False)])
    f,a=setup(data=False,view=(100.,200.));a[0].set_xlim(0.,1.,auto=True)
    take('mutation reverses to original interval',f,a,[view(scaley=False)])
    f,a=setup(shared=True);take('shared request lazy',f,a,[{'kind':'request','kwargs':{'axis':'x','tight':True}}])
    f,a=setup(shared=True);a[0]._request_autoscale_view('x',tight=True)
    take('different shared requester unstales with own tight',f,a,[{'kind':'unstale','panel':1}])
    f,a=setup(shared=True);a[0]._request_autoscale_view('x',tight=True);f.fail_minpos=(1,'x')
    take('late peer failure leaves initiator stored and all requests consumed',f,a,[{'kind':'unstale'}])
    for auto in [False,True]:
        f,a=setup(auto=auto);take('changed scale force auto '+str(auto),f,a,[{'kind':'scale','family':'log'}])
    f,a=setup();take('same default tuple skips force',f,a,[{'kind':'scale','family':'symlog'}])
    f,a=setup(view=(200.,100.));take('inversion survives finalization',f,a,[view(scaley=False)])
    for margin in [.1,-.1]:
        f,a=setup();a[0]._xmargin=margin;a[0].dataLim.intervalx=np.array([0.,10.]);a[0].stickies=[types.SimpleNamespace(_sticky_edges=types.SimpleNamespace(x=[0.,10.],y=[0.,1.]))]
        take('image sticky positive or negative margin '+str(margin),f,a,[view(scaley=False)])
    f,a=setup();a[0].dataLim.intervalx=np.array([1e-12,2e-12]);a[0].stickies=[types.SimpleNamespace(_sticky_edges=types.SimpleNamespace(x=[1e-12,2e-12],y=[0.,1.]))]
    take('tiny sticky relative tolerance',f,a,[view(scaley=False)])
    f,a=setup();f.fail_data_minpos=(0,'x');take('raw DataBox minpos failure precedes views',f,a,[view(tight=True,scaley=False)])
    f,a=setup();f.fail_minpos=(0,'x');take('own minpos fails after both views',f,a,[view(tight=True,scaley=False)])
    for count in [1,2]:
        f,a=setup();f.fail_view_query=(0,'x',count);take('bound view failure '+str(count),f,a,[view(tight=True,scaley=False)])
    f,a=setup(shared=True);f._remove_axes(a[0],owners=[f.active]);a[1].sharex(a[0]);a[1].sharey(a[0]);a[0].dataLim.intervalx=np.array([100.,200.]);a[0].stickies=[types.SimpleNamespace(_sticky_edges=types.SimpleNamespace(x=[200.,200.],y=[0.,1.]))]
    take('removed rejoined member still supplies data and sticky',f,a,[view(panel=1,scaley=False)])
    for tight in [None,False]:
        f,a=setup(tight=True);ns['mpl'].rcParams._set('axes.autolimit_mode','round_numbers')
        take('round mode tight '+str(tight),f,a,[view(tight=tight,scaley=False)])
    f,a=setup(auto=False,data=False);take('enable then getter preserves empty mutated view',f,a,[{'kind':'autoscale','kwargs':{'enable':True,'axis':'x'}},{'kind':'get'}])
    for margin in [math.nan,math.inf]:
        for tight in [True,False]:
            f,a=setup();take('nonfinite margin '+str(margin)+' tight '+str(tight),f,a,[{'kind':'margin','value':margin},view(tight=tight,scaley=False)])
    # Mirror all five transforms through vertical Axis context.
    for family in ['linear','log','symlog','asinh','logit']:
        f,a=setup(family=family);a[0].yaxis._set_scale(family,**({'linthresh':2.}if family=='symlog'else{}))
        a[0].yaxis._autoscale_on=True;a[0].xaxis._autoscale_on=False
        a[0].dataLim.intervaly=a[0].dataLim.intervalx.copy();a[0].dataLim._minposy=.01
        take('vertical complete transform '+family,f,a,[view(scalex=False)])
    for i,r in enumerate(rows):r['id']=i
    cache=collect_cache()
    hashes={**clear.SOURCES,**ns['source_hashes'],'axes/_base.py':hashlib.sha256(basepath.read_bytes()).hexdigest(),'transforms.py':hashlib.sha256(trans.read_bytes()).hexdigest()}
    return {'source_hashes':hashes,'numpy_binary_sha256':hashlib.sha256(Path(np._core._multiarray_umath.__file__).read_bytes()).hexdigest(),
            'counts':{'scene_cases':len(rows),'cache_cases':len(cache),'cases':len(rows)+len(cache),'registered_groups':math.ceil((len(rows)+len(cache))/32)},
            'scope':'Complete original autoscale/autoscale_view/request/unstale/get-set-bound and Axis finalization, complete five transforms, complete cache algorithms. Controlled numeric interval/Path/presentation/ownership hosts, authoritative view callback projection. No port algorithm oracle. Full arbitrary Artist, units and secondary lifecycle remain separate.',
            'cases':rows,'cache_cases':cache}


# Complete cache algorithms, preserving actual Bbox state and paired mask.
cache_ns=dict(np=np,Path=lambda values:types.SimpleNamespace(vertices=np.asarray(values)))
for node in bbox.body:
    if isinstance(node,ast.FunctionDef)and node.name in ['update_from_path','update_from_data_xy','ignore','set_points']:
        exec(compile(ast.Module(body=[copy.deepcopy(node)],type_ignores=[]),str(trans),'exec'),cache_ns)
cache_ns['mtransforms']=types.SimpleNamespace(Bbox=types.SimpleNamespace(null=lambda:types.SimpleNamespace(get_points=lambda:np.array([[np.inf,np.inf],[-np.inf,-np.inf]]))))
for node in base.body:
    if isinstance(node,ast.FunctionDef)and node.name in ['update_datalim','_update_line_limits','relim']:
        exec(compile(ast.Module(body=[copy.deepcopy(node)],type_ignores=[]),str(basepath),'exec'),cache_ns)
class CacheBox:
    def __init__(self):self._points=np.array([[10.,30.],[20.,40.]]);self._minpos=np.array([10.,30.]);self._ignore=False
    def invalidate(self):pass
for name in ['update_from_path','update_from_data_xy','ignore','set_points']:setattr(CacheBox,name,cache_ns[name])
def collect_cache():
    result=[]
    operations=[('x-only first',[[1.,2.],[3.,4.]],True,False),('y-only first',[[1.,2.],[3.,4.]],False,True),('both first',[[1.,2.],[3.,4.]],True,True),('all nonfinite early return',[[math.nan,math.inf]],True,True),('paired invalid consumes ignore',[[1.,math.nan]],True,True)]
    for label,points,ux,uy in operations:
        h=types.SimpleNamespace(dataLim=CacheBox(),ignore_existing_data_limits=True,transData=None,name='rectilinear',_children=[])
        cache_ns['update_datalim'](h,points,updatex=ux,updatey=uy)
        result.append({'label':label,'kind':'update','points':points,'update_x':ux,'update_y':uy,'bounds':h.dataLim._points.tolist(),'minpos':h.dataLim._minpos.tolist(),'ignore':h.ignore_existing_data_limits})
    for points,label in [([], 'empty Line leaves ignore'),([[math.nan,math.inf]],'nonempty invalid Line consumes ignore')]:
        h=types.SimpleNamespace(dataLim=CacheBox(),ignore_existing_data_limits=True,name='rectilinear',_children=[])
        h.transData=types.SimpleNamespace(contains_branch_separately=lambda _: (True,True))
        path=types.SimpleNamespace(vertices=np.asarray(points));line=types.SimpleNamespace(get_path=lambda:path,get_transform=lambda:h.transData)
        cache_ns['_update_line_limits'](h,line)
        result.append({'label':label,'kind':'line','points':points,'bounds':h.dataLim._points.tolist(),'minpos':h.dataLim._minpos.tolist(),'ignore':h.ignore_existing_data_limits})
    h=types.SimpleNamespace(dataLim=CacheBox(),ignore_existing_data_limits=False,_children=[])
    cache_ns['relim'](h)
    result.append({'label':'empty relim preserves old minpos','kind':'relim','points':[],'bounds':h.dataLim._points.tolist(),'minpos':h.dataLim._minpos.tolist(),'ignore':h.ignore_existing_data_limits})
    return result

HEADER='''// Generated from complete original Matplotlib autoscale methods; do not edit.

///|
fn autoscale_ref_number(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn autoscale_ref_limits(actual : @core.Limits, lower : Double, upper : Double) -> Unit raise {
  autoscale_ref_number(actual.lower(), lower)
  autoscale_ref_number(actual.upper(), upper)
}

///|
fn autoscale_ref_group(panel : Axes, panels : Array[Axes]) -> Array[Int] {
  panel.x_group_states().map(state => {
    let mut found = -1
    for index, item in panels {
      if physical_equal(state, item.state) { found = index }
    }
    found
  })
}
'''


def scale_moon(family):
    return {'linear':'@scale.linear_scale()','log':'@scale.log_scale()','symlog':'@scale.symlog_scale(linthresh=2.0)','asinh':'@scale.asinh_scale(linear_width=1.0)','logit':'@scale.logit_scale()'}[family]
def option(value):return 'None' if value is None else 'Some('+moon(value)+')'
def action_moon(action):
    a='panels['+str(action.get('panel',0))+']';kind=action['kind'];kw=action.get('kwargs',{})
    if kind=='view':
        args=[k+'='+moon(v) for k,v in kw.items() if v is not None]
        return a+'.autoscale_view('+', '.join(args)+')'
    if kind=='autoscale':
        args=[k+'='+(option(v)if k=='enable'else moon(v))for k,v in kw.items() if v is not None or k=='enable']
        return a+'.autoscale('+', '.join(args)+')'
    if kind=='request':return a+'.request_autoscale_view('+', '.join(k+'='+moon(v)for k,v in kw.items())+')'
    if kind=='unstale':return a+'.unstale_view()'
    if kind=='get':return 'ignore('+a+('.get_xlim_checked()'if action.get('horizontal',True)else'.get_ylim_checked()')+')'
    if kind=='scale':return a+'.set_xscale('+scale_moon(action['family'])+')'
    if kind=='margin':return a+'.set_x_margin('+moon(action['value'])+')'
    raise ValueError(kind)

def render_scene(case):
    before=case['before'];out=['///|',f'fn autoscale_source_case_{case["id"]}() -> Unit raise {{',
          '  let old_mode = @config.axes_autolimit_mode()',
          '  defer { @config.set_axes_autolimit_mode(old_mode) }',
          '  @config.set_axes_autolimit_mode('+moon('round_numbers'if case['round']else'data')+')',
          '  let fig = figure(width=400, height=300)',
          '  let panels = '+('fig.subplots(1, 2, share_x=true, share_y=true)'if len(before)>1 else'[fig.axes()]')]
    # Whitebox source-host children carry raw sticky endpoints, including equal
    # endpoints. Do not pass this context through validated public imshow, fit,
    # cache accumulation or request scheduling. Cached data/view are seeded later.
    for i,s in enumerate(before):
        for sticky in s['stickies']:
            xs=sticky['x'];ys=sticky['y']
            extent=', '.join(moon(v)for v in [min(xs),max(xs),min(ys),max(ys)])
            out.append(f'  panels[{i}].state.val.artists.push(Artist::ColorImage([[@colors.rgba(0.0, 0.0, 0.0)]], ImageOrigin::Upper, Some(('+extent+')), 1.0, ImageInterpolation::Nearest))')
    for i,s in enumerate(before):
        for horizontal,family,view0 in [(True,s['scale'],s['xview']),(False,s['yscale'],s['yview'])]:
            field='x_axis'if horizontal else'y_axis'
            out += [f'  panels[{i}].state.val.{field}.set_limits({moon(view0[0])}, {moon(view0[1])})',
                    f'  panels[{i}].state.val.{field}.set_scale({scale_moon(family)})',
                    f'  panels[{i}].state.val.{field}.set_tick_label_size(10.0)',
                    f'  panels[{i}].state.val.{field}.set_tick_layout({"150.0"if horizontal else"100.0"}, {moon(horizontal)}, active=true)']
    for i,s in enumerate(before):
        if not s['active']:out.append(f'  panels[{i}].remove()')
    if any(not s['active']for s in before):
        for horizontal in [True,False]:
            field='x_axis'if horizontal else'y_axis'
            out += [f'  panels[1].join_shared_axis(panels[0].state, {moon(horizontal)})',
                    f'  panels[1].state.val.{field}.share_numeric_tickers(panels[0].state.val.{field})']
    for i,s in enumerate(before):
        out += [f'  panels[{i}].state.val.raw_x_data = @core.limits({moon(s["data"][0][0])}, {moon(s["data"][0][1])})',
                f'  panels[{i}].state.val.raw_y_data = @core.limits({moon(s["data"][1][0])}, {moon(s["data"][1][1])})',
                f'  panels[{i}].state.val.x_data_minpos = {moon(s["minpos"][0])}',
                f'  panels[{i}].state.val.y_data_minpos = {moon(s["minpos"][1])}',
                f'  panels[{i}].state.val.tight = {option(s["tight"])}',
                f'  panels[{i}].state.val.x_margin = {moon(s["margins"][0])}',
                f'  panels[{i}].state.val.y_margin = {moon(s["margins"][1])}',
                f'  panels[{i}].state.val.use_sticky_edges = {moon(s["use_sticky"])}']
        for h,name in enumerate(['x','y']):
            axis=f'panels[{i}].state.val.{name}_axis'
            out += [f'  {axis}.set_autoscale_on({moon(s["auto"][h])})',f'  {axis}.clear_autoscale_request()']
            if s['stale'][name]:out.append(f'  {axis}.request_autoscale()')
    out += ['  let own_reads : Array[String] = []','  let view_reads : Array[String] = []']
    for i,s in enumerate(before):
        for h,name in enumerate(['x','y']):
            axis=f'panels[{i}].state.val.{name}_axis';key=str(i)+'.'+name
            own_fail=case['fail_minpos']==(i,name)or case['fail_minpos']==[i,name]
            out += [f'  {axis}.bind_minpos('+('fn() -> Double raise @core.DataError {'if own_fail else'() => {'),
                    '    own_reads.push('+moon(key)+')',
                    '    raise @core.DataError::InvalidTicks(message="late minpos provider failure")'if own_fail else'    '+moon(s['own_minpos'][h]),'  })']
            poison=case['fail_view_query'];fail_count=poison[2] if poison is not None and poison[:2]in[(i,name),[i,name]]else None
            if fail_count is not None:out.append(f'  let view_counter_{i}_{name} = [0]')
            out += [f'  {axis}.bind_view_interval('+('fn() -> (Double, Double) raise @core.DataError {'if fail_count else'() => {'),
                    '    view_reads.push('+moon(key)+')']
            if fail_count is not None:
                out += [f'    view_counter_{i}_{name}[0] += 1',f'    if view_counter_{i}_{name}[0] == {fail_count} {{',
                        '      raise @core.DataError::InvalidTicks(message='+moon('view query '+str(fail_count)+' failed')+')','    }']
            out += [f'    let view = {axis}.stored_view_limits()','    (view.lower(), view.upper())','  })']
    if case['fail_data_minpos'] is not None:
        i,name=case['fail_data_minpos']
        out += [f'  panels[{i}].state.val.{name}_axis.bind_autoscale_minpos(fn() -> Array[Double] raise @core.DataError {{',
                '    raise @core.DataError::InvalidTicks(message="shared data minpos failure")','  })']
    if case['error'] is None:out += ['  '+action_moon(a)for a in case['actions']]
    else:
        out += ['  let raised = try {']+['    '+action_moon(a)for a in case['actions']]+['    false','  } catch {',
                '    @core.DataError::InvalidTicks(message~) => message == '+moon(case['error']['message']),
                '    _ => false','  }','  assert_true(raised)']
    for i,s in enumerate(case['after']):
        a=f'panels[{i}]'
        for h,name in enumerate(['x','y']):
            axis=a+'.state.val.'+name+'_axis';v=s[name+'view']
            out += [f'  autoscale_ref_limits({axis}.stored_view_limits(), {moon(v[0])}, {moon(v[1])})',
                    f'  assert_eq({axis}.autoscale_on(), {moon(s["auto"][h])})',
                    f'  assert_eq({axis}.autoscale_stale(), {moon(s["stale"][name])})',
                    f'  assert_eq({axis}.view_mutated(), {moon(s["mutated"][h])})',
                    f'  autoscale_ref_limits({a}.data_limits(horizontal={moon(h==0)}), {moon(s["data"][h][0])}, {moon(s["data"][h][1])})',
                    f'  autoscale_ref_number({a}.data_minpos(horizontal={moon(h==0)}), {moon(s["minpos"][h])})']
        out += [f'  assert_eq({a}.autoscale_tight(), {option(s["tight"])})',
                f'  autoscale_ref_number({a}.x_margin(), {moon(s["margins"][0])})',
                f'  autoscale_ref_number({a}.y_margin(), {moon(s["margins"][1])})',
                f'  assert_eq(autoscale_ref_group({a}, panels), {moon(s["group"])})']
    out += ['  assert_eq(own_reads, '+moon(case['own_reads'])+')','  assert_eq(view_reads, '+moon(case['view_reads'])+')','}']
    return '\n'.join(out)


def render_cache(case,index):
    out=['///|',f'fn autoscale_source_case_{index}() -> Unit raise {{','  let panel = figure().axes()',
         '  panel.state.val.raw_x_data = @core.limits(10.0, 20.0)',
         '  panel.state.val.raw_y_data = @core.limits(30.0, 40.0)',
         '  panel.state.val.x_data_minpos = 10.0','  panel.state.val.y_data_minpos = 30.0',
         '  panel.state.val.ignore_existing_data_limits = true']
    points='['+', '.join('@core.point('+moon(p[0])+', '+moon(p[1])+')'for p in case['points'])+']'
    if case['kind']=='update':out.append('  panel.update_datalim('+points+', update_x='+moon(case['update_x'])+', update_y='+moon(case['update_y'])+')')
    elif case['kind']=='line':out.append('  panel.push_artist(Artist::Line('+points+', @core.style("#000000")))')
    else:out.append('  panel.relim()')
    bounds=case['bounds']
    out += ['  autoscale_ref_limits(panel.data_limits(), '+moon(bounds[0][0])+', '+moon(bounds[1][0])+')',
            '  autoscale_ref_limits(panel.data_limits(horizontal=false), '+moon(bounds[0][1])+', '+moon(bounds[1][1])+')',
            '  autoscale_ref_number(panel.data_minpos(), '+moon(case['minpos'][0])+')',
            '  autoscale_ref_number(panel.data_minpos(horizontal=false), '+moon(case['minpos'][1])+')',
            '  assert_eq(panel.ignore_existing_data_limits(), '+moon(case['ignore'])+')','}']
    return '\n'.join(out)


def render(payload):
    chunks=[HEADER]+[render_scene(case)for case in payload['cases']]
    chunks += [render_cache(case,len(payload['cases'])+i)for i,case in enumerate(payload['cache_cases'])]
    labels=[case['label']for case in payload['cases']]+[case['label']for case in payload['cache_cases']]
    for start in range(0,payload['counts']['cases'],32):
        calls=[]
        for i in range(start,min(start+32,payload['counts']['cases'])):
            calls.append('  autoscale_source_case_'+str(i)+'() catch { error => fail('+moon('original autoscale case '+str(i)+' ['+labels[i]+']: ')+' + error.to_string()) }')
        chunks.append('///|\ntest "original autoscale lifecycle group '+str(start//32)+'" {\n'+'\n'.join(calls)+'\n}')
    return formatted('\n\n'.join(chunks)+'\n')


def json_safe(value):
    if isinstance(value,(float,np.floating)):
        if not math.isfinite(value):return {'float':str(float(value))}
        return float(value)
    if isinstance(value,dict):return {str(k):json_safe(v)for k,v in value.items()}
    if isinstance(value,(list,tuple)):return [json_safe(v)for v in value]
    if isinstance(value,np.integer):return int(value)
    if isinstance(value,np.bool_):return bool(value)
    return value


def main():
    ap=argparse.ArgumentParser();ap.add_argument('ticker',nargs='?',type=Path,default=P);ap.add_argument('--check',action='store_true');args=ap.parse_args()
    if args.ticker.resolve()!=P.resolve():raise ValueError('this loader requires the pinned source tree')
    payload=collect();code=render(payload)
    outputs={ROOT/'testdata/autoscale_reference.json':json.dumps(json_safe(payload),indent=2,allow_nan=False)+'\n',ROOT/'scene/autoscale_reference_wbtest.mbt':code}
    for path,content in outputs.items():
        if args.check:
            if not path.exists()or path.read_text()!=content:raise SystemExit('generated reference differs: '+str(path))
        else:path.write_text(content)
    print(json.dumps({'check':args.check,**payload['counts'],'json_sha256':hashlib.sha256(outputs[ROOT/'testdata/autoscale_reference.json'].encode()).hexdigest()}))
if __name__=='__main__':main()
