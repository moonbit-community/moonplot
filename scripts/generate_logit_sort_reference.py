"""Fixed CPython builtin sorted oracle for LogitFormatter's two NumPy keys.

Expected permutations come only from the actual builtin sorted. The Moon port
and any translated protocol model are never imported or used as an oracle.
"""
from pathlib import Path
import argparse,ast,hashlib,json,math,platform,random,struct,sys,warnings
import numpy as np
from formatter_reference_source import load_log_formatters
from generate_auto_date_reference import formatted
ROOT=Path(__file__).resolve().parents[1]
CP=ROOT/'.moonagent/upstream/cpython-v3.12.14/Objects/listobject.c'
CP_SHA='5f33dd1d97bfcc33e60495011fad7d9d02587a966999f28c159971f31aa91531'
TICKER=ROOT/'.moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py'
TICKER_SHA='49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad'

def bits(x):return struct.unpack('>Q',struct.pack('>d',float(x)))[0]
def double(x):return struct.unpack('>d',struct.pack('>Q',x))[0]
def moon(x):return str(bits(x))+'UL.reinterpret_as_double()'
def validated_rle(values):
 out=[];i=0
 while i<len(values):
  has_next=i+1<len(values)
  step=values[i+1]-values[i]if has_next else 0
  j=i+1 if has_next else i
  while j+1<len(values)and values[j+1]-values[j]==step:j+=1
  out.append((values[i],step,j-i+1));i=j+1
 assert [first+step*index for first,step,count in out for index in range(count)]==values
 return out

def original_counterexample():
 ns=load_log_formatters(TICKER);tree=ast.parse(TICKER.read_text())
 for name,kind in [('_is_decade',ast.FunctionDef),('_is_close_to_int',ast.FunctionDef),('LogitFormatter',ast.ClassDef)]:
  node=next(n for n in tree.body if isinstance(n,kind)and n.name==name)
  exec(compile(ast.Module(body=[node],type_ignores=[]),str(TICKER),'exec'),ns)
 f=ns['LogitFormatter'](minor=True,minor_threshold=100,minor_number=6);captured={}
 def trace(frame,event,arg):
  if event=='return'and frame.f_code.co_name=='set_locs'and frame.f_locals.get('self')is f:
   captured.update({k:frame.f_locals[k].copy()for k in ['space_pessimistic','space_sum']})
  return trace
 locs=np.array([.23,0,.3,1,.9,.3,2,.5,.9,.3,2])
 sys.settrace(trace)
 try:
  with warnings.catch_warnings():warnings.simplefilter('ignore');f.set_locs(locs)
 finally:sys.settrace(None)
 return captured['space_pessimistic'],captured['space_sum'],locs

def build():
 assert sys.version_info[:3]==(3,12,14),sys.version
 assert np.__version__=='2.3.5',np.__version__
 assert hashlib.sha256(CP.read_bytes()).hexdigest()==CP_SHA
 assert hashlib.sha256(TICKER.read_bytes()).hexdigest()==TICKER_SHA
 for fixture in [[],[0],[0,1,3],[4,2,5,1,0]]:validated_rle(fixture)
 cases=[];bodies=[]
 def add(label,p,s,spec=None,extra=None):
  p=np.asarray(p,dtype=np.float64);s=np.asarray(s,dtype=np.float64);assert p.shape==s.shape
  keys=[(p[i],s[i])for i in range(len(p))]
  # Each ndarray read is a distinct original NumPy scalar, including NaN.
  expected=sorted(range(len(p)),key=keys.__getitem__)
  case={'id':len(cases),'label':label,'pessimistic_bits':[bits(v)for v in p],'sum_bits':[bits(v)for v in s],'expected_order':expected,'expected_runs':validated_rle(expected),'input_pattern':spec,'source_extra':extra}
  cases.append(case)
  if spec is None:
   body='  let pessimistic = ['+', '.join(moon(x)for x in p)+']\n  let sums = ['+', '.join(moon(x)for x in s)+']\n'
  else:
   body=spec['moon']
  runs=case['expected_runs']
  body+='  let actual = logit_sort_indices(pessimistic, sums)\n  let expected = logit_sort_reference_expand(['+', '.join('('+str(a)+', '+str(b)+', '+str(n)+')'for a,b,n in runs)+'])\n'
  body+='  assert_eq(actual.length(), expected.length(), msg="sort case '+str(case['id'])+' length")\n  for index in 0..<expected.length() {\n    assert_eq(actual[index], expected[index], msg="sort case '+str(case['id'])+' element " + index.to_string())\n  }\n'
  bodies.append(body)
 nan=math.nan;inf=math.inf
 add('empty',[],[]);add('single NaN',[nan],[nan]);add('B actual complete-class counterexample',*original_counterexample()[:2],extra={'locs_bits':[bits(v)for v in original_counterexample()[2]],'full_original_class_executed':True})
 # Exhaustive short non-total-order keys expose binary insertion decisions.
 choices=[(-inf,0.),(-1.,nan),(0.,-0.),(-0.,0.),(1.,0.),(1.,nan),(nan,-1.),(nan,nan),(inf,inf)]
 rng=random.Random(341214)
 for n in [2,3,4,5,7,8,11,15,20,21,31,32,33,47,63,64,65,95,96,97,127,128,129,191,192,193,255,256,257,511,512,513,1023,1024,1025,4096]:
  for mode in range(5):
   pairs=[choices[rng.randrange(len(choices))]for _ in range(n)]
   if mode==0:pairs=[(float((i*37)%max(1,n)),float(i%7))for i in range(n)]
   elif mode==1:pairs=[(float(n-i),float(i%7))for i in range(n)]
   elif mode==2:pairs=[(nan,float(i%7))for i in range(n)]
   elif mode==3:pairs=[(float(i//17),nan if i%11==0 else float(i%3))for i in range(n)]
   add('length '+str(n)+' mode '+str(mode),[v[0]for v in pairs],[v[1]for v in pairs])
 # Explicit natural runs, highly unequal runs, gallop winners and dense ties.
 for lengths in [[32,32],[33,64],[64,33],[63,33,64],[128,32,64],[32,128,64],[240,50,130,33],[17,71,35,129,65],[512,32],[32,512],[1024,33,513,65],[255,256,257]]:
  for mode in ['two-runs','nan-boundaries','nan-sums','ties']:
   p=[];s=[]
   for run,n in enumerate(lengths):
    offset=(len(lengths)-run)*10000
    for j in range(n):p.append(float(offset+j)if mode!='ties'else float(j%4));s.append(float(j%9))
    if mode=='nan-boundaries':p[-1]=nan
    if mode=='nan-sums':s[-1]=nan;s[-n]=nan
   add('runs '+str(lengths)+' '+mode,p,s)
 # Signed zeros and special-only arrays, no invented total-order NaN sentinel.
 for n in [33,64,65,127,128,257,1025]:
  for field in [0,1]:
   p=[-0. if i%2 else 0. for i in range(n)];s=[float(n-i)for i in range(n)]
   (p if field==0 else s)[n//2]=nan
   add('signed zeros '+str(n)+' nanfield '+str(field),p,s)
 # Legitimate complete large arrays: source computes the entire permutation.
 for n,mode in [(125001,'allnan'),(200001,'gallop-runs'),(131073,'periodicnan')]:
  if mode=='allnan':
   p=np.full(n,nan);s=np.arange(n,dtype=float)
   code='  let pessimistic = Array::makei('+str(n)+', _ => '+moon(nan)+')\n  let sums = Array::makei('+str(n)+', index => index.to_double())\n'
  elif mode=='gallop-runs':
   p=np.array([(n-i//1024*1024)+(i%1024)for i in range(n)],dtype=float);s=np.array([i%13 for i in range(n)],dtype=float)
   code='  let pessimistic = Array::makei('+str(n)+', index => ('+str(n)+' - index / 1024 * 1024 + index % 1024).to_double())\n  let sums = Array::makei('+str(n)+', index => (index % 13).to_double())\n'
  else:
   p=np.array([nan if i%4096==0 else float((n-i//128*128)+(i%128))for i in range(n)]);s=np.array([float(i%17)for i in range(n)])
   code='  let pessimistic = Array::makei('+str(n)+', index => if index % 4096 == 0 { '+moon(nan)+' } else { ('+str(n)+' - index / 128 * 128 + index % 128).to_double() })\n  let sums = Array::makei('+str(n)+', index => (index % 17).to_double())\n'
  add('full '+str(n)+' '+mode,p,s,spec={'kind':mode,'length':n,'moon':code})
 data={'metadata':{'oracle':'actual CPython builtin sorted(range(n),key=distinct np.float64 tuple keys)','python':platform.python_version(),'numpy':np.__version__,'listobject_sha256':CP_SHA,'ticker_sha256':TICKER_SHA,'cases':len(cases),'registered_groups':(len(cases)+31)//32,'expected_shape':'full permutation for every case; no cap/prefix oracle','large_encoding':'run compression of actual builtin output only; every expanded index asserted','comparison':'Python tuple equality then less-than; no total-order NaN canonicalization','scope':'two distinct NumPy float64 scalar fields; no arbitrary comparator/runtime failure transport'},'cases':cases}
 text='// Generated by scripts/generate_logit_sort_reference.py; do not edit.\n\n///|\nfn logit_sort_reference_expand(runs : Array[(Int, Int, Int)]) -> Array[Int] {\n  let values : Array[Int] = []\n  for (first, step, count) in runs {\n    for index in 0..<count { values.push(first + step * index) }\n  }\n  values\n}\n'
 for i,body in enumerate(bodies):text+='\n///|\nfn logit_sort_reference_case_'+str(i)+'() -> Unit raise {\n'+body+'}\n'
 for start in range(0,len(bodies),32):text+='\n///|\ntest "Logit fixed CPython tuple sort group '+str(start//32)+'" {\n'+''.join('  logit_sort_reference_case_'+str(i)+'()\n'for i in range(start,min(start+32,len(bodies))))+'}\n'
 return json.dumps(data,indent=2,allow_nan=False)+'\n',formatted(text)

def main():
 parser=argparse.ArgumentParser();parser.add_argument('--check',action='store_true');args=parser.parse_args();data,tests=build()
 for path,text in [(ROOT/'testdata/logit_sort_reference.json',data),(ROOT/'ticker/logit_sort_reference_wbtest.mbt',tests)]:
  if args.check:
   if path.read_text()!=text:raise SystemExit('stale '+str(path))
  else:path.write_text(text)
 metadata=json.loads(data)['metadata'];print(('checked'if args.check else'generated')+' '+str(metadata['cases'])+' original sorted cases / '+str(metadata['registered_groups'])+' registered groups')
if __name__=='__main__':main()
