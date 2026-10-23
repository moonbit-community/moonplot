"""Pinned complete Asinh/Axis/transform geometry, margins and aspect evidence.

The committed D25 loader executes original locator/Axis/Transform bodies. This
adds complete Asinh classes and original autoscale/aspect methods. The fixture
supplies known Bboxes, identity units and GUI/formatter/storage sinks, never a
copy of the axis, locator, autoscale or aspect algorithms.
"""
from pathlib import Path
import argparse
import ast
import copy
import hashlib
import json
import math
import types
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_symlog_axis_reference import load as load_sym, numbers_helper, num, arr
from generate_null_axis_reference import observe, clean
from generate_log_axis_reference import HASHES

ROOT = Path(__file__).resolve().parents[1]


def load(path):
    ns, transforms, Axes, Secondary = load_sym(path)
    root = path.parent
    trees = {name: ast.parse((root/name).read_text()) for name in ['ticker.py','scale.py','axes/_base.py']}

    def original(filename, name, method=None):
        body = next(n for n in trees[filename].body if isinstance(n,(ast.ClassDef,ast.FunctionDef)) and n.name==name)
        if method: body = next(n for n in body.body if isinstance(n,ast.FunctionDef) and n.name==method)
        exec(compile(ast.Module(body=[body],type_ignores=[]),str(root/filename),'exec'),ns)
        return ns[method or name]

    original('ticker.py','AsinhLocator')
    for name in ['AsinhTransform','InvertedAsinhTransform','AsinhScale']: original('scale.py',name)
    ns['_scale_mapping']['asinh'] = ns['AsinhScale']
    ns['_scale_has_axis_parameter']['asinh'] = True
    axis_type = type(Axes().xaxis)
    def set_properties(axis,**values):
        for name,value in values.items(): getattr(axis,'set_'+name)(value)
    axis_type.set = set_properties
    axis_type.convert_units = lambda self,value: value
    axis_type._get_autoscale_on = lambda self: True
    axis_type._set_autoscale_on = lambda self,value: None
    axis_type.get_minpos = lambda self: self.axes.dataLim.minposx if self.axis_name=='x' else self.axes.dataLim.minposy
    def set_view_interval(axis,first,last,**kwargs):
        if axis.axis_name=='x': axis.axes._viewLim.intervalx = (first,last)
        else: axis.axes._viewLim.intervaly = (first,last)
    axis_type.set_view_interval = set_view_interval
    for name in ['autoscale_view','set_xbound','set_ybound','_validate_converted_limits','get_data_ratio','apply_aspect']:
        setattr(Axes,name,original('axes/_base.py','_AxesBase',name))
    Axes.get_xbound = lambda self: tuple(sorted(self.get_xlim()))
    Axes.get_ybound = lambda self: tuple(sorted(self.get_ylim()))
    Axes.xaxis_inverted = lambda self: self.get_xlim()[0]>self.get_xlim()[1]
    Axes.yaxis_inverted = lambda self: self.get_ylim()[0]>self.get_ylim()[1]
    Axes.get_autoscalex_on = lambda self: True
    Axes.get_autoscaley_on = lambda self: True
    Axes.get_xscale = lambda self: self.xaxis.get_scale()
    Axes.get_yscale = lambda self: self.yaxis.get_scale()
    Axes._get_data_children = lambda self: []
    Axes._process_unit_info = lambda self,values,*args,**kwargs: [row[1] for row in values]
    Axes.get_figure = lambda self,**kwargs: types.SimpleNamespace(transSubfigure=transforms['Affine2D']().scale(400.,300.))
    Axes.get_position = lambda self,**kwargs: transforms['Bbox'].from_bounds(0.,0.,1.,1.)
    Axes.get_aspect = lambda self: self.aspect
    Axes.get_anchor = lambda self: 'C'
    Axes._set_position = lambda self,bbox,*args,**kwargs: setattr(self,'active_position',bbox)
    def explicit_x(self,values,**kwargs):
        return self.xaxis._set_lim(*values,emit=False,auto=kwargs.get('auto',False))
    def explicit_y(self,values,**kwargs):
        return self.yaxis._set_lim(*values,emit=False,auto=kwargs.get('auto',False))
    # Secondary keeps the existing already-valid numeric storage sinks; its own
    # source setup is independent of this autoscale fixture's final setter.
    ns['asinh_set_xlim_checked'],ns['asinh_set_ylim_checked'] = explicit_x,explicit_y
    return ns,transforms,Axes,Secondary


def autoscale_fixture(ns,transforms,Axes,width,data,margin):
    axes = Axes()
    axes.set_xscale('asinh',linear_width=width)
    axes.set_yscale('linear')
    axes.dataLim = transforms['Bbox'].from_extents(data[0],0.,data[1],1.)
    axes._tight,axes._xmargin,axes._ymargin = False,margin,0.
    axes.use_sticky_edges = True
    axes._stale_viewlims = {'x':False,'y':False}
    axes.callbacks = types.SimpleNamespace(process=lambda *args:None)
    axes._request_autoscale_view = lambda *args,**kwargs:None
    axes.set_xlim = types.MethodType(ns['asinh_set_xlim_checked'],axes)
    axes.set_ylim = types.MethodType(ns['asinh_set_ylim_checked'],axes)
    axes.xaxis.set_major_locator(ns['AsinhLocator'](1.))
    return axes


def generate(path):
    ns,transforms,Axes,Secondary = load(path)
    cls = ns['AsinhLocator']
    profiles = []
    values = [-math.inf,-1e308,-100.,-1.,-5e-324,-0.,0.,5e-324,1.,100.,1e308,math.inf,math.nan]
    for width in [0.,-0.,-1.,-math.inf,math.nan,math.inf,1e-308,1.,2.,1e308]:
        try:
            transform = ns['AsinhTransform'](width)
            for inverse in [False,True]:
                active = transform.inverted() if inverse else transform
                profiles.append(dict(width=width,inverse=inverse,values=values,result=active.transform(values).tolist(),error=None))
        except ValueError as exc:
            profiles.append(dict(width=width,error=type(exc).__name__,message=str(exc)))

    axis_rows = []
    specs = [
        ('linear comparison','linear',1.,(-100.,100.),[100.005],None,True),
        ('actual asinh transformed overlap','asinh',1.,(-100.,100.),[100.005],None,True),
        ('negative positive default minors','asinh',1.,(-100.,100.),[-100.,-10.,-1.,0.,1.,10.,100.],(2,5),True),
        ('raw overlap disabled','asinh',1.,(-100.,100.),[-100.,-10.,-1.,0.,1.,10.,100.],(2,5),False),
        ('reversed view retains source set ordering','asinh',1.,(100.,-100.),[100.,0.,-100.],(2,5),True),
        ('axis width independent of locator width','asinh',2.,(-100.,100.),[100.005],None,True),
        ('narrow view and zero','asinh',1.,(-.5,.5),[0.],(2,5),True),
        ('positive asymmetric view','asinh',1.,(1.,100.),[1.,10.,100.],(2,5),True),
    ]
    for label,scale,width,view,majors,subs,overlap in specs:
        axes = Axes()
        axes.set_xscale(scale,**({'linear_width':width} if scale=='asinh' else {}))
        axes.set_xlim(view)
        axis = axes.xaxis
        axis.set_major_locator(ns['FixedLocator'](majors))
        minor = cls(1.,subs=subs)
        axis.set_minor_locator(minor)
        axis.remove_overlapping_locs = overlap
        raw,filtered = observe(ns,minor),observe(ns,axis.get_minorticklocs)
        visible = axis._update_ticks()
        axis_rows.append(dict(label=label,scale=scale,width=width,view=view,majors=majors,subs=subs,overlap=overlap,
            raw=raw,filtered=filtered,visible_major=[t.value for t in visible if t.kind=='major'],visible_minor=[t.value for t in visible if t.kind=='minor']))

    ranges = []
    bad = cls(math.nan,numticks='bad',base=math.nan)
    for mode in ['data','round_numbers']:
        ns['mpl'].rcParams['axes.autolimit_mode']=mode
        for bounds in [(0.,0.),(1.,1.),(10.,-10.),(math.nan,math.inf)]:
            ranges.append(dict(mode=mode,bounds=bounds,view=observe(ns,lambda:bad.view_limits(*bounds)),nonsingular=observe(ns,lambda:bad.nonsingular(*bounds))))
    ns['mpl'].rcParams['axes.autolimit_mode']='data'

    owners = []
    shared = []
    for name in ['x','y']:
        a,b = Axes(label='first'),Axes(label='second')
        getattr(a,'set_'+name+'lim')((-100.,100.));getattr(b,'set_'+name+'lim')((-.5,.5))
        locator = cls(1.)
        a._axis_map[name].set_major_locator(locator)
        first=observe(ns,locator);outside=copy.copy(locator)
        b._axis_map[name].set_major_locator(locator)
        second=observe(ns,locator)
        getattr(b,'set_'+name+'lim')((-10.,10.))
        owners.append(dict(name=name,stages=[first,second,observe(ns,locator),observe(ns,outside)]))
        a,b = Axes(label='first'),Axes(label='second')
        for axes in [a,b]:getattr(axes,'set_'+name+'lim')((-100.,100.))
        aa,bb=a._axis_map[name],b._axis_map[name]
        bb.major,bb.minor=aa.major,aa.minor
        group=ns['Grouper']();group.join(b,a)
        a._shared_axes[name]=b._shared_axes[name]=group
        major,minor=cls(1.),cls(1.,subs=(2,5))
        bb.set_major_locator(major);bb.set_minor_locator(minor)
        extmajor,extminor=copy.copy(major),copy.copy(minor)
        before=[observe(ns,major),observe(ns,minor)]
        figure=ns['FigureBase']()
        figure._axobservers=types.SimpleNamespace(process=lambda *args:None)
        figure._root_figure=types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda *args:None))
        figure._remove_axes(b,owners=[[a,b]])
        after=[observe(ns,major),observe(ns,minor)]
        getattr(b,'set_'+name+'lim')((-.5,.5))
        shared.append(dict(name=name,before=before,after=after,outside=[observe(ns,extmajor),observe(ns,extminor)]))

    secondary=[]
    for name in ['x','y']:
        parent=Axes();getattr(parent,'set_'+name+'scale')('asinh');getattr(parent,'set_'+name+'lim')((-100.,100.))
        child=Secondary(parent,name);axis=child._axis
        major,minor=cls(1.),cls(1.,subs=(2,5))
        axis.set_major_locator(major);axis.set_minor_locator(minor)
        rawmajor,rawminor,filtered=observe(ns,major),observe(ns,minor),observe(ns,axis.get_minorticklocs)
        values=np.array([-215.,-195.,-95.,5.,105.,205.,225.])
        axis.set_major_locator(ns['FixedLocator'](values));axis.set_minor_locator(ns['NullLocator']())
        visible=[t.value for t in axis._update_ticks()]
        points=np.column_stack((values,np.ones(len(values)))) if name=='x' else np.column_stack((np.ones(len(values)),values))
        direction=0 if name=='x' else 1
        display=(child._xaxis_transform if name=='x' else child._yaxis_transform).transform(points)[:,direction]
        start,length=(40.,400.) if name=='x' else (60.,300.)
        secondary.append(dict(name=name,own_view=axis.get_view_interval(),own_scale=axis.get_scale(),raw_major=rawmajor,raw_minor=rawminor,filtered=filtered,
            values=values.tolist(),visible=visible,normalized=((display-start)/length).tolist()))

    margins=[]
    for width,data,margin in [(1.,(-100.,100.),.05),(2.,(-1.,100.),.1),(1.,(5.,5.),.05),(1e-308,(-1.,1.),.0),(math.nan,(1.,2.),.05),(math.inf,(1.,2.),.05)]:
        axes=autoscale_fixture(ns,transforms,Axes,width,data,margin)
        result=observe(ns,lambda: (axes.autoscale_view(scalex=True,scaley=False),axes.get_xlim())[1])
        if result['error']=='AttributeError': raise RuntimeError('incomplete autoscale fixture')
        margins.append(dict(width=width,data=data,margin=margin,result=result))

    aspects=[]
    for adjustable in ['box','datalim']:
        for width,aspect in [(1.,1.),(2.,2.)]:
            axes=autoscale_fixture(ns,transforms,Axes,width,(-100.,100.),0.)
            axes.set_xlim((-100.,100.));axes.set_ylim((-1.,1.))
            axes._box_aspect,axes._adjustable,axes.aspect=None,adjustable,aspect
            axes.apply_aspect()
            aspects.append(dict(width=width,aspect=aspect,adjustable=adjustable,
                position=axes.active_position.bounds,view=[*axes.get_xlim(),*axes.get_ylim()]))

    layout=[]
    for width in [1.,2.]:
        axes=Axes();axes.set_xscale('asinh',linear_width=width);axes.set_xlim((-100.,100.))
        values=np.array([-100.,-1.,-0.,0.,1.,100.])
        display=axes._xaxis_transform.transform(np.column_stack((values,np.ones(len(values)))))[:,0]
        layout.append(dict(width=width,values=values.tolist(),normalized=((display-40.)/400.).tolist()))

    return dict(source_hashes=HASHES,scope='Complete original Asinh/Transform/Axis/Secondary bodies, original autoscale_view→set_bound→Axis._set_lim, original get_data_ratio/apply_aspect. Known Bboxes/physical dimensions; identity units, formatter/tick/GUI and active-position sinks; no full default lifecycle or installed Matplotlib renderer.',
        geometry_assertions='relative1e-12 without absolute floor, zero signs and NaN/Inf explicit; direct common locator arrays strict bits. Portable locator full-collection source/math differences are separately covered by grid owner.',
        profiles=profiles,axis=axis_rows,ranges=ranges,owners=owners,shared=shared,secondary=secondary,margins=margins,aspects=aspects,layout=layout)


def locator(subs=None,width=1.):
    return '@ticker.AsinhLocator::new('+num(width)+(
        ', subs=Some(@ticker.AsinhSubs::Sequence('+arr(subs)+'))' if subs is not None else '')+')'


def generated_scale(payload):
    code='// Complete original AsinhTransform / InvertedAsinhTransform source observations.\n\n'+numbers_helper('verify_asinh_scale_source')
    for index,row in enumerate(payload['profiles']):
        code+=f'\n///|\ntest "Asinh original transform and constructor {index}" {{\n'
        if row['error']:
            code+='  assert_true(try { ignore(@scale.asinh_scale(linear_width='+num(row['width'])+')); false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })\n'
        else:
            code+='  let scale = @scale.asinh_scale(linear_width='+num(row['width'])+')\n  let actual = '+arr(row['values'])+'.map(value => scale.'+('inverse' if row['inverse'] else 'transform')+'(value))\n'
            code+='  verify_asinh_scale_source(actual, '+arr(row['result'])+')\n'
        code+='}\n'
    return formatted(code)


def generated_scene(payload):
    code='// Original AsinhLocator and actual Axis raw/view/overlap/owner source bodies.\n\n'+numbers_helper('verify_asinh_axis_source',strict=True)
    for index,row in enumerate(payload['axis']):
        code+=f'\n///|\ntest "Asinh original Axis raw order transformed overlap {index}: {row["label"]}" {{\n'
        code+='  let axis = @axis.axis()\n  axis.set_tick_layout(100.0, true)\n'
        if row['scale']=='asinh':code+='  axis.set_scale(@scale.asinh_scale(linear_width='+num(row['width'])+'))\n'
        code+='  let view = @core.limits('+', '.join(num(v) for v in row['view'])+')\n  axis.set_limits(view.lower(), view.upper())\n  axis.set_locator(@ticker.FixedLocator::new('+arr(row['majors'])+').as_locator())\n  let minor = '+locator(row['subs'])+'\n  axis.set_minor_locator(minor.as_minor_locator())\n  axis.set_minor_overlap_removal('+str(row['overlap']).lower()+')\n'
        code+='  verify_asinh_axis_source(minor.call(), '+arr(row['raw']['values'])+')\n  verify_asinh_axis_source(axis.minor_tick_values_checked(view), '+arr(row['filtered']['values'])+')\n  verify_asinh_axis_source(axis.tick_values_checked(view), '+arr(row['majors'])+')\n}\n'
    for index,row in enumerate(payload['ranges']):
        code+=f'\n///|\ntest "Asinh original Axis inherited pure range policy {index}" {{\n'
        code+='  let previous = @config.axes_autolimit_mode()\n  defer @config.set_axes_autolimit_mode(previous)\n  @config.set_axes_autolimit_mode('+moon(row['mode'])+')\n  let axis = @axis.axis()\n  axis.set_locator(@ticker.AsinhLocator::new(0.0 / 0.0, numticks=Some(@ticker.LogNumTicks::Text("bad")), base=0.0 / 0.0).as_locator())\n  let bounds = @core.limits('+', '.join(num(v) for v in row['bounds'])+')\n'
        for key,expression in [('view','axis.view_limits_checked(bounds)'),('nonsingular','axis.numeric_nonsingular_bounds_checked(bounds.lower(), bounds.upper())')]:
            code+='  { let actual = '+expression+'; verify_asinh_axis_source([actual.lower(), actual.upper()], '+arr(row[key]['values'])+') }\n'
        code+='}\n'
    for row in payload['owners']:
        code+='\n///|\ntest "Asinh original last owner live view and shallow copy '+row['name']+'" {\n  let first = @axis.axis()\n  let second = @axis.axis()\n  first.set_limits(-100.0, 100.0)\n  second.set_limits(-0.5, 0.5)\n  let locator = '+locator()+'\n  first.set_locator(locator.as_locator())\n'
        code+='  verify_asinh_axis_source(locator.call(), '+arr(row['stages'][0]['values'])+')\n  let external = locator.copy()\n  second.set_locator(locator.as_locator())\n  verify_asinh_axis_source(locator.call(), '+arr(row['stages'][1]['values'])+')\n  second.set_limits(-10.0, 10.0)\n  verify_asinh_axis_source(locator.call(), '+arr(row['stages'][2]['values'])+')\n  verify_asinh_axis_source(external.call(), '+arr(row['stages'][3]['values'])+')\n}\n'
    for row in payload['shared']:
        name=row['name']
        code+='\n///|\ntest "Asinh original shared removal and independent detached copies '+name+'" {\n  let figure = @scene.figure()\n  let axes = figure.subplots(1, 2, share_'+name+'=true)\n  axes[0].set_'+name+'_limits(-100.0, 100.0)\n  let major = '+locator()+'\n  let minor = '+locator((2,5))+'\n  axes[1].set_'+name+'_locator(major.as_locator())\n  axes[1].set_'+name+'_minor_locator(minor.as_minor_locator())\n'
        for i,active in enumerate(['major','minor']):code+='  verify_asinh_axis_source('+active+'.call(), '+arr(row['before'][i]['values'])+')\n'
        code+='  let external_major = major.copy()\n  let external_minor = minor.copy()\n  axes[1].remove()\n'
        for i,active in enumerate(['major','minor']):code+='  verify_asinh_axis_source('+active+'.call(), '+arr(row['after'][i]['values'])+')\n'
        code+='  axes[1].set_'+name+'_limits(-0.5, 0.5)\n'
        for i,active in enumerate(['external_major','external_minor']):code+='  verify_asinh_axis_source('+active+'.call(), '+arr(row['outside'][i]['values'])+')\n'
        for i,active in enumerate(['major','minor']):code+='  verify_asinh_axis_source('+active+'.call(), '+arr(row['after'][i]['values'])+')\n'
        code+='}\n'
    for index,row in enumerate(payload['secondary']):
        name=row['name']
        code+=f'\n///|\ntest "Asinh original secondary own function view and raw overlap {index}" {{\n  let figure = @scene.figure()\n  let axes = figure.axes()\n  axes.set_'+name+'_scale(@scale.asinh_scale())\n  axes.set_'+name+'_limits(-100.0, 100.0)\n  let secondary = axes.secondary_'+name+'axis(value => value * 2.0 + 5.0, value => (value - 5.0) / 2.0)\n  // Match source host _set_lims before custom locator installation.\n  secondary.apply_aspect()\n  let major = '+locator()+'\n  let minor = '+locator((2,5))+'\n  secondary.set_locator(major.as_locator())\n  secondary.set_minor_locator(minor.as_minor_locator())\n'
        code+='  verify_asinh_axis_source(major.call(), '+arr(row['raw_major']['values'])+')\n  verify_asinh_axis_source(minor.call(), '+arr(row['raw_minor']['values'])+')\n  verify_asinh_axis_source(secondary.tick_values_checked(), '+arr(row['raw_major']['values'])+')\n  verify_asinh_axis_source(secondary.minor_tick_values_checked(), '+arr(row['filtered']['values'])+')\n}\n'
    return formatted(code)


def generated_backend(payload):
    code='// Original autoscale/full aspect methods and complete transform-tree geometry.\n\n'+numbers_helper('verify_asinh_display_source')
    for index,row in enumerate(payload['axis']):
        code+=f'\n///|\ntest "Asinh original transformed primary visibility {index}" {{\n'
        code+='  let scale = '+('@ticker_scale.asinh_scale(linear_width='+num(row['width'])+')' if row['scale']=='asinh' else '@ticker_scale.linear_scale()')+'\n'
        for key,values in [('major',row['majors']),('minor',row['filtered']['values'])]:
            code+='  let '+key+' = '+arr(values)+'.filter(value => tick_in_view(value, scale, '+', '.join(num(v) for v in row['view'])+'))\n  assert_eq('+key+', '+arr(row['visible_'+key])+')\n'
        code+='}\n'
    for index,row in enumerate(payload['margins']):
        code+=f'\n///|\ntest "Asinh original autoscale nonsingular margin view pipeline {index}" {{\n  let previous = @config.axes_autolimit_mode()\n  defer @config.set_axes_autolimit_mode(previous)\n  @config.set_axes_autolimit_mode("data")\n  let x = @axis.axis()\n  let y = @axis.axis()\n  x.set_scale(@ticker_scale.asinh_scale(linear_width='+num(row['width'])+'))\n  x.set_locator('+locator()+'.as_locator())\n  y.set_limits(0.0, 1.0)\n'
        code+='  let panel = @render.panel_with_sharing(None, [@render.Artist::Line([@core.point('+num(row['data'][0])+', 0.0), @core.point('+num(row['data'][1])+', 1.0)], @core.style("red"))], None, [], None, x, y, None, None, false, [], [], x_margin='+num(row['margin'])+', y_margin=0.0)\n  let actual = compute_scale(@render.figure(400, 300, 0, [panel], [], None), 0)\n'
        if row['result']['error']:raise ValueError('unexpected source autoscale error '+str(row))
        code+='  verify_asinh_display_source([actual.xmin, actual.xmax], '+arr(row['result']['values'])+')\n}\n'
    for index,row in enumerate(payload['aspects']):
        code+=f'\n///|\ntest "Asinh original full apply_aspect {index}: {row["adjustable"]}" {{\n  let x = @axis.axis()\n  let y = @axis.axis()\n  x.set_scale(@ticker_scale.asinh_scale(linear_width='+num(row['width'])+'))\n  x.set_limits(-100.0, 100.0)\n  y.set_limits(-1.0, 1.0)\n'
        code+='  let panel = @render.panel_with_sharing(None, [@render.Artist::Line([@core.point(-100.0, 0.0), @core.point(100.0, 1.0)], @core.style("red"))], None, [], None, x, y, None, None, false, [], [], x_margin=0.0, y_margin=0.0, aspect='+num(row['aspect'])+', adjustable='+moon(row['adjustable'])+')\n  let figure = @render.figure(400, 300, 0, [panel], [], None)\n  let actual = resolve_panel_scale(figure, 0)\n  verify_asinh_display_source([actual.xmin, actual.xmax, actual.ymin, actual.ymax], '+arr(row['view'])+')\n  let rect = positioned_panel_rect(figure, panel, actual)\n'
        p=row['position'];expected=[400.*p[0],300.*(1.-p[1]-p[3]),400.*p[2],300.*p[3]]
        code+='  verify_asinh_display_source([rect.0, rect.1, rect.2, rect.3], '+arr(expected)+')\n}\n'
    for index,row in enumerate(payload['layout']):
        code+=f'\n///|\ntest "Asinh original fixed bbox primary x and y display {index}" {{\n  let scale : Scale = {{ xmin: -100.0, xmax: 100.0, ymin: -100.0, ymax: 100.0, x_axis_scale: @ticker_scale.asinh_scale(linear_width='+num(row['width'])+'), y_axis_scale: @ticker_scale.asinh_scale(linear_width='+num(row['width'])+') }\n  let values = '+arr(row['values'])+'\n  verify_asinh_display_source(values.map(value => map_x(scale, 40.0, 400.0, value)), '+arr([40.+400.*v for v in row['normalized']])+')\n  verify_asinh_display_source(values.map(value => map_y(scale, 60.0, 300.0, value)), '+arr([60.+300.*(1.-v) for v in row['normalized']])+')\n}\n'
    for index,row in enumerate(payload['secondary']):
        horizontal=row['name']=='x'
        code+=f'\n///|\ntest "Asinh original secondary own function position and visibility {index}" {{\n  let scale : Scale = {{ xmin: -100.0, xmax: 100.0, ymin: -100.0, ymax: 100.0, x_axis_scale: @ticker_scale.asinh_scale(), y_axis_scale: @ticker_scale.asinh_scale() }}\n  let secondary = secondary_display_scale(scale, '+str(horizontal).lower()+')\n  let visible : Array[Double] = []\n  let actual : Array[Double] = []\n  for value in '+arr(row['values'])+' {\n    let primary = (value - 5.0) / 2.0\n    if tick_in_view(primary, secondary.'+('x' if horizontal else 'y')+'_axis_scale, -100.0, 100.0) {\n      visible.push(value)\n      actual.push('+('map_x(secondary, 40.0, 400.0, primary)' if horizontal else 'map_y(secondary, 60.0, 300.0, primary)')+')\n    }\n  }\n'
        expected=[40.+400.*n if horizontal else 60.+300.*(1.-n) for value,n in zip(row['values'],row['normalized']) if value in row['visible']]
        code+='  assert_eq(visible, '+arr(row['visible'])+')\n  verify_asinh_display_source(actual, '+arr(expected)+')\n}\n'
    return formatted(code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings(),np.errstate(all='ignore'):
        warnings.simplefilter('ignore',RuntimeWarning);payload=generate(args.ticker)
    outputs={ROOT/'testdata/asinh_axis_reference.json':json.dumps(clean(payload),indent=2,allow_nan=False)+'\n',
        ROOT/'ticker/scale/asinh_reference_test.mbt':generated_scale(payload),
        ROOT/'scene/asinh_axis_reference_test.mbt':generated_scene(payload),
        ROOT/'backend/svg/asinh_locator_reference_wbtest.mbt':generated_backend(payload)}
    for path,content in outputs.items():
        if args.check:
            if not path.exists() or path.read_text()!=content:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(content)
    print('Asinh axis:',len(payload['profiles']),'transform/constructor profiles,',len(payload['axis']),'raw/filter/visible profiles,',len(payload['ranges']),'inherited ranges,',len(payload['owners']),'owner traces,',len(payload['shared']),'shared removals,',len(payload['secondary']),'secondary,',len(payload['margins']),'autoscale,',len(payload['aspects']),'aspect,',len(payload['layout']),'layout; generated',sum(content.count('\ntest ') for path,content in outputs.items() if path.suffix=='.mbt'))


if __name__=='__main__':main()
