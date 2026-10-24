"""Reproducible declaration inventory for the pinned full Matplotlib source tree.

This inventories upstream work units, not migration percentages. Definitions are
canonicalized; aliases/inherited exposure paths are evidence, not extra counts.
"""
from __future__ import annotations
import argparse, ast, builtins, collections, hashlib, json, re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
COMMIT = 'd3ca9172e392048ec242b90e8423e88d1a3000b2'
ARCHIVE_SHA = 'cf6686989f244a633bad4cf8972070abd651662a02aa30ca47507c8680e858c6'
DEFAULT_SOURCE = ROOT / '.moonagent/audits/2026-10-24' / ('matplotlib-' + COMMIT)
OUTPUT = ROOT / 'testdata/upstream_api_inventory.json'
# Filled from the fixed archive; includes every parsed source/stub and current
# API documentation file, so changing an unvisited module cannot pass --check.
PINNED_INPUT_DIGEST = '1dcac3004b888c062294fa95fba69ee3e6689ef1221f94327f8dd240b7693332'
GROUPS = {
 'data_color_transform_path': '基础 data / color / transform / path',
 'objects_axes_layout': '对象、axes、figure、layout',
 'plots_2d': '2D plots 与绘图 Artist',
 'ticker_dates_units': 'ticker / dates / units / scale',
 'svg_ir': 'SVG renderer（上游没有本项目独立 IR 的等价分母）',
 'pyplot_config_style': 'pyplot / config / style',
 'text_font_math': 'text / font / mathtext / TeX',
 'other_backends_interaction': '其他 backends / animation / widgets / interaction',
 'projections_toolkits': 'projections / toolkits / 3D',
}
PROTOCOLS = {'__init__', '__new__', '__call__', '__getitem__', '__setitem__',
 '__delitem__', '__iter__', '__next__', '__len__', '__contains__', '__enter__',
 '__exit__', '__add__', '__radd__', '__sub__', '__mul__', '__rmul__', '__truediv__',
 '__eq__', '__ne__', '__lt__', '__le__', '__gt__', '__ge__', '__bool__', '__array__',
 '__copy__', '__deepcopy__', '__getstate__', '__setstate__', '__str__', '__repr__'}
PLOT_MODULES = {'lines', 'patches', 'collections', 'image', 'contour', 'quiver',
 'stackplot', 'streamplot', 'sankey', 'table', 'hatch', 'markers', 'patheffects', 'tri', '_tri', '_image'}
OBJECT_AXES_METHODS = {'get_title','set_title','get_legend_handles_labels','legend',
 'inset_axes','indicate_inset','indicate_inset_zoom','secondary_xaxis','secondary_yaxis'}
SOURCE_EXCLUDE = {'tests', 'testing', 'test', '__pycache__', 'mpl-data', 'sample_data'}
# testing is retained separately, never silently mixed with plotting runtime.
SOURCE_EXCLUDE.remove('testing')


def dotted(node):
 if isinstance(node, ast.Name): return node.id
 if isinstance(node, ast.Attribute):
  p = dotted(node.value)
  return p + '.' + node.attr if p else None
 if isinstance(node, ast.Subscript): return dotted(node.value)
 return None


def literal_strings(node):
 try:
  value = ast.literal_eval(node)
  return value if isinstance(value, (list, tuple, set)) and all(isinstance(v,str) for v in value) else []
 except (ValueError, TypeError): return []


def module_name(path):
 parts = list(path.with_suffix('').parts)
 if parts[-1] == '__init__': parts.pop()
 return '.'.join(parts)


def statements(body):
 """Module/class declarations inside conditionals, never function-local defs."""
 for node in body:
  yield node
  if isinstance(node, (ast.If, ast.Try, ast.With)):
   yield from statements(node.body)
   yield from statements(getattr(node,'orelse',[]))
   yield from statements(getattr(node,'finalbody',[]))
   for handler in getattr(node,'handlers',[]): yield from statements(handler.body)


def group_of(module, owner=None, name=None):
 if module.startswith('mpl_toolkits.') or module.startswith('matplotlib.projections'):
  return 'projections_toolkits'
 tail = module.removeprefix('matplotlib.').split('.')[0]
 if module == 'matplotlib.backends.backend_svg': return 'svg_ir'
 if tail in {'text','textpath','font_manager','ft2font','mathtext','_mathtext',
             'texmanager','dviread','_afm','_type1font'}: return 'text_font_math'
 if tail in {'ticker','dates','category','units','scale'}: return 'ticker_dates_units'
 if module == 'matplotlib' or tail in {'pyplot','pylab','rcsetup','style','typing'}:
  return 'pyplot_config_style'
 if tail in {'colors','colorizer','cm','transforms','path','bezier','cbook','mlab','_enums','_api','_docstring'}:
  return 'data_color_transform_path'
 if tail in PLOT_MODULES: return 'plots_2d'
 if module == 'matplotlib.axes._axes' and owner and owner.endswith('.Axes') and name not in OBJECT_AXES_METHODS:
  return 'plots_2d'
 if tail in {'axes','axis','artist','figure','gridspec','layout_engine','legend',
             'legend_handler','spines','offsetbox','container','colorbar','inset','_tight_bbox',
             '_tight_layout','_constrained_layout','_layoutgrid'}:
  return 'objects_axes_layout'
 return 'other_backends_interaction'


def development(module):
 return module.startswith(('matplotlib.testing','matplotlib.sphinxext')) or module in {
  'matplotlib._api','matplotlib._api.deprecation','matplotlib._docstring'}


def inventory(source):
 lib = source/'lib'
 all_paths = sorted(p for p in lib.rglob('*') if p.suffix in {'.py','.pyi'}
                    and not SOURCE_EXCLUDE.intersection(p.relative_to(lib).parts))
 doc_paths = sorted(p for p in (source/'doc/api').rglob('*.rst')
                    if not {'prev_api_changes','next_api_changes','api_changes'}.intersection(p.parts))
 manifest = [{'path':str(p.relative_to(source)), 'sha256':hashlib.sha256(p.read_bytes()).hexdigest()}
             for p in all_paths + doc_paths]
 digest = hashlib.sha256(json.dumps(manifest,sort_keys=True,separators=(',',':')).encode()).hexdigest()
 if PINNED_INPUT_DIGEST and digest != PINNED_INPUT_DIGEST:
  raise ValueError('pinned full-source/API-doc digest differs: ' + digest)
 files = {}
 parse_errors = []
 for p in all_paths:
  mod = module_name(p.relative_to(lib))
  if not mod.startswith(('matplotlib','mpl_toolkits')): continue
  try: tree = ast.parse(p.read_text(),filename=str(p))
  except SyntaxError as exc:
   parse_errors.append({'path':str(p.relative_to(source)),'line':exc.lineno,'message':exc.msg});continue
  files.setdefault(mod,{})[p.suffix] = {'path':p,'tree':tree}
 modules = {}
 node_paths={id(node):record['path']for variants in files.values()for record in variants.values()for node in ast.walk(record['tree'])}
 for mod, variants in sorted(files.items()):
  preferred = variants.get('.pyi',variants.get('.py'))
  modules[mod] = dict(preferred, variants=variants, imports={}, exports=set(), assignments=[])
  for node in statements(preferred['tree'].body + (variants['.py']['tree'].body if '.pyi'in variants and '.py'in variants else [])):
   if isinstance(node, ast.ImportFrom):
    package = mod if preferred['path'].stem=='__init__' else mod.rpartition('.')[0]
    if node.level:
     levels=package.split('.');base='.'.join(levels[:len(levels)-node.level+1])
     target=base + ('.'+node.module if node.module else '')
    else:target=node.module or ''
    for alias in node.names:
     if alias.name=='*': continue
     local=alias.asname or alias.name
     modules[mod]['imports'].setdefault(local,target+'.'+alias.name)
     if alias.asname==alias.name or preferred['path'].stem=='__init__':
      modules[mod]['exports'].add(local)
   elif isinstance(node,ast.Import):
    for alias in node.names:modules[mod]['imports'].setdefault(alias.asname or alias.name.split('.')[0],alias.name if alias.asname else alias.name.split('.')[0])
   elif isinstance(node, (ast.Assign,ast.AnnAssign)):
    targets=node.targets if isinstance(node,ast.Assign) else [node.target]
    for target in targets:
     if isinstance(target,ast.Name) and target.id=='__all__':modules[mod]['exports'].update(literal_strings(node.value))
     if isinstance(target,ast.Name):modules[mod]['assignments'].append((target.id,node))

 def resolve(mod, text):
  if not text:return None
  first,_,tail=text.partition('.')
  if first in modules[mod]['imports']:
   out=modules[mod]['imports'][first]+('.'+tail if tail else '')
  elif text.startswith(('matplotlib.','mpl_toolkits.')):out=text
  elif first in vars(builtins):out='builtins.'+text
  else:out=mod+'.'+text
  seen=set()
  for _ in range(20):
   if out in seen:break
   seen.add(out)
   prefix,_,last=out.rpartition('.')
   if prefix not in modules:break
   rec=modules[prefix]
   if last in rec['imports']:out=rec['imports'][last];continue
   alias=next((dotted(n.value) for name,n in rec['assignments'] if name==last and dotted(n.value)),None)
   if alias:
    head,_,rest=alias.partition('.')
    out=(rec['imports'].get(head,prefix+'.'+head))+('.'+rest if rest else '');continue
   break
  return out

 doc_modules=collections.defaultdict(set);doc_refs=collections.defaultdict(set)
 module_names=set(modules)
 for p in doc_paths:
  current=None;block=False
  for line in p.read_text().splitlines():
   mt=re.match(r'\s*\.\.\s+(?:currentmodule|module|automodule)::\s*([\w.]+)',line)
   if mt:
    current=mt.group(1)
    if current in modules:doc_modules[current].add(str(p.relative_to(source)))
   for token in re.findall(r'(?:matplotlib|mpl_toolkits)(?:\.[A-Za-z_]\w*)+',line):
    value=token
    while value and value not in module_names:value=value.rpartition('.')[0]
    if value:doc_modules[value].add(str(p.relative_to(source)))
   if re.match(r'\s*\.\. autosummary::',line):block=True;continue
   if re.match(r'\S',line) and not line.startswith('..'):block=False
   if block and re.match(r'^\s+[~.\w]+\s*$',line):
    value=line.strip().lstrip('~')
    if not value or value.startswith(':'):continue
    if value.startswith('.'):value='matplotlib'+value
    elif not value.startswith(('matplotlib.','mpl_toolkits.')) and current:value=current+'.'+value
    if '.' in value:
     doc_refs[value].add(str(p.relative_to(source)))
     if value in modules:doc_modules[value].add(str(p.relative_to(source)))
   direct=re.match(r'\s*\.\. auto(?:class|function|method|attribute)::\s*([~.\w]+)',line)
   if direct:
    value=direct.group(1).lstrip('~')
    if not value.startswith(('matplotlib.','mpl_toolkits.')) and current:value=current+'.'+value
    doc_refs[value].add(str(p.relative_to(source)))

 def module_public(mod):
  return mod in doc_modules or all(not part.startswith('_') for part in mod.split('.'))
 defs={};classes={};attrs=[]
 def parse_scope(mod,body,parent=None,supplement=False):
  for node in statements(body):
   if isinstance(node,(ast.FunctionDef,ast.AsyncFunctionDef,ast.ClassDef)):
    q=(parent or mod)+'.'+node.name
    if isinstance(node,ast.ClassDef):
     rec={'name':node.name,'module':mod,'parent':parent,'node':node,'methods':{},'bases':[resolve(mod,dotted(b)) for b in node.bases]}
     if q not in classes:classes[q]=rec;parse_scope(mod,node.body,q)
     else:parse_scope(mod,node.body,q,supplement=True)
    elif parent:
     existing=classes[parent]['methods'].get(node.name,[])
     def accessor_roles(n):
      return {'set'if (dotted(d)or'').endswith('.setter')else'delete'if (dotted(d)or'').endswith('.deleter')else'get'for d in n.decorator_list if dotted(d)=='property'or(dotted(d)or'').endswith(('.setter','.deleter','.classproperty'))}
     old_roles=set().union(*(accessor_roles(n)for n in existing))if existing else set()
     if not supplement or not existing or (accessor_roles(node)-old_roles):classes[parent]['methods'].setdefault(node.name,[]).append(node)
    else:
     if not supplement or q not in defs:defs.setdefault(q,[]).append(node)
   elif parent and isinstance(node,ast.AnnAssign)and isinstance(node.target,ast.Name)and not node.target.id.startswith('_'):
    attrs.append((parent,node.target.id,node))
 for mod,rec in modules.items():
  parse_scope(mod,rec['tree'].body)
  if '.pyi'in rec['variants']and'.py'in rec['variants']:parse_scope(mod,rec['variants']['.py']['tree'].body,supplement=True)

 class_aliases=collections.defaultdict(set);function_aliases=collections.defaultdict(set)
 for q,rec in classes.items():
  if not rec['name'].startswith('_') and module_public(rec['module']) and not rec['parent']:
   class_aliases[q].add(q)
 for q in defs:
  mod,name=q.rsplit('.',1)
  if not name.startswith('_')and module_public(mod):function_aliases[q].add(q)
 for mod,rec in modules.items():
  if not module_public(mod):continue
  for name in rec['exports']:
   if name.startswith('_'):continue
   target=resolve(mod,name)
   if target in classes and not classes[target]['name'].startswith('_'):class_aliases[target].add(mod+'.'+name)
   if target in defs:function_aliases[target].add(mod+'.'+name)
  for name,node in rec['assignments']:
   if name.startswith('_')or not dotted(node.value):continue
   target=resolve(mod,name)
   if target in classes and not classes[target]['name'].startswith('_'):class_aliases[target].add(mod+'.'+name)
   if target in defs:function_aliases[target].add(mod+'.'+name)
 # Public names in explicit API docs can expose a class/function in a private
 # implementation module; documentation is an auditable access-path witness.
 for q,paths in doc_refs.items():
  for mod in sorted(modules,key=len,reverse=True):
   if not q.startswith(mod+'.'):continue
   target=resolve(mod,q[len(mod)+1:])
   if target in classes and not classes[target]['name'].startswith('_'):class_aliases[target].add(q)
   if target in defs:function_aliases[target].add(q)
   break
 # Public return/parameter types referring to a non-underscore class in a
 # private module (e.g. SecondaryAxis) are explicit stub reachability witnesses.
 changed=True
 while changed:
  changed=False
  for q in list(class_aliases):
   rec=classes[q]
   annotation_nodes=[]
   for name,method_group in rec['methods'].items():
    if name.startswith('_')and name not in PROTOCOLS:continue
    for method in method_group:
     annotation_nodes += [arg.annotation for arg in method.args.posonlyargs+method.args.args+method.args.kwonlyargs if arg.annotation]
     if method.returns:annotation_nodes.append(method.returns)
   annotation_nodes += [n.annotation for n in rec['node'].body if isinstance(n,ast.AnnAssign)and isinstance(n.target,ast.Name)and not n.target.id.startswith('_')]
   for annotation in annotation_nodes:
    for node in ast.walk(annotation):
     if isinstance(node,ast.Name):target=resolve(rec['module'],node.id)
     elif isinstance(node,ast.Attribute):target=resolve(rec['module'],dotted(node))
     else:continue
     if target in classes and not classes[target]['name'].startswith('_') and target not in class_aliases:
      class_aliases[target].add(target);changed=True
 # A public nested class on a private base is exposed through public descendants.
 mro_unknown=[]
 def ancestors(q,trail=()):
  if q in trail:return []
  bases=[b for b in classes[q]['bases']if b in classes]
  seqs=[[b]+ancestors(b,trail+(q,))for b in bases]+[bases.copy()]
  result=[]
  while any(seqs):
   seqs=[x for x in seqs if x]
   candidate=next((seq[0]for seq in seqs if not any(seq[0]in other[1:]for other in seqs)),None)
   if candidate is None:
    mro_unknown.append(q);return list(dict.fromkeys(result+[v for seq in seqs for v in seq]))
   result.append(candidate)
   for seq in seqs:
    if seq and seq[0]==candidate:seq.pop(0)
  return result
 for q in list(class_aliases):
  for base in [q]+ancestors(q):
   for nested,rec in classes.items():
    if rec['parent']==base and not rec['name'].startswith('_'):
     class_aliases[nested].update(a+'.'+rec['name'] for a in class_aliases[q])

 def preferred_alias(values):
  return min(values,key=lambda v:(sum(p.startswith('_')for p in v.split('.')),len(v.split('.')),len(v),v))
 canonical={q:preferred_alias(a)for q,a in class_aliases.items()}
 source_record_cache={}
 def source_record(mod,node):
  path=node_paths.get(id(node),modules[mod]['path']);key=(str(path),node.lineno)
  if key not in source_record_cache:
   source_record_cache[key]={'path':str(path.relative_to(source)),'line':node.lineno,
     'format':'stub'if path.suffix=='.pyi'else'python','sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
  return source_record_cache[key]
 items=[];exclusions=[]
 def add_item(q,kind,mod,nodes,aliases,defined_as,reason):
  evidence=set(doc_modules.get(mod,set()))
  for a in aliases:
   evidence.update(doc_refs.get(a,set()))
   prefix=a
   while prefix and prefix not in modules:prefix=prefix.rpartition('.')[0]
   if prefix:evidence.update(doc_modules.get(prefix,set()))
  item={'id':'api:'+q,'qualified_name':q,'kind':kind,'module':mod,
   'group':group_of(mod,defined_as.rpartition('.')[0]if kind!='function'else None,q.rsplit('.',1)[-1]),
   'scope':'development_support'if development(mod)else'runtime',
   'defined_as':defined_as,'aliases':sorted(set(aliases)-{q}),
   'sources':[source_record(mod,n)for n in nodes],
   'documentation':sorted(evidence),'selection_reason':reason,
   'public_evidence':'stub'if any(source_record(mod,n)['format']=='stub'for n in nodes)else'documented_module_or_name'if evidence else'conventional_public_spelling'}
  items.append(item);return item
 for q in sorted(canonical):
  rec=classes[q];item=add_item(canonical[q],'class',rec['module'],[rec['node']],class_aliases[q],q,'public declaration, explicit re-export, API documentation or reachable public type')
  item['bases']=rec['bases'];item['has_local_constructor']='__init__'in rec['methods']or'__new__'in rec['methods']
  constructors=[]
  for base in [q]+ancestors(q):
   for name in ['__init__','__new__']:
    if name in classes[base]['methods']:
     constructors.append({'protocol':name,'defined_as':base+'.'+name,'sources':[source_record(classes[base]['module'],n)for n in classes[base]['methods'][name]]})
   if constructors:break
  item['construction_contract']=constructors
  item['constructor_aliases']=sorted(a+'.__init__'for a in class_aliases[q])
 # One origin declaration, many inherited exposure paths. Public-base methods
 # stay anchored to that public base; private-base methods choose a public host.
 origins=collections.defaultdict(set)
 for q in canonical:
  available={}
  for base in [q]+ancestors(q):
   for name in classes[base]['methods']:
    if not name.startswith('_')or name in PROTOCOLS:available.setdefault(name,base)
  for name,origin in available.items():
   if name in {'__init__','__new__'}:continue
   for alias in class_aliases[q]:origins[(origin,name)].add(alias+'.'+name)
 for (origin,name),exposed in sorted(origins.items()):
  rec=classes[origin];nodes=rec['methods'][name]
  if origin in canonical:q=canonical[origin]+'.'+name
  else:q=preferred_alias(exposed)
  decorators=[dotted(d)or''for n in nodes for d in n.decorator_list]
  kind='constructor'if name in {'__init__','__new__'}else'protocol'if name in PROTOCOLS else'property'if any(d=='property'or d.endswith(('.setter','.deleter','.classproperty'))for d in decorators)else'method'
  item=add_item(q,kind,rec['module'],nodes,exposed,origin+'.'+name,'local public member or inherited public/protocol member; origin counted once')
  if kind=='property':
   item['required_accessors']=sorted(set('set'if d.endswith('.setter')else'delete'if d.endswith('.deleter')else'get'for d in decorators if d=='property'or d.endswith(('.setter','.deleter','.classproperty'))))
 # Public function aliases are merged; a structurally pure pyplot forwarding
 # wrapper adds an alias to the original target rather than another denominator.
 by_defined={i['defined_as']:i for i in items};forwarded=[]
 for q,aliases in sorted(function_aliases.items()):
  mod=q.rsplit('.',1)[0]
  item=add_item(preferred_alias(aliases),'function',mod,defs[q],aliases,q,'public function declaration, explicit re-export or API documentation')
  by_defined[q]=item
 by_access={a:i for i in items for a in [i['qualified_name']]+i['aliases']}
 for q,aliases in sorted(function_aliases.items()):
  mod=q.rsplit('.',1)[0];nodes=defs[q];target=None
  if mod=='matplotlib.pyplot':
   impl=modules[mod]['variants'].get('.py',modules[mod])
   fn=next((n for n in impl['tree'].body if isinstance(n,ast.FunctionDef)and n.name==q.rsplit('.',1)[1]),None)
   if fn:
    body=[n for n in fn.body if not(isinstance(n,ast.Expr)and isinstance(n.value,ast.Constant)and isinstance(n.value.value,str))]
    if len(body)==1 and isinstance(body[0],ast.Return)and isinstance(body[0].value,ast.Call):
     for dec in fn.decorator_list:
      if isinstance(dec,ast.Call)and dotted(dec.func)=='_copy_docstring_and_deprecators'and dec.args:
       target=resolve(mod,dotted(dec.args[0]));break
  if target in by_defined or target in by_access:
   item=by_defined.get(target)or by_access[target];old=by_defined[q]
   if old is item:continue
   if old in items:items.remove(old)
   by_defined[q]=item
   item['aliases']=sorted(set(item['aliases'])|aliases)
   forwarded.append({'alias':q,'target':item['qualified_name'],'source':source_record(mod,nodes[0]),'rule':'one return-call body plus explicit original doc/deprecator target'})
 # Original class staticmethod aliases override syntactic stub method
 # declarations: ColorConverter.to_rgba is the module function, not another
 # implementation contract.
 static_merged=[]
 for mod,rec in modules.items():
  impl=rec['variants'].get('.py')
  if not impl:continue
  for cls in (n for n in statements(impl['tree'].body)if isinstance(n,ast.ClassDef)):
   owner=mod+'.'+cls.name
   if owner not in canonical:continue
   for node in statements(cls.body):
    if not isinstance(node,ast.Assign):continue
    value=node.value
    if isinstance(value,ast.Call)and dotted(value.func)in{'staticmethod','classmethod'}and value.args:value=value.args[0]
    text=dotted(value)
    if not text:continue
    target=by_defined.get(resolve(mod,text))
    if not target:continue
    for name in node.targets:
     if not isinstance(name,ast.Name)or name.id.startswith('_'):continue
     alias=canonical[owner]+'.'+name.id
     old=by_defined.get(owner+'.'+name.id)
     if old is target:continue
     target['aliases']=sorted(set(target['aliases'])|{alias})
     if old and old in items:items.remove(old)
     static_merged.append({'alias':alias,'target':target['qualified_name'],'source':source_record(mod,node)})
 # Ordinary in-class aliases of known members (get_lw = get_linewidth, etc.).
 for q,rec in classes.items():
  if q not in canonical:continue
  for node in statements(rec['node'].body):
   if not isinstance(node,ast.Assign):continue
   value=dotted(node.value)
   if not value:continue
   target=by_defined.get(q+'.'+value)
   if target:
    for n in node.targets:
     if isinstance(n,ast.Name)and not n.id.startswith('_'):
      target['aliases']=sorted(set(target['aliases'])|{a+'.'+n.id for a in class_aliases[q]})
 # Statically readable define_aliases mappings are additional spellings, not
 # new capabilities. Unreadable/dynamic factories remain explicit uncertainty.
 generated_aliases=[];dynamic_bindings=[];dynamic_factories=[]
 for mod,rec in modules.items():
  impl=rec['variants'].get('.py')
  if not impl:continue
  for cls in (n for n in statements(impl['tree'].body)if isinstance(n,ast.ClassDef)):
   owner=mod+'.'+cls.name
   if owner not in canonical:continue
   for dec in cls.decorator_list:
    if not isinstance(dec,ast.Call)or not(dotted(dec.func)or'').endswith('define_aliases')or not dec.args:continue
    try:alias_map=ast.literal_eval(dec.args[0])
    except (ValueError,TypeError):continue
    if not isinstance(alias_map,dict):continue
    for name,alternatives in alias_map.items():
     if not isinstance(name,str)or not isinstance(alternatives,list):continue
     for prefix in ['get_','set_']:
      defining=next((c for c in [owner]+ancestors(owner)if prefix+name in classes[c]['methods']),None)
      item=by_defined.get((defining or'')+'.'+prefix+name)
      if not item:continue
      for alias in alternatives:
       if not isinstance(alias,str):continue
       exposures={a+'.'+prefix+alias for a in class_aliases[owner]}
       item['aliases']=sorted(set(item['aliases'])|exposures)
       generated_aliases.append({'target':item['qualified_name'],'aliases':sorted(exposures),'source':source_record(mod,dec)})
   for method in (n for n in cls.body if isinstance(n,ast.FunctionDef)):
    for node in ast.walk(method):
     if not isinstance(node,ast.Assign)or not isinstance(node.value,ast.Attribute):continue
     value=dotted(node.value)
     if not value or not value.startswith('self._renderer.'):continue
     for target in node.targets:
      if isinstance(target,ast.Attribute)and dotted(target.value)=='self'and not target.attr.startswith('_'):
       dynamic_bindings.append({'qualified_name':canonical[owner]+'.'+target.attr,'runtime_target':value,'source':source_record(mod,node),'note':'native instance method replacement; inherited base protocol may be inventoried but this override body is not a Python declaration'})
  for node in statements(impl['tree'].body):
   if not isinstance(node,ast.Assign)or not isinstance(node.value,ast.Call):continue
   fn=dotted(node.value.func)or''
   if not any(k in fn for k in ['class_factory','namedtuple']):continue
   for target in node.targets:
    if isinstance(target,ast.Name)and not target.id.startswith('_'):
     dynamic_factories.append({'qualified_name':mod+'.'+target.id,'factory':fn,'source':source_record(mod,node),'note':'dynamic type/constructor; factory and statically defined bases are counted, generated runtime type not fabricated'})
 # Explicit public attribute declarations are listed separately. They are not
 # silently mixed into the callable declaration denominator.
 attribute_items=[];seen_attributes={};property_names={i['qualified_name']for i in items if i['kind']=='property'}
 for q,name,node in attrs:
  exposures=set()
  if q in canonical:exposures.update(a+'.'+name for a in class_aliases[q])
  else:
   for c in canonical:
    if q in ancestors(c):exposures.update(a+'.'+name for a in class_aliases[c])
  if not exposures:continue
  if name.isupper()or any((b or '').split('.')[-1]in{'Enum','IntEnum','Flag','IntFlag'}for c in [q]+ancestors(q)for b in classes[c]['bases']):continue
  public=preferred_alias(exposures);mod=classes[q]['module']
  if public in property_names:continue
  if public in seen_attributes:
   previous=seen_attributes[public];record=source_record(mod,node)
   if record not in previous['sources']:previous['sources'].append(record)
   if q+'.'+name not in previous['declaration_origins']:previous['declaration_origins'].append(q+'.'+name)
   continue
  seen_attributes[public]={'pending':True}
  attribute_items.append({'id':'attribute:'+public,'qualified_name':public,'defined_as':q+'.'+name,
   'kind':'attribute','module':mod,'group':group_of(mod),'scope':'development_support'if development(mod)else'runtime',
   'aliases':sorted(exposures-{public}),'sources':[source_record(mod,node)],'declaration_origins':[q+'.'+name]})
  seen_attributes[public]=attribute_items[-1]
 # rcsetup's actual _Param registrations are the independent configuration unit.
 rc=[];rp=source/'lib/matplotlib/rcsetup.py';rtree=ast.parse(rp.read_text())
 for node in ast.walk(rtree):
  if isinstance(node,ast.Call)and dotted(node.func)=='_Param'and node.args and isinstance(node.args[0],ast.Constant)and isinstance(node.args[0].value,str):
   key=node.args[0].value
   rc.append({'id':'rc:'+key,'key':key,'group':'pyplot_config_style','kind':'rc_key','scope':'internal'if key.startswith('_')else'public',
    'source':{'path':str(rp.relative_to(source)),'line':node.lineno,'sha256':hashlib.sha256(rp.read_bytes()).hexdigest()},
    'validator':next((ast.unparse(k.value)for k in node.keywords if k.arg=='validator'),None),
    'default_expression':next((ast.unparse(k.value)for k in node.keywords if k.arg=='default'),None)})
 rc=sorted({r['key']:r for r in rc}.values(),key=lambda r:r['key'])
 private_modules=[m for m in modules if not module_public(m)]
 unresolved_bases=collections.Counter()
 for q in canonical:
  for b in classes[q]['bases']:
   if b and b not in classes:unresolved_bases[b]+=1
 stub_omissions=[]
 for mod,rec in modules.items():
  if '.pyi'not in rec['variants']or'.py'not in rec['variants']or not module_public(mod):continue
  stubnames={getattr(n,'name',None)for n in statements(rec['tree'].body)}
  for n in statements(rec['variants']['.py']['tree'].body):
   if isinstance(n,(ast.ClassDef,ast.FunctionDef))and not n.name.startswith('_')and n.name not in stubnames:
    stub_omissions.append({'qualified_name':mod+'.'+n.name,'path':str(rec['variants']['.py']['path'].relative_to(source)),
     'line':n.lineno,'reason':'public Python declaration absent from preferred stub; source supplement included when reachable/public' })
 counts=collections.Counter(i['kind']for i in items)
 group_counts={g:{'runtime':sum(i['group']==g and i['scope']=='runtime'for i in items),
  'development_support':sum(i['group']==g and i['scope']=='development_support'for i in items),
  'attributes_separate':sum(i['group']==g for i in attribute_items)}for g in GROUPS}
 items.sort(key=lambda i:i['id']);attribute_items.sort(key=lambda i:i['id'])
 assert len({i['id']for i in items})==len(items),'canonical collision'
 return {'schema_version':1,'upstream':{'repository':'https://github.com/matplotlib/matplotlib','version':'v3.11.2','commit':COMMIT,
   'archive_sha256':ARCHIVE_SHA,'input_manifest_sha256':digest,'archive_note':'archive SHA supplied and independently verified by parent audit; parsed source/doc bytes below are independently pinned by manifest'},
  'methodology':{
   'unit':'one canonical declaration origin: class including its construction contract, public method/property/function or selected data/call protocol; constructors are not counted again; overloads/property accessors merge',
   'source_precedence':'.pyi preferred per declaration; Python supplements absent declarations/members, including partial dates.pyi. Every item records its actual source format. Non-public implementation declarations remain excluded.',
   'inheritance':'private-base public methods are reachable through public descendants; public-base origin counted once, all inherited exposure paths listed as aliases; overrides remain distinct declarations',
   'scope':'official current doc/api including backend/toolkit subindices witnesses private-named public modules, plus non-private runtime modules. Tests/galleries/examples excluded. Documented testing/sphinx/API-doc support listed separately.',
   'dedup':'re-exports, static aliases and structurally pure pyplot return-call wrappers merge; pyplot wrappers with additional state effects remain distinct',
   'not_counts':'named colors/colormaps/font names/data tables are data rather than thousands of new APIs; class attribute declarations and rc keys listed separately',
   'property_contract':'Properties count once with required_accessors get/set/delete. A getter-only port cannot count as the full writable property contract.',
   'limits':'static inventory, not full dynamic runtime reflection; unknown native/external inherited protocols, generated aliases, dynamic factories and optional dependencies remain explicit uncertainty, never evidence of migration',
   'not_percentage':'API unit counts measure breadth only. No Moon coverage or migration percentage is computed; class/method/config complexities are unequal.'},
  'groups':GROUPS,'summary':{'callable_class_units':len(items),'runtime_units':sum(i['scope']=='runtime'for i in items),
   'runtime_stub_or_documented_units':sum(i['scope']=='runtime'and i['public_evidence']!='conventional_public_spelling'for i in items),
   'runtime_conventional_spelling_units':sum(i['scope']=='runtime'and i['public_evidence']=='conventional_public_spelling'for i in items),
   'development_support_units':sum(i['scope']=='development_support'for i in items),'by_kind':dict(sorted(counts.items())),
   'by_group':group_counts,'rc_keys_separate':sum(r['scope']=='public'for r in rc),'internal_rc_keys_separate':sum(r['scope']=='internal'for r in rc),'all_registered_rc_keys':len(rc),'attributes_separate':len(attribute_items),
   'parsed_modules':len(modules),'preferred_stub_modules':sum('.pyi'in r['variants']for r in modules.values()),
   'preferred_python_modules':sum('.pyi'not in r['variants']for r in modules.values()),'documentation_files':len(doc_paths),
   'pure_pyplot_wrappers_merged':len(forwarded),'original_static_callable_aliases_merged':len(static_merged),'generated_alias_mappings':len(generated_aliases)},
  'items':items,'rc_keys':rc,'attributes':attribute_items,'pure_pyplot_forwarding_aliases':forwarded,'original_static_callable_aliases':static_merged,'generated_api_aliases':generated_aliases,
  'unknown_and_sensitivity':{'parse_errors':parse_errors,'native_instance_method_binding_sites':dynamic_bindings,'dynamic_type_factory_bindings':dynamic_factories,'implementation_only_stub_omissions':stub_omissions,
   'unresolved_inherited_bases':[{'base':k,'public_descendants':v}for k,v in sorted(unresolved_bases.items())],
   'private_implementation_modules_excluded':[m for m in private_modules if not any(i['module']==m for i in items)],
   'private_module_public_reachability':[{'module':m,'included_items':sum(i['module']==m for i in items),'reason':'module helpers remain private; listed public re-exports/inherited members/return types count individually'}for m in private_modules if any(i['module']==m for i in items)],
   'incomplete_static_mro':sorted(set(mro_unknown)),
   'development_tools_additive_units':sum(i['scope']=='development_support'for i in items),
   'attributes_additive_units':len(attribute_items),'configuration_additive_keys':sum(r['scope']=='public'for r in rc),
   'conventional_public_spelling_units':[i['id']for i in items if i['scope']=='runtime'and i['public_evidence']=='conventional_public_spelling'],
   'external_native_note':'Public native ft2font is included via .pyi. Private _path/_image/_tri/_backend_agg stubs are implementation protocols unless explicitly documented/re-exported; native source exports beyond available stubs and external Qt/Tk/GTK/wx inherited methods are not enumerated as Matplotlib-defined public declarations.'},
  'module_manifest':[{'module':m,'preferred_path':str(r['path'].relative_to(source)),'format':'stub'if r['path'].suffix=='.pyi'else'python',
    'documented_in':sorted(doc_modules.get(m,set())),'public_module_scope':module_public(m)}for m,r in sorted(modules.items())],
  'input_manifest':manifest}


def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--upstream',type=Path,default=DEFAULT_SOURCE)
 parser.add_argument('--output',type=Path,default=OUTPUT);parser.add_argument('--check',action='store_true');args=parser.parse_args()
 payload=inventory(args.upstream)
 content=json.dumps(payload,indent=2,ensure_ascii=False)+'\n'
 if args.check:
  if args.output.read_text()!=content:raise SystemExit('upstream inventory differs; regenerate and review')
 else:args.output.write_text(content)
 print(json.dumps(payload['summary'],ensure_ascii=False,sort_keys=True))
 print('input_manifest_sha256='+payload['upstream']['input_manifest_sha256'])
 print('output_sha256='+hashlib.sha256(content.encode()).hexdigest())

if __name__=='__main__':main()
