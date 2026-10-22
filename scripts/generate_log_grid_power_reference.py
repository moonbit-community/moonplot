"""Independent exact-rational/Decimal power properties and actual source powers.

Decimal precision is doubled before accepting a mathematical observation. The
Darwin NumPy expression is observed separately, including known disagreement;
no source expectation is replaced by the mathematically rounded result.
"""
from pathlib import Path
import argparse
import decimal
from fractions import Fraction
import hashlib
import json
import math
import struct
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_log_params_reference import load
from generate_multiple_locator_reference import clean, TICKER_SHA

ROOT=Path(__file__).resolve().parents[1]


def bits(value):
    return struct.unpack('>Q',struct.pack('>d',value))[0]


def mathematical(base,exponent,precision):
    with decimal.localcontext() as ctx:
        ctx.prec=precision
        ctx.Emax=999999999999999999
        ctx.Emin=-999999999999999999
        ctx.traps[decimal.Overflow]=False
        value=decimal.Decimal.from_float(base)**int(exponent)
        return float(value)


def generate(path):
    ns=load(path)
    pairs=set()
    original=json.loads((ROOT/'testdata/log_grid_reference.json').read_text())
    for row in original['cases']:
        base=row['case']['base']
        if not isinstance(base,float) or not math.isfinite(base) or base<=0:continue
        for value in row['observation'].get('complete_decades_shape',{}).get('prefix',[]):
            pairs.add((base,float(value['value'])))
    for base in [2.,3.,10.,math.e,.5,1.5,math.nextafter(1.,0.),math.nextafter(1.,math.inf),
                 np.nextafter(0.,1.).item(),float(np.finfo(float).max),-1.5,-10.]:
        for exponent in [-1075.,-1074.,-1024.,-324.,-308.,-100.,-6.,-4.,-3.,-2.,-1.,0.,1.,2.,3.,4.,6.,100.,308.,1024.]:
            pairs.add((base,exponent))
    for base in [math.nextafter(1.,0.),math.nextafter(1.,math.inf)]:
        for exponent in [-1e308,-1e100,-2**63,-2**53-2,2**53+2,2**63,1e100,1e308]:
            pairs.add((base,float(exponent)))
    pairs.add((float.fromhex('0x1.fb811bd86fa7ap+360'),-1.0))
    code="// Independent exact/Decimal mathematical powers and actual NumPy-expression source powers.\n"
    rows=[]
    for index,(base,exponent) in enumerate(sorted(pairs)):
        expected=mathematical(base,exponent,180)
        refined=mathematical(base,exponent,320)
        fraction=None
        if abs(exponent)<=2048:
            exact=Fraction.from_float(base)**int(exponent)
            try:fraction=float(exact)
            except OverflowError:fraction=math.copysign(math.inf,-1. if exact<0 else 1.)
            expected=fraction
        elif bits(expected)!=bits(refined):raise ValueError('Decimal precision has not stabilized')
        # This is the array expression used by the original Log major branch,
        # not np.power(scalar, scalar), which has different shortcuts.
        source=float((base**np.array([exponent],dtype=np.float64))[0])
        rows.append(dict(base=base,exponent=exponent,decimal_precisions=[180,320],mathematical=expected,
                         exact_fraction_checked=fraction is not None,source_array_power=source,
                         source_matches_mathematical=bits(source)==bits(expected)))
        code+='\n///|\ntest '+moon('Log integer power independent mathematical '+str(index))+' {\n'
        code+='  verify_log_grid_bits([log_grid_integer_power('+moon(base)+', '+moon(exponent)+')], '+moon([expected])+')\n}\n'
        if bits(source)==bits(expected):
            code+='\n///|\ntest '+moon('Log array power actual Darwin source '+str(index))+' {\n'
            code+='  verify_log_grid_bits([log_grid_numpy_power('+moon(base)+', '+moon(exponent)+')], '+moon([source])+')\n}\n'
        else:
            code+='\n///|\ntest '+moon('Log explicit Darwin rounding profile difference '+str(index))+' {\n'
            code+='  let actual = log_grid_numpy_power('+moon(base)+', '+moon(exponent)+')\n'
            code+='  verify_log_grid_bits([actual], '+moon([expected])+')\n'
            code+='  assert_true(actual.reinterpret_as_uint64() != '+str(bits(source))+'UL)\n}\n'
    base=math.nextafter(1.,0.)
    values=[float(x)for x in ns['LogLocator'](base=base).tick_values(1.,1.)]
    correct_values=[mathematical(base,-1.,320),1.,base]
    code+='\n///|\ntest "Log near-one point records the deliberate mathematical rounding contract" {\n'
    code+='  let previous = @config.classic_mode()\n  defer @config.set_classic_mode(previous)\n  @config.set_classic_mode(false)\n'
    code+='  let locator = LogLocator::new(base='+moon(base)+')\n'
    code+='  verify_log_grid_bits(locator.tick_values(1.0, 1.0), '+moon(correct_values)+')\n'
    code+='  assert_true('+moon(values[0])+'.reinterpret_as_uint64() != '+moon(correct_values[0])+'.reinterpret_as_uint64())\n}\n'
    payload=dict(ticker_source_sha256=TICKER_SHA,
                 numpy_binary_sha256=hashlib.sha256(Path(np._core._multiarray_umath.__file__).read_bytes()).hexdigest(),
                 mathematical_oracle='Exact Fraction integer power for |exponent|<=2048; otherwise exact binary64 base -> stabilized Decimal180/320 power -> nearest-even binary64. Fraction resolves exact halfway subnormal cases where finite Decimal precision can approach opposite sides.',
                 source_oracle='Actual base ** np.array([float64 exponent]) expression, and complete original LogLocator.tick_values AST. No original expected bit is rewritten.',
                 source_profile_differences=[row for row in rows if not row['source_matches_mathematical']],
                 compatibility_boundary='Portable integer powers deliberately require mathematical nearest-even rounding across all targets. Darwin libm is not always correctly rounded. Source values are retained separately and every known discrepancy asserts exact mathematical bits, never a tolerance or skipped comparison.',
                 near_one_original_query=dict(base=base,bounds=[1.,1.],source_values=values,mathematical_values=correct_values),cases=rows)
    return clean(payload),formatted(code)


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('ticker',type=Path)
    parser.add_argument('--check',action='store_true')
    args=parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore',RuntimeWarning)
        payload,code=generate(args.ticker)
    outputs={ROOT/'testdata/log_grid_power_reference.json':json.dumps(payload,indent=2,allow_nan=False)+'\n',
             ROOT/'ticker/log_grid_power_reference_wbtest.mbt':code}
    for path,text in outputs.items():
        if args.check:
            if not path.exists()or path.read_text()!=text:raise SystemExit('reference differs: '+str(path))
        else:path.write_text(text)
    print('Log powers:',len(payload['cases']),'mathematical + source pairs,',len(payload['source_profile_differences']),'actual source/math disagreements; one original point query')


if __name__=='__main__':main()
