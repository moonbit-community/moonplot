# Named logarithmic formatter numerical profile

D33 is accepted. The complete project suite passes on wasm, wasm-gc, JS and
native; all four new source checks pass. The added exact midpoint assertions
also pass separately on all four targets. Counts and gate logs are recorded in
the migration checkpoint.

The four named classes share the new numerical path: `LogFormatter`,
`LogFormatterExponent`, `LogFormatterMathtext`, and `LogFormatterSciNotation`.
The existing pure convenience formatter keeps its accepted behavior. Each named
class preserves its source-specific sign handling, filtering, axis reads, and
format-data method. In particular, the mathtext classes retain ASCII minus in
math strings; only the plain/exponent call path applies the live Unicode-minus
setting. The short method remains the native `%-12g` formatting protocol.

`set_locs` ignores its argument and never replaces the stored locations. It
consumes the first threshold before transform/view context, then reads the second
threshold only if needed. Failed cache construction retains the previous cache.
`format_data` temporarily disables `labelOnlyBase`, retains cache filtering, and
restores the exact raw slot on success and failure. Six numeric scalar origins
remain distinct, including wrapping NumPy Int64 absolute value and the NumPy
ufunc error for Python integers outside its supported scalar range.

## Source and mathematical evidence

Run from the repository root with the pinned CPython3.12.14 / NumPy2.3.5 runtime:

```
python scripts/generate_log_formatter_numeric_reference.py
python scripts/generate_log_formatter_numeric_reference.py --check
```

There is no positional ticker-path argument. The script obtains the pinned source
path itself and uses `formatter_reference_source.load_log_formatters`. It executes
all four complete class ASTs, the real context-managed `cbook._setattr_cm`,
`strip_math`, `_is_close_to_int`, and `transforms._nonsingular`. The mathematical
copy redirects only elementary natural logarithm, log10 and positive-base power;
all class branches, native NumPy linspace/round, builtin set/round/format and
error ordering stay source code. Complete original NumPy geomspace and logspace
bodies are also run, with only their elementary log10/power values redirected.
The JSON records all source/dependency hashes.

Natural logarithms are individually rounded before division. A source expression
`math.log(x, base)` is never replaced by an exactly rounded base-log ratio. The
portable fractional-power kernel encloses exact binary inputs with directed
BigInt intervals. Exact rational roots are handled before logarithm/exponential
bounds; all remaining dyadic-exponent results are irrational, so adaptive bounds
cannot remain at a binary64 rounding midpoint. Existing integer-power and
base-ten-power kernels remain unchanged. Independent Decimal180/320 agreement
supplies mathematical values; no port implementation supplies expected results.

Stable finite Decimal precision is reference evidence, not a general midpoint
certificate. Independent review established the exact rational identity
`(1/4)**(1075/2) = (1/16)**(1075/4) = Fraction(1, 2**1075)`. Nearest-even rounds
this half-minimum-subnormal value to positive zero. Native Python/NumPy agree;
Decimal power at precision 180/320/640 instead converts to bits 1/0/1. The
existing rational-root hand test therefore asserts both exact ties and the
adjacent exponent results using exact bit expectations. Its expected tie comes
from the Fraction identity, independently of the Decimal power oracle. No
existing generated expectation was replaced or relaxed.

The formal corpus has 1,589 numeric cases in 50 registered groups, 109 primitive
cases in 4 groups, and 4 hand tests: 58 registered tests total. It records 4,389
actual-source and 4,376 mathematical observations.

Eight complete-method label differences remain explicitly paired in the JSON:
for Python integer `10**400` and bases immediately below/above one, the original
Darwin logarithm and portable mathematical logarithm lead to different large
exponents. Three preparation differences concern only native NumPy RuntimeWarning
messages on negative-base wholly-linear geometry. Three raw geomspace points
have distinct source/math bits while rounding to the same sublabel. Two
additional independent fractional-power samples retain distinct source and
mathematical primitive bits. These values
are retained separately, with strict mathematical-bit assertions and strict
original-source observations; no tolerance or skipped parity assertion hides a
difference. NumPy RuntimeWarnings are recorded as native warnings, separately
from `_api.warn_external` diagnostics.

## Complete cache shape and resources

The internal cache is opaque. Its public snapshot is a complete fresh ascending
array of distinct coefficients. Its membership query retains every logical
arange/geomspace point and the forced geometric endpoints. There is no 100000
prefix limit. Arange membership uses monotone binary search through the exact
fill operation: around `2**53`, casting an index and then adding start can skip
an otherwise representable integer, so an interval-membership shortcut is wrong.
Geometric membership also uses the full monotone logical run and separately
checks its forced final endpoint. Snapshots skip repeated rounded plateaus with
local exponential/binary search.

The source's own Float64 byte-size and maximum-shape errors are checked before
constructing descriptors, including the rounded actual arange shape of linspace.
These errors are distinct from the portable Array addressability error for a
requested complete snapshot. A large logical cache remains valid and queryable
even if its snapshot cannot fit in an Int32-indexed Array.

For the early geometric snapshot addressability proof, use only a small prefix.
A valid generated geometry has `base < 2**61`, requested count
`n=floor(base)/2+1`, and `L=RN(log10(base))<19`. If `base>2**40`, then `n>=2**39`.
The logical index conversion, independently rounded step and multiplication give
an adjacent phase increment bounded by

```
20/(n-1) + 20*2**-52*n/(n-1) + 2**-48 < 2**-34.
```

For coefficients at most `2**32+1`, the derivative of `10**phase`, together with
the correctly rounded endpoint errors, bounds the adjacent raw-power increment
by 0.577, strictly below 1. This also covers the crossing to the next point: the
phase bound prevents a jump out of this prefix. Rounding to an integer therefore
changes by at most 1. Since the geometry starts at 1 and extends beyond this
prefix, it contains every integer from 1 through `2**31+1`, which already exceeds
the addressable unique snapshot length. This is a sufficient proof about actual
unique output, not a limit on logical points or an oracle CPU budget. No global
endpoint jump bound is claimed: near the largest valid base, actual neighboring
rounded coefficients can differ by 18944, as independently checked during review.

The formal reference executes complete source grids with 125001 and 200001
geometric points and 200001 arange points. Their snapshot lengths and tail
coefficients are checked, including labels whose membership depends on the last
coefficient. Full per-point Decimal recomputation of the two large geometric
arrays has two explicit CPU-budget omissions. Actual source arrays are fully
executed; these omissions do not become exceptions or library input limits.
The arange sample has no independent transcendental enumeration to omit.

Four hand tests cover an enormous valid logical cache and unaddressable complete
snapshot, arange index-cast holes, tiny rounded-stop shape, exact rational roots,
and format-data cache filtering/restoration. Numerical cases and registered test
groups are counted separately in the generated metadata; project-wide acceptance
is recorded by the root migration checkpoint after its gates complete.
