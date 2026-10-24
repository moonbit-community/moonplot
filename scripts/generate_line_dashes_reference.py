"""Pinned original set_dashes snapshot, history and full leaf draw reference."""
from pathlib import Path
import argparse,ast,copy,hashlib,json,math,sys
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_line_gapcolor_reference as gap
style=gap.style;alpha=gap.alpha;color=gap.color;ref=gap.ref
node=next(n for n in color.linecls.body if isinstance(n,ast.FunctionDef)and n.name=='set_dashes')
ns=dict(gap.gns);color.execute(node,ref.L,ns)
class DashesLine(gap.GapLine):set_dashes=ns['set_dashes']
def setup(*,scale=True,leaf=False,x=[0.,1.],y=[10.,20.]):
 style.reset_rc();style.rc['lines.scale_dashes']=scale
 axes=ref.setup();line=DashesLine(axes,x,y);line.recache();line._color='blue'
 if not leaf:axes._children.append(line);axes._update_line_limits(line)
 axes._stale_viewlims={'x':False,'y':False};axes.events.clear();line.stale=False
 return axes,line
def state(axes,line,seq=None):
 s=gap.state(axes,line);s.update({'unscaled_is_sequence':seq is not None and line._unscaled_dash_pattern[1]is seq,
  'effective_is_sequence':seq is not None and line._dash_pattern[1]is seq,
  'effective_is_unscaled':line._dash_pattern[1]is line._unscaled_dash_pattern[1]})
 return s
rows=[]
def take(label,axes,line,operation,seq=None,*,projection='tuple_snapshot',external=None,held=None,operation_input=None):
 line.stale=False;axes.events.clear();color.events.clear();before=state(axes,line,seq)
 try:operation();error=None
 except Exception as exc:error={'type':type(exc).__name__,'message':str(exc)}
 rows.append({'id':len(rows),'label':label,'projection':projection,
  'input_sequence':copy.deepcopy(seq),'input_type':None if seq is None else type(seq).__name__,
  'operation_input':copy.deepcopy(operation_input),'before':before,'after':state(axes,line,seq),
  'external_after':copy.deepcopy(external),'sequence_after':copy.deepcopy(seq),
  'retained_effective':None if held is None else style.pattern(held),
  'error':error,'axis_events':copy.deepcopy(axes.events),'color_events':copy.deepcopy(color.events)})

patterns=[[],[1.,2.],[1.,2.,3.],[0.,0.],[-1.,1.],[1.,math.nan],[1.,math.inf],[1.,-math.inf],[1e16,-1.,-1e16]]
for scale in [True,False]:
 for values in patterns:
  axes,line=setup(scale=scale);seq=tuple(values)
  take('actual tuple set_dashes scale='+str(scale),axes,line,lambda:line.set_dashes(seq),seq,operation_input={'kind':'set_dashes','values':values})

# Mutable typed input is explicitly mapped to a native immutable tuple snapshot.
# Mutating the separate caller list is not represented as native list borrowing.
for scale in [True,False]:
 axes,line=setup(scale=scale);external=[-2.,-1.];seq=tuple(external)
 take('tuple snapshot from caller input',axes,line,lambda:line.set_dashes(seq),seq,external=external,operation_input={'kind':'set_dashes','values':list(seq)})
 held=line._dash_pattern
 take('external caller mutation leaves captured tuple unchanged',axes,line,lambda:external.__setitem__(-1,4.),seq,external=external,held=held,operation_input={'kind':'external_mutation','index':1,'value':4.})
 take('repeat same tuple setter always marks stale',axes,line,lambda:line.set_dashes(seq),seq,external=external,held=held,operation_input={'kind':'set_dashes','values':list(seq)})
 take('rc template change does not replace custom sequence',axes,line,lambda:style.rc.__setitem__('lines.dashed_pattern',[9.,8.]),seq,external=external,held=held,operation_input={'kind':'rc_pattern','values':[9.,8.]})
 take('same width reads live scale using captured tuple without modulo redo',axes,line,lambda:(style.rc.__setitem__('lines.scale_dashes',not scale),line.set_linewidth(2.)),seq,external=external,held=held,operation_input={'kind':'scale_width','scale':not scale,'width':2.})
 take('String linestyle recaptures live rc after custom tuple',axes,line,lambda:line.set_linestyle('dashed'),seq,external=external,held=held,operation_input={'kind':'set_linestyle','value':'dashed'})

# This separate native-list domain is not silently promised by a copied API.
for scale in [True,False]:
 axes,line=setup(scale=scale);seq=[-2.,-1.]
 take('native list borrows unscaled sequence',axes,line,lambda:line.set_dashes(seq),seq,projection='native_list_source_only')
 held=line._dash_pattern
 take('native list element mutation live only when effective aliases',axes,line,lambda:seq.__setitem__(-1,4.),seq,projection='native_list_source_only',held=held)
 take('native same width rescales edited list without recomputing offset',axes,line,lambda:line.set_linewidth(2.),seq,projection='native_list_source_only',held=held)
 take('String style detaches current custom list metadata',axes,line,lambda:line.set_linestyle('dashed'),seq,projection='native_list_source_only',held=held)

for seq in [(None,None),[None,None]]:
 axes,line=setup();line.set_linestyle('dotted')
 take('native None-pair container boundary',axes,line,lambda:line.set_dashes(seq),seq,projection='native_none_source_only')

gap.draw_rows=[]
C4301='C'+'9'*4301
profiles=[
 ('empty tuple selects solid and ignores gap',[],2.,'red','blue',False,False,False,None,True),
 ('odd tuple foreground only',[1.,2.,3.],2.,None,'blue',False,False,False,None,True),
 ('odd tuple two strokes',[1.,2.,3.],2.,'red','blue',False,False,False,None,True),
 ('false scaling tuple two strokes',[1.,2.,3.],2.,'red','blue',False,False,False,None,False),
 ('negative custom foreground GC failure',[-1.,1.],2.,None,'blue',False,False,False,None,True),
 ('allzero custom gap GC precedes bad foreground',[0.,0.],2.,'red',C4301,False,False,False,None,True),
 ('NaN custom two strokes',[1.,math.nan],2.,'red','blue',False,False,False,None,True),
 ('Inf custom two strokes',[1.,math.inf],2.,'red','blue',False,False,False,None,True),
 ('zero width skips bad gap and negative custom validation',[-1.,1.],0.,C4301,'blue',False,False,False,None,True),
 ('NaN width skips bad gap and negative custom validation',[-1.,1.],math.nan,C4301,'blue',False,False,False,None,True),
 ('no-line after custom still skips colors',[1.,2.],2.,C4301,C4301,False,False,False,'none',True),
 ('hidden custom pending shape skips data and colors',[-1.,1.],2.,C4301,C4301,False,True,True,None,True),
 ('empty path custom skips colors and GC',[-1.,1.],2.,C4301,C4301,True,False,False,None,True),
 ('custom pending shape error before paint',[1.,2.],2.,C4301,C4301,False,True,False,None,True),
]
for label,values,width,gapcolor,fg,empty,bad,hidden,after_style,scale in profiles:
 axes,line=setup(scale=scale,leaf=True,x=[]if empty else[0.,1.],y=[]if empty else[10.,20.]);seq=tuple(values)
 line.set_linewidth(width);line.set_dashes(seq);line.set_gapcolor(gapcolor);line.set_color(fg)
 if after_style is not None:line.set_linestyle(after_style)
 if bad:line.set_ydata([1.,2.,3.])
 line._visible=not hidden
 gap.draw_take(label,axes,line,sequence=values,input_type='tuple',width=width,gapcolor=gapcolor,color=fg,empty=empty,bad=bad,hidden=hidden,after_style=after_style,scale_dashes=scale)
 gap.draw_rows[-1]['sequence_after']=copy.deepcopy(seq)

hashes=dict(gap.body_hashes)
hashes['lines.py:set_dashes']=hashlib.sha256(ast.get_source_segment(ref.L.read_text(),node).encode()).hexdigest()
typed=sum(row['projection']=='tuple_snapshot'for row in rows)
payload=ref.ref.actual.json_safe({'python':sys.version.split()[0],'numpy':style.np.__version__,
 'source_hashes':gap.payload['source_hashes'],'method_body_hashes':hashes,
 'host_boundary':'Complete original set_dashes -> set_linestyle -> _get_dash_pattern -> _scale_dashes executes. Main records explicitly use immutable Python tuples; the caller-list to tuple snapshot bridge is declared, not native list alias parity. Native list and None-pair container behavior is retained separately. Complete no-marker draw/actual inverse/color/GC source and stage observers reuse the accepted D53 leaf capability host; no port supplies expected values. Native physical sequence identity, presentation callbacks, marker and full SVG serialization are not public API promises.',
 'counts':{'setter_history_records':len(rows),'tuple_snapshot_records':typed,'native_list_source_only':8,'native_none_source_only':2,
  'draw_records':len(gap.draw_rows),'source_records':len(rows)+len(gap.draw_rows),'candidate_typed_records':typed+len(gap.draw_rows)},
 'setter_history_observations':rows,'draw_observations':gap.draw_rows})


number=gap.number
numbers=gap.numbers
moon=gap.moon
formatted=gap.formatted
HEADER=gap.HEADER.replace('line_gapcolor_source_', 'line_dashes_source_').replace(
 'Generated from pinned original gapcolor/inverse/Line.draw methods.',
 'Generated from pinned original set_dashes/tuple/scaling/full Line.draw methods.').replace(
 'Native mutable RGB storage and presentation stages remain source evidence.',
 'Native mutable list aliases/None-pairs and physical types remain source evidence.')


def rename(code):return code.replace('line_gapcolor_source_', 'line_dashes_source_')
def state_assertion(s):return rename(gap.state_assertion(s))


def setup_setter(before):
 return gap.scope()+[
  '@config.set_lines_scale_dashes('+moon(before['scale_dashes'])+')',
  '@config.set_lines_dashed_pattern('+numbers(before['rc_pattern'])+')',
  'let axes = figure().axes()', 'ignore(axes.update_x_category_units(["a", "b"]))',
  'let line = axes.plot_line(LineData::Numeric([0.0, 1.0]), LineData::Numeric([10.0, 20.0]), color="blue")',
  'axes.x_axis().clear_autoscale_request()', 'axes.y_axis().clear_autoscale_request()']


def retained_assertions(row):
 held=row['retained_effective']
 if held is None:return []
 return ['line_dashes_source_double(held.dash_offset(), '+number(held['offset'])+')',
  'line_dashes_source_dashes(held.dash_sequence(), '+gap.option_array(held['dashes'])+')']


def emit_setter(row,operation):
 if row['error']is not None:raise ValueError('tuple snapshot profile unexpectedly raised')
 out=['// '+row['label'],'try {',
  '// Controlled native stale=False input only; no draw/recache is performed.',
  'line.mark_drawn()',state_assertion(row['before']),operation,state_assertion(row['after'])]
 if row['external_after']is not None:
  out+=['line_dashes_source_numbers(incoming, '+numbers(row['external_after'])+')']
 out+=retained_assertions(row)
 out+=['} catch { error => fail('+moon('original set_dashes row '+str(row['id'])+': ')+' + error.to_string()) }']
 return out


def setup_draw(row):
 s=row['before'];p=row['input'];xs=[v[0]for v in s['xy']];ys=[v[1]for v in s['xy']]
 out=gap.scope()+[
  'let fig = figure(width=400, height=200)','let axes = fig.axes()',
  '// Fixed frame isolates the source leaf from parent ticks/autoscale.',
  'axes.set_x_limits(0.0, 1.0)','axes.set_y_limits(0.0, 1.0)',
  'for axis in [axes.x_axis(), axes.y_axis()] { axis.set_locator(@ticker.NullLocator::new().as_locator()); axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator()) }',
  '@config.set_lines_scale_dashes('+moon(s['scale_dashes'])+')',
  '@config.set_lines_dashed_pattern('+numbers(s['rc_pattern'])+')',
  'let line = axes.plot_line(LineData::Numeric('+numbers(xs)+'), LineData::Numeric('+numbers(ys)+'), color="blue")',
  'line.set_linewidth('+number(s['width'])+')',
  'line.set_dashes('+numbers(p['sequence'])+')',
  'line.set_gapcolor('+gap.option_string(s['gapcolor'])+')','line.set_color('+moon(s['color'])+')']
 if p['after_style']is not None:out+=['line.set_linestyle('+moon(p['after_style'])+')']
 if p['bad']:out+=['line.set_ydata(LineData::Numeric([1.0, 2.0, 3.0]))']
 if not s['visible']:out+=['line.set_visible(false)']
 out+=[
  '// Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.',
  'axes.state.val.raw_x_data = empty_data_interval()', 'axes.state.val.raw_y_data = empty_data_interval()',
  'axes.state.val.x_data_minpos = 1.0 / 0.0','axes.state.val.y_data_minpos = 1.0 / 0.0',
  'axes.x_axis().clear_autoscale_request()','axes.y_axis().clear_autoscale_request()',
  'let retained = fig.to_render_figure()']
 return out


def render(document):
 original=document['original'];rows=original['setter_history_observations'];out=[HEADER]
 for row in rows[:18]:
  out+=['///|','fn line_dashes_source_setter_'+str(row['id'])+'() -> Unit raise {']+setup_setter(row['before'])
  out+=emit_setter(row,'line.set_dashes('+numbers(row['operation_input']['values'])+')')+['}']
 for start in [18,24]:
  out+=['///|','fn line_dashes_source_history_'+str(start)+'() -> Unit raise {']+setup_setter(rows[start]['before'])
  out+=['let incoming = '+numbers(rows[start]['operation_input']['values'])]
  for index,row in enumerate(rows[start:start+6]):
   op=row['operation_input'];kind=op['kind']
   if kind=='set_dashes':
    # After caller mutation, source still supplies its original immutable tuple.
    values='incoming'if index==0 else numbers(op['values'])
    operation='line.set_dashes('+values+')'
   elif kind=='external_mutation':operation='incoming['+str(op['index'])+'] = '+number(op['value'])
   elif kind=='rc_pattern':operation='@config.set_lines_dashed_pattern('+numbers(op['values'])+')'
   elif kind=='scale_width':operation='@config.set_lines_scale_dashes('+moon(op['scale'])+'); line.set_linewidth('+number(op['width'])+')'
   elif kind=='set_linestyle':operation='line.set_linestyle('+moon(op['value'])+')'
   else:raise ValueError('unknown original tuple history operation')
   out+=emit_setter(row,operation)
   if index==0:out+=['let held = line.style.line_stroke()']
  out+=['}']
 out+=['///|','test "original set_dashes immutable tuple snapshots and setter history" {']
 out+=['line_dashes_source_setter_'+str(row['id'])+'()'for row in rows[:18]]
 out+=['line_dashes_source_history_18()','line_dashes_source_history_24()','}']
 for row in original['draw_observations']:
  out+=['///|','fn line_dashes_source_draw_'+str(row['id'])+'() -> Unit raise {']+setup_draw(row)
  out+=[rename(line).replace('original gap draw row ', 'original set_dashes draw row ')for line in gap.draw_operation(row)]
  out+=['}']
 out+=['///|','test "original custom tuple dashes complete backend draw" {']
 out+=['line_dashes_source_draw_'+str(row['id'])+'()'for row in original['draw_observations']]
 out+=['}']
 return formatted('\n'.join(out)+'\n')


def collect():
 content=json.dumps(payload,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
 expected='fcfcd4164e1b55027d1ff4c07376609f9c0ebe8ad1c0e1c4870575bae9fc42c2'
 if hashlib.sha256(content.encode()).hexdigest()!=expected:raise ValueError('complete original set_dashes payload differs')
 return {'original':payload,'original_payload_sha256':expected,
  'projection_counts':{'source_records':54,'typed_records':44,'source_only_records':10,'registered_groups':2,
   'tuple_setter_history_records':30,'draw_records':14,'native_list_source_only':8,'native_none_source_only':2},
  'typed_boundaries':{
   'snapshot':'Typed set_dashes(Array[Double]) copies its input, explicitly mapping to the actual immutable Python tuple profile. It does not promise native mutable list reference behavior.',
   'containers':'Eight native list alias/history and two None-pair observations remain complete source-only. Native physical tuple/list/int types and identity flags remain evidence rather than a general dynamic container contract.',
   'history':'The caller Array is mutated after its first call; repeated native use of the old immutable tuple is projected with the original tuple values, never the changed caller Array. Existing Style/retained snapshots are compared logically by exact numeric values.',
   'draw':'All fourteen draw cases execute the real checked backend. Successful paints compare order/count/RGBA meaning and parsed dash values; completed native RGBA stages get bit checks only after actual draw, never early foreground resolution. Private backend tests cover writer prefixes on failures.',
   'setup':'Private mark_drawn is controlled native clean-stale input. Manual frame/Null ticks and one initial null-dataLim/request seed isolate the original leaf that omitted add_line/update_line_limits; no later state is normalized.',
   'float':'Finite values, signed zero and infinities compare by bits; NaN by classification, without a native payload contract.',
   'scope':'Original method/body/hash/host/stage observations are preserved. No markers, caps/joins, arbitrary callbacks, dynamic NumPy containers, native CSS text or pixel overlap promise is introduced.'}}


def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',nargs='?',type=Path,default=ref.P);parser.add_argument('--check',action='store_true')
 args=parser.parse_args();ref.load_line_source(args.ticker);document=collect()
 content=json.dumps(document,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
 outputs={ROOT/'testdata/line_dashes_reference.json':content,ROOT/'scene/line_dashes_reference_wbtest.mbt':render(document)}
 for path,value in outputs.items():
  if args.check:
   if not path.exists()or path.read_text()!=value:raise SystemExit('Line set_dashes reference differs: '+str(path))
  else:path.write_text(value)
 print(json.dumps({'check':args.check,**document['projection_counts'],'json_sha256':hashlib.sha256(content.encode()).hexdigest()}))


if __name__=='__main__':main()
