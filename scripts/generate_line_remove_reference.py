"""Pinned complete-original stable Line remove and owner lifecycle reference."""
from pathlib import Path
import argparse,ast,collections.abc,copy,hashlib,json,sys,types
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_line_units_reference as ref
P=ref.P;artist_path=P.with_name('artist.py');axes_path=P.parent/'axes/_base.py'
artist=next(n for n in ast.parse(artist_path.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='Artist')
namespace={'_api':ref.ns['_api']}
tree=ast.parse(artist_path.read_bytes())
stale_callback=next(n for n in tree.body if isinstance(n,ast.FunctionDef)and n.name=='_stale_axes_callback')
exec(compile(ast.Module(body=[copy.deepcopy(stale_callback)],type_ignores=[]),str(artist_path),'exec'),namespace)
names={'remove','get_figure','set_figure','axes','stale','is_transform_set','set_transform','get_mouseover','get_clip_path','get_label','set_label','_set_in_autoscale'}
methods=[copy.deepcopy(n)for n in artist.body if isinstance(n,ast.FunctionDef)and n.name in names]
exec(compile(ast.fix_missing_locations(ast.Module(body=[ast.ClassDef(name='OriginalArtistLifecycle',bases=[],keywords=[],body=methods,decorator_list=[])],type_ignores=[])),str(artist_path),'exec'),namespace)

class Line(ref.Line,namespace['OriginalArtistLifecycle']):
    recache=ref.original_recache
    convert_xunits=ref.original_xconv
    convert_yunits=ref.original_yconv
    def __init__(self,x,y,name,mouseover=False):
        self._axes=None;self._parent_figure=None;self._remove_method=None
        self._animated=False;self._stale=False;self.stale_callback=None
        self._transformSet=False;self._transform=None;self._label=''
        self._mouseover=mouseover;self._clippath=object()
        super().__init__(None,x,y,name)
    def pchanged(self):pass  # Declared presentation notification sink.

base=next(n for n in ast.parse(axes_path.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='_AxesBase')
cb=next(n for n in ast.parse(P.with_name('cbook.py').read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='silent_list')
exec(compile(ast.Module(body=[copy.deepcopy(cb)],type_ignores=[]),str(P.with_name('cbook.py')),'exec'),namespace)
namespace.update(Sequence=collections.abc.Sequence,mlines=types.SimpleNamespace(Line2D=Line),cbook=types.SimpleNamespace(silent_list=namespace['silent_list']))
alist=next(n for n in base.body if isinstance(n,ast.ClassDef)and n.name=='ArtistList')
exec(compile(ast.Module(body=[copy.deepcopy(alist)],type_ignores=[]),str(axes_path),'exec'),namespace)
namespace['_AxesBase']=types.SimpleNamespace(ArtistList=namespace['ArtistList'])
selected=[copy.deepcopy(n)for n in base.body if isinstance(n,ast.FunctionDef)and n.name in{'lines','get_lines','add_line','_set_artist_props'}]
exec(compile(ast.fix_missing_locations(ast.Module(body=[ast.ClassDef(name='OriginalAxesLifecycle',bases=[],keywords=[],body=selected,decorator_list=[])],type_ignores=[])),str(axes_path),'exec'),namespace)
class Axes(ref.Axes,namespace['OriginalAxesLifecycle']):
    ArtistList=namespace['ArtistList']
    lines=namespace['OriginalAxesLifecycle'].lines
    def _set_artist_props(self,artist):
        if isinstance(artist,Line):return namespace['OriginalAxesLifecycle']._set_artist_props(self,artist)
        # The accepted clear host's title/Text objects are presentation sinks.
    grid=ref.ref.actual.clear.Axes.grid
    _set_title_offset_trans=ref.ref.actual.clear.Axes._set_title_offset_trans
    _gen_axes_patch=ref.ref.actual.clear.Axes._gen_axes_patch
    set_axis_on=ref.ref.actual.clear.Axes.set_axis_on

fignode=next(n for n in ast.parse(P.with_name('figure.py').read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='FigureBase')
delaxes_node=next(n for n in fignode.body if isinstance(n,ast.FunctionDef)and n.name=='delaxes')
exec(compile(ast.Module(body=[copy.deepcopy(delaxes_node)],type_ignores=[]),str(P.with_name('figure.py')),'exec'),namespace)

def fresh():
    f=ref.ref.actual.Figure();f.unit_events=[];a=Axes(f,0);f.created.append(a);f.active.append(a)
    f._axstack=[a];f._localaxes=f.active;f._root_figure=f
    f.canvas=types.SimpleNamespace(release_mouse=lambda ax:None)
    f._axobservers=types.SimpleNamespace(process=lambda *args:None)
    f.delaxes=types.MethodType(namespace['delaxes'],f)
    a.axes=a;a._twinned_axes=f.twins
    a.spines={name:types.SimpleNamespace(_clear=lambda:None)for name in ['left','right','top','bottom']}
    a.patch=ref.ref.actual.clear.PatchSink();a._facecolor='white';a.transAxes=object();a.child_axes=[]
    for axis in a._axis_map.values():axis.set_clip_path=lambda patch:None
    a._mouseover_set=set();a.stale=False;f.stale=False
    a._stale_viewlims={'x':False,'y':False}
    return f,a

def state(f,a,lines):
    return {'children':[getattr(child,'name','other')for child in a._children],
        'lines':[line.name for line in a.lines],'axis_stale':a.stale,'figure_stale':f.stale,
        'active_axes':len(f.active),'data':a.dataLim._points.tolist(),'requests':a._stale_viewlims.copy(),
        'handles':[{'name':line.name,'owner_is_axes':line.axes is a,'figure_is_parent':line.get_figure()is f,
            'remove_method_is_None':line._remove_method is None,'stale_callback_is_None':line.stale_callback is None,
            'in_mouseover':line in a._mouseover_set,'invalid':[line._invalidx,line._invalidy],
            'stale':line.stale,'xy':None if line._xy is None else line._xy.tolist()}for line in lines]}

rows=[]
def take(label,f,a,lines,operation):
    a.events.clear();before=state(f,a,lines)
    try:value=operation();error=None
    except Exception as exc:value=None;error={'type':type(exc).__name__,'message':str(exc)}
    rows.append({'id':len(rows),'label':label,'before':before,'after':state(f,a,lines),
        'value':value,'error':error,'events':copy.deepcopy(a.events)})

f,a=fresh();first=Line([0.,1.],[10.,20.],'first',True);last=Line([10.,20.],[30.,40.],'last',True)
take('complete add_line installs owner/remove callback and extends dataLim without request',f,a,[first,last],
    lambda:{'same_first':a.add_line(first)is first,'same_last':a.add_line(last)is last})
view=a.lines;snapshot=a.get_lines()
take('get_lines is a handle-preserving list snapshot, lines is a live ArtistList',f,a,[first,last],
    lambda:{'snapshot_type':type(snapshot).__name__,'snapshot_names':[line.name for line in snapshot],
        'same_first':snapshot[0]is first,'same_last':snapshot[1]is last,'live_count':len(view)})
a.stale=False;f.stale=False
take('remove last Line unlinks child and mouseover but leaves cached limits and requests',f,a,[first,last],lambda:last.remove())
take('retained get_lines snapshot stays old while retained ArtistList length changes',f,a,[first,last],
    lambda:{'old_snapshot_names':[line.name for line in snapshot],'live_names':[line.name for line in view]})
take('second remove retries retained list.remove callback before further unlink',f,a,[first,last],lambda:last.remove())
take('removed handle retains numeric data setters and lazy recache with owner None',f,a,[first,last],
    lambda:(last.set_data([50.,60.],[70.,80.]),last.get_xydata().tolist())[1])
take('explicit relim alone removes old cached extrema, still no autoscale request',f,a,[first,last],lambda:a.relim())
take('same removed Line can be readded and gets a fresh installed callback',f,a,[first,last],lambda:a.add_line(last)is last)
take('mutating get_lines returned list cannot remove actual child',f,a,[first,last],lambda:(snapshot.clear(),len(a.lines))[1])

f,a=fresh();old=Line([0.,1.],[10.,20.],'old');a.add_line(old)
take('complete original Axes clear detaches Line and nulls remove method',f,a,[old],lambda:a._AxesBase__clear())
take('after full clear old Line remove gives NotImplementedError',f,a,[old],lambda:old.remove())
take('after full clear old Line numeric data remains usable',f,a,[old],lambda:(old.set_data([4.,5.],[6.,7.]),old.get_xydata().tolist())[1])

f,a=fresh();kept=Line([0.,1.],[10.,20.],'kept');a.add_line(kept)
take('Figure.delaxes removes panel membership without clearing Line owner or children',f,a,[kept],lambda:f.delaxes(a))
take('Line.remove still works on retained Axes after Figure.delaxes',f,a,[kept],lambda:kept.remove())

# An already removed child is absent from __clear's reset loop. Its callback
# remains bound, unlike the still-attached child in original records09–11.
f,a=fresh();removed=Line([0.,1.],[10.,20.],'removed');a.add_line(removed)
previous_xy=removed._xy;removed.remove();same_xy_after_remove=previous_xy is removed._xy
def clear_then_repeat():
    a._AxesBase__clear()
    removed.remove()
take('remove then clear leaves historical callback and repeated ValueError',f,a,[removed],clear_then_repeat)
rows[-1]['same_xy_after_remove']=same_xy_after_remove
rows[-1]['same_xy_after_clear']=previous_xy is removed._xy


from generate_auto_date_reference import formatted
from generate_scale_defaults_reference import moon

HEADER='''// Generated from pinned complete original Artist/Line removal methods; do not edit.

///|
fn line_remove_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn line_remove_source_numbers(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() { line_remove_source_double(actual[index], expected[index]) }
}

///|
fn line_remove_source_aliases(first : @ticker.TickValues, second : @ticker.TickValues) -> Bool raise {
  let old = first.get(0)
  first.set(0, -999.5)
  let aliases = second.get(0) == -999.5
  first.set(0, old)
  aliases
}
'''


def number(value):
    if isinstance(value,str)and value in ['inf','-inf','nan']:
        return {'nan':'(0.0 / 0.0)','inf':'(1.0 / 0.0)','-inf':'(-1.0 / 0.0)'}[value]
    return moon(float(value))


def array(values):return '['+', '.join(number(value)for value in values)+']'
def flat(points):return [value for point in points for value in point]


def setup(names):
    lines=['let fig = figure()','let axes = fig.axes()']
    for name in names:
        xs,ys=([10.,20.],[30.,40.])if name=='last'else([0.,1.],[10.,20.])
        lines+=['let '+name+' = axes.plot_line(LineData::Numeric('+array(xs)+'), LineData::Numeric('+array(ys)+'))']
    return lines+['axes.x_axis().clear_autoscale_request()','axes.y_axis().clear_autoscale_request()']


def assert_state(state):
    lines=['{','assert_eq(fig.axes_list().length(), '+str(state['active_axes'])+')',
        'assert_eq(axes.state.val.artists.length(), '+str(len(state['children']))+')',
        'assert_eq(axes.state.val.line_originals.length(), '+str(len(state['lines']))+')']
    for index,name in enumerate(state['children']):
        lines+=['guard axes.state.val.artists['+str(index)+'] is Artist::Line(buffer_'+str(index)+', _) else { fail("expected attached Line artist") }',
            'assert_true(physical_equal(buffer_'+str(index)+', '+name+'.points))']
    for index,name in enumerate(state['lines']):
        lines+=['assert_true(physical_equal(axes.state.val.line_originals['+str(index)+'], '+name+'))']
    for horizontal,coordinate in [('true',0),('false',1)]:
        lines+=['line_remove_source_numbers([axes.data_limits(horizontal='+horizontal+').lower(), axes.data_limits(horizontal='+horizontal+').upper()], '+array([state['data'][0][coordinate],state['data'][1][coordinate]])+')']
    for name in ['x','y']:
        lines+=['assert_eq(axes.'+name+'_axis().autoscale_stale(), '+moon(state['requests'][name])+')']
    for handle in state['handles']:
        name=handle['name']
        lines+=['assert_eq('+name+'.owner is Some(_), '+moon(handle['owner_is_axes'])+')',
            'assert_eq('+name+'.removal_parent is None, '+moon(handle['remove_method_is_None'])+')',
            'assert_eq(['+name+'.invalid_x, '+name+'.invalid_y], '+moon(handle['invalid'])+')',
            'assert_eq('+name+'.stale(), '+moon(handle['stale'])+')']
        if handle['owner_is_axes']:
            lines+=['assert_true(physical_equal('+name+'.owner.unwrap().state, axes.state))']
        if not handle['remove_method_is_None']:
            lines+=['assert_true(physical_equal('+name+'.removal_parent.unwrap().state, axes.state))']
        if handle['xy']is not None:
            lines+=['line_remove_source_numbers('+name+'.cache.flat.to_array(), '+array(flat(handle['xy']))+')']
    return lines+['}']


def error_call(statement,error):
    return ['assert_true(try { '+statement+'; false } catch { @core.DataError::InvalidTicks(message~) => message == '+moon(error['type']+': '+error['message'])+'; _ => false })']


def render_sequence(index,selected,names,operations,payload,preamble=None):
    lines=['///|','fn line_remove_source_sequence_'+str(index)+'() -> Unit raise {']+setup(names)
    if preamble:lines+=preamble
    for record in selected:
        row=payload['observations'][record]
        lines+=['// Source '+str(record)+': '+row['label']]+assert_state(row['before'])
        statement=operations[record]
        lines+=error_call(statement,row['error'])if row['error']else[statement]
        lines+=assert_state(row['after'])
        if record==14:
            lines+=['assert_eq(line_remove_source_aliases(previous_xy, removed.cache.flat), '+moon(row['same_xy_after_clear'])+')']
        if row['value']is not None and record in [5,11]:
            name='last'if record==5 else'old'
            lines+=['line_remove_source_numbers('+name+'.xy_values_checked().to_array(), '+array(flat(row['value']))+')']
    return '\n'.join(lines+['}'])


def render(payload):
    chunks=[HEADER]
    chunks+=[render_sequence(0,[2,4,5,6],['first','last'],{
        2:'last.remove()',4:'last.remove()',
        5:'last.set_data(LineData::Numeric([50.0, 60.0]), LineData::Numeric([70.0, 80.0])); ignore(last.xy_values_checked())',
        6:'axes.relim_checked()'},payload)]
    chunks+=[render_sequence(1,[9,10,11],['old'],{
        9:'axes.clear_checked()',10:'old.remove()',
        11:'old.set_data(LineData::Numeric([4.0, 5.0]), LineData::Numeric([6.0, 7.0])); ignore(old.xy_values_checked())'},payload)]
    chunks+=[render_sequence(2,[12,13],['kept'],{12:'fig.delaxes(axes)',13:'kept.remove()'},payload)]
    extra=payload['observations'][14]
    chunks+=[render_sequence(3,[14],['removed'],{14:'axes.clear_checked(); removed.remove()'},payload,preamble=[
        'let previous_xy = removed.xy_values_checked()','removed.remove()',
        'assert_eq(line_remove_source_aliases(previous_xy, removed.cache.flat), '+moon(extra['same_xy_after_remove'])+')'])]
    calls=['line_remove_source_sequence_'+str(index)+'() catch { error => fail('+moon('Line remove original sequence '+str(index)+': ')+' + error.to_string()) }'for index in range(4)]
    chunks+=['///|\ntest "original Line removal lifecycle group 0" {\n'+'\n'.join(calls)+'\n}']
    return formatted('\n\n'.join(chunks)+'\n')


def collect():
    return {'source_hashes':{**ref.source_hashes(),'figure.py':hashlib.sha256(P.with_name('figure.py').read_bytes()).hexdigest()},
        'python':sys.version.split()[0],
        'counts':{'preparation_records':14,'additional_records':1,'all_profile_records':15,
            'typed_records':10,'source_only_records':5,'typed_sequences':4,'registered_groups':1},
        'source_only_ids':[0,1,3,7,8],
        'host_boundaries':{
            'source':'Complete original Artist remove/owner/stale methods, Axes add_line/get_lines/ArtistList/__clear and Figure.delaxes/_remove_axes; accepted short/default numeric Line/Path and declared graphical/observer sinks.',
            'typed':'Only public Line2D.remove is added. Public plot_line is the typed setup bridge. Stable artist/registry membership is inspected privately; no get_lines, live ArtistList or public add_line parity is claimed.',
            'stale':'Original Axes stale assignment is stored by the source host; full GUI Axes-to-Figure propagation is outside this profile. Line stale/invalid/cache and axis autoscale requests remain directly checked.',
            'metadata':'Parent figure, mouseover-set and stale_callback fields remain complete native observations but have no invented public Moon getter/handle assertions.',
            'errors':'Existing Core InvalidTicks includes the exact NativeType-prefixed repeated ValueError and clear-detached NotImplementedError messages.',
            'identity':'Private removal_parent corresponds to the surviving native remove callback, independently of owner used for conversion. Callback/function object identity itself is not a new typed public protocol.',
            'legend':'No full Legend constructor, renderer or new handles-labels enumeration API; original Artist.remove does not remove existing legend entries.'},
        'observations':ref.ref.actual.json_safe(rows)}


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',nargs='?',type=Path,default=P);parser.add_argument('--check',action='store_true')
    args=parser.parse_args();ref.load_line_source(args.ticker);payload=collect()
    document=json.dumps(payload,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
    outputs={ROOT/'testdata/line_remove_reference.json':document,
        ROOT/'scene/line_remove_reference_wbtest.mbt':render(payload)}
    for path,content in outputs.items():
        if args.check:
            if not path.exists()or path.read_text()!=content:raise SystemExit('Line remove reference differs: '+str(path))
        else:path.write_text(content)
    print(json.dumps({'check':args.check,**payload['counts'],'json_sha256':hashlib.sha256(document.encode()).hexdigest()}))


if __name__=='__main__':main()
