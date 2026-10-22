"""Independent exact-input Decimal Asinh primitives and real NumPy observations.

No production Moon helper supplies expected values. Decimal180/320 calculations
increase precision for tiny cancellation, preserving at least the requested
number of significant output digits before nearest-even binary64 conversion.
"""
from pathlib import Path
import argparse
import decimal
import json
import math
import random
import struct
import sys
import warnings

import numpy as np

from generate_auto_date_reference import formatted, moon
from generate_log_params_reference import load, NUMPY_SHA
from generate_multiple_locator_reference import clean, TICKER_SHA

ROOT = Path(__file__).resolve().parents[1]


def bits(value): return struct.unpack('>Q', struct.pack('>d', value))[0]
def from_bits(value): return struct.unpack('>d', struct.pack('>Q', value))[0]


def mathematical(function, value, precision):
    if math.isnan(value): return math.nan, precision
    if function == 'log10':
        if value == 0.: return -math.inf, precision
        if value < 0.: return math.nan, precision
        if value == math.inf: return math.inf, precision
    elif math.isinf(value) or value == 0.:
        return value, precision
    magnitude = abs(value)
    # sinh(x)>exp(x)/4 for x>1. At x>1024 this exceeds binary64's
    # overflow boundary by hundreds of bits; avoid unbounded Decimal exponents.
    if function == 'sinh' and magnitude > 1024.:
        return math.copysign(math.inf, value), precision
    exact = decimal.Decimal.from_float(value if function == 'log10' else magnitude)
    adaptive = max(precision, precision - min(exact.adjusted(), 0)) if function != 'log10' else precision
    with decimal.localcontext() as ctx:
        ctx.prec = adaptive
        ctx.Emax = 999999
        ctx.Emin = -999999
        ctx.rounding = decimal.ROUND_HALF_EVEN
        if function == 'asinh':
            result = (exact + (exact * exact + 1).sqrt()).ln()
        elif function == 'sinh':
            result = (exact.exp() - (-exact).exp()) / 2
        else:
            result = exact.log10()
        rounded = float(result)
    return math.copysign(rounded, value) if function != 'log10' else rounded, adaptive


def stable_math(function, value):
    first, p1 = mathematical(function, value, 180)
    second, p2 = mathematical(function, value, 320)
    if not (math.isnan(first) and math.isnan(second)) and bits(first) != bits(second):
        raise ValueError('Decimal180/320 not stable: ' + function + ' ' + value.hex())
    return first, [p1, p2]


def neighbors(value, count=1):
    values = [value]
    lower, upper = value, value
    for _ in range(count):
        lower = math.nextafter(lower, -math.inf)
        upper = math.nextafter(upper, math.inf)
        values += [lower, upper]
    return values


def unique(values):
    found = set()
    result = []
    for value in values:
        key = bits(value)
        if key not in found:
            found.add(key); result.append(value)
    return result


def profiles():
    tiny = 2.**-28
    minimum = from_bits(1)
    normal = sys.float_info.min
    largest = sys.float_info.max
    base = [0., -0., math.nan, math.inf, -math.inf]
    magnitudes = [minimum, from_bits(2), from_bits(3), normal, 1e-320, 1e-308,
                  1e-100, 1e-20, .1, .5, 1., 2., 10., 100., 1000.]
    magnitudes += neighbors(tiny, 2) + neighbors(2.**-27) + neighbors(normal)
    asinh_values = base + [sign*x for x in magnitudes + [1e100, 1e200, 1e308, largest] for sign in [1., -1.]]
    for x in [1., 10., 100., 1000., largest]:
        asinh_values += [sign*y for y in neighbors(x) if math.isfinite(y) for sign in [1., -1.]]
    # Obtain the overflow boundary independently at high precision, then check
    # several adjacent exact binary64 inputs on each side.
    with decimal.localcontext() as ctx:
        ctx.prec = 320
        overflow = float((2 * decimal.Decimal.from_float(largest)).ln())
    sinh_magnitudes = magnitudes + [20., 100., 700., 709., 710., 711., 1024., 1025., largest]
    sinh_magnitudes += neighbors(overflow, 4) + neighbors(710., 2) + neighbors(1024.)
    sinh_values = base + [sign*x for x in sinh_magnitudes for sign in [1., -1.]]
    logarithms = base + [-1., -.1, -minimum, minimum, from_bits(2), from_bits(3), normal, largest]
    for exponent in [-323, -308, -200, -100, -10, -3, -2, -1, 0, *range(1, 24), 34, 100, 200, 300, 308]:
        logarithms += neighbors(10.**exponent)
    rng = random.Random(260026)
    for _ in range(24):
        value = from_bits(rng.randrange(1, 0x7ff0000000000000))
        asinh_values += [value, -value]
        logarithms.append(value)
    for _ in range(12):
        value = rng.random()*711.
        sinh_values += [value, -value]
    return dict(asinh=unique(asinh_values), sinh=unique(sinh_values), log10=unique(logarithms))


def generate(path):
    load(path)  # Verify fixed original sources/runtime/NumPy binary independently.
    functions = dict(asinh=np.arcsinh, sinh=np.sinh, log10=np.log10)
    code = '''// Independent Decimal oracle; actual Darwin NumPy values are retained separately.

///|
fn verify_asinh_math_reference_number(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() { assert_true(actual.is_nan()) }
  else { assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64()) }
}
'''
    rows=[]
    for function, values in profiles().items():
        for value in values:
            expected, precisions=stable_math(function,value)
            source=float(functions[function](np.asarray([value],dtype=np.float64))[0])
            scalar=float(functions[function](np.float64(value)))
            matches=math.isnan(source)and math.isnan(expected)or bits(source)==bits(expected)
            scalar_matches=math.isnan(scalar)and math.isnan(expected)or bits(scalar)==bits(expected)
            row=dict(function=function,input=value,input_bits=f'{bits(value):016x}',decimal_effective_precisions=precisions,
                     mathematical=expected,mathematical_bits=f'{bits(expected):016x}',source_numpy_array=source,source_numpy_array_bits=f'{bits(source):016x}',
                     source_numpy_scalar=scalar,source_numpy_scalar_bits=f'{bits(scalar):016x}',source_matches_mathematical=matches,scalar_matches_mathematical=scalar_matches)
            index=len(rows);rows.append(row)
            code+='\n///|\ntest '+moon('Asinh independent '+function+' '+str(index))+' {\n  let actual = asinh_math_'+function+'('+moon(value)+')\n  verify_asinh_math_reference_number(actual, '+moon(expected)+')\n'
            if not matches and not math.isnan(source) and not math.isnan(expected):
                code+='  assert_true(actual.reinterpret_as_uint64() != '+str(bits(source))+'UL)\n'
            code+='}\n'
    payload=dict(ticker_sha256=TICKER_SHA,numpy_core_sha256=NUMPY_SHA,python=sys.version.split()[0],numpy=np.__version__,
                 mathematical_oracle='Exact Decimal.from_float binary64 inputs. asinh=ln(x+sqrt(x*x+1)); sinh=(exp(x)-exp(-x))/2; log10=Decimal.log10. Independent180/320 decimal-digit calculations increase precision by the tiny-input cancellation exponent, then convert nearest-even to binary64 and require bit agreement. IEEE special values/signed zeros explicit; sinh |x|>1024 proven overflow. No production helper is called.',
                 source_oracle='Actual fixed NumPy arrays and scalar ufunc calls, separately retained with exact bits. Differences are explicit numerical-profile evidence, not tolerance/ignored tests.',
                 compatibility_boundary='Named Asinh locator primitives use the portable mathematically correctly rounded profile. Source Apple/NumPy results can differ by one ULP and can change later whole locator collections near rounding thresholds; this oracle asserts mathematical bits while preserving actual source bits. Geometry retains its separately documented core-math relative profile.',
                 counts={name:sum(r['function']==name for r in rows)for name in functions},source_profile_differences=[r for r in rows if not r['source_matches_mathematical']or not r['scalar_matches_mathematical']],cases=rows)
    return json.dumps(clean(payload),indent=2,allow_nan=False)+'\n',formatted(code)


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('ticker',type=Path);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore',RuntimeWarning);outputs=generate(args.ticker)
    for name,content in zip(['testdata/asinh_math_reference.json','ticker/asinh_math_reference_wbtest.mbt'],outputs):
        target=ROOT/name
        if args.check:
            if not target.exists()or target.read_text()!=content:raise SystemExit('reference differs: '+name)
        else:target.write_text(content)
    p=json.loads(outputs[0]);print('Asinh math:',len(p['cases']),'exact-input observations,',p['counts'],len(p['source_profile_differences']),'source/math differences')


if __name__=='__main__':main()
