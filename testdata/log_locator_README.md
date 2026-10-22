# Named LogLocator references

D24 is accepted: wasm, wasm-gc and native each pass 9575 tests, and JS passes
9582 tests. The slice adds 1868 tests; all five reference checks and the full
check pass. Interface changes were reviewed; eight pre-existing Ref deprecation
warnings remain. The overall project coverage estimate is unchanged. Older log
helpers keep their existing validation and sampling contracts. Named SymLog,
Asinh and Logit locators and default numeric-axis lifecycle remain later work.

## Object and typed parameters

`LogLocator::new(base=10.0, subs omitted, numticks=None)` uses `[1]` subs by
default. Explicit `subs=None` means source `auto`; the constructor distinguishes
it from omission. `LogSubs` is `Text(String)` or `Values(TickValues)`. Only
`"auto"` and `"all"` are valid text. Float64 storage stays borrowed, including
signed/nested/zero-stride views. Int64 storage is converted to a Float64 copy,
matching `np.asarray(..., dtype=float)`. Getters retain the live borrowed view;
checked shape errors remain observable after an owner buffer is shortened.

`LogNumTicks` preserves `Text(String)`, `Number(Double)` and `Integer(BigInt)`.
The constructor captures classic mode to select default 15 or `"auto"`.
`set_numticks` assigns the raw property. Numeric parameters retain the source's
unchecked Double domain: base is not eagerly restricted to greater than one,
and fractional, zero, negative, NaN or infinite budgets can fail or return data
only at the query that consumes them. `set_params(base, subs, numticks)` follows
source order and partial updates. Omitted or explicit None leaves a setter
parameter unchanged; a failed subs update can leave an earlier base change in
place. Constructor None and setter None have different source meanings.

`copy()` retains shallow subs storage and provider closures, while later scalar
replacement and diagnostic arrays are independent. Generic adapters retain the
live named handle. Both major and minor variants are `NamedLog`; direct object
queries preserve the original ascending/unsorted bounds behavior. Axis adapters
call the bound object and use its last owner's context.

The four raising callbacks are `bind_tick_space`, `bind_view_interval`,
`bind_minpos` and `bind_shared_minpos`, with corresponding provider getters.
Tick-space transports `LogTickSpace::Integer(BigInt)` or `Number(Double)`.
Real physical axis estimates use the Integer transport, including the original
NumPy integer clipping arithmetic; a custom Double callback retains floating
arithmetic. They can produce different original errors for very large decade
counts. `LogTickSpace::from_integer(Double)` preserves a finite integer-valued
physical estimate. It does not silently truncate arbitrary custom floats.

## Tick, minpos and view behavior

`tick_values` resolves the requested tick budget first, including its provider
read. It then checks the original lower bound: only `vmin <= 0` asks the last
owner for its own minimum positive data value. Invalid/nonpositive minpos gives
a source query error. Sorting happens afterward. Thus `tick_values(-2,100)` may
succeed while `tick_values(100,-2)` fails without reading minpos. A finite-bound
guard or pre-sort must not erase this distinction.

`nonsingular` uses shared-axis minpos, rather than the owner's own scalar. It
sorts first, returns [1,10] for nonfinite bounds, and warns/returns [1,10] for
finite ranges with no positive maximum. Other finite ranges always read shared
minpos, even if both endpoints are already positive and distinct. Unbound
positive nonsingular/view queries therefore fail. A nonfinite shared minimum
falls back to 1e-300. The source does not use tick_values' positive-finite
validation for finite manipulated zero or negative shared minima.

`view_limits` calls this nonsingular policy, then reads current
`axes.autolimit_mode` to optionally round to decades. Equal positive values
expand to strict neighboring decades. Construction captures the default
classic budget, while tick calculations additionally read current classic mode
to select historical or modern stride formulas. These are two observation
points. The class uses specialized NumPy log10/log2 paths, complete decade
bounds/dtype and source scalar arithmetic, not the old helper's approximation.
Sparse minor ticks can fall back to a newly constructed, unbound AutoLocator.

Raw minor Axis getters retain neighbors outside the view. Enabled overlap
removal uses transformed span times 1e-5, zero relative tolerance, and another
live major getter after the minor call. The new Log overlap profile uses
source LogTransform's default nonpositive clip to -1000. For majors
[0,1,10,100] and minor subs [-1,0,1,2] in view [1,100], the source returns 16
raw values and filters to [.1,.2,2,20,200]; negative and zero locations overlap
at the clipped transform value. SVG clips drawing separately. Existing global
legacy Scale behavior is not relabeled as a complete LogTransform migration.

## Scene, data and autoscale

`Axis.bind_minpos` and `get_minpos` expose local data minpos independently of
view limits or the other displayed scale. `bind_shared_minpos` and
`shared_minpos_checked` supply siblings in real Grouper order; detached axes
use their own singleton. Last explicit setter owns all providers. Removing an
owner rebinds installed locators to the first real remaining sibling, while an
outside copy retains the removed axis and its local data. Later plotted data
updates minpos through the existing local artist callback profile.

The SVG `artist_minpos` helper reuses the existing collector with only the
queried direction logarithmic and the other direction linear. Point paths use
the paired finite coordinate mask, so a point with an invalid other coordinate
does not supply minpos. Image minpos comes from extent endpoints, not pixel
centers; default 2-by-3 extent yields x=2.5 and y=1.5. Horizontal/vertical lines
and spans update only their data-coordinate direction; axes-coordinate 0..1
must not pollute the other data interval. The existing range collector also
records those bounds, so a lone y=500 horizontal line can drive log autoscale.

Boxplot value metadata includes quartiles and median as well as whiskers and
fliers. Fixed geometry uses box width .6 and cap width .2; both data intervals
and minpos include the corresponding endpoints. Actual original
`cbook.boxplot_stats` and `Axes.bxp` paths for
[-2,.001,10,20,100] produce vertical minpos [.7,.001], or [.001,.7] horizontally.
This is the explicit fixed-width profile. Quiver, Pie and other older artist
geometry have not received a new complete original-renderer survey here.

Checked autoscale follows original order: locator nonsingular, an independent
shared minpos collection and scale-domain limit, transformed margins and sticky
clamps, locator view_limits, then `_set_lim` finite validation, another locator
nonsingular and the axis' own minpos scale limit. In the singleton transport
profile this means four shared callbacks (three locator operations plus the
independent margin collection) and one final own callback. The source member's
minpos storage is read five times. Failure at the last nonsingular or own read
propagates through checked range/Scene/SVG calls. Explicit/provisional/group
views skip unused automatic-range work.

Original entire `autoscale_view`, `set_xbound`, and `Axis._set_lim` observations
include bad bases. Equal positive data 5 with margin .05 and base 0 fail source
finite limit validation. Base 1 preserves the singular [1,1] range and warns;
a later tick query can still fail. NaN base recovers [1,10] in data mode but
fails finite validation in round_numbers mode. New named range handling does
not apply the older generic finite fallback to hide these cases. Derived
physical range assertions use relative tolerance 1e-12 without an absolute
floor; direct locator tick/view/nonsingular reference values keep bit checks.

A secondary axis owns empty dataLim: own minpos is +Inf and shared is [+Inf].
It uses its own forward-transformed view, parent direction physical length and
its own font size. Its scale is function/functionlog. Positive Log ticks can
work, nonpositive lower ticks fail on empty minpos, while nonsingular can use
1e-300. Parent positives are not borrowed as secondary data. The checked SVG
and contour chain preserve source errors; replacing a bad locator permits
recovery. Full default units/scale/clear replacement and cached dataLim/relim
remain separate migration work.

`warnings()` returns a copy of the latest operation's diagnostics, with copied
arrays independent. It records source `_api.warn_external` messages; host
warning routing/stacklevel and logger behavior are not reimplemented. Source
Python exception categories map to checked Core data errors; provider Core
errors retain their error path. Legacy safe conveniences keep their contract.

## Reproduction and evidence

Run the fixed development CPython 3.12.14 / NumPy 2.3.5 runtime:

```sh
python3 scripts/generate_log_params_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_log_grid_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_log_axis_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_log_grid_power_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_log_grid_logarithm_reference.py /path/to/pinned/ticker.py --check
```

The parameter oracle has 183 generated and three hand tests: 53 constructors,
14 partial updates, 10 alias traces with four stages, 76 ranges with three
query modes, 11 provider cases, 13 integer transports, three classic/copy stages
and five unbound cases (367 observation stages).

The numeric oracle has 385 query cases and 110 IEEE helpers (495 generated),
four hand tests, three independent budget omissions, and three complete source
arrays of 125k/200k/125k elements. Additional source evidence fully enumerates
125002 elements to prove a fallback-visible tick can occur beyond the eager
prefix; a logical 1e12 auto-subs request uses original scalar multiplication
and count-only search rather than attempting unsafe enumeration. Budget
omissions remain distinct from source exceptions.

The axis oracle records six paired-Bbox profiles, eight image extents, two
fixed-width original boxplot path profiles, ten blended line/span profiles,
12 own/shared contexts with six queries each, two owner/deletion traces with
five stages and two queries, eight secondary fixtures with two queries, four
raw/overlap fixtures plus the nonpositive clip fixture, ten entire autoscale
outcomes, two late-provider failures and two integer/float budget failures.
It generates 33 Scene, 26 minpos and ten autoscale tests (69); six Scene and two
backend hand tests add checked errors, physical integer transport, contours,
SVG clipping and final provider counts (eight).

All locator, binding, grouping, overlap, bbox, extent, autoscale and limit
validation bodies execute their fixed original AST. Controlled fixtures supply
storage, numeric units, known transform protocols, data/path containers and
notification sinks. Original LogTransform and its inverse numerical bodies
execute directly. Boxplot uses original statistics, property normalization and
complete bxp body; fixed empty alias tables/Artist base and a plot callback
supply plain paths to original update_datalim. Blended line tests execute
original `_update_line_limits`; span rectangle containers supply known corners
and the original span method restores nondatacoordinate bounds. This does not
execute the original full renderer, patch hierarchy, GUI callbacks or units
system. No runtime Python/C or external dependency is added to the library.

Sources are pinned to Matplotlib commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`; all five generators verify their
source manifests. Additional axis evidence hashes:

| Source | SHA256 |
| --- | --- |
| ticker.py | 49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad |
| axis.py | f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0 |
| transforms.py | 109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8 |
| scale.py | 4800482469b280454eb6e7a48f866ae7b146b27d1395644ffc09df0e91c9d7c1 |
| image.py | 6e1f61a547b371da9bd3b20b65991a90ec73b370504fd4a87d11d1293b2e2a77 |
| axes/_base.py | ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b |
| axes/_axes.py | f61e1cb43575eca70b01c9c80f16d3015e91a8101fe9ce0cc3fdc3d80441c8a7 |

The fixed Darwin arm64 NumPy binary SHA256 is
`44fdecc68c23ac6dd5825dc124c801086f7f68dc15ab008ed584ed6a47be6305`.
This profile does not claim all NumPy builds choose identical floating bits.

## Portable numerical primitives

Finite integer exponents use a pure MoonBit correctly rounded power operation.
Directed BigInt intervals bound multiplication, reciprocal and exponentiation
by squaring; precision increases until both endpoints round to the same
binary64 value. The operation shares the existing exact binary-rounding helper
and does not depend on the target's libm. Minor locations reuse each decade's
power. IEEE special values and noninteger exponents keep the math helper path.

This is an explicit numerical compatibility boundary. The fixed Darwin libm
is not always correctly rounded: `nextafter(1, 0) ** -1` returns 1 there, while
exact rational arithmetic rounds to `1.0000000000000002`. Independent random
normal inputs also show this difference, so a special case for that one base
would not reproduce the platform's algorithm. The port adopts the correctly
rounded mathematical result for integer powers rather than copying a private
platform library. Original locator references retain their existing exact bit
expectations. Additional evidence records source bits and exact mathematical
bits separately; known differences are explicit, not silently widened numeric
tolerances. A bit-for-bit clone of every Darwin libm power result is outside
this portable profile.

The independent power reference has 458 input pairs, each with an exact
mathematical assertion and a separately observed source-profile assertion.
Exponents up to magnitude 2048 use exact Fraction arithmetic, including
halfway subnormal values. Larger exponents use the exact binary64 input with
Decimal precision 180 and 320, accepting a reference only after the rounded
results agree. Two pairs explicitly record differing source/mathematical bits:
the near-one reciprocal and a normal input `0x1.fb811bd86fa7ap+360` to exponent
-1. A complete original locator point query also records the deliberate
difference. These add 917 tests; the original 762 locator/axis tests keep their
existing expectations. This evidence does not assert that only two inputs in
the entire platform function differ.

Only the new Log decade helpers additionally use a correctly rounded natural
logarithm. Exact binary decomposition reduces the input to `m * 2^k`;
`2*atanh((m-1)/(m+1))` and the same series for ln(2) use directed fixed-point
BigInt bounds, an explicit geometric remainder and increasing precision.
Each logarithm rounds to Double before division, preserving the source's
operation order. For example, `ln(.01) / ln(10)` rounds to
`-1.9999999999999996`, so the original upward-decade helper returns `.1`.
The old non-JS math approximation instead made that ratio exactly -2.
Global math and the specialized log10/log2/generic tick-grid paths keep their
existing implementations. An independent 188-value Decimal180/320 reference
records actual NumPy log observations separately; this sample has no source
rounding differences. One complete original helper boundary test brings the
additional logarithm checks to 189.
