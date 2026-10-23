"""Pinned original Line visibility and leaf draw numeric-stage reference."""
from pathlib import Path
import argparse,ast,copy,hashlib,json,sys
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_line_units_reference as ref
P=ref.P;artist_path=P.with_name('artist.py');line_path=ref.L
artist=next(n for n in ast.parse(artist_path.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='Artist')
namespace=dict(ref.lns)
for node in artist.body:
    if isinstance(node,ast.FunctionDef)and node.name in{'get_visible','set_visible','get_path_effects','get_gid'}:
        exec(compile(ast.Module(body=[copy.deepcopy(node)],type_ignores=[]),str(artist_path),'exec'),namespace)
line_node=next(n for n in ast.parse(line_path.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='Line2D')
draw=copy.deepcopy(next(n for n in line_node.body if isinstance(n,ast.FunctionDef)and n.name=='draw'))
draw.decorator_list=[]
exec(compile(ast.Module(body=[draw],type_ignores=[]),str(line_path),'exec'),namespace)
line_styles=next(n for n in line_node.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id=='_lineStyles'for t in n.targets))
style_map=ast.literal_eval(line_styles.value)

class Line(ref.Line):
    draw=namespace['draw'];get_visible=namespace['get_visible'];set_visible=namespace['set_visible']
    get_path_effects=namespace['get_path_effects'];get_gid=namespace['get_gid']
    _lineStyles=style_map
    def __init__(self,axes,x,y):
        self.stages=[];self._visible=True;self._path_effects=[];self._gid=None
        self._linestyle='None';self._marker=None
        super().__init__(axes,x,y,'line')
    def pchanged(self):self.stages.append(['pchanged'])
    def recache(self,always=False):
        self.stages.append(['recache.begin',always])
        try:value=ref.original_recache(self,always=always)
        except Exception as error:self.stages.append(['recache.error',type(error).__name__]);raise
        self.stages.append(['recache.end']);return value
    def convert_xunits(self,value):self.stages.append(['convert.x']);return ref.original_xconv(self,value)
    def convert_yunits(self,value):self.stages.append(['convert.y']);return ref.original_yconv(self,value)

class Renderer:
    def __init__(self,line):self.line=line
    def open_group(self,*args):self.line.stages.append(['renderer.open_group'])
    def close_group(self,*args):self.line.stages.append(['renderer.close_group'])

a=ref.setup();line=Line(a,[0.,1.],[10.,20.]);a._children.append(line);line.recache();a._update_line_limits(line)
line.stale=False;a._stale_viewlims={'x':False,'y':False};renderer=Renderer(line);rows=[]

def snapshot():
    return {'visible':line.get_visible(),'stale':line.stale,'invalid':[line._invalidx,line._invalidy],
        'xy':None if line._xy is None else line._xy.tolist(),'owner_is_None':line.axes is None,
        'xlabels':list(a.xaxis.units._mapping),'yconverter':None if a.yaxis.get_converter()is None else type(a.yaxis.get_converter()).__name__,
        'yunits_is_None':a.yaxis.units is None,'data':a.dataLim._points.tolist(),'requests':a._stale_viewlims.copy()}

def take(label,operation):
    line.stages.clear();a.events.clear();before=snapshot()
    try:operation();error=None
    except Exception as exc:error={'type':type(exc).__name__,'message':str(exc)}
    rows.append({'id':len(rows),'label':label,'before':before,'after':snapshot(),'stages':copy.deepcopy(line.stages),
        'axis_events':copy.deepcopy(a.events),'error':error})

take('repeat True on clean visible Line is a complete no-op',lambda:line.set_visible(True))
take('hide changes only visibility/stale and calls pchanged',lambda:line.set_visible(False))
take('repeat False emits no further pchanged or stale transition',lambda:line.set_visible(False))
take('hidden draw skips pending shape recache before any renderer group',lambda:(line.set_ydata([1.,2.,3.]),line.draw(renderer)))
take('show marks stale without eagerly recaching invalid shape',lambda:line.set_visible(True))
take('first visible draw reaches deferred shape error before renderer group',lambda:line.draw(renderer))
take('repair then visible draw recaches and clears stale only on completion',lambda:(line.set_ydata([10.,20.]),line.draw(renderer)))
take('hidden pending category y never discovers converter or raises',lambda:(line.set_visible(False),line.set_ydata(['bad','data']),line.draw(renderer)))
take('show then draw discovers category converter and raises with no yunits',lambda:(line.set_visible(True),line.draw(renderer)))
take('numeric repair bypasses discovered category converter and completes',lambda:(line.set_ydata([30.,40.]),line.draw(renderer)))
take('hidden pending category x does not append a new label',lambda:(line.set_visible(False),line.set_xdata(['new','a']),line.draw(renderer)))
take('show then draw converts category x and appends label now',lambda:(line.set_visible(True),line.draw(renderer)))
def detached_pending():
    line.axes=None
    line.set_visible(False);line.set_xdata([1.,2.,3.]);line.draw(renderer)
take('explicit ownerNone hidden pending shape also skips recache',detached_pending)
take('ownerNone show reaches same deferred broadcast error',lambda:(line.set_visible(True),line.draw(renderer)))
take('ownerNone numeric repair draws successfully and clears stale',lambda:(line.set_xdata([5.,6.]),line.draw(renderer)))


from generate_auto_date_reference import formatted
from generate_scale_defaults_reference import moon

HEADER='''// Generated from pinned original Line visibility/draw control methods; do not edit.

///|
fn line_visible_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn line_visible_source_numbers(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() { line_visible_source_double(actual[index], expected[index]) }
}

///|
// Exercise the real production late-provider entry and its success completion.
// This helper does not select a visibility branch or implement cache refresh.
fn line_visible_source_complete(panel : @render.Panel, line : Line2D) -> Unit raise {
  guard panel.prepare_line(line.points) is Some((_, _, complete)) else {
    fail("expected the registered Line's late provider")
  }
  complete()
}
'''


def number(value):
    if isinstance(value,str)and value in ['nan','inf','-inf']:
        return {'nan':'(0.0 / 0.0)','inf':'(1.0 / 0.0)','-inf':'(-1.0 / 0.0)'}[value]
    return moon(float(value))


def array(values):return '['+', '.join(number(value)for value in values)+']'
def flat(points):return [value for point in points for value in point]


def assert_state(state):
    kind='None'if state['yconverter']is None else'Some("category")'
    lines=['{','assert_eq(line.get_visible(), '+moon(state['visible'])+')',
        'assert_eq(line.stale(), '+moon(state['stale'])+')',
        'assert_eq([line.invalid_x, line.invalid_y], '+moon(state['invalid'])+')',
        'assert_eq(line.owner is None, '+moon(state['owner_is_None'])+')',
        '// Read old retained cache directly so pending-error recording remains lazy.',
        'line_visible_source_numbers(line.cache.flat.to_array(), '+array(flat(state['xy']))+')',
        'assert_eq(axes.x_axis().get_category_units().unwrap().labels(), '+moon(state['xlabels'])+')',
        'assert_eq(axes.y_axis().unit_converter_kind(), '+kind+')',
        'assert_eq(axes.y_axis().unit_tag() is None, '+moon(state['yunits_is_None'])+')']
    for coordinate,horizontal,name in [(0,'true','x'),(1,'false','y')]:
        lines+=['line_visible_source_numbers([axes.data_limits(horizontal='+horizontal+').lower(), axes.data_limits(horizontal='+horizontal+').upper()], '+array([state['data'][0][coordinate],state['data'][1][coordinate]])+')',
            'assert_eq(axes.'+name+'_axis().autoscale_stale(), '+moon(state['requests'][name])+')']
    return lines+['}']


def render(payload):
    lines=[HEADER,'///|','fn line_visible_source_sequence() -> Unit raise {',
        'let fig = figure()','let axes = fig.axes()',
        'ignore(axes.update_x_category_units(["a", "b"]))',
        'let line = axes.plot_line(LineData::Numeric([0.0, 1.0]), LineData::Numeric([10.0, 20.0]))',
        'axes.x_axis().clear_autoscale_request()','axes.y_axis().clear_autoscale_request()',
        '// Match the source host\'s completed initial draw state without rendering a parent.',
        'line.mark_drawn()',
        '// Retain the real exported Panel so the same pinned Line is consulted live.',
        'let panel = fig.to_render_figure().panels()[0]']
    draw_call='line_visible_source_complete(panel, line)'
    operations={0:'line.set_visible(true)',1:'line.set_visible(false)',2:'line.set_visible(false)',
        3:'line.set_ydata(LineData::Numeric([1.0, 2.0, 3.0])); '+draw_call,
        4:'line.set_visible(true)',5:draw_call,
        6:'line.set_ydata(LineData::Numeric([10.0, 20.0])); '+draw_call,
        7:'line.set_visible(false); line.set_ydata(LineData::Category(["bad", "data"])); '+draw_call,
        8:'line.set_visible(true); '+draw_call,
        9:'line.set_ydata(LineData::Numeric([30.0, 40.0])); '+draw_call,
        10:'line.set_visible(false); line.set_xdata(LineData::Category(["new", "a"])); '+draw_call,
        11:'line.set_visible(true); '+draw_call,
        12:'line.detach(); line.set_visible(false); line.set_xdata(LineData::Numeric([1.0, 2.0, 3.0])); '+draw_call,
        13:'line.set_visible(true); '+draw_call,
        14:'line.set_xdata(LineData::Numeric([5.0, 6.0])); '+draw_call}
    for row in payload['observations']:
        index=row['id'];lines+=['// '+str(index)+' '+row['label']]+assert_state(row['before'])
        operation=operations[index]
        if row['error']:
            native=row['error']
            # D39's existing Core conversion boundary does not promise the
            # Python ConversionError wrapper wording. Its side effects and
            # exact late stage are asserted in the following complete state.
            pattern='@core.DataError::InvalidTicks(..) => true' if native['type']=='ConversionError' else'@core.DataError::InvalidTicks(message~) => message == '+moon(native['message'])
            lines+=['assert_true(try { '+operation+'; false } catch { '+pattern+'; _ => false })']
        else:lines+=[operation]
        lines+=assert_state(row['after'])
    lines+=['}','///|','test "original Line visibility and leaf draw sequence" {',
        'line_visible_source_sequence() catch { error => fail("Line visible original sequence: " + error.to_string()) }','}']
    return formatted('\n'.join(lines)+'\n')


def collect():
    original_draw=next(n for n in line_node.body if isinstance(n,ast.FunctionDef)and n.name=='draw')
    return {'source_hashes':ref.source_hashes(),'python':sys.version.split()[0],
        'counts':{'source_records':15,'typed_records':15,'source_only_records':0,'typed_sequences':1,'registered_groups':1},
        'draw_body_sha256':hashlib.sha256(ast.get_source_segment(line_path.read_text(),original_draw).encode()).hexdigest(),
        'host_boundaries':{
            'source':'Complete original Artist visible methods and Line.draw body, rasterization decorator excluded; original no-line-style/no-marker path reaches real renderer groups and stale completion without graphical style work.',
            'typed':'Bool visibility on stable Line2D. The existing exported Panel.prepare_line executes production visibility/lazy-conversion behavior and its returned completion; the fixture does not reimplement the visibility branch.',
            'stages':'Native pchanged/renderer group traces remain evidence without a new public callback or renderer event protocol. No full SVG/parent drawing or color/width/marker parity is claimed.',
            'detached':'Final rows explicitly detach owner, as the original controlled ownerNone profile. This does not independently execute or claim full clear/remove lifecycle.',
            'errors':'Native messages retained; shape error text is checked exactly. Existing Core InvalidTicks category-conversion boundary preserves source stage and surviving converter/cache flags without adding a verbatim ConversionError-wrapper contract.',
            'snapshot':'All before/after cache snapshots read retained storage directly, never a processed lazy getter. Exported Panel remains pinned and invokes current Line state.',
            'ranges':'No relim/autoscale request is inferred from Line setter or successful/hidden leaf draw.'},
        'observations':ref.ref.actual.json_safe(rows)}


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',nargs='?',type=Path,default=P);parser.add_argument('--check',action='store_true')
    args=parser.parse_args();ref.load_line_source(args.ticker);payload=collect()
    document=json.dumps(payload,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
    outputs={ROOT/'testdata/line_visible_reference.json':document,
        ROOT/'scene/line_visible_reference_wbtest.mbt':render(payload)}
    for path,content in outputs.items():
        if args.check:
            if not path.exists()or path.read_text()!=content:raise SystemExit('Line visibility reference differs: '+str(path))
        else:path.write_text(content)
    print(json.dumps({'check':args.check,**payload['counts'],'json_sha256':hashlib.sha256(document.encode()).hexdigest()}))


if __name__=='__main__':main()
