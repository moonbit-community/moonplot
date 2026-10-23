"""Actual Formatter/Axis lifecycle from pinned complete AST and real deprecation.

The source oracle uses the shared real upstream API/deprecation loader. Numeric
Bboxes, Text/Tick storage, units, GUI and affine matrix kernels are explicit sinks;
no named Moon formatter or copied lifecycle algorithm is used as the oracle.
"""
from pathlib import Path
import argparse
import ast
import copy
import hashlib
import json
import logging
import string
import sys
import types
import warnings

import numpy as np

from formatter_reference_source import load as load_formatters
from generate_logit_axis_reference import load as load_graph, observe
from generate_auto_date_reference import formatted, moon
from generate_null_axis_reference import clean
from generate_symlog_axis_reference import num, arr

ROOT=Path(__file__).resolve().parents[1]


def load(path):
    ns,tr,Axes,Secondary=load_graph(path)
    real=load_formatters(path)
    ns['_api']=real['_api']
    real['mpl'].rcParams.update(ns['mpl'].rcParams)
    ns['mpl']=real['mpl']
    ns['warning_messages']=real['external_warnings']
    for name in ['TickHelper','Formatter','NullFormatter','FixedFormatter','FuncFormatter']:
        ns[name]=real[name]
    ticker_tree=ast.parse(path.read_text())
    # Preserve one real TickHelper identity throughout callable/type checks.
    for name in ['Locator','NullLocator','FixedLocator','LinearLocator','MultipleLocator','IndexLocator','AutoMinorLocator',
                 'MaxNLocator','AutoLocator','LogLocator','SymmetricalLogLocator','AsinhLocator','LogitLocator']:
        node=next(n for n in ticker_tree.body if isinstance(n,ast.ClassDef) and n.name==name)
        exec(compile(ast.Module(body=[node],type_ignores=[]),str(path),'exec'),ns)
    ns['mticker']=types.SimpleNamespace(**{name:ns[name] for name in ['TickHelper','Formatter','NullFormatter','FixedFormatter','FuncFormatter','Locator','FixedLocator','NullLocator']})
    axis_type=type(Axes().xaxis)
    axis_node=next(n for n in ast.parse(path.with_name('axis.py').read_text()).body if isinstance(n,ast.ClassDef) and n.name=='Axis')
    for name in ['_set_formatter','set_major_formatter','set_minor_formatter','get_majorticklabels','get_minorticklabels','get_major_ticks','get_minor_ticks']:
        node=next(n for n in axis_node.body if isinstance(n,ast.FunctionDef) and n.name==name)
        exec(compile(ast.Module(body=[node],type_ignores=[]),str(path.with_name('axis.py')),'exec'),ns)
        setattr(axis_type,name,ns[name])
    class Ticker:
        def __init__(self,locator,formatter):self.locator,self.formatter=locator,formatter
    old_init=axis_type.__init__
    def init(self,*args):
        old_init(self,*args)
        self.major=Ticker(self.major.locator,self.major.formatter)
        self.minor=Ticker(self.minor.locator,self.minor.formatter)
        self.majorTicks=[];self.minorTicks=[]
    axis_type.__init__=init
    class Text:
        def __init__(self,visible):self.text='';self.visible=visible
        def set_text(self,label):self.text=label
        def get_visible(self):return self.visible
        def get_text(self):return self.text
    class Tick:
        def __init__(self,kind):self.kind=kind;self.label1=Text(True);self.label2=Text(False)
        def update_position(self,value):self.value=value
        def get_loc(self):return self.value
    axis_type._get_tick=lambda self,major:Tick('major' if major else 'minor')
    axis_type._copy_tick_props=lambda self,old,new:None
    class DefaultFormatter(ns['Formatter']):
        def __init__(self,*args,**kwargs):pass
        def __call__(self,value,pos=None):return str(value)
    for name in ['ScalarFormatter','LogFormatterSciNotation']:ns[name]=DefaultFormatter
    return ns,tr,Axes,Secondary,real


def run_update(path,ns,axis,formatters):
    # Observe the original set_locs body without replacing its implementation.
    assignments=[]
    def tracer(frame,event,arg):
        if event=='call' and frame.f_code.co_filename==str(path) and frame.f_code.co_name=='set_locs':
            owner=frame.f_locals.get('self')
            if id(owner) in formatters:
                assignments.append(dict(level=formatters[id(owner)],values=clean(frame.f_locals['locs'])))
        return tracer
    sys.settrace(tracer)
    try:result=observe(ns,lambda:[dict(level=t.kind,value=float(t.value),label=t.label1.text) for t in axis._update_ticks()])
    finally:sys.settrace(None)
    result['set_locs']=assignments
    return result


def generate(path):
    ns,tr,Axes,Secondary,real=load(path)
    def axis(label='axis',view=(0.,1.)):
        axes=Axes(label=label);axes.set_xlim(view);axes.set_ylim((0.,1.))
        return axes,axes.xaxis
    def raw(values):return ns['FixedLocator'](np.array(values,dtype=float))
    installs=[]
    for minor in [False,True]:
        for labels in [[],['A','B']]:
            for kind in ['named_fixed','legacy_fixed','other','null']:
                axes,current=axis()
                loc=raw([-1.,0.,1.,2.]) if kind.endswith('fixed') else ns['NullLocator']() if kind=='null' else ns['MaxNLocator'](nbins=4)
                getattr(current,'set_'+('minor' if minor else 'major')+'_locator')(loc)
                formatter=ns['FixedFormatter'](labels)
                result=observe(ns,lambda:getattr(current,'set_'+('minor' if minor else 'major')+'_formatter')(formatter))
                replacement=observe(ns,lambda:getattr(current,'set_'+('minor' if minor else 'major')+'_locator')(ns['NullLocator']()))
                next_install=observe(ns,lambda:getattr(current,'set_'+('minor' if minor else 'major')+'_formatter')(ns['NullFormatter']()))
                installs.append(dict(minor=minor,labels=labels,locator=kind,result=result,replacement=replacement,next_install=next_install))
    cases=[]
    specs=[('full major/minor positions','func','func',False,False,None),
        ('fixed positions include hidden neighbors','fixed','fixed',False,False,None),
        ('null formatter still batches','null','func',False,False,None),
        ('null minor formatter still batches','func','null',False,False,None),
        ('null locator skips major','func','func',True,False,None),
        ('null locator skips minor','func','func',False,True,None),
        ('shared formatter final locations','shared','shared',False,False,None),
        ('abstract major errors after assigning locations','abstract','func',False,False,None),
        ('abstract minor errors after assigning locations','func','abstract',False,False,None),
        ('offscreen major callback errors before minor','func','func',False,False,'major'),
        ('offscreen minor callback errors after major','func','func',False,False,'minor')]
    for label,major_kind,minor_kind,null_major,null_minor,failure in specs:
        axes,current=axis();current.set_major_locator(ns['NullLocator']() if null_major else raw([-1.,0.,1.,2.]))
        current.set_minor_locator(ns['NullLocator']() if null_minor else raw([-2.,.5,1.,3.]))
        callbacks=[]
        def make(kind,level):
            if kind=='fixed':return ns['FixedFormatter']([level+':'+str(index) for index in range(5)])
            if kind=='null':return ns['NullFormatter']()
            if kind=='abstract':return ns['Formatter']()
            def callback(value,pos):
                callbacks.append(dict(level=level,value=float(value),pos=pos))
                if failure==level and value==(-1. if level=='major' else -2.):raise ValueError(level+' callback')
                return level+':'+str(pos)
            return ns['FuncFormatter'](callback)
        major=make(major_kind,'shared' if major_kind=='shared' else 'major')
        minor=major if minor_kind=='shared' else make(minor_kind,'minor')
        current.set_major_formatter(major);current.set_minor_formatter(minor)
        result=run_update(path,ns,current,{id(major):'shared' if major is minor else 'major',id(minor):'shared' if major is minor else 'minor'})
        cases.append(dict(label=label,major_kind=major_kind,minor_kind=minor_kind,null_major=null_major,null_minor=null_minor,failure=failure,
            result=result,callbacks=callbacks,major_locs=clean(major._locs),minor_locs=clean(minor._locs),
            source_major_raw=[] if null_major else [-1.,0.,1.,2.],source_minor_filtered=[] if null_minor else [-2.,.5,1.,3.] if null_major else [-2.,.5,3.]))
    owners=[]
    aliases=[]
    for family,level,overlap in [('fixed','major',True),('fixed','minor',False),('fixed','minor',True),('linear','major',True),('linear','minor',False)]:
        axes,current=axis()
        current.set_major_locator(ns['NullLocator']());current.set_minor_locator(ns['NullLocator']())
        values=np.array([0.,1.,2.])
        active=ns['FixedLocator'](values) if family=='fixed' else ns['LinearLocator'](presets={(0.,1.):values})
        current.remove_overlapping_locs=overlap
        callbacks=[]
        def callback(value,pos):
            callbacks.append((float(value),pos))
            if pos==0:values[1]=.5
            return 'alias:'+str(pos)
        formatter=ns['FuncFormatter'](callback)
        getattr(current,'set_'+level+'_locator')(active);getattr(current,'set_'+level+'_formatter')(formatter)
        result=run_update(path,ns,current,{id(formatter):level})
        aliases.append(dict(family=family,level=level,overlap=overlap,result=result,callbacks=callbacks,
            owner=values.tolist(),locations=clean(formatter._locs),shares_owner=np.shares_memory(formatter._locs,values)))
    for name in ['x','y']:
        first,second=Axes(label='first'),Axes(label='second')
        a,b=first._axis_map[name],second._axis_map[name]
        major,minor=ns['NullFormatter'](),ns['NullFormatter']()
        a.set_major_formatter(major);a.set_minor_formatter(minor)
        before_major,before_minor=copy.copy(major),copy.copy(minor)
        b.major,b.minor=a.major,a.minor
        group=ns['Grouper']();group.join(second,first);first._shared_axes[name]=second._shared_axes[name]=group
        b.set_major_formatter(major);b.set_minor_formatter(minor)
        old_major,old_minor=copy.copy(major),copy.copy(minor)
        figure=ns['FigureBase']();figure._axobservers=types.SimpleNamespace(process=lambda *args:None)
        figure._root_figure=types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda *args:None))
        removed=observe(ns,lambda:figure._remove_axes(second,owners=[[first,second]]))
        owners.append(dict(name=name,initial_copy=[before_major.axis.axes.label,before_minor.axis.axes.label],removed=removed,
            installed=[major.axis.axes.label,minor.axis.axes.label],outside=[old_major.axis.axes.label,old_minor.axis.axes.label]))
    secondary=[]
    for name in ['x','y']:
        parent=Axes(label='parent');getattr(parent,'set_'+name+'lim')((0.,1.))
        child=Secondary(parent,name);child.label='secondary';current=child._axis
        current.set_major_locator(raw([3.,5.,6.,7.,9.]));current.set_minor_locator(raw([4.,5.5,6.,8.]))
        callbacks=[]
        def major_callback(value,pos):callbacks.append(dict(level='major',value=float(value),pos=pos));return 'secondary-major:'+str(pos)
        def minor_callback(value,pos):callbacks.append(dict(level='minor',value=float(value),pos=pos));return 'secondary-minor:'+str(pos)
        major,minor=ns['FuncFormatter'](major_callback),ns['FuncFormatter'](minor_callback)
        major.set_offset_string('secondary offset')
        current.set_major_formatter(major);current.set_minor_formatter(minor)
        result=run_update(path,ns,current,{id(major):'major',id(minor):'minor'})
        secondary.append(dict(name=name,own_view=current.get_view_interval(),result=result,callbacks=callbacks,major_locs=clean(major._locs),minor_locs=clean(minor._locs),offset=major.get_offset()))
    secondary_aliases=[]
    for name in ['x','y']:
        for family in ['fixed','linear']:
            parent=Axes(label='parent');getattr(parent,'set_'+name+'lim')((0.,1.))
            child=Secondary(parent,name);current=child._axis
            values=np.array([5.,6.,7.])
            active=ns['FixedLocator'](values) if family=='fixed' else ns['LinearLocator'](presets={(5.,7.):values})
            current.set_major_locator(active);current.set_minor_locator(ns['NullLocator']())
            callbacks=[]
            def callback(value,pos):
                callbacks.append((float(value),pos))
                if pos==0:values[1]=5.5
                return 'secondary-alias:'+str(pos)
            formatter=ns['FuncFormatter'](callback);current.set_major_formatter(formatter)
            result=run_update(path,ns,current,{id(formatter):'major'})
            secondary_aliases.append(dict(name=name,family=family,result=result,callbacks=callbacks,owner=values.tolist(),locations=clean(formatter._locs),shares_owner=np.shares_memory(formatter._locs,values)))
    source_only=[]
    multiple_minors=[]
    for overlap in [True,False]:
        axes,current=axis();current.set_major_locator(ns['NullLocator']())
        current.set_minor_locator(ns['MultipleLocator'](.5));current.remove_overlapping_locs=overlap
        callbacks=[]
        def callback(value,pos):
            callbacks.append((float(value),pos))
            return 'multiple:'+str(pos)
        formatter=ns['FuncFormatter'](callback);current.set_minor_formatter(formatter)
        result=run_update(path,ns,current,{id(formatter):'minor'})
        multiple_minors.append(dict(overlap=overlap,result=result,callbacks=callbacks,locations=clean(formatter._locs)))
    secondary_mutations=[]
    for name in ['x','y']:
        for mutation in ['enable_minor','disable_minor','replace_major']:
            parent=Axes(label='parent');getattr(parent,'set_'+name+'lim')((0.,1.))
            child=Secondary(parent,name);current=child._axis
            current.set_major_locator(raw([5.,6.,7.]))
            callbacks=[]
            def new_minor_callback(value,pos):
                callbacks.append(('new-minor',float(value),pos))
                return 'new-minor:'+str(pos)
            new_minor=ns['FuncFormatter'](new_minor_callback)
            def old_minor_callback(value,pos):
                callbacks.append(('old-minor',float(value),pos))
                return 'old-minor:'+str(pos)
            old_minor=ns['FuncFormatter'](old_minor_callback)
            replacement=ns['FixedFormatter'](['replacement0','replacement1','replacement2'])
            replacement.set_offset_string('replacement offset')
            current.set_minor_locator(raw([5.5,6.5]) if mutation=='disable_minor' else ns['NullLocator']())
            current.set_minor_formatter(old_minor if mutation=='disable_minor' else ns['NullFormatter']())
            def major_callback(value,pos):
                callbacks.append(('major',float(value),pos))
                if pos==0:
                    if mutation=='enable_minor':
                        current.set_minor_locator(raw([5.5,6.5]));current.set_minor_formatter(new_minor)
                    elif mutation=='disable_minor':
                        current.set_minor_locator(ns['NullLocator']());current.set_minor_formatter(ns['NullFormatter']())
                    else:current.set_major_formatter(replacement)
                return 'major:'+str(pos)
            major=ns['FuncFormatter'](major_callback);major.set_offset_string('initial offset');current.set_major_formatter(major)
            result=run_update(path,ns,current,{id(major):'major',id(new_minor):'new-minor',id(old_minor):'old-minor'})
            secondary_mutations.append(dict(name=name,mutation=mutation,result=result,callbacks=callbacks,offset=current.major.formatter.get_offset(),
                replacement_locs=clean(replacement._locs)))
    large_transports=[]
    for secondary_axis in [False,True]:
        if secondary_axis:
            parent=Axes();parent.set_xlim((0.,1.));current=Secondary(parent,'x')._axis
        else:_,current=axis()
        values=np.arange(125001,dtype=float);current.set_major_locator(ns['FixedLocator'](values))
        calls=[0]
        def callback(value,pos):calls[0]+=1;return str(pos)
        formatter=ns['FuncFormatter'](callback);current.set_major_formatter(formatter)
        # Execute this actual original subchain fully; no huge rendered SVG or
        # fabricated source budget/error is substituted for the original batch.
        locations=current.get_majorticklocs();labels=formatter.format_ticks(locations)
        samples=[0,99999,100000,125000]
        large_transports.append(dict(secondary=secondary_axis,count=len(locations),calls=calls[0],label_count=len(labels),samples=samples,
            sample_labels=[labels[index] for index in samples],sample_locations=[float(formatter._locs[index]) for index in samples],
            shares_owner=np.shares_memory(formatter._locs,values),scope='Complete original Axis.get_majorticklocs -> Formatter.format_ticks original bodies; full batch evaluated, no SVG/Text-cache lifecycle claim.'))
    axes,current=axis()
    major_values=np.array([0.,1.,2.]);current.set_major_locator(ns['FixedLocator'](major_values));current.set_minor_locator(raw([.5]))
    major=ns['FuncFormatter'](lambda value,pos:'frozen-major:'+str(pos))
    def change_major(value,pos):
        major_values[1]=.25
        return 'frozen-minor:'+str(pos)
    minor=ns['FuncFormatter'](change_major)
    current.set_major_formatter(major);current.set_minor_formatter(minor)
    frozen_major=dict(result=run_update(path,ns,current,{id(major):'major',id(minor):'minor'}),owner=major_values.tolist(),major_locations=clean(major._locs))
    axes,current=axis();current.set_major_locator(raw([-1.,0.,1.,2.]));current.set_minor_locator(ns['NullLocator']())
    current.set_major_formatter(ns['FuncFormatter'](lambda value,pos:'text:'+str(pos)))
    source_only.append(dict(scope='Full Text/cache getter remains outside typed label helpers',labels=observe(ns,lambda:[text.get_text() for text in current.get_majorticklabels()])))
    class Wrapped(ns['Locator']):
        def __init__(self,base):self.base=base
        def __call__(self):return np.array([0.,1.])
    for minor in [False,True]:
        for labels in [[],['A','B']]:
            for fixed in [False,True]:
                axes,current=axis()
                getattr(current,'set_'+('minor' if minor else 'major')+'_locator')(Wrapped(raw([0.,1.]) if fixed else 'other'))
                result=observe(ns,lambda:getattr(current,'set_'+('minor' if minor else 'major')+'_formatter')(ns['FixedFormatter'](labels)))
                source_only.append(dict(scope='Arbitrary locator .base wrapper protocol is outside the typed locator classes',minor=minor,labels=labels,fixed_base=fixed,result=result))
    return dict(source_hashes={**{name:hashlib.sha256((path.parent/name).read_bytes()).hexdigest() for name in ['ticker.py','axis.py','figure.py','cbook.py','axes/_base.py','axes/_secondary_axes.py','transforms.py','_api/__init__.py','_api/deprecation.py']}},
        scope='Complete original Formatter classes via shared real _api/deprecation loader, actual Axis setters/update/get_ticks and transformed minor overlap, real Grouper/removal and Secondary function setup; numeric Bbox, units, Tick/Text/default formatter/GUI/affine sinks.',
        warning_protocol='Original global warn_external observations; port Axis.formatter_warnings is latest-installation snapshot, not an upstream Formatter API. Host warning filters/stacklevel exceptions are outside typed scope.',
        installs=installs,cases=cases,aliases=aliases,owners=owners,secondary=secondary,secondary_aliases=secondary_aliases,
        multiple_minors=multiple_minors,secondary_mutations=secondary_mutations,large_transports=large_transports,
        frozen_major=frozen_major,source_only=source_only)


def strings(values):return '['+', '.join(moon(value) for value in values)+']'


def formatter(kind,level):
    if kind=='fixed':return '@ticker.FixedFormatter::new('+strings([level+':'+str(index) for index in range(5)])+').as_base_formatter()'
    if kind=='null':return '@ticker.NullFormatter::new().as_base_formatter()'
    if kind=='abstract':return '@ticker.BaseFormatter::new()'
    return '@ticker.FuncFormatter::new((_, pos) => "'+level+':" + pos.unwrap_or(-1).to_string()).as_base_formatter()'


def generated_scene(payload):
    code='// Original Formatter installation warning, live Axis identity and complete raw batch state.\n'
    for index,row in enumerate(payload['installs']):
        minor=row['minor'];method='set_minor_named_formatter' if minor else 'set_named_formatter';getter='minor_named_formatter' if minor else 'named_formatter'
        loc='@ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_'+('minor_locator' if minor else 'locator')+'()' if row['locator']=='named_fixed' else '@ticker.'+('fixed_minor_locator' if minor else 'fixed_locator')+'([-1.0, 0.0, 1.0, 2.0])' if row['locator']=='legacy_fixed' else '@ticker.NullLocator::new().as_'+('minor_locator' if minor else 'locator')+'()' if row['locator']=='null' else '@ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Count(4)).as_'+('minor_locator' if minor else 'locator')+'()'
        code+=f'\n///|\ntest "basic Formatter original installation warning {index}" {{\n  let axis = @axis.axis()\n  axis.'+('set_minor_locator' if minor else 'set_locator')+'('+loc+')\n  let formatter = @ticker.FixedFormatter::new('+strings(row['labels'])+').as_base_formatter()\n  axis.'+method+'(formatter)\n  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))\n  assert_eq(axis.formatter_warnings(), '+strings(row['result']['warnings'])+')\n  axis.'+('set_minor_locator' if minor else 'set_locator')+'(@ticker.NullLocator::new().as_'+('minor_locator' if minor else 'locator')+'())\n  assert_eq(axis.formatter_warnings(), '+strings(row['result']['warnings'])+')\n  axis.'+method+'(@ticker.NullFormatter::new().as_base_formatter())\n  assert_eq(axis.formatter_warnings(), [])\n  assert_true(axis.'+getter+'() is Some(_))\n}\n'
    for index,row in enumerate(payload['cases']):
        if row['failure']:continue
        code+=f'\n///|\ntest "basic Formatter original supplied Axis batch and retained locations {index}" {{\n  let axis = @axis.axis()\n  let major = '+formatter(row['major_kind'],'shared' if row['major_kind']=='shared' else 'major')+'\n  let minor = '+('major' if row['minor_kind']=='shared' else formatter(row['minor_kind'],'minor'))+'\n  axis.set_named_formatter(major)\n  axis.set_minor_named_formatter(minor)\n'
        # Supplied label helpers do not themselves implement draw's NullLocator skip.
        if row['null_major']:
            code+='  axis.set_locator(@ticker.NullLocator::new().as_locator())\n'
        if row['null_minor']:
            code+='  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n'
        if row['major_kind']=='abstract':
            code+='  assert_true(try { ignore(axis.tick_labels_checked([-1.0, 0.0, 1.0, 2.0])); false } catch { @core.DataError::InvalidTicks(message~) => message == "Derived must override"; _ => false })\n'
        else:
            if not row['null_major']:
                expected=[('shared' if row['major_kind']=='shared' else 'major')+':'+str(i) for i in range(4)] if row['major_kind']not in['null'] else ['']*4
                code+='  assert_eq(axis.tick_labels_checked([-1.0, 0.0, 1.0, 2.0]), '+strings(expected)+')\n'
            if row['minor_kind']=='abstract':
                code+='  assert_true(try { ignore(axis.minor_tick_labels_checked([-2.0, 0.5, 3.0])); false } catch { @core.DataError::InvalidTicks(message~) => message == "Derived must override"; _ => false })\n'
            elif not row['null_minor']:
                vals=row['source_minor_filtered'];level='shared' if row['minor_kind']=='shared' else 'minor'
                expected=[level+':'+str(i) for i in range(len(vals))] if row['minor_kind']!='null' else ['']*len(vals)
                code+='  assert_eq(axis.minor_tick_labels_checked('+arr(vals)+'), '+strings(expected)+')\n'
        code+='  assert_eq(major.locations().length(), '+str(len(row['major_locs']))+')\n  for index in 0..<major.locations().length() { assert_eq(major.locations().get(index), '+arr(row['major_locs'])+'[index]) }\n'
        code+='  assert_eq(minor.locations().length(), '+str(len(row['minor_locs']))+')\n'
        code+='}\n'
    for row in payload['owners']:
        name=row['name']
        code+='\n///|\ntest "basic Formatter original shared last owner removal and independent copy '+name+'" {\n  let figure = @scene.figure()\n  let axes = figure.subplots(1, 2, share_'+name+'=true)\n  let major = @ticker.NullFormatter::new().as_base_formatter()\n  let minor = @ticker.NullFormatter::new().as_base_formatter()\n  axes[0].set_'+name+'_named_formatter(major)\n  axes[0].set_'+name+'_minor_named_formatter(minor)\n  let initial = major.copy()\n  axes[1].set_'+name+'_named_formatter(major)\n  axes[1].set_'+name+'_minor_named_formatter(minor)\n  assert_eq(major.axis(), Some(axes[1].'+name+'_axis().formatter_axis_binding()))\n  assert_eq(minor.axis(), Some(axes[1].'+name+'_axis().formatter_axis_binding()))\n  assert_eq(initial.axis(), Some(axes[0].'+name+'_axis().formatter_axis_binding()))\n  let external_major = major.copy()\n  let external_minor = minor.copy()\n  let removed_binding = axes[1].'+name+'_axis().formatter_axis_binding()\n  axes[1].remove()\n  assert_eq(major.axis(), Some(axes[0].'+name+'_axis().formatter_axis_binding()))\n  assert_eq(minor.axis(), Some(axes[0].'+name+'_axis().formatter_axis_binding()))\n  assert_eq(external_major.axis(), Some(removed_binding))\n  assert_eq(external_minor.axis(), Some(removed_binding))\n}\n'
    for index,row in enumerate(payload['secondary']):
        name=row['name']
        code+=f'\n///|\ntest "basic Formatter original secondary own coordinates batch identity {index}" {{\n  let figure = @scene.figure()\n  let axes = figure.axes()\n  axes.set_'+name+'_limits(0.0, 1.0)\n  let secondary = axes.secondary_'+name+'axis(value => value * 2.0 + 5.0, value => (value - 5.0) / 2.0)\n  let major = @ticker.FuncFormatter::new((_, pos) => "secondary-major:" + pos.unwrap_or(-1).to_string())\n  let minor = @ticker.FuncFormatter::new((_, pos) => "secondary-minor:" + pos.unwrap_or(-1).to_string())\n  major.set_offset_string("secondary offset")\n  secondary.set_named_formatter(major.as_base_formatter())\n  secondary.set_minor_named_formatter(minor.as_base_formatter())\n  assert_eq(major.as_base_formatter().axis(), Some(secondary.formatter_axis_binding()))\n  assert_eq(minor.as_base_formatter().axis(), Some(secondary.formatter_axis_binding()))\n  assert_eq(secondary.tick_labels_checked([3.0, 5.0, 6.0, 7.0, 9.0]), ["secondary-major:0", "secondary-major:1", "secondary-major:2", "secondary-major:3", "secondary-major:4"])\n  assert_eq(secondary.minor_tick_labels_checked([4.0, 5.5, 8.0]), ["secondary-minor:0", "secondary-minor:1", "secondary-minor:2"])\n}\n'
    for index,row in enumerate(payload['secondary_mutations']):
        name=row['name'];mutation=row['mutation']
        code+=f'\n///|\ntest "basic Formatter original secondary live slot mutation {index}: '+mutation+'" {\n  let figure = @scene.figure(width=320, height=160)\n  let axes = figure.axes()\n  axes.set_x_limits(0.0, 1.0)\n  axes.set_y_limits(0.0, 1.0)\n  axes.set_x_locator(@ticker.NullLocator::new().as_locator())\n  axes.set_y_locator(@ticker.NullLocator::new().as_locator())\n  let secondary = axes.secondary_'+name+'axis(value => value * 2.0 + 5.0, value => (value - 5.0) / 2.0)\n  secondary.set_locator(@ticker.FixedLocator::new([5.0, 6.0, 7.0]).as_locator())\n  let callbacks : Array[(String, Double, Int32?)] = []\n  let replacement = @ticker.FixedFormatter::new(["replacement0", "replacement1", "replacement2"])\n  replacement.set_offset_string("replacement offset")\n'
        if mutation=='enable_minor':code+='  let new_minor = @ticker.FuncFormatter::new((value, pos) => { callbacks.push(("new-minor", value, pos)); "new-minor:" + pos.unwrap_or(-1).to_string() })\n'
        if mutation=='disable_minor':code+='  let old_minor = @ticker.FuncFormatter::new((value, pos) => { callbacks.push(("old-minor", value, pos)); "old-minor:" + pos.unwrap_or(-1).to_string() })\n'
        if mutation=='disable_minor':code+='  secondary.set_minor_locator(@ticker.FixedLocator::new([5.5, 6.5]).as_minor_locator())\n  secondary.set_minor_named_formatter(old_minor.as_base_formatter())\n'
        else:code+='  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n  secondary.set_minor_named_formatter(@ticker.NullFormatter::new().as_base_formatter())\n'
        code+='  let major = @ticker.FuncFormatter::new((value, pos) => {\n    callbacks.push(("major", value, pos))\n    if pos == Some(0) {\n'
        if mutation=='enable_minor':code+='      secondary.set_minor_locator(@ticker.FixedLocator::new([5.5, 6.5]).as_minor_locator())\n      secondary.set_minor_named_formatter(new_minor.as_base_formatter())\n'
        elif mutation=='disable_minor':code+='      secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n      secondary.set_minor_named_formatter(@ticker.NullFormatter::new().as_base_formatter())\n'
        else:code+='      secondary.set_named_formatter(replacement.as_base_formatter())\n'
        code+='    }\n    "major:" + pos.unwrap_or(-1).to_string()\n  })\n  major.set_offset_string("initial offset")\n  secondary.set_named_formatter(major.as_base_formatter())\n  let svg = figure.to_svg_checked()\n'
        expected='['+', '.join('('+moon(level)+', '+num(value)+', Some('+str(pos)+'))' for level,value,pos in row['callbacks'])+']'
        code+='  assert_eq(callbacks, '+expected+')\n'
        for tick in row['result']['values']:code+='  assert_eq(svg.split('+moon('>'+tick['label']+'<')+').count() - 1, 1)\n'
        code+='  assert_eq(svg.split('+moon('>'+row['offset']+'<')+').count() - 1, 1)\n  assert_true(!svg.contains(">replacement0<"))\n  assert_eq(replacement.as_base_formatter().locations().length(), '+str(len(row['replacement_locs']))+')\n}\n'
    row=next(row for row in payload['large_transports'] if not row['secondary'])
    code+='\n///|\ntest "basic Formatter original complete 125001 primary Fixed transport has no formatter cap" {\n  let axis = @axis.axis()\n  axis.set_limits(0.0, 1.0)\n  let values = Array::makei(125001, index => Double::from_int(index))\n  axis.set_locator(@ticker.FixedLocator::new(values).as_locator())\n  let calls = [0]\n  let formatter = @ticker.FuncFormatter::new((_, pos) => { calls[0] += 1; pos.unwrap_or(-1).to_string() }).as_base_formatter()\n  axis.set_named_formatter(formatter)\n  let locations = axis.formatter_tick_locations_checked(@core.limits(0.0, 1.0))\n  assert_eq(locations.length(), '+str(row['count'])+')\n  let labels = match locations { @ticker.FormatterLocations::NdArray(view) => formatter.format_ticks_view(view); _ => fail("expected retained ndarray transport") }\n  assert_eq(calls[0], '+str(row['calls'])+')\n  assert_eq(labels.length(), '+str(row['label_count'])+')\n'
    for index,label in zip(row['samples'],row['sample_labels']):code+='  assert_eq(labels['+str(index)+'], '+moon(label)+')\n'
    code+='  values[100000] = -123.0\n  assert_eq(formatter.locations().get(100000), -123.0)\n}\n'
    return formatted(code)


def generated_backend(payload):
    code='// Complete original Axis full formatting precedes minor providers and visibility.\n'
    code+='''
///|
fn basic_formatter_reference_figure(x : @axis.Axis) -> @render.Figure {
  let y = @axis.axis()
  try! y.set_limits(0.0, 1.0)
  try! y.set_locator(@ticker.NullLocator::new().as_locator())
  try! y.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  @render.figure(240, 120, 0, [@render.panel(None, [], None, [], None, x, y, false, [], [])], [], None)
}
'''
    for index,row in enumerate(payload['cases']):
        code+=f'\n///|\ntest "basic Formatter original renderer batch and callback order {index}: '+row['label']+'" {\n  let axis = @axis.axis()\n  axis.set_limits(0.0, 1.0)\n  axis.set_locator('+('@ticker.NullLocator::new().as_locator()' if row['null_major'] else '@ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator()')+')\n  axis.set_minor_locator('+('@ticker.NullLocator::new().as_minor_locator()' if row['null_minor'] else '@ticker.FixedLocator::new([-2.0, 0.5, 1.0, 3.0]).as_minor_locator()')+')\n  let callbacks : Array[(String, Double, Int32?)] = []\n'
        def active(kind,level):
            if kind not in ['func','shared']:return formatter(kind,level)
            failure='if value == '+('-1.0' if level=='major' else '-2.0')+' { raise @core.DataError::InvalidTicks(message="'+level+' callback") }; ' if row['failure']==level else ''
            return '@ticker.FuncFormatter::new((value, pos) => { callbacks.push(("'+level+'", value, pos)); '+failure+'"'+level+':" + pos.unwrap_or(-1).to_string() }).as_base_formatter()'
        code+='  let major = '+active(row['major_kind'],'shared' if row['major_kind']=='shared' else 'major')+'\n  let minor = '+('major' if row['minor_kind']=='shared' else active(row['minor_kind'],'minor'))+'\n  axis.set_named_formatter(major)\n  axis.set_minor_named_formatter(minor)\n'
        if row['result']['error']:
            message='Derived must override' if row['result']['error']=='NotImplementedError' else row['result']['message']
            code+='  assert_true(try { ignore(render_with_positions_checked(basic_formatter_reference_figure(axis))); false } catch { @core.DataError::InvalidTicks(message~) => message == '+moon(message)+'; _ => false })\n'
        else:
            code+='  let svg = render_with_positions_checked(basic_formatter_reference_figure(axis)).0\n'
            visible=[tick['label'] for tick in row['result']['values'] if tick['label']]
            for label in sorted(set(visible)):code+='  assert_eq(svg.split('+moon('>'+label+'<')+').count() - 1, '+str(visible.count(label))+')\n'
            labels=[('shared' if row['major_kind']=='shared' else 'major')+':0',('shared' if row['major_kind']=='shared' else 'major')+':3','minor:0','minor:2']
            for label in sorted(set(labels)-set(visible)):code+='  assert_true(!svg.contains('+moon('>'+label+'<')+'))\n'
        expected='['+', '.join('('+moon(r['level'])+', '+num(r['value'])+', '+('None' if r['pos']is None else 'Some('+str(r['pos'])+')')+')' for r in row['callbacks'])+']'
        code+='  assert_eq(callbacks, '+expected+')\n  assert_eq(major.locations().length(), '+str(len(row['major_locs']))+')\n  assert_eq(minor.locations().length(), '+str(len(row['minor_locs']))+')\n}\n'
    for index,row in enumerate(payload['aliases']):
        level=row['level']
        code+=f'\n///|\ntest "basic Formatter original rendered '+row['family']+f' owner alias {index}" {{\n  let axis = @axis.axis()\n  axis.set_limits(0.0, 1.0)\n  axis.set_locator(@ticker.NullLocator::new().as_locator())\n  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())\n  let values = [0.0, 1.0, 2.0]\n'
        code+=('  let locator = @ticker.FixedLocator::new(values)\n' if row['family']=='fixed' else '  let presets = @ticker.LinearLocatorPresets::new()\n  presets.set(0.0, 1.0, values)\n  let locator = @ticker.LinearLocator::new(presets~)\n')
        code+='  axis.'+('set_locator(locator.as_locator())' if level=='major' else 'set_minor_locator(locator.as_minor_locator())')+'\n  axis.set_minor_overlap_removal('+str(row['overlap']).lower()+')\n  let callbacks : Array[(Double, Int32?)] = []\n  let formatter = @ticker.FuncFormatter::new((value, pos) => {\n    callbacks.push((value, pos))\n    if pos == Some(0) { values[1] = 0.5 }\n    "alias:" + pos.unwrap_or(-1).to_string()\n  }).as_base_formatter()\n  axis.'+('set_named_formatter' if level=='major' else 'set_minor_named_formatter')+'(formatter)\n  ignore(render_with_positions_checked(basic_formatter_reference_figure(axis)))\n'
        expected='['+', '.join('('+num(value)+', Some('+str(pos)+'))' for value,pos in row['callbacks'])+']'
        code+='  assert_eq(callbacks, '+expected+')\n  assert_eq(values, '+arr(row['owner'])+')\n  assert_eq(formatter.locations().length(), '+str(len(row['locations']))+')\n  for index in 0..<formatter.locations().length() { assert_eq(formatter.locations().get(index), '+arr(row['locations'])+'[index]) }\n  values[0] = 0.25\n  assert_eq(formatter.locations().get(0), '+('0.25' if row['shares_owner'] else '0.0')+')\n}\n'
    for index,row in enumerate(payload['secondary']):
        horizontal=row['name']=='x'
        code+=f'\n///|\ntest "basic Formatter original secondary full own position and minor batch {index}" {{\n  let callbacks : Array[(String, Double, Int32?)] = []\n  let major = @ticker.FuncFormatter::new((value, pos) => {{ callbacks.push(("major", value, pos)); "secondary-major:" + pos.unwrap_or(-1).to_string() }})\n  let minor = @ticker.FuncFormatter::new((value, pos) => {{ callbacks.push(("minor", value, pos)); "secondary-minor:" + pos.unwrap_or(-1).to_string() }})\n  major.set_offset_string("secondary offset")\n  let axis = @render.secondary_axis('+('@render.SecondaryLocation::Top' if horizontal else '@render.SecondaryLocation::Right')+', value => value * 2.0 + 5.0, value => (value - 5.0) / 2.0, None, 6, Some([3.0, 5.0, 6.0, 7.0, 9.0]), None, None, named_formatter=Some(major.as_base_formatter()), minor_named_formatter=Some(minor.as_base_formatter()), minor_ticks_provider=Some(() => [4.0, 5.5, 8.0]))\n  let scale : Scale = { xmin: 0.0, xmax: 1.0, ymin: 0.0, ymax: 1.0, x_axis_scale: @ticker_scale.linear_scale(), y_axis_scale: @ticker_scale.linear_scale() }\n  let writer = @xml.Writer::new()\n  writer.start_element("svg", [])\n  '+('append_secondary_x_axis' if horizontal else 'append_secondary_y_axis')+'(writer, scale, 40.0, 60.0, 400.0, 300.0, [], axis)\n  writer.end_element("svg")\n  let svg = writer.to_string()\n'
        for tick in row['result']['values']:
            code+='  assert_eq(svg.split('+moon('>'+tick['label']+'<')+').count() - 1, 1)\n'
        code+='  assert_eq(svg.split(">secondary offset<").count() - 1, 1)\n'
        expected='['+', '.join('('+moon(r['level'])+', '+num(r['value'])+', Some('+str(r['pos'])+'))' for r in row['callbacks'])+']'
        code+='  assert_eq(callbacks, '+expected+')\n  assert_eq(major.as_base_formatter().locations().length(), 5)\n  assert_eq(minor.as_base_formatter().locations().length(), 3)\n}\n'
    for index,row in enumerate(payload['secondary_aliases']):
        horizontal=row['name']=='x'
        code+=f'\n///|\ntest "basic Formatter original secondary '+row['family']+f' live owner alias {index}" {{\n  let values = [5.0, 6.0, 7.0]\n'
        code+=('  let locator = @ticker.FixedLocator::new(values)\n' if row['family']=='fixed' else '  let presets = @ticker.LinearLocatorPresets::new()\n  presets.set(5.0, 7.0, values)\n  let locator = @ticker.LinearLocator::new(presets~)\n')
        code+='  let callbacks : Array[(Double, Int32?)] = []\n  let formatter = @ticker.FuncFormatter::new((value, pos) => { callbacks.push((value, pos)); if pos == Some(0) { values[1] = 5.5 }; "secondary-alias:" + pos.unwrap_or(-1).to_string() }).as_base_formatter()\n  let axis = @render.secondary_axis('+('@render.SecondaryLocation::Top' if horizontal else '@render.SecondaryLocation::Right')+', value => value * 2.0 + 5.0, value => (value - 5.0) / 2.0, None, 6, None, Some(locator.as_locator()), None, named_formatter=Some(formatter), minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()))\n  let scale : Scale = { xmin: 0.0, xmax: 1.0, ymin: 0.0, ymax: 1.0, x_axis_scale: @ticker_scale.linear_scale(), y_axis_scale: @ticker_scale.linear_scale() }\n  let writer = @xml.Writer::new()\n  writer.start_element("svg", [])\n  '+('append_secondary_x_axis' if horizontal else 'append_secondary_y_axis')+'(writer, scale, 40.0, 60.0, 400.0, 300.0, [], axis)\n  writer.end_element("svg")\n'
        expected='['+', '.join('('+num(value)+', Some('+str(pos)+'))' for value,pos in row['callbacks'])+']'
        code+='  assert_eq(callbacks, '+expected+')\n  assert_eq(values, '+arr(row['owner'])+')\n  values[0] = 5.25\n  assert_eq(formatter.locations().get(0), 5.25)\n}\n'
    row=payload['frozen_major']
    code+='\n///|\ntest "basic Formatter original major positions freeze before minor mutates their borrowed owner" {\n  let axis = @axis.axis()\n  axis.set_limits(0.0, 1.0)\n  let values = [0.0, 1.0, 2.0]\n  axis.set_locator(@ticker.FixedLocator::new(values).as_locator())\n  axis.set_minor_locator(@ticker.FixedLocator::new([0.5]).as_minor_locator())\n  let major = @ticker.FuncFormatter::new((_, pos) => "frozen-major:" + pos.unwrap_or(-1).to_string()).as_base_formatter()\n  let minor = @ticker.FuncFormatter::new((_, pos) => { values[1] = 0.25; "frozen-minor:" + pos.unwrap_or(-1).to_string() }).as_base_formatter()\n  axis.set_named_formatter(major)\n  axis.set_minor_named_formatter(minor)\n  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 1.0))\n  assert_eq(bundle.major, [0.0, 1.0, 2.0])\n  assert_eq(values, '+arr(row['owner'])+')\n  assert_eq(major.locations().get(1), '+num(row['major_locations'][1])+')\n}\n'
    for index,row in enumerate(payload['multiple_minors']):
        code+=f'\n///|\ntest "basic Formatter original Multiple minor raw neighbors before visibility {index}" {{\n  let axis = @axis.axis()\n  axis.set_limits(0.0, 1.0)\n  axis.set_locator(@ticker.NullLocator::new().as_locator())\n  axis.set_minor_locator(@ticker.MultipleLocator::new(base=0.5).as_minor_locator())\n  axis.set_minor_overlap_removal('+str(row['overlap']).lower()+')\n  let callbacks : Array[(Double, Int32?)] = []\n  let formatter = @ticker.FuncFormatter::new((value, pos) => { callbacks.push((value, pos)); "multiple:" + pos.unwrap_or(-1).to_string() }).as_base_formatter()\n  axis.set_minor_named_formatter(formatter)\n  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 1.0))\n  assert_eq(bundle.minor, '+arr(row['locations'])+')\n'
        expected='['+', '.join('('+num(value)+', Some('+str(pos)+'))' for value,pos in row['callbacks'])+']'
        code+='  assert_eq(callbacks, '+expected+')\n  assert_eq(bundle.minor_labels, '+strings(['multiple:'+str(i) for i in range(len(row['locations']))])+')\n}\n'
    row=next(row for row in payload['large_transports'] if row['secondary'])
    code+='\n///|\ntest "basic Formatter original complete 125001 secondary Fixed transport has no formatter cap" {\n  let values = Array::makei(125001, index => Double::from_int(index))\n  let calls = [0]\n  let formatter = @ticker.FuncFormatter::new((_, pos) => { calls[0] += 1; pos.unwrap_or(-1).to_string() }).as_base_formatter()\n  let axis = @render.secondary_axis(@render.SecondaryLocation::Top, value => value * 2.0 + 5.0, value => (value - 5.0) / 2.0, None, 6, None, Some(@ticker.FixedLocator::new(values).as_locator()), None, named_formatter=Some(formatter), minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()))\n  let bundle = secondary_axis_bundle(axis, [], 0.0, 1.0)\n  assert_eq(bundle.major.length(), '+str(row['count'])+')\n  assert_eq(calls[0], '+str(row['calls'])+')\n  assert_eq(bundle.major_labels.length(), '+str(row['label_count'])+')\n'
    for index,label in zip(row['samples'],row['sample_labels']):code+='  assert_eq(bundle.major_labels['+str(index)+'], '+moon(label)+')\n'
    code+='  values[100000] = -123.0\n  assert_eq(formatter.locations().get(100000), -123.0)\n}\n'
    return formatted(code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings(),np.errstate(all='ignore'):
        warnings.simplefilter('ignore',RuntimeWarning);payload=generate(args.ticker)
    outputs={ROOT/'testdata/basic_formatter_axis_reference.json':json.dumps(clean(payload),indent=2,allow_nan=False)+'\n',
        ROOT/'scene/basic_formatter_axis_reference_test.mbt':generated_scene(payload),
        ROOT/'backend/svg/basic_formatter_reference_wbtest.mbt':generated_backend(payload)}
    for path,content in outputs.items():
        if args.check:
            if not path.exists() or path.read_text()!=content:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(content)
    print('Basic formatter axis:',{key:len(value) for key,value in payload.items() if isinstance(value,list)},'generated',sum(content.count('\ntest ') for path,content in outputs.items() if path.suffix=='.mbt'))


if __name__=='__main__':main()
