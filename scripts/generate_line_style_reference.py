"""Pinned complete original String linestyle, dash history, suggestions and leaf draw."""
from pathlib import Path
from functools import lru_cache
import argparse,difflib,inspect,urllib.request
import ast,copy,hashlib,json,math,sys,types
import numpy as np
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_line_alpha_reference as alpha
import generate_line_width_reference as width_reference
import generate_line_units_reference as units_reference
color=alpha.color;ref=alpha.ref
PINS={ref.P.with_name('cbook.py'):'e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643',
 ref.P.with_name('rcsetup.py'):'a052eac4af21ce8cdb58ee49c3ab952af4c2ff5e18f36cc8b741793fa79b5f59',
 width_reference.source_file('backend_bases.py'):'a2b147fb149d8862fad874991f79a61cf76da3477dfd58af99755a8f9f80c074'}
for p,pin in PINS.items():
 if hashlib.sha256(p.read_bytes()).hexdigest()!=pin:raise ValueError('fixed linestyle dependency differs: '+str(p))
def execute(node,path,ns):color.execute(node,path,ns)
rcsetup=ref.P.with_name('rcsetup.py');rtree=ast.parse(rcsetup.read_bytes())
rns={'np':np,'lru_cache':lru_cache}
for name in ['_listify_validator','_make_type_validator','validate_bool']:
 execute(next(n for n in rtree.body if isinstance(n,ast.FunctionDef)and n.name==name),rcsetup,rns)
for node in rtree.body:
 if isinstance(node,ast.Assign)and any(isinstance(t,ast.Name)and t.id in ['validate_float','validate_floatlist']for t in node.targets):execute(node,rcsetup,rns)
rc=ref.ns['mpl'].rcParams
keys=['lines.dashed_pattern','lines.dashdot_pattern','lines.dotted_pattern','lines.scale_dashes'];defaults={}
for node in ast.walk(rtree):
 if isinstance(node,ast.Call)and isinstance(node.func,ast.Name)and node.func.id=='_Param'and node.args and isinstance(node.args[0],ast.Constant)and node.args[0].value in keys:
  key=node.args[0].value;defaults[key]=ast.literal_eval(next(k.value for k in node.keywords if k.arg=='default'))
for key in keys:rc.validate[key]=rns['validate_bool']if key.endswith('scale_dashes')else rns['validate_floatlist']
def reset_rc():
 for key in keys:rc[key]=copy.deepcopy(defaults[key])
reset_rc()
ns=dict(ref.lns,_api=ref.ns['_api'],mpl=ref.ns['mpl'])
ctree=ast.parse(ref.P.with_name('cbook.py').read_bytes())
for node in ctree.body:
 if isinstance(node,ast.Assign)and any(isinstance(t,ast.Name)and t.id in ['ls_mapper','ls_mapper_r']for t in node.targets):execute(node,ref.P.with_name('cbook.py'),ns)
for name in ['_get_dash_pattern','_scale_dashes']:
 execute(next(n for n in color.ltree.body if isinstance(n,ast.FunctionDef)and n.name==name),ref.L,ns)
for name in ['get_linestyle','set_linestyle','get_linewidth','set_linewidth']:
 execute(next(n for n in color.linecls.body if isinstance(n,ast.FunctionDef)and n.name==name),ref.L,ns)
class StyledLine(alpha.SolidLine):
 get_linestyle=ns['get_linestyle'];set_linestyle=ns['set_linestyle']
 get_linewidth=ns['get_linewidth'];set_linewidth=ns['set_linewidth']
 def __init__(self,axes,x,y):
  super().__init__(axes,x,y)
  self._dashcapstyle='butt';self._dashjoinstyle='round';self._gapcolor=None
  self._unscaled_dash_pattern=(0,None);self._dash_pattern=(0.,None)
 def set_initial(self):self._color='red';self.stale=False

def setup():
 axes=ref.setup();line=StyledLine(axes,[0.,1.],[10.,20.]);line.recache();axes._update_line_limits(line)
 axes._stale_viewlims={'x':False,'y':False};axes.events.clear();line.set_initial();return axes,line

def pattern(value):
 offset,dashes=value
 return {'offset':offset,'offset_bits':alpha.bits(offset),'offset_type':type(offset).__name__,
  'dashes':copy.deepcopy(dashes),'dashes_type':type(dashes).__name__,
  'dash_bits':None if dashes is None else[alpha.bits(v)for v in dashes]}
def state(line,axes):
 return {'linestyle':line.get_linestyle(),'stale':line.stale,'width':line.get_linewidth(),'width_bits':alpha.bits(line.get_linewidth()),
  'unscaled':pattern(line._unscaled_dash_pattern),'scaled':pattern(line._dash_pattern),
  'invalid':[line._invalidx,line._invalidy],'xy':line._xy.tolist(),'data':axes.dataLim._points.tolist(),
  'requests':axes._stale_viewlims.copy(),'rc':{key:copy.deepcopy(rc[key])for key in keys}}
def take(rows,label,operation,value=None):
 line.stale=False;before=state(line,axes)
 try:operation();error=None
 except Exception as exc:error={'type':type(exc).__name__,'message':str(exc)}
 rows.append({'id':len(rows),'label':label,'input':copy.deepcopy(value),'before':before,'after':state(line,axes),'error':error})
string_rows=[];axes,line=setup()
for value in ['-','solid','--','dashed','-.','dashdot',':','dotted','none','None','',' ','none','NONE','Solid',' dashed ','-- ','..']:
 take(string_rows,'String '+repr(value),lambda value=value:line.set_linestyle(value),value)
reset_rc();axes,line=setup();line.set_linestyle('dashed');coupling=[]
for label,operation,value in [
 ('live pattern change alone keeps captured dashes',lambda:rc.__setitem__('lines.dashed_pattern',[2.,4.]),[2.,4.]),
 ('same linewidth does not recapture pattern',lambda:line.set_linewidth(2.),2.),
 ('same linestyle recaptures pattern and marks stale',lambda:line.set_linestyle('dashed'),'dashed'),
 ('live scale False alone leaves captured scaled dashes',lambda:rc.__setitem__('lines.scale_dashes',False),False),
 ('same linewidth reads live scale False',lambda:line.set_linewidth(2.),2.),
 ('same linewidth reads live scale True',lambda:(rc.__setitem__('lines.scale_dashes',True),line.set_linewidth(2.)),2.),
 ('zero linewidth',lambda:line.set_linewidth(0.),0.),('negative zero linewidth',lambda:line.set_linewidth(-0.),-0.),
 ('negative linewidth',lambda:line.set_linewidth(-2.),-2.),('NaN linewidth',lambda:line.set_linewidth(math.nan),math.nan),
 ('infinite linewidth',lambda:line.set_linewidth(math.inf),math.inf),('repeated infinite linewidth',lambda:line.set_linewidth(math.inf),math.inf)]:take(coupling,label,operation,value)
pattern_rows=[]
for value in [[],[-2.,-1.],[0.,0.],[1.,math.nan],[1.,math.inf],[1.,-math.inf]]:
 reset_rc();axes,line=setup()
 take(pattern_rows,'real validated rc list and String dashed',lambda value=value:(rc.__setitem__('lines.dashed_pattern',value),line.set_linestyle('dashed')),value)
reset_rc();axes,line=setup();native_rows=[]
for value in [None,[0,[1.,2.]],(None,[1.,2.]),(-1.,[2.,3.])]:
 take(native_rows,'native non-String '+repr(value),lambda value=value:line.set_linestyle(value),value)
mutable=[1.,2.];take(native_rows,'native tuple borrows unscaled list',lambda:line.set_linestyle((0,mutable)),(0,mutable))
take(native_rows,'borrowed native dash list mutation',lambda:mutable.__setitem__(0,9.),None)
take(native_rows,'same width recomputes mutated native unscaled list',lambda:line.set_linewidth(2.),2.)

# Real complete original GC dash validation; other GC operations are sinks.
gcpath=width_reference.source_file('backend_bases.py')
gccls=next(n for n in ast.parse(gcpath.read_bytes()).body if isinstance(n,ast.ClassDef)and n.name=='GraphicsContextBase')
gns={'np':np};execute(next(n for n in gccls.body if isinstance(n,ast.FunctionDef)and n.name=='set_dashes'),gcpath,gns)
class GC(alpha.GC):
 def set_dashes(self,offset,dashes):
  self.stages.append(['gc.set_dashes.begin',offset,copy.deepcopy(dashes)])
  try:gns['set_dashes'](self,offset,dashes)
  except Exception as exc:self.stages.append(['gc.set_dashes.error',type(exc).__name__]);raise
  self.stages.append(['gc.set_dashes.end'])
class Renderer(alpha.Renderer):
 def new_gc(self):self.stages.append(['renderer.new_gc']);return GC(self.stages)
draw_rows=[]
profiles=[
 ('none style skips nonempty C4301 color','none',[0.,1.],[10.,20.],2.,None,False,True),
 ('none style still recaches pending bad shape','none',[0.,1.],[10.,20.],2.,None,True,True),
 ('solid C4301 control reaches color','solid',[0.,1.],[10.,20.],2.,None,False,True),
 ('positive width negative dash reaches real GC error','dashed',[0.,1.],[10.,20.],2.,[-1.,1.],False,False),
 ('zero width bypasses negative dash validation','dashed',[0.,1.],[10.,20.],0.,[-1.,1.],False,False),
 ('negative width bypasses negative dash validation','dashed',[0.,1.],[10.,20.],-2.,[-1.,1.],False,False),
 ('NaN width bypasses negative dash validation','dashed',[0.,1.],[10.,20.],math.nan,[-1.,1.],False,False),
 ('positive width allzero dash reaches real GC error','dashed',[0.,1.],[10.,20.],2.,[0.,0.],False,False),
 ('allnonfinite nonempty path still validates negative dashes','dashed',[math.nan,math.inf],[math.nan,-math.inf],2.,[-1.,1.],False,False)]
for label,style,xs,ys,width,dashes,bad,poison in profiles:
 reset_rc()
 if dashes is not None:rc['lines.dashed_pattern']=dashes
 axes=ref.setup();line=StyledLine(axes,xs,ys);line.recache();line._color='red';line.set_linewidth(width);line.set_linestyle(style)
 if poison:line.set_color('C'+'9'*4301)
 if bad:line.set_ydata([1.,2.,3.])
 renderer=Renderer();axes.events.clear();color.events.clear();before=state(line,axes)
 try:line.draw(renderer);error=None
 except Exception as exc:error={'type':type(exc).__name__,'message':str(exc)}
 draw_rows.append({'id':len(draw_rows),'label':label,'before':before,'after':state(line,axes),'renderer_stages':renderer.stages,
  'axis_events':copy.deepcopy(axes.events),'color_events':copy.deepcopy(color.events),'error':error})
method_hashes={}
for name in ['get_linestyle','set_linestyle','get_linewidth','set_linewidth']:
 node=next(n for n in color.linecls.body if isinstance(n,ast.FunctionDef)and n.name==name)
 method_hashes['lines.py:'+name]=hashlib.sha256(ast.get_source_segment(ref.L.read_text(),node).encode()).hexdigest()
for name in ['_get_dash_pattern','_scale_dashes']:
 node=next(n for n in color.ltree.body if isinstance(n,ast.FunctionDef)and n.name==name)
 method_hashes['lines.py:'+name]=hashlib.sha256(ast.get_source_segment(ref.L.read_text(),node).encode()).hexdigest()
method_hashes['lines.py:draw']=alpha.body_hashes['lines.py:draw']
node=next(n for n in gccls.body if isinstance(n,ast.FunctionDef)and n.name=='set_dashes')
method_hashes['backend_bases.py:set_dashes']=hashlib.sha256(ast.get_source_segment(gcpath.read_text(),node).encode()).hexdigest()
payload={'python':sys.version.split()[0],'numpy':np.__version__,'source_hashes':dict(ref.source_hashes(),**{p.name:pin for p,pin in PINS.items()}),
 'method_body_hashes':method_hashes,'default_rc':defaults,'ls_mapper':ns['ls_mapper'],'ls_mapper_r':ns['ls_mapper_r'],
 'host_boundary':'Complete original Line methods, dash helpers, alias assignments, real _api.check_in_list, and real RcParams setters with complete original floatlist/bool validators. Complete original no-marker Line.draw with rasterization decorator excluded, already transformed Path storage and presentation sinks; GC.set_dashes executes its complete original numpy validation. Native tuple/list protocols are independent source-only candidates, not a typed API freeze.',
 'counts':{'string_records':len(string_rows),'coupling_records':len(coupling),'rc_pattern_records':len(pattern_rows),'native_container_records':len(native_rows),'draw_records':len(draw_rows),
  'records':len(string_rows)+len(coupling)+len(pattern_rows)+len(native_rows)+len(draw_rows)},
 'string_observations':string_rows,'coupling_observations':coupling,'rc_pattern_observations':pattern_rows,'native_container_observations':native_rows,'draw_observations':draw_rows}


def suggestions():
 api=units_reference.ns['_api'];path=units_reference.P.parent/'_api/__init__.py'
 styles=next(n for n in color.linecls.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id=='_lineStyles'for t in n.targets))
 choices=[*ast.literal_eval(styles.value),*ns['ls_mapper_r']]
 inputs=['NONE','Solid',' dashed ','-- ','..','- ',' .','-. ','None ','dash','dashd','doted','dottod',
  'solİd','ſolid','so🙂lid','dash\0ed','dashdot'+'x'*14,'dashdot'+'x'*15,'solid'+'x'*5000]
 rows=[]
 for value in inputs:
  message=api.list_suggestion_error_msg('ls',value,choices)
  rows.append({'id':len(rows),'input':value,'input_codepoints':len(value),'message':message,
   'matches':difflib.get_close_matches(value,choices,cutoff=.5)})
 node=next(n for n in ast.parse(path.read_bytes()).body if isinstance(n,ast.FunctionDef)and n.name=='list_suggestion_error_msg')
 libpath=Path(inspect.getfile(difflib))
 if hashlib.sha256(libpath.read_bytes()).hexdigest()!='3eb2d371b4a171b063921de6bbf115108bc39de8bf72866315868ce2599213b7':raise ValueError('fixed CPython difflib source differs')
 return {'python':sys.version.split()[0],'choices':choices,'counts':{'suggestion_primitives':len(rows)},
  'source_hashes':{'_api/__init__.py':hashlib.sha256(path.read_bytes()).hexdigest(),'difflib.py':hashlib.sha256(libpath.read_bytes()).hexdigest()},
  'body_hashes':{'list_suggestion_error_msg':hashlib.sha256(ast.get_source_segment(path.read_text(),node).encode()).hexdigest(),
  'get_close_matches':hashlib.sha256(inspect.getsource(difflib.get_close_matches).encode()).hexdigest()},
  'boundary':'Independent original String suggestion factory; all 11 choices are fixed original Line/cbook entries. Complete actual helper calls actual CPython3.12.14 difflib.get_close_matches n=3/cutoff=.5. These are primitive diagnostics, separate from the 52 Line profiles; no Moon implementation is consulted.',
  'observations':rows}


def sums():
 global axes,line
 rows=[]
 for value in [[1e16,-1.,-1e16],[1e16,1.,-1e16],[1e16,1.,-1e16,-1.],[1e16,-1.,-1e16,1.]]:
  reset_rc();axes,line=setup()
  take(rows,'actual String dashed with compensated builtin sum',lambda value=value:(rc.__setitem__('lines.dashed_pattern',value),line.set_linestyle('dashed')),value)
  result=sum(rc['lines.dashed_pattern'])
  rows[-1]['builtin_sum']=result;rows[-1]['builtin_sum_bits']=alpha.bits(result);rows[-1]['builtin_sum_type']=type(result).__name__
 return ref.ref.actual.json_safe({'python':sys.version.split()[0],'counts':{'sum_boundary_records':len(rows)},
  'source_hashes':payload['source_hashes'],
  'boundary':'Actual CPython3.12.14 builtin sum is consumed by the complete original _get_dash_pattern through real validated RcParams and original String setter. No naive summation or Moon implementation generates expected values. These four independent new records do not alter the original 52.',
  'observations':rows})


def cpython_sum_source():
 url='https://raw.githubusercontent.com/python/cpython/v3.12.14/Python/bltinmodule.c'
 expected='368b677db85bd846fc85271d6e7170ee8e529230bd1ea352d16ccef0a75787e0'
 path=ROOT/'.moonagent/checkpoints/D51-source/bltinmodule.c'
 if not path.exists():
  data=urllib.request.urlopen(url,timeout=30).read()
  if hashlib.sha256(data).hexdigest()!=expected:raise ValueError('fixed CPython sum source differs')
  path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(data)
 if hashlib.sha256(path.read_bytes()).hexdigest()!=expected:raise ValueError('fixed CPython sum source differs')
 return {'url':url,'sha256':expected,'boundary':'Actual builtin sum executes in CPython3.12.14. Pinned original C source documents the compensated float stage; it is not reimplemented to generate expected values.'}


HEADER='''// Generated from pinned original String Line methods and GC draw; do not edit.
// Seven native tuple/list/None records remain source-only in the JSON.

///|
fn line_style_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn line_style_source_numbers(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() { line_style_source_double(actual[index], expected[index]) }
}

///|
fn line_style_source_optional(actual : Array[Double]?, expected : Array[Double]?) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(actual), Some(expected)) => line_style_source_numbers(actual, expected)
    _ => fail("original optional dash sequence differs")
  }
}

///|
fn line_style_source_pattern(line : Line2D, unscaled_offset : Double, unscaled_dashes : Array[Double]?, scaled_offset : Double, scaled_dashes : Array[Double]?) -> Unit raise {
  line_style_source_double(line.unscaled_dash_pattern.offset, unscaled_offset)
  line_style_source_optional(line.unscaled_dash_pattern.dashes, unscaled_dashes)
  let stroke = line.style.line_stroke()
  line_style_source_double(stroke.dash_offset(), scaled_offset)
  line_style_source_optional(stroke.dash_sequence(), scaled_dashes)
}

///|
fn line_style_source_state(line : Line2D, axes : Axes, canonical : String, stale : Bool, width : Double, invalid : Array[Bool], xy : Array[Double], data : Array[Double], requests : Array[Bool]) -> Unit raise {
  assert_eq(line.get_linestyle(), canonical)
  assert_eq(line.stale(), stale)
  line_style_source_double(line.get_linewidth(), width)
  assert_eq([line.invalid_x, line.invalid_y], invalid)
  line_style_source_numbers(line.cache.flat.to_array(), xy)
  line_style_source_numbers([
    axes.data_limits().lower(), axes.data_limits(horizontal=false).lower(),
    axes.data_limits().upper(), axes.data_limits(horizontal=false).upper(),
  ], data)
  assert_eq([axes.x_axis().autoscale_stale(), axes.y_axis().autoscale_stale()], requests)
  assert_eq(line.get_alpha(), None)
  assert_true(line.get_visible())
}

///|
fn line_style_source_rc(scale : Bool, dashed : Array[Double], dashdot : Array[Double], dotted : Array[Double]) -> Unit raise {
  assert_eq(@config.lines_scale_dashes(), scale)
  line_style_source_numbers(@config.lines_dashed_pattern(), dashed)
  line_style_source_numbers(@config.lines_dashdot_pattern(), dashdot)
  line_style_source_numbers(@config.lines_dotted_pattern(), dotted)
}
'''


number=alpha.number
numbers=alpha.numbers
flatten=alpha.flatten
moon=alpha.moon

def optional(values):return 'None'if values is None else 'Some('+numbers(values)+')'


def state_assertions(state):
 args=['line','axes',moon(state['linestyle']),moon(state['stale']),number(state['width']),moon(state['invalid']),
  numbers(flatten(state['xy'])),numbers(flatten(state['data'])),moon([state['requests'][key]for key in ['x','y']])]
 unscaled=state['unscaled'];scaled=state['scaled'];rc=state['rc']
 return ['line_style_source_state('+', '.join(args)+')',
  'line_style_source_pattern(line, '+', '.join([number(unscaled['offset']),optional(unscaled['dashes']),number(scaled['offset']),optional(scaled['dashes'])])+')',
  'line_style_source_rc('+', '.join([moon(rc['lines.scale_dashes']),numbers(rc['lines.dashed_pattern']),numbers(rc['lines.dashdot_pattern']),numbers(rc['lines.dotted_pattern'])])+')']


def rc_scope():
 return ['let saved_scale = @config.lines_scale_dashes()',
  'let saved_dashed = @config.lines_dashed_pattern()',
  'let saved_dashdot = @config.lines_dashdot_pattern()',
  'let saved_dotted = @config.lines_dotted_pattern()',
  'defer { @config.set_lines_scale_dashes(saved_scale); @config.set_lines_dashed_pattern(saved_dashed); @config.set_lines_dashdot_pattern(saved_dashdot); @config.set_lines_dotted_pattern(saved_dotted) }',
  '@config.set_lines_scale_dashes(true)',
  '@config.set_lines_dashed_pattern([3.7, 1.6])',
  '@config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])',
  '@config.set_lines_dotted_pattern([1.0, 1.65])']


def setup_moon():
 return ['let axes = figure().axes()',
  'ignore(axes.update_x_category_units(["a", "b"]))',
  'let line = axes.plot_line(LineData::Numeric([0.0, 1.0]), LineData::Numeric([10.0, 20.0]), color="red")',
  'axes.x_axis().clear_autoscale_request()', 'axes.y_axis().clear_autoscale_request()']


def checked_row(row,operation,label):
 lines=['// '+row['label'],'try {','// Match native controlled stale=False input; this is not a draw.', 'line.mark_drawn()']
 lines+=state_assertions(row['before'])
 lines+=[alpha.error_operation(operation,row['error'])if row['error']else operation]
 lines+=state_assertions(row['after'])
 lines+=['assert_eq(line.get_color(), "red")','} catch { error => fail('+moon(label+': ')+' + error.to_string()) }']
 return lines


def render(document):
 main=document['main'];lines=[HEADER,'///|','fn line_style_source_strings() -> Unit raise {']+rc_scope()+setup_moon()
 for row in main['string_observations']:
  lines+=checked_row(row,'line.set_linestyle('+moon(row['input'])+')','original String linestyle row '+str(row['id']))
 lines+=['}','///|','test "original String linestyle aliases and atomic errors" {','line_style_source_strings()','}']
 lines+=['///|','fn line_style_source_history() -> Unit raise {']+rc_scope()+setup_moon()+['line.set_linestyle("dashed")']
 operations=[
  '@config.set_lines_dashed_pattern([2.0, 4.0])','line.set_linewidth(2.0)','line.set_linestyle("dashed")',
  '@config.set_lines_scale_dashes(false)','line.set_linewidth(2.0)',
  '@config.set_lines_scale_dashes(true); line.set_linewidth(2.0)',
  'line.set_linewidth(0.0)','line.set_linewidth(-0.0)','line.set_linewidth(-2.0)',
  'line.set_linewidth(0.0 / 0.0)','line.set_linewidth(1.0 / 0.0)','line.set_linewidth(1.0 / 0.0)']
 for row,operation in zip(main['coupling_observations'],operations,strict=True):
  lines+=checked_row(row,operation,'original dash history row '+str(row['id']))
 lines+=['}','///|','test "original captured dash history and live scaling" {','line_style_source_history()','}']
 for name,rows in [('rc',main['rc_pattern_observations']),('sum',document['sum']['observations'])]:
  for row in rows:
   lines+=['///|',f'fn line_style_source_{name}_{row["id"]}() -> Unit raise {{']+rc_scope()+setup_moon()
   operation='@config.set_lines_dashed_pattern('+numbers(row['input'])+'); line.set_linestyle("dashed")'
   lines+=checked_row(row,operation,'original '+name+' pattern row '+str(row['id']))
   if name=='sum':lines+=['line_style_source_double(line_style_float_sum('+numbers(row['input'])+'), '+number(row['builtin_sum'])+')']
   lines+=['}']
 lines+=['///|','test "original rc patterns and compensated sum boundaries" {']
 for name,rows in [('rc',main['rc_pattern_observations']),('sum',document['sum']['observations'])]:
  for row in rows:lines+=[f'line_style_source_{name}_{row["id"]}()']
 lines+=['}','///|','test "original fixed-choice difflib suggestions" {']
 for row in document['suggestions']['observations']:
  lines+=['assert_eq(line_style_invalid_message('+moon(row['input'])+'), '+moon('ValueError: '+row['message'])+')']
 lines+=['}']
 for row in main['draw_observations']:
  before=row['before'];after=row['after'];index=row['id']
  xs=[p[0]for p in before['xy']];ys=[p[1]for p in before['xy']]
  lines+=['///|',f'fn line_style_source_draw_{index}() -> Unit raise {{']+rc_scope()
  if index>=3:lines+=['@config.set_lines_dashed_pattern('+numbers(before['rc']['lines.dashed_pattern'])+')']
  lines+=['let fig = figure(width=400, height=200)','let axes = fig.axes()',
   '// Fixed frame isolates the original leaf draw from Axes autoscale and ticks.',
   'axes.set_x_limits(0.0, 1.0)','axes.set_y_limits(0.0, 1.0)',
   'for axis in [axes.x_axis(), axes.y_axis()] { axis.set_locator(@ticker.NullLocator::new().as_locator()); axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator()) }',
   'let line = axes.plot_line(LineData::Numeric('+numbers(xs)+'), LineData::Numeric('+numbers(ys)+'), color="red")',
   'line.set_color('+moon('C'+'9'*4301 if index in [0,1,2]else'red')+')',
   'line.set_linewidth('+number(before['width'])+')',
   'line.set_linestyle('+moon('none'if index in [0,1]else'solid'if index==2 else'dashed')+')']
  if index==1:lines+=['line.set_ydata(LineData::Numeric([1.0, 2.0, 3.0]))']
  lines+=['// Source leaf host omitted add_line/update_line_limits: seed its null dataLim.',
   'axes.state.val.raw_x_data = empty_data_interval()',
   'axes.state.val.raw_y_data = empty_data_interval()',
   'axes.state.val.x_data_minpos = 1.0 / 0.0','axes.state.val.y_data_minpos = 1.0 / 0.0',
   'axes.x_axis().clear_autoscale_request()','axes.y_axis().clear_autoscale_request()']
  lines+=state_assertions(before)
  lines+=['let retained = fig.to_render_figure()']
  operation='ignore(@svg.render_with_positions_checked(retained))'
  lines+=[alpha.error_operation(operation,row['error'])if row['error']else operation]
  lines+=state_assertions(after)
  raw='C'+'9'*4301 if index in [0,1,2]else'red'
  lines+=['assert_eq(line.get_color(), '+moon(raw)+')','}']
 lines+=['///|','test "original no-marker leaf draw and actual GC validation" {']
 for row in main['draw_observations']:
  lines+=['line_style_source_draw_'+str(row['id'])+'() catch { error => fail('+moon('original linestyle draw row '+str(row['id'])+': ')+' + error.to_string()) }']
 lines+=['}']
 return alpha.formatted('\n'.join(lines)+'\n')


def collect():
 main=ref.ref.actual.json_safe(payload);suggestion_payload=suggestions();sum_payload=sums()
 expected_groups={
  'main':'821b7a4ef0b733481df633ec1dc441bf4cbf3c45cb3fbcf289bb438becffedfe',
  'suggestions':'2f1f32bd65b99812a0375d53660184e28d408e55b16a2d0f864f454396eb2ab5',
  'sum':'c437ee98595368376dd181c5716e3f7e7720cbea630e2f025039f7eb6e763afe'}
 groups={'main':main,'suggestions':suggestion_payload,'sum':sum_payload}
 for name,group in groups.items():
  original=json.dumps(group,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
  if hashlib.sha256(original.encode()).hexdigest()!=expected_groups[name]:raise ValueError('original preparation group differs: '+name)
 return dict(groups,profile='Matplotlib3.11.2 complete String Line/style/GC + CPython3.12.14 fixed suggestions and sum',
  original_group_sha256=expected_groups,additional_source={'cpython_sum':cpython_sum_source()},
  projection_counts={'source_records':76,'typed_records':69,'source_only_records':7,'registered_groups':5,
   'string_records':18,'history_records':12,'rc_records':6,'suggestion_primitives':20,'sum_records':4,'draw_records':9},
  typed_boundaries={
   'carrier':'Only String setters. Seven native None/tuple/list borrowing/partial records remain complete source-only evidence.',
   'pattern':'Public Style stroke snapshot and private captured unscaled history assert all original offset/sequence bits. Native int/tuple/list identities are recorded but do not imply dynamic Python container types.',
   'draw':'Real checked SVG backend validates dashes after live provider data/color and before finite splitting; successful backend completion clears stale. Fixed axis frame and private null dataLim input bridge isolate the original no-marker leaf host, which did not call add_line.',
   'float':'Finite values, signed zero and infinities compare by bits; NaN compares by classification without payload portability.',
   'suggestions':'Complete original API helper + actual fixed difflib generate all messages. Typed helper specializes the fixed eleven choices, not a general SequenceMatcher public API.',
   'rc':'Complete real RcParams floatlist/bool validators generate inputs. Typed Double arrays are copied rc snapshots; arbitrary user-defined values/operators and native tuple aliases are outside this profile.',
   'svg':'No marker, rasterization decorator, full GUI, native CSS float formatting or exact dash rendering parity is claimed.'})


def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',nargs='?',type=Path,default=ref.P);parser.add_argument('--check',action='store_true')
 args=parser.parse_args();ref.load_line_source(args.ticker)
 document=collect();content=json.dumps(document,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
 outputs={ROOT/'testdata/line_style_reference.json':content,ROOT/'scene/line_style_reference_wbtest.mbt':render(document)}
 for path,value in outputs.items():
  if args.check:
   if not path.exists()or path.read_text()!=value:raise SystemExit('Line String style reference differs: '+str(path))
  else:path.write_text(value)
 print(json.dumps({'check':args.check,**document['projection_counts'],'json_sha256':hashlib.sha256(content.encode()).hexdigest()}))


if __name__=='__main__':main()
