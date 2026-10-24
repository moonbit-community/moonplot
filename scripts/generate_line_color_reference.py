"""Pinned original Line String color/reference and complete named-color map."""
from pathlib import Path
import argparse,ast,copy,hashlib,json,re,struct,sys,types,urllib.request
from numbers import Real
import numpy as np
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_line_units_reference as ref
from generate_auto_date_reference import formatted
from generate_scale_defaults_reference import moon
P=ref.P
SOURCE_ROOT='https://raw.githubusercontent.com/matplotlib/matplotlib/v3.11.2/lib/matplotlib/'
SOURCES={
 'colors.py':('colors.py','ef4173f9e8310bc75714e32c3855719c27916c6c651b5c94e39f00163842cf04','D48-source'),
 '_color_data.py':('_color_data.py','93ec1d4e2e80ac9c64b2a05f313fbb532daa5b3f175f84e1e60b237f7d82c263','D49-source'),
}
def source_file(name):
 relative,pin,cache=SOURCES[name];path=ROOT/'.moonagent/checkpoints'/cache/name
 if not path.exists():
  raw=urllib.request.urlopen(SOURCE_ROOT+relative,timeout=30).read()
  if hashlib.sha256(raw).hexdigest()!=pin:raise ValueError('fixed color download differs: '+name)
  path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(raw)
 if hashlib.sha256(path.read_bytes()).hexdigest()!=pin:raise ValueError('fixed color source differs: '+name)
 return path
COLORS=source_file('colors.py');COLOR_DATA=source_file('_color_data.py')
PINS={COLORS:SOURCES['colors.py'][1],COLOR_DATA:SOURCES['_color_data.py'][1]}

def execute(node,path,ns):exec(compile(ast.Module(body=[copy.deepcopy(node)],type_ignores=[]),str(path),'exec'),ns)
def top(tree,name):return next(n for n in tree.body if isinstance(n,(ast.FunctionDef,ast.ClassDef))and n.name==name)

# Explicit rc storage/cycler by_key capability. Validation of rc assignments,
# full Cycler implementation and an Axes color iterator are not tested here.
events=[]
class CycleData:
 def __init__(self,colors):self.colors=colors
 def by_key(self):events.append(['cycle.by_key']);return {'color':self.colors.copy()}
class Rc(dict):
 def __getitem__(self,key):events.append(['rc.get',key]);return super().__getitem__(key)
cycle=CycleData(['#112233','#abcdef']);rc=Rc({'axes.prop_cycle':cycle})
cns={'np':np,'re':re,'Real':Real,'mpl':types.SimpleNamespace(rcParams=rc)}
exec(compile(ast.parse(COLOR_DATA.read_bytes()),str(COLOR_DATA),'exec'),cns)
ctree=ast.parse(COLORS.read_bytes())
# Execute every original named-map construction statement, including aliases,
# in its original order, followed by complete real validation/conversion bodies.
for node in ctree.body:
 if isinstance(node,ast.ClassDef)and node.name=='_ColorMapping':execute(node,COLORS,cns)
 if isinstance(node,ast.Assign)and any(isinstance(t,ast.Name)and t.id in ['_colors_full_map','_nth_color_re']for t in node.targets):execute(node,COLORS,cns)
 if isinstance(node,ast.Expr)and isinstance(node.value,ast.Call)and isinstance(node.value.func,ast.Attribute)and isinstance(node.value.func.value,ast.Name)and node.value.func.value.id=='_colors_full_map':execute(node,COLORS,cns)
for name in ['_is_nth_color','is_color_like','_check_color_like','to_rgba','_to_rgba_no_colorcycle','to_hex']:execute(top(ctree,name),COLORS,cns)
lns={'mcolors':types.SimpleNamespace(**cns)}
ltree=ast.parse(ref.L.read_bytes());linecls=top(ltree,'Line2D')
methods={}
for name in ['get_color','set_color']:
 node=next(n for n in linecls.body if isinstance(n,ast.FunctionDef)and n.name==name)
 execute(node,ref.L,lns);methods[name]=lns[name]
class Line(ref.Line):
 get_color=methods['get_color'];set_color=methods['set_color']
axes=ref.setup();line=Line(axes,[0.,1.],[10.,20.],'color')
axes._children.append(line);line.recache();axes._update_line_limits(line)
line._color='black';line._linewidth=2.;axes._stale_viewlims={'x':False,'y':False};axes.events.clear()
rows=[]
def snapshot():
 return {'color':copy.deepcopy(line.get_color()),'color_type':type(line.get_color()).__name__,'stale':line.stale,
  'invalid':[line._invalidx,line._invalidy],'xy':line._xy.tolist(),'data':axes.dataLim._points.tolist(),
  'requests':axes._stale_viewlims.copy(),'width':line._linewidth,'color_cache_size':len(cns['_colors_full_map'].cache)}
def take(label,value):
 events.clear();line.stale=False;before=snapshot()
 try:line.set_color(value);error=None
 except Exception as exc:error={'type':type(exc).__name__,'message':str(exc)}
 after=snapshot();setter_events=copy.deepcopy(events);same_object=line.get_color()is value
 events.clear()
 if error is None:
  try:rgba=cns['to_rgba'](line.get_color());rgba_error=None
  except Exception as exc:rgba=None;rgba_error={'type':type(exc).__name__,'message':str(exc)}
 else:rgba=rgba_error=None
 rows.append({'id':len(rows),'label':label,'input':copy.deepcopy(value),'before':before,'after':after,'setter_events':setter_events,
  'stored_is_input':same_object,'error':error,'rgba_primitive':rgba,'rgba_error':rgba_error,'rgba_events':copy.deepcopy(events)})
values=['red','red','RED','r','R','#f0a','#F0A8','#123456','#12345680','none','None','NONE','transparent','',
 ' ',' red ','0.5',' 0.5 ','.5','5e-1','+0.5','-0.0','1','1.0000000000000002','nan','inf','-inf','0_0.5','０.５',
 'tab:blue','TAB:BLUE','tab:grey','xkcd:cloudy blue','rebeccapurple','C0','C1','C0002','C-1','C٠',
 'C999999999999999999999999','#12','#ggg','0x123456','rgb(255,0,0)']
for value in values:take('string '+repr(value),value)
take('4301-digit ASCII cycle index accepted now but int conversion is deferred','C'+'9'*4301)
take('C0 before live rc cycle replacement','C0')
cycle.colors=['#00ff00','#0000ff'];events.clear();before=snapshot()
rgba=cns['to_rgba'](line.get_color())
rows.append({'id':len(rows),'label':'live rc cycle replacement reinterprets unchanged raw C0','before':before,'after':snapshot(),
 'rgba_primitive':rgba,'rgba_events':copy.deepcopy(events),'source_only_rc_storage':True})
# Non-string native storage/alias is an explicit source-only boundary.
color_list=[.1,.2,.3];take('native mutable RGB list is stored by identity (source-only)',color_list)
color_list[0]=2.;events.clear();before=snapshot()
try:rgba=cns['to_rgba'](line.get_color());error=None
except Exception as exc:rgba=None;error={'type':type(exc).__name__,'message':str(exc)}
rows.append({'id':len(rows),'label':'mutating borrowed native color bypasses setter and fails on later conversion (source-only)',
 'before':before,'after':snapshot(),'get_color_is_original_list':line.get_color()is color_list,'rgba_primitive':rgba,'error':error,'events':copy.deepcopy(events)})
body_hashes={}
for path,nodes in [(ref.L,[n for n in linecls.body if isinstance(n,ast.FunctionDef)and n.name in methods]),
 (COLORS,[top(ctree,name)for name in ['_is_nth_color','is_color_like','_check_color_like','to_rgba','_to_rgba_no_colorcycle']])]:
 for node in nodes:body_hashes[path.name+':'+node.name]=hashlib.sha256(ast.get_source_segment(path.read_text(),node).encode()).hexdigest()


def double_bits(value):return struct.unpack('>Q',struct.pack('>d',float(value)))[0]


def named_records():
 result=[]
 for name,spec in cns['_colors_full_map'].items():
  rgba=cns['to_rgba'](name)
  result.append({'id':len(result),'name':name,'raw_map_value':copy.deepcopy(spec),'rgba':rgba,
   'rgba_bits':[double_bits(value)for value in rgba]})
 return result


def render_names(records):
 groups={}
 for row in records:
  if row['rgba_bits'][3]!=double_bits(1.):raise ValueError('fixed named map alpha is not one')
  groups.setdefault(tuple(row['rgba_bits'][:3]),[]).append(row['name'])
 lines=['// Generated from pinned complete original color map and to_rgba; do not edit.',
  '// Exact lookup only. Native casing/none/hex/gray/C syntax is handled separately.',
  '// colors.py SHA256 '+SOURCES['colors.py'][1],
  '// _color_data.py SHA256 '+SOURCES['_color_data.py'][1],
  '///|','fn line_color_named_components(red : UInt64, green : UInt64, blue : UInt64) -> @colors.Rgba {',
  'try! @colors.rgba(red.reinterpret_as_double(), green.reinterpret_as_double(), blue.reinterpret_as_double())',
  '}','///|','fn line_color_named(value : String) -> @colors.Rgba? {','match value {']
 for rgb,names in groups.items():
  pattern=' | '.join(moon(name)for name in names)
  lines.append(pattern+' => Some(line_color_named_components('+', '.join(str(value)+'UL'for value in rgb)+')),')
 lines+=['_ => None','}','}']
 return formatted('\n'.join(lines)+'\n')



def collect_string_boundaries():
 global axes,line,rows
 original_rows=rows
 axes=ref.setup();line=Line(axes,[0.,1.],[10.,20.],'color-boundary')
 axes._children.append(line);line.recache();axes._update_line_limits(line)
 line._color='black';line._linewidth=2.;axes._stale_viewlims={'x':False,'y':False};axes.events.clear()
 cycle.colors=['#112233','#abcdef'];rows=[]
 for label,value in [('Kelvin sign in multi-character native name','PINK'),
  ('single Kelvin sign does not receive lowercase fallback','K'),
  ('4300 leading zero C index converts successfully','C'+'0'*4300),
  ('4301 leading zero C index fails only during conversion','C'+'0'*4301)]:take(label,value)
 extra=rows;rows=original_rows
 return extra


def collect_draw_boundaries():
 namespace=dict(ref.lns,mcolors=lns['mcolors'],mpl=cns['mpl'])
 artist_path=ref.P.with_name('artist.py')
 artist=next(n for n in ast.parse(artist_path.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='Artist')
 methods={}
 for node in artist.body:
  if isinstance(node,ast.FunctionDef)and node.name in ['get_visible','get_path_effects','get_gid','get_url','get_snap','get_sketch_params']:
   execute(node,artist_path,namespace);methods[node.name]=namespace[node.name]
 draw_original=next(n for n in linecls.body if isinstance(n,ast.FunctionDef)and n.name=='draw')
 draw=copy.deepcopy(draw_original);draw.decorator_list=[];execute(draw,ref.L,namespace)
 node=next(n for n in linecls.body if isinstance(n,ast.FunctionDef)and n.name=='is_dashed')
 execute(node,ref.L,namespace)
 styles=next(n for n in linecls.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id=='_lineStyles'for t in n.targets))
 class SolidLine(Line):
  draw=namespace['draw'];is_dashed=namespace['is_dashed'];_lineStyles=ast.literal_eval(styles.value)
  def __init__(self,axes,x,y):
   super().__init__(axes,x,y,'solid')
   self._visible=True;self._path_effects=[];self._gid=None;self._url=None;self._snap=None;self._sketch=None
   self._linestyle='-';self._marker=None;self._linewidth=2.;self._alpha=None
   self._antialiased=True;self._solidjoinstyle='round';self._solidcapstyle='butt';self._dash_pattern=(0,None)
  def _get_transformed_path(self):
   return types.SimpleNamespace(get_transformed_path_and_affine=lambda:(self._path,types.SimpleNamespace(frozen=lambda:None)))
  def _set_gc_clip(self,gc):gc.stages.append(['gc.clip'])
 for name,value in methods.items():setattr(SolidLine,name,value)
 rc['path.snap']=True
 class GC:
  def __init__(self,stages):self.stages=stages
 for name in ['set_url','set_antialiased','set_linewidth','set_joinstyle','set_capstyle','set_snap','set_sketch_params','set_foreground','set_dashes','restore']:
  def sink(self,*args,_name=name,**kwargs):self.stages.append(['gc.'+_name])
  setattr(GC,name,sink)
 class Renderer:
  def __init__(self):self.stages=[]
  def open_group(self,*args):self.stages.append(['renderer.open_group'])
  def close_group(self,*args):self.stages.append(['renderer.close_group'])
  def new_gc(self):self.stages.append(['renderer.new_gc']);return GC(self.stages)
  def draw_path(self,*args):self.stages.append(['renderer.draw_path'])
 rows=[]
 for label,x,y in [('empty',[],[]),('nonempty',[0.,1.],[10.,20.]),('all-nonfinite',[float('nan'),float('inf')],[float('nan'),float('-inf')])]:
  axes=ref.setup();line=SolidLine(axes,x,y);line.recache();line._color='black';line.stale=False
  line.set_color('C'+'9'*4301);renderer=Renderer();events.clear()
  def state():return {'raw_color':line.get_color(),'stale':line.stale,'invalid':[line._invalidx,line._invalidy],'xy':line._xy.tolist()}
  before=state()
  try:line.draw(renderer);error=None
  except Exception as exc:error={'type':type(exc).__name__,'message':str(exc)}
  rows.append({'id':len(rows),'label':label+' solid/no-marker original draw with C4301','before':before,'after':state(),
   'renderer_stages':renderer.stages,'color_events':copy.deepcopy(events),'error':error})
 return {'draw_body_sha256':hashlib.sha256(ast.get_source_segment(ref.L.read_text(),draw_original).encode()).hexdigest(),
  'boundary':'Complete original Line.draw with rasterization decorator excluded, real color helpers, solid style/no marker. Already transformed numeric Path storage, no-op clipping/GC setters and renderer group/path presentation sinks. No conditional ifempty/to_rgba substitute in host.',
  'observations':rows}


HEADER='''// Generated from pinned original Line String color and RGBA helpers; do not edit.

///|
fn line_color_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn line_color_source_numbers(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() { line_color_source_double(actual[index], expected[index]) }
}

///|
fn line_color_source_rgba(actual : @colors.Rgba, expected : Array[UInt64]) -> Unit raise {
  assert_eq([
    actual.red().reinterpret_as_uint64(), actual.green().reinterpret_as_uint64(),
    actual.blue().reinterpret_as_uint64(), actual.alpha().reinterpret_as_uint64(),
  ], expected)
}

///|
fn line_color_source_state(
  line : Line2D, axes : Axes, raw_color : String, stale : Bool,
  width : Double, invalid : Array[Bool], xy : Array[Double], data : Array[Double], requests : Array[Bool],
) -> Unit raise {
  assert_eq(line.get_color(), raw_color)
  assert_eq(line.stale(), stale)
  line_color_source_double(line.get_linewidth(), width)
  assert_eq([line.invalid_x, line.invalid_y], invalid)
  // Retained storage only: do not turn a state assertion into lazy conversion.
  line_color_source_numbers(line.cache.flat.to_array(), xy)
  line_color_source_numbers([
    axes.data_limits().lower(), axes.data_limits(horizontal=false).lower(),
    axes.data_limits().upper(), axes.data_limits(horizontal=false).upper(),
  ], data)
  assert_eq([axes.x_axis().autoscale_stale(), axes.y_axis().autoscale_stale()], requests)
}

///|
fn line_color_source_name(name : String, expected : Array[UInt64]) -> Unit raise {
  guard line_color_named(name) is Some(named) else { fail("missing original named color: " + name) }
  line_color_source_rgba(named, expected)
  line_color_source_rgba(line_color_rgba(name), expected)
}
'''


def number(value):
 if isinstance(value,dict)and set(value)=={'float'}:value=value['float']
 if isinstance(value,str)and value in ['nan','inf','-inf']:
  return {'nan':'(0.0 / 0.0)','inf':'(1.0 / 0.0)','-inf':'(-1.0 / 0.0)'}[value]
 return moon(float(value))
def number_array(values):return '['+', '.join(number(value)for value in values)+']'
def bit_array(values):return '['+', '.join(str(value)+'UL'for value in values)+']'
def flatten(values):return [value for row in values for value in row]


def state_assertion(state):
 args=['line','axes',moon(state['color']),moon(state['stale']),number(state['width']),moon(state['invalid']),
  number_array(flatten(state['xy'])),number_array(flatten(state['data'])),moon([state['requests'][name]for name in ['x','y']])]
 return 'line_color_source_state('+', '.join(args)+')'


def error_operation(operation,error):
 message=error['type']+': '+error['message']
 return 'assert_true(try { '+operation+'; false } catch { @core.DataError::InvalidTicks(message~) => message == '+moon(message)+'; _ => false })'


def rgba_assertions(row):
 if row.get('rgba_error')is not None:return [error_operation('ignore(line_color_rgba(line.get_color()))',row['rgba_error'])]
 if row.get('rgba_primitive')is not None:
  return ['line_color_source_rgba(line_color_rgba(line.get_color()), '+bit_array([double_bits(value)for value in row['rgba_primitive']])+')']
 return []


def render(payload):
 lines=[HEADER]
 groups=[payload['observations'][:47],payload['string_boundaries']]
 for scenario,records in enumerate(groups):
  lines+=['///|',f'fn line_color_source_sequence_{scenario}() -> Unit raise {{',
   'let previous_cycle = @config.color_cycle()',
   'defer { try! @config.set_color_cycle(previous_cycle) }',
   '@config.set_color_cycle(["#112233", "#abcdef"])',
   'let axes = figure().axes()','ignore(axes.update_x_category_units(["a", "b"]))',
   'let line = axes.plot_line(LineData::Numeric([0.0, 1.0]), LineData::Numeric([10.0, 20.0]), color="black")',
   'axes.x_axis().clear_autoscale_request()','axes.y_axis().clear_autoscale_request()']
  for row in records:
   label=f'original Line color scenario {scenario}, row '+str(row['id'])
   lines+=['// '+row['label'],'try {']
   if 'input'in row:
    lines+=['// Controlled stale=False input only; this is not a draw completion.',
     'line.mark_drawn()',state_assertion(row['before'])]
    operation='line.set_color('+moon(row['input'])+')'
    lines += [error_operation(operation,row['error'])if row['error']else operation]
    lines+=[state_assertion(row['after'])]
   else:
    # This original row observes a host rc replacement, not another setter.
    lines+=['@config.set_color_cycle(["#00ff00", "#0000ff"])',state_assertion(row['before']),state_assertion(row['after'])]
   lines+=rgba_assertions(row)
   lines+=['} catch { error => fail('+moon(label+': ')+' + error.to_string()) }']
  lines+=['}']
 lines+=['///|','test "original Line String color setter and live rc sequences" {',
  'line_color_source_sequence_0()','line_color_source_sequence_1()','}']
 for row in payload['draw_boundaries']['observations']:
  index=row['id'];before=row['before'];after=row['after']
  xs=[point[0]for point in before['xy']];ys=[point[1]for point in before['xy']]
  lines+=['///|',f'fn line_color_source_draw_{index}() -> Unit raise {{',
   'let previous_cycle = @config.color_cycle()','defer { try! @config.set_color_cycle(previous_cycle) }',
   '@config.set_color_cycle(["#112233", "#abcdef"])','let fig = figure()','let axes = fig.axes()',
   'ignore(axes.update_x_category_units(["a", "b"]))',
   'let line = axes.plot_line(LineData::Numeric('+number_array(xs)+'), LineData::Numeric('+number_array(ys)+'), color="black")',
   'line.set_color('+moon(before['raw_color'])+')',
   'assert_eq(line.stale(), '+moon(before['stale'])+')',
   'let panel = fig.to_render_figure().panels()[0]']
  operation='guard panel.prepare_line(line.points) is Some(context) else { fail("expected registered Line provider") }; context.complete()'
  if row['error']:lines+=[error_operation(operation,row['error'])]
  else:lines+=[operation]
  lines+=['assert_eq(line.stale(), '+moon(after['stale'])+')',
   'assert_eq(line.get_color(), '+moon(after['raw_color'])+')',
   'assert_eq([line.invalid_x, line.invalid_y], '+moon(after['invalid'])+')',
   'line_color_source_numbers(line.cache.flat.to_array(), '+number_array(flatten(after['xy']))+')','}']
 lines+=['///|','test "original solid Line draw empty and nonempty color timing" {']
 for row in payload['draw_boundaries']['observations']:lines.append('line_color_source_draw_'+str(row['id'])+'()')
 lines+=['}']
 names=payload['named_color_primitives']
 chunks=[names[index:index+32]for index in range(0,len(names),32)]
 for index,chunk in enumerate(chunks):
  lines+=['///|',f'fn line_color_source_names_{index}() -> Unit raise {{']
  for row in chunk:lines.append('line_color_source_name('+moon(row['name'])+', '+bit_array(row['rgba_bits'])+')')
  lines+=['}']
 for group,start in enumerate(range(0,len(chunks),8)):
  lines+=['///|','test '+moon('original complete named color primitives group '+str(group))+' {']
  for index in range(start,min(start+8,len(chunks))):lines.append('line_color_source_names_'+str(index)+'()')
  lines+=['}']
 return formatted('\n'.join(lines)+'\n')


def collect():
 extra=collect_string_boundaries();draw=collect_draw_boundaries();names=named_records()
 return {'python':sys.version.split()[0],'numpy':np.__version__,
  'source_hashes':dict(ref.source_hashes(),**{'colors.py':PINS[COLORS],'_color_data.py':PINS[COLOR_DATA]}),
  'source_downloads':{name:{'url':SOURCE_ROOT+relative,'sha256':pin}for name,(relative,pin,_)in SOURCES.items()},
  'method_body_hashes':body_hashes,'named_color_count':len(cns['_colors_full_map']),
  'host_boundary':'Complete original Line color getter/setter and real complete color validation/RGBA helpers, entire original fixed named map including aliases. Existing actual Line unit/data host. Rc/CycleData are declared stored rc/cycler by_key capabilities, not full Cycler or RcParams assignment validation; no Axes color iterator is supplied or consumed. RGBA is an independent primitive, not Line.draw or full SVG. Non-string mutable RGB list is source-only.',
  'typed_boundaries':{
   'legacy_records':'All original 49 preparation records are retained in full. First 47 String/live-rc records project onto typed raw String/state plus the private RGBA helper; last two mutable RGB alias records are source-only.',
   'new_strings':'Four independent original String records cover multi-character Kelvin lowercase, single-character Kelvin rejection and leading-zero C index digit limit on each side.',
   'unicode':'All 1163 actual names are ASCII. Root independently checked CPython Unicode15 lowercase: Kelvin U+212A is the only non-ASCII codepoint whose lowercase becomes all ASCII. This is profile rationale, not an added Matplotlib observation.',
   'named':'The generated production exact lookup and 1163 primitive expected RGBA bit vectors both come from the complete original map and real to_rgba, without port lookup as an oracle.',
   'style':'Native raw names/RGBA are distinct from existing Rgba.to_css convenience serialization; no native SVG CSS or viewer parity is claimed.',
   'cache':'Native module color-cache sizes, String object identity, Rc/Cycler read traces and mutable private map are evidence without new public cache/identity/callback protocols.',
   'draw':'Three independent complete original draw observations use solid/no-marker control. Typed projection invokes production Panel.prepare_line and success completion, without fixture empty/visibility/color branching.',
   'initialization':'Explicit black/width2 initial Line is the existing typed plot bridge. Private mark_drawn supplies only the recorded clean-stale inputs; it is not a native draw claim.',
  },
  'counts':{'string_setter':46,'other_profiles':3,'records':49,'additional_string_records':4,'draw_records':3,'named_primitive_records':1163,
   'source_records':1219,'typed_records':1217,'source_only_records':2,'typed_setter_sequences':2,'typed_draw_scenarios':3,'named_chunks':37,'registered_groups':7},
  'observations':ref.ref.actual.json_safe(rows),'string_boundaries':ref.ref.actual.json_safe(extra),
  'draw_boundaries':ref.ref.actual.json_safe(draw),'named_color_primitives':ref.ref.actual.json_safe(names),
  'named_keys_all_ascii':all(row['name'].isascii()for row in names)}


def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',nargs='?',type=Path,default=P);parser.add_argument('--check',action='store_true')
 args=parser.parse_args();ref.load_line_source(args.ticker);payload=collect()
 document=json.dumps(payload,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
 outputs={ROOT/'testdata/line_color_reference.json':document,
  ROOT/'scene/line_color_reference_wbtest.mbt':render(payload),
  ROOT/'scene/line_color_names.mbt':render_names(payload['named_color_primitives'])}
 for path,content in outputs.items():
  if args.check:
   if not path.exists()or path.read_text()!=content:raise SystemExit('Line color reference differs: '+str(path))
  else:path.write_text(content)
 print(json.dumps({'check':args.check,**payload['counts'],'json_sha256':hashlib.sha256(document.encode()).hexdigest()}))


if __name__=='__main__':main()
