# Named AsinhLocator and minimal Asinh geometry

D26 has passed unified source, interface and four-target verification. This
guide records its accepted scope and the remaining compatibility boundaries.

`AsinhLocator::new(linear_width, numticks?, symthresh~=.2, base~=10, subs~=None)`
stores raw parameters. Omitted numticks selects Python integer11; explicit None
is retained and fails later when the source consumes an integer count. Integer,
Double and text counts retain their different behavior: Double11.0 is not
silently converted to integer11. The full Double width/base/symmetry domain is
retained. Constructor validation is separate from coordinate-Scale validation.

`AsinhSubs::Sequence(Array[Double])` borrows a numeric sequence with live length
and sequence truth. `NdArray(TickValues)` retains Float64/Int64 views and ndarray
truth, where size0 and size>1 error and size1 uses the element. `Number` and
`Text` preserve scalar constructor inputs. Raw setters replace slots directly;
`set_params` updates numticks, symthresh, base, then subs. Empty subs resets to
None; a scalar len error leaves earlier writes applied and keeps the old subs
slot. Omitted/None setter fields keep their previous values. Copies retain
shared sequence/view storage and providers but independent replaceable slots.
Readonly tuple mutation, heterogeneous sequences, arbitrary Python objects and
multidimensional ndarrays are outside this typed representation.

`call` reads only its bound owner's view once. It applies the original product
`lower*upper < 0` and strict relative symmetry test before optionally forwarding
symmetric bounds. Direct ticks ignore that owner and symmetry setting. Named
major/minor adapters retain live handles; shared-axis setters retain the last
owner, and deletion rebinds installed objects to a remaining source-ordered
sibling. External copies retain the detached owner. Inherited view_limits and
nonsingular are pure `.001` and `.05` policies, independent of fields, rc,
physical tick space and minpos. No MAXTICKS warning/logger is synthesized.

The locator's complete source stage order remains transform, full linspace,
zero handling, inverse transform, base/subs rounding, full collection decision,
fallback if fewer than two values, then returned100000 prefix. Bounds are not
pre-sorted; fallback can retain reversed direction. The independent grid
reference keeps actual Darwin arrays and a portable mathematical profile as
separate full collections. Correctly rounded hyperbolic/log primitives can
change an entire collection near rounding thresholds. The source's NaN set
ordering is genuinely nondeterministic; the declared deterministic profile
sorts numeric values, retains first-ranked zero sign, preserves NaN multiplicity
and places NaNs last. These are explicit compatibility boundaries, not ignored
tests or tolerances on locator collections. Oracle allocation omissions are
recorded separately from actual source errors.

`Scale::Asinh(linear_width~)` and `asinh_scale(linear_width~=1)` provide minimal
coordinate geometry. The factory rejects exactly width<=0, preserving the
source's acceptance of NaN and positive infinity. The formulas are
`width * asinh(value / width)` and `width * sinh(value / width)` using core math.
The division occurs first, including real source ratio overflow; it is not
replaced by a stabilized whole-expression formula. The finite input domain
includes negatives and either zero, with no minpos restriction. Locator width
and axis geometry width remain independent, and installing the locator never
changes the axis scale.

The Scale variant is the coordinate component of source AsinhScale. It does
not implement full base coercion, automatic minor multipliers, default locator
or formatter installation, units, clear/reset lifecycle or every renderer.
Pair `asinh_scale` with an explicitly installed named AsinhLocator to obtain the
migrated source tick strategy. The Scale package stays independent of Ticker.

`Scale.tick_values` for Asinh is a convenience display sampler with default
count6, separate from the named locator's default11 and rounding/subs behavior.
It requires finite original and transformed endpoints, retains a singleton for
equal endpoints, clamps counts below2, and preserves direction. It uses finite
delta interpolation or an opposite-sign convex combination if delta overflows,
forces returned actual endpoints to the original bounds, and returns empty if
a computed inverse sample is nonfinite. At most100000 values are materialized,
using the full requested count denominator rather than a capped grid.

Axis overlap uses the actual Asinh transform and the existing source `isclose`
profile. For view[-100,100], major100.005 and a default Asinh minor, true Asinh
overlap removes minor100 while Linear keeps it. The raw getter retains outer
neighbors; SVG performs final transformed visibility filtering. Secondary axes
keep D25's only-log special case: an Asinh parent uses its own function(inverse)
view/overlap/display mapping, not the parent Asinh transform after inverse.

The axis/geometry generator executes complete original Transform/Bbox,
AsinhLocator/Scale/forward/inverse classes, actual Axis overlap/visibility and
shared deletion, full autoscale_view through Axis._set_lim, and full
get_data_ratio/apply_aspect. Known numeric bboxes, identity units, formatter/tick
notifications, GUI/position sinks and an affine matrix-multiply C-kernel sink
define its fixture boundary. It does not run an installed Matplotlib renderer
or silently implement its full default lifecycle.

Delivered axis/geometry evidence has 60 generated tests: 16 constructor/forward/
inverse profiles; 8 raw/overlap/visible axis profiles; 8 inherited-range profiles;
x/y owner and shared-delete traces; 2 secondary transform trees; 6 complete
autoscale pipelines; 4 full aspect profiles; and 2 fixed-bbox layout profiles.
Eight hand tests cover geometry classification, convenience sampler boundaries,
full-count prefix and overflowing span, checked Scene/contour/SVG errors, width
independence, visible minor grids and actual secondary x/y SVG positions.
Primitive geometry/display comparisons use relative1e-12 without an absolute
floor, classify NaN/Inf explicitly and retain signed zero. Common direct
locator arrays stay bit-exact. Independent parameter evidence has104generated
plus3hand tests, and the separate primitive oracle has399 observations
(asinh129/sinh125/log10 145). Its eight current source/math differences are
all asinh and are separate from grid collection differences. Grid totals and
unified Moon results are recorded below.

The grid reference records482 complete dual-AST cases per profile:436 successful
queries,43 actual source errors and3 explicit allocation omissions. It generates
483 tests (479 query cases and4 original NumPy linspace scalar-sampling probes),
with4 additional descriptor/rank hand tests. Actual full arrays include125000
samples followed by fallback,200001 samples deduplicated to17 ticks, and375000
outer values deduplicated to350000 ticks. The42 source/math collection differences
retain39 near-power boundary cases,2 tiny-width cases and one inherited3^34
integer-power profile difference. None is changed into a tolerance assertion.

The initial linspace descriptor separates the Python integer request from the
actual Float64 arange shape. NumPy's `_calc_length` uses true division and then
ceil: request2^53+1 yields shape2^53, while2^53+3 yields2^53+4. The step divisor
still uses the original request minus one, the zero threshold uses the request,
and the forced endpoint belongs to the actual shape. Whole-byte shape failures
include integer requests just below2^60 that round up. Original C source/hash
and safe scalar probes are retained in the grid JSON; giant-array allocation
omissions do not become source errors. Decimal-rounded numeric runs are split
by constant powers before merging, since adjacent rounded powers can otherwise
make an output step backwards. NaN counts and first flattened zero ranks are
preserved through the complete collection/fallback decision.

The unified Moon checks pass: info and formatting; reviewed public
interfaces; check-all with8 existing Ref warnings and no new warnings; wasm,
wasm-gc and native11116/11116 each; JavaScript11123/11123. D26 adds1061 tests:
parameter107, primitive399, grid487 and axis/geometry68. All four independent
source generators pass `--check`; the grid check reproduces all39 screened
boundary differences and preserves the separate allocation omissions.

Reproduce source observations using the fixed CPython3.12.14 / NumPy2.3.5 Darwin
arm64 environment:

```sh
python3 scripts/generate_asinh_params_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_asinh_math_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_asinh_grid_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_asinh_axis_reference.py /path/to/pinned/ticker.py --check
```

Pinned Matplotlib commit: `d3ca9172e392048ec242b90e8423e88d1a3000b2`. The loader
checks original source hashes before AST compilation, including:

| source | SHA256 |
| --- | --- |
| ticker.py | 49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad |
| transforms.py | 109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8 |
| axis.py | f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0 |
| scale.py | 4800482469b280454eb6e7a48f866ae7b146b27d1395644ffc09df0e91c9d7c1 |
| axes/_base.py | ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b |
| axes/_secondary_axes.py | b2aaaae077e03ff6538d1a4bf8a69c3476eed0e27120aa567de138c794599a93 |

NumPy binary SHA256 is
`44fdecc68c23ac6dd5825dc124c801086f7f68dc15ab008ed584ed6a47be6305`.
Core geometry math is not an Apple/libm bit clone; the named locator uses the
independently checked portable primitive contract. No runtime Python/C call,
new external dependency or private platform-library clone is introduced.
