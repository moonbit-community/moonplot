# Named LogitLocator and explicit probability geometry

D27 is accepted. The final interface review, formatting, all-target checks and
three original-source reference checks passed. The explicit scope boundaries
below remain unchanged.

`@ticker.LogitLocator::new(minor=false)` shares one live `MaxNLocator` state.
Omitted `nbins` selects Auto; explicit `nbins=None` selects Count10. A selected
`MaxNBins::Count` keeps the D22 Int32 domain, including zero/negative values whose
errors occur when consumed. The default steps are fresh Int64 `[1,2,5,10]`.
`as_maxn_locator()` exposes the same parameter state and its inherited getters,
setters, TickValues aliases and extended-step snapshot. Calling that base handle's
numeric methods uses MaxN behavior; the Logit object's `call` and `tick_values`
use the source probability algorithm.

`set_params` updates optional minor first, then preserves MaxN validation order,
partial writes and nested-None reset semantics. Bool minor is a typed subset of
Python's arbitrary truthy values. `copy()` retains provider closures and shallow
step-buffer aliases while scalar parameters and diagnostic storage are independent.
`warnings()` returns a copy of the latest numerical operation's Data warning
snapshot, a typed port API rather than an upstream per-object warning list.
Python warning routing/stacklevel and MAXTICKS logging remain separate boundaries.

Auto's first physical tick-space read has only a minimum of 2. Wide ideal grids
must not inherit MaxN's maximum-9 clip. A zoomed major query then falls through to
the same live MaxN kernel and re-reads physical space, using its normal clip and
projection adjustment. Minor zoom returns empty before that fallback. Projection
`polar` rejects direct probability ticks before space/minpos; inherited MaxN
`view_limits` instead reads projection only in its normal round_numbers path and
does not apply that polar rejection. The `3d` fallback adjustment is `step*23/24`
with two operations. These projection names are source query contexts, not 3D or
polar renderers in this library.

The bound locator reads its own view and raw local minpos. Finite intersecting
bounds read minpos even when already strictly inside `(0,1)`; only wholly invalid
or nonfinite bounds recover the standard `(1e-7,1-1e-7)` without that read. Finite
raw minpos is preserved over the full Double domain: .9 can produce inverted
(.9,.1), and 0/negative/1/2 can cause late source integer-log errors. Missing
providers fail at the source read once any provider is bound; only a fully
unbound object gets defaults. The only context required by inherited data-mode
`view_limits` is the rc value, because that method uses MaxN's own nonsingular.

Raw ticks preserve source order, outer neighbors, duplicate near-one values and
underflow zeroes. Generic checked adapters dispatch this named object before
legacy finite/range guards. Axis minor queries call the raw minor object before
transformed overlap removal; SVG visibility is a later step. Setting a shared
live object on another axis changes the owner used everywhere that object is
installed. Copies retain the old owner. Removing a shared owner rebinds installed
major/minor locators to the source-ranked first remaining axis; external copies
retain the removed owner and its data/view callbacks.

## Explicit Scale geometry

`@scale.logit_scale(nonpositive="mask")` accepts exactly `mask` or `clip`, yielding
`Scale::Logit(clip=...)`. `is_logit()` and `logit_nonpositive()` describe it.
Both modes have the strict valid-data domain `0 < value < 1`; infinities, NaN,
zero and one are invalid. Forward order is exactly `log10(value/(1-value))`.
Mask produces NaN outside the closed endpoints and infinities at 0/1. Clip replaces
values `<=0` by -1000 and `>=1` by +1000 after the source expression; NaN remains
NaN. Inverse is exactly `1/(1+10**(-value))`, including under/overflow and rounding
to exact 0 or 1. Geometry uses the existing relative scientific profile, not a
claim of Apple libm bit identity.

`Scale::limit_range_for_scale(lower,upper,minpos)` centralizes the actual scale's
source restriction. Logit substitutes minpos at lower<=0 and 1-minpos at upper>=1,
replacing only nonfinite minpos by 1e-7. It neither validates finite minpos nor
reorders. Log preserves its 1e-300 fallback and nonpositive endpoint rule;
Linear/SymLog/Asinh retain identity restrictions. The named locator and coordinate
scale remain independent; installing one does not change the other.

Scale convenience ticks are a separate display-uniform sampler, default count6.
They require finite strictly interior original endpoints, use at least two
samples, retain direction and exact endpoints, and return a singleton for equal
valid endpoints. Any nonfinite transform/inverse or computed inverse outside the
strict probability domain returns empty. The 100000 output cap retains the full
requested interpolation denominator. This convenience policy does not install
LogitLocator or reproduce its default ticks/formatter lifecycle.

## Axis and SVG integration profile

The active non-tight source pipeline uses raw shared data intervals, then locator
nonsingular with the last owner's own minpos, a separate shared raw-minpos
reduction, the actual Scale restriction, transformed margins/stickies, inherited
view_limits, finite validation, another locator nonsingular, the current axis's
own scale restriction and final direction sorting. Ordinary singleton source
therefore reads own minpos three times and shared metadata once. A shared locator
owner may differ from the axis requesting autoscale; both contexts are preserved.

Explicit `Axis.set_limits` and `set_view_limits` on the Logit scale use the source
finite validation/nonsingular/actual-scale restriction/sort sequence. They accept
finite outside-domain inputs for source clamping instead of rejecting them through
`is_valid`. For minpos.9, (-1,2) becomes approximately(.1,.9); for minpos2, source
non-tight autoscale can retain the abnormal finite view(1e-12,2). Tests preserve
those results instead of normalizing them into an invented fallback.

Primary minor overlap uses the real logit transform and transformed view span;
no early range clip occurs. Mask and clip can remove different invalid raw minor
values even though they share `is_valid`. Secondary axes preserve their own mapped
view, physical size, empty local data/minpos and function transform. The existing
source rule treats only an exact log parent specially; a Logit parent still gives
a function secondary, whose positions use inverse-function linear normalization.

This slice verifies finite in-domain SVG data, transformed ticks, aspect and
checked error propagation. It does not claim full off-domain clip artist-path
connection/clipping parity: source transforms preserve vertices at ±1000, while
existing SVG artist guards first apply strict validity. Actual upstream blended
Path observations are retained in JSON as source-only evidence. Full persistent
`tight` autoscale/default locator/LogitFormatter lifecycle also remains later
work; the existing `autoscale(tight=true)` zero-margin convenience is not that
source lifecycle. Source-only tight observations record their different late
error outcomes without fabricating corresponding passing Moon parity tests.

## Original-source references and reproduction

All original source is pinned to Matplotlib v3.11.2 commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`. The axis oracle executes complete
original LogitLocator, Logit/Logistic transforms, LogitScale, Axis methods,
Grouper/removal, Secondary methods, transforms tree and autoscale→set_bound→_set_lim
bodies. Bboxes/minpos storage, identity units, formatter/tick/GUI notifications and
affine matrix kernel are explicit controlled fixtures. Physical budget fixtures
execute original X/Y get_tick_space and font-size methods at the established
72-dpi SVG profile. This is independent source execution, not Moon production
used as an oracle or a claim to run the installed Matplotlib renderer.

- Parameter reference: 117 generated + 4 hand tests; 32 constructors, 17 partial
  updates, 4 minor-property stages, 4 aliases×3 stages, 62 context ranges and
  4 provider/copy stages.
- Axis/geometry reference: 114 generated + 10 hand tests. Original profiles are
  4 transform, 4 invalid mode, 40 actual-scale restriction, 7 raw minor/visible,
  4 transformed overlap, 8 explicit setter, 20 non-tight autoscale, 2 shared owner
  autoscale, 2 aspect, 2 owner, 2 shared removal, 4 secondary, 6 physical budget and
  2 fixed-Bbox layouts. The same setter cases verify explicit/provisional storage.
- Source-only JSON preserves 4 tight profiles, 2 actual blended-Path profiles and
  2 invalid-other-axis layout observations (the other Logit view left at[0,1]);
  they are not counted as passing Moon parity tests.
- Full-grid reference: 290 queries through both complete original AST profiles
  plus 341 full phase powers; 629 generated + 4 hand tests. Each profile records
  241 successful queries, 47 real source errors and 2 separate allocation-budget
  omissions. Actual-source/mathematical Logit profiles currently have no differing
  outputs; both are retained. Complete MaxN fallback arrays125001/200001 and
  pruned199999 are evaluated before checking the port's100000 prefix. Extreme
  raw minor2710 retains2702unique/8zero values. The inherited MaxN profile has one
  precise correction: the two decimal integer powers in `scale_range` now use
  the existing portable correctly rounded power implementation. A non-JS failure
  traced to the old `pow(10,-4)` result being one ULP low; complete original AST
  and independent Fraction evidence agree with the portable result. All other
  MaxN arithmetic retains its established profile. A standalone MaxN regression
  covers this correction.

The accepted D27 total is 879 new tests: parameter 121, grid 633, axis/geometry 124
and the standalone MaxN regression 1. Final wasm, wasm-gc and native each passed
11995/11995; JS passed 12002/12002. All three parameter/grid/axis source `--check`
runs passed. `moon info`/formatting and the interface review passed; all-target
checking completed 31 tasks with zero errors and the 8 existing Ref warnings.
These results do not extend acceptance to the source-only tight/off-domain-path
observations, full default lifecycle or other renderers.

Run each generation before its dependent `--check` using fixed CPython3.12.14 and
Darwin arm64 NumPy2.3.5:

```sh
python3 scripts/generate_logit_params_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_logit_grid_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_logit_axis_reference.py /path/to/pinned/ticker.py --check
```

Source SHA256 values are stored in each JSON. Principal originals:

- ticker.py: `49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad`
- scale.py: `4800482469b280454eb6e7a48f866ae7b146b27d1395644ffc09df0e91c9d7c1`
- axis.py: `f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0`
- transforms.py: `109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8`
- axes/_base.py: `ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b`
- secondary: `b2aaaae077e03ff6538d1a4bf8a69c3476eed0e27120aa567de138c794599a93`
- NumPy binary: `44fdecc68c23ac6dd5825dc124c801086f7f68dc15ab008ed584ed6a47be6305`

No new dependencies, runtime Python/C calls or Mathplotlib source-version claims
are introduced. The pinned source license/attribution continues through
docs/THIRD_PARTY_NOTICES.md and the existing dependency policy.
