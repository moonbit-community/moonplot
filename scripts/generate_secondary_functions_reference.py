"""Pinned complete original SecondaryAxis control-function reference.

The accepted D40 loader supplies numeric graphical construction/storage and a
super.draw presentation sink. Complete original Secondary/Axis/Scale methods
and actual original transforms/autoscale execute; no port function is an oracle.
"""
from pathlib import Path
import sys,json,warnings,copy,argparse,hashlib
import numpy as np
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'scripts'))
import generate_secondary_lifecycle_reference as ref
host=ref.load_secondary_source();ns=host['namespace'];tr=host['transforms']
Figure,Axes,Secondary=(host[k] for k in ['Figure','Axes','Secondary'])
for orientation in ['x','y']:ns['mpl'].rcParams._set(orientation+'tick.minor.visible',False)
rows=[]

def old_pair():return (lambda v:2*v,lambda v:v/2)
def new_pair():return (lambda v:v*v,lambda v:np.sqrt(v))
def fresh(orientation='x'):
    fig=Figure();parent=Axes(fig,[0.,0.,1.,1.],index=0)
    fig.created.append(parent);fig.active.append(parent)
    getattr(parent,'set_'+orientation+'lim')((1.,4.))
    return fig,parent

def capture(function):
    try:return {'value':function(),'error':None}
    except Exception as error:return {'value':None,'error':{'type':type(error).__name__,'message':str(error)}}

def clean(value):
    if isinstance(value,np.ndarray):return [clean(v) for v in value.tolist()]
    if isinstance(value,np.generic):return clean(value.item())
    if isinstance(value,float) and not np.isfinite(value):return 'nan' if np.isnan(value) else ('inf' if value>0 else '-inf')
    if isinstance(value,dict):return {str(k):clean(v) for k,v in value.items()}
    if isinstance(value,(list,tuple)):return [clean(v) for v in value]
    return value

def handles(child):
    axis=child._axis
    return [axis.major.locator,axis.minor.locator,axis.major.formatter,axis.minor.formatter]

def baseline(child):
    return {'handles':handles(child),'transform':child._axis.get_transform(),'pair':child._functions}

def snapshot(child,before=None):
    result={'published_functions_type':type(child._functions).__name__,
            'parent_cache':getattr(child,'_parentscale',None),'ticks_set':getattr(child,'_ticks_set',None),
            'location_assigned':hasattr(child,'_loc'),'orientation':child._orientation}
    if hasattr(child,'_axis'):
        axis=child._axis;transform=axis.get_transform()
        result.update(own_view=getattr(child._viewLim,'interval'+child._orientation).tolist(),
            scale=axis.get_scale(),classes=[type(v).__name__ for v in handles(child)],
            default_flags=[getattr(axis,k) for k in ['isDefault_majloc','isDefault_minloc','isDefault_majfmt','isDefault_minfmt']],
            current_fixed_values=axis.major.locator.locs.tolist() if isinstance(axis.major.locator,ns['FixedLocator']) else None,
            current_fixed_dtype=str(axis.major.locator.locs.dtype) if isinstance(axis.major.locator,ns['FixedLocator']) else None,
            installed_transform_9=capture(lambda:transform.transform(np.array([9.])).tolist()))
        if before:
            result['same_handles']=[v is w for v,w in zip(before['handles'],handles(child))]
            result['same_installed_transform']=transform is before['transform']
            result['same_functions_tuple']=child._functions is before['pair']
            if isinstance(child._functions,tuple) and len(child._functions)==2:
                result['same_function_components']=[v is w for v,w in zip(before['pair'],child._functions)]
    if isinstance(child._functions,tuple) and len(child._functions)==2 and all(callable(v) for v in child._functions):
        result['forward_1_4']=capture(lambda:child._functions[0](np.array([1.,4.])).tolist())
        result['inverse_1_4']=capture(lambda:child._functions[1](np.array([1.,4.])).tolist())
    return clean(result)

def record(label,fig,child,operation,before=None,typed=True,extra=None):
    fig.events.clear()
    with warnings.catch_warnings(record=True) as seen,np.errstate(all='ignore'):
        warnings.simplefilter('always')
        result=capture(operation)
    events=copy.deepcopy(fig.events)
    row={'label':label,'typed_pair_or_reset_profile':typed,'operation_error':result['error'],
         'operation_events':events,'operation_warnings':[{'category':type(w.message).__name__,'message':str(w.message)} for w in seen],
         'state':snapshot(child,before)}
    if extra:row.update(extra())
    rows.append(clean(row))

def child_for(orientation='x'):
    fig,parent=fresh(orientation)
    child=Secondary(parent,orientation,'top' if orientation=='x' else 'right',old_pair())
    return fig,parent,child

def install_parent_name(parent,orientation,name):
    getattr(parent,'set_'+orientation+'scale')(name,**({'linthresh':2.} if name=='symlog' else {}))
    getattr(parent,'set_'+orientation+'lim')((1.,4.))


def collect_parameters():
    rows.clear()
    # Constructors: original None, tuple and a real original FuncTransform.
    for orientation in ['x','y']:
        for kind in ['pair','None','FuncTransform']:
            fig,parent=fresh(orientation)
            functions=old_pair() if kind=='pair' else None if kind=='None' else ns['FuncTransform'](lambda v:3*v,lambda v:v/3)
            child=Secondary.__new__(Secondary)
            record('constructor '+orientation+'/'+kind,fig,child,
                lambda:Secondary.__init__(child,parent,orientation,'top' if orientation=='x' else 'right',functions),
                typed=kind!='FuncTransform')

    invalids=[('list of two callables',lambda:list(old_pair())),('empty tuple',lambda:()),('length1 tuple',lambda:(lambda v:v,)),('length3 tuple',lambda:(lambda v:v,lambda v:v,lambda v:v)),('noncallable second',lambda:(lambda v:v,3))]
    for label,builder in invalids:
        fig,parent=fresh();child=Secondary.__new__(Secondary);functions=builder()
        record('constructor invalid '+label,fig,child,
            lambda:Secondary.__init__(child,parent,'x','top',functions),typed=False)

    # isinstance(Transform) accepts dimensions/invertibility without eager checking.
    for kind,functions in [('Affine2D',tr['Affine2D']().scale(2.,3.)),('base Transform',tr['Transform']())]:
        fig,parent=fresh();child=Secondary.__new__(Secondary)
        record('constructor Transform acceptance '+kind,fig,child,
            lambda:Secondary.__init__(child,parent,'x','top',functions),typed=False)

    for label,builder in invalids:
        fig,parent,child=child_for();before=baseline(child)
        record('setter invalid '+label,fig,child,lambda:child.set_functions(builder()),before,typed=False)

    for orientation in ['x','y']:
        for kind,functions in [('pair',new_pair()),('None',None)]:
            fig,parent,child=child_for(orientation);before=baseline(child)
            record('same name '+orientation+'/'+kind,fig,child,lambda:child.set_functions(functions),before)

    for orientation in ['x','y']:
        for family,reset in [('symlog',False),('log',False),('symlog',True)]:
            fig,parent,child=child_for(orientation);before=baseline(child)
            install_parent_name(parent,orientation,family)
            functions=None if reset else new_pair()
            record('changed name '+orientation+'/'+family+('/None' if reset else '/pair'),fig,child,
                lambda:child.set_functions(functions),before)

    # Latched ticks are the CURRENT locator output, including exact dtype/view alias.
    for orientation in ['x','y']:
        fig,parent,child=child_for(orientation)
        child.set_ticks([2.,3.])
        owner=np.array([1,4,7,9],dtype=np.int64);view=owner[1:3]
        previous=ns['FixedLocator'](view);child._axis.set_major_locator(previous)
        before=baseline(child);install_parent_name(parent,orientation,'log')
        record('latch CURRENT Int64 view '+orientation,fig,child,lambda:child.set_functions(new_pair()),before,
            extra=lambda:{'restored_locs_same_view':child._axis.major.locator.locs is view,
                          'old_locator_still_bound':previous.axis is child._axis,
                          'owner_before_mutation':owner.tolist()})
        child._axis.major.locator.locs[0]=6
        rows[-1].update(owner_after_mutation=owner.tolist(),old_locator_after_mutation=previous.locs.tolist())

    # First late failure: query CURRENT locator before any new child context/default.
    for orientation in ['x','y']:
        for reset in [False,True]:
            fig,parent,child=child_for(orientation)
            child.set_ticks([0.,1.]);child._axis.set_major_locator(ns['LogLocator']())
            before=baseline(child);install_parent_name(parent,orientation,'log')
            functions=None if reset else new_pair()
            record('CURRENT locator failure '+orientation+('/None' if reset else '/pair'),fig,child,
                lambda:child.set_functions(functions),before)

    # New defaults normalize NaN margin candidates; this is a successful fallback.
    for orientation in ['x','y']:
        fig,parent,child=child_for(orientation);before=baseline(child)
        install_parent_name(parent,orientation,'log')
        functions=(lambda v:np.full_like(v,np.nan),lambda v:v)
        record('post-install NaN forward fallback success '+orientation,fig,child,
            lambda:child.set_functions(functions),before)

    # Same-name does not consume invalid numeric functions; later aspect does.
    for orientation in ['x','y']:
        fig,parent,child=child_for(orientation);before=baseline(child)
        functions=(lambda v:np.full_like(v,np.nan),lambda v:v)
        record('same-name accepts NaN function '+orientation,fig,child,lambda:child.set_functions(functions),before)
        record('later aspect rejects NaN function '+orientation,fig,child,child.apply_aspect,before)

    return copy.deepcopy(rows)


def collect_nonlinear():
    """C's six actual-transData stages, with extra original transform endpoints."""
    fig,parent=fresh('x')
    child=Secondary(parent,'x','top',old_pair())
    child.apply_aspect()
    initial_transform=child._axis.get_transform()
    observations=[]
    def take(label,value=4.):
        transform=child._axis.get_transform();view=child._axis.get_view_interval()
        observations.append(clean({'label':label,'own_view':view.tolist(),'parentscale_cache':child._parentscale,
            'same_initial_transform':transform is initial_transform,
            'forward_parent_endpoints':child._functions[0](np.array(parent.get_xlim())).tolist(),
            'installed_transform_value':float(transform.transform(np.array([value]))[0]),
            'raw_tick':value,'display_x':float(child.transData.transform([[value,0.]])[0,0]),
            'bbox':[float(child.bbox.x0),float(child.bbox.width)],
            'installed_transform_view_endpoints':transform.transform(view).tolist()}))
    take('initial applied affine pair')
    child.set_functions(new_pair())
    take('same-name setter changes functions only')
    child.apply_aspect()
    take('aspect maps new endpoints while retaining old installed transform')
    child.draw(None)
    take('same-name draw still retains old installed transform')
    parent.set_xscale('symlog',linthresh=2.)
    child.draw(None)
    take('changed nonlog parent name installs new nonlinear pair')
    child.set_functions(None)
    child.apply_aspect()
    take('None restores identity limit functions but keeps prior transform',2.25)
    return observations


from generate_scale_defaults_reference import moon
from generate_auto_date_reference import formatted

HEADER=ref.HEADER.replace('pinned complete Secondary/numeric lifecycle','pinned complete Secondary control-function').replace('secondary_source_', 'secondary_functions_source_')


def number(value):
    if isinstance(value,str) and value in ['nan','inf','-inf']:
        return {'nan':'(0.0 / 0.0)','inf':'(1.0 / 0.0)','-inf':'(-1.0 / 0.0)'}[value]
    return moon(value)


def array(values):
    return '['+', '.join(number(v) for v in values)+']'


def setup(orientation,identity=False):
    lines=['let previous = @config.rc_params()', 'defer {',
        '@config.set_minor_ticks_visible(previous.minor_ticks_visible())',
        '@config.set_minor_ticks_visible(previous.minor_ticks_visible(horizontal=false), horizontal=false)',
        '@config.set_classic_mode(previous.classic_mode())',
        'try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())',
        'try! @config.set_x_margin(previous.x_margin())','try! @config.set_y_margin(previous.y_margin())','}',
        '@config.set_minor_ticks_visible(false)','@config.set_minor_ticks_visible(false, horizontal=false)',
        '@config.set_classic_mode(false)','@config.set_axes_autolimit_mode("data")',
        '@config.set_x_margin(0.05)','@config.set_y_margin(0.05)',
        'let fig = figure(width=320, height=240)',
        'let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)',
        'parent.set_'+orientation+'lim(1.0, 4.0)']
    forward='value => value' if identity else 'value => 2.0 * value'
    inverse='value => value' if identity else 'value => value / 2.0'
    lines+=['let child = parent.secondary_'+orientation+'axis('+forward+', '+inverse+')']
    return lines


def controls(state):
    lines=['let forward = child.forward()','let inverse = child.inverse()',
        'secondary_functions_source_numbers([forward(1.0), forward(4.0)], '+array(state['forward_1_4']['value'])+')',
        'secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], '+array(state['inverse_1_4']['value'])+')']
    return lines


def assert_state(row):
    state=row['state'];orientation=state['orientation']
    lines=['assert_eq(child.parent_scale_name, Some('+moon(state['parent_cache'])+'))',
        'assert_eq(child.numeric_axis.coordinate_scale_name(), '+moon(state['scale'])+')',
        'let view = child.numeric_axis.stored_view_limits()',
        'secondary_functions_source_numbers([view.lower(), view.upper()], '+array(state['own_view'])+')',
        'assert_eq(child.ticks_set, '+moon(state['ticks_set'])+')',
        'assert_true(child.location() is SecondaryAxisLocation::'+('Top' if orientation=='x' else 'Right')+')',
        'assert_eq([secondary_functions_source_major_class(child.locator().unwrap()), secondary_functions_source_minor_class(child.minor_locator().unwrap()), secondary_functions_source_formatter_class(child.named_formatter().unwrap()), secondary_functions_source_formatter_class(child.minor_named_formatter().unwrap())], '+moon(state['classes'])+')',
        'assert_eq([child.numeric_axis.is_default_locator(), child.numeric_axis.is_default_locator(minor=true), child.numeric_axis.is_default_formatter(), child.numeric_axis.is_default_formatter(minor=true)], '+moon(state['default_flags'])+')',
        'let transform = child.numeric_axis.coordinate_transform()',
        'secondary_functions_source_numbers([transform(9.0)], '+array(state['installed_transform_9']['value'])+')']
    lines+=controls(state)
    if 'same_handles' in state:
        lines+=['assert_eq([secondary_functions_source_same_major(old_major, child.locator().unwrap()), secondary_functions_source_same_minor(old_minor, child.minor_locator().unwrap()), physical_equal(old_major_formatter, child.named_formatter().unwrap()), physical_equal(old_minor_formatter, child.minor_named_formatter().unwrap())], '+moon(state['same_handles'])+')']
    if state.get('current_fixed_values') is not None:
        lines+=['let current_fixed = child.locator().unwrap().fixed_locator().unwrap()',
            'secondary_functions_source_numbers(current_fixed.locations().to_array(), '+array(state['current_fixed_values'])+')']
    # Every formatter keeps the authoritative child binding after a reset/error.
    lines+=['assert_eq(child.named_formatter().unwrap().axis(), Some(child.formatter_axis_binding()))',
        'assert_eq(child.minor_named_formatter().unwrap().axis(), Some(child.formatter_axis_binding()))']
    return lines


def operation_line(label):
    if label.startswith('constructor '):return None
    if label.startswith('later aspect '):return 'child.apply_aspect()'
    if '/None' in label:return 'child.reset_functions()'
    if 'NaN' in label:
        return 'child.set_functions(value => { ignore(value); 0.0 / 0.0 }, value => value)'
    return 'child.set_functions(value => value * value, value => value.sqrt())'


def render_parameter_case(index,row):
    label=row['label'];orientation=row['state']['orientation']
    lines=['///|','fn secondary_functions_source_case_'+str(index)+'() -> Unit raise {']
    lines+=setup(orientation,identity=label.startswith('constructor ') and label.endswith('/None'))
    if label.startswith('latch CURRENT '):
        lines+=['child.set_ticks([2.0, 3.0])','let owner : Array[Int64] = [1L, 4L, 7L, 9L]',
            'let current_view = @ticker.TickValues::from_int64_array(owner).view(1, 1, 2)',
            'let old_fixed = @ticker.FixedLocator::from_view(current_view)',
            'child.set_locator(old_fixed.as_locator())']
    elif label.startswith('CURRENT locator failure '):
        lines+=['child.set_ticks([0.0, 1.0])','child.set_locator(@ticker.LogLocator::new().as_locator())']
    if 'same_handles' in row['state']:
        lines+=['let old_major = child.locator().unwrap()','let old_minor = child.minor_locator().unwrap()',
            'let old_major_formatter = child.named_formatter().unwrap()',
            'let old_minor_formatter = child.minor_named_formatter().unwrap()']
    if label.startswith('changed name '):
        family='log' if '/log/' in label else 'symlog'
        expression='@scale.log_scale()' if family=='log' else '@scale.symlog_scale(linthresh=2.0)'
        lines+=['parent.set_'+orientation+'_scale('+expression+')','parent.set_'+orientation+'lim(1.0, 4.0)']
    elif label.startswith(('latch CURRENT ','CURRENT locator failure ','post-install NaN ')):
        lines+=['parent.set_'+orientation+'_scale(@scale.log_scale())','parent.set_'+orientation+'lim(1.0, 4.0)']
    elif label.startswith('later aspect '):
        lines+=['child.set_functions(value => { ignore(value); 0.0 / 0.0 }, value => value)']
    operation=operation_line(label)
    if operation:
        if row['operation_error']:
            lines+=['// Source native error text is retained in JSON; Core projects its checked variant.',
                'assert_true(try { '+operation+'; false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })']
        else:lines+=[operation]
    lines+=assert_state(row)
    if label.startswith('latch CURRENT '):
        lines+=['assert_true(physical_equal(current_fixed.locations(), current_view))',
            'current_fixed.locations().set(0, 6.0)',
            'assert_eq(owner, ['+', '.join(str(v)+'L' for v in row['owner_after_mutation'])+'])',
            'secondary_functions_source_numbers(old_fixed.locations().to_array(), '+array(row['old_locator_after_mutation'])+')',
            'secondary_functions_source_numbers(old_fixed.values().to_array(), '+array(row['old_locator_after_mutation'])+')']
    lines+=['}']
    return '\n'.join(lines)


def render_nonlinear(index,observations):
    lines=['///|','fn secondary_functions_source_case_'+str(index)+'() -> Unit raise {']+setup('x')
    operations=['child.apply_aspect()',
        'child.set_functions(value => value * value, value => value.sqrt())',
        'child.apply_aspect()','child.prepare_draw()',
        'parent.set_x_scale(@scale.symlog_scale(linthresh=2.0)); child.prepare_draw()',
        'child.reset_functions(); child.apply_aspect()']
    for row,operation in zip(observations,operations):
        lines+=['// '+row['label'],operation,'{','let view = child.numeric_axis.stored_view_limits()',
            'secondary_functions_source_numbers([view.lower(), view.upper()], '+array(row['own_view'])+')',
            'assert_eq(child.parent_scale_name, Some('+moon(row['parentscale_cache'])+'))',
            'let transform = child.numeric_axis.coordinate_transform()',
            'secondary_functions_source_numbers([transform('+number(row['raw_tick'])+')], ['+number(row['installed_transform_value'])+'])',
            'secondary_functions_source_numbers([transform(view.lower()), transform(view.upper())], '+array(row['installed_transform_view_endpoints'])+')',
            'let forward = child.forward()',
            'secondary_functions_source_numbers([forward(1.0), forward(4.0)], '+array(row['forward_parent_endpoints'])+')','}']
    lines+=['}']
    return '\n'.join(lines)


def render(payload):
    typed=[(i,row) for i,row in enumerate(payload['parameter_observations']) if row['typed_pair_or_reset_profile']]
    chunks=[HEADER]+[render_parameter_case(i,row) for i,row in typed]
    last=len(payload['parameter_observations'])
    chunks.append(render_nonlinear(last,payload['nonlinear_observations']))
    cases=[(i,row['label']) for i,row in typed]+[(last,'sequential nonlinear installed-transform lifecycle')]
    for start in range(0,len(cases),32):
        calls=['secondary_functions_source_case_'+str(i)+'() catch { error => fail('+moon('secondary functions source '+str(i)+' ['+label+']: ')+' + error.to_string()) }' for i,label in cases[start:start+32]]
        chunks.append('///|\ntest "original secondary control functions group '+str(start//32)+'" {\n'+'\n'.join(calls)+'\n}')
    return formatted('\n\n'.join(chunks)+'\n')


def collect():
    parameters=collect_parameters();nonlinear=collect_nonlinear()
    typed=sum(row['typed_pair_or_reset_profile'] for row in parameters)
    return {'source_hashes':ref.source_hashes(),'python':sys.version.split()[0],'numpy':np.__version__,
        'scope':'Complete original Secondary class and accepted numeric graphical storage/presentation host; original Axis/Scale/transform/autoscale execute. No full renderer/GUI or arbitrary callable shape/effect parity.',
        'counts':{'parameter_observations':len(parameters),'typed_parameter_observations':typed,
            'source_only_parameter_observations':len(parameters)-typed,'nonlinear_observations':len(nonlinear),
            'typed_scenarios':typed+1,'registered_groups':(typed+32)//32},
        'typed_bridge_boundaries':{
            'functions':'Two nonraising Double callbacks; reset_functions corresponds to source None. Source tuple/Transform/vector identity and invalid dynamic parameter inputs are retained metadata, not typed parity claims.',
            'installed_transform_identity':'Original identity bool retained; typed fixtures verify exact installed numerical mapping at interior and endpoint values, not closure physical identity.',
            'source_errors':'Native Python exception text retained verbatim. Existing Core InvalidTicks checked projection is tested with exact surviving state; native error text equivalence is not claimed.',
            'nan':'Native NaN outputs retained as sentinel; typed NaN classification is asserted without payload parity.',
            'events_and_pixels':'Original trace/pixels retained; generated Scene assertions cover own state and coordinate mapping. C focused render tests cover their separate renderer projection; no generic super.draw renderer parity.'},
        'parameter_observations':parameters,'nonlinear_observations':nonlinear}


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('ticker',nargs='?',type=Path,default=ref.P)
    parser.add_argument('--check',action='store_true')
    args=parser.parse_args();ref.load_secondary_source(args.ticker)
    payload=collect()
    document=json.dumps(clean(payload),ensure_ascii=False,indent=2,allow_nan=False)+'\n'
    outputs={ROOT/'testdata/secondary_functions_reference.json':document,
        ROOT/'scene/secondary_functions_reference_wbtest.mbt':render(payload)}
    for path,content in outputs.items():
        if args.check:
            if not path.exists() or path.read_text()!=content:raise SystemExit('secondary functions reference differs: '+str(path))
        else:path.write_text(content)
    print(json.dumps({'check':args.check,**payload['counts'],'json_sha256':hashlib.sha256(document.encode()).hexdigest()}))


if __name__=='__main__':main()
