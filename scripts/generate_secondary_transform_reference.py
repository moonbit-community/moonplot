"""Pinned complete original secondary location-transform and captured locator reference."""
from pathlib import Path
import sys,json,math,copy,warnings,argparse,hashlib
import numpy as np
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_secondary_lifecycle_reference as ref
h=ref.load_secondary_source();tr=h['transforms'];Figure,Axes,Secondary=(h[k] for k in ['Figure','Axes','Secondary'])

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

def fresh():
    figure=Figure();axes=Axes(figure,[.2,.25,.5,.5],index=0)
    figure.created.append(axes);figure.active.append(axes)
    axes.set_xlim((1.,4.));axes.set_ylim((10.,20.))
    return figure,axes

def snapshot(child,old=None):
    locator=child.get_axes_locator()
    result={'raw_location':getattr(child,'_loc',None),'position':getattr(child,'_pos',None),
        'alignment':getattr(child._axis,'presentation_tick_position',None),
        'parent_cache':child._parentscale,'scale':child._axis.get_scale(),
        'own_view':getattr(child._viewLim,'interval'+child._orientation).tolist(),
        'active_bbox':list(child.bbox.bounds),
        'location_transform_class':type(locator._transform).__name__ if locator else None,
        'locator_points':capture(lambda:locator(child,None).get_points()) if locator else None}
    if old:
        result['same_locator']=locator is old
    return clean(result)

rows=[]
profiles=[('None',lambda:None),('translation',lambda:tr['Affine2D']().translate(15.,25.)),
    ('scale',lambda:tr['Affine2D']().scale(2.,3.)),
    ('negative_scale',lambda:tr['Affine2D']().scale(-2.,-3.).translate(15.,25.)),
    ('zero_scale',lambda:tr['Affine2D']().scale(0.,0.).translate(15.,25.)),
    ('rotation',lambda:tr['Affine2D']().rotate(math.pi/6)),
    ('skew',lambda:tr['Affine2D']().skew_deg(10.,20.)),
    ('generic_composite_rotation',lambda:tr['BboxTransformTo'](tr['Bbox'].unit())+tr['Affine2D']().rotate(math.pi/6)),
    ('wrapper_rotation',lambda:tr['TransformWrapper'](tr['Affine2D']().rotate(math.pi/6))),
    ('base_no_inverse',lambda:tr['Transform']())]
with warnings.catch_warnings(),np.errstate(all='ignore'):
    warnings.simplefilter('ignore',RuntimeWarning)
    for orientation in ['x','y']:
        for name,builder in profiles:
            figure,axes=fresh();transform=builder();child=Secondary.__new__(Secondary)
            result=capture(lambda:Secondary.__init__(child,axes,orientation,.25,None,transform=transform))
            row={'profile':'constructor','orientation':orientation,'label':name,
                'input_class':type(transform).__name__,'input_is_separable':None if transform is None else transform.is_separable,
                'input_has_inverse':None if transform is None else transform.has_inverse,
                'constructor_error':result['error'],'state':snapshot(child)}
            if not result['error']:
                locator=child.get_axes_locator();candidate=locator(child,None)
                row['positioned_error']=capture(lambda:child.apply_aspect(candidate))['error']
                row['after_positioned']=snapshot(child)
            rows.append(row)
    for orientation in ['x','y']:
        figure,axes=fresh();child=Secondary(axes,orientation,.25,None)
        old=child.get_axes_locator()
        transform=tr['Affine2D']().rotate(math.pi/6)
        error=capture(lambda:child.set_location(.75,transform=transform))['error']
        rows.append({'profile':'failed_setter','orientation':orientation,'error':error,'state':snapshot(child,old)})
    for orientation in ['x','y']:
        figure,axes=fresh();transform=tr['Affine2D']().scale(2.,3.).translate(15.,25.)
        child=Secondary(axes,orientation,.25,None,transform=transform)
        first=snapshot(child)
        child.set_location(.75)
        omitted=snapshot(child);omitted['uses_parent_transAxes']=child.get_axes_locator()._transform is axes.transAxes
        child.set_location(.5,transform=transform)
        child.set_location(.75,transform=None)
        explicit=snapshot(child);explicit['uses_parent_transAxes']=child.get_axes_locator()._transform is axes.transAxes
        rows.append({'profile':'omitted_and_None_reset','orientation':orientation,'before':first,'omitted':omitted,'explicit_None':explicit})
    for orientation in ['x','y']:
        figure,axes=fresh();transform=tr['Affine2D']().scale(2.,3.).translate(15.,25.)
        child=Secondary(axes,orientation,.25,None,transform=transform)
        locator=child.get_axes_locator();candidate=locator(child,None)
        child.apply_aspect(candidate);before=snapshot(child)
        before_points=candidate.get_points().copy()
        transform.translate(30.,40.)
        after_mutation=snapshot(child,locator)
        after_points=candidate.get_points().copy()
        child.apply_aspect(candidate)
        rows.append({'profile':'mutable_alias','orientation':orientation,'before':before,'after_mutation_before_aspect':after_mutation,
            'same_candidate_points_before':before_points,'same_candidate_points_after':after_points,'after_same_candidate_aspect':snapshot(child,locator)})
    for orientation in ['x','y']:
        for mutate_old in [False,True]:
            figure,axes=fresh();old_transform=tr['Affine2D']().scale(2.,3.).translate(15.,25.)
            new_transform=tr['Affine2D']().translate(100.,200.)
            child=Secondary(axes,orientation,.25,None,transform=old_transform)
            fired=[False]
            def forward(value):
                if not fired[0]:
                    fired[0]=True
                    if mutate_old:old_transform.translate(30.,40.)
                    child.set_location(.75,transform=new_transform)
                return value
            child.set_functions((forward,lambda value:value))
            locator=child.get_axes_locator();candidate=locator(child,None)
            # Keep candidate lazy here, exactly as original Base.draw does.
            error=capture(lambda:child.apply_aspect(candidate))['error']
            rows.append({'profile':'callback_capture','orientation':orientation,'mutates_old_transform':mutate_old,
                'error':error,'state':snapshot(child),'captured_candidate_points_after':candidate.get_points().copy()})
    # Both methods below are actual original source. They deliberately differ.
    rotation=tr['Affine2D']().rotate(math.pi/4)
    for points in [[[0.,0.],[1.,2.]],[[1.,0.],[0.,2.]],[[0.,2.],[1.,0.]],[[1.,2.],[0.,0.]]]:
        box=tr['Bbox'](np.array(points))
        rows.append({'profile':'bbox_primitive','raw_points':points,
            'Bbox_transformed':box.transformed(rotation).get_points(),
            'TransformedBbox':tr['TransformedBbox'](box,rotation).get_points(),
            'all_four_transformed':rotation.transform([[points[0][0],points[0][1]],[points[1][0],points[0][1]],[points[0][0],points[1][1]],[points[1][0],points[1][1]]])})


def coefficients(transform):
    matrix=transform.get_matrix()
    return [float(matrix[0,0]),float(matrix[1,0]),float(matrix[0,1]),float(matrix[1,1]),float(matrix[0,2]),float(matrix[1,2])]


def snapshot_with_slots(child,old=None):
    state=snapshot(child,old);axis=child._axis
    state['classes']=[type(value).__name__ for value in [axis.major.locator,axis.minor.locator,axis.major.formatter,axis.minor.formatter]]
    state['flags']=[getattr(axis,key) for key in ['isDefault_majloc','isDefault_minloc','isDefault_majfmt','isDefault_minfmt']]
    return state


def collect_additional():
    extra=[]
    with warnings.catch_warnings(),np.errstate(all='ignore'):
        warnings.simplefilter('ignore',RuntimeWarning)
        for orientation in ['x','y']:
            figure,axes=fresh();child=Secondary(axes,orientation,.25,None)
            old=child.get_axes_locator();transform=tr['Affine2D']().rotate(math.pi/6)
            error=capture(lambda:child.set_location(.75,transform=transform))['error']
            before=snapshot_with_slots(child,old)
            aspect_error=capture(lambda:child.apply_aspect(child.get_axes_locator()(child,None)))['error']
            extra.append({'profile':'failed_setter_then_aspect','orientation':orientation,
                'error':error,'before_aspect':before,'positioned_error':aspect_error,
                'after_positioned':snapshot_with_slots(child,old)})
            for slot in ['selected_diagonal','selected_translation']:
                for label,value in [('NaN',math.nan),('positive infinity',math.inf),('negative infinity',-math.inf)]:
                    values=[1.,0.,0.,1.,0.,0.]
                    index=(3 if orientation=='x' else 0) if slot=='selected_diagonal' else (5 if orientation=='x' else 4)
                    values[index]=value
                    transform=tr['Affine2D'].from_values(*values);figure,axes=fresh();child=Secondary.__new__(Secondary)
                    error=capture(lambda:Secondary.__init__(child,axes,orientation,.25,None,transform=transform))['error']
                    before=snapshot_with_slots(child)
                    positioned=capture(lambda:child.apply_aspect(child.get_axes_locator()(child,None)))['error'] if error is None else None
                    extra.append({'profile':'nonfinite_constructor','orientation':orientation,'label':slot+'/'+label,
                        'affine_values':values,'constructor_error':error,'state':before,
                        'positioned_error':positioned,'after_positioned':snapshot_with_slots(child)})
            for index in [1,2]:
                values=[1.,0.,0.,1.,0.,0.];values[index]=math.nan
                transform=tr['Affine2D'].from_values(*values);figure,axes=fresh();child=Secondary(axes,orientation,.25,None)
                old=child.get_axes_locator()
                error=capture(lambda:child.set_location(.75,transform=transform))['error']
                before=snapshot_with_slots(child,old)
                positioned=capture(lambda:child.apply_aspect(child.get_axes_locator()(child,None)))['error']
                extra.append({'profile':'nonfinite_failed_setter','orientation':orientation,'label':'NaN offdiagonal '+str(index),
                    'affine_values':values,'error':error,'state':before,'positioned_error':positioned,
                    'after_positioned':snapshot_with_slots(child,old)})
    return extra


from generate_auto_date_reference import formatted
from generate_scale_defaults_reference import moon

HEADER=ref.HEADER.split('\n///|\nfn secondary_source_same_major')[0].replace('pinned complete Secondary/numeric lifecycle','pinned original secondary location-transform profiles').replace('secondary_source_', 'secondary_transform_source_')


def number(value):
    if isinstance(value,str) and value in ['nan','inf','-inf']:
        return {'nan':'(0.0 / 0.0)','inf':'(1.0 / 0.0)','-inf':'(-1.0 / 0.0)'}[value]
    if isinstance(value,float) and not math.isfinite(value):return number(clean(value))
    return moon(value)


def array(values):return '['+', '.join(number(value) for value in values)+']'


def affine(values):return '@transforms.affine_from_values('+', '.join(number(value) for value in values)+')'


def transform_expression(label,affines):
    return 'None' if label=='None' else 'Some('+affine(affines[label])+')'


def setup(orientation,transform=None):
    lines=['let previous = @config.rc_params()','defer {',
        '@config.set_minor_ticks_visible(previous.minor_ticks_visible())',
        '@config.set_minor_ticks_visible(previous.minor_ticks_visible(horizontal=false), horizontal=false)',
        '@config.set_classic_mode(previous.classic_mode())',
        'try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())','}',
        '@config.set_minor_ticks_visible(false)','@config.set_minor_ticks_visible(false, horizontal=false)',
        '@config.set_classic_mode(false)','@config.set_axes_autolimit_mode("data")',
        'let fig = figure(width=320, height=240)','let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)',
        'parent.set_xlim(1.0, 4.0)','parent.set_ylim(10.0, 20.0)']
    if transform is not None:
        lines+=['let child = parent.secondary_'+orientation+'axis(value => value, value => value, location=SecondaryAxisLocation::Position(0.25), transform='+transform+')']
    return lines


def assert_state(state):
    align='Bottom' if state.get('alignment')=='bottom' else 'Left'
    lines=['{','secondary_transform_source_double(child.position(), '+number(state['position'])+')',
        'guard child.location() is SecondaryAxisLocation::Position(raw_location) else { fail("expected numeric location") }',
        'secondary_transform_source_double(raw_location, '+number(state['raw_location'])+')',
        'assert_true(child.alignment() is SecondaryAxisAlignment::'+align+')',
        'assert_eq(child.parent_scale_name, Some('+moon(state['parent_cache'])+'))',
        'assert_eq(child.numeric_axis.coordinate_scale_name(), '+moon(state['scale'])+')',
        '{','let view = child.numeric_axis.stored_view_limits()',
        'secondary_transform_source_numbers([view.lower(), view.upper()], '+array(state['own_view'])+')','}',
        '{','let box = child.display_bounds()',
        'secondary_transform_source_numbers([box.x0(), box.y0(), box.width(), box.height()], '+array(state['active_bbox'])+')','}']
    if 'classes' in state:
        lines+=['assert_eq([secondary_transform_source_major_class(child.locator().unwrap()), secondary_transform_source_minor_class(child.minor_locator().unwrap()), secondary_transform_source_formatter_class(child.named_formatter().unwrap()), secondary_transform_source_formatter_class(child.minor_named_formatter().unwrap())], '+moon(state['classes'])+')',
            'assert_eq([child.numeric_axis.is_default_locator(), child.numeric_axis.is_default_locator(minor=true), child.numeric_axis.is_default_formatter(), child.numeric_axis.is_default_formatter(minor=true)], '+moon(state['flags'])+')']
    return lines+['}']


def assert_snapshot(position,values):
    lines=['secondary_transform_source_double(child.location_locator.position, '+number(position)+')']
    if values is None:return lines+['assert_true(child.location_locator.transform is None)']
    lines+=['{','let installed = child.location_locator.transform.unwrap()',
        'secondary_transform_source_numbers([installed.a, installed.b, installed.c, installed.d, installed.e, installed.f], '+array(values)+')','}']
    return lines


POSITIONED='child.positioned_aspect(64.0, 60.0, 160.0, 120.0)'


def expect_invalid(statement):
    return ['assert_true(try { '+statement+'; false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })']


def render_case(index,row,affines):
    orientation=row['orientation'];profile=row['profile'];lines=['///|','fn secondary_transform_source_case_'+str(index)+'() -> Unit raise {']
    if profile=='constructor':
        expression=transform_expression(row['label'],affines)
        if row['constructor_error']:
            lines+=setup(orientation)+expect_invalid('ignore(parent.secondary_'+orientation+'axis(value => value, value => value, location=SecondaryAxisLocation::Position(0.25), transform='+expression+'))')
        else:
            lines+=setup(orientation,expression)+assert_state(row['state'])
            lines+=[POSITIONED]+assert_state(row['after_positioned'])
            lines+=assert_snapshot(.25,None if row['label']=='None' else affines[row['label']])
    elif profile in ['failed_setter','failed_setter_then_aspect','nonfinite_failed_setter']:
        values=row.get('affine_values',affines['rotation'])
        lines+=setup(orientation,'None')+expect_invalid('child.set_location(SecondaryAxisLocation::Position(0.75), transform=Some('+affine(values)+'))')
        lines+=assert_state(row.get('state',row.get('before_aspect')))+assert_snapshot(.25,None)
        if 'after_positioned' in row:
            lines+=[POSITIONED]+assert_state(row['after_positioned'])+assert_snapshot(.25,None)
    elif profile=='omitted_and_None_reset':
        initial=[2.,0.,0.,3.,15.,25.]
        lines+=setup(orientation,'Some('+affine(initial)+')')+assert_state(row['before'])
        lines+=['child.set_location(SecondaryAxisLocation::Position(0.75))']+assert_state(row['omitted'])+assert_snapshot(.75,None)
        lines+=['child.set_location(SecondaryAxisLocation::Position(0.5), transform=Some('+affine(initial)+'))',
            'child.set_location(SecondaryAxisLocation::Position(0.75), transform=None)']+assert_state(row['explicit_None'])+assert_snapshot(.75,None)
    elif profile=='callback_capture':
        old=[2.,0.,0.,3.,15.,25.];new=[1.,0.,0.,1.,100.,200.]
        lines+=setup(orientation,'Some('+affine(old)+')')
        lines+=['child.set_functions(value => { try! child.set_location(SecondaryAxisLocation::Position(0.75), transform=Some('+affine(new)+')); value }, value => value)',POSITIONED]
        lines+=assert_state(row['state'])+assert_snapshot(.75,new)
    elif profile=='nonfinite_constructor':
        lines+=setup(orientation,'Some('+affine(row['affine_values'])+')')+assert_state(row['state'])
        lines+=[POSITIONED]+assert_state(row['after_positioned'])+assert_snapshot(.25,row['affine_values'])
    else:raise AssertionError('unprojected profile: '+profile)
    return '\n'.join(lines+['}'])


def is_typed(row):
    profile=row['profile']
    if profile=='constructor':return row['label'] not in ['generic_composite_rotation','wrapper_rotation','base_no_inverse']
    if profile=='callback_capture':return not row['mutates_old_transform']
    return profile not in ['mutable_alias','bbox_primitive']


def render(payload):
    cases=[(index,row) for index,row in enumerate(payload['observations']) if is_typed(row)]
    chunks=[HEADER]
    for index,row in cases:chunks.append(render_case(index,row,payload['affine_inputs']))
    for start in range(0,len(cases),32):
        calls=[]
        for index,row in cases[start:start+32]:
            label='secondary transform '+str(index)+' '+row['profile']+' '+row.get('orientation','')+' '+row.get('label','')
            calls+=['secondary_transform_source_case_'+str(index)+'() catch { error => fail('+moon(label+': ')+' + error.to_string()) }']
        chunks.append('///|\ntest "original secondary transform group '+str(start//32)+'" {\n'+'\n'.join(calls)+'\n}')
    return formatted('\n\n'.join(chunks)+'\n')


def collect():
    observations=copy.deepcopy(rows)+collect_additional()
    affine_inputs={name:coefficients(builder()) for name,builder in profiles if name in ['translation','scale','negative_scale','zero_scale','rotation','skew']}
    typed=sum(is_typed(row) for row in observations)
    return {'source_hashes':ref.source_hashes(),'python':sys.version.split()[0],'numpy':np.__version__,
        'counts':{'preparation_records':34,'additional_records':len(observations)-34,'all_records':len(observations),
            'typed_scenarios':typed,'source_only_records':len(observations)-typed,'registered_groups':(typed+31)//32},
        'host_boundaries':{
            'source':'Complete original Secondary and native transform/factory/locator/Bbox classes execute in the accepted numeric graphical-constructor/style/aspect host.',
            'typed':'Direct native Affine2DBase replacement-only immutable profile, plus None reset. Constructor and setter reject whole-matrix nonseparability after location metadata assignment.',
            'source_only':'Generic composite/wrapper/base Transform provenance, original in-place mutable graph aliases, and the four Bbox primitive comparisons are retained without typed API parity claims.',
            'capture':'Current positioned operation captures the old installed locator before scalar forward callback. New replacement applies to the next candidate; native old-T in-place mutation remains source-only.',
            'errors':'Exact native class/message and surviving state retained. Existing Core InvalidTicks error variant is asserted; no new message-text contract.',
            'nonfinite':'Diagonal/translation NaN and infinities are accepted, then actual native deferred Bbox executes; NaN classification and strict finite/infinite bits are asserted without full SVG requirements.'},
        'context':{'figure_size':[320.,240.],'parent_normalized_rect':[.2,.25,.5,.5],
            'parent_screen_frame':[64.,60.,160.,120.],'x_view':[1.,4.],'y_view':[10.,20.]},
        'affine_inputs':clean(affine_inputs),'observations':clean(observations)}


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',nargs='?',type=Path,default=ref.P);parser.add_argument('--check',action='store_true')
    args=parser.parse_args();ref.load_secondary_source(args.ticker)
    payload=collect();document=json.dumps(payload,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
    outputs={ROOT/'testdata/secondary_transform_reference.json':document,
        ROOT/'scene/secondary_transform_reference_wbtest.mbt':render(payload)}
    for path,content in outputs.items():
        if args.check:
            if not path.exists() or path.read_text()!=content:raise SystemExit('secondary transform reference differs: '+str(path))
        else:path.write_text(content)
    print(json.dumps({'check':args.check,**payload['counts'],'json_sha256':hashlib.sha256(document.encode()).hexdigest()}))


if __name__=='__main__':main()
