"""Pinned complete gapcolor setter, inverse-dash and original two-stroke draw reference."""
from pathlib import Path
import argparse,ast,copy,hashlib,json,math,sys,warnings
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_line_style_reference as style
alpha=style.alpha;color=style.color;ref=style.ref
gns=dict(style.ns,mcolors=color.lns['mcolors'])
for name in ['get_gapcolor','set_gapcolor','is_dashed']:
 node=next(n for n in color.linecls.body if isinstance(n,ast.FunctionDef)and n.name==name)
 color.execute(node,ref.L,gns)
inverse_node=next(n for n in color.ltree.body if isinstance(n,ast.FunctionDef)and n.name=='_get_inverse_dash_pattern')
color.execute(inverse_node,ref.L,gns)
inverse_original=gns['_get_inverse_dash_pattern']
class GapLine(style.StyledLine):
 get_gapcolor=gns['get_gapcolor'];set_gapcolor=gns['set_gapcolor'];is_dashed=gns['is_dashed']

def setup(*,leaf=False,x=[0.,1.],y=[10.,20.]):
 axes=ref.setup();line=GapLine(axes,x,y);line.recache();line._color='blue'
 if not leaf:axes._children.append(line);axes._update_line_limits(line)
 axes._stale_viewlims={'x':False,'y':False};axes.events.clear();line.stale=False
 return axes,line
def state(axes,line):
 return {'gapcolor':copy.deepcopy(line.get_gapcolor()),'gapcolor_type':type(line.get_gapcolor()).__name__,
  'color':copy.deepcopy(line.get_color()),'alpha':line.get_alpha(),'alpha_bits':alpha.bits(line.get_alpha()),
  'width':line.get_linewidth(),'width_bits':alpha.bits(line.get_linewidth()),
  'linestyle':line.get_linestyle(),'is_dashed':line.is_dashed(),'unscaled':style.pattern(line._unscaled_dash_pattern),
  'effective':style.pattern(line._dash_pattern),'stale':line.stale,'visible':line.get_visible(),
  'invalid':[line._invalidx,line._invalidy],'xy':line._xy.tolist(),'xy_bits':[alpha.bits(v)for v in line._xy.flat],
  'data':axes.dataLim._points.tolist(),'requests':axes._stale_viewlims.copy(),
  'scale_dashes':style.rc['lines.scale_dashes'],'rc_pattern':copy.deepcopy(style.rc['lines.dashed_pattern'])}

style.reset_rc();color.cns['_colors_full_map'].cache.clear();color.cycle.colors=['#11223344','none']
axes,line=setup();setter_rows=[]
def take_setter(value,label=None):
 line.stale=False;color.events.clear();before=state(axes,line)
 try:line.set_gapcolor(value);error=None
 except Exception as exc:error={'type':type(exc).__name__,'message':str(exc)}
 after=state(axes,line);events=copy.deepcopy(color.events);same=line.get_gapcolor()is value
 color.events.clear()
 if error is None and line.get_gapcolor()is not None:
  try:rgba=color.cns['to_rgba'](line.get_gapcolor(),line.get_alpha());rgba_error=None
  except Exception as exc:rgba=None;rgba_error={'type':type(exc).__name__,'message':str(exc)}
 else:rgba=rgba_error=None
 setter_rows.append({'id':len(setter_rows),'label':label or'gap setter '+repr(value),'input':copy.deepcopy(value),
  'before':before,'after':after,'stored_is_input':same,'error':error,'setter_events':events,
  'rgba_primitive':rgba,'rgba_bits':None if rgba is None else[alpha.bits(v)for v in rgba],
  'rgba_error':rgba_error,'rgba_events':copy.deepcopy(color.events)})
for value in [None,None,'red','red','RED','none','#1234','0.5','C0','C1','C'+'9'*4301,'not-a-color','',None]:take_setter(value)
borrowed=[.1,.2,.3];take_setter(borrowed,'native mutable RGB gapcolor stored by identity (source-only)')
borrowed[0]=2.;color.events.clear();before=state(axes,line)
try:rgba=color.cns['to_rgba'](line.get_gapcolor());error=None
except Exception as exc:rgba=None;error={'type':type(exc).__name__,'message':str(exc)}
setter_rows.append({'id':len(setter_rows),'label':'native borrowed RGB mutation fails at later gap conversion (source-only)',
 'before':before,'after':state(axes,line),'get_gapcolor_is_original_list':line.get_gapcolor()is borrowed,
 'rgba_primitive':rgba,'error':error,'events':copy.deepcopy(color.events)})

inverse_rows=[]
for offset,dashes in [(0.,[1.,2.]),(-0.,[1.,2.,3.]),(3.5,[1.,2.,3.]),(1e16,[1.,1.]),
 (0.,[]),(0.,()),(0.,[-1.,1.]),(0.,[0.,0.]),(0.,[1.,math.nan]),
 (0.,[1.,math.inf]),(math.inf,[1.,-math.inf]),(math.nan,[1.,2.])]:
 before=copy.deepcopy(dashes)
 try:out_offset,gaps=inverse_original(offset,dashes);error=None
 except Exception as exc:out_offset=gaps=None;error={'type':type(exc).__name__,'message':str(exc)}
 inverse_rows.append({'id':len(inverse_rows),'offset':offset,'offset_bits':alpha.bits(offset),'dashes':before,'input_type':type(dashes).__name__,
  'offset_result':out_offset,'offset_result_bits':alpha.bits(out_offset),'gaps':gaps,
  'gap_bits':None if gaps is None else[alpha.bits(v)for v in gaps],
  'result_type':None if gaps is None else type(gaps).__name__,'result_is_input':gaps is dashes,'input_after':copy.deepcopy(dashes),'error':error})

# Stage wrappers only observe calls to unchanged original helpers. Real GC
# set_dashes is inherited from the complete original D51 validation host.
active=[]
def traced_rgba(value,override=None):
 active.append(['rgba.begin',copy.deepcopy(value),override])
 try:rgba=color.cns['to_rgba'](value,override)
 except Exception as exc:active.append(['rgba.error',type(exc).__name__,str(exc)]);raise
 active.append(['rgba.end',rgba,[alpha.bits(v)for v in rgba]]);return rgba
def traced_inverse(offset,dashes):
 active.append(['inverse.begin',offset,copy.deepcopy(dashes),type(dashes).__name__])
 try:out=inverse_original(offset,dashes)
 except Exception as exc:active.append(['inverse.error',type(exc).__name__,str(exc)]);raise
 active.append(['inverse.end',out[0],copy.deepcopy(out[1]),type(out[1]).__name__]);return out
alpha.namespace['mcolors'].to_rgba=traced_rgba
alpha.namespace['_get_inverse_dash_pattern']=traced_inverse
class GC(style.GC):
 def set_foreground(self,value,isRGBA=False):
  self.foreground=copy.deepcopy(value);super().set_foreground(value,isRGBA=isRGBA)
class Renderer(style.Renderer):
 def __init__(self):super().__init__();self.paths=[]
 def new_gc(self):self.stages.append(['renderer.new_gc']);return GC(self.stages)
 def draw_path(self,gc,path,affine):
  self.stages.append(['renderer.draw_path',copy.deepcopy(gc.foreground),copy.deepcopy(gc._dashes)])
  self.paths.append({'rgba':copy.deepcopy(gc.foreground),'rgba_bits':[alpha.bits(v)for v in gc.foreground],
   'offset':gc._dashes[0],'offset_bits':alpha.bits(gc._dashes[0]),'dashes':copy.deepcopy(gc._dashes[1]),
   'dash_bits':None if gc._dashes[1]is None else[alpha.bits(v)for v in gc._dashes[1]],'vertices':path.vertices.tolist()})

draw_rows=[]
def draw_take(label,axes,line,**inputs):
 global active
 renderer=Renderer();active=renderer.stages;color.events.clear();axes.events.clear();before=state(axes,line)
 with warnings.catch_warnings(record=True)as caught:
  warnings.simplefilter('always')
  try:line.draw(renderer);error=None
  except Exception as exc:error={'type':type(exc).__name__,'message':str(exc)}
 draw_rows.append({'id':len(draw_rows),'label':label,'input':inputs,'before':before,'after':state(axes,line),
  'renderer_stages':copy.deepcopy(renderer.stages),'drawn_paths':copy.deepcopy(renderer.paths),
  'color_events':copy.deepcopy(color.events),'axis_events':copy.deepcopy(axes.events),'error':error,
  'warnings':[{'type':type(w.message).__name__,'message':str(w.message)}for w in caught]})

C4301='C'+'9'*4301
profiles=[
 ('solid ignores gapcolor', 'solid','red','blue',2.,[1.,2.],None,False,False,False,True),
 ('no-line style skips both colors after data', 'none',C4301,C4301,2.,[1.,2.],None,False,False,False,True),
 ('empty dashed path skips both colors','dashed',C4301,C4301,2.,[1.,2.],None,True,False,False,True),
 ('hidden pending shape skips colors/data','dashed',C4301,C4301,2.,[1.,2.],None,False,True,True,True),
 ('normal embedded gap alpha before foreground','dashed','#11223344','blue',2.,[1.,2.],None,False,False,False,True),
 ('Some none gap still draws inverse with alpha0','dashed','none','red',2.,[1.,2.],0.,False,False,False,True),
 ('global cycle raw colors with alpha override','dashed','C0','C1',2.,[1.,2.],.5,False,False,False,True),
 ('bad gap beats bad foreground','dashed',C4301,C4301,2.,[1.,2.],None,False,False,False,True),
 ('valid gap draws before bad foreground','dashed','red',C4301,2.,[1.,2.],None,False,False,False,True),
 ('empty effective list inverse beats bad foreground','dashed','red',C4301,2.,[],None,False,False,False,True),
 ('bad gap beats empty inverse','dashed',C4301,'blue',2.,[],None,False,False,False,True),
 ('negative gap GC beats bad foreground','dashed','red',C4301,2.,[-1.,1.],None,False,False,False,True),
 ('allzero gap GC beats bad foreground','dashed','red',C4301,2.,[0.,0.],None,False,False,False,True),
 ('NaN ordinary rc pattern still runs both paths','dashed','red','blue',2.,[1.,math.nan],None,False,False,False,True),
 ('Inf ordinary rc pattern still runs both paths','dashed','red','blue',2.,[1.,math.inf],None,False,False,False,True),
 ('negativeInf inverse reaches gap GC','dashed','red','blue',2.,[1.,-math.inf],None,False,False,False,True),
 ('odd rc pattern rotates without parity guard','dashed','red','blue',2.,[1.,2.,3.],None,False,False,False,True),
 ('zero width skips bad gap and bad dashes','dashed',C4301,'blue',0.,[-1.,1.],None,False,False,False,True),
 ('negative width skips bad gap and bad dashes','dashed',C4301,'blue',-2.,[-1.,1.],None,False,False,False,True),
 ('NaN width skips bad gap and bad dashes','dashed',C4301,'blue',math.nan,[-1.,1.],None,False,False,False,True),
 ('None gap avoids empty inverse and foreground emptyseq accepts','dashed',None,'blue',2.,[],None,False,False,False,True),
 ('nonempty allnonfinite validates gap before segment filtering','dashed','red','blue',2.,[-1.,1.],None,False,False,False,True),
 ('pending shape error beats both colors','dashed',C4301,C4301,2.,[1.,2.],None,False,True,False,True),
 ('empty tuple origin inverse has distinct late message','dashed','red','blue',2.,[],None,False,False,False,False),
]
for label,ls,gap,fg,width,pattern,override,empty,bad,hidden,scale in profiles:
 style.reset_rc();style.rc['lines.dashed_pattern']=pattern;style.rc['lines.scale_dashes']=scale
 axes,line=setup(leaf=True,x=[]if empty else[math.nan,math.inf]if label.startswith('nonempty allnonfinite')else[0.,1.],
  y=[]if empty else[math.nan,-math.inf]if label.startswith('nonempty allnonfinite')else[10.,20.])
 line.set_linewidth(width);line.set_linestyle(ls);line.set_gapcolor(gap);line.set_color(fg);line.set_alpha(override)
 if bad:line.set_ydata([1.,2.,3.])
 line._visible=not hidden
 draw_take(label,axes,line,linestyle=ls,gapcolor=gap,color=fg,width=width,pattern=pattern,alpha=override,empty=empty,bad=bad,hidden=hidden,scale_dashes=scale)

style.reset_rc();axes,line=setup(leaf=True);line.set_linestyle('dashed');line.set_gapcolor('C0');line.set_color('C1')
for colors in [['#11223344','none'],['none','#00ff0080']]:
 color.cycle.colors=colors
 draw_take('live rc reinterprets retained gap and foreground cycle tokens',axes,line,colors=colors)

body_hashes=dict(style.method_hashes)
for name in ['get_gapcolor','set_gapcolor','is_dashed']:
 node=next(n for n in color.linecls.body if isinstance(n,ast.FunctionDef)and n.name==name)
 body_hashes['lines.py:'+name]=hashlib.sha256(ast.get_source_segment(ref.L.read_text(),node).encode()).hexdigest()
body_hashes['lines.py:_get_inverse_dash_pattern']=hashlib.sha256(ast.get_source_segment(ref.L.read_text(),inverse_node).encode()).hexdigest()
payload=ref.ref.actual.json_safe({'python':sys.version.split()[0],'numpy':style.np.__version__,
 'source_hashes':dict(style.payload['source_hashes'],colors_py=color.PINS[color.COLORS],color_data_py=color.PINS[color.COLOR_DATA]),
 'method_body_hashes':body_hashes,
 'host_boundary':'Complete original get/set_gapcolor, is_dashed and inverse helper, original Line.draw with only rasterization decorator excluded, actual color validation/conversion and complete GC.set_dashes. Numeric transformed Path storage, no-marker/no-effects and other presentation GC/renderer methods are explicit capability hosts. Stage wrappers call original helpers unchanged and observe successful draw_path prefixes; they do not supply a substitute branch or validation algorithm. Live rc cycle uses accepted stored-rc/by_key host, not an Axes property iterator or full Cycler. Leaf draw dataLim stays null because setup omits add_line/update_line_limits. Native mutable RGB storage is source-only; no public API is frozen here.',
 'counts':{'setter_records':len(setter_rows),'inverse_primitives':len(inverse_rows),'draw_records':len(draw_rows),
  'source_records':len(setter_rows)+len(inverse_rows)+len(draw_rows)},
 'setter_observations':setter_rows,'inverse_observations':inverse_rows,'draw_observations':draw_rows})


number=style.number
numbers=style.numbers
flatten=style.flatten
moon=style.moon
formatted=alpha.formatted

def option_string(value):return 'None'if value is None else'Some('+moon(value)+')'
def option_number(value):return 'None'if value is None else'Some('+number(value)+')'
def option_array(value):return 'None'if value is None else'Some('+numbers(value)+')'


HEADER='''// Generated from pinned original gapcolor/inverse/Line.draw methods.
// Native mutable RGB storage and presentation stages remain source evidence.

///|
fn line_gapcolor_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn line_gapcolor_source_numbers(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() { line_gapcolor_source_double(actual[index], expected[index]) }
}

///|
fn line_gapcolor_source_option(actual : Double?, expected : Double?) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(actual), Some(expected)) => line_gapcolor_source_double(actual, expected)
    _ => fail("original optional Line alpha differs")
  }
}

///|
fn line_gapcolor_source_dashes(actual : Array[Double]?, expected : Array[Double]?) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(actual), Some(expected)) => line_gapcolor_source_numbers(actual, expected)
    _ => fail("original optional dash sequence differs")
  }
}

///|
fn line_gapcolor_source_rgba(actual : @colors.Rgba, expected : Array[Double]) -> Unit raise {
  line_gapcolor_source_numbers([actual.red(), actual.green(), actual.blue(), actual.alpha()], expected)
}

///|
fn line_gapcolor_source_state(
  line : Line2D, axes : Axes, gap : String?, foreground : String, alpha : Double?, width : Double,
  canonical : String, dashed : Bool, unscaled_offset : Double, unscaled : Array[Double]?,
  effective_offset : Double, effective : Array[Double]?, effective_as_list : Bool,
  stale : Bool, visible : Bool, invalid : Array[Bool], xy : Array[Double], data : Array[Double],
  requests : Array[Bool], scale : Bool, rc_pattern : Array[Double],
) -> Unit raise {
  assert_eq(line.get_gapcolor(), gap)
  assert_eq(line.style.line_gapcolor(), gap)
  assert_eq(line.get_color(), foreground)
  line_gapcolor_source_option(line.get_alpha(), alpha)
  line_gapcolor_source_double(line.get_linewidth(), width)
  assert_eq(line.get_linestyle(), canonical)
  assert_eq(line.is_dashed(), dashed)
  line_gapcolor_source_double(line.unscaled_dash_pattern.offset, unscaled_offset)
  line_gapcolor_source_dashes(line.unscaled_dash_pattern.dashes, unscaled)
  let stroke = line.style.line_stroke()
  line_gapcolor_source_double(stroke.dash_offset(), effective_offset)
  line_gapcolor_source_dashes(stroke.dash_sequence(), effective)
  if effective is Some(_) { assert_eq(line.scaled_dashes_as_list, effective_as_list) }
  assert_eq(line.stale(), stale)
  assert_eq(line.get_visible(), visible)
  assert_eq([line.invalid_x, line.invalid_y], invalid)
  // Observe retained cache without recache, paint preparation or other lazy getters.
  line_gapcolor_source_numbers(line.cache.flat.to_array(), xy)
  line_gapcolor_source_numbers([
    axes.data_limits().lower(), axes.data_limits(horizontal=false).lower(),
    axes.data_limits().upper(), axes.data_limits(horizontal=false).upper(),
  ], data)
  assert_eq([axes.x_axis().autoscale_stale(), axes.y_axis().autoscale_stale()], requests)
  assert_eq(@config.lines_scale_dashes(), scale)
  line_gapcolor_source_numbers(@config.lines_dashed_pattern(), rc_pattern)
}

///|
fn line_gapcolor_source_attribute(attributes : String, name : String) -> String? {
  match attributes.split_once(name + "=\\\"") {
    Some((_, after)) => match after.split_once("\\\"") {
      Some((value, _)) => Some(value.to_owned())
      None => None
    }
    None => None
  }
}

///|
fn line_gapcolor_source_polylines(svg : String) -> Array[String] raise {
  let result = []
  for index, chunk in svg.split("<polyline ").to_array() {
    if index != 0 {
      guard chunk.split_once("/>") is Some((attributes, _)) else { fail("unterminated Line polyline") }
      result.push(attributes.to_owned())
    }
  }
  result
}

///|
fn line_gapcolor_source_paint(
  attributes : String, rgba : Array[Double], offset : Double, sequence : Array[Double]?, width : Double,
) -> Unit raise {
  // RGBA values are original-source expectations; CSS encoding uses the existing
  // serializer convenience profile, not a native SVG text-format claim.
  let color = @colors.rgba(rgba[0], rgba[1], rgba[2], alpha=rgba[3]).to_css()
  assert_eq(line_gapcolor_source_attribute(attributes, "stroke"), Some(color))
  assert_eq(line_gapcolor_source_attribute(attributes, "stroke-opacity"), None)
  line_gapcolor_source_double(@ticker.parse_float_text(line_gapcolor_source_attribute(attributes, "stroke-width").unwrap()), width)
  match sequence {
    None => {
      assert_eq(line_gapcolor_source_attribute(attributes, "stroke-dasharray"), None)
      assert_eq(line_gapcolor_source_attribute(attributes, "stroke-dashoffset"), None)
    }
    Some(sequence) => {
      let text = line_gapcolor_source_attribute(attributes, "stroke-dasharray").unwrap()
      let actual = if text == "" { [] } else { text.split(",").to_array().map(value => @ticker.parse_float_text(value.to_owned())) }
      line_gapcolor_source_numbers(actual, sequence)
      line_gapcolor_source_double(@ticker.parse_float_text(line_gapcolor_source_attribute(attributes, "stroke-dashoffset").unwrap()), offset)
    }
  }
}
'''


def state_assertion(s):
 a=['line','axes',option_string(s['gapcolor']),moon(s['color']),option_number(s['alpha']),number(s['width']),
  moon(s['linestyle']),moon(s['is_dashed']),number(s['unscaled']['offset']),option_array(s['unscaled']['dashes']),
  number(s['effective']['offset']),option_array(s['effective']['dashes']),moon(s['effective']['dashes_type']=='list'),
  moon(s['stale']),moon(s['visible']),moon(s['invalid']),numbers(flatten(s['xy'])),numbers(flatten(s['data'])),
  moon([s['requests'][k]for k in ['x','y']]),moon(s['scale_dashes']),numbers(s['rc_pattern'])]
 return 'line_gapcolor_source_state('+', '.join(a)+')'


def scope():
 return style.rc_scope()+['let saved_cycle = @config.color_cycle()',
  'defer @config.set_color_cycle(saved_cycle)','@config.set_color_cycle(["#11223344", "none"])']


def expected_paints(row,svg='svg'):
 out=['let paints = line_gapcolor_source_polylines('+svg+')','assert_eq(paints.length(), '+str(len(row['drawn_paths']))+')']
 for index,p in enumerate(row['drawn_paths']):
  out+=['line_gapcolor_source_paint(paints['+str(index)+'], '+', '.join([numbers(p['rgba']),number(p['offset']),option_array(p['dashes']),number(row['before']['width'])])+')']
 return out


def setup_draw(s,params):
 xs=[p[0]for p in s['xy']];ys=[p[1]for p in s['xy']]
 ls=params.get('linestyle','dashed')
 out=['let fig = figure(width=400, height=200)','let axes = fig.axes()',
  '// Fixed parent frame and Null ticks isolate the complete source leaf draw.',
  'axes.set_x_limits(0.0, 1.0)','axes.set_y_limits(0.0, 1.0)',
  'for axis in [axes.x_axis(), axes.y_axis()] { axis.set_locator(@ticker.NullLocator::new().as_locator()); axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator()) }',
  '@config.set_lines_dashed_pattern('+numbers(s['rc_pattern'])+')',
  '@config.set_lines_scale_dashes('+moon(s['scale_dashes'])+')',
  'let line = axes.plot_line(LineData::Numeric('+numbers(xs)+'), LineData::Numeric('+numbers(ys)+'), color="blue")',
  'line.set_linewidth('+number(s['width'])+')','line.set_linestyle('+moon(ls)+')',
  'line.set_gapcolor('+option_string(s['gapcolor'])+')','line.set_color('+moon(s['color'])+')',
  'line.set_alpha('+option_number(s['alpha'])+')']
 if params.get('bad'):out+=['line.set_ydata(LineData::Numeric([1.0, 2.0, 3.0]))']
 if not s['visible']:out+=['line.set_visible(false)']
 out+=['// Source leaf construction omitted add_line/update_line_limits; input bridge only.',
  'axes.state.val.raw_x_data = empty_data_interval()','axes.state.val.raw_y_data = empty_data_interval()',
  'axes.state.val.x_data_minpos = 1.0 / 0.0','axes.state.val.y_data_minpos = 1.0 / 0.0',
  'axes.x_axis().clear_autoscale_request()','axes.y_axis().clear_autoscale_request()']
 return out


def draw_operation(row):
 out=['try {',state_assertion(row['before'])]
 operation='ignore(@svg.render_with_positions_checked(retained))'
 if row['error']:out+=[alpha.error_operation(operation,row['error'])]
 else:out+=['let svg = @svg.render_with_positions_checked(retained).0']+expected_paints(row)
 out+=[state_assertion(row['after'])]
 # Post-operation component checks keep every completed native RGBA stage bit
 # strict. They never resolve a foreground before the actual backend draw.
 pending=None
 for stage in row['renderer_stages']:
  if stage[0]=='rgba.begin':pending=(stage[1],stage[2])
  elif stage[0]=='rgba.end':
   raw,override=pending
   out+=['line_gapcolor_source_rgba(line_color_rgba('+moon(raw)+', alpha='+option_number(override)+'), '+numbers(stage[1])+')']
 out+=['} catch { error => fail('+moon('original gap draw row '+str(row['id'])+': ')+' + error.to_string()) }']
 return out


def render(document):
 original=document['original'];out=[HEADER,'///|','fn line_gapcolor_source_setters() -> Unit raise {']+scope()
 out+=['let axes = figure().axes()','ignore(axes.update_x_category_units(["a", "b"]))',
  'let line = axes.plot_line(LineData::Numeric([0.0, 1.0]), LineData::Numeric([10.0, 20.0]), color="blue")',
  'axes.x_axis().clear_autoscale_request()','axes.y_axis().clear_autoscale_request()']
 for row in original['setter_observations'][:14]:
  out+=['// '+row['label'],'try {','// Controlled native clean-stale input; no paint occurs here.',
   'line.mark_drawn()',state_assertion(row['before'])]
  operation='line.set_gapcolor('+option_string(row['input'])+')'
  out+=[alpha.error_operation(operation,row['error'])if row['error']else operation,state_assertion(row['after'])]
  if row['rgba_error']:
   out+=[alpha.error_operation('ignore(line_color_rgba(line.get_gapcolor().unwrap(), alpha=line.get_alpha()))',row['rgba_error'])]
  elif row['rgba_primitive']is not None:
   out+=['line_gapcolor_source_rgba(line_color_rgba(line.get_gapcolor().unwrap(), alpha=line.get_alpha()), '+numbers(row['rgba_primitive'])+')']
  out+=['} catch { error => fail('+moon('original gap setter row '+str(row['id'])+': ')+' + error.to_string()) }']
 out+=['}','///|','test "original String None gapcolor setter sequence" {','line_gapcolor_source_setters()','}',
  '///|','test "original inverse dash primitives and captured origin errors" {']
 for row in original['inverse_observations']:
  out+=['try {','let incoming = '+numbers(row['dashes'])]
  operation='line_gapcolor_inverse('+number(row['offset'])+', incoming, scaled_as_list='+moon(row['input_type']=='list')+')'
  if row['error']:out+=[alpha.error_operation('ignore('+operation+')',row['error'])]
  else:
   out+=['let (offset, gaps) = '+operation,
    'line_gapcolor_source_double(offset, '+number(row['offset_result'])+')',
    'line_gapcolor_source_numbers(gaps, '+numbers(row['gaps'])+')',
    'assert_eq(physical_equal(gaps, incoming), '+moon(row['result_is_input'])+')']
  out+=['line_gapcolor_source_numbers(incoming, '+numbers(row['input_after'])+')',
   '} catch { error => fail('+moon('original inverse gap row '+str(row['id'])+': ')+' + error.to_string()) }']
 out+=['}']
 for row in original['draw_observations'][:24]:
  out+=['///|','fn line_gapcolor_source_draw_'+str(row['id'])+'() -> Unit raise {']+scope()+setup_draw(row['before'],row['input'])
  out+=['let retained = fig.to_render_figure()']+draw_operation(row)+['}']
 out+=['///|','fn line_gapcolor_source_live_cycle() -> Unit raise {']+scope()+setup_draw(original['draw_observations'][24]['before'],{})
 out+=['let retained = fig.to_render_figure()']
 for row in original['draw_observations'][24:]:
  out+=['@config.set_color_cycle('+moon(row['input']['colors'])+')']+draw_operation(row)
 out+=['}','///|','test "original complete gap foreground paint ordering and late errors" {']
 out+=['line_gapcolor_source_draw_'+str(row['id'])+'()'for row in original['draw_observations'][:24]]
 out+=['line_gapcolor_source_live_cycle()','}']
 return formatted('\n'.join(out)+'\n')


def collect():
 content=json.dumps(payload,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
 expected='b87e5f99fc2da8a586b0b27926b6fbbae31b918216cca456835335db6e0924b7'
 if hashlib.sha256(content.encode()).hexdigest()!=expected:raise ValueError('complete original gapcolor payload differs')
 return {'original':payload,'original_payload_sha256':expected,
  'projection_counts':{'source_records':54,'typed_records':52,'source_only_records':2,'registered_groups':3,
   'typed_setter_records':14,'inverse_primitives':12,'draw_records':26},
  'typed_boundaries':{
   'carrier':'Only String?/None gap setter. The last two native mutable RGB storage/mutation observations remain complete source-only evidence.',
   'stages':'Complete original helper/GC/presentation stage traces and successful prefixes stay intact. The typed tests invoke the real checked backend, never resolve foreground early to simulate painting. Error cases assert exact stage error and stale; private backend integration tests additionally observe the writer prefix because no public partial-SVG return API exists.',
   'paint':'Successful complete backend draws compare polyline order/count and original RGBA/dash/offset meaning using the existing CSS serializer convenience profile. After the actual draw, completed native RGBA stages receive independent bit-exact raw-helper checks; foreground is never resolved early. This does not claim native SVG float text, caps/joins, marker or pixel-overlap compatibility.',
   'origin':'Line captured scaled_dashes_as_list records the last scaling operation. Empty inverse errors are exact list/tuple IndexErrors; current rc cannot infer this history. Native list/tuple identity/layout is not exposed by the typed Array carrier.',
   'rc':'Real original rc validators and color helpers generate all results. Live cycle by_key storage is the accepted narrow host, not general Cycler mutation or an Axes color iterator.',
   'setup':'Typed plot_line supplies attachment. One explicit null dataLim/request input bridge matches the original leaf host that omitted add_line/update_line_limits; fixed manual parent limits and Null ticks isolate parent draw phases. Setter mark_drawn is only the recorded stale=False input.',
   'alpha':'Original alpha override is replacement, not multiplication; Some none is not None and alpha0 is not visibility. Raw optional gap/alpha survive all paints unchanged.',
   'float':'Finite values, signed zero and infinities compare by bits; NaN by classification. Native NaN payload and private global RGBA cache identity are evidence, not a portable contract.'}}


def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',nargs='?',type=Path,default=ref.P);parser.add_argument('--check',action='store_true')
 args=parser.parse_args();ref.load_line_source(args.ticker);document=collect()
 content=json.dumps(document,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
 outputs={ROOT/'testdata/line_gapcolor_reference.json':content,ROOT/'scene/line_gapcolor_reference_wbtest.mbt':render(document)}
 for path,value in outputs.items():
  if args.check:
   if not path.exists()or path.read_text()!=value:raise SystemExit('Line gapcolor reference differs: '+str(path))
  else:path.write_text(value)
 print(json.dumps({'check':args.check,**document['projection_counts'],'json_sha256':hashlib.sha256(content.encode()).hexdigest()}))


if __name__=='__main__':main()
