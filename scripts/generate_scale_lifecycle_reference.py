"""Original Axis explicit numeric-scale lifecycle, with renderer/graph host sinks.

Expected observations execute pinned upstream bodies, never the Moon port. The
current portable surface installs the five geometry profiles; custom ScaleBase
failure injection and constructor/clear/units/secondary details remain explicit
source-only evidence. Run with no argument, or --check after generation.
"""
from pathlib import Path
import argparse, ast, copy, hashlib, json, math, types, warnings
import numpy as np
from generate_scale_defaults_reference import load_scale_defaults, moon
from generate_auto_date_reference import formatted
ROOT=Path(__file__).resolve().parents[1]
P=ROOT/'.moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py'
AXIS_SHA='f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0'
METHODS=('_set_scale','_set_axes_scale','_set_formatter','set_major_formatter','set_minor_formatter',
         'set_major_locator','set_minor_locator','get_scale','get_transform',
         'get_major_locator','get_minor_locator','get_major_formatter','get_minor_formatter',
         '_get_shared_axes','_get_shared_axis','_update_axisinfo','set_units')
FLAGS=('isDefault_majloc','isDefault_minloc','isDefault_majfmt','isDefault_minfmt')

def load(path):
    """Return (namespace, AxisHarness) with original Axis/Ticker method bodies.

    AxisHarness(name='axis',which='x',major=None,minor=None) starts with the
    real linear defaults. Replacing .axes and sharing the original .major/.minor
    containers is supported for independent actual-Grouper integration probes.
    .events is the host event sink; .view/.data/.space supply controlled context.
    """
    path=Path(path);ns=load_scale_defaults(path);ap=path.with_name('axis.py')
    fixed=next(n for n in ast.parse(path.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='FixedLocator')
    exec(compile(ast.Module(body=[fixed],type_ignores=[]),str(path),'exec'),ns)
    data=ap.read_bytes()
    if hashlib.sha256(data).hexdigest()!=AXIS_SHA:raise ValueError('fixed axis.py differs')
    tree=ast.parse(data);original=next(n for n in tree.body if isinstance(n,ast.ClassDef)and n.name=='Axis')
    nodes=[copy.deepcopy(n)for n in original.body if isinstance(n,ast.FunctionDef)and n.name in METHODS+FLAGS]
    cls=ast.ClassDef(name='OriginalScaleLifecycleAxis',bases=[],keywords=[],body=nodes,decorator_list=[])
    ticker=next(n for n in tree.body if isinstance(n,ast.ClassDef)and n.name=='Ticker')
    names=('TickHelper','Locator','Formatter','NullFormatter','FixedFormatter','FuncFormatter','FixedLocator','StrMethodFormatter')
    ns['mticker']=types.SimpleNamespace(**{name:ns[name]for name in names if name in ns})
    # Original factory body and original five-class registration map.
    stree=ast.parse(path.with_name('scale.py').read_bytes())
    factory=next(n for n in stree.body if isinstance(n,ast.FunctionDef)and n.name=='scale_factory')
    ns['_scale_mapping']={ns[name].name:ns[name]for name in ns['_scale_class_names']}
    registry=next(n for n in stree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id=='_scale_has_axis_parameter'for t in n.targets))
    exec(compile(ast.Module(body=[registry],type_ignores=[]),str(path.with_name('scale.py')),'exec'),ns)
    exec(compile(ast.Module(body=[factory],type_ignores=[]),str(path.with_name('scale.py')),'exec'),ns)
    ns['mscale'].scale_factory=ns['scale_factory']
    exec(compile(ast.fix_missing_locations(ast.Module(body=[ticker,cls],type_ignores=[])),str(ap),'exec'),ns)
    parent=ns['OriginalScaleLifecycleAxis']
    class AxisHarness(parent):
        def __init__(self,name='axis',which='x',major=None,minor=None):
            self.name=name;self.axis_name=which;self.events=[]
            self.major=ns['Ticker']()if major is None else major
            self.minor=ns['Ticker']()if minor is None else minor
            self.view=(1.,100.);self.data=(1.,100.);self.space=5;self.minpos=.001
            self.axes=types.SimpleNamespace(name=name,label=name,_axis_names=['x','y'],_axis_map={which:self},
                autoscale_view=lambda **kw:self.events.append(['autoscale',kw]),_update_transScale=lambda:self.events.append('transform'))
            self._converter=None;self.units=None;self.isDefault_label=True;self.stale=False
            self._set_scale('linear')
        def _get_axis_name(self):return self.axis_name
        def get_view_interval(self):return self.view
        def get_data_interval(self):return self.data
        def get_tick_space(self):return self.space
        def get_minpos(self):return self.minpos
        def get_majorticklocs(self):return self.major.locator()
        def get_ticklocs(self,*,minor=False):return self.minor.locator()if minor else self.major.locator()
        def set(self,**props):return ns['_scale_artist_update_props'](self,props,'{cls} has no property {prop_name!r}')
        def pchanged(self):self.events.append('pchanged')
        def set_default_intervals(self):self.events.append('default_intervals')
        def set_label_text(self,value):self.isDefault_label=False;self.events.append(['label',value])
        def _get_shared_axes(self):
            if hasattr(self.axes,'_shared_axes'):return super()._get_shared_axes()
            return [self.axes]
    ns['source_hashes']['axis.py']=AXIS_SHA
    ns['scale_lifecycle_source_methods']={n.name:hashlib.sha256(ast.get_source_segment(data.decode(),n).encode()).hexdigest()
        for n in original.body if isinstance(n,ast.FunctionDef)and n.name in METHODS+FLAGS}
    return ns,AxisHarness

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    payload,bodies=collect();jpath=ROOT/'testdata/scale_lifecycle_reference.json';tpath=ROOT/'scene/axis/scale_lifecycle_reference_wbtest.mbt'
    raw=json.dumps(payload,indent=2,ensure_ascii=False,allow_nan=False)+'\n';test=render(bodies)
    if args.check:
        if jpath.read_text()!=raw:raise SystemExit('scale lifecycle JSON differs')
        if tpath.read_text()!=test:raise SystemExit('scale lifecycle WB differs')
    else:jpath.write_text(raw);tpath.write_text(test)
    print(json.dumps({'cases':len(payload['cases']),'source_only':len(payload['source_only']),'registered':math.ceil(len(bodies)/32),
        'json_sha256':hashlib.sha256(raw.encode()).hexdigest(),'check':args.check}))


PROFILES=(('linear',{},'@scale.Scale::Linear'),('log',{},'@scale.Scale::Log'),
 ('symlog',{'linthresh':2.,'linscale':1.,'base':10.},'@scale.Scale::SymLog(linthresh=2.0,linscale=1.0,base=10.0)'),
 ('asinh',{'linear_width':1.},'@scale.Scale::Asinh(linear_width=1.0)'),
 ('logit',{'nonpositive':'mask'},'@scale.Scale::Logit(clip=false)'))

def slots(a):return [a.major.locator,a.minor.locator,a.major.formatter,a.minor.formatter]
def flags(a):return [bool(getattr(a,key))for key in FLAGS]
def describe(a):return [a.get_scale()]+[type(v).__name__ for v in slots(a)]
def state(a):return {'classes':describe(a),'flags':flags(a),'owners':[getattr(v,'axis',None)is a for v in slots(a)],'view':list(a.view)}
def setup_moon(profile):return 'let value=axis()\nvalue.set_scale('+profile[2]+')\n'
def assertion(a):
    return 'assert_eq(scale_lifecycle_state(value),'+moon(describe(a))+')\nassert_eq(scale_lifecycle_flags(value),'+moon(flags(a))+')\n'
def custom(ns,a,mask):
    values=[ns['FixedLocator']([-3.,2.]),ns['FixedLocator']([-.5,1.5]),ns['NullFormatter'](),ns['NullFormatter']()]
    names=('set_major_locator','set_minor_locator','set_major_formatter','set_minor_formatter')
    for index,name in enumerate(names):
        if mask&(1<<index):getattr(a,name)(values[index])
    return values

def custom_moon(mask):
    lines=['value.set_locator(@ticker.FixedLocator::new([-3.0,2.0]).as_locator())',
     'value.set_minor_locator(@ticker.FixedLocator::new([-0.5,1.5]).as_minor_locator())',
     'value.set_named_formatter(@ticker.NullFormatter::new().as_base_formatter())',
     'value.set_minor_named_formatter(@ticker.NullFormatter::new().as_base_formatter())']
    return '\n'.join(s for i,s in enumerate(lines)if mask&(1<<i))+'\n'

def collect():
    ns,Axis=load(P);rows=[];bodies=[];source_only=[]
    ns['mpl'].rcParams['xtick.minor.visible']=False;ns['mpl'].rcParams['ytick.minor.visible']=False
    def add(label,body,**observation):
        index=len(rows);rows.append({'id':index,'label':label,**observation});bodies.append((label,body))
    # Every independently user-installed slot changes exactly its own flag.
    # The same-scale call replaces all four objects, even when mask is zero.
    for profile in PROFILES:
        for mask in range(16):
            a=Axis();a._set_scale(profile[0],**profile[1]);old=slots(a);custom(ns,a,mask)
            before=state(a);retained=slots(a)
            body=setup_moon(profile)+custom_moon(mask)+assertion(a)
            body+='let retained=scale_lifecycle_handles(value)\n'
            a._set_scale(profile[0],**profile[1]);after=state(a)
            replaced=[x is not y for x,y in zip(retained,slots(a))]
            old_bound=[v.axis is a for v in old+retained]
            body+='value.set_scale('+profile[2]+')\n'+assertion(a)
            body+='assert_eq(scale_lifecycle_replaced(retained,scale_lifecycle_handles(value)),'+moon(replaced)+')\n'
            body+='assert_true(physical_equal(retained.2.axis().unwrap(),value.formatter_axis_binding()))\n'
            body+='assert_true(physical_equal(retained.3.axis().unwrap(),value.formatter_axis_binding()))\n'
            add('repeat same geometry resets independent user slots',body,profile=profile[0],custom_mask=mask,
                before=before,after=after,replaced=replaced,old_handles_keep_axis=old_bound)
    # Full directed transition matrix, preserving descending and invalid-for-new-
    # scale view endpoints: installation itself does not perform limit validation.
    for start in PROFILES:
        for finish in PROFILES:
            for view in [(9.,1.),(-20.,-1.)]:
                a=Axis();a._set_scale(start[0],**start[1]);a.view=view;custom(ns,a,15)
                old=slots(a);a._set_scale(finish[0],**finish[1])
                body=setup_moon(start)+'value.bind_view_interval(() => '+moon(list(view)).replace('[','(').replace(']',')')+')\n'
                body+=custom_moon(15)+'let retained=scale_lifecycle_handles(value)\nvalue.set_scale('+finish[2]+')\n'+assertion(a)
                body+='assert_eq(value.view_interval_checked(),('+moon(view[0])+','+moon(view[1])+'))\n'
                body+='assert_eq(scale_lifecycle_replaced(retained,scale_lifecycle_handles(value)),'+moon([x is not y for x,y in zip(old,slots(a))])+')\n'
                add('directed scale switch preserves caller view context',body,start=start[0],finish=finish[0],view=list(view),after=state(a))
    # Retaining the old default locator keeps its original live Axis context.
    # This does not rebind discarded handles or transfer ownership.
    for start in PROFILES:
        for finish in PROFILES:
            a=Axis();a._set_scale(start[0],**start[1]);old=slots(a);a.view=(.1,.9);a._set_scale(finish[0],**finish[1]);a.view=(.2,.8)
            context=list(old[0].axis.get_view_interval())
            body=setup_moon(start)+'let old_provider=scale_lifecycle_view_provider(value)\nlet old_formatter=value.named_formatter().unwrap()\n'
            body+='value.set_scale('+finish[2]+')\nvalue.bind_view_interval(() => (0.2,0.8))\n'
            body+='assert_eq(old_provider(),('+moon(context[0])+','+moon(context[1])+'))\n'
            body+='assert_true(physical_equal(old_formatter.axis().unwrap(),value.formatter_axis_binding()))\n'
            body+='assert_true(!physical_equal(old_formatter,value.named_formatter().unwrap()))\n'
            add('discarded locator and formatter retain live original axis context',body,start=start[0],finish=finish[0],old_owner_preserved=all(v.axis is a for v in old),old_locator_view=context)
    # A direct shared Ticker holder is independent of per-Axis scale/context.
    # Scene/Grouper traversal and final-owner order have a separate formal suite.
    for profile in PROFILES:
        for slot in range(4):
            a=Axis('source');a._set_scale(profile[0],**profile[1]);b=Axis('target');b.major=a.major;b.minor=a.minor
            before_owner=[v.axis is a for v in slots(b)];before_geometry=b.get_scale()
            custom(ns,b,1<<slot);after_a=state(a);after_b=state(b)
            body=setup_moon(profile)+'let peer=axis()\npeer.share_numeric_tickers(value)\n'
            body+='assert_true(physical_equal(peer.tickers,value.tickers))\nassert_true(peer.scale().is_nonlinear()==false)\n'
            body+='assert_true(physical_equal(peer.named_formatter().unwrap().axis().unwrap(),value.formatter_axis_binding()))\n'
            body+=custom_moon(1<<slot).replace('value.','peer.')
            body+='assert_eq(scale_lifecycle_flags(value),'+moon(flags(a))+')\nassert_eq(scale_lifecycle_flags(peer),'+moon(flags(b))+')\n'
            body+='assert_eq(scale_lifecycle_state(value),'+moon(describe(a))+')\nassert_eq(scale_lifecycle_state(peer),'+moon(describe(b))+')\n'
            add('share holder without rebind; user setter updates one shared default flag',body,profile=profile[0],slot=slot,
                before_owner_is_source=before_owner,before_peer_geometry=before_geometry,source=after_a,peer=after_b)
    # Existing immutable labels and legacy convenience state are replaced by the
    # real scale default chain. Labels/limits/grid presentation remain local.
    for profile in PROFILES:
        a=Axis();a.set_major_locator(ns['FixedLocator']([-2.,0.,3.]));a.set_major_formatter(ns['FixedFormatter'](['neg','zero','pos']))
        a._set_scale(profile[0],**profile[1])
        body='let value=axis()\nvalue.set_ticks([-2.0,0.0,3.0])\nvalue.set_tick_labels(["neg","zero","pos"])\n'
        body+='value.set_formatter(@ticker.fixed_formatter(["old"]))\nvalue.set_scale('+profile[2]+')\n'+assertion(a)
        body+='assert_true(value.tickers.fixed_ticks is None)\nassert_true(value.tickers.fixed_labels is None)\nassert_true(value.formatter() is None)\n'
        add('scale installer replaces fixed-label and legacy convenience state',body,profile=profile[0],after=state(a))
    # Raw variant can bypass the public finite parameter constructor. A zero base
    # reaches the original LogFormatter constructor (float(0) succeeds); queries,
    # rather than installation, own its deferred mathematical domain errors.
    for base in [0.,1.,-2.,math.nan,math.inf]:
        a=Axis();scale=ns['SymmetricalLogScale'].__new__(ns['SymmetricalLogScale'])
        scale._transform=types.SimpleNamespace(base=base,linthresh=2.);scale.subs=None
        try:a._set_scale(scale);error=None;message=None
        except Exception as e:error=type(e).__name__;message=str(e)
        source_only.append({'label':'manually constructed transform bypasses public geometry validation','base':repr(base),'error':error,'message':message,'state':state(a),
            'scope':'source-only: public typed geometry constructors validate finite base>1; raw enum representation is not a Python Scale constructor'})
    # Source partial failure is non-atomic, but dynamic custom scale/hooks are
    # deliberately outside the current five-geometry typed implementation.
    class Partial(ns['ScaleBase']):
        name='partial'
        def __init__(self,stage):self.stage=stage
        def set_default_locators_and_formatters(self,axis):
            axis.set_major_locator(ns['FixedLocator']([1.,2.]))
            if self.stage==1:raise ValueError('after major locator')
            axis.set_major_formatter(ns['NullFormatter']())
            if self.stage==2:raise ValueError('after major formatter')
            axis.set_minor_formatter(ns['NullFormatter']())
            if self.stage==3:raise ValueError('after minor formatter')
            axis.set_minor_locator(ns['NullLocator']())
            if self.stage==4:raise ValueError('after minor locator')
    for stage in range(1,5):
        a=Axis();before=state(a)
        try:a._set_scale(Partial(stage));error=None;message=None
        except Exception as e:error=type(e).__name__;message=str(e)
        source_only.append({'label':'custom scale late failure preserves assigned scale and partial tickers','stage':stage,'before':before,'after':state(a),'error':error,'message':message,
            'scope':'source-only dynamic ScaleBase subclass; not an error produced by current valid typed geometry'})
    for name,kw in [('log',{'base':1.}),('asinh',{'linear_width':0.}),('symlog',{'linthresh':0.})]:
        a=Axis();before=a._scale;before_slots=slots(a)
        try:a._set_scale(name,**kw);error=None;message=None
        except Exception as e:error=type(e).__name__;message=str(e)
        source_only.append({'label':'factory validation fails before assigning scale','scale':name,'kwargs':kw,'error':error,'message':message,
            'old_scale_retained':a._scale is before,'old_slots_retained':[x is y for x,y in zip(before_slots,slots(a))],
            'scope':'source factory error before assignment; current Moon geometry constructors validate separately'})
    payload={'schema':1,'source_hashes':ns['source_hashes'],'method_hashes':ns['scale_lifecycle_source_methods'],
        'host_profile':{'original':'complete upstream Ticker, selected complete Axis methods, five complete scale classes, actual ticker constructors and API descriptors',
            'sinks':'Axis artist identity/stale/pchanged and explicit view/data/space/minpos; no renderer, no Moon-derived expected observations',
            'portable':'only explicit numeric set_scale for five existing geometry profiles; no constructor/clear/units/secondary lifecycle claim',
            'remaining_readonly_evidence':'53 stages in ignored D35-axis-default-lifecycle-notes.md cover constructor/clear/units/secondary and shared failure; not consumed as an oracle'},
        'cases':rows,'source_only':source_only,'source_profile_differences':[],
        'counts':{'portable_cases':len(rows),'source_only':len(source_only),'registered_groups':math.ceil(len(rows)/32)}}
    return payload,bodies

HELPERS=r'''// Generated by scripts/generate_scale_lifecycle_reference.py from pinned original Axis/Ticker/Scale AST.
///|
fn scale_lifecycle_flags(value : Axis) -> Array[Bool] {
 [value.is_default_locator(),value.is_default_locator(minor=true),value.is_default_formatter(),value.is_default_formatter(minor=true)]
}
///|
fn scale_lifecycle_major(value : @ticker.Locator?) -> String {
 match value {
 Some(@ticker.Locator::NamedAuto(_)) => "AutoLocator"
 Some(@ticker.Locator::NamedLog(_)) => "LogLocator"
 Some(@ticker.Locator::NamedSymLog(_)) => "SymmetricalLogLocator"
 Some(@ticker.Locator::NamedAsinh(_)) => "AsinhLocator"
 Some(@ticker.Locator::NamedLogit(_)) => "LogitLocator"
 Some(@ticker.Locator::NamedFixed(_)) => "FixedLocator"
 _ => "unexpected major locator"
 }
}
///|
fn scale_lifecycle_minor(value : @ticker.MinorLocator?) -> String {
 match value {
 Some(@ticker.MinorLocator::Null(_)) => "NullLocator"
 Some(@ticker.MinorLocator::NamedAutoMinor(_)) => "AutoMinorLocator"
 Some(@ticker.MinorLocator::NamedLog(_)) => "LogLocator"
 Some(@ticker.MinorLocator::NamedSymLog(_)) => "SymmetricalLogLocator"
 Some(@ticker.MinorLocator::NamedAsinh(_)) => "AsinhLocator"
 Some(@ticker.MinorLocator::NamedLogit(_)) => "LogitLocator"
 Some(@ticker.MinorLocator::NamedFixed(_)) => "FixedLocator"
 _ => "unexpected minor locator"
 }
}
///|
fn scale_lifecycle_formatter(value : @ticker.BaseFormatter?) -> String {
 match value {
 Some(value) => if value.scalar_formatter() is Some(_) { "ScalarFormatter" }
 else if value.null_formatter() is Some(_) { "NullFormatter" }
 else if value.log_formatter_sci_notation() is Some(_) { "LogFormatterSciNotation" }
 else if value.logit_formatter() is Some(_) { "LogitFormatter" }
 else { "unexpected formatter" }
 None => "missing formatter"
 }
}
///|
fn scale_lifecycle_state(value : Axis) -> Array[String] {
 let geometry = match value.scale() {
 @scale.Scale::Linear => "linear"
 @scale.Scale::Log => "log"
 @scale.Scale::SymLog(..) => "symlog"
 @scale.Scale::Asinh(..) => "asinh"
 @scale.Scale::Logit(..) => "logit"
 }
 [geometry,scale_lifecycle_major(value.locator()),scale_lifecycle_minor(value.minor_locator()),scale_lifecycle_formatter(value.named_formatter()),scale_lifecycle_formatter(value.minor_named_formatter())]
}
///|
fn scale_lifecycle_handles(value : Axis) -> (@ticker.Locator,@ticker.MinorLocator,@ticker.BaseFormatter,@ticker.BaseFormatter) {
 (value.tickers.locator.unwrap(),value.tickers.minor_locator.unwrap(),value.named_formatter().unwrap(),value.minor_named_formatter().unwrap())
}
///|
fn scale_lifecycle_replaced(old : (@ticker.Locator,@ticker.MinorLocator,@ticker.BaseFormatter,@ticker.BaseFormatter), current : (@ticker.Locator,@ticker.MinorLocator,@ticker.BaseFormatter,@ticker.BaseFormatter)) -> Array[Bool] {
 // Each enum wraps a fresh named reference object; inspect that object rather than adapter allocation.
 let major = match (old.0,current.0) {
 (@ticker.Locator::NamedAuto(a),@ticker.Locator::NamedAuto(b)) => !physical_equal(a,b)
 (@ticker.Locator::NamedLog(a),@ticker.Locator::NamedLog(b)) => !physical_equal(a,b)
 (@ticker.Locator::NamedSymLog(a),@ticker.Locator::NamedSymLog(b)) => !physical_equal(a,b)
 (@ticker.Locator::NamedAsinh(a),@ticker.Locator::NamedAsinh(b)) => !physical_equal(a,b)
 (@ticker.Locator::NamedLogit(a),@ticker.Locator::NamedLogit(b)) => !physical_equal(a,b)
 _ => true
 }
 let minor = match (old.1,current.1) {
 (@ticker.MinorLocator::Null(a),@ticker.MinorLocator::Null(b)) => !physical_equal(a,b)
 (@ticker.MinorLocator::NamedAutoMinor(a),@ticker.MinorLocator::NamedAutoMinor(b)) => !physical_equal(a,b)
 (@ticker.MinorLocator::NamedLog(a),@ticker.MinorLocator::NamedLog(b)) => !physical_equal(a,b)
 (@ticker.MinorLocator::NamedSymLog(a),@ticker.MinorLocator::NamedSymLog(b)) => !physical_equal(a,b)
 (@ticker.MinorLocator::NamedAsinh(a),@ticker.MinorLocator::NamedAsinh(b)) => !physical_equal(a,b)
 (@ticker.MinorLocator::NamedLogit(a),@ticker.MinorLocator::NamedLogit(b)) => !physical_equal(a,b)
 _ => true
 }
 [major,minor,!physical_equal(old.2,current.2),!physical_equal(old.3,current.3)]
}
///|
fn scale_lifecycle_view_provider(value : Axis) -> (() -> (Double,Double) raise @core.DataError) {
 match value.locator().unwrap() {
 @ticker.Locator::NamedAuto(v) => v.view_interval_provider().unwrap()
 @ticker.Locator::NamedLog(v) => v.view_interval_provider().unwrap()
 @ticker.Locator::NamedSymLog(v) => v.view_interval_provider().unwrap()
 @ticker.Locator::NamedAsinh(v) => v.view_interval_provider().unwrap()
 @ticker.Locator::NamedLogit(v) => v.view_interval_provider().unwrap()
 _ => abort("named default locator expected")
 }
}
'''

def render(bodies):
    code=HELPERS
    for index,(label,body) in enumerate(bodies):
        code+='\n///|\nfn scale_lifecycle_case_'+str(index)+'() -> Unit raise {\n'
        code+='// '+label+'\nlet previous_x=@config.minor_ticks_visible()\nlet previous_y=@config.minor_ticks_visible(horizontal=false)\n'
        code+='defer { @config.set_minor_ticks_visible(previous_x); @config.set_minor_ticks_visible(previous_y,horizontal=false) }\n'
        code+='@config.set_minor_ticks_visible(false)\n@config.set_minor_ticks_visible(false,horizontal=false)\n'+body+'}\n'
    for group,offset in enumerate(range(0,len(bodies),32)):
        code+='\n///|\ntest "scale lifecycle original group '+str(group)+'" {\n'
        for index in range(offset,min(offset+32,len(bodies))):code+='scale_lifecycle_case_'+str(index)+'()\n'
        code+='}\n'
    return formatted(code)

if __name__=='__main__':main()
