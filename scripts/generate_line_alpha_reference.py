"""Complete original Artist alpha and original Line/color numeric-stage probes."""
from pathlib import Path
import argparse,ast,copy,hashlib,json,math,struct,sys,types
from numbers import Real
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_line_color_reference as color
from generate_auto_date_reference import formatted
from generate_scale_defaults_reference import moon
ref=color.ref
artist_path=ref.P.with_name('artist.py')
if hashlib.sha256(artist_path.read_bytes()).hexdigest()!='c55a81d86db60ab7b22fcd6e70401aa84558de5d1ba6e40a16c60f6f1f03be7a':raise ValueError('fixed Artist source differs')
artist=next(n for n in ast.parse(artist_path.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='Artist')
namespace=dict(ref.lns,Real=Real,mcolors=color.lns['mcolors'],mpl=color.cns['mpl'])
def execute(node,path):color.execute(node,path,namespace)
alpha_methods={}
for node in artist.body:
 if isinstance(node,ast.FunctionDef)and node.name in ['get_alpha','set_alpha']:
  execute(node,artist_path);alpha_methods[node.name]=namespace[node.name]
def bits(value):return None if value is None else struct.unpack('>Q',struct.pack('>d',float(value)))[0]
class AlphaLine(color.Line):
 get_alpha=alpha_methods['get_alpha'];set_alpha=alpha_methods['set_alpha']
 def __init__(self,axes,x,y):
  self._alpha=None;self.alpha_events=[]
  super().__init__(axes,x,y,'alpha')
  self._color='black';self._linewidth=2.
 def pchanged(self):
  self.alpha_events.append({'event':'pchanged','alpha':self._alpha,'alpha_bits':bits(self._alpha),'stale':self.stale})

def setup(x=[0.,1.],y=[10.,20.]):
 axes=ref.setup();line=AlphaLine(axes,x,y);axes._children.append(line);line.recache();axes._update_line_limits(line)
 axes._stale_viewlims={'x':False,'y':False};axes.events.clear();line.stale=False
 return axes,line
axes,line=setup();setter_rows=[]
def state():
 return {'alpha':line.get_alpha(),'alpha_bits':bits(line.get_alpha()),'stale':line.stale,
  'color':line.get_color(),'width':line._linewidth,'invalid':[line._invalidx,line._invalidy],
  'xy':line._xy.tolist(),'data':axes.dataLim._points.tolist(),'requests':axes._stale_viewlims.copy(),'owner_is_None':line.axes is None}
def take_setter(label,value):
 line.stale=False;line.alpha_events.clear();before=state()
 try:line.set_alpha(value);error=None
 except Exception as exc:error={'type':type(exc).__name__,'message':str(exc)}
 setter_rows.append({'id':len(setter_rows),'label':label,'input':value,'input_bits':bits(value),'before':before,'after':state(),
  'pchanged':copy.deepcopy(line.alpha_events),'error':error})
values=[None,None,.5,.5,0.,-0.,1.,1.,math.nan,math.inf,-math.inf,-math.ulp(0.),math.nextafter(1.,math.inf),
 None,None,-0.,0.,None,math.ulp(0.),math.nextafter(1.,0.)]
for value in values:take_setter('None/Double setter '+repr(value),value)
line.axes=None
take_setter('detached ownerNone reset',None);take_setter('detached ownerNone numeric setter',.25)

# Independent real color conversion profiles with an explicit fresh native cache.
color.cns['_colors_full_map'].cache.clear();color.cycle.colors=['#11223344','none']
rgba_rows=[]
for value in ['red','none','#1234','#11223344','#0000','C0','C1']:
 for alpha in [None,0.,.25,1.]:
  color.events.clear()
  try:rgba=color.cns['to_rgba'](value,alpha);error=None
  except Exception as exc:rgba=None;error={'type':type(exc).__name__,'message':str(exc)}
  rgba_rows.append({'id':len(rgba_rows),'color':value,'alpha':alpha,'alpha_bits':bits(alpha),'rgba':rgba,
   'rgba_bits':None if rgba is None else[bits(v)for v in rgba],'events':copy.deepcopy(color.events),'error':error})
cache_rows=[]
for order in [(-0.,0.),(0.,-0.)]:
 color.cns['_colors_full_map'].cache.clear()
 for alpha in order:
  rgba=color.cns['to_rgba']('red',alpha)
  cache_rows.append({'id':len(cache_rows),'order':'minus-first'if math.copysign(1.,order[0])<0 else'plus-first',
   'input_alpha':alpha,'input_alpha_bits':bits(alpha),'rgba':rgba,'rgba_bits':[bits(v)for v in rgba],
   'cache_size':len(color.cns['_colors_full_map'].cache)})

# Complete original draw, with fixed solid/no-marker path and presentation sinks.
getters={}
for node in artist.body:
 if isinstance(node,ast.FunctionDef)and node.name in ['get_visible','get_path_effects','get_gid','get_url','get_snap','get_sketch_params']:
  execute(node,artist_path);getters[node.name]=namespace[node.name]
draw_original=next(n for n in color.linecls.body if isinstance(n,ast.FunctionDef)and n.name=='draw')
draw=copy.deepcopy(draw_original);draw.decorator_list=[];execute(draw,ref.L)
node=next(n for n in color.linecls.body if isinstance(n,ast.FunctionDef)and n.name=='is_dashed');execute(node,ref.L)
styles=next(n for n in color.linecls.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id=='_lineStyles'for t in n.targets))
class SolidLine(AlphaLine):
 draw=namespace['draw'];is_dashed=namespace['is_dashed'];_lineStyles=ast.literal_eval(styles.value)
 def __init__(self,axes,x,y):
  super().__init__(axes,x,y)
  self._visible=True;self._path_effects=[];self._gid=None;self._url=None;self._snap=None;self._sketch=None
  self._linestyle='-';self._marker=None;self._antialiased=True
  self._solidjoinstyle='round';self._solidcapstyle='butt';self._dash_pattern=(0,None)
 def _get_transformed_path(self):
  return types.SimpleNamespace(get_transformed_path_and_affine=lambda:(self._path,types.SimpleNamespace(frozen=lambda:None)))
 def _set_gc_clip(self,gc):gc.stages.append(['gc.clip'])
for name,value in getters.items():setattr(SolidLine,name,value)
color.rc['path.snap']=True
class GC:
 def __init__(self,stages):self.stages=stages
 def set_foreground(self,value,isRGBA=False):self.stages.append(['gc.set_foreground',value,isRGBA])
for name in ['set_url','set_antialiased','set_linewidth','set_joinstyle','set_capstyle','set_snap','set_sketch_params','set_dashes','restore']:
 def sink(self,*args,_name=name,**kwargs):self.stages.append(['gc.'+_name])
 setattr(GC,name,sink)
class Renderer:
 def __init__(self):self.stages=[]
 def open_group(self,*args):self.stages.append(['renderer.open_group'])
 def close_group(self,*args):self.stages.append(['renderer.close_group'])
 def new_gc(self):self.stages.append(['renderer.new_gc']);return GC(self.stages)
 def draw_path(self,*args):self.stages.append(['renderer.draw_path'])
draw_rows=[]
for label,empty,raw,bad,hidden in [
 ('alpha0 normal red still draws',False,'red',False,False),
 ('alpha0 pending shape error precedes color',False,'C'+'9'*4301,True,False),
 ('alpha0 nonempty C4301 still reaches color error',False,'C'+'9'*4301,False,False),
 ('alpha0 empty C4301 skips color and completes',True,'C'+'9'*4301,False,False),
 ('alpha0 hidden pending shape and C4301 skips everything',False,'C'+'9'*4301,True,True)]:
 axes=ref.setup();line=SolidLine(axes,[]if empty else[0.,1.],[]if empty else[10.,20.]);line.recache()
 line.set_color(raw);line.set_alpha(0.)
 if bad:line.set_ydata([1.,2.,3.])
 line._visible=not hidden;renderer=Renderer();axes.events.clear();color.events.clear()
 def draw_state():
  return {'alpha':line.get_alpha(),'alpha_bits':bits(line.get_alpha()),'stale':line.stale,'visible':line._visible,
   'color':line.get_color(),'invalid':[line._invalidx,line._invalidy],'xy':line._xy.tolist()}
 before=draw_state()
 try:line.draw(renderer);error=None
 except Exception as exc:error={'type':type(exc).__name__,'message':str(exc)}
 draw_rows.append({'id':len(draw_rows),'label':label,'before':before,'after':draw_state(),
  'renderer_stages':renderer.stages,'axis_events':copy.deepcopy(axes.events),'color_events':copy.deepcopy(color.events),'error':error})
body_hashes={}
for name in ['get_alpha','set_alpha']:
 node=next(n for n in artist.body if isinstance(n,ast.FunctionDef)and n.name==name)
 body_hashes['artist.py:'+name]=hashlib.sha256(ast.get_source_segment(artist_path.read_text(),node).encode()).hexdigest()
body_hashes['lines.py:draw']=hashlib.sha256(ast.get_source_segment(ref.L.read_text(),draw_original).encode()).hexdigest()


HEADER='''// Generated from pinned original Artist alpha and Line/color methods; do not edit.
// Native private RGBA-cache warm-order records remain source-only evidence.

///|
fn line_alpha_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn line_alpha_source_option(actual : Double?, expected : Double?) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(actual), Some(expected)) => line_alpha_source_double(actual, expected)
    _ => fail("original optional alpha differs")
  }
}

///|
fn line_alpha_source_numbers(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() { line_alpha_source_double(actual[index], expected[index]) }
}

///|
fn line_alpha_source_rgba(actual : @colors.Rgba, expected : Array[UInt64]) -> Unit raise {
  assert_eq([
    actual.red().reinterpret_as_uint64(), actual.green().reinterpret_as_uint64(),
    actual.blue().reinterpret_as_uint64(), actual.alpha().reinterpret_as_uint64(),
  ], expected)
}

///|
fn line_alpha_source_state(
  line : Line2D, axes : Axes, alpha : Double?, stale : Bool, raw_color : String,
  width : Double, invalid : Array[Bool], xy : Array[Double], data : Array[Double], requests : Array[Bool],
  owner_is_none : Bool,
) -> Unit raise {
  line_alpha_source_option(line.get_alpha(), alpha)
  assert_eq(line.stale(), stale)
  assert_eq(line.get_color(), raw_color)
  line_alpha_source_double(line.get_linewidth(), width)
  assert_eq([line.invalid_x, line.invalid_y], invalid)
  assert_eq(line.owner is None, owner_is_none)
  // Observe retained cache directly, without conversion or drawing.
  line_alpha_source_numbers(line.cache.flat.to_array(), xy)
  line_alpha_source_numbers([
    axes.data_limits().lower(), axes.data_limits(horizontal=false).lower(),
    axes.data_limits().upper(), axes.data_limits(horizontal=false).upper(),
  ], data)
  assert_eq([axes.x_axis().autoscale_stale(), axes.y_axis().autoscale_stale()], requests)
}
'''


def number(value):
 if isinstance(value,dict)and set(value)=={'float'}:value=value['float']
 if isinstance(value,str)and value in ['nan','inf','-inf']:
  return {'nan':'(0.0 / 0.0)','inf':'(1.0 / 0.0)','-inf':'(-1.0 / 0.0)'}[value]
 return moon(float(value))
def optional(value):return 'None'if value is None else'Some('+number(value)+')'
def numbers(values):return '['+', '.join(number(value)for value in values)+']'
def bit_array(values):return '['+', '.join(str(value)+'UL'for value in values)+']'
def flatten(values):return [value for row in values for value in row]


def state_assertion(state):
 args=['line','axes',optional(state['alpha']),moon(state['stale']),moon(state['color']),number(state['width']),
  moon(state['invalid']),numbers(flatten(state['xy'])),numbers(flatten(state['data'])),
  moon([state['requests'][name]for name in ['x','y']]),moon(state['owner_is_None'])]
 return 'line_alpha_source_state('+', '.join(args)+')'


def error_operation(operation,error):
 # Preserve the established D39 shape-message boundary; newer Artist/color
 # ValueErrors carry their native type prefix in Core InvalidTicks.
 message=error['message']if error['message'].startswith('shape mismatch:')else error['type']+': '+error['message']
 return 'assert_true(try { '+operation+'; false } catch { @core.DataError::InvalidTicks(message~) => message == '+moon(message)+'; _ => false })'


def render(payload):
 lines=[HEADER,'///|','fn line_alpha_source_setter_sequence() -> Unit raise {',
  'let axes = figure().axes()','ignore(axes.update_x_category_units(["a", "b"]))',
  'let line = axes.plot_line(LineData::Numeric([0.0, 1.0]), LineData::Numeric([10.0, 20.0]), color="black")',
  'axes.x_axis().clear_autoscale_request()','axes.y_axis().clear_autoscale_request()']
 for row in payload['setter_observations']:
  label='original alpha setter row '+str(row['id'])
  lines+=['// '+row['label'],'try {']
  if row['id']==20:
   lines+=['// Controlled source ownerNone input: detach only, retaining ranges/cache.', 'line.detach()']
  lines+=['// Input fixture only: native clean-stale state, not draw completion.',
   'line.mark_drawn()',state_assertion(row['before'])]
  operation='line.set_alpha('+optional(row['input'])+')'
  lines+=[error_operation(operation,row['error'])if row['error']else operation,state_assertion(row['after']),
   '} catch { error => fail('+moon(label+': ')+' + error.to_string()) }']
 lines+=['}','///|','test "original Artist None Double alpha setter sequence" {',
  'line_alpha_source_setter_sequence()','}',
  '///|','fn line_alpha_source_rgba_overrides() -> Unit raise {',
  'let previous_cycle = @config.color_cycle()','defer { try! @config.set_color_cycle(previous_cycle) }',
  '@config.set_color_cycle(["#11223344", "none"])']
 for row in payload['rgba_override_observations']:
  label='original alpha override row '+str(row['id'])
  operation='line_color_rgba('+moon(row['color'])+', alpha='+optional(row['alpha'])+')'
  lines+=['try {']
  if row['error']:lines+=[error_operation('ignore('+operation+')',row['error'])]
  else:lines+=['line_alpha_source_rgba('+operation+', '+bit_array(row['rgba_bits'])+')']
  lines+=['} catch { error => fail('+moon(label+': ')+' + error.to_string()) }']
 lines+=['}','///|','test "original color alpha override primitives" {','line_alpha_source_rgba_overrides()','}']
 for row in payload['draw_observations']:
  before=row['before'];after=row['after'];index=row['id']
  xs=[point[0]for point in before['xy']];ys=[point[1]for point in before['xy']]
  lines+=['///|',f'fn line_alpha_source_draw_{index}() -> Unit raise {{',
   'let previous_cycle = @config.color_cycle()','defer { try! @config.set_color_cycle(previous_cycle) }',
   '@config.set_color_cycle(["#11223344", "none"])',
   'let fig = figure()','let axes = fig.axes()','ignore(axes.update_x_category_units(["a", "b"]))',
   'let line = axes.plot_line(LineData::Numeric('+numbers(xs)+'), LineData::Numeric('+numbers(ys)+'), color="black")',
   'line.set_color('+moon(before['color'])+')','line.set_alpha('+optional(before['alpha'])+')']
  if index in [1,4]:lines+=['line.set_ydata(LineData::Numeric([1.0, 2.0, 3.0]))']
  if not before['visible']:lines+=['line.set_visible(false)']
  lines+=['line_alpha_source_option(line.get_alpha(), '+optional(before['alpha'])+')',
   'assert_eq(line.stale(), '+moon(before['stale'])+')',
   'assert_eq(line.get_visible(), '+moon(before['visible'])+')',
   'assert_eq([line.invalid_x, line.invalid_y], '+moon(before['invalid'])+')',
   'line_alpha_source_numbers(line.cache.flat.to_array(), '+numbers(flatten(before['xy']))+')',
   'let panel = fig.to_render_figure().panels()[0]']
  operation='guard panel.prepare_line(line.points) is Some(context) else { fail("expected registered Line provider") }; context.complete()'
  lines+=[error_operation(operation,row['error'])if row['error']else operation,
   'line_alpha_source_option(line.get_alpha(), '+optional(after['alpha'])+')',
   'assert_eq(line.stale(), '+moon(after['stale'])+')',
   'assert_eq(line.get_color(), '+moon(after['color'])+')',
   'assert_eq(line.get_visible(), '+moon(after['visible'])+')',
   'assert_eq([line.invalid_x, line.invalid_y], '+moon(after['invalid'])+')',
   'line_alpha_source_numbers(line.cache.flat.to_array(), '+numbers(flatten(after['xy']))+')','}']
 lines+=['///|','test "original Line alpha zero leaf draw timing" {']
 for row in payload['draw_observations']:
  label='original alpha draw row '+str(row['id'])
  lines+=['line_alpha_source_draw_'+str(row['id'])+'() catch { error => fail('+moon(label+': ')+' + error.to_string()) }']
 lines+=['}']
 return formatted('\n'.join(lines)+'\n')


def collect():
 return ref.ref.actual.json_safe({'python':sys.version.split()[0],'numpy':color.np.__version__,
  'source_hashes':dict(ref.source_hashes(),colors_py=color.PINS[color.COLORS],color_data_py=color.PINS[color.COLOR_DATA]),
  'method_body_hashes':body_hashes,
  'host_boundary':'Complete original Artist alpha methods with real numbers.Real; pchanged is a controlled stage observer, not a GUI callback API. Complete original color helpers and named table with declared stored rc/by_key capability. Complete original solid/no-marker Line.draw with rasterization decorator excluded, already transformed numeric Path storage and GC/renderer presentation sinks. Native mutable RGBA cache warm-order is an independent private-state profile, not a public cache protocol.',
  'counts':{'setter_records':len(setter_rows),'rgba_override_records':len(rgba_rows),'cache_warm_records':len(cache_rows),'draw_records':len(draw_rows),'records':len(setter_rows)+len(rgba_rows)+len(cache_rows)+len(draw_rows)},
  'projection_counts':{'source_records':59,'typed_records':55,'source_only_records':4,'typed_setter_sequences':1,'rgba_primitives':28,'draw_scenarios':5,'registered_groups':3},
  'typed_boundaries':{
   'setter':'None/Double only, exact optional-value and signed-zero storage. Controlled mark_drawn supplies native clean-stale input. Row20 private detach matches explicit ownerNone without clearing cache/ranges.',
   'pchanged':'All original observer stages remain evidence; no public GUI callback protocol or arbitrary callback atomicity is added.',
   'cache':'Four original native cache warm-order observations remain source-only with exact bits unchanged. Portable derived RGBA uses current override sign without cloning the mutable global cache; raw alpha getter bits are separately strict.',
   'draw':'Actual Panel.prepare_line and returned completion project the five native solid/no-marker draw cases, including hidden noop completion and only-success completion after possible failures. No fixture alpha/empty/visibility rendering branch is supplied.',
   'errors':'Artist/color InvalidTicks uses complete native type-prefixed messages. The established D39 shape-error mapping retains exact native message without a ValueError wrapper.',
   'style':'Private source String RGBA override is tested directly. Legacy CSS stroke-opacity composition and existing Rgba.to_css formatting are convenience profiles, not native CSS/viewer parity.',
  },
  'setter_observations':setter_rows,'rgba_override_observations':rgba_rows,'cache_warm_observations':cache_rows,'draw_observations':draw_rows})


def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',nargs='?',type=Path,default=ref.P);parser.add_argument('--check',action='store_true')
 args=parser.parse_args();ref.load_line_source(args.ticker);payload=collect()
 document=json.dumps(payload,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
 outputs={ROOT/'testdata/line_alpha_reference.json':document,ROOT/'scene/line_alpha_reference_wbtest.mbt':render(payload)}
 for path,content in outputs.items():
  if args.check:
   if not path.exists()or path.read_text()!=content:raise SystemExit('Line alpha reference differs: '+str(path))
  else:path.write_text(content)
 print(json.dumps({'check':args.check,**payload['counts'],**payload['projection_counts'],'json_sha256':hashlib.sha256(document.encode()).hexdigest()}))


if __name__=='__main__':main()
