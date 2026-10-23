"""Pinned original Line drawstyle, cached Path, borrowed buffers and lifecycle reference."""
from pathlib import Path
import argparse,ast,copy,hashlib,json,math,struct,sys,types,warnings,urllib.request
import numpy as np
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_line_units_reference as ref

PATH=ROOT/'.moonagent/checkpoints/D52-source/path.py'
PATH_SHA='5c726cf2765c7c4549de79d3327adabd5613dba0dd4e9bf208fafb48799ee12f'
PATH_URL='https://raw.githubusercontent.com/matplotlib/matplotlib/v3.11.2/lib/matplotlib/path.py'
if not PATH.exists():
 data=urllib.request.urlopen(PATH_URL,timeout=30).read()
 if hashlib.sha256(data).hexdigest()!=PATH_SHA:raise ValueError('fixed Path source differs')
 PATH.parent.mkdir(parents=True,exist_ok=True);PATH.write_bytes(data)
if hashlib.sha256(PATH.read_bytes()).hexdigest()!=PATH_SHA:raise ValueError('fixed Path source differs')
CBOOK=ref.P.with_name('cbook.py')
if hashlib.sha256(CBOOK.read_bytes()).hexdigest()!='e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643':raise ValueError('fixed cbook differs')
def execute(node,path,ns):
 exec(compile(ast.fix_missing_locations(ast.Module(body=[copy.deepcopy(node)],type_ignores=[])),str(path),'exec'),ns)
def top(tree,name):return next(n for n in tree.body if isinstance(n,(ast.FunctionDef,ast.ClassDef))and n.name==name)
def method(cls,name):return next(n for n in cls.body if isinstance(n,ast.FunctionDef)and n.name==name)

ctree=ast.parse(CBOOK.read_bytes());lns=dict(ref.lns,_api=ref.ns['_api'])
for name in ['pts_to_prestep','pts_to_poststep','pts_to_midstep']:
 execute(top(ctree,name),CBOOK,lns)
execute(next(n for n in ctree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id=='STEP_LOOKUP_MAP'for t in n.targets)),CBOOK,lns)

# These original Path methods need no compiled _path algorithm. Preserve their
# actual conversion, shape check, direct vertex assignment and rc reads.
rtree=ast.parse(ref.P.with_name('rcsetup.py').read_bytes());path_rc={}
for node in ast.walk(rtree):
 if isinstance(node,ast.Call)and isinstance(node.func,ast.Name)and node.func.id=='_Param'and node.args and isinstance(node.args[0],ast.Constant)and node.args[0].value in ['path.simplify','path.simplify_threshold']:
  path_rc[node.args[0].value]=ast.literal_eval(next(k.value for k in node.keywords if k.arg=='default'))
ptree=ast.parse(PATH.read_bytes());pclass=top(ptree,'Path')
pns=dict(lns,mpl=types.SimpleNamespace(rcParams=path_rc))
body=[]
for node in pclass.body:
 if isinstance(node,ast.Assign):
  # Only class constants needed by __init__/_update_values, no path cache.
  if any(isinstance(t,ast.Name)and t.id in ['code_type','STOP','MOVETO','LINETO','CURVE3','CURVE4','CLOSEPOLY','NUM_VERTICES_FOR_CODE']for t in node.targets):body.append(node)
 elif isinstance(node,ast.FunctionDef)and node.name in ['__init__','_update_values','vertices','codes']:
  body.append(node)
execute(ast.ClassDef(name='Path',bases=[],keywords=[],body=body,decorator_list=[],type_params=[]),PATH,pns)
NativePath=pns['Path'];lns['Path']=NativePath
for name in ['recache','get_drawstyle','set_drawstyle']:
 execute(method(ref.line,name),ref.L,lns)
style_ns={}
for node in ref.line.body:
 if isinstance(node,ast.Assign)and any(isinstance(t,ast.Name)and t.id in ['_drawStyles_l','_drawStyles_s','drawStyles','drawStyleKeys']for t in node.targets):execute(node,ref.L,style_ns)
class DrawLine(ref.Line):
 drawStyles=style_ns['drawStyles']
 get_drawstyle=lns['get_drawstyle'];set_drawstyle=lns['set_drawstyle']
 def recache(self,always=False):
  if self.axes is not None:self.axes.events.append(['recache.begin',self.name,always])
  try:result=lns['recache'](self,always=always)
  except Exception as exc:
   if self.axes is not None:self.axes.events.append(['recache.error',self.name,type(exc).__name__])
   raise
  if self.axes is not None:self.axes.events.append(['recache.end',self.name])
  return result

def bits(value):return struct.unpack('>Q',struct.pack('>d',float(value)))[0]
def array(value):
 if value is None:return None
 value=np.asarray(value)
 return {'values':value.tolist(),'shape':list(value.shape),'bits':[bits(v)for v in value.flat],
  'strides':list(value.strides),'c_contiguous':bool(value.flags.c_contiguous)}
def setup(x=[0.,2.,5.],y=[1.,4.,-3.],style='default'):
 axes=ref.setup();line=DrawLine(axes,x,y,'drawstyle');axes._children.append(line)
 line.set_drawstyle(style);line.recache();axes._update_line_limits(line)
 axes._stale_viewlims={'x':False,'y':False};axes.events.clear();line.stale=False
 return axes,line
def snapshot(axes,line):
 vertices=None if line._path is None else line._path.vertices
 return {'drawstyle':line.get_drawstyle(),'stale':line.stale,'invalid':[line._invalidx,line._invalidy],
  'xorig':ref.raw(line.get_xdata()),'yorig':ref.raw(line.get_ydata()),
  'x':array(line._x),'y':array(line._y),'xy':array(line._xy),'path':array(vertices),
  'path_is_xy':vertices is line._xy,'path_shares_xy':vertices is not None and line._xy is not None and bool(np.shares_memory(vertices,line._xy)),
  'path_metadata':None if line._path is None else {'codes':None if line._path.codes is None else line._path.codes.tolist(),
   'interpolation_steps':line._path._interpolation_steps,'readonly':line._path._readonly,
   'should_simplify':bool(line._path._should_simplify),'simplify_threshold_bits':bits(line._path._simplify_threshold)},
  'data':axes.dataLim._points.tolist(),'minpos':axes.dataLim._minpos.tolist(),
  'requests':axes._stale_viewlims.copy(),'view':axes.viewLim._points.tolist(),
  'unit':list(axes.xaxis.units._mapping.items())if hasattr(axes.xaxis.units,'_mapping')else None}
rows=[]
def take(label,axes,line,operation,value=None,retained=None):
 axes.events.clear();before=snapshot(axes,line)
 with warnings.catch_warnings(record=True)as caught:
  warnings.simplefilter('always')
  try:result=operation();error=None
  except Exception as exc:result=None;error={'type':type(exc).__name__,'message':str(exc)}
 if isinstance(result,NativePath):result={'path_vertices':array(result.vertices)}
 elif isinstance(result,np.ndarray):result=array(result)
 elif isinstance(result,tuple)and all(isinstance(v,np.ndarray)for v in result):result=[array(v)for v in result]
 rows.append({'id':len(rows),'label':label,'input':value,'before':before,'after':snapshot(axes,line),
  'result':result,'error':error,'events':copy.deepcopy(axes.events),
  'warnings':[{'type':type(w.message).__name__,'message':str(w.message)}for w in caught],
  'retained':None if retained is None else {key:array(v)for key,v in retained.items()}})

# Setters themselves do not rebuild either xy or Path. 'steps' is an alias for
# the step function, but the original getter keeps the String 'steps'.
axes,line=setup()
for style in ['default','steps','steps','steps-pre','steps-mid','steps-post','default','Default','pre','','steps-','steps-middle',None]:
 line.stale=False
 take('set drawstyle '+repr(style),axes,line,lambda style=style:line.set_drawstyle(style),style)

# New independent instances capture actual native Path.__init__ storage for
# zero/singleton/two/N and nonfinite/overflow inputs, with no copied step formula.
inputs=[([],[]),([2.],[3.]),([0.,2.],[1.,4.]),([0.,2.,5.,9.],[1.,4.,-3.,8.]),
 ([math.nan,math.inf,-math.inf],[1.,-2.,3.]),([sys.float_info.max,sys.float_info.max],[1.,2.])]
for style in ['default','steps','steps-pre','steps-mid','steps-post']:
 for xs,ys in inputs:
  axes,line=setup(xs,ys)
  line.set_drawstyle(style);line.stale=False
  take('actual Path construction '+style+' N='+str(len(xs)),axes,line,lambda:line.get_path(),{'style':style,'x':xs,'y':ys})

# Exact alias divergence: valid flags mean relim consumes the existing Path.
for style in ['default','steps-pre','steps-mid','steps-post']:
 axes,line=setup([0.,2.],[1.,3.],style);xy=line.get_xydata();old_x=line.get_xdata(False);old_path=line.get_path().vertices
 take('borrow xy mutation '+style,axes,line,lambda:(xy.__setitem__((0,0),-10.),xy.__setitem__((0,1),100.)),None,{'xy':xy,'x':old_x,'path':old_path})
 take('relim existing path after xy mutation '+style,axes,line,lambda:axes.relim(),None,{'xy':xy,'x':old_x,'path':old_path})
 take('forced recache fresh generation '+style,axes,line,lambda:line.recache(always=True),None,{'xy':xy,'x':old_x,'path':old_path})

axes,line=setup();old_x=line.get_xdata(False);old_path=line.get_path().vertices
take('y-only setter keeps old x query valid',axes,line,lambda:line.set_ydata([10.,20.,30.]),None,{'x':old_x,'path':old_path})
take('processed x does not recache y-only invalidation',axes,line,lambda:line.get_xdata(False),None,{'x':old_x,'path':old_path})
take('changing drawstyle invalidates x and preserves old path',axes,line,lambda:line.set_drawstyle('steps-mid'),None,{'x':old_x,'path':old_path})
take('processed x now recaches both pending coordinates and stepped path',axes,line,lambda:line.get_xdata(False),None,{'x':old_x,'path':old_path})

axes,line=setup();take('bad y setter no conversion',axes,line,lambda:line.set_ydata([1.,2.]))
take('bad y old x query still succeeds',axes,line,lambda:line.get_xdata(False))
take('bad y get_path late shape error leaves previous xy path',axes,line,lambda:line.get_path())
take('bad y drawstyle change only x flag',axes,line,lambda:line.set_drawstyle('steps-post'))
take('bad y relim clears dataLim before late path failure',axes,line,lambda:axes.relim())

axes,line=setup(['a','b','a'],[1.,4.,2.],'steps-mid');old_path=line.get_path().vertices
take('unit remap force-recache rebuilds stepped path before relim request',axes,line,
 lambda:axes.xaxis.set_units(ref.ref.cat['UnitData'](['b','a'])),None,{'path':old_path})

# The inverse mutation direction is also observable through the public Path.
# Keep the old-generation handles alive across same/change/lazy/always phases.
for style in ['default','steps-mid']:
 axes,line=setup([0.,2.],[1.,3.],style);xy=line.get_xydata();old_path=line.get_path().vertices
 take('borrowed Path mutation '+style,axes,line,lambda:old_path.__setitem__((0,1),-50.),None,{'xy':xy,'path':old_path})
 line.stale=False
 take('equal drawstyle retains borrowed Path '+style,axes,line,lambda style=style:line.set_drawstyle(style),style,{'xy':xy,'path':old_path})
 take('changed drawstyle retains old Path until query '+style,axes,line,lambda:line.set_drawstyle('steps-pre'),'steps-pre',{'xy':xy,'path':old_path})
 take('get_path new generation retains pending-valid y '+style,axes,line,lambda:line.get_path(),None,{'xy':xy,'path':old_path})
 take('always recache restores original y '+style,axes,line,lambda:line.recache(always=True),None,{'xy':xy,'path':old_path})

body_hashes={}
for path,cls,names in [(ref.L,ref.line,['get_drawstyle','set_drawstyle','recache','get_path','get_xydata','get_xdata','get_ydata']),
 (PATH,pclass,['__init__','_update_values'])]:
 for name in names:
  body_hashes[path.name+':'+name]=hashlib.sha256(ast.get_source_segment(path.read_text(),method(cls,name)).encode()).hexdigest()
for name in ['pts_to_prestep','pts_to_poststep','pts_to_midstep','_to_unmasked_float_array']:
 body_hashes['cbook.py:'+name]=hashlib.sha256(ast.get_source_segment(CBOOK.read_text(),top(ctree,name)).encode()).hexdigest()
payload=ref.ref.actual.json_safe({'python':sys.version.split()[0],'numpy':np.__version__,
 'source_hashes':dict(ref.source_hashes(),**{'path.py':PATH_SHA}),
 'source_download':{'url':'https://raw.githubusercontent.com/matplotlib/matplotlib/v3.11.2/lib/matplotlib/path.py','sha256':PATH_SHA},
 'body_hashes':body_hashes,'path_rc':path_rc,'drawStyles':style_ns['drawStyles'],
 'host_boundary':'Complete original selected Line methods, original cbook step functions/map, and original Path.__init__/_update_values/vertices/codes with actual float-array conversion and actual API shape check. Path rc is a read-only capability populated from original _Param defaults. Other Path methods, compiled _path algorithms, large-Line subslicing and nonidentity transforms are not executed. Short Line/Axes unit/Bbox hosts are inherited from accepted D39, but PathStorage is replaced by the real constructor/body rather than treated as evidence for native aliasing. Native String-or-None setters are observations, not an API freeze.',
 'counts':{'records':len(rows)},'observations':rows})

from generate_auto_date_reference import formatted
from generate_scale_defaults_reference import moon


def number(value):
 if isinstance(value,dict)and set(value)=={'float'}:value=value['float']
 if isinstance(value,str)and value in ['nan','inf','-inf']:
  return {'nan':'(0.0 / 0.0)','inf':'(1.0 / 0.0)','-inf':'(-1.0 / 0.0)'}[value]
 return moon(float(value))
def flat(values):
 out=[]
 for value in values:
  if isinstance(value,list):out.extend(flat(value))
  else:out.append(value)
 return out


def numbers(values):return '['+', '.join(number(v)for v in values)+']'
def array_values(value):return numbers(flat(value['values']))
def original_code(values):
 if values and isinstance(values[0],str):return 'LineData::Category('+moon(values)+')'
 return 'LineData::Numeric('+numbers(values)+')'


HEADER='''// Generated from pinned original Line drawstyle and native Path methods.
// Native None reset and physical ndarray metadata remain source evidence.

///|
fn line_drawstyle_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn line_drawstyle_source_numbers(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() { line_drawstyle_source_double(actual[index], expected[index]) }
}

///|
fn line_drawstyle_source_original(actual : LineData, expected : LineData) -> Unit raise {
  match (actual, expected) {
    (LineData::Numeric(actual), LineData::Numeric(expected)) => line_drawstyle_source_numbers(actual, expected)
    (LineData::Category(actual), LineData::Category(expected)) => assert_eq(actual, expected)
    _ => fail("original drawstyle coordinate kind differs")
  }
}

///|
fn line_drawstyle_source_state(
  line : Line2D, axes : Axes, drawstyle : String, stale : Bool, invalid : Array[Bool],
  x_original : LineData, y_original : LineData, xs : Array[Double], ys : Array[Double],
  xy : Array[Double], path : Array[Double], path_is_xy : Bool, data : Array[Double],
  minpos : Array[Double], requests : Array[Bool], view : Array[Double],
  unit_labels : Array[String], unit_positions : Array[Double],
) -> Unit raise {
  assert_eq(line.get_drawstyle(), drawstyle)
  assert_eq(line.stale(), stale)
  assert_eq([line.invalid_x, line.invalid_y], invalid)
  line_drawstyle_source_original(line.get_xdata(), x_original)
  line_drawstyle_source_original(line.get_ydata(), y_original)
  // Inspect storage directly: before/after checks must not normalize pending flags.
  line_drawstyle_source_numbers(line.cache.xs.to_array(), xs)
  line_drawstyle_source_numbers(line.cache.ys.to_array(), ys)
  line_drawstyle_source_numbers(line.cache.flat.to_array(), xy)
  line_drawstyle_source_numbers(line.path_values.to_array(), path)
  // This checks the shared object even for an empty default Path.
  assert_eq(physical_equal(line.path_values, line.cache.flat), path_is_xy)
  line_drawstyle_source_numbers([
    axes.data_limits().lower(), axes.data_limits(horizontal=false).lower(),
    axes.data_limits().upper(), axes.data_limits(horizontal=false).upper(),
  ], data)
  line_drawstyle_source_numbers([axes.data_minpos(), axes.data_minpos(horizontal=false)], minpos)
  assert_eq([axes.x_axis().autoscale_stale(), axes.y_axis().autoscale_stale()], requests)
  let x_view = axes.x_axis().stored_view_limits()
  let y_view = axes.y_axis().stored_view_limits()
  line_drawstyle_source_numbers([x_view.lower(), y_view.lower(), x_view.upper(), y_view.upper()], view)
  let units = axes.x_axis().get_category_units().unwrap()
  assert_eq(units.labels(), unit_labels)
  line_drawstyle_source_numbers(units.positions(), unit_positions)
}
'''


def state_assertion(s):
 args=['line','axes',moon(s['drawstyle']),moon(s['stale']),moon(s['invalid']),
  original_code(s['xorig']),original_code(s['yorig']),array_values(s['x']),array_values(s['y']),
  array_values(s['xy']),array_values(s['path']),moon(s['path_is_xy']),numbers(flat(s['data'])),
  numbers(s['minpos']),moon([s['requests'][name]for name in ['x','y']]),numbers(flat(s['view'])),
  moon([name for name,_ in s['unit']]),numbers([position for _,position in s['unit']])]
 return 'line_drawstyle_source_state('+', '.join(args)+')'


def setup_moon(s,initial_style='default',pending_style=None):
 labels=[name for name,_ in s['unit']]
 out=['let axes = figure().axes()',
  'ignore(axes.update_x_category_units('+moon(labels)+'))',
  'let line = axes.plot_line('+original_code(s['xorig'])+', '+original_code(s['yorig'])+', color="blue")',
  '// Setup bridge: source constructed then recached its short Line before attachment.',
  'line.set_drawstyle('+moon(initial_style)+')','line.recache_checked(always=true)']
 if pending_style is not None:out+=['line.set_drawstyle('+moon(pending_style)+')']
 if not s['stale']:out+=['line.mark_drawn()']
 # Match the controlled native initial view and cached data box exactly once.
 # Later operations are never normalized to their expected after snapshots.
 out+=['// Initial host bridge only: plain source view/data/minpos before the scenario.',
  'axes.state.val.raw_x_data = @core.limits('+number(s['data'][0][0])+', '+number(s['data'][1][0])+')',
  'axes.state.val.raw_y_data = @core.limits('+number(s['data'][0][1])+', '+number(s['data'][1][1])+')',
  'axes.state.val.x_data_minpos = '+number(s['minpos'][0]),
  'axes.state.val.y_data_minpos = '+number(s['minpos'][1]),
  'axes.x_axis().set_view_limits('+number(s['view'][0][0])+', '+number(s['view'][1][0])+')',
  'axes.y_axis().set_view_limits('+number(s['view'][0][1])+', '+number(s['view'][1][1])+')',
  'axes.x_axis().clear_autoscale_request()','axes.y_axis().clear_autoscale_request()']
 for name in ['x','y']:
  if s['requests'][name]:out+=['axes.'+name+'_axis().request_autoscale()']
 return out


def retained_assertions(row):
 return []if row['retained']is None else[
  'line_drawstyle_source_numbers(held_'+key+'.to_array(), '+array_values(value)+')'
  for key,value in row['retained'].items()]


def error_operation(operation,error):
 message=error['message']if error['message'].startswith('shape mismatch:')else error['type']+': '+error['message']
 return 'assert_true(try { '+operation+'; false } catch { @core.DataError::InvalidTicks(message~) => message == '+moon(message)+'; _ => false })'


def emit_row(row,operation,*,result_view=False,clean_stale=False):
 out=['// '+row['label'],'try {']
 if clean_stale:out+=['// Controlled input stale=False, not a drawing operation.','line.mark_drawn()']
 out+=[state_assertion(row['before'])]
 if row['error']:out+=[error_operation('ignore('+operation+')'if result_view else operation,row['error'])]
 elif result_view:
  result=row['result'];values=result['path_vertices']if 'path_vertices'in result else result
  out+=['let returned = '+operation,'line_drawstyle_source_numbers(returned.to_array(), '+array_values(values)+')']
 else:out+=[operation]
 out+=[state_assertion(row['after'])]+retained_assertions(row)
 out+=['} catch { error => fail('+moon('original drawstyle row '+str(row['id'])+': ')+' + error.to_string()) }']
 return out


def render(document):
 observations=document['original']['observations'];out=[HEADER]
 out+=['///|','fn line_drawstyle_source_setters() -> Unit raise {']+setup_moon(observations[0]['before'])
 for row in observations[:12]:out+=emit_row(row,'line.set_drawstyle('+moon(row['input'])+')',clean_stale=True)
 out+=['}','///|','test "original drawstyle String setters and cache invalidation" {','line_drawstyle_source_setters()','}']
 for row in observations[13:43]:
  out+=['///|','fn line_drawstyle_source_path_'+str(row['id'])+'() -> Unit raise {']
  out+=setup_moon(row['before'],pending_style=row['input']['style'])
  out+=emit_row(row,'line.path_values_checked()',result_view=True)+['}']
 out+=['///|','test "original five drawstyle native Path vertex matrix" {']
 out+=['line_drawstyle_source_path_'+str(row['id'])+'()'for row in observations[13:43]]
 out+=['}']
 for start,style in [(43,'default'),(46,'steps-pre'),(49,'steps-mid'),(52,'steps-post')]:
  out+=['///|','fn line_drawstyle_source_xy_alias_'+str(start)+'() -> Unit raise {']+setup_moon(observations[start]['before'],style)
  out+=['let held_xy = line.xy_values_checked()','let held_x = line.x_values_checked()','let held_path = line.path_values_checked()']
  operations=['held_xy.set(0, -10.0); held_xy.set(1, 100.0)','axes.relim_checked()','line.recache_checked(always=true)']
  for row,operation in zip(observations[start:start+3],operations,strict=True):out+=emit_row(row,operation)
  out+=['}']
 out+=['///|','test "original borrowed processed xy and cached Path divergence" {']
 out+=['line_drawstyle_source_xy_alias_'+str(start)+'()'for start in [43,46,49,52]]
 out+=['}','///|','fn line_drawstyle_source_lazy_y() -> Unit raise {']+setup_moon(observations[55]['before'])
 out+=['let held_x = line.x_values_checked()','let held_path = line.path_values_checked()']
 for row,operation,is_view in zip(observations[55:59],[
  'line.set_ydata(LineData::Numeric([10.0, 20.0, 30.0]))','line.x_values_checked()',
  'line.set_drawstyle("steps-mid")','line.x_values_checked()'],[False,True,False,True],strict=True):
  out+=emit_row(row,operation,result_view=is_view)
 out+=['}','///|','fn line_drawstyle_source_late_error() -> Unit raise {']+setup_moon(observations[59]['before'])
 for row,operation,is_view in zip(observations[59:64],[
  'line.set_ydata(LineData::Numeric([1.0, 2.0]))','line.x_values_checked()',
  'line.path_values_checked()','line.set_drawstyle("steps-post")','axes.relim_checked()'],[False,True,True,False,False],strict=True):
  out+=emit_row(row,operation,result_view=is_view)
 out+=['}','///|','fn line_drawstyle_source_unit_remap() -> Unit raise {']+setup_moon(observations[64]['before'],'steps-mid')
 out+=['let held_path = line.path_values_checked()']
 out+=emit_row(observations[64],'axes.set_x_units(Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["b", "a"]))))')+['}']
 for start,style in [(65,'default'),(70,'steps-mid')]:
  out+=['///|','fn line_drawstyle_source_path_alias_'+str(start)+'() -> Unit raise {']+setup_moon(observations[start]['before'],style)
  out+=['let held_xy = line.xy_values_checked()','let held_path = line.path_values_checked()']
  operations=['held_path.set(1, -50.0)','line.set_drawstyle('+moon(style)+')','line.set_drawstyle("steps-pre")','line.path_values_checked()','line.recache_checked(always=true)']
  for index,(row,operation)in enumerate(zip(observations[start:start+5],operations,strict=True)):
   out+=emit_row(row,operation,result_view=index==3,clean_stale=index==1)
  out+=['}']
 out+=['///|','test "original drawstyle lazy errors units and old Path generations" {',
  'line_drawstyle_source_lazy_y()','line_drawstyle_source_late_error()','line_drawstyle_source_unit_remap()',
  'line_drawstyle_source_path_alias_65()','line_drawstyle_source_path_alias_70()','}']
 return formatted('\n'.join(out)+'\n')


def collect():
 original=json.dumps(payload,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
 expected='a47d23b3136bbdeeccb9a7ac08b912405752605a44035f46e6d8c7336c9e34f4'
 if hashlib.sha256(original.encode()).hexdigest()!=expected:raise ValueError('complete original drawstyle preparation payload differs')
 return {'original':payload,'original_payload_sha256':expected,
  'projection_counts':{'source_records':75,'typed_records':74,'source_only_records':1,'registered_groups':4,
   'string_setter_records':12,'path_matrix_records':30,'xy_alias_records':12,'lazy_error_unit_path_alias_records':20},
  'typed_boundaries':{
   'None':'Original id12 native None reset remains complete source-only evidence; the typed setter carrier is String.',
   'Path':'Typed flat TickValues bridge borrows logical Path vertices. Native two-dimensional shape, physical strides/contiguity, codes/readonly/interpolation/simplification metadata and NumPy warning records remain source evidence, not typed general-Path or GUI warning contracts.',
   'alias':'Default is physically the same current cache.flat object, including empty. Steps own a distinct view. Real public TickValues writes test both directions and retained old generations; no fixture simulation of alias effects is supplied.',
   'setup':'Public plot_line is only the typed attachment bridge. Source initial Line constructor/recache precedes attachment. A single initial path recache and explicit initial stored view/dataLim/minpos seed express that controlled host; no later operation state is normalized. Private mark_drawn supplies only the native stale=False input where recorded.',
   'queries':'Before/after snapshots inspect private caches/path directly. Public processed/path getters are called only at the corresponding source operation or initial retained-handle capture.',
   'events':'Complete actual unit/recache stage observations are retained; no arbitrary public conversion callback or GUI event protocol is introduced.',
   'numbers':'All finite values, signed zero and infinities compare by bits. NaN compares by classification; native NaN payloads remain evidence.',
   'lifecycle':'Relim and unit-remap use real checked Scene operations. Source stored views and requests are observed without lazy get_xlim/get_ylim.',
   'scope':'No native full Path API, large-Line clip optimization, marker/rasterization/general nonidentity transform or ndarray layout compatibility claim.'}}


def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',nargs='?',type=Path,default=ref.P);parser.add_argument('--check',action='store_true')
 args=parser.parse_args();ref.load_line_source(args.ticker)
 document=collect();content=json.dumps(document,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
 outputs={ROOT/'testdata/line_drawstyle_reference.json':content,ROOT/'scene/line_drawstyle_reference_wbtest.mbt':render(document)}
 for path,value in outputs.items():
  if args.check:
   if not path.exists()or path.read_text()!=value:raise SystemExit('Line drawstyle reference differs: '+str(path))
  else:path.write_text(value)
 print(json.dumps({'check':args.check,**document['projection_counts'],'json_sha256':hashlib.sha256(content.encode()).hexdigest()}))


if __name__=='__main__':main()
