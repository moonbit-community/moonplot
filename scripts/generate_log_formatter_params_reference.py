"""Generate LogFormatter family object/parameter references from complete AST.

Private cache fixtures are explicitly whitebox and do not create a public raw
set API. All expected operations run original classes and real dependencies.
"""
from pathlib import Path
import argparse
import copy
import json
import math
import sys
import types
import warnings

import numpy as np

from formatter_reference_source import load_log_formatters
from generate_auto_date_reference import formatted, moon
from generate_basic_formatter_params_reference import clean
from generate_eng_formatter_params_reference import number, number_code

ROOT=Path(__file__).resolve().parents[1]
NAMES=('LogFormatter','LogFormatterExponent','LogFormatterMathtext','LogFormatterSciNotation')


def value_record(value):
    if value is None:return dict(kind='NoneValue')
    if isinstance(value,str):return dict(kind='Text',value=value)
    return dict(kind='Numeric',value=number(value))


def value_code(value):
    record=value if isinstance(value,dict) else value_record(value)
    if record['kind']=='NoneValue':return 'LogValue::NoneValue'
    if record['kind']=='Text':return 'LogValue::Text('+moon(record['value'])+')'
    return 'LogValue::Numeric('+number_code(record['value'])+')'


def generate(path):
    ns=load_log_formatters(path);classes=[ns[name] for name in NAMES];source=classes[0];rc=ns['mpl'].rcParams
    observations,cases,source_only=[],[],[]
    code='''// Complete pinned LogFormatter family and real helpers. Whitebox cache fixtures
// are private source-state observations, not a public raw set mutation API.

///|
fn log_params_value(actual : LogValue, expected : LogValue) -> Unit raise {
  match (actual,expected) {
    (Numeric(ScalarNumber::Number(a)),Numeric(ScalarNumber::Number(b)))
    | (Numeric(ScalarNumber::NumpyFloat64(a)),Numeric(ScalarNumber::NumpyFloat64(b))) => {
      if b.is_nan() { assert_true(a.is_nan()) }
      else { assert_eq(a.reinterpret_as_uint64(),b.reinterpret_as_uint64()) }
    }
    _ => assert_eq(actual,expected)
  }
}
'''

    def reset():
        for key,value in [('_internal.classic_mode',False),('axes.formatter.min_exponent',0),('text.usetex',False),('axes.unicode_minus',True)]:rc[key]=value

    def observe(label,action,origin='complete original LogFormatter family AST'):
        ns['warning_records'].clear()
        with warnings.catch_warnings(record=True) as caught:
            warnings.simplefilter('always')
            try:result=dict(value=action(),source_error=None)
            except (TypeError,ValueError,ZeroDivisionError,OverflowError,IndexError,KeyError,AttributeError) as exc:
                result=dict(value=None,source_error=type(exc).__name__,message=str(exc))
        result=dict(label=label,origin=origin,**result,warnings=list(ns['warning_records']),runtime_warnings=[dict(category=type(w.message).__name__,message=str(w.message)) for w in caught])
        observations.append(result);return result

    def add(label,body,records):
        nonlocal code
        index=len(cases)
        prefix='''  let previous_classic=@config.classic_mode()
  let previous_exponent=@config.formatter_min_exponent()
  let previous_tex=@config.text_usetex()
  let previous_minus=@config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
'''
        code+='\n///|\nfn log_params_case_'+str(index)+'() -> Unit raise {\n'+prefix+body+'}\n'
        cases.append(dict(label=label,observations=records))

    def assertion(expression,result):
        if result['source_error']:
            return ('  let error=try { ignore('+expression+'); "unexpected success" } catch { @core.DataError::InvalidTicks(message~) => message; _ => "unexpected error" }\n'
                    '  assert_eq(error,'+moon(result['source_error']+': '+result['message'])+')\n')
        if isinstance(result['value'],float):
            return '  log_params_value(LogValue::Numeric(ScalarNumber::Number('+expression+')),'+value_code(result['value'])+')\n'
        return '  assert_eq('+expression+','+moon(result['value'])+')\n'

    def snapshot(f):
        return dict(base=float(f._base),label=value_record(f.labelOnlyBase),linthresh=value_record(f._linthresh),
                    sublabels=None if f._sublabels is None else sorted(float(x) for x in f._sublabels),
                    cache_origins=None if f._sublabels is None else sorted([number(x) for x in f._sublabels],key=repr),
                    instance_locs='_locs' in vars(f))

    def state_assert(name,record):
        state=record['value']
        return ('  log_params_value(LogValue::Numeric(ScalarNumber::Number('+name+'.base())),'+value_code(state['base'])+')\n'
                '  log_params_value('+name+'.label_only_base(),'+value_code(state['label'])+')\n'
                '  log_params_value('+name+'.linthresh(),'+value_code(state['linthresh'])+')\n'
                '  assert_eq('+name+'.sublabels(),'+('None' if state['sublabels'] is None else 'Some('+moon(state['sublabels'])+')')+')\n')

    class AxisFixture:
        def __init__(self,view=(1.,5.)):self.view=view;self.events=[]
        def get_transform(self):self.events.append('transform');return types.SimpleNamespace()
        def get_view_interval(self):self.events.append('view');return self.view

    def bind_axis_code(name,view=(1.,5.)):
        return ('  let axis=FormatterAxisBinding::new()\n  axis.set_view_interval(FormatterViewInterval::Sequence('+moon(list(view))+'))\n  '+name+'.set_axis(Some(axis))\n')

    base_values=[10,10.,np.float64(10),np.int64(10),False,True,np.bool_(True),None,0.,-0.,-2.,1.,.5,float('inf'),float('-inf'),float('nan'),10**400,
                 '2','not a number','1_0.5','٢.٥','1e+٣','nan','-inf','1__0','0x1p0','\u20032\u2003','\x1c2']
    for cls in classes:
        name=cls.__name__
        for value in base_values:
            reset()
            result=observe(name+' constructor base '+repr(value),lambda cls=cls,value=value:snapshot(cls(base=value)))
            constructor=name+'::new(base='+value_code(value)+')'
            body=assertion(constructor,result) if result['source_error'] else '  let formatter='+constructor+'\n'+state_assert('formatter',result)
            add(name+' eager float conversion',body,[result])
            f=cls(base=3.);f._sublabels={13.};before=f._sublabels
            update=observe(name+' set_base RHS atomic',lambda value=value,f=f:f.set_base(value))
            after=observe(name+' updated raw state',lambda f=f:snapshot(f))
            preserved=observe(name+' base update cache retained',lambda f=f,before=before:f._sublabels is before)
            body='  let formatter='+name+'::new(base='+value_code(3.)+')\n  log_formatter_state(formatter.as_base_formatter()).sublabels=Some(log_cache_explicit([13.0]))\n'
            if update['source_error']:body+=assertion('formatter.set_base('+value_code(value)+')',update)
            else:body+='  formatter.set_base('+value_code(value)+')\n'
            body+=state_assert('formatter',after)
            add(name+' set_base atomic and stale cache',body,[update,after,preserved])

    for cls in classes:
        for classic in [False,True]:
            reset();rc['_internal.classic_mode']=classic;f=cls();g=cls();h=copy.copy(f);thresholds=f.minor_thresholds;rc['_internal.classic_mode']=not classic
            result=observe(cls.__name__+' captured immutable tuple',lambda:dict(values=[value_record(x) for x in thresholds],new_shared=g.minor_thresholds is thresholds,copy_shared=h.minor_thresholds is thresholds,type=type(thresholds).__name__))
            body='  @config.set_classic_mode('+moon(classic)+')\n  let formatter='+cls.__name__+'::new()\n  let other='+cls.__name__+'::new()\n  let copied=formatter.copy()\n  @config.set_classic_mode('+moon(not classic)+')\n'
            body+='  let tuple=match formatter.minor_thresholds() { Some(Tuple(tuple)) => tuple; _ => abort("expected tuple") }\n'
            body+='  let other_tuple=match other.minor_thresholds() { Some(Tuple(tuple)) => tuple; _ => abort("expected tuple") }\n  let copy_tuple=match copied.minor_thresholds() { Some(Tuple(tuple)) => tuple; _ => abort("expected tuple") }\n  assert_true(physical_equal(tuple,other_tuple))\n  assert_true(physical_equal(tuple,copy_tuple))\n'
            for i,x in enumerate(thresholds):body+='  log_params_value(tuple.get('+str(i)+'),'+value_code(x)+')\n'
            body+='  let snapshot=tuple.values()\n  snapshot[0]=LogValue::Text("changed copy")\n  log_params_value(tuple.get(0),'+value_code(thresholds[0])+')\n'
            add('immutable classic tuple capture',body,[result])

    labels=[None,False,True,0,2,0.,np.float64(2),np.int64(2),np.bool_(True),np.bool_(False),'','False']
    for cls in classes:
        for label in labels:
            reset();f=cls(labelOnlyBase=label)
            state=observe(cls.__name__+' raw label ctor',lambda f=f:snapshot(f))
            truth=observe('Python raw label truth',lambda f=f:bool(f.labelOnlyBase),origin='actual Python bool dependency on original raw slot')
            f.set_label_minor(label)
            retained=observe(cls.__name__+' raw label setter identity',lambda f=f,label=label:f.labelOnlyBase is label)
            body='  let formatter='+cls.__name__+'::new(label_only_base='+value_code(label)+')\n'+state_assert('formatter',state)
            body+=assertion('log_value_truth(formatter.label_only_base())',truth)+'  formatter.set_label_minor('+value_code(label)+')\n  log_params_value(formatter.label_only_base(),'+value_code(label)+')\n'
            add('raw label preserves type/truth',body,[state,truth,retained])

    # One-dimensional standard stores, including malformed and short inputs.
    specs=[('Tuple',()),('Tuple',(0,)),('Tuple',(100,)),('Tuple',(1,.4,99)),('Sequence',[]),('Sequence',[0]),('Sequence',[100]),('Sequence',[1,.4,99]),
           ('Sequence',[float('inf')]),('Sequence',[-float('inf')]),('Sequence',[float('nan'),.4]),('Sequence',[None,.4]),('Sequence',['1',.4]),('Sequence',[10**400,.4]),
           ('Sequence',[False,None]),('Sequence',[True,None]),('NdArray',np.array([1.,.4])),('NdArray',np.array([1,0],dtype=np.int64)),
           ('Raw',1.),('Raw',1),('Raw',True),('Raw',np.float64(1)),('Raw',np.int64(1)),('Raw',np.bool_(True)),('Raw','12'),('Raw',''),('None',None)]

    def threshold_code(kind,values):
        if kind=='None':return 'None'
        if kind=='Raw':return 'Some(LogMinorThresholds::Raw('+value_code(values)+'))'
        if kind=='Tuple':return 'Some(LogMinorThresholds::Tuple(LogThresholdTuple::new(['+', '.join(value_code(x) for x in values)+'])))'
        if kind=='Sequence':return 'Some(LogMinorThresholds::Sequence(['+', '.join(value_code(x) for x in values)+']))'
        ctor='TickValues::from_int64_array(['+', '.join(str(int(x))+'L' for x in values)+'])' if values.dtype==np.int64 else 'TickValues::from_array('+moon(values.tolist())+')'
        return 'Some(LogMinorThresholds::NdArray('+ctor+'))'

    for kind,thresholds in specs:
        for index in [0,1,-1]:
            reset();f=source();f.minor_thresholds=thresholds
            result=observe('raw threshold indexing '+kind,lambda f=f,index=index:value_record(f.minor_thresholds[index]))
            body='  let thresholds='+threshold_code(kind,thresholds)+'\n'
            if result['source_error']:body+=assertion('log_threshold_at(thresholds,'+str(index)+')',result)
            else:body+='  log_params_value(log_threshold_at(thresholds,'+str(index)+'),'+value_code(result['value'])+')\n'
            add('threshold late indexing '+kind,body,[result])
        reset();f=source();f.minor_thresholds=thresholds;f.axis=AxisFixture();f._sublabels={13.};before=f._sublabels
        result=observe('threshold prepare '+kind,lambda f=f:f.set_locs([999.]))
        after=observe('threshold prepare state',lambda f=f:snapshot(f))
        alias=observe('threshold failure cache/locs retention',lambda f=f,before=before:dict(same_cache=f._sublabels is before,instance_locs='_locs' in vars(f),events=list(f.axis.events)))
        body='  let formatter=LogFormatter::new()\n  formatter.set_minor_thresholds('+threshold_code(kind,thresholds)+')\n'+bind_axis_code('formatter')
        body+='  let cache=log_cache_explicit([13.0])\n  log_formatter_state(formatter.as_base_formatter()).sublabels=Some(cache)\n'
        if result['source_error']:body+=assertion('formatter.set_locs(locations=[999.0])',result)
        else:body+='  formatter.set_locs(locations=[999.0])\n'
        body+=state_assert('formatter',after)+'  assert_eq(formatter.locations().length(),0)\n'
        add('threshold deferred prepare/failure '+kind,body,[result,after,alias])

    for cls in classes:
        for ignored in [None,[],[999.],np.array([1.,2.])]:
            reset();f=cls(minor_thresholds=(float('inf'),float('inf')));old=f._locs
            result=observe(cls.__name__+' noarg/ignored locs',lambda f=f,ignored=ignored:(f.set_locs(ignored),dict(same_locs=f._locs is old,instance_locs='_locs' in vars(f),cache=f._sublabels))[1])
            body='  let formatter='+cls.__name__+'::new(minor_thresholds=Some(LogMinorThresholds::Tuple(LogThresholdTuple::new(['+value_code(float('inf'))+','+value_code(float('inf'))+']))))\n'
            if isinstance(ignored,np.ndarray):body+='  formatter.set_locs_view(TickValues::from_array('+moon(ignored.tolist())+'))\n'
            elif ignored is None:body+='  formatter.set_locs()\n'
            else:body+='  formatter.set_locs(locations='+moon(ignored)+')\n'
            body+='  assert_eq(formatter.locations().length(),0)\n  assert_eq(formatter.sublabels(),None)\n'
            add('ignored locations retain inherited original slot',body,[result])

    # Raw linthresh is never cast at construction or assignment.
    for value in [None,0.,-0.,-1.,1.,float('inf'),float('-inf'),float('nan'),np.float64(1),np.int64(1),np.bool_(True),10**400,'1','']:
        reset();f=source(linthresh=value,minor_thresholds=(100,100));f.axis=AxisFixture((1.,2.));f._sublabels={13.}
        result=observe('linthresh late operation',lambda f=f:f.set_locs())
        state=observe('linthresh stored origin',lambda f=f:snapshot(f))
        body='  let formatter=LogFormatter::new(linthresh='+value_code(value)+',minor_thresholds=Some(LogMinorThresholds::Tuple(LogThresholdTuple::new(['+value_code(100)+','+value_code(100)+']))))\n'+bind_axis_code('formatter',(1.,2.))
        body+='  log_formatter_state(formatter.as_base_formatter()).sublabels=Some(log_cache_explicit([13.0]))\n'
        body+=assertion('formatter.set_locs()',result) if result['source_error'] else '  formatter.set_locs()\n'
        body+=state_assert('formatter',state)
        add('linthresh raw late consume',body,[result,state])

    for cls in classes:
        reset();f=cls(labelOnlyBase='original');f.axis=AxisFixture((1.,10.));before=f.labelOnlyBase
        data=observe(cls.__name__+' format_data virtual finally',lambda f=f:dict(text=f.format_data(2.),same=f.labelOnlyBase is before))
        f._sublabels={1};filtered=observe(cls.__name__+' format_data cache retained',lambda f=f:dict(text=f.format_data(2.),same=f.labelOnlyBase is before))
        body='  let formatter='+cls.__name__+'::new(label_only_base=LogValue::Text("original"))\n'+bind_axis_code('formatter',(1.,10.))
        body+=assertion('formatter.format_data(2.0)',dict(value=data['value']['text'],source_error=None))+'  assert_eq(formatter.label_only_base(),LogValue::Text("original"))\n'
        body+='  log_formatter_state(formatter.as_base_formatter()).sublabels=Some(log_cache_explicit([1.0]))\n'
        body+=assertion('formatter.format_data(2.0)',dict(value=filtered['value']['text'],source_error=None))+'  assert_eq(formatter.label_only_base(),LogValue::Text("original"))\n'
        body+='  assert_true(physical_equal(formatter.as_base_formatter(),formatter.as_base_formatter().log_formatter().unwrap().as_base_formatter()))\n'
        add('derived virtual format_data context restoration',body,[data,filtered])
        reset();f=cls(labelOnlyBase=True);error=observe(cls.__name__+' no-axis data',lambda f=f:f.format_data(1.));restored=observe('label restored after noaxis data',lambda f=f:f.labelOnlyBase)
        body='  let formatter='+cls.__name__+'::new(label_only_base='+value_code(True)+')\n'+assertion('formatter.format_data(1.0)',error)+'  log_params_value(formatter.label_only_base(),'+value_code(True)+')\n'
        add('noaxis derived behavior/finally',body,[error,restored])
        for value in [0.,-0.,1.,2.,np.int64(123),np.float64(-.5),True]:
            short=observe(cls.__name__+' inherited short',lambda f=f,value=value:f.format_data_short(value))
            body='  let formatter='+cls.__name__+'::new()\n'+assertion('formatter.format_data_short_value('+number_code(value)+')',short)+'  assert_eq(formatter.get_offset(),"")\n'
            add('short needs no axis or preparation',body,[short])

    # Error/callback changes must restore the original label slot in finally.
    for failure in [False,True]:
        reset();f=source(labelOnlyBase='original')
        class MutatingAxis:
            def get_view_interval(self):
                f.labelOnlyBase='during'
                if failure:raise ValueError('fixture view error')
                return (1.,10.)
        f.axis=MutatingAxis()
        result=observe('format_data callback mutation/error',lambda:f.format_data(2.))
        restored=observe('format_data callback final slot',lambda:f.labelOnlyBase)
        callback='fn() raise @core.DataError' if failure else 'fn()'
        body='  let formatter=LogFormatter::new(label_only_base=LogValue::Text("original"))\n  let axis=FormatterAxisBinding::new()\n  axis.bind_view_interval('+callback+' {\n    formatter.set_label_only_base(LogValue::Text("during"))\n'
        body+='    raise @core.DataError::InvalidTicks(message="ValueError: fixture view error")\n' if failure else '    FormatterViewInterval::Sequence([1.0,10.0])\n'
        body+='  })\n  formatter.set_axis(Some(axis))\n'+assertion('formatter.format_data(2.0)',result)+'  assert_eq(formatter.label_only_base(),LogValue::Text("original"))\n'
        add('finally restores callback mutation',body,[result,restored])

    # Immutable tuple construction and exported snapshot have no writable alias.
    reset();owner=[1,.4];tuple_value=tuple(owner);f=source(minor_thresholds=tuple_value);owner[0]=99
    result=observe('tuple source detaches list and is immutable',lambda:dict(values=[value_record(x) for x in f.minor_thresholds],owner=[value_record(x) for x in owner]))
    body='''  let owner=[LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_int(1))),LogValue::Numeric(ScalarNumber::Number(0.4))]
  let tuple=LogThresholdTuple::new(owner)
  owner[0]=LogValue::Text("owner changed")
  let exported=tuple.values()
  exported[0]=LogValue::Text("snapshot changed")
  log_params_value(tuple.get(0),LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_int(1))))
  assert_eq(tuple.length(),2)
'''
    add('immutable tuple constructor/snapshot copies',body,[result])

    reset();owner=[1,.4];f=source(minor_thresholds=owner);f.axis=AxisFixture();f.set_locs();g=copy.copy(f)
    owner[0]=0;before=snapshot(f);g.set_locs();owner.append(99)
    records=[observe('list owner mutation and copy-only reprepare',lambda:dict(source=before,copy=snapshot(g),shared_container=f.minor_thresholds is g.minor_thresholds,cache_detached=f._sublabels is not g._sublabels,third=value_record(g.minor_thresholds[2])))]
    body='''  let owner=[LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_int(1))),LogValue::Numeric(ScalarNumber::Number(0.4))]
  let formatter=LogFormatter::new(minor_thresholds=Some(LogMinorThresholds::Sequence(owner)))
'''+bind_axis_code('formatter')+'''  formatter.set_locs()
  let copied=formatter.copy()
  owner[0]=LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_int(0)))
  copied.set_locs()
  owner.push(LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_int(99))))
  log_params_value(log_threshold_at(copied.minor_thresholds(),2),LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_int(99))))
'''+state_assert('formatter',dict(value=before))+state_assert('copied',dict(value=snapshot(g)))
    body+='  let snapshot=formatter.sublabels().unwrap()\n  snapshot.clear()\n  assert_eq(formatter.sublabels(),Some('+moon(before['sublabels'])+'))\n'
    add('borrowed list live length and independent cache slot',body,records)

    view_specs=[('signed',np.array([9.,.4,1.,9.]),lambda a:a[2:0:-1],2,-1,2),
                ('nested',np.array([9.,1.,9.,.4,9.]),lambda a:a[1:4][::2],1,2,2),
                ('zero',np.array([1.,9.]),lambda a:np.lib.stride_tricks.as_strided(a[:1],shape=(2,),strides=(0,),writeable=True),0,0,2),
                ('int64',np.array([9,1,0,9],dtype=np.int64),lambda a:a[1:3],1,1,2)]
    for label,owner,make_view,start,stride,length in view_specs:
        reset();view=make_view(owner);f=source(minor_thresholds=view);f.axis=AxisFixture();f.set_locs();g=copy.copy(f)
        view[0]=1.25;written=value_record(owner[start]);owner[start]=0;before=snapshot(f);g.set_locs();after=snapshot(g)
        result=observe('true threshold '+label+' alias/copy',lambda:dict(source=before,copy=after,owner_after_view_write=written,threshold_after_owner_write=value_record(g.minor_thresholds[0]),shared_view=f.minor_thresholds is g.minor_thresholds))
        initial={'signed':[9.,.4,1.,9.],'nested':[9.,1.,9.,.4,9.],'zero':[1.,9.]}.get(label)
        body='  let owner='+('['+', '.join(str(int(x))+'L' for x in [9,1,0,9])+']' if label=='int64' else moon(initial))+'\n'
        body+='  let full='+('TickValues::from_int64_array(owner)' if label=='int64' else 'TickValues::from_array(owner)')+'\n'
        if label=='nested':body+='  let intermediate=full.view(1,1,3)\n  let view=intermediate.view(0,2,2)\n'
        else:body+='  let view=full.view('+str(start)+','+str(stride)+','+str(length)+')\n'
        body+='  let formatter=LogFormatter::new(minor_thresholds=Some(LogMinorThresholds::NdArray(view)))\n'+bind_axis_code('formatter')+'  formatter.set_locs()\n  let copied=formatter.copy()\n  view.set(0,1.25)\n'
        body+='  assert_eq(owner['+str(start)+'],'+('1L' if label=='int64' else '1.25')+')\n'
        body+='  owner['+str(start)+']='+('0L' if label=='int64' else '0.0')+'\n  copied.set_locs()\n'
        body+='  log_params_value(log_threshold_at(copied.minor_thresholds(),0),'+value_code(np.int64(0) if label=='int64' else np.float64(0.))+')\n'
        body+=state_assert('formatter',dict(value=before))+state_assert('copied',dict(value=after))
        add('signed/nested/zero/int threshold alias '+label,body,[result])

    # Ordinary raw rebinds preserve the old prepared cache and copy scalar slots.
    for cls in classes:
        reset();f=cls();f.axis=AxisFixture();f.set_locs();g=copy.copy(f)
        g.set_base(3.);g.set_label_minor(None);g.minor_thresholds=None;g._linthresh='raw'
        original=observe(cls.__name__+' original after shallow copy rebind',lambda:snapshot(f))
        copied=observe(cls.__name__+' independent copied raw slots',lambda:snapshot(g))
        body='  let formatter='+cls.__name__+'::new()\n'+bind_axis_code('formatter')+'  formatter.set_locs()\n  let copied=formatter.copy()\n  copied.set_base('+value_code(3.)+')\n  copied.set_label_minor(LogValue::NoneValue)\n  copied.set_minor_thresholds(None)\n  copied.set_linthresh(LogValue::Text("raw"))\n'
        body+=state_assert('formatter',original)+state_assert('copied',copied)+'  assert_eq(formatter.axis(),copied.axis())\n  assert_true(!physical_equal(formatter.as_base_formatter(),copied.as_base_formatter()))\n'
        add('copy scalar/raw rebind independent '+cls.__name__,body,[original,copied])

    # Parent wrapper views retain the most derived virtual implementation.
    for cls in classes[1:]:
        reset();f=cls();f.axis=AxisFixture((1.,10.));result=observe(cls.__name__+' dynamic parent data',lambda:f.format_data(2.))
        body='  let formatter='+cls.__name__+'::new()\n'+bind_axis_code('formatter',(1.,10.))+'  let parent=formatter.as_log_formatter()\n  assert_true(physical_equal(parent.as_base_formatter(),formatter.as_base_formatter()))\n'
        body+=assertion('parent.format_data(2.0)',result)
        if cls.__name__=='LogFormatterSciNotation':body+='  let mathtext=formatter.as_mathtext_formatter()\n'+assertion('mathtext.format_data(2.0)',result)
        add('derived parent virtual retains style '+cls.__name__,body,[result])

    # Source-only dynamic or shape domains are recorded, not mapped to fake API errors.
    for cls in classes:
        for value in [np.array(2.),np.array([2.]),np.array([2.,3.]),object()]:
            result=observe(cls.__name__+' dynamic base shape/protocol',lambda cls=cls,value=value:float(cls(base=value)._base))
            source_only.append(dict(reason='base public input is six numeric/Text/None; NDArray scalar conversion and custom object float protocol excluded',type=type(value).__name__,observation=result))
    for value in [[],[1],np.array([0,1])]:
        reset();f=source(labelOnlyBase=value)
        result=observe('dynamic raw label truth',lambda:f(2.))
        source_only.append(dict(reason='raw label supports standard Text/six numeric/None, not arbitrary container truth',type=type(value).__name__,observation=result))
    for value in [np.array(1.),np.array([[1.,.4],[1.,.4]])]:
        reset();f=source(minor_thresholds=value)
        result=observe('raw thresholds 0D/2D',lambda:f.set_locs())
        source_only.append(dict(reason='numeric NDArray bridge is one-dimensional; shape errors source-only',shape=list(value.shape),observation=result))

    # Append-only regressions: original NdArray index messages retain the raw
    # index and current view length. No constructor-time two-element check.
    for dtype in [np.float64,np.int64]:
        for contents in [[],[0],[100]]:
            values=np.array(contents,dtype=dtype)
            for index in [-2,-1,0,1]:
                result=observe('short NdArray threshold index '+str(dtype),lambda values=values,index=index:value_record(values[index]))
                body='  let thresholds='+threshold_code('NdArray',values)+'\n'
                if result['source_error']:body+=assertion('log_threshold_at(thresholds,'+str(index)+')',result)
                else:body+='  log_params_value(log_threshold_at(thresholds,'+str(index)+'),'+value_code(result['value'])+')\n'
                add('appended short NdArray raw index diagnostics',body,[result])
            reset();f=source(minor_thresholds=values);f.axis=AxisFixture();f._sublabels={13.}
            result=observe('short NdArray threshold delayed prepare',lambda f=f:f.set_locs())
            after=observe('short NdArray post state',lambda f=f:snapshot(f))
            body='  let formatter=LogFormatter::new(minor_thresholds='+threshold_code('NdArray',values)+')\n'+bind_axis_code('formatter')
            body+='  log_formatter_state(formatter.as_base_formatter()).sublabels=Some(log_cache_explicit([13.0]))\n'
            body+=assertion('formatter.set_locs()',result) if result['source_error'] else '  formatter.set_locs()\n'
            body+=state_assert('formatter',after)+'  assert_eq(formatter.locations().length(),0)\n'
            add('appended empty/one-element NdArray lazy validation',body,[result,after])

    reset();owner=[100,.4];f=source(minor_thresholds=owner);f.axis=AxisFixture();f._sublabels={13.}
    body='  let owner=['+value_code(100)+','+value_code(.4)+']\n  let formatter=LogFormatter::new(minor_thresholds=Some(LogMinorThresholds::Sequence(owner)))\n'+bind_axis_code('formatter')
    body+='  log_formatter_state(formatter.as_base_formatter()).sublabels=Some(log_cache_explicit([13.0]))\n'
    records=[]
    for operation in ['pop','append','clear']:
        if operation=='pop':owner.pop();body+='  ignore(owner.pop())\n'
        elif operation=='append':owner.append(.4);body+='  owner.push('+value_code(.4)+')\n'
        else:owner.clear();body+='  owner.clear()\n'
        result=observe('borrowed threshold list '+operation+' then prepare',lambda:f.set_locs())
        after=observe('borrowed threshold list post '+operation,lambda:snapshot(f))
        records.extend([result,after])
        body+=assertion('formatter.set_locs()',result) if result['source_error'] else '  formatter.set_locs()\n'
        body+=state_assert('formatter',after)
    add('appended borrowed list resize observes live length',body,records)

    for start in range(0,len(cases),32):
        code+='\n///|\ntest "LogFormatter params original group '+str(start//32)+'" {\n'+''.join('  log_params_case_'+str(index)+'()\n' for index in range(start,min(start+32,len(cases))))+'}\n'
    payload=dict(source_hashes=ns['source_hashes'],python=sys.version.split()[0],numpy=np.__version__,host_profile=ns['log_host_profile'],
                 scope='Four complete original classes with real cbook context manager, strip_math, nonsingular and RcParams. Base float conversion six numeric/Text/None; raw labels and linthresh; immutable tuples versus live sequence/strided numeric threshold stores; ignored locations; independent shallow state slots; internal computed-cache snapshot and explicit whitebox cache fixtures only. No public arbitrary raw sublabel setter or ndarray0D2D/custom-object protocol claim.',
                 observation_count=len(observations),generated_case_count=len(cases),registered_test_count=(len(cases)+31)//32,cases=cases,source_only=source_only)
    return json.dumps(clean(payload),indent=2,allow_nan=False)+'\n',formatted(code)


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    outputs=generate(args.ticker)
    for name,text in zip(['testdata/log_formatter_params_reference.json','ticker/log_formatter_params_reference_wbtest.mbt'],outputs):
        target=ROOT/name
        if args.check:
            if not target.exists() or target.read_text()!=text:raise SystemExit('reference differs: '+name)
        else:target.write_text(text)
    payload=json.loads(outputs[0]);print('Log params:',payload['observation_count'],'observations;',payload['generated_case_count'],'private cases;',payload['registered_test_count'],'registered groups;',len(payload['source_only']),'source-only')


if __name__=='__main__':main()
