"""Pinned original relim visible_only filter, null bounds and prefix errors."""
from pathlib import Path
import argparse,ast,copy,hashlib,json,sys
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_line_units_reference as ref
P=ref.P;artist_path=P.with_name('artist.py')
artist=next(n for n in ast.parse(artist_path.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='Artist')
namespace={}
for node in artist.body:
    if isinstance(node,ast.FunctionDef)and node.name in{'get_visible','set_visible','_get_in_autoscale'}:
        exec(compile(ast.Module(body=[copy.deepcopy(node)],type_ignores=[]),str(artist_path),'exec'),namespace)
class Line(ref.Line):
    set_visible=namespace['set_visible']
    def __init__(self,axes,x,y,name):
        self._visible=True;self._in_autoscale=True
        super().__init__(axes,x,y,name)
    def pchanged(self):self.axes.events.append(['pchanged',self.name])
    def get_visible(self):
        self.axes.events.append(['get_visible',self.name])
        return namespace['get_visible'](self)
    def _get_in_autoscale(self):
        self.axes.events.append(['get_in_autoscale',self.name])
        return namespace['_get_in_autoscale'](self)

a=ref.setup();first=Line(a,[1.,2.],[10.,20.],'first');second=Line(a,[100.,200.],[300.,400.],'second')
for line in [first,second]:a._children.append(line);line.recache();a._update_line_limits(line)
a._stale_viewlims={'x':False,'y':False};rows=[]

def snapshot():
    return {'data':a.dataLim._points.tolist(),'minpos':a.dataLim._minpos.tolist(),
        'ignore_existing':a.ignore_existing_data_limits,'requests':a._stale_viewlims.copy(),
        'views':{name:list(axis.get_view_interval())for name,axis in a._axis_map.items()},
        'auto_on':{name:axis._get_autoscale_on()for name,axis in a._axis_map.items()},
        'lines':[{'name':line.name,'visible':line._visible,'stale':line.stale,
            'invalid':[line._invalidx,line._invalidy],'xy':line._xy.tolist()}for line in [first,second]]}

def take(label,action):
    a.events.clear();before=snapshot()
    try:action();error=None
    except Exception as exc:error={'type':type(exc).__name__,'message':str(exc)}
    rows.append({'id':len(rows),'label':label,'before':before,'after':snapshot(),'events':copy.deepcopy(a.events),'error':error})

take('default relim includes a hidden Line',lambda:(second.set_visible(False),a.relim()))
take('visible_only excludes hidden and recomputes the visible range',lambda:a.relim(visible_only=True))
take('all hidden yields null bbox but retains previous minimum-positive metadata',lambda:(first.set_visible(False),a.relim(visible_only=True)))
take('default False still includes both hidden Lines',lambda:a.relim(visible_only=False))
take('visible_only recaches visible edited prefix and skips hidden pending shape error',lambda:(first.set_visible(True),first.set_data([5.,6.],[50.,60.]),second.set_ydata([300.,400.,500.]),a.relim(visible_only=True)))
take('default relim reaches hidden error after visible prefix merge',lambda:a.relim())
take('show then visible_only reaches same late error and keeps prefix',lambda:(second.set_visible(True),a.relim(visible_only=True)))
take('repair then visible_only merges the full visible range',lambda:(second.set_ydata([70.,80.]),a.relim(visible_only=True)))
take('all hidden after new finite range keeps its updated minpos',lambda:(first.set_visible(False),second.set_visible(False),a.relim(visible_only=True)))


from generate_auto_date_reference import formatted
from generate_scale_defaults_reference import moon

HEADER='''// Generated from pinned original relim visible_only methods; do not edit.

///|
fn relim_visible_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn relim_visible_source_numbers(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() { relim_visible_source_double(actual[index], expected[index]) }
}
'''


def number(value):
    # Preserve the accepted source JSON's explicit nonfinite dictionary format.
    if isinstance(value,dict)and'float'in value:
        return {'inf':'(1.0 / 0.0)','-inf':'(-1.0 / 0.0)','nan':'(0.0 / 0.0)'}[value['float']]
    return moon(float(value))


def array(values):return '['+', '.join(number(value)for value in values)+']'
def flat(points):return [value for point in points for value in point]


def assert_state(state):
    lines=['{','assert_eq(axes.ignore_existing_data_limits(), '+moon(state['ignore_existing'])+')']
    for coordinate,horizontal,name in [(0,'true','x'),(1,'false','y')]:
        lines+=['relim_visible_source_numbers([axes.data_limits(horizontal='+horizontal+').lower(), axes.data_limits(horizontal='+horizontal+').upper(), axes.data_minpos(horizontal='+horizontal+')], '+array([state['data'][0][coordinate],state['data'][1][coordinate],state['minpos'][coordinate]])+')',
            'assert_eq(axes.'+name+'_axis().autoscale_stale(), '+moon(state['requests'][name])+')',
            'assert_eq(axes.'+name+'_axis().autoscale_on(), '+moon(state['auto_on'][name])+')',
            '// Stored limits do not consume a pending request or trigger autoscale.',
            '{','let view = axes.'+name+'_axis().stored_view_limits()',
            'relim_visible_source_numbers([view.lower(), view.upper()], '+array(state['views'][name])+')','}']
    for line in state['lines']:
        name=line['name']
        lines+=['assert_eq('+name+'.get_visible(), '+moon(line['visible'])+')',
            'assert_eq('+name+'.stale(), '+moon(line['stale'])+')',
            'assert_eq(['+name+'.invalid_x, '+name+'.invalid_y], '+moon(line['invalid'])+')',
            '// Inspect the retained cache without accidentally recaching a hidden error.',
            'relim_visible_source_numbers('+name+'.cache.flat.to_array(), '+array(flat(line['xy']))+')']
    return lines+['}']


def render(payload):
    initial_views=payload['observations'][0]['before']['views']
    lines=[HEADER,'///|','fn relim_visible_source_sequence() -> Unit raise {',
        'let axes = figure().axes()',
        'ignore(axes.update_x_category_units(["a", "b"]))',
        'let first = axes.plot_line(LineData::Numeric([1.0, 2.0]), LineData::Numeric([10.0, 20.0]))',
        'let second = axes.plot_line(LineData::Numeric([100.0, 200.0]), LineData::Numeric([300.0, 400.0]))',
        '// The controlled source host stores a plain initial view Bbox. Seed',
        '// that input after Scene unit setup, without changing auto-enable.',
        'axes.x_axis().set_view_limits('+number(initial_views['x'][0])+', '+number(initial_views['x'][1])+')',
        'axes.y_axis().set_view_limits('+number(initial_views['y'][0])+', '+number(initial_views['y'][1])+')',
        'axes.x_axis().clear_autoscale_request()','axes.y_axis().clear_autoscale_request()']
    operations={
        0:'second.set_visible(false); axes.relim()',
        1:'axes.relim_checked(visible_only=true)',
        2:'first.set_visible(false); axes.relim(visible_only=true)',
        3:'axes.relim(visible_only=false)',
        4:'first.set_visible(true); first.set_data(LineData::Numeric([5.0, 6.0]), LineData::Numeric([50.0, 60.0])); second.set_ydata(LineData::Numeric([300.0, 400.0, 500.0])); axes.relim_checked(visible_only=true)',
        5:'axes.relim_checked()',
        6:'second.set_visible(true); axes.relim_checked(visible_only=true)',
        7:'second.set_ydata(LineData::Numeric([70.0, 80.0])); axes.relim_checked(visible_only=true)',
        8:'first.set_visible(false); second.set_visible(false); axes.relim_checked(visible_only=true)'}
    for row in payload['observations']:
        index=row['id'];lines+=['// '+str(index)+' '+row['label']]+assert_state(row['before'])
        operation=operations[index]
        if row['error']:
            lines+=['assert_true(try { '+operation+'; false } catch { @core.DataError::InvalidTicks(message~) => message == '+moon(row['error']['message'])+'; _ => false })']
        else:lines+=[operation]
        lines+=assert_state(row['after'])
    lines+=['}','///|','test "original relim visible_only sequence" {',
        'relim_visible_source_sequence() catch { error => fail("relim visible original sequence: " + error.to_string()) }','}']
    return formatted('\n'.join(lines)+'\n')


def collect():
    return {'source_hashes':ref.source_hashes(),'python':sys.version.split()[0],
        'counts':{'source_records':9,'typed_records':9,'source_only_records':0,'typed_sequences':1,'registered_groups':1},
        'host_boundaries':{
            'source':'Complete accepted original Axes.relim/_update_line_limits and Bbox ignore/set_points/update_from_path; original Artist visibility/in_autoscale methods; numeric short/default-style Line/Path host.',
            'typed':'Optional Bool visible_only on existing relim/relim_checked. Both public convenience and checked paths are exercised; native failure observations use the checked bridge.',
            'eligibility':'Ordinary source Lines have private in_autoscale=True. No new public autoscale-eligibility or whole-Artist visibility system is introduced. Existing independent static artists remain eligible.',
            'snapshots':'Retained cache is read directly and view uses stored limits, not processed Line getters or lazy get_xlim. Exact old-minpos/null-Bbox/prefix state is preserved.',
            'events':'Get-visible and in-autoscale wrappers only record original order. They are not a new public callback protocol; hidden pending error/cache state proves the typed skip stage.',
            'units':'Original units handler remains force-all Lines then default relim then event-axis request; explicit visible_only does not change that separate callback pipeline.',
            'errors':'Exact native broadcast error wording maps to existing Core InvalidTicks without a new wrapper or rollback.',
            'numeric':'Finite/infinite values use binary64 bits and NaN uses classification. Source JSON preserves the existing explicit nonfinite dictionary representation.'},
        'observations':ref.ref.actual.json_safe(rows)}


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',nargs='?',type=Path,default=P);parser.add_argument('--check',action='store_true')
    args=parser.parse_args();ref.load_line_source(args.ticker);payload=collect()
    document=json.dumps(payload,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
    outputs={ROOT/'testdata/relim_visible_reference.json':document,
        ROOT/'scene/relim_visible_reference_wbtest.mbt':render(payload)}
    for path,content in outputs.items():
        if args.check:
            if not path.exists()or path.read_text()!=content:raise SystemExit('relim visible reference differs: '+str(path))
        else:path.write_text(content)
    print(json.dumps({'check':args.check,**payload['counts'],'json_sha256':hashlib.sha256(document.encode()).hexdigest()}))


if __name__=='__main__':main()
