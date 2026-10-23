"""Pinned complete original secondary position/alignment and numeric draw stages."""
from pathlib import Path
import json,sys,copy,warnings,math,argparse,hashlib,ast,operator,types
import numpy as np
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_secondary_lifecycle_reference as ref
host=ref.load_secondary_source();Figure,Axes,Secondary=(host[k] for k in ['Figure','Axes','Secondary'])
rows=[]

def clean(value):
    if isinstance(value,np.ndarray):return clean(value.tolist())
    if isinstance(value,np.generic):return clean(value.item())
    if isinstance(value,float) and not math.isfinite(value):return 'nan' if math.isnan(value) else 'inf' if value>0 else '-inf'
    if isinstance(value,dict):return {str(k):clean(v) for k,v in value.items()}
    if isinstance(value,(list,tuple)):return [clean(v) for v in value]
    return value

def capture(fn):
    try:return {'value':clean(fn()),'error':None}
    except Exception as error:return {'value':None,'error':{'type':type(error).__name__,'message':str(error)}}

def parent():
    fig=Figure();axes=Axes(fig,[.2,.2,.4,.6],index=0)
    fig.created.append(axes);fig.active.append(axes)
    axes.set_xlim((10.,20.));axes.set_ylim((30.,40.))
    return fig,axes

def snapshot(child,old=None):
    locator=child.get_axes_locator()
    axis=child._axis
    result={'orientation':child._orientation,'raw_location':getattr(child,'_loc',None),
        'raw_location_type':type(getattr(child,'_loc',None)).__name__,
        'position':getattr(child,'_pos',None),'locstrings':child._locstrings,
        'spine_visible':{side:getattr(spine,'visible',None) for side,spine in child.spines.items()},
        'ticks_position_sink':getattr(axis,'presentation_tick_position',None),
        'label_position_sink':getattr(axis,'presentation_label_position',None),
        'parent_cache':child._parentscale,'scale':axis.get_scale(),
        'own_view':getattr(child._viewLim,'interval'+child._orientation).tolist(),
        'active_position':list(child._position.bounds),'original_position':list(child._originalPosition.bounds),
        'bounds':None if locator is None else locator._bounds,
        'candidate_normalized_position':None if locator is None else capture(lambda:list(locator(child,None).bounds)),
        'classes':[type(x).__name__ for x in [axis.major.locator,axis.minor.locator,axis.major.formatter,axis.minor.formatter]],
        'flags':[getattr(axis,k) for k in ['isDefault_majloc','isDefault_minloc','isDefault_majfmt','isDefault_minfmt']]}
    if old:
        result['same_locator']=locator is old['locator']
        result['same_installed_transform']=axis.get_transform() is old['transform']
        current=[axis.major.locator,axis.minor.locator,axis.major.formatter,axis.minor.formatter]
        result['same_slots']=[a is b for a,b in zip(current,old['slots'])]
    return clean(result)

def baseline(child):
    axis=child._axis
    return {'locator':child.get_axes_locator(),'transform':axis.get_transform(),
        'slots':[axis.major.locator,axis.minor.locator,axis.major.formatter,axis.minor.formatter]}

def observe(label,fig,child,operation,old=None,profile='typed double or named location'):
    fig.events.clear()
    with warnings.catch_warnings(record=True) as seen,np.errstate(all='ignore'):
        warnings.simplefilter('always');result=capture(operation)
        state=snapshot(child,old)
    rows.append({'label':label,'profile':profile,'operation_error':result['error'],
        'events':copy.deepcopy(fig.events),'warnings':[{'category':type(w.message).__name__,'message':str(w.message)} for w in seen],
        'state':state})


def collect_parameters():
    rows.clear()
    for orientation in ['x','y']:
        first,last=('top','bottom') if orientation=='x' else ('right','left')
        locations=[('default named',first),('opposite named',last),('negative outside',-.25),
            ('below half',math.nextafter(.5,-math.inf)),('exact half',.5),('above one',1.25),
            ('NaN',math.nan),('negative infinity',-math.inf),('positive infinity',math.inf)]
        for label,value in locations:
            fig,axes=parent();child=Secondary.__new__(Secondary)
            observe('constructor '+orientation+'/'+label,fig,child,
                lambda:Secondary.__init__(child,axes,orientation,value,None))

    # numbers.Real acceptance does not include every NumPy scalar/container.
    for label,value in [('PythonFalse',False),('PythonTrue',True),('NumPyBool',np.bool_(True))]:
        fig,axes=parent();child=Secondary.__new__(Secondary)
        observe('constructor scalar domain '+label,fig,child,
            lambda:Secondary.__init__(child,axes,'x',value,None),profile='numeric-origin source-only')

    for orientation in ['x','y']:
        fig,axes=parent();child=Secondary.__new__(Secondary)
        wrong='left' if orientation=='x' else 'bottom'
        observe('constructor wrong direction '+orientation,fig,child,
            lambda:Secondary.__init__(child,axes,orientation,wrong,None))

    for orientation in ['x','y']:
        first,last=('top','bottom') if orientation=='x' else ('right','left')
        fig,axes=parent();child=Secondary(axes,orientation,.25,None)
        old=baseline(child)
        observe('setter moves to first but keeps initial low alignment '+orientation,fig,child,
            lambda:child.set_location(first),old)
        old=baseline(child)
        observe('explicit first alignment does not move location '+orientation,fig,child,
            lambda:child.set_alignment(first),old)
        old=baseline(child)
        observe('setter moves to last but keeps explicit high alignment '+orientation,fig,child,
            lambda:child.set_location(last),old)
        old=baseline(child)
        observe('numeric setter keeps explicit high alignment '+orientation,fig,child,
            lambda:child.set_location(.75),old)
        old=baseline(child)
        observe('apply positioned locator only now changes active rectangle '+orientation,fig,child,
            lambda:child.apply_aspect(child.get_axes_locator()(child,None)),old)

    for orientation in ['x','y']:
        fig,axes=parent();child=Secondary(axes,orientation,.25,None)
        wrong='left' if orientation=='x' else 'top'
        for label,operation in [('wrong named location',lambda:child.set_location(wrong)),
            ('None location',lambda:child.set_location(None)),
            ('wrong alignment',lambda:child.set_alignment(wrong)),
            ('numeric alignment',lambda:child.set_alignment(.75))]:
            old=baseline(child)
            observe('failed update '+orientation+'/'+label,fig,child,operation,old,
                profile='typed named error' if label in ['wrong named location','wrong alignment'] else 'dynamic source-only')

    # Nonfinite numeric receipt is separate from later actual locator/aspect geometry.
    fig,axes=parent();child=Secondary(axes,'x','top',None)
    old=baseline(child)
    observe('NaN location setter is accepted before locator evaluation',fig,child,
        lambda:child.set_location(math.nan),old)
    old=baseline(child)
    observe('NaN positioned aspect leaves geometric NaNs not a location validation error',fig,child,
        lambda:child.apply_aspect(child.get_axes_locator()(child,None)),old)

    return copy.deepcopy(rows)


def context(fig,axes):
    bbox=axes.bbox
    return {'figure_size':[float(fig.width),float(fig.height)],
        'parent_bbox_bounds':list(map(float,bbox.bounds)),
        'parent_screen_frame':[float(bbox.x0),float(fig.height-bbox.y1),float(bbox.width),float(bbox.height)]}


def collect_geometry():
    fig=Figure(width=320.,height=240.)
    axes=Axes(fig,[.2,.25,.5,.5],index=0)
    fig.created.append(axes);fig.active.append(axes)
    axes.set_xlim(1.,4.);axes.set_ylim(0.,1.)
    observations=[]
    for orientation in ['x','y']:
        child=Secondary(axes,orientation,.75,(lambda value:value,lambda value:value))
        def take(stage):
            observations.append({'orientation':orientation,'stage':stage,'location':child._loc,'pos':child._pos,
                'locstrings':list(child._locstrings),'tick_side':child._axis.presentation_tick_position,
                'label_side':child._axis.presentation_label_position,
                'visible_spines':[key for key,value in child.spines.items() if getattr(value,'visible',False)],
                'active_bbox':list(map(float,child.bbox.bounds)),
                'own_view':list(map(float,child._axis.get_view_interval()))})
        def positioned():
            locator=child.get_axes_locator()
            child.apply_aspect(locator(child,None) if locator else None)
        take('constructor before locator application')
        positioned();take('positioned at .75')
        child.set_location(.25);take('location assigned .25 before next aspect')
        positioned();take('positioned at .25 with prior alignment')
        child.set_alignment('bottom' if orientation=='x' else 'left')
        take('alignment changed without moving active bbox')
    return context(fig,axes),observations


def collect_full_draw():
    """Complete original _AxesBase.draw with empty graphical artist sinks."""
    namespace=host['namespace'];base_path=ref.P.parent/'axes/_base.py'
    body=next(node for node in ast.parse(base_path.read_bytes()).body if isinstance(node,ast.ClassDef) and node.name=='_AxesBase')
    original_node=next(node for node in body.body if isinstance(node,ast.FunctionDef) and node.name=='draw')
    draw_node=copy.deepcopy(original_node);draw_node.decorator_list=[]
    old_draw_global=namespace.get('draw');old_image=namespace.get('mimage');old_attrgetter=namespace.get('attrgetter')
    exec(compile(ast.fix_missing_locations(ast.Module(body=[draw_node],type_ignores=[])),str(base_path),'exec'),namespace)
    actual_draw=namespace['draw'];numeric_base=Secondary.__mro__[1];old_draw=numeric_base.draw
    recording=[];observations=[]
    class Renderer:
        def open_group(self,*args,**kwargs):recording.append(['open_group'])
        def close_group(self,*args,**kwargs):recording.append(['close_group'])
    def draw_empty(renderer,axis,artists,suppress):
        assert artists==[]
        recording.append(['composite',list(map(float,axis._axis.get_view_interval()))])
    namespace['attrgetter']=operator.attrgetter
    namespace['mimage']=types.SimpleNamespace(_draw_list_compositing_images=draw_empty)
    numeric_base.draw=actual_draw
    try:
        for orientation in ['x','y']:
            fig=Figure();fig.canvas=types.SimpleNamespace(is_saving=lambda:True);fig.suppressComposite=False
            axes=Axes(fig,[.2,.25,.5,.5],index=0);fig.created.append(axes);fig.active.append(axes)
            (axes.set_xlim if orientation=='x' else axes.set_ylim)(1.,2.)
            child=Secondary(axes,orientation,'top' if orientation=='x' else 'right',(lambda value:0*value+4,lambda value:0*value+1))
            child._axis.set_major_locator(namespace['FixedLocator']([2.,3.]))
            (axes.set_xscale if orientation=='x' else axes.set_yscale)('log')
            child.get_visible=lambda:True;child.get_gid=lambda:None
            child.axison=False;child._frameon=False;child._rasterization_zorder=None
            child.patch=object()
            child.get_children=lambda:[child.patch,*child.spines.values(),*child._axis_map.values()]
            child._update_title_position=lambda renderer:None
            actual_lims=child._set_lims
            def logged_lims():
                recording.append(['before_set_lims',child._axis.get_scale(),list(map(float,child._axis.get_view_interval()))])
                actual_lims()
                recording.append(['after_set_lims',child._axis.get_scale(),list(map(float,child._axis.get_view_interval()))])
            child._set_lims=logged_lims
            recording.clear()
            try:
                child.draw(Renderer())
                result={'view':list(map(float,child._axis.get_view_interval())),'child_scale':child._axis.get_scale(),
                    'parent_cache':child._parentscale,'bbox':list(map(float,child.bbox.bounds))}
            except Exception as error:result={'error':type(error).__name__+': '+str(error)}
            observations.append({'orientation':orientation,'stages':copy.deepcopy(recording),'result':result})
    finally:
        numeric_base.draw=old_draw
        for name,value in [('draw',old_draw_global),('mimage',old_image),('attrgetter',old_attrgetter)]:
            if value is None:namespace.pop(name,None)
            else:namespace[name]=value
    checksum=hashlib.sha256(ast.get_source_segment(base_path.read_text(),original_node).encode()).hexdigest()
    return {'draw_body_sha256':checksum,'context':context(fig,axes),'observations':observations,
        'host_scope':'Complete original Secondary.draw and _AxesBase.draw numeric/control bodies. Rasterization decorator is excluded; empty graphical artist/compositor, title and renderer group sinks are explicit. Actual locator and both apply_aspect/_set_lims calls execute.'}


def collect_capture():
    fig=Figure(width=320.,height=240.);axes=Axes(fig,[.2,.25,.5,.5],index=0)
    fig.created.append(axes);fig.active.append(axes);axes.set_xlim((1.,4.))
    child=Secondary(axes,'x',.25,(lambda value:value,lambda value:value))
    def forward(value):
        child.set_location(.75)
        return value
    child.set_functions((forward,lambda value:value))
    locator=child.get_axes_locator();candidate=locator(child,None)
    child.apply_aspect(candidate)
    observation={'raw_location_after_forward':child._loc,'position_after_forward':child._pos,
        'active_bbox':list(map(float,child.bbox.bounds)),'captured_position':.25,
        'new_requested_position':.75,'own_view':list(map(float,child._axis.get_view_interval()))}
    return context(fig,axes),observation


from generate_scale_defaults_reference import moon
from generate_auto_date_reference import formatted

HEADER=ref.HEADER.replace('pinned complete Secondary/numeric lifecycle','pinned original secondary position profiles').replace('secondary_source_', 'secondary_position_source_')


def number(value):
    if isinstance(value,str) and value in ['nan','inf','-inf']:
        return {'nan':'(0.0 / 0.0)','inf':'(1.0 / 0.0)','-inf':'(-1.0 / 0.0)'}[value]
    return moon(value)


def array(values):return '['+', '.join(number(v) for v in values)+']'


def location(value):
    if isinstance(value,str) and value in ['top','bottom','left','right']:
        return 'SecondaryAxisLocation::'+value.title()
    return 'SecondaryAxisLocation::Position('+number(value)+')'


def alignment(value):return 'SecondaryAxisAlignment::'+value.title()


def setup(orientation,normalized_rect,limits,initial_location):
    lines=['let previous = @config.rc_params()','defer {',
        '@config.set_minor_ticks_visible(previous.minor_ticks_visible())',
        '@config.set_minor_ticks_visible(previous.minor_ticks_visible(horizontal=false), horizontal=false)',
        '@config.set_classic_mode(previous.classic_mode())',
        'try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())','}',
        '@config.set_minor_ticks_visible(false)','@config.set_minor_ticks_visible(false, horizontal=false)',
        '@config.set_classic_mode(false)','@config.set_axes_autolimit_mode("data")',
        'let fig = figure(width=320, height=240)',
        'let parent = fig.add_axes('+', '.join(number(v) for v in normalized_rect)+')',
        'parent.set_xlim('+', '.join(number(v) for v in limits[0])+')',
        'parent.set_ylim('+', '.join(number(v) for v in limits[1])+')']
    if initial_location is not None:
        lines+=['let child = parent.secondary_'+orientation+'axis(value => value, value => value, location='+location(initial_location)+')']
    return lines


def assert_location(value):
    if isinstance(value,str) and value in ['top','bottom','left','right']:
        return ['assert_true(child.location() is '+location(value)+')']
    return ['guard child.location() is SecondaryAxisLocation::Position(raw_position) else { fail("expected numeric raw location") }',
        'secondary_position_source_double(raw_position, '+number(value)+')']


def assert_normalized_box(expression,expected):
    return ['{','let box = '+expression,
        'secondary_position_source_numbers([box.x0(), box.y0(), box.width(), box.height()], '+array(expected)+')','}']


def assert_parameter(row):
    state=row['state']
    lines=assert_location(state['raw_location'])
    lines+=['secondary_position_source_double(child.position(), '+number(state['position'])+')',
        'assert_true(child.alignment() is '+alignment(state['locstrings'][0])+')',
        'assert_eq(child.parent_scale_name, Some('+moon(state['parent_cache'])+'))',
        'assert_eq(child.numeric_axis.coordinate_scale_name(), '+moon(state['scale'])+')',
        'let view = child.numeric_axis.stored_view_limits()',
        'secondary_position_source_numbers([view.lower(), view.upper()], '+array(state['own_view'])+')',
        'assert_eq([secondary_position_source_major_class(child.locator().unwrap()), secondary_position_source_minor_class(child.minor_locator().unwrap()), secondary_position_source_formatter_class(child.named_formatter().unwrap()), secondary_position_source_formatter_class(child.minor_named_formatter().unwrap())], '+moon(state['classes'])+')',
        'assert_eq([child.numeric_axis.is_default_locator(), child.numeric_axis.is_default_locator(minor=true), child.numeric_axis.is_default_formatter(), child.numeric_axis.is_default_formatter(minor=true)], '+moon(state['flags'])+')']
    lines+=assert_normalized_box('child.active_bounds',state['active_position'])
    lines+=assert_normalized_box('child.original_bounds',state['original_position'])
    if 'same_slots' in state:
        lines+=['assert_eq([secondary_position_source_same_major(old_major, child.locator().unwrap()), secondary_position_source_same_minor(old_minor, child.minor_locator().unwrap()), physical_equal(old_major_formatter, child.named_formatter().unwrap()), physical_equal(old_minor_formatter, child.minor_named_formatter().unwrap())], '+moon(state['same_slots'])+')']
    return lines


def positioned_line(frame):return 'child.positioned_aspect('+', '.join(number(v) for v in frame)+')'


def render_parameter_case(index,row,frame):
    label=row['label'];orientation=row['state']['orientation']
    initial=row['state']['raw_location'] if label.startswith('constructor ') else .25
    if label.startswith('NaN '):initial='top'
    wrong='left' if orientation=='x' else ('bottom' if label.startswith('constructor ') else 'top')
    is_constructor_error=label.startswith('constructor wrong direction ')
    if is_constructor_error:initial=None
    lines=['///|','fn secondary_position_source_case_'+str(index)+'() -> Unit raise {']+setup(orientation,[.2,.2,.4,.6],[[10.,20.],[30.,40.]],initial)
    if is_constructor_error:
        lines+=['assert_true(try { ignore(parent.secondary_'+orientation+'axis(value => value, value => value, location='+location(wrong)+')); false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })','}']
        return '\n'.join(lines)
    first,last=('top','bottom') if orientation=='x' else ('right','left')
    if label.startswith(('explicit first alignment ','setter moves to last ','numeric setter ','apply positioned ')):
        lines+=['child.set_location('+location(first)+')']
    if label.startswith(('setter moves to last ','numeric setter ','apply positioned ')):
        lines+=['child.set_alignment('+alignment(first)+')']
    if label.startswith(('numeric setter ','apply positioned ')):
        lines+=['child.set_location('+location(last)+')']
    if label.startswith('apply positioned '):lines+=['child.set_location('+location(.75)+')']
    if label.startswith('NaN positioned '):lines+=['child.set_location('+location('nan')+')']
    if 'same_slots' in row['state']:
        lines+=['let old_major = child.locator().unwrap()','let old_minor = child.minor_locator().unwrap()',
            'let old_major_formatter = child.named_formatter().unwrap()','let old_minor_formatter = child.minor_named_formatter().unwrap()']
    statement=None
    if label.startswith('setter moves to first '):statement='child.set_location('+location(first)+')'
    elif label.startswith('explicit first alignment '):statement='child.set_alignment('+alignment(first)+')'
    elif label.startswith('setter moves to last '):statement='child.set_location('+location(last)+')'
    elif label.startswith('numeric setter '):statement='child.set_location('+location(.75)+')'
    elif label.startswith(('apply positioned ','NaN positioned ')):statement=positioned_line(frame)
    elif label.startswith('NaN location setter '):statement='child.set_location('+location('nan')+')'
    elif label.startswith('failed update '):
        statement='child.set_location('+location(wrong)+')' if 'wrong named location' in label else 'child.set_alignment('+alignment(wrong)+')'
    if statement:
        if row['operation_error']:
            lines+=['// Native error wording is retained in JSON; the existing checked variant is projected here.',
                'assert_true(try { '+statement+'; false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })']
        else:lines+=[statement]
    lines+=assert_parameter(row)+['}']
    return '\n'.join(lines)


def assert_display_bbox(expected):
    return ['{','let box = child.display_bounds()',
        'secondary_position_source_numbers([box.x0(), box.y0(), box.width(), box.height()], '+array(expected)+')','}']


def render_geometry_case(index,orientation,observations,frame):
    lines=['///|','fn secondary_position_source_case_'+str(index)+'() -> Unit raise {']+setup(orientation,[.2,.25,.5,.5],[[1.,4.],[0.,1.]],.75)
    operations=[None,positioned_line(frame),'child.set_location('+location(.25)+')',positioned_line(frame),
        'child.set_alignment('+alignment('bottom' if orientation=='x' else 'left')+')']
    for row,operation in zip(observations,operations):
        lines+=['// '+row['stage']]
        if operation:lines+=[operation]
        lines+=['{']+assert_location(row['location'])+[
            'secondary_position_source_double(child.position(), '+number(row['pos'])+')',
            'assert_true(child.alignment() is '+alignment(row['tick_side'])+')',
            'let view = child.numeric_axis.stored_view_limits()',
            'secondary_position_source_numbers([view.lower(), view.upper()], '+array(row['own_view'])+')']
        lines+=assert_display_bbox(row['active_bbox'])+['}']
    return '\n'.join(lines+['}'])


def render_full_draw_case(index,row,frame):
    direction=row['orientation'];first='top' if direction=='x' else 'right'
    limits=[[1.,2.],[0.,1.]] if direction=='x' else [[0.,1.],[1.,2.]]
    lines=['///|','fn secondary_position_source_case_'+str(index)+'() -> Unit raise {']+setup(direction,[.2,.25,.5,.5],limits,None)
    lines+=['let child = parent.secondary_'+direction+'axis(value => { ignore(value); 4.0 }, value => { ignore(value); 1.0 }, location='+location(first)+')',
        'child.set_locator(@ticker.FixedLocator::new([2.0, 3.0]).as_locator())',
        'parent.set_'+direction+'_scale(@scale.log_scale())','child.prepare_draw()','{',
        'let view = child.numeric_axis.stored_view_limits()',
        'secondary_position_source_numbers([view.lower(), view.upper()], '+array(row['stages'][1][2])+')','}',
        positioned_line(frame),'{','let view = child.numeric_axis.stored_view_limits()',
        'secondary_position_source_numbers([view.lower(), view.upper()], '+array(row['result']['view'])+')','}',
        'assert_eq(child.numeric_axis.coordinate_scale_name(), '+moon(row['result']['child_scale'])+')',
        'assert_eq(child.parent_scale_name, Some('+moon(row['result']['parent_cache'])+'))']
    lines+=assert_display_bbox(row['result']['bbox'])+['}']
    return '\n'.join(lines)


def render_capture_case(index,row,frame):
    lines=['///|','fn secondary_position_source_case_'+str(index)+'() -> Unit raise {']+setup('x',[.2,.25,.5,.5],[[1.,4.],[0.,1.]],.25)
    lines+=['child.set_functions(value => { try! child.set_location('+location(.75)+'); value }, value => value)',
        positioned_line(frame)]
    lines+=assert_location(row['raw_location_after_forward'])
    lines+=['secondary_position_source_double(child.position(), '+number(row['position_after_forward'])+')',
        'let view = child.numeric_axis.stored_view_limits()',
        'secondary_position_source_numbers([view.lower(), view.upper()], '+array(row['own_view'])+')']
    lines+=assert_display_bbox(row['active_bbox'])+['}']
    return '\n'.join(lines)


def render(payload):
    cases=[];chunks=[HEADER]
    for index,row in enumerate(payload['parameter_observations']):
        if row['profile'] not in ['typed double or named location','typed named error']:continue
        cases.append((index,row['label']))
        chunks.append(render_parameter_case(index,row,payload['parameter_context']['parent_screen_frame']))
    next_id=len(payload['parameter_observations'])
    for orientation in ['x','y']:
        selected=[row for row in payload['geometry_observations'] if row['orientation']==orientation]
        chunks.append(render_geometry_case(next_id,orientation,selected,payload['geometry_context']['parent_screen_frame']))
        cases.append((next_id,'actual position/alignment geometry sequence '+orientation));next_id+=1
    for row in payload['full_draw_profile']['observations']:
        chunks.append(render_full_draw_case(next_id,row,payload['full_draw_profile']['context']['parent_screen_frame']))
        cases.append((next_id,'complete Base.draw second numeric aspect '+row['orientation']));next_id+=1
    chunks.append(render_capture_case(next_id,payload['capture_observation'],payload['capture_context']['parent_screen_frame']))
    cases.append((next_id,'locator captured before forward changes location'))
    for start in range(0,len(cases),32):
        calls=['secondary_position_source_case_'+str(i)+'() catch { error => fail('+moon('secondary position source '+str(i)+' ['+label+']: ')+' + error.to_string()) }' for i,label in cases[start:start+32]]
        chunks.append('///|\ntest "original secondary position group '+str(start//32)+'" {\n'+'\n'.join(calls)+'\n}')
    return formatted('\n\n'.join(chunks)+'\n')


def collect():
    parameters=collect_parameters();fig,axes=parent();parameter_context=context(fig,axes)
    geometry_context,geometry=collect_geometry();full_draw=collect_full_draw();capture_context,capture_row=collect_capture()
    typed=sum(row['profile'] in ['typed double or named location','typed named error'] for row in parameters)
    return {'source_hashes':ref.source_hashes(),'python':sys.version.split()[0],'numpy':np.__version__,
        'counts':{'parameter_records':len(parameters),'typed_parameter_records':typed,'source_only_parameter_records':len(parameters)-typed,
            'geometry_records':len(geometry),'full_draw_traces':len(full_draw['observations']),'capture_traces':1,
            'all_profile_records':len(parameters)+len(geometry)+len(full_draw['observations'])+1,
            'typed_scenarios':typed+5,'registered_groups':(typed+5+31)//32},
        'host_boundaries':{
            'parameters':'Complete original Secondary methods, real Bbox/locator/aspect. Spine visibility and tick/label side are presentation stores, not full Tick/Text artists.',
            'geometry':'Actual original deferred locator and normalized/display Bboxes. Incoming frame is the measured original parent Bbox; no claim that Scene convenience rect arithmetic reproduces the complete parent transform graph.',
            'full_draw':'Complete original _AxesBase.draw body beneath Secondary.draw with decorator excluded, empty graphical artists and compositor/title/group sinks; actual second locator/aspect executes.',
            'typed_projection':'Named and Double locations, separate named alignment. Dynamic Python scalar/container/Transform inputs remain source-only; native locator/transform identity recorded without a new public handle protocol.',
            'errors':'Native messages retained. Existing Core InvalidTicks mapping and exact surviving typed state are asserted without claiming verbatim message parity.',
            'nonfinite':'NaN/Inf receipt is accepted. Deferred NaN Bbox is asserted without requiring complete SVG export; no NaN payload parity.',
            'callbacks':'Existing nonraising scalar callback bridge, not full vector callback count/effect parity.'},
        'parameter_context':parameter_context,'parameter_observations':parameters,
        'geometry_context':geometry_context,'geometry_observations':geometry,
        'full_draw_profile':full_draw,'capture_context':capture_context,'capture_observation':capture_row}


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',nargs='?',type=Path,default=ref.P);parser.add_argument('--check',action='store_true')
    args=parser.parse_args();ref.load_secondary_source(args.ticker);payload=collect()
    document=json.dumps(clean(payload),ensure_ascii=False,indent=2,allow_nan=False)+'\n'
    outputs={ROOT/'testdata/secondary_position_reference.json':document,
        ROOT/'scene/secondary_position_reference_wbtest.mbt':render(payload)}
    for path,content in outputs.items():
        if args.check:
            if not path.exists() or path.read_text()!=content:raise SystemExit('secondary position reference differs: '+str(path))
        else:path.write_text(content)
    print(json.dumps({'check':args.check,**payload['counts'],'json_sha256':hashlib.sha256(document.encode()).hexdigest()}))


if __name__=='__main__':main()
