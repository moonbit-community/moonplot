"""Pinned complete Logit/Scale/Axis AST with explicit numeric Bbox/GUI sinks.

The reference executes upstream methods, never a translated Moon scale/axis
algorithm. Source-only tight and clipped-Path observations record boundaries
which the minimal explicit-scale/in-domain-SVG slice does not claim to migrate.
"""
from pathlib import Path
import argparse
import ast
import copy
import hashlib
import json
import math
import sys
import types
import warnings

import numpy as np

from generate_asinh_axis_reference import load as load_asinh, autoscale_fixture
from generate_auto_date_reference import formatted, moon
from generate_log_axis_reference import HASHES
from generate_null_axis_reference import clean
from generate_numeric_axis_reference import load as physical_load, context
from generate_symlog_axis_reference import num, arr, numbers_helper

ROOT = Path(__file__).resolve().parents[1]


def load(path):
    ns, transforms, Axes, Secondary = load_asinh(path)
    trees = {name: ast.parse((path.parent/name).read_text()) for name in ['ticker.py','scale.py']}
    for filename,names in [('ticker.py',['LogitLocator']),('scale.py',['LogitTransform','LogisticTransform','LogitScale'])]:
        for name in names:
            if name == 'LogitScale': ns['LogitFormatter'] = ns['ScalarFormatter']
            node = next(n for n in trees[filename].body if isinstance(n,ast.ClassDef) and n.name == name)
            exec(compile(ast.Module(body=[node],type_ignores=[]),str(path.parent/filename),'exec'),ns)
    ns['_scale_mapping']['logit'] = ns['LogitScale']
    ns['_scale_has_axis_parameter']['logit'] = True
    axis_type = type(Axes().xaxis)
    originals = {'x':ns['XAxis_get_minpos'],'y':ns['YAxis_get_minpos']}
    def minpos(axis):
        ns['events'].append(axis.axes.label+'.minpos.'+axis.axis_name)
        return originals[axis.axis_name](axis)
    def space(axis):
        ns['events'].append(axis.axes.label+'.space.'+axis.axis_name)
        return getattr(axis,'tick_space',4)
    axis_type.get_minpos,axis_type.get_tick_space = minpos,space
    return ns,transforms,Axes,Secondary


def observe(ns,fn):
    ns['events'].clear();ns['warning_messages'].clear()
    try:
        value,error,message = fn(),None,None
    except Exception as exc:
        value,error,message = None,type(exc).__name__,str(exc)
    return dict(values=clean(value),error=error,message=message,events=list(ns['events']),warnings=list(ns['warning_messages']))


def fixture(ns,transforms,Axes,data=(.01,.99),minpos=.01,margin=.05,mode='mask',label='axes'):
    result = autoscale_fixture(ns,transforms,Axes,1.,data,margin)
    result.label = label
    result.set_xscale('logit',nonpositive=mode)
    result.set_yscale('logit',nonpositive=mode)
    result.dataLim._minpos[:] = minpos
    return result


def trace_pipeline(path,ns,fn):
    trace=[]
    names={'nonsingular','limit_range_for_scale','view_limits','_set_lim','_validate_converted_limits'}
    def record(frame,event,arg):
        if event in ['call','return','exception'] and frame.f_code.co_filename.startswith(str(path.parent)) and frame.f_code.co_name in names:
            row=dict(event=event,method=frame.f_code.co_name,owner=type(frame.f_locals.get('self')).__name__)
            if event=='call':
                for name in ['vmin','vmax','minpos','v0','v1','dmin','dmax','limit']:
                    if name in frame.f_locals:row[name]=clean(frame.f_locals[name])
            elif event=='return':row['result']=clean(arg)
            else:row['error']=arg[0].__name__
            trace.append(row)
        return record
    sys.settrace(record)
    try:result=observe(ns,fn)
    finally:sys.settrace(None)
    result['trace']=trace
    return result


def generate(path):
    ns,tr,Axes,Secondary = load(path)
    cls=ns['LogitLocator']
    values=[-math.inf,-1.,-5e-324,-0.,0.,5e-324,1e-308,.01,.1,.5,.9,.99,math.nextafter(1.,0.),1.,math.nextafter(1.,math.inf),2.,math.inf,math.nan]
    inverse=[-math.inf,-1000.,-324.,-308.,-2.,-1.,-0.,0.,1.,2.,16.,17.,308.,324.,1000.,math.inf,math.nan]
    geometry=[]
    for mode in ['mask','clip']:
        scale=ns['LogitScale'](nonpositive=mode)
        for direction,data in [('transform',values),('inverse',inverse)]:
            active=scale.get_transform() if direction=='transform' else scale.get_transform().inverted()
            geometry.append(dict(mode=mode,direction=direction,values=data,result=active.transform(np.array(data,dtype=float)).tolist()))
    constructors=[]
    for mode in ['invalid','MASK','', 'clip ']:
        constructors.append(dict(mode=mode,result=observe(ns,lambda:ns['LogitScale'](nonpositive=mode))))
    limits=[]
    for scale in ['linear','log','symlog','asinh','logit']:
        active=ns['LogitScale']() if scale=='logit' else ns['_scale_mapping'][scale]()
        for minpos in [.01,.9,1.,2.,0.,-.1,math.nan,math.inf]:
            limits.append(dict(scale=scale,minpos=minpos,bounds=(-1.,2.),result=active.limit_range_for_scale(-1.,2.,minpos)))
    axis_rows=[]
    specs=[('mask dense source','mask',(.01,.99),[.1,.5,.9],True),
        ('clip dense source','clip',(.01,.99),[.1,.5,.9],True),
        ('source neighbor outside narrow view','mask',(.03,.97),[.1,.5,.9],True),
        ('overlap disabled','mask',(.01,.99),[.02,.5,.98],False),
        ('fixed major removes a dense minor','mask',(.01,.99),[.02,.5,.98],True),
        ('reversed view preserves raw order','mask',(.99,.01),[.1,.5,.9],True),
        ('minor zoom returns empty','mask',(.45,.55),[.5],True)]
    for label,mode,view,majors,overlap in specs:
        axes=fixture(ns,tr,Axes,mode=mode);axes.set_xlim(view);axis=axes.xaxis
        axis.set_major_locator(ns['FixedLocator'](np.array(majors)))
        minor=cls(True,nbins=4);axis.set_minor_locator(minor);axis.remove_overlapping_locs=overlap
        raw,filtered=observe(ns,minor),observe(ns,axis.get_minorticklocs)
        visible=axis._update_ticks()
        axis_rows.append(dict(label=label,mode=mode,view=view,majors=majors,overlap=overlap,raw=raw,filtered=filtered,
            visible_major=[t.value for t in visible if t.kind=='major'],visible_minor=[t.value for t in visible if t.kind=='minor']))
    overlap=[]
    for mode,view,majors,minors in [('mask',(.01,.99),[.5],[.5,.500001,.50001,.6]),('mask',(.49,.51),[.5],[.5,.500001,.50001,.6]),
        ('mask',(.01,.99),[0.,1.],[-1.,0.,.1,.9,1.,2.]),('clip',(.01,.99),[0.,1.],[-1.,0.,.1,.9,1.,2.])]:
        axes=fixture(ns,tr,Axes,mode=mode);axes.set_xlim(view);axis=axes.xaxis
        axis.set_major_locator(ns['FixedLocator'](np.array(majors)));axis.set_minor_locator(ns['FixedLocator'](np.array(minors)))
        overlap.append(dict(mode=mode,view=view,majors=majors,minors=minors,filtered=observe(ns,axis.get_minorticklocs)))
    setters=[]
    for minpos,bounds in [(.9,(-1.,2.)),(.9,(2.,-1.)),(.9,(1.,2.)),(.9,(-2.,-1.)),(.9,(.5,.5)),(.9,(math.nan,.9)),(.9,(-math.inf,math.inf)),(2.,(-1.,2.))]:
        axes=fixture(ns,tr,Axes,minpos=minpos)
        setters.append(dict(minpos=minpos,bounds=bounds,result=observe(ns,lambda:axes.xaxis._set_lim(*bounds,emit=False,auto=False))))
    margins=[]
    for mode in ['data','round_numbers']:
        ns['mpl'].rcParams['axes.autolimit_mode']=mode
        for minpos,data in [(.01,(-1.,2.)),(.9,(-1.,2.)),(1.,(-1.,2.)),(2.,(-1.,2.)),(0.,(-1.,2.)),(-.1,(-1.,2.)),(math.inf,(-1.,2.)),(.2,(.2,.8)),(.2,(.2,.2)),(2.,(2.,3.))]:
            axes=fixture(ns,tr,Axes,data=data,minpos=minpos)
            result=trace_pipeline(path,ns,lambda:(axes.autoscale_view(scaley=False),axes.get_xlim())[1])
            margins.append(dict(mode=mode,minpos=minpos,data=data,margin=.05,result=result))
    ns['mpl'].rcParams['axes.autolimit_mode']='data'
    shared_margins=[]
    for owner in ['first','second']:
        first=fixture(ns,tr,Axes,data=(-1.,2.),minpos=.1,label='first')
        second=fixture(ns,tr,Axes,data=(-2.,3.),minpos=.01,label='second')
        group=ns['Grouper']();group.join(second,first)
        first._shared_axes['x']=second._shared_axes['x']=group
        second.xaxis.major=first.xaxis.major
        active=cls(nbins=4);(first if owner=='first' else second).xaxis.set_major_locator(active)
        shared_margins.append(dict(owner=owner,result=trace_pipeline(path,ns,lambda:(first.autoscale_view(scaley=False),first.get_xlim())[1])))
    aspects=[]
    for adjustable in ['box','datalim']:
        axes=fixture(ns,tr,Axes);axes.set_xlim((.01,.99));axes.set_ylim((.1,.9))
        axes.dataLim._points[:,1]=(.1,.9);axes.dataLim._minpos[1]=.1
        axes._box_aspect,axes._adjustable,axes.aspect=None,adjustable,1.
        axes.apply_aspect()
        aspects.append(dict(adjustable=adjustable,position=axes.active_position.bounds,view=[*axes.get_xlim(),*axes.get_ylim()]))
    owners=[];shared=[]
    for name in ['x','y']:
        a,b=fixture(ns,tr,Axes,label='first'),fixture(ns,tr,Axes,label='second')
        getattr(a,'set_'+name+'lim')((.01,.99));getattr(b,'set_'+name+'lim')((.2,.8))
        locator=cls(nbins=4);a._axis_map[name].set_major_locator(locator)
        first=observe(ns,locator);outside=copy.copy(locator);b._axis_map[name].set_major_locator(locator)
        second=observe(ns,locator);getattr(b,'set_'+name+'lim')((.45,.55))
        owners.append(dict(name=name,stages=[first,second,observe(ns,locator),observe(ns,outside)]))
        a,b=fixture(ns,tr,Axes,label='first'),fixture(ns,tr,Axes,label='second')
        for axes in [a,b]:getattr(axes,'set_'+name+'lim')((.01,.99))
        aa,bb=a._axis_map[name],b._axis_map[name];bb.major,bb.minor=aa.major,aa.minor
        group=ns['Grouper']();group.join(b,a);a._shared_axes[name]=b._shared_axes[name]=group
        major,minor=cls(nbins=4),cls(True,nbins=4);bb.set_major_locator(major);bb.set_minor_locator(minor)
        extmajor,extminor=copy.copy(major),copy.copy(minor)
        before=[observe(ns,major),observe(ns,minor)]
        figure=ns['FigureBase']();figure._axobservers=types.SimpleNamespace(process=lambda *args:None)
        figure._root_figure=types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda *args:None))
        figure._remove_axes(b,owners=[[a,b]])
        after=[observe(ns,major),observe(ns,minor)];getattr(b,'set_'+name+'lim')((.2,.8))
        shared.append(dict(name=name,before=before,after=after,outside=[observe(ns,extmajor),observe(ns,extminor)]))
    secondary=[]
    for name in ['x','y']:
        for valid in [False,True]:
            parent=fixture(ns,tr,Axes);getattr(parent,'set_'+name+'lim')((.01,.49) if valid else (.01,.99))
            child=Secondary(parent,name);child.label='secondary';child.dataLim=tr['Bbox'].null()
            if valid:
                child._functions=(lambda v:2*v,lambda v:v/2);child._parentscale=None;child._set_scale();child._set_lims()
            axis=child._axis;major,minor=cls(nbins=4),cls(True,nbins=4);axis.set_major_locator(major);axis.set_minor_locator(minor)
            secondary.append(dict(name=name,valid=valid,own_view=axis.get_view_interval(),own_scale=axis.get_scale(),own_minpos=axis.get_minpos(),
                major=observe(ns,major),minor=observe(ns,minor),filtered=observe(ns,axis.get_minorticklocs)))
    physical=[];ref=physical_load(path)
    for horizontal in [True,False]:
        for length in [0.,120.,1200.]:
            axis=context(ref,length,horizontal,bounds=(1e-9,1-1e-9));raw=axis.get_tick_space();axis.get_minpos=lambda:.01
            locator=cls();locator.set_axis(axis)
            physical.append(dict(horizontal=horizontal,length=length,source_space=raw,result=observe(ns,locator)))
    layout=[];invalid_other_axis_layout=[]
    for horizontal in [True,False]:
        axes=fixture(ns,tr,Axes);name='x' if horizontal else 'y';getattr(axes,'set_'+name+'lim')((.01,.99))
        values=np.array([.01,.1,.25,.5,.75,.9,.99])
        points=np.column_stack((values,np.ones(len(values)))) if horizontal else np.column_stack((np.ones(len(values)),values))
        start,length=(40.,400.) if horizontal else (60.,300.)
        invalid_display=(axes._xaxis_transform if horizontal else axes._yaxis_transform).transform(points)[:,0 if horizontal else 1]
        invalid_other_axis_layout.append(dict(horizontal=horizontal,view=list(getattr(axes,'get_'+name+'lim')()),other_view=(0.,1.),values=values.tolist(),normalized=((invalid_display-start)/length).tolist()))
        axes.set_xlim((.01,.99));axes.set_ylim((.01,.99))
        display=(axes._xaxis_transform if horizontal else axes._yaxis_transform).transform(points)[:,0 if horizontal else 1]
        layout.append(dict(horizontal=horizontal,values=values.tolist(),normalized=((display-start)/length).tolist()))
    source_only=dict(scope='Actual source tight lifecycle and out-of-domain clipped Path are evidence only; not declared in-domain SVG/full-tight parity.')
    source_only['invalid_other_axis_layout']=invalid_other_axis_layout
    source_only['tight']=[]
    for mode in ['mask','clip']:
        for minpos in [2.,-.1]:
            axes=fixture(ns,tr,Axes,data=(-1.,2.),minpos=minpos,mode=mode);axes._tight=True
            source_only['tight'].append(dict(mode=mode,minpos=minpos,result=observe(ns,lambda:(axes.autoscale_view(scaley=False),axes.get_xlim())[1])))
    class PathSink:
        def __init__(self,vertices,codes=None,*args):self.vertices=np.asarray(vertices);self.codes=codes
        @staticmethod
        def _fast_from_codes_and_verts(vertices,codes,*args):return PathSink(vertices,codes)
    tr['Transform'].transform_path_non_affine.__globals__['Path']=PathSink
    source_only['paths']=[]
    for mode in ['mask','clip']:
        axes=fixture(ns,tr,Axes,mode=mode);axes.set_yscale('linear')
        vertices=[[-1.,0.],[0.,0.],[.5,0.],[1.,0.],[2.,0.]]
        source_only['paths'].append(dict(mode=mode,vertices=vertices,result=axes.transScale.transform_path_non_affine(PathSink(vertices)).vertices.tolist()))
    source_hashes={**HASHES,'font_manager.py':hashlib.sha256(path.with_name('font_manager.py').read_bytes()).hexdigest()}
    return dict(source_hashes=source_hashes,scope='Complete original Logit/Scale/Transform/Axis/Secondary/Grouper/removal and autoscale→set_bound→Axis._set_lim bodies; numeric Bbox/minpos storage, identity units, formatter/GUI/affine sinks. No installed Matplotlib renderer/default lifecycle.',
        geometry_profile='Relative1e-12 without absolute floor, NaN/Inf/zero sign explicit; raw named locator arrays strict bits. No off-domain path or full tight lifecycle parity claim.',
        geometry=geometry,constructors=constructors,limits=limits,axis=axis_rows,overlap=overlap,setters=setters,margins=margins,shared_margins=shared_margins,aspects=aspects,owners=owners,shared=shared,secondary=secondary,physical=physical,layout=layout,source_only=source_only)


def locator(minor=False,nbins=4):
    return '@ticker.LogitLocator::new(minor='+str(minor).lower()+(', nbins=Some(@ticker.MaxNBins::Count('+str(nbins)+'))' if nbins is not None else '')+')'


def generated_scale(payload):
    code='// Original complete Logit/Logistic transform and actual Scale range restriction.\n\n'+numbers_helper('verify_logit_scale_source')
    for index,row in enumerate(payload['geometry']):
        code+=f'\n///|\ntest "Logit original geometry {index}" {{\n  let scale = @scale.logit_scale(nonpositive='+moon(row['mode'])+')\n  verify_logit_scale_source('+arr(row['values'])+'.map(value => scale.'+row['direction']+'(value)), '+arr(row['result'])+')\n}\n'
    for index,row in enumerate(payload['constructors']):
        code+=f'\n///|\ntest "Logit original mode validation {index}" {{\n  assert_true(try {{ ignore(@scale.logit_scale(nonpositive='+moon(row['mode'])+')); false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })\n}\n'
    for index,row in enumerate(payload['limits']):
        scale={'linear':'@scale.linear_scale()','log':'@scale.log_scale()','symlog':'@scale.symlog_scale(linthresh=2.0)','asinh':'@scale.asinh_scale()','logit':'@scale.logit_scale()'}[row['scale']]
        code+=f'\n///|\ntest "Logit original actual Scale limiter {index}: '+row['scale']+'" {\n  let scale = '+scale+'\n  let actual = scale.limit_range_for_scale(-1.0, 2.0, '+num(row['minpos'])+')\n  verify_logit_scale_source([actual.0, actual.1], '+arr(row['result'])+')\n}\n'
    return formatted(code)


def generated_scene(payload):
    code='// Original Axis raw neighbors, actual-transform overlap, source setters and owner binding.\n\n'+numbers_helper('verify_logit_axis_source',strict=True)
    for index,row in enumerate(payload['axis']):
        code+=f'\n///|\ntest "Logit original Axis raw minor and transformed overlap {index}" {{\n  let axis = @axis.axis()\n  axis.set_scale(@scale.logit_scale(nonpositive='+moon(row['mode'])+'))\n  axis.bind_minpos(() => 0.01)\n  let view = @core.limits('+', '.join(num(v) for v in row['view'])+')\n  axis.set_limits(view.lower(), view.upper())\n  axis.set_locator(@ticker.FixedLocator::new('+arr(row['majors'])+').as_locator())\n  let minor = '+locator(True)+'\n  axis.set_minor_locator(minor.as_minor_locator())\n  axis.set_minor_overlap_removal('+str(row['overlap']).lower()+')\n  verify_logit_axis_source(minor.call(), '+arr(row['raw']['values'])+')\n  verify_logit_axis_source(axis.minor_tick_values_checked(view), '+arr(row['filtered']['values'])+')\n}\n'
    for index,row in enumerate(payload['overlap']):
        code+=f'\n///|\ntest "Logit original fixed raw minor mask clip overlap {index}" {{\n  let axis = @axis.axis()\n  axis.set_scale(@scale.logit_scale(nonpositive='+moon(row['mode'])+'))\n  let view = @core.limits('+', '.join(num(v) for v in row['view'])+')\n  axis.set_limits(view.lower(), view.upper())\n  axis.set_locator(@ticker.FixedLocator::new('+arr(row['majors'])+').as_locator())\n  axis.set_minor_locator(@ticker.FixedLocator::new('+arr(row['minors'])+').as_minor_locator())\n  verify_logit_axis_source(axis.minor_tick_values_checked(view), '+arr(row['filtered']['values'])+')\n}\n'
    for index,row in enumerate(payload['setters']):
        code+=f'\n///|\ntest "Logit original explicit source limit clamp {index}" {{\n  let axis = @axis.axis()\n  axis.set_scale(@scale.logit_scale())\n  axis.bind_minpos(() => '+num(row['minpos'])+')\n  axis.set_locator('+locator() +'.as_locator())\n'
        expression='axis.set_limits('+', '.join(num(v) for v in row['bounds'])+')'
        if row['result']['error']:
            code+='  assert_true(try { '+expression+'; false } catch { @core.DataError::NonFiniteLimit(..) => true; _ => false })\n'
            code+='  assert_true(try { axis.set_view_limits('+', '.join(num(v) for v in row['bounds'])+'); false } catch { @core.DataError::NonFiniteLimit(..) => true; _ => false })\n'
        else:
            code+='  '+expression+'\n  let actual = axis.limits().unwrap()\n  verify_logit_axis_source([actual.lower(), actual.upper()], '+arr(row['result']['values'])+')\n'
            code+='  axis.clear_limits()\n  axis.set_view_limits('+', '.join(num(v) for v in row['bounds'])+')\n  let provisional = axis.current_view_limits().unwrap()\n  verify_logit_axis_source([provisional.lower(), provisional.upper()], '+arr(row['result']['values'])+')\n'
        code+='}\n'
    for row in payload['owners']:
        code+='\n///|\ntest "Logit original last owner and independent copy '+row['name']+'" {\n  let first = @axis.axis()\n  let second = @axis.axis()\n  first.set_limits(0.01, 0.99)\n  second.set_limits(0.2, 0.8)\n  first.bind_minpos(() => 0.01)\n  second.bind_minpos(() => 0.01)\n  let locator = '+locator()+'\n  first.set_locator(locator.as_locator())\n  verify_logit_axis_source(locator.call(), '+arr(row['stages'][0]['values'])+')\n  let external = locator.copy()\n  second.set_locator(locator.as_locator())\n  verify_logit_axis_source(locator.call(), '+arr(row['stages'][1]['values'])+')\n  second.set_limits(0.45, 0.55)\n  verify_logit_axis_source(locator.call(), '+arr(row['stages'][2]['values'])+')\n  verify_logit_axis_source(external.call(), '+arr(row['stages'][3]['values'])+')\n}\n'
    for row in payload['shared']:
        name=row['name'];code+='\n///|\ntest "Logit original shared removal copies retain detached owner '+name+'" {\n  let figure = @scene.figure()\n  let axes = figure.subplots(1, 2, share_'+name+'=true)\n  axes[0].set_'+name+'_limits(0.01, 0.99)\n  let major = '+locator()+'\n  let minor = '+locator(True)+'\n  axes[1].set_'+name+'_locator(major.as_locator())\n  axes[1].set_'+name+'_minor_locator(minor.as_minor_locator())\n'
        for index,active in enumerate(['major','minor']):code+='  verify_logit_axis_source('+active+'.call(), '+arr(row['before'][index]['values'])+')\n'
        code+='  let external_major = major.copy()\n  let external_minor = minor.copy()\n  axes[1].remove()\n'
        for index,active in enumerate(['major','minor']):code+='  verify_logit_axis_source('+active+'.call(), '+arr(row['after'][index]['values'])+')\n'
        code+='  axes[1].set_'+name+'_limits(0.2, 0.8)\n'
        for index,active in enumerate(['external_major','external_minor']):code+='  verify_logit_axis_source('+active+'.call(), '+arr(row['outside'][index]['values'])+')\n'
        code+='}\n'
    for index,row in enumerate(payload['secondary']):
        name=row['name'];bounds=(.01,.49) if row['valid'] else (.01,.99)
        code+=f'\n///|\ntest "Logit original secondary own function view and empty minpos {index}" {{\n  let figure = @scene.figure()\n  let axes = figure.axes()\n  axes.set_'+name+'_scale(@scale.logit_scale())\n  axes.set_'+name+'_limits('+', '.join(num(v) for v in bounds)+')\n'
        code+='  let secondary = axes.secondary_'+name+'axis('+('value => value * 2.0, value => value / 2.0' if row['valid'] else 'value => value * 2.0 + 5.0, value => (value - 5.0) / 2.0')+')\n  let major = '+locator()+'\n  let minor = '+locator(True)+'\n  secondary.set_locator(major.as_locator())\n  secondary.set_minor_locator(minor.as_minor_locator())\n  verify_logit_axis_source(major.call(), '+arr(row['major']['values'])+')\n  verify_logit_axis_source(minor.call(), '+arr(row['minor']['values'])+')\n  verify_logit_axis_source(secondary.minor_tick_values_checked(), '+arr(row['filtered']['values'])+')\n}\n'
    for index,row in enumerate(payload['physical']):
        code+=f'\n///|\ntest "Logit original physical budget is not MaxN clipped {index}" {{\n  let axis = @axis.axis()\n  axis.set_tick_layout('+num(row['length'])+', '+str(row['horizontal']).lower()+')\n  axis.set_limits(1.0e-9, 0.999999999)\n  axis.bind_minpos(() => 0.01)\n  let locator = '+locator(nbins=None)+'\n  axis.set_locator(locator.as_locator())\n  assert_eq(locator.as_maxn_locator().tick_space_provider().unwrap()(), '+num(row['source_space'])+')\n  verify_logit_axis_source(locator.call(), '+arr(row['result']['values'])+')\n}\n'
    return formatted(code)


def panel(artist,xmargin=.05):
    return '@render.panel_with_sharing(None, ['+artist+'], None, [], None, x, y, None, None, false, [], [], x_margin='+num(xmargin)+', y_margin=0.0)'


def generated_backend(payload):
    code='// Original autoscale→set_bound→Axis._set_lim, real Scale and fixed Bbox position.\n\n'+numbers_helper('verify_logit_display_source')
    for index,row in enumerate(payload['axis']):
        code+=f'\n///|\ntest "Logit original transformed primary visibility {index}" {{\n  let scale = @ticker_scale.logit_scale(nonpositive='+moon(row['mode'])+')\n'
        for key,values in [('major',row['majors']),('minor',row['filtered']['values'])]:
            code+='  let '+key+' = '+arr(values)+'.filter(value => tick_in_view(value, scale, '+', '.join(num(v) for v in row['view'])+'))\n  assert_eq('+key+', '+arr(row['visible_'+key])+')\n'
        code+='}\n'
    for index,row in enumerate(payload['margins']):
        code+=f'\n///|\ntest "Logit original complete non tight autoscale profile {index}" {{\n  let previous = @config.axes_autolimit_mode()\n  defer @config.set_axes_autolimit_mode(previous)\n  @config.set_axes_autolimit_mode('+moon(row['mode'])+')\n  let x = @axis.axis()\n  let y = @axis.axis()\n  x.set_scale(@ticker_scale.logit_scale())\n  x.bind_minpos(() => '+num(row['minpos'])+')\n  x.bind_shared_minpos(() => ['+num(row['minpos'])+'])\n  x.set_tick_layout(120.0, true)\n  x.set_locator('+locator(nbins=None)+'.as_locator())\n  y.set_limits(0.0, 1.0)\n'
        points='@render.Artist::Line([@core.point('+num(row['data'][0])+', 0.0), @core.point('+num(row['data'][1])+', 1.0)], @core.style("red"))'
        code+='  let panel = '+panel(points)+'\n  let actual = compute_scale(@render.figure(400, 300, 0, [panel], [], None), 0)\n  verify_logit_display_source([actual.xmin, actual.xmax], '+arr(row['result']['values'])+')\n}\n'
    for index,row in enumerate(payload['layout']):
        code+=f'\n///|\ntest "Logit original primary fixed bbox positions {index}" {{\n  let scale : Scale = {{ xmin: 0.01, xmax: 0.99, ymin: 0.01, ymax: 0.99, x_axis_scale: @ticker_scale.logit_scale(), y_axis_scale: @ticker_scale.logit_scale() }}\n'
        expression='map_x(scale, 40.0, 400.0, value)' if row['horizontal'] else 'map_y(scale, 60.0, 300.0, value)'
        expected=[40+400*v if row['horizontal'] else 60+300*(1-v) for v in row['normalized']]
        code+='  verify_logit_display_source('+arr(row['values'])+'.map(value => '+expression+'), '+arr(expected)+')\n}\n'
    for index,row in enumerate(payload['shared_margins']):
        code+=f'\n///|\ntest "Logit original owner minpos differs from requesting Axis scale minpos {index}" {{\n  let previous = @config.axes_autolimit_mode()\n  defer @config.set_axes_autolimit_mode(previous)\n  @config.set_axes_autolimit_mode("data")\n  let x = @axis.axis()\n  let y = @axis.axis()\n  x.set_scale(@ticker_scale.logit_scale())\n  x.bind_minpos(() => 0.1)\n  x.bind_shared_minpos(() => [0.1, 0.01])\n  y.set_limits(0.0, 1.0)\n  let locator = '+locator()+'\n  x.set_locator(locator.as_locator())\n'
        if row['owner']=='second':
            code+='  let owner = @axis.axis()\n  owner.bind_minpos(() => 0.01)\n  owner.set_locator(locator.as_locator())\n'
        points='@render.Artist::Line([@core.point(-2.0, 0.0), @core.point(3.0, 1.0)], @core.style("red"))'
        code+='  let panel = '+panel(points)+'\n  let actual = compute_scale(@render.figure(400, 300, 0, [panel], [], None), 0)\n  verify_logit_display_source([actual.xmin, actual.xmax], '+arr(row['result']['values'])+')\n}\n'
    for index,row in enumerate(payload['aspects']):
        code+=f'\n///|\ntest "Logit original full apply aspect {index}: '+row['adjustable']+'" {\n  let x = @axis.axis()\n  let y = @axis.axis()\n  x.set_scale(@ticker_scale.logit_scale())\n  y.set_scale(@ticker_scale.logit_scale())\n  x.set_limits(0.01, 0.99)\n  y.set_limits(0.1, 0.9)\n  let panel = @render.panel_with_sharing(None, [@render.Artist::Line([@core.point(0.01, 0.1), @core.point(0.99, 0.9)], @core.style("red"))], None, [], None, x, y, None, None, false, [], [], x_margin=0.0, y_margin=0.0, aspect=1.0, adjustable='+moon(row['adjustable'])+')\n  let figure = @render.figure(400, 300, 0, [panel], [], None)\n  let actual = resolve_panel_scale(figure, 0)\n  verify_logit_display_source([actual.xmin, actual.xmax, actual.ymin, actual.ymax], '+arr(row['view'])+')\n  let rect = positioned_panel_rect(figure, panel, actual)\n'
        p=row['position'];expected=[400*p[0],300*(1-p[1]-p[3]),400*p[2],300*p[3]]
        code+='  verify_logit_display_source([rect.0, rect.1, rect.2, rect.3], '+arr(expected)+')\n}\n'
    return formatted(code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings(),np.errstate(all='ignore'):
        warnings.simplefilter('ignore',RuntimeWarning);payload=generate(args.ticker)
    outputs={ROOT/'testdata/logit_axis_reference.json':json.dumps(clean(payload),indent=2,allow_nan=False)+'\n',
        ROOT/'ticker/scale/logit_reference_test.mbt':generated_scale(payload),ROOT/'scene/logit_axis_reference_test.mbt':generated_scene(payload),
        ROOT/'backend/svg/logit_locator_reference_wbtest.mbt':generated_backend(payload)}
    for output,content in outputs.items():
        if args.check:
            if not output.exists() or output.read_text()!=content:raise SystemExit('reference differs: '+str(output))
        else:output.write_text(content)
    print('Logit axis profile counts:',{key:len(value) for key,value in payload.items() if isinstance(value,list)},'generated',sum(content.count('\ntest ') for output,content in outputs.items() if output.suffix=='.mbt'))


if __name__=='__main__':main()
