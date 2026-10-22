# Named SymmetricalLogLocator reference

D25 is accepted: wasm, wasm-gc and native each pass 10055 tests; JS passes
10062 tests. The slice adds 480 tests. All three new source reference checks,
info/format and the full check pass; eight pre-existing Ref deprecation warnings
remain. The interface diff was reviewed. The project goal remains in progress.

`SymmetricalLogLocator::new(transform?, base?, linthresh?, subs~ = None)` captures
an existing `Scale::SymLog`'s base and linear threshold, in that order. Its
linear stretch is irrelevant to tick generation. A supplied transform takes
precedence over explicit scalar fields; a different Scale variant errors.
Without a transform both explicit fields are required, and their complete
Double domain is retained for source-compatible deferred behavior.

`SymLogSubs::Values(TickValues)` retains borrowed Float64/Int64 storage and
signed, nested or zero strides. `Text` and `Number` retain scalar inputs whose
unsized errors occur only if a general grid consumes them. Omitted/None subs
creates fresh `[1]`. `LogNumTicks` retains Text, Double or exact BigInt; the
default is integer15. `set_params` updates numticks before subs and leaves
omitted fields alone. The object stores replacement slots independently when
copied, while borrowed buffers and bound view providers remain shared.

`as_locator` and `as_minor_locator` expose live handles. Direct `tick_values`
returns an independent Array, preserving source decade/subs order, duplicate
values, zero expansion and out-of-view neighbors. The simple linear range
sorts the bounds and zero before touching parameters otherwise unused there.
The general grid does not globally sort, clip or deduplicate. `call` reads its
bound owner's view once. Shared axis installation follows the last setter;
deletion rebinds installed major/minor locators to the first source-ordered
remaining sibling, while external copies retain the detached owner.

`nonsingular` retains the inherited `.05` expansion. `view_limits` reads the
current data/round_numbers setting, sorts, rounds strict/equal decades when
requested, then applies `.001` nonsingular expansion. Zero endpoints retain
the source Python-float division protocol: with a zero base, strict decade
expansion can raise a checked error, while NumPy-scalar division retains IEEE
behavior. Checked Axis, Scene,
secondary, SVG and contour calls propagate source-derived locator errors.
Contours still require finite, increasing levels, so valid raw negative subs
order may be unsuitable as contour levels without explicit caller choices.

The existing Scale helper keeps its threshold1 default and finite/positive
validation; source `SymmetricalLogScale` defaults to threshold2. Its two private
numerical bodies now follow the source's separate natural logarithms and
`exp(exponent * ln(base))` expression order. This avoids overflowing
`abs(value)/linthresh` in a finite forward transform. It does not migrate all
scale constructors, default-locator resets, unit handling or renderer lifecycle.
Raw Scale fields express source-accepted NaN/Inf transform profiles separately
from the intentionally stricter convenience factory.

Axis minor overlap uses the actual scale transform, a span-relative `1e-5`
tolerance, and source NumPy `isclose` reference-side semantics. With infinite
span, an infinite reference major only removes an exactly equal minor; a finite
reference can remove infinite minors when the tolerance itself is infinite.
The getter keeps raw neighbors; SVG clips the transformed result at drawing.

Secondary axes use their own converted view. Source only selects `functionlog`
for an exact log parent. A symlog parent selects `function(inverse)` and an
affine normalization of inverse coordinates. With parent `[-100,100]`,
forward `2*x+5`, inverse `(x-5)/2`, secondary105 is at normalized `.75` in both
x and y; mapping through the parent symlog instead would incorrectly give about
`.94644`. Log parent `[1,100]` retains the logarithmic control profile. The
formal reference executes the original complete transform tree with fixed
numeric bboxes, not a copied normalization formula.

The parameter reference contains 147 generated and 3 hand tests:
45 constructors, 21 updates observed before/after consumption, 10 aliases with
4 stages, 70 ranges queried through 3 methods and 5 view/copy stages. The axis/scale
reference contains 74 generated tests: 26 forward/inverse profiles, 14 raw
Axis/overlap profiles, 12 view/nonsingular profiles, x/y owner and shared-removal
traces, and 4 complete secondary transform-tree fixtures with drawing checks.
Four additional hand tests exercise checked Scene/contour/SVG errors, source raw
contour order, visible primary minor grids, and actual secondary x/y SVG line
positions. The independent grid reference has 250 cases observed through both
the original NumPy AST and an independent mathematical primitive profile:
204 successes, 44 real source query errors and 2 explicit budget omissions per
profile. It generates 248 assertion tests plus 4 hand tests. Budget omissions
remain JSON evidence rather than synthetic errors or empty tests. Full source
125000-negative and 200001-cross-zero grids verify the port's 100000 prefix.
Three base3/exponent34 profiles retain both the original platform value and
the correctly rounded mathematical value, following the declared D24 boundary.
Exact acceptance results and continuation actions are recorded in the checkpoint.

Reproduce the source observations with the fixed CPython3.12.14 / NumPy2.3.5
Darwin arm64 environment:

```sh
python3 scripts/generate_symlog_params_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_symlog_grid_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_symlog_axis_reference.py /path/to/pinned/ticker.py --check
```

Source commit: `d3ca9172e392048ec242b90e8423e88d1a3000b2`. The generators verify
the original files before compiling AST bodies, including:

| source | SHA256 |
| --- | --- |
| ticker.py | 49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad |
| transforms.py | 109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8 |
| axis.py | f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0 |
| scale.py | 4800482469b280454eb6e7a48f866ae7b146b27d1395644ffc09df0e91c9d7c1 |
| axes/_base.py | ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b |
| axes/_secondary_axes.py | b2aaaae077e03ff6538d1a4bf8a69c3476eed0e27120aa567de138c794599a93 |

The axis oracle reuses the committed source loader, executes complete original
Transform/Bbox/scale bodies and actual locator/Axis binding and deletion
methods. Its affine C kernel is a stated matrix-multiplication sink. Tick/text
notifications, identity units and already-valid explicit limit storage are
controlled fixtures. It does not execute fonts, glyphs, an installed Matplotlib
renderer, a layout engine or full default lifecycle. Direct locator arrays stay
bit-exact; Scale primitive and derived physical coordinates use relative
`1e-12` with no absolute floor, explicit NaN/Inf classification and signed-zero
checks. D24's portable integer-power/natural-log mathematical contract and
recorded platform-libm boundary continue to apply. No new runtime dependency,
Python/C runtime call, or arbitrary dtype conversion is introduced.
