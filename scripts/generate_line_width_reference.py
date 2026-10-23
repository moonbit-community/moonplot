"""Pinned original Line linewidth methods and independent SVG style primitives.

The 28 setter observations project onto the stable typed Line handle. The 11
native SVG style dictionaries remain source evidence, not typed CSS parity.
"""
from pathlib import Path
import argparse,ast,copy,hashlib,json,math,re,struct,sys,types,urllib.request
from numbers import Real
import numpy as np
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
import generate_line_units_reference as ref
from generate_auto_date_reference import formatted
from generate_scale_defaults_reference import moon
P=ref.P
CACHE=ROOT/'.moonagent/checkpoints/D48-source'
SOURCES={
    'backend_svg.py':('backends/backend_svg.py','c489775b9891f18bfb31b706e72406da267a9b52033a5d1fd60e59230c48d565'),
    'backend_bases.py':('backend_bases.py','a2b147fb149d8862fad874991f79a61cf76da3477dfd58af99755a8f9f80c074'),
    'colors.py':('colors.py','ef4173f9e8310bc75714e32c3855719c27916c6c651b5c94e39f00163842cf04'),
}
SOURCE_ROOT='https://raw.githubusercontent.com/matplotlib/matplotlib/v3.11.2/lib/matplotlib/'


def source_file(name):
    relative,expected=SOURCES[name];path=CACHE/name
    if not path.exists():
        data=urllib.request.urlopen(SOURCE_ROOT+relative,timeout=30).read()
        if hashlib.sha256(data).hexdigest()!=expected:raise ValueError('fixed source differs: '+name)
        path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(data)
    if hashlib.sha256(path.read_bytes()).hexdigest()!=expected:raise ValueError('fixed source differs: '+name)
    return path


def execute(node,path,namespace):
    exec(compile(ast.Module(body=[copy.deepcopy(node)],type_ignores=[]),str(path),'exec'),namespace)


def top(tree,name):return next(n for n in tree.body if isinstance(n,(ast.FunctionDef,ast.ClassDef))and n.name==name)
def method(cls,name):return next(n for n in cls.body if isinstance(n,ast.FunctionDef)and n.name==name)
def bits(value):return struct.unpack('>Q',struct.pack('>d',float(value)))[0]


def load(path=P):
    ref.load_line_source(path)
    files={name:source_file(name)for name in SOURCES}
    line_tree=ast.parse(ref.L.read_bytes());line_cls=top(line_tree,'Line2D')
    rc=ref.ns['mpl'].rcParams
    # Extend the accepted real RcParams host with the identical original bool
    # validator. No replacement validator or linewidth computation is supplied.
    rc.validate['lines.scale_dashes']=rc.validate['axes.unicode_minus']
    lns=dict(ref.lns,mpl=ref.ns['mpl'])
    execute(top(line_tree,'_scale_dashes'),ref.L,lns)
    for name in ['get_linewidth','set_linewidth']:execute(method(line_cls,name),ref.L,lns)
    class WidthLine(ref.Line):
        get_linewidth=lns['get_linewidth'];set_linewidth=lns['set_linewidth']

    # Complete real helpers for the fixed valid black numeric RGBA tuple.
    color_path=files['colors.py'];ctree=ast.parse(color_path.read_bytes())
    cns={'np':np,'re':re,'Real':Real,'mpl':ref.ns['mpl'],'_api':ref.ns['_api']}
    execute(top(ctree,'_ColorMapping'),color_path,cns)
    cns['_colors_full_map']=cns['_ColorMapping']({})
    nth=next(n for n in ctree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id=='_nth_color_re'for t in n.targets))
    execute(nth,color_path,cns)
    for name in ['_is_nth_color','to_rgba','_to_rgba_no_colorcycle','to_hex']:execute(top(ctree,name),color_path,cns)
    base_path=files['backend_bases.py'];base_tree=ast.parse(base_path.read_bytes());gc_cls=top(base_tree,'GraphicsContextBase')
    gc_ns={'np':np}
    class GC:
        def __init__(self):
            self._alpha=1.;self._forced_alpha=False;self._hatch=None;self._dashes=(0,None)
            self._linewidth=1.;self._rgb=(0.,0.,0.,1.)
            self._joinstyle=types.SimpleNamespace(name='round');self._capstyle=types.SimpleNamespace(name='butt')
    for name in ['get_alpha','get_forced_alpha','get_hatch','get_dashes','get_linewidth','get_rgb','get_joinstyle','get_capstyle','set_linewidth','set_dashes']:
        execute(method(gc_cls,name),base_path,gc_ns);setattr(GC,name,gc_ns[name])
    svg_path=files['backend_svg.py'];svg_tree=ast.parse(svg_path.read_bytes());svg_cls=top(svg_tree,'RendererSVG')
    svg_ns={'rgb2hex':cns['to_hex']}
    capstyle=next(n for n in svg_tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id=='_capstyle_d'for t in n.targets))
    execute(capstyle,svg_path,svg_ns)
    for name in ['_short_float_fmt','_generate_css']:execute(top(svg_tree,name),svg_path,svg_ns)
    for name in ['_get_style_dict','_get_style']:execute(method(svg_cls,name),svg_path,svg_ns)
    class SVG:
        _get_style_dict=svg_ns['_get_style_dict'];_get_style=svg_ns['_get_style']
    method_hashes={}
    for filename,nodes in [(ref.L,[top(line_tree,'_scale_dashes'),method(line_cls,'get_linewidth'),method(line_cls,'set_linewidth')]),
            (svg_path,[top(svg_tree,'_short_float_fmt'),method(svg_cls,'_get_style_dict')])]:
        for node in nodes:method_hashes[f'{filename.name}:{node.name}']=hashlib.sha256(ast.get_source_segment(filename.read_text(),node).encode()).hexdigest()
    return {'Line':WidthLine,'GC':GC,'SVG':SVG,'rc':rc,'scale_dashes':lns['_scale_dashes'],'method_body_hashes':method_hashes}


def collect(path=P):
    ns=load(path);setter_rows=[]
    widths=[2.,2.,1.,.25,0.,-0.,-2.,math.nan,math.nan,math.inf,math.inf,-math.inf,math.ulp(0.),sys.float_info.max]
    for scale in [True,False]:
        ns['rc']['lines.scale_dashes']=scale
        axes=ref.setup();line=ns['Line'](axes,[0.,1.],[10.,20.],'width')
        axes._children.append(line);line.recache();axes._update_line_limits(line)
        line._linewidth=2.;line._unscaled_dash_pattern=(0,None);line._dash_pattern=ns['scale_dashes'](0,None,2.)
        axes._stale_viewlims={'x':False,'y':False};axes.events.clear()
        def state():
            offset,dashes=line._dash_pattern
            return {'width':line.get_linewidth(),'width_bits':bits(line.get_linewidth()),'stale':line.stale,
                'dash_offset':offset,'dash_offset_bits':bits(offset),'dash_offset_type':type(offset).__name__,'dash_sequence':dashes,
                'invalid':[line._invalidx,line._invalidy],'xy':line._xy.tolist(),
                'data':axes.dataLim._points.tolist(),'requests':axes._stale_viewlims.copy()}
        for value in widths:
            # Explicit controlled clean-stale input, not a native draw claim.
            line.stale=False;before=state()
            try:line.set_linewidth(value);error=None
            except Exception as exc:error={'type':type(exc).__name__,'message':str(exc)}
            setter_rows.append({'id':len(setter_rows),'scale_dashes':scale,'input':value,'input_bits':bits(value),
                'before':before,'after':state(),'error':error,'events':copy.deepcopy(axes.events)})
    svg=ns['SVG']();style_rows=[]
    for value in [0.,-0.,1.,2.,.25,-2.,math.nan,math.inf,-math.inf,math.ulp(0.),sys.float_info.max]:
        gc=ns['GC']();gc.set_linewidth(value);gc.set_dashes(0,None)
        try:attrib=svg._get_style_dict(gc,None);style=svg._get_style(gc,None);error=None
        except Exception as exc:attrib=style=None;error={'type':type(exc).__name__,'message':str(exc)}
        style_rows.append({'id':len(style_rows),'input':value,'input_bits':bits(value),'gc_width_bits':bits(gc.get_linewidth()),'attributes':attrib,'style':style,'error':error})
    return {'python':sys.version.split()[0],'numpy':np.__version__,
        'source_hashes':dict(ref.source_hashes(),**{'D48/'+name:pin for name,(_,pin)in SOURCES.items()}),
        'source_downloads':{name:{'url':SOURCE_ROOT+relative,'sha256':pin}for name,(relative,pin)in SOURCES.items()},
        'method_body_hashes':ns['method_body_hashes'],
        'host_boundary':'Original complete linewidth methods and _scale_dashes under explicit initial width=2 and clean-stale setup; original Line data/unit host records no data cache/request mutation. Actual GC methods and original complete SVG _get_style_dict/_get_style with fixed valid black RGBA tuple, solid no-hatch/no-face, real complete numeric to_hex/to_rgba helpers and empty named-color cache. No full draw/renderer/GUI/color-validator parity claim.',
        'typed_boundary':{
            'setters':'All 28 setter records project width, stale, invalid flags, retained cache, dataLim and requests onto two typed solid-Line sequences. Native scale_dashes/dash state remains source evidence; the typed slice has no dash state or new rc API.',
            'svg_primitives':'All 11 native style dictionaries/CSS strings are source-only. Native stroke omission/default-width and six-decimal fixed formatting differ from the existing typed serializer convenience profile.',
            'float':'Finite numbers including signed zero and infinities are asserted by bits; NaN is asserted by classification, without a payload contract.',
            'initialization':'Initial width 2 is the existing typed plot convenience setup, not the native Line2D rc default. Private mark_drawn supplies the controlled stale=False input before each setter without invoking a draw or visibility branch.',
        },
        'setter_observations':ref.ref.actual.json_safe(setter_rows),'svg_style_observations':ref.ref.actual.json_safe(style_rows),
        'counts':{'setter':28,'svg_style_primitive':11,'source_records':39,'typed_records':28,'source_only_records':11,'typed_sequences':2,'registered_groups':1}}


HEADER='''// Generated from pinned original Line linewidth methods; do not edit.
// Native SVG style primitives and dash state remain source-only evidence.

///|
fn line_width_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}

///|
fn line_width_source_numbers(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() { line_width_source_double(actual[index], expected[index]) }
}

///|
fn line_width_source_state(
  line : Line2D, axes : Axes, width : Double, stale : Bool,
  invalid : Array[Bool], xy : Array[Double], data : Array[Double], requests : Array[Bool],
) -> Unit raise {
  line_width_source_double(line.get_linewidth(), width)
  assert_eq(line.stale(), stale)
  assert_eq([line.invalid_x, line.invalid_y], invalid)
  // Inspect retained storage without a lazy processed getter or draw.
  line_width_source_numbers(line.cache.flat.to_array(), xy)
  line_width_source_numbers([
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


def numbers(values):return '['+', '.join(number(value)for value in values)+']'
def flatten(values):return [value for row in values for value in row]


def state_assertion(state):
    arguments=['line','axes',number(state['width']),moon(state['stale']),moon(state['invalid']),
        numbers(flatten(state['xy'])),numbers(flatten(state['data'])),moon([state['requests'][name]for name in ['x','y']])]
    return 'line_width_source_state('+', '.join(arguments)+')'


def render(payload):
    lines=[HEADER]
    for scenario,scale in enumerate([True,False]):
        lines+=['///|',f'fn line_width_source_sequence_{scenario}() -> Unit raise {{',
            '// This scenario records native lines.scale_dashes='+str(scale)+'.',
            '// Typed solid-Line width has no dash slot or new scale_dashes rc API.',
            'let axes = figure().axes()','ignore(axes.update_x_category_units(["a", "b"]))',
            'let line = axes.plot_line(LineData::Numeric([0.0, 1.0]), LineData::Numeric([10.0, 20.0]))',
            'axes.x_axis().clear_autoscale_request()','axes.y_axis().clear_autoscale_request()']
        for row in payload['setter_observations']:
            if row['scale_dashes']!=scale:continue
            if row['error']is not None:raise ValueError('unexpected original Double setter failure')
            label='original Line linewidth row '+str(row['id'])+' scale_dashes='+str(scale)
            lines+=['// '+label,'try {',
                '// Input fixture only: match the native controlled clean-stale state.',
                'line.mark_drawn()',state_assertion(row['before']),
                'line.set_linewidth('+number(row['input'])+')',state_assertion(row['after']),
                '} catch { error => fail('+moon(label+': ')+' + error.to_string()) }']
        lines+=['}']
    lines+=['///|','test "original Line linewidth setter sequences" {',
        'line_width_source_sequence_0()','line_width_source_sequence_1()','}']
    return formatted('\n'.join(lines)+'\n')


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('ticker',nargs='?',type=Path,default=P);parser.add_argument('--check',action='store_true')
    args=parser.parse_args();payload=collect(args.ticker)
    document=json.dumps(payload,indent=2,ensure_ascii=False,allow_nan=False)+'\n'
    outputs={ROOT/'testdata/line_width_reference.json':document,ROOT/'scene/line_width_reference_wbtest.mbt':render(payload)}
    for path,content in outputs.items():
        if args.check:
            if not path.exists()or path.read_text()!=content:raise SystemExit('Line linewidth reference differs: '+str(path))
        else:path.write_text(content)
    print(json.dumps({'check':args.check,**payload['counts'],'json_sha256':hashlib.sha256(document.encode()).hexdigest()}))


if __name__=='__main__':main()
