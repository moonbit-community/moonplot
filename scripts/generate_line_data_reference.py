"""Pinned original public Line data, lazy cache generations and ownerNone reference."""
from pathlib import Path
import argparse,ast,copy,hashlib,json,math,sys,datetime as dt
import numpy as np
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_line_units_reference as ref
host=ref.load_line_source();Line=host['Line'];Axes=host['Axes'];rows=[]


def clean(value):
    if isinstance(value,np.ndarray):return clean(value.tolist())
    if isinstance(value,np.generic):return clean(value.item())
    if isinstance(value,float) and not math.isfinite(value):return 'nan' if math.isnan(value) else 'inf' if value>0 else '-inf'
    if isinstance(value,dict):return {str(k):clean(v) for k,v in value.items()}
    if isinstance(value,(list,tuple)):return [clean(v) for v in value]
    return value


def fresh():
    figure=ref.ref.actual.Figure();figure.unit_events=[];axes=Axes(figure,0)
    line=ref.add(axes,[0.,1.],[10.,20.],'line')
    axes.events.clear();axes._stale_viewlims={'x':False,'y':False};line.stale=False
    return axes,line


def snapshot(axes,line):
    return clean({'xorig':line._xorig,'yorig':line._yorig,'xorig_type':type(line._xorig).__name__,
        'yorig_type':type(line._yorig).__name__,'xorig_dtype':str(line._xorig.dtype) if isinstance(line._xorig,np.ndarray)else None,
        'x':line._x,'y':line._y,'xy':line._xy,'path':None if line._path is None else line._path.vertices,
        'invalid':[line._invalidx,line._invalidy],'line_stale':line.stale,'view_stale':axes._stale_viewlims.copy(),
        'data':axes.dataLim._points,'minpos':axes.dataLim._minpos,
        'x_xy_alias':line._xy is not None and np.shares_memory(line._x,line._xy),
        'y_xy_alias':line._xy is not None and np.shares_memory(line._y,line._xy)})


def take(label,axes,line,operation,profile='typed scalar numeric/category/date candidate'):
    axes.events.clear();before=snapshot(axes,line)
    try:value=operation();error=None
    except Exception as exc:value=None;error={'type':type(exc).__name__,'message':str(exc)}
    rows.append({'id':len(rows),'label':label,'profile':profile,'before':before,'after':snapshot(axes,line),
        'value':clean(value),'events':copy.deepcopy(axes.events),'error':error})


a,l=fresh();external=[4.,5.]
take('set_xdata copies list, sets only x invalid and line stale, no range event',a,l,lambda:l.set_xdata(external))
external[0]=99.
take('caller list mutation cannot change copied original; original getter is direct',a,l,
    lambda:{'original':l.get_xdata(),'same_internal':l.get_xdata()is l._xorig})
take('valid processed y getter does not service invalid x',a,l,lambda:l.get_ydata(orig=False))
take('invalid processed x getter recaches, leaves dataLim and request flags unchanged',a,l,lambda:l.get_xdata(orig=False))
old_xy=l.get_xydata();old_x=l.get_xdata(orig=False)
take('borrowed original mutation with valid flags leaves converted cache stale',a,l,
    lambda:(l.get_xdata().__setitem__(0,42.),l.get_xydata())[1])
take('forced recache consumes original mutation and rebinds fresh xy',a,l,
    lambda:(l.recache_always(),{'old_xy_unchanged':old_xy.tolist(),'old_x_unchanged':old_x.tolist(),
        'same_xy':l.get_xydata()is old_xy,'same_x':l.get_xdata(orig=False)is old_x})[1])
take('processed x view mutation changes xy and cached path without invalidation',a,l,
    lambda:(l.get_xdata(orig=False).__setitem__(1,70.),l.get_xydata())[1])
take('explicit relim reads cached path and does not request autoscale',a,l,lambda:a.relim())

a,l=fresh();l.set_ydata([30.,40.]);l.stale=False
take('valid x processed getter ignores invalid y',a,l,lambda:l.get_xdata(orig=False))
def get_data_pair():
    xs,ys=l.get_data(orig=False)
    return {'returned':[xs,ys],'first_x_aliases_new_xy':np.shares_memory(xs,l._xy),
        'second_y_aliases_new_xy':np.shares_memory(ys,l._xy)}
take('get_data(orig=False) first returns valid x then y recache',a,l,
    get_data_pair)

a,l=fresh();l.set_xdata([2.,3.,4.]);l.stale=False
take('valid processed y can succeed while pending x shape is invalid',a,l,lambda:l.get_ydata(orig=False))
take('invalid processed x throws at broadcast and retains all old converted buffers',a,l,lambda:l.get_xdata(orig=False))
take('get_path retries same pending broadcast error without range change',a,l,lambda:l.get_path())

a,l=fresh()
take('set_data accepts replacement x before scalar y rejection',a,l,lambda:l.set_data([8.,9.],4.),profile='dynamic scalar-y error with sourceordered typed prior x write')
a,l=fresh()
take('scalar x rejection occurs before either setter writes',a,l,lambda:l.set_data(4.,[8.,9.]),profile='dynamic scalar-x rejection')
a,l=fresh()
take('set_data accepts incompatible sequence lengths without eager conversion',a,l,lambda:l.set_data([2.,3.,4.],[8.,9.]))
take('get_xydata performs deferred broadcast error after both setters succeeded',a,l,lambda:l.get_xydata())

a,l=fresh();owner=np.array([1,2,3,4],dtype=np.int64);view=owner[::-2]
take('ndarray setter copies logical strided values and retains original dtype',a,l,lambda:l.set_xdata(view),profile='ndarray original-container extension candidate')
owner[:]=99
take('ndarray owner mutation is isolated; processed dtype becomes float64',a,l,
    lambda:{'original':l.get_xdata(),'original_shares_owner':np.shares_memory(l.get_xdata(),owner),
        'processed':l.get_xdata(orig=False),'processed_dtype':str(l.get_xdata(orig=False).dtype)},profile='ndarray original-container extension candidate')

# The real Artist descriptor/copy hook supplies the narrow stale propagation
# behavior; graphical construction and the callback target remain explicit.
artist_path=ref.P.with_name('artist.py')
artist=next(n for n in ast.parse(artist_path.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='Artist')
selected=[copy.deepcopy(n)for n in artist.body if isinstance(n,ast.FunctionDef)and n.name in{'stale','__getstate__'}]
namespace={}
exec(compile(ast.fix_missing_locations(ast.Module(body=[ast.ClassDef(name='OriginalStale',bases=[],keywords=[],body=selected,decorator_list=[])],type_ignores=[])),str(artist_path),'exec'),namespace)
class StaleLine(Line,namespace['OriginalStale']):
    _animated=False
    stale_callback=None
a,l=fresh();s=StaleLine(a,[0.,1.],[10.,20.],'stale line');s.recache();s.stale=False
callback_events=[]
def stale_callback(artist,value):callback_events.append([artist.name,value])
s.stale_callback=stale_callback
take('original Artist stale setter calls target on each accepted coordinate setter',a,s,
    lambda:(s.set_data([4.,5.],[30.,40.]),{'callbacks':callback_events.copy()})[1],profile='real Artist stale descriptor with recording callback target')
def shallow_copy():
    copied=copy.copy(s)
    initial={'same_xorig':copied._xorig is s._xorig,'same_yorig':copied._yorig is s._yorig,
        'same_xy':copied._xy is s._xy,'same_path':copied._path is s._path,'same_axes':copied.axes is s.axes,
        'copied_stale_callback_is_None':copied.stale_callback is None}
    copied.set_xdata([60.,70.]);copied.get_xydata()
    initial['source_after_copy_rebind']=snapshot(a,s);initial['copy_after_rebind']=snapshot(a,copied)
    return initial
take('copy.copy uses original Artist getstate: shared buffers, callback removed, independent rebind',a,s,shallow_copy,
    profile='native shallow copy protocol; not a chosen public Moon clone API')


class DetachedLine(ref.Line):
    recache=ref.original_recache
    convert_xunits=ref.original_xconv
    convert_yunits=ref.original_yconv


def clean(value):
    if isinstance(value,np.ndarray):return clean(value.tolist())
    if isinstance(value,np.generic):return clean(value.item())
    if isinstance(value,float) and not math.isfinite(value):return 'nan' if math.isnan(value) else 'inf' if value>0 else '-inf'
    if isinstance(value,dict):return {str(k):clean(v) for k,v in value.items()}
    if isinstance(value,(list,tuple)):return [clean(v) for v in value]
    return value


def observe(original):
    line=DetachedLine(None,original,list(range(len(original))),'detached')
    before={'invalid':[line._invalidx,line._invalidy],'has_xy':line._xy is not None,'stale':line.stale}
    try:processed=line.get_xydata();error=None
    except Exception as exc:processed=None;error={'type':type(exc).__name__,'message':str(exc)}
    return clean({'before':before,'processed':processed,'error':error,
        'processed_x_bits':None if processed is None else [int(value)for value in processed[:,0].view(np.uint64)],
        'after':{'invalid':[line._invalidx,line._invalidy],'has_xy':line._xy is not None,'stale':line.stale}})


texts=['1_0','١٢.٥','\u2003-3.5\u00a0','+NaN','-NaN','INF','-Infinity','9'*5000]
python_values=[]
for value in texts:
    converted=float(value)
    python_values.append({'value':clean(converted),'bits':int(np.float64(converted).view(np.uint64))})
source=observe(texts)
actual_bits=source['processed_x_bits']
checks=[]
for text in ['1,2','1__0','\x1c1\x1f','\u200b1','0x1p0','nan(1)']:
    item={'text':text,'source':observe([text])}
    try:item['python_float']={'value':clean(float(text)),'error':None}
    except Exception as exc:item['python_float']={'value':None,'error':{'type':type(exc).__name__,'message':str(exc)}}
    checks.append(item)
detached_rows=[{'profile':'ownerNone Numeric','original':[2.,-3.5,0.],'source':observe([2.,-3.5,0.])},
    {'profile':'ownerNone Category float-text accepted','texts':texts,'source':source,'python_float':python_values,
        'source_x_bits':actual_bits,'python_float_bits_match':actual_bits==[item['bits']for item in python_values]},
    {'profile':'ownerNone Category float-text rejected','cases':checks},
    {'profile':'ownerNone Date datetime original','original':['2024-01-01T00:00:00+00:00','2024-01-02T00:00:00'],
        'source':observe([dt.datetime(2024,1,1,tzinfo=dt.timezone.utc),dt.datetime(2024,1,2)])}]


from generate_auto_date_reference import formatted
from generate_scale_defaults_reference import moon

HEADER='''// Generated from pinned original Line data/cache methods; do not edit.

///|
fn line_data_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn line_data_source_numbers(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() { line_data_source_double(actual[index], expected[index]) }
}

///|
fn line_data_source_original(value : LineData) -> Array[Double] raise {
  guard value is LineData::Numeric(values) else { fail("expected Numeric original") }
  values
}

///|
fn line_data_source_aliases(first : @ticker.TickValues, second : @ticker.TickValues) -> Bool raise {
  let old = first.get(0)
  first.set(0, -999.5)
  let aliases = second.get(0) == -999.5
  first.set(0, old)
  aliases
}

///|
// Controlled owner=None fixture, not a public unattached Line constructor.
// Python's uninitialized optional cache is projected to an inaccessible empty
// generation; public refresh outcome, flags and original data are compared.
fn line_data_source_detached(x : LineData, y : LineData) -> Line2D {
  { points: [], x: x.copy(), y: y.copy(), cache: line2d_cache_from_flat([]),
    invalid_x: true, invalid_y: true, owner: None, removal_parent: None,
    visible: true, stale: true }
}
'''


def number(value):
    if isinstance(value,str) and value in ['nan','inf','-inf']:
        return {'nan':'(0.0 / 0.0)','inf':'(1.0 / 0.0)','-inf':'(-1.0 / 0.0)'}[value]
    return moon(float(value))


def array(values):return '['+', '.join(number(value) for value in values)+']'
def flat(values):return [value for point in values for value in point]


def setup():
    return ['let axes = figure().axes()',
        'let line = axes.plot_line(LineData::Numeric([0.0, 1.0]), LineData::Numeric([10.0, 20.0]))',
        'axes.x_axis().clear_autoscale_request()',
        'axes.y_axis().clear_autoscale_request()',
        '// Match the source host\'s explicitly consumed initial drawing-stale flag.',
        'line.mark_drawn()']


def state_assert(state):
    lines=['{',
        'line_data_source_numbers(line_data_source_original(line.get_xdata()), '+array(state['xorig'])+')',
        'line_data_source_numbers(line_data_source_original(line.get_ydata()), '+array(state['yorig'])+')',
        '// Read the retained cache directly; recording must not trigger a lazy getter.',
        'line_data_source_numbers(line.cache.xs.to_array(), '+array(state['x'])+')',
        'line_data_source_numbers(line.cache.ys.to_array(), '+array(state['y'])+')',
        'line_data_source_numbers(line.cache.flat.to_array(), '+array(flat(state['xy']))+')',
        'assert_eq([line.invalid_x, line.invalid_y], '+moon(state['invalid'])+')',
        'assert_eq(line.stale(), '+moon(state['line_stale'])+')',
        'assert_eq(axes.x_axis().autoscale_stale(), '+moon(state['view_stale']['x'])+')',
        'assert_eq(axes.y_axis().autoscale_stale(), '+moon(state['view_stale']['y'])+')']
    for coordinate,horizontal in [(0,'true'),(1,'false')]:
        lines+=['line_data_source_numbers([axes.data_limits(horizontal='+horizontal+').lower(), axes.data_limits(horizontal='+horizontal+').upper(), axes.data_minpos(horizontal='+horizontal+')], '+array([state['data'][0][coordinate],state['data'][1][coordinate],state['minpos'][coordinate]])+')']
    return lines+['}']


def expect_error(statement,error,*,native_prefix=False):
    message=(error['type']+': ' if native_prefix else '')+error['message']
    return ['assert_true(try { '+statement+'; false } catch { @core.DataError::InvalidTicks(message~) => message == '+moon(message)+'; _ => false })']


def returned(expression,expected):
    return ['line_data_source_numbers('+expression+'.to_array(), '+array(expected)+')']


def render_primary(payload):
    observations=payload['data_observations'];chunks=[]
    # Each function preserves a complete source sequence, including cached view
    # handles borrowed by an earlier operation and used after later rebinding.
    lines=['///|','fn line_data_source_sequence_0() -> Unit raise {']+setup()
    for index in range(8):
        row=observations[index];lines+=['// '+str(index)+' '+row['label']]+state_assert(row['before'])
        if index==0:
            lines+=['let incoming = [4.0, 5.0]','line.set_xdata(LineData::Numeric(incoming))']
        elif index==1:
            lines+=['incoming[0] = 99.0','let borrowed_original = line_data_source_original(line.get_xdata())']
            lines+=['assert_true(!physical_equal(incoming, borrowed_original))',
                'assert_true(physical_equal(borrowed_original, line_data_source_original(line.get_xdata())))']
        elif index==2:lines+=returned('line.y_values_checked()',row['value'])
        elif index==3:
            lines+=returned('line.x_values_checked()',row['value'])
            lines+=['let old_xy = line.xy_values_checked()','let old_x = line.x_values_checked()']
        elif index==4:
            lines+=['line_data_source_original(line.get_xdata())[0] = 42.0']
            lines+=returned('line.xy_values_checked()',flat(row['value']))
        elif index==5:
            lines+=['line.recache_checked(always=true)']
            lines+=returned('old_xy',flat(row['value']['old_xy_unchanged']))+returned('old_x',row['value']['old_x_unchanged'])
            lines+=['assert_eq(line_data_source_aliases(old_xy, line.cache.flat), '+moon(row['value']['same_xy'])+')',
                'assert_eq(line_data_source_aliases(old_x, line.cache.xs), '+moon(row['value']['same_x'])+')']
        elif index==6:
            lines+=['line.x_values_checked().set(1, 70.0)']+returned('line.xy_values_checked()',flat(row['value']))
        elif index==7:lines+=['axes.relim_checked()']
        lines+=state_assert(row['after'])
    chunks.append('\n'.join(lines+['}']))

    lines=['///|','fn line_data_source_sequence_1() -> Unit raise {']+setup()
    lines+=['line.set_ydata(LineData::Numeric([30.0, 40.0]))','line.mark_drawn()']
    for index in [8,9]:
        row=observations[index];lines+=['// '+str(index)+' '+row['label']]+state_assert(row['before'])
        if index==8:lines+=returned('line.x_values_checked()',row['value'])
        else:
            lines+=['let (xs, ys) = line.data_values_checked()']
            lines+=returned('xs',row['value']['returned'][0])+returned('ys',row['value']['returned'][1])
            lines+=['assert_eq(line_data_source_aliases(xs, line.cache.xs), '+moon(row['value']['first_x_aliases_new_xy'])+')',
                'assert_eq(line_data_source_aliases(ys, line.cache.ys), '+moon(row['value']['second_y_aliases_new_xy'])+')']
        lines+=state_assert(row['after'])
    chunks.append('\n'.join(lines+['}']))

    lines=['///|','fn line_data_source_sequence_2() -> Unit raise {']+setup()
    lines+=['line.set_xdata(LineData::Numeric([2.0, 3.0, 4.0]))','line.mark_drawn()']
    for index in [10,11,12]:
        row=observations[index];lines+=['// '+str(index)+' '+row['label']]+state_assert(row['before'])
        if index==10:lines+=returned('line.y_values_checked()',row['value'])
        else:
            # The public flat getter has the same either-invalid predicate as
            # original get_path; no public Path API is invented for row12.
            call='line.x_values_checked()' if index==11 else 'line.xy_values_checked()'
            lines+=expect_error('ignore('+call+')',row['error'])
        lines+=state_assert(row['after'])
    chunks.append('\n'.join(lines+['}']))

    lines=['///|','fn line_data_source_sequence_3() -> Unit raise {']+setup()
    for index in [15,16]:
        row=observations[index];lines+=['// '+str(index)+' '+row['label']]+state_assert(row['before'])
        if index==15:lines+=['line.set_data(LineData::Numeric([2.0, 3.0, 4.0]), LineData::Numeric([8.0, 9.0]))']
        else:lines+=expect_error('ignore(line.xy_values_checked())',row['error'])
        lines+=state_assert(row['after'])
    chunks.append('\n'.join(lines+['}']))
    return chunks


def detached_assert(source):
    lines=['assert_eq([line.invalid_x, line.invalid_y], '+moon(source['after']['invalid'])+')',
        'assert_eq(line.stale(), '+moon(source['after']['stale'])+')','assert_true(line.owner is None)']
    if source['processed'] is not None:
        lines+=returned('line.cache.flat',flat(source['processed']))
    else:lines+=['assert_eq(line.cache.flat.length(), 0)']
    return lines


def render_detached(payload):
    chunks=[]
    for index,row in enumerate(payload['detached_profiles']):
        lines=['///|','fn line_data_source_detached_'+str(index)+'() -> Unit raise {']
        if index==0:
            lines+=['let line = line_data_source_detached(LineData::Numeric('+array(row['original'])+'), LineData::Numeric([0.0, 1.0, 2.0]))',
                'ignore(line.xy_values_checked())']+detached_assert(row['source'])
        elif index==1:
            lines+=['let line = line_data_source_detached(LineData::Category('+moon(row['texts'])+'), LineData::Numeric('+array(list(range(len(row['texts']))))+'))',
                'ignore(line.xy_values_checked())']+detached_assert(row['source'])
        elif index==2:
            for case in row['cases']:
                lines+=['{','let line = line_data_source_detached(LineData::Category('+moon([case['text']])+'), LineData::Numeric([0.0]))']
                lines+=expect_error('ignore(line.xy_values_checked())',case['source']['error'],native_prefix=True)
                lines+=detached_assert(case['source'])+['}']
        elif index==3:
            lines+=['let line = line_data_source_detached(LineData::Date([@date.RRuleDateTime::aware(@date.datetime(2024, 1, 1)), @date.RRuleDateTime::naive(@date.datetime(2024, 1, 2))]), LineData::Numeric([0.0, 1.0]))']
            lines+=expect_error('ignore(line.xy_values_checked())',row['source']['error'],native_prefix=True)+detached_assert(row['source'])
        chunks.append('\n'.join(lines+['}']))
    return chunks


def render(payload):
    chunks=[HEADER]+render_primary(payload)+render_detached(payload)
    calls=['line_data_source_sequence_'+str(index)+'() catch { error => fail('+moon('Line data original sequence '+str(index)+': ')+' + error.to_string()) }'for index in range(4)]
    calls+=['line_data_source_detached_'+str(index)+'() catch { error => fail('+moon('Line data ownerNone profile '+str(index)+': ')+' + error.to_string()) }'for index in range(4)]
    chunks+=['///|\ntest "original Line data and detached conversion group 0" {\n'+'\n'.join(calls)+'\n}']
    return formatted('\n\n'.join(chunks)+'\n')


def collect():
    return {'source_hashes':ref.source_hashes(),'python':sys.version.split()[0],'numpy':np.__version__,
        'counts':{'all_profile_records':25,'data_records':21,'typed_data_records':15,'source_only_data_records':6,'detached_profiles':4,
            'typed_sequences':8,'registered_groups':1},
        'source_only_data_ids':[13,14,17,18,19,20],
        'd39_protocol_projection':{'09_borrowed_original_mutation':'new data row04',
            '10_forced_recache':'new data row05','11_lazy_set_x':'new data row00',
            '12_processed_getter':'new data row03','13_scalar_y_rejection':'source-only; scalar is outside LineData'},
        'host_boundaries':{
            'source':'Complete original Line data/getters/recache, Artist conversions and Axes relim under accepted short/default-style numeric Path storage host; original Artist stale/copy methods execute only in explicitly source-only rows.',
            'typed':'Numeric/Category/Date LineData arrays, copied setter input, borrowed originals and per-generation Float64 TickValues. Public initial plot_line uses equal-length typed convenience, not the complete pyplot plot parser.',
            'initial_state':'Source consumes initial Line stale and axis view requests explicitly. Whitebox fixture does the same without invoking a renderer/autoscale callback.',
            'path':'No public Path object is introduced. Source row12 get_path error has the same either-invalid refresh stage as typed flat xy getter; cached source path values are retained, not falsely compared to a migrated Path API.',
            'detached':'Original ownerNone fresh optional cache is projected to a controlled whitebox empty generation with invalid flags. Only refresh outcomes/raw data/invalid/stale are compared; no public unattached constructor or cache-absence identity claim.',
            'errors':'Exact native errors retained; NumPy broadcast errors map unprefixed to InvalidTicks, detached float/date error messages use the existing NativeType prefix convention.',
            'source_only':'Scalar rejected setter inputs, native ndarray original dtype, GUI stale callback targets and native Python copy.copy(Line) are outside this typed container/API profile.',
            'numeric':'Finite/infinite bits are exact; NaN classification is asserted without payload promises. Native float-text bits, including NaN sign, remain in JSON and independently match Python float.'},
        'data_observations':clean(rows),'detached_profiles':clean(detached_rows)}


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',nargs='?',type=Path,default=ref.P);parser.add_argument('--check',action='store_true')
    args=parser.parse_args();ref.load_line_source(args.ticker);payload=collect()
    document=json.dumps(payload,ensure_ascii=False,indent=2,allow_nan=False)+'\n'
    outputs={ROOT/'testdata/line_data_reference.json':document,
        ROOT/'scene/line_data_reference_wbtest.mbt':render(payload)}
    for path,content in outputs.items():
        if args.check:
            if not path.exists()or path.read_text()!=content:raise SystemExit('Line data reference differs: '+str(path))
        else:path.write_text(content)
    print(json.dumps({'check':args.check,**payload['counts'],'json_sha256':hashlib.sha256(document.encode()).hexdigest()}))


if __name__=='__main__':main()
