"""Independent high-precision logarithms with separate real NumPy observations."""
from pathlib import Path
import argparse
import decimal
import hashlib
import json
import math
import random
import struct
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_log_params_reference import load
from generate_multiple_locator_reference import clean, TICKER_SHA

ROOT=Path(__file__).resolve().parents[1]


def bits(value):
    return struct.unpack('>Q',struct.pack('>d',value))[0]


def mathematical(value,precision):
    if math.isnan(value)or value<0:return math.nan
    if value==0:return -math.inf
    if value==math.inf:return math.inf
    with decimal.localcontext()as ctx:
        ctx.prec=precision
        return float(decimal.Decimal.from_float(value).ln())


def generate(path):
    ns=load(path)
    values=[-math.inf,-10.,-0.,0.,1.,math.inf,math.nan]
    positive={.0001,.001,.01,.1,2.,3.,10.,.5,1.5,np.nextafter(0.,1.).item(),np.finfo(float).tiny.item(),float(np.finfo(float).max)}
    for exponent in [-300,-200,-100,-10,-3,-2,-1,0,1,2,3,10,100,200,300]:
        point=10.**exponent
        positive.update([math.nextafter(point,0.),point,math.nextafter(point,math.inf)])
    rng=random.Random(240024)
    for _ in range(128):
        positive.add(struct.unpack('>d',struct.pack('>Q',rng.randrange(1,0x7ff0000000000000)))[0])
    values+=sorted(positive)
    code='// Independent Decimal180/320 natural logarithms; NumPy source bits remain separately recorded.\n'
    rows=[]
    for index,value in enumerate(values):
        exact=mathematical(value,180)
        refined=mathematical(value,320)
        if not math.isnan(exact)and bits(exact)!=bits(refined):raise ValueError('Decimal log precision not stable')
        source=float(np.log(np.float64(value)))
        matches=math.isnan(exact)and math.isnan(source)or bits(exact)==bits(source)
        rows.append(dict(value=value,decimal_precisions=[180,320],mathematical=exact,source_numpy_log=source,source_matches_mathematical=matches))
        code+='\n///|\ntest '+moon('Log independent natural logarithm '+str(index))+' {\n'
        code+='  let actual = log_grid_natural_log('+moon(value)+')\n'
        code+='  verify_log_grid_bits([actual], '+moon([exact])+')\n'
        if not matches:code+='  assert_true(actual.reinterpret_as_uint64() != '+str(bits(source))+'UL)\n'
        code+='}\n'
    observed=[float(x)for x in ns['LogLocator']()._log_b([.001,.01])]
    helper_values=[float(ns['_decade_greater_equal'](np.float64(.01),10.))]
    code+='\n///|\ntest "Log generic ln ratio retains the original upward decade boundary" {\n'
    code+='  verify_log_grid_bits([log_decade_greater_equal(0.01, 10.0)], '+moon(helper_values)+')\n}\n'
    payload=dict(ticker_source_sha256=TICKER_SHA,numpy_binary_sha256=hashlib.sha256(Path(np._core._multiarray_umath.__file__).read_bytes()).hexdigest(),
                 mathematical_oracle='Decimal.from_float exact input, natural logarithm at180 and320 decimal digits, stabilized nearest-even binary64; standard IEEE special values.',
                 source_oracle='Actual np.log(np.float64(value)); complete original _decade_greater_equal AST independently observes the ceiling boundary.',
                 compatibility_boundary='Only new Log decade helpers use this portable mathematical ln. Existing global math and specialized Log tick log10/log2/generic grid paths remain unchanged. Darwin source differences are recorded explicitly with both bits and strict mathematical assertions.',
                 source_profile_differences=[row for row in rows if not row['source_matches_mathematical']],cases=rows,
                 original_generic_decade_boundary=dict(value=.01,base=10.,source_values=helper_values),specialized_log_b_observation=observed)
    return clean(payload),formatted(code)


def main():
    parser=argparse.ArgumentParser();parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore',RuntimeWarning);payload,code=generate(args.ticker)
    outputs={ROOT/'testdata/log_grid_logarithm_reference.json':json.dumps(payload,indent=2,allow_nan=False)+'\n',ROOT/'ticker/log_grid_logarithm_reference_wbtest.mbt':code}
    for path,text in outputs.items():
        if args.check:
            if not path.exists()or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    print('Log logarithms:',len(payload['cases']),'mathematical/source observations,',len(payload['source_profile_differences']),'source/math differences, one original decade-boundary test')


if __name__=='__main__':main()
