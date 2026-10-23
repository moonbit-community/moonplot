"""Actual NumPy object np.sort references, independent of either Moon sort.

No translated sorting model generates expected values. Inputs and outputs retain
six numeric scalar origins. The helper serves Logit object-distance temporaries,
not arbitrary Python objects, subclass comparators, or failed-array permutations.
"""
from pathlib import Path
import argparse,base64,hashlib,json,math,platform,random,struct,sys
import numpy as np
from generate_auto_date_reference import formatted
ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/'.moonagent/upstream/numpy-v2.3.5/numpy/_core/src'
HASHES={'npysort/quicksort.cpp':'fd96048d864522a41c8de995194d2013a4aa8467eaa845cb9b5213c5b494b4c9','npysort/heapsort.cpp':'2526c80d9208f9bd07272ec150d92b7da34de0a470c4e3db966e2f621eb49642','multiarray/arraytypes.c.src':'2cc85885ed03da024edd7adcbed9b763449a2a9f168de3845089b9cbd20c373a','multiarray/item_selection.c':'a137b003ec36a46113895ae132338a87602542a5a71a5173dea5f15d340d1aa3'}
def bits(x):return struct.unpack('>Q',struct.pack('>d',float(x)))[0]
def encode(x):
 if isinstance(x,np.bool_):return {'kind':'NumpyBool','value':bool(x)}
 if isinstance(x,np.int64):return {'kind':'NumpyInt64','value':str(x)}
 if isinstance(x,np.float64):return {'kind':'NumpyFloat64','bits':bits(x)}
 if isinstance(x,bool):return {'kind':'Boolean','value':x}
 if isinstance(x,int):return {'kind':'Integer','value':str(x)}
 return {'kind':'Number','bits':bits(x)}
def scalar(v):
 k=v['kind']
 if k in ['Number','NumpyFloat64']:text=str(v['bits'])+'UL.reinterpret_as_double()'
 elif k=='Integer':text='@bigint.BigInt::from_string('+json.dumps(v['value'])+')'
 elif k=='NumpyInt64':text=v['value']+'L'
 else:text=str(v['value']).lower()
 return 'ScalarNumber::'+k+'('+text+')'
def vals(vs):return '['+', '.join(scalar(v)for v in vs)+']'
def build():
 assert sys.version_info[:3]==(3,12,14),sys.version
 assert np.__version__=='2.3.5'
 for path,h in HASHES.items():assert hashlib.sha256((SOURCE/path).read_bytes()).hexdigest()==h
 cases=[];bodies=[];rng=random.Random(34235)
 def add(label,values,kind='quicksort',spec=None):
  raw=np.array(values,dtype=object)
  try:result=np.sort(raw)if kind=='quicksort'else np.sort(raw,kind='heapsort');error=None;encoded=[encode(v)for v in result]
  except Exception as e:error=type(e).__name__+': '+str(e);encoded=None
  row={'id':len(cases),'label':label,'kind':kind,'values':[encode(v)for v in values],'expected':encoded,'error':error,'input_pattern':spec};cases.append(row)
  body='  let values : Array[ScalarNumber] = '+vals(row['values'])+'\n'if spec is None else spec['moon']
  expr='logit_object_sort(values)'if kind=='quicksort'else'{ logit_object_heapsort(values, 0, values.length()); values }'
  if error:body+='  let error = try { ignore('+expr+'); "unexpected success" } catch { @core.DataError::InvalidTicks(message~) => message; _ => "unexpected error" }\n  assert_eq(error, '+json.dumps(error)+', msg="object sort case '+str(row['id'])+'")\n'
  else:
   body+='  let actual = '+expr+'\n'
   if spec is None:
    body+='  let expected = '+vals(encoded)+'\n  assert_eq(actual.length(), expected.length())\n  for index in 0..<expected.length() { logit_object_sort_reference_scalar(actual[index], expected[index]) }\n'
   else:
    # Large references retain every source output bit. Lossless RLE by complete
    # scalar origin and bit payload keeps each private test below local limits.
    runs=[]
    for v in encoded:
     if runs and runs[-1][0]==v:runs[-1][1]+=1
     else:runs.append([v,1])
    if len(runs)>10000:
     # Encode exact source bits in fixed chunks, not a sorted-value formula.
     # Numeric floats on these fixtures fit an indexable packed bit String.
     chunks=[''.join(str(v['bits'])+','for v in encoded[start:start+1024]) for start in range(0,len(encoded),1024)]
     assert all(len(chunk)<65535 for chunk in chunks)
     body+='  let expected_chunks : Array[String] = [\n'+''.join('    '+json.dumps(chunk)+',\n' for chunk in chunks)+'  ]\n  let expected_bits = expected_chunks.join("")\n  let expected = logit_object_sort_reference_bits(expected_bits)\n  assert_eq(actual.length(), expected.length())\n  for index in 0..<expected.length() {\n    match actual[index] { ScalarNumber::Number(value) => assert_eq(value.reinterpret_as_uint64(), expected[index]); _ => abort("large source origin") }\n  }\n'
    else:
     body+='  let runs : Array[(ScalarNumber, Int)] = ['+', '.join('('+scalar(v)+', '+str(n)+')'for v,n in runs)+']\n  let mut index = 0\n  for (value, count) in runs { for _ in 0..<count { logit_object_sort_reference_scalar(actual[index], value); index += 1 } }\n  assert_eq(actual.length(), index)\n'
  if spec is not None and encoded is not None:
   for field,original in [('values',row['values']),('expected',encoded)]:
    assert all(v['kind']=='Number' for v in original)
    binary=b''.join(struct.pack('>Q',v['bits']) for v in original)
    packed=base64.b64encode(binary).decode('ascii')
    assert [struct.unpack('>Q',binary[i:i+8])[0] for i in range(0,len(binary),8)]==[v['bits'] for v in original]
    row[field]={'encoding':'big-endian-uint64-base64','scalar_kind':'Number','length':len(original),'data':packed}
  bodies.append(body)
 nan=math.nan;inf=math.inf
 for seq in [[1.,0.,nan,.0001],[0.,nan,.0001,1.],[nan,0.,.0001,1.],[2.**64,.2,nan,.2001],[.2,nan,.2001,2.**64],[nan,.2,.2001,2.**64],[],[nan]]:
  for kind in ['quicksort','heapsort']:add('source counterexample and tiny '+str(seq),seq,kind)
 choices=[-inf,-3.,-0.,0.,.0001,1.,inf,nan,np.float64(nan),np.float64(.2)]
 for n in [2,3,7,15,16,17,18,31,32,33,63,64,65,127,128,129,255,256,257,1024,2049]:
  for mode in range(4):
   values=[choices[rng.randrange(len(choices))]for _ in range(n)]
   if mode==0:values=[float(i//3)for i in range(n)][::-1]
   elif mode==1:values=[nan if i%7==0 else float((i*37)%31)for i in range(n)]
   elif mode==2:values=[np.float64(i%13)if i%2 else float(i%17)for i in range(n)];values[n//2]=np.float64(nan)
   for kind in ['quicksort','heapsort']:add('n'+str(n)+' mode'+str(mode),values,kind)
 # Origin and numeric comparison errors: no dynamic rich-compare fixtures.
 for seq in [[False,np.bool_(True),np.int64(-2),10**30,1.25,np.float64(.5)],[-2**63,np.int64(-2**63),2**53+1,float(2**53),np.float64(2**53)], [np.bool_(True),10**400], [np.float64(.2),10**400], [10**400,False,np.bool_(False)], [np.int64(2**63-1),2**64,math.nan,np.float64(1.)]]:
  for kind in ['quicksort','heapsort']:add('six numeric origins and first-error comparison',seq,kind)
 for n in [128,1024,4096]:
  half=n//2;killer=[float(j)for i in range(1,half,2)for j in [i,half+i]]+[float(i)for i in range(2,n+1,2)]
  for label,seq in [('median3-adversary',killer),('organpipe',[float(min(i,n-i))for i in range(n)]),('sawtooth',[float(i%17)for i in range(n)])]:
   for kind in ['quicksort','heapsort']:add(label+str(n),seq,kind)
 # Full legal long arrays have all original output scalars retained in JSON.
 for n,mode in [(125001,'nan'),(200001,'alternating'),(131073,'blocks')]:
  if mode=='nan':
   values=[math.nan]*n;code='  let values = Array::makei('+str(n)+', _ => ScalarNumber::Number(0x7ff8000000000000UL.reinterpret_as_double()))\n'
  elif mode=='alternating':
   values=[float(i%2)for i in range(n)];code='  let values = Array::makei('+str(n)+', index => ScalarNumber::Number((index % 2).to_double()))\n'
  else:
   values=[float((n-i//1024*1024)+(i%1024))for i in range(n)];code='  let values = Array::makei('+str(n)+', index => ScalarNumber::Number(('+str(n)+' - index / 1024 * 1024 + index % 1024).to_double()))\n'
  for kind in ['quicksort','heapsort']:add('complete '+str(n)+' '+mode,values,kind,spec={'kind':mode,'length':n,'moon':code})
 header='''// Generated by scripts/generate_logit_object_sort_reference.py; do not edit.

///|
fn logit_object_sort_reference_bits(text : String) -> Array[UInt64] raise {
  let values : Array[UInt64] = []
  for part in text.split(",") {
    if !part.is_empty() { values.push(@string.parse_uint64(part)) }
  }
  values
}

///|
fn logit_object_sort_reference_scalar(actual : ScalarNumber, expected : ScalarNumber) -> Unit raise {
  match (actual, expected) {
    (Number(a), Number(b)) | (NumpyFloat64(a), NumpyFloat64(b)) => assert_eq(a.reinterpret_as_uint64(), b.reinterpret_as_uint64())
    (Integer(a), Integer(b)) => assert_eq(a.to_string(), b.to_string())
    (NumpyInt64(a), NumpyInt64(b)) => assert_eq(a, b)
    (Boolean(a), Boolean(b)) | (NumpyBool(a), NumpyBool(b)) => assert_eq(a, b)
    _ => abort("object-sort scalar origin mismatch")
  }
}
'''
 text=header
 for i,body in enumerate(bodies):text+='\n///|\nfn logit_object_sort_reference_case_'+str(i)+'() -> Unit raise {\n'+body+'}\n'
 for start in range(0,len(bodies),32):text+='\n///|\ntest "Logit NumPy object sort group '+str(start//32)+'" {\n'+''.join('  logit_object_sort_reference_case_'+str(i)+'()\n'for i in range(start,min(start+32,len(bodies))))+'}\n'
 doc={'metadata':{'cases':len(cases),'registered_groups':(len(cases)+31)//32,'python':platform.python_version(),'numpy':np.__version__,'source_hashes':HASHES,'oracle':'actual np.sort(object_array) default quicksort; actual np.sort(kind=heapsort) for the fallback primitive','scope':'six static numeric scalar origins serving copied Logit object-distance buffers; no arbitrary Python rich comparison or failed-array permutation claim','full_output':'all original scalar origins and every value bit retained; large Number buffers use lossless big-endian-uint64 base64; no prefix/reference cap'},'cases':cases}
 return json.dumps(doc,indent=2,allow_nan=False)+'\n',formatted(text)
def main():
 p=argparse.ArgumentParser();p.add_argument('--check',action='store_true');a=p.parse_args();data,tests=build()
 for path,text in [(ROOT/'testdata/logit_object_sort_reference.json',data),(ROOT/'ticker/logit_object_sort_reference_wbtest.mbt',tests)]:
  if a.check:
   if path.read_text()!=text:raise SystemExit('stale '+str(path))
  else:path.write_text(text)
 meta=json.loads(data)['metadata'];print(('checked'if a.check else'generated')+' '+str(meta['cases'])+' actual object sort cases / '+str(meta['registered_groups'])+' groups')
if __name__=='__main__':main()
