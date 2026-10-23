"""Complete original Axis constructor/clear reference for the typed lifecycle.

No Moon implementation supplies expected observations. This loader executes the
unchanged upstream __init__/clear methods with explicit artist/Text/context host
sinks and reuses the accepted complete Ticker/Scale/default source namespace.
"""
from pathlib import Path
import argparse,ast,copy,hashlib,json,math,types
from generate_scale_lifecycle_reference import load as load_scale_lifecycle,PROFILES,FLAGS,flags,slots,describe,custom,custom_moon
from generate_scale_defaults_reference import moon
from generate_auto_date_reference import formatted
ROOT=Path(__file__).resolve().parents[1]
P=ROOT/'.moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py'
AXIS_SHA='f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0'

def load(path):
    """Return (namespace, AxisHarness), including complete original init/clear.

    AxisHarness(name='axis',which='x',clear=True,major=None,minor=None,axes=None).
    major/minor, when supplied, are explicit post-construction host graph wiring;
    normal source construction always creates its own real Ticker objects first.
    .view/.data/.space/.minpos and .events are controlled context/artist sinks.
    The namespace contains OriginalAxisInitialClear and _axis_initial_text.
    """
    path=Path(path);ns,previous=load_scale_lifecycle(path);ap=path.with_name('axis.py');raw=ap.read_bytes()
    if hashlib.sha256(raw).hexdigest()!=AXIS_SHA:raise ValueError('fixed axis.py differs')
    original=next(n for n in ast.parse(raw).body if isinstance(n,ast.ClassDef)and n.name=='Axis')
    names=('__init__','clear','get_remove_overlapping_locs','set_remove_overlapping_locs')
    nodes=[copy.deepcopy(n)for n in original.body if isinstance(n,ast.FunctionDef)and n.name in names]
    nodes += [copy.deepcopy(n)for n in original.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id=='remove_overlapping_locs'for t in n.targets)]
    cls=ast.ClassDef(name='OriginalAxisInitialClear',bases=[ast.Name(id='OriginalScaleLifecycleAxis',ctx=ast.Load())],keywords=[],body=nodes,decorator_list=[])
    exec(compile(ast.fix_missing_locations(ast.Module(body=[cls],type_ignores=[])),str(ap),'exec'),ns)
    class TextSink:
        def __init__(self,*args,**kwargs):self.text=kwargs.get('text','');self.visible=True;self.properties=dict(kwargs)
        def _reset_visual_defaults(self):self.properties={}
        def set_color(self,value):self.properties['color']=value
        def set_fontsize(self,value):self.properties['fontsize']=value
        def set_fontweight(self,value):self.properties['fontweight']=value
        def set_text(self,value):self.text=value
        def get_text(self):return self.text
        def set_visible(self,value):self.visible=value
        def get_visible(self):return self.visible
        def set(self,**kwargs):self.properties.update(kwargs)
        def set_figure(self,value):self.figure=value
        def set_transform(self,value):self.properties['transform']=value
        def draw(self,*args):pass
    class CallbackSink:
        def __init__(self,*args,**kwargs):self.signals=kwargs.get('signals',[]);self.events=[]
        def process(self,*args):self.events.append(args)
    ns['mtext']=types.SimpleNamespace(Text=TextSink)
    ns['cbook'].CallbackRegistry=CallbackSink
    for key,value in [('axes.labelcolor','black'),('axes.labelsize','medium'),('axes.labelweight','normal'),('axes.labelpad',4.0),('axes.grid',False),('axes.grid.which','major')]:
        ns['mpl'].rcParams._set(key,value)
    for name in ['AutoMinorLocator','AutoLocator','ScalarFormatter','LogFormatterSciNotation','LogitFormatter']:
        setattr(ns['mticker'],name,ns[name])
    class AxisHarness(ns['OriginalAxisInitialClear']):
        def __init__(self,name='axis',which='x',clear=True,major=None,minor=None,axes=None):
            self.name=name;self.axis_name=which;self.events=[];self.stale=False;self.visible=True
            self.view=(0.,1.);self.data=(math.inf,-math.inf);self.space=5;self.minpos=.001
            if axes is None:
                axes=types.SimpleNamespace(name=name,label=name,_axis_names=['x','y'],_axis_map={which:self},
                    get_figure=lambda **kw:None,autoscale_view=lambda **kw:self.events.append(['autoscale',kw]),
                    _update_transScale=lambda:self.events.append('transform'))
            super().__init__(axes,clear=clear)
            if major is not None:self.major=major
            if minor is not None:self.minor=minor
        def _get_axis_name(self):return self.axis_name
        def set_figure(self,value):self.figure=value
        def _set_artist_props(self,artist):pass
        def _init(self):self.events.append('init-presentation')
        def reset_ticks(self):self.events.append('reset-tick-artists')
        def get_view_interval(self):return self.view
        def set_view_interval(self,lower,upper,ignore=False):self.view=(lower,upper)
        def get_data_interval(self):return self.data
        def set_data_interval(self,lower,upper,ignore=False):self.data=(lower,upper)
        def get_tick_space(self):return self.space
        def get_minpos(self):return self.minpos
        def get_majorticklocs(self):return self.major.locator()
        def get_ticklocs(self,*,minor=False):return self.minor.locator()if minor else self.major.locator()
        def get_visible(self):return self.visible
        def set_visible(self,value):self.visible=value
        def get_inverted(self):return self.view[0]>self.view[1]
        def set(self,**props):return ns['_scale_artist_update_props'](self,props,'{cls} has no property {prop_name!r}')
        def pchanged(self):self.events.append('pchanged')
        def set_default_intervals(self):self.events.append('default_intervals')
        def set_label_text(self,value):self.label.text=value;self.isDefault_label=False
        def _get_shared_axes(self):
            if hasattr(self.axes,'_shared_axes'):return super()._get_shared_axes()
            return [self.axes]
        def __str__(self):return self.name
    ns['_axis_initial_text']=TextSink
    ns['axis_initial_clear_method_hashes']={n.name:hashlib.sha256(ast.get_source_segment(raw.decode(),n).encode()).hexdigest()
        for n in original.body if isinstance(n,ast.FunctionDef)and n.name in names}
    return ns,AxisHarness

def snapshot(a):
    return {'classes':describe(a),'flags':flags(a),'owners':[v.axis is a for v in slots(a)],
        'view':list(a.view),'data':[v if math.isfinite(v)else {'type':'float','hex':float(v).hex()}for v in a.data],'overlap':bool(a.remove_overlapping_locs),
        'units':a.units,'converter_is_none':a._converter is None}

def state_assert(a,name='value'):
    return 'assert_eq(axis_initial_state('+name+'),'+moon(describe(a))+')\nassert_eq(axis_initial_flags('+name+'),'+moon(flags(a))+')\n'

def rc_source(ns,x,y,classic=False,locale=False,tex=False):
    for key,value in [('xtick.minor.visible',x),('ytick.minor.visible',y),('_internal.classic_mode',classic),
            ('axes.formatter.useoffset',True),('axes.formatter.use_mathtext',False),('axes.formatter.use_locale',locale),('text.usetex',tex)]:
        ns['mpl'].rcParams[key]=value

def rc_moon(x,y,classic=False,locale=False,tex=False):
    return ('let previous=@config.rc_params()\ndefer {\n'
        '@config.set_minor_ticks_visible(previous.minor_ticks_visible())\n'
        '@config.set_minor_ticks_visible(previous.minor_ticks_visible(horizontal=false),horizontal=false)\n'
        '@config.set_classic_mode(previous.classic_mode())\n@config.set_formatter_use_offset(previous.formatter_use_offset())\n'
        '@config.set_formatter_use_math_text(previous.formatter_use_math_text())\n@config.set_formatter_use_locale(previous.formatter_use_locale())\n'
        '@config.set_text_usetex(previous.text_usetex())\n}\n'
        '@config.set_minor_ticks_visible('+moon(x)+')\n@config.set_minor_ticks_visible('+moon(y)+',horizontal=false)\n'
        '@config.set_classic_mode('+moon(classic)+')\n@config.set_formatter_use_offset(true)\n@config.set_formatter_use_math_text(false)\n'
        '@config.set_formatter_use_locale('+moon(locale)+')\n@config.set_text_usetex('+moon(tex)+')\n')

def collect_mixed_metadata_cases():
    """Actual full query bodies after retained metadata and linear reinstall."""
    ns,Axis=load(P);ap=P.with_name('axis.py');text=ap.read_text()
    original=next(n for n in ast.parse(text).body if isinstance(n,ast.ClassDef)and n.name=='Axis')
    names=('_update_ticks','_tick_group_visible','get_majorticklocs','get_minorticklocs')
    methods=[n for n in original.body if isinstance(n,ast.FunctionDef)and n.name in names]
    cls=ast.ClassDef(name='OriginalInitialClearTickQueries',bases=[],keywords=[],body=methods,decorator_list=[])
    exec(compile(ast.fix_missing_locations(ast.Module(body=[cls],type_ignores=[])),str(ap),'exec'),ns)
    for name in names:setattr(Axis,name,ns['OriginalInitialClearTickQueries'].__dict__[name])
    tp=P.with_name('transforms.py');tt=tp.read_text()
    contains=next(n for n in ast.parse(tt).body if isinstance(n,ast.FunctionDef)and n.name=='_interval_contains_close')
    exec(compile(ast.Module(body=[contains],type_ignores=[]),str(tp),'exec'),ns)
    setattr(ns['mtransforms'],'_interval_contains_close',ns['_interval_contains_close'])
    ns['mpl'].rcParams._set('axes.autolimit_mode','data')
    ns['mpl'].rcParams._set('xtick.minor.ndivs','auto');ns['mpl'].rcParams._set('ytick.minor.ndivs','auto')
    ns['mpl'].rcParams['axes.formatter.offset_threshold']=4;ns['mpl'].rcParams['axes.formatter.limits']=[-5,6]
    class Metadata:
        def __init__(self,kind):self.kind=kind;self.reads=[]
        def __getattr__(self,key):self.reads.append(key);raise RuntimeError('unexpected metadata query '+key)
    class Label:
        def __init__(self):self.text=''
        def set_text(self,value):self.text=value
    class Tick:
        def __init__(self,kind):self.kind=kind;self.loc=0.;self.label1=Label();self.label2=Label()
        def update_position(self,value):self.loc=value
        def get_loc(self):return self.loc
    rows=[]
    for which in ['x','y']:
        horizontal=which=='x'
        for visible in [False,True]:
            rc_source(ns,visible,visible)
            for kind in ['date','category']:
                for view in [(0.,1.),(1000000.,1000001.)]:
                    clearer=Axis('clearer',which);peer=Axis('peer',which);peer.major=clearer.major;peer.minor=clearer.minor
                    peer._set_scale('log');metadata=Metadata(kind);unit=object();peer._converter=metadata;peer.units=unit
                    peer.set_major_locator(ns['FixedLocator']([10.,20.]));peer.set_major_formatter(ns['FixedFormatter'](['converter-old-10','converter-old-20']))
                    old=slots(peer);clearer.clear();peer._set_scale('linear');peer.view=view
                    peer.get_major_ticks=lambda count:[Tick('major')for _ in range(count)]
                    peer.get_minor_ticks=lambda count:[Tick('minor')for _ in range(count)]
                    majors=peer.get_majorticklocs();labels=peer.major.formatter.format_ticks(majors)
                    minors=peer.get_minorticklocs();minorlabels=peer.minor.formatter.format_ticks(minors)
                    drawn=peer._update_ticks();offset=peer.major.formatter.get_offset()
                    expected_major=list(map(float,majors));expected_minor=list(map(float,minors))
                    expected_drawn=[(tick.kind,float(tick.loc),tick.label1.text)for tick in drawn]
                    body=rc_moon(visible,visible)+'''let query_previous=@config.rc_params()
                    defer {
                      try! @config.set_axes_autolimit_mode(query_previous.axes_autolimit_mode())
                      try! @config.set_minor_tick_divisions(query_previous.minor_tick_divisions())
                      try! @config.set_minor_tick_divisions(query_previous.minor_tick_divisions(horizontal=false),horizontal=false)
                      @config.set_formatter_offset_threshold(query_previous.formatter_offset_threshold())
                      try! @config.set_formatter_limits(query_previous.formatter_limits())
                    }
                    @config.set_axes_autolimit_mode("data")
                    @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
                    @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"),horizontal=false)
                    @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
                    @config.set_formatter_limits([@bigint.BigInt::from_int(-5),@bigint.BigInt::from_int(6)])
                    '''
                    body+='let value=axis(horizontal='+moon(horizontal)+')\n'
                    if kind=='date':
                        body+='value.set_date_format("%Y")\nlet date_before=value.date_format()\nlet zone_before=value.date_timezone()\n'
                    else:
                        body+='value.set_categories(["retained-a","retained-b"])\nlet category_before=value.category.unwrap()\n'
                    body+='value.set_scale(@scale.Scale::Linear)\n'+state_assert(peer)
                    if kind=='date':body+='assert_eq(value.date_format(),date_before)\nmatch (value.date_timezone(),zone_before) {\n(None,None) => ()\n(Some(after),Some(before)) => assert_true(physical_equal(after,before))\n_ => abort("timezone identity changed")\n}\n'
                    else:body+='assert_true(physical_equal(value.category.unwrap(),category_before))\n'
                    body+='value.bind_view_interval(() => ('+moon(view[0])+','+moon(view[1])+'))\n'
                    body+='value.set_tick_label_size(10.0)\nvalue.set_tick_layout('+('150.0'if horizontal else'100.0')+','+moon(horizontal)+')\n'
                    body+='assert_eq(value.get_tick_space(),5.0)\nlet bounds=@core.limits('+moon(view[0])+','+moon(view[1])+')\n'
                    body+='let majors=value.tick_values_checked(bounds)\nlet labels=value.tick_labels_checked(majors,view=bounds)\n'
                    body+='let minors=value.minor_tick_values_checked(bounds)\nlet minor_labels=value.minor_tick_labels_checked(minors,view=bounds)\n'
                    body+='assert_eq(majors,'+moon(expected_major)+')\nassert_eq(labels,'+moon(list(labels))+')\n'
                    body+='assert_eq(minors,'+moon(expected_minor)+')\nassert_eq(minor_labels,'+moon(list(minorlabels))+')\n'
                    body+='assert_eq(value.formatter_offset_label_checked(majors,view=bounds),'+moon(offset)+')\n'
                    body+='assert_eq(value.tick_values(bounds),majors)\nassert_eq(value.tick_labels_with_view(majors,Some(bounds)),labels)\n'
                    body+='assert_eq(value.minor_tick_values(bounds),minors)\nassert_eq(value.minor_tick_labels(minors,view=bounds),minor_labels)\n'
                    body+='assert_eq(value.formatter_offset_label_with_view(majors,Some(bounds)),'+moon(offset)+')\n'
                    body+='let observed : Array[(String,Double,String)]=[]\nfor i,loc in majors { observed.push(("major",loc,labels[i])) }\n'
                    body+='for i,loc in minors { observed.push(("minor",loc,minor_labels[i])) }\n'
                    body+='assert_eq(observed,['+','.join('('+moon(k)+','+moon(v)+','+moon(s)+')'for k,v,s in expected_drawn)+'])\n'
                    row={'which':which,'minor_visible':visible,'metadata':kind,'view':list(view),'converter_retained':peer._converter is metadata,
                        'units_retained':peer.units is unit,'metadata_reads':metadata.reads,'classes':describe(peer),'flags':flags(peer),
                        'all_replaced':[u is not v for u,v in zip(old,slots(peer))],'major_ticks':expected_major,'major_labels':list(labels),
                        'minor_ticks':expected_minor,'minor_labels':list(minorlabels),'offset':offset,'drawn':[list(v)for v in expected_drawn],
                        'projection':'real typed set_date_format/set_categories followed by direct Linear scale reinstall; source converter/units are explicit poison host identities'}
                    rows.append((body,row))
    hashes={n.name:hashlib.sha256(ast.get_source_segment(text,n).encode()).hexdigest()for n in methods}
    hashes['_interval_contains_close']=hashlib.sha256(ast.get_source_segment(tt,contains).encode()).hexdigest()
    return rows,hashes


def collect():
    ns,Axis=load(P);cases=[];bodies=[];source_only=[]
    index=next(n for n in ast.parse(P.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='IndexLocator')
    exec(compile(ast.Module(body=[index],type_ignores=[]),str(P),'exec'),ns)
    def add(label,body,**details):
        index=len(cases);cases.append({'id':index,'label':label,**details});bodies.append((label,body))
    # Construction consumes intrinsic axis-name rc immediately, not at first
    # user getter. Scalar/Auto constructor capture stays the accepted profile.
    for which in ['x','y']:
        horizontal=which=='x'
        for x,y in [(False,False),(False,True),(True,False),(True,True)]:
            for classic in [False,True]:
                for tex in [False,True]:
                    locale=not classic;rc_source(ns,x,y,classic,locale,tex);a=Axis(which=which)
                    body=rc_moon(x,y,classic,locale,tex)+'let value=axis(horizontal='+moon(horizontal)+')\n'+state_assert(a)
                    body+='assert_eq(value.tick_horizontal,'+moon(horizontal)+')\n'
                    body+='let scalar=value.named_formatter().unwrap().scalar_formatter().unwrap()\n'
                    body+='assert_eq(scalar.get_use_offset(),'+moon(a.major.formatter.get_useOffset())+')\n'
                    body+='assert_eq(scalar.get_use_locale(),'+moon(a.major.formatter.get_useLocale())+')\n'
                    body+='assert_eq(scalar.get_usetex(),'+moon(a.major.formatter.get_usetex())+')\n'
                    body+='assert_eq(value.locator().unwrap().auto_locator().unwrap().nbins(),'
                    body+=('@ticker.MaxNBins::Count('+str(a.major.locator._nbins)+')'if isinstance(a.major.locator._nbins,int)else'@ticker.MaxNBins::Auto')+')\n'
                    body+='assert_true(physical_equal(value.named_formatter().unwrap().axis().unwrap(),value.formatter_axis_binding()))\n'
                    body+='assert_true(physical_equal(value.minor_named_formatter().unwrap().axis().unwrap(),value.formatter_axis_binding()))\n'
                    body+='assert_true(value.limits() is None)\nassert_true(value.auto_view is None)\nassert_true(!value.inverted())\n'
                    add('finished Axis constructor captures direction-specific defaults and rc',body,which=which,
                        rc={'xvisible':x,'yvisible':y,'classic':classic,'locale':locale,'tex':tex},after=snapshot(a),
                        captured={'use_offset':a.major.formatter.get_useOffset(),'use_locale':a.major.formatter.get_useLocale(),'usetex':a.major.formatter.get_usetex(),'nbins':a.major.locator._nbins})
    # Full four-slot user replacement masks across all five previous geometries.
    # View storage is a typed Axis projection; actual source view is never reset.
    for which in ['x','y']:
        horizontal=which=='x'
        for visible in [False,True]:
            x,y=(visible,not visible)if horizontal else(not visible,visible)
            for profile in PROFILES:
                for mask in range(16):
                    rc_source(ns,x,y);a=Axis(which=which);a._set_scale(profile[0],**profile[1]);custom(ns,a,mask)
                    mode=mask%3;view=[(0.,1.),(.9,.1),(.8,.2)][mode];overlap=bool(mask&1);a.view=view;a.remove_overlapping_locs=overlap
                    old_holder=(a.major,a.minor);old=slots(a);before=snapshot(a);a.clear()
                    replaced=[v is not w for v,w in zip(old,slots(a))]
                    body=rc_moon(x,y)+'let value=axis(horizontal='+moon(horizontal)+')\nvalue.set_scale('+profile[2]+')\n'+custom_moon(mask)
                    if mode==1:body+='value.set_limits(0.9,0.1)\n'
                    elif mode==2:body+='value.set_auto_limits(0.8,0.2)\n'
                    body+='value.set_minor_overlap_removal('+moon(overlap)+')\nlet holder=value.tickers\nlet retained=axis_initial_handles(value)\n'
                    body+='value.clear()\n'+state_assert(a)
                    body+='assert_true(physical_equal(holder,value.tickers))\n'
                    body+='assert_eq(axis_initial_replaced(retained,axis_initial_handles(value)),'+moon(replaced)+')\n'
                    body+='assert_eq(value.view_interval_checked(),('+moon(view[0])+','+moon(view[1])+'))\n'
                    body+='assert_eq(value.inverted(),'+moon(view[0]>view[1])+')\nassert_eq(value.minor_overlap_removal(),'+moon(overlap)+')\n'
                    if mode==1:
                        body+='assert_eq((value.limits().unwrap().lower(),value.limits().unwrap().upper()),(0.9,0.1))\nassert_true(value.auto_view is None)\n'
                    elif mode==2:
                        body+='assert_true(value.limits() is None)\nassert_eq((value.auto_view.unwrap().lower(),value.auto_view.unwrap().upper()),(0.8,0.2))\n'
                    else:body+='assert_true(value.limits() is None)\nassert_true(value.auto_view is None)\n'
                    body+='assert_true(physical_equal(retained.2.axis().unwrap(),value.formatter_axis_binding()))\n'
                    body+='assert_true(physical_equal(retained.3.axis().unwrap(),value.formatter_axis_binding()))\n'
                    add('clear replaces four slots in place and retains view inversion and overlap',body,which=which,
                        rc={'xvisible':x,'yvisible':y},previous=profile[0],custom_mask=mask,view_storage=['automatic','explicit','provisional'][mode],
                        before=before,after=snapshot(a),same_holders=a.major is old_holder[0]and a.minor is old_holder[1],replaced=replaced)
    # Direct Axis clear touches shared ticker holders but not peer geometry.
    # This intentionally excludes the outer Axes peer-scale propagation.
    for which in ['x','y']:
        horizontal=which=='x'
        for visible in [False,True]:
            x,y=(visible,not visible)if horizontal else(not visible,visible)
            for profile in PROFILES:
                rc_source(ns,x,y);a=Axis('clearer',which);a._set_scale(profile[0],**profile[1]);b=Axis('peer',which)
                b.major=a.major;b.minor=a.minor;b._set_scale(profile[0],**profile[1]);old=slots(a);a.clear()
                body=rc_moon(x,y)+'let value=axis(horizontal='+moon(horizontal)+')\nvalue.set_scale('+profile[2]+')\n'
                body+='let peer=axis(horizontal='+moon(horizontal)+')\npeer.share_numeric_tickers(value)\npeer.set_scale('+profile[2]+')\n'
                body+='let holder=value.tickers\nlet old_formatter=peer.named_formatter().unwrap()\nvalue.clear()\n'+state_assert(a)+state_assert(b,'peer')
                body+='assert_true(physical_equal(holder,value.tickers))\nassert_true(physical_equal(holder,peer.tickers))\n'
                body+='assert_true(physical_equal(peer.named_formatter().unwrap(),value.named_formatter().unwrap()))\n'
                body+='assert_true(physical_equal(peer.named_formatter().unwrap().axis().unwrap(),value.formatter_axis_binding()))\n'
                body+='assert_true(physical_equal(old_formatter.axis().unwrap(),peer.formatter_axis_binding()))\n'
                add('single Axis clear preserves shared holder and peer geometry',body,which=which,visible=visible,previous=profile[0],
                    clearer=snapshot(a),peer=snapshot(b),old_owner_is_peer=[v.axis is b for v in old],new_shared_owner_is_clearer=[v.axis is a for v in slots(b)])
    # Replaced handles keep their previous provider and cached location object.
    for which in ['x','y']:
        horizontal=which=='x'
        for profile in PROFILES:
            rc_source(ns,False,True);a=Axis(which=which);a._set_scale(profile[0],**profile[1]);custom(ns,a,12)
            old=slots(a);old[2].set_locs([.125,.875]);cache=old[2]._locs;a.clear();a.view=(.2,.8)
            provider_view=list(old[0].axis.get_view_interval())
            body=rc_moon(False,True)+'let value=axis(horizontal='+moon(horizontal)+')\nvalue.set_scale('+profile[2]+')\n'+custom_moon(12)
            body+='let old_provider=axis_initial_view_provider(value)\nlet old_formatter=value.named_formatter().unwrap()\n'
            body+='let cache=[0.125,0.875]\nold_formatter.set_locs_checked(cache)\nvalue.clear()\nvalue.bind_view_interval(() => (0.2,0.8))\n'
            body+='assert_eq(old_provider(),('+moon(provider_view[0])+','+moon(provider_view[1])+'))\n'
            body+='assert_true(physical_equal(old_formatter.axis().unwrap(),value.formatter_axis_binding()))\n'
            body+='let cached=match old_formatter.locations() { @ticker.FormatterLocations::Sequence(values) => values; _ => abort("old sequence") }\n'
            body+='assert_true(physical_equal(cached,cache))\nassert_eq(cached,'+moon(list(old[2]._locs))+')\n'
            body+='assert_eq(value.named_formatter().unwrap().locations().length(),0)\n'
            add('old locator context and formatter cache survive clear',body,which=which,previous=profile[0],old_view=provider_view,
                old_cache=list(old[2]._locs),same_source_cache=old[2]._locs is cache,new_default_locations=list(a.major.formatter._locs))
    # Index's data provider is a separate stable capability from display view.
    for which in ['x','y']:
        horizontal=which=='x';rc_source(ns,False,False);a=Axis(which=which);old=ns['IndexLocator'](1.,0.);a.set_major_locator(old)
        a.data=(1.,3.);a.clear();a.data=(10.,12.);expected=list(map(float,old()))
        body=rc_moon(False,False)+'let value=axis(horizontal='+moon(horizontal)+')\nlet data=[(1.0,3.0)]\nvalue.bind_data_interval(() => data[0])\n'
        body+='let old=@ticker.IndexLocator::new(base=1.0,offset=0.0)\nvalue.set_locator(old.as_locator())\nvalue.clear()\ndata[0]=(10.0,12.0)\n'
        body+='assert_eq(old.call(),'+moon(expected)+')\n'
        add('old Index data provider remains live after clear',body,which=which,expected=expected,data_after=list(a.data))
    # Converter-specific fields are port-owned projections of the source reset.
    # The original generic units/converter reset is executed, never invented.
    for which in ['x','y']:
        horizontal=which=='x'
        for visible in [False,True]:
            x,y=(visible,not visible)if horizontal else(not visible,visible)
            for kind in ['date','category']:
                rc_source(ns,x,y);a=Axis(which=which);a._converter=object();a.units=kind
                custom(ns,a,15);a.clear()
                body=rc_moon(x,y)+'let value=axis(horizontal='+moon(horizontal)+')\n'
                if kind=='date':
                    body+='value.set_date_formatter(@date.date_formatter("%Y"))\nvalue.set_minor_date_formatter(@date.date_formatter("%m"))\n'
                    body+='value.set_minor_date_locator(@date.day_locator())\n'
                else:body+='value.set_categories(["first","second"])\n'
                body+='value.clear()\n'+state_assert(a)
                body+='assert_true(value.date_format is None)\nassert_true(value.date_locator() is None)\nassert_true(value.date_formatter() is None)\n'
                body+='assert_true(value.minor_date_locator() is None)\nassert_true(value.minor_date_formatter() is None)\nassert_true(value.category is None)\n'
                add('typed converter bookkeeping projection returns to numeric defaults',body,which=which,visible=visible,kind=kind,after=snapshot(a),
                    projection='Moon date/category slots project original units/converter None and replacement of all numeric ticker roles; no generic converter callback claim')
    # Repeated clears preserve holder identity yet keep producing fresh defaults.
    for which in ['x','y']:
        for visible in [False,True]:
            x,y=(visible,not visible)if which=='x'else(not visible,visible);rc_source(ns,x,y);a=Axis(which=which)
            holder=(a.major,a.minor);history=[];body=rc_moon(x,y)+'let value=axis(horizontal='+moon(which=='x')+')\nlet holder=value.tickers\n'
            body+='for _ in 0..<3 {\nlet previous=axis_initial_handles(value)\nvalue.clear()\nassert_true(physical_equal(holder,value.tickers))\n'
            for _ in range(3):
                old=slots(a);a.clear();history.append({'replaced':[u is not v for u,v in zip(old,slots(a))],'state':snapshot(a)})
            body+='assert_eq(axis_initial_replaced(previous,axis_initial_handles(value)),'+moon(history[0]['replaced'])+')\n'+state_assert(a)+'}\n'
            add('repeated clear retains holder while refreshing defaults',body,which=which,visible=visible,history=history,same_holders=a.major is holder[0]and a.minor is holder[1])
    for which in ['x','y']:
        for x,y in [(False,False),(False,True),(True,False),(True,True)]:
            rc_source(ns,x,y);a=Axis(which=which,clear=False)
            source_only.append({'label':'original internal clear=False constructor phase','which':which,'rc':{'xvisible':x,'yvisible':y},
                'slots':[type(v).__name__ for v in slots(a)],'flags':flags(a),'has_scale':hasattr(a,'_scale'),
                'units':a.units,'converter_is_none':a._converter is None,'autoscale':a._autoscale_on,
                'scope':'Axis clear=False is the original internal Axes construction phase; public typed axis() returns finished clear=True defaults'})
    mixed,query_hashes=collect_mixed_metadata_cases()
    for body,details in mixed:add('retained converter metadata does not override installed numeric tickers',body,**details)
    payload={'schema':1,'source_hashes':ns['source_hashes'],'method_hashes':ns['axis_initial_clear_method_hashes'],
        'host_profile':{'original':'complete unchanged Axis.__init__/clear, original overlap property, real Ticker/Scale/factory/default setter bodies and named ticker classes',
            'sinks':'Text/artist presentation, callback registry, explicit context/graph host; view/data supplied independently of the implementation',
            'portable':'finished direction-aware Axis construction; in-place Axis clear preserving view/inversion/overlap and stable context',
            'projection':'explicit/provisional storage and date/category fields are typed projections of the source view preservation and converter reset',
            'outside':'outer Axes/Figure clear, generic converter callbacks and secondary lifecycle have separate references'},
        'cases':cases,'source_only':source_only,'full_query_method_hashes':query_hashes,'source_profile_differences':[],
        'counts':{'portable_cases':len(cases),'registered_groups':math.ceil(len(cases)/32),'source_only':len(source_only)}}
    return payload,bodies


def render(bodies):
    # These are observation helpers only, not the source oracle. Reuse the
    # accepted same-package state/identity observation logic with a local prefix.
    from generate_scale_lifecycle_reference import HELPERS
    code=HELPERS.replace('scripts/generate_scale_lifecycle_reference.py','scripts/generate_axis_initial_clear_reference.py').replace('scale_lifecycle_','axis_initial_')
    for index,(label,body) in enumerate(bodies):
        code+='\n///|\nfn axis_initial_clear_case_'+str(index)+'() -> Unit raise {\n// '+label+'\n'+body+'}\n'
    for group,offset in enumerate(range(0,len(bodies),32)):
        code+='\n///|\ntest "Axis initial clear original group '+str(group)+'" {\n'
        for index in range(offset,min(offset+32,len(bodies))):code+='axis_initial_clear_case_'+str(index)+'()\n'
        code+='}\n'
    return formatted(code)


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    payload,bodies=collect();raw=json.dumps(payload,ensure_ascii=False,indent=2,allow_nan=False)+'\n';test=render(bodies)
    j=ROOT/'testdata/axis_initial_clear_reference.json';t=ROOT/'scene/axis/axis_initial_clear_reference_wbtest.mbt'
    if args.check:
        if j.read_text()!=raw:raise SystemExit('Axis initial clear JSON differs')
        if t.read_text()!=test:raise SystemExit('Axis initial clear WB differs')
    else:j.write_text(raw);t.write_text(test)
    print(json.dumps({'cases':len(bodies),'registered':math.ceil(len(bodies)/32),'source_only':len(payload['source_only']),
        'json_sha256':hashlib.sha256(raw.encode()).hexdigest(),'check':args.check}))

if __name__=='__main__':main()
