# Named ScalarFormatter reference

D31 is accepted: wasm, wasm-gc and native each pass 21486 tests; JS passes
21493. The 1685 new registered tests preserve 5706 individual validation cases,
including grouped source matrices. All five new reference checks pass. This
guide describes the named object and its explicit Axis/SVG installation. The older pure scalar-formatting
convenience helpers retain their established contract. Full implicit formatter
installation, Text layout, TeX rendering and OS font/locale discovery are separate
capabilities.

## State and checked lifecycle

`ScalarFormatter::new` captures the current offset/math/locale/TeX options and
offset threshold. `ScalarNumber` preserves Python Float, BigInt and Bool versus
NumPy Float64, Int64 and Bool origins. Constructor omission resolves the rc
offset option. In contrast, calling `set_use_offset(None)` stores the original
raw None state; it does not reset that option to rc. The other optional Bool
setters resolve their respective rc option on None.

Power limits retain their sequence or view, including Int64 dtype and aliasing;
only the original two-element shape requirement is checked on installation.
Copies retain the axis, locations and power-limit handles but copy the cached
offset, order, format and parameter slots independently. Changing a scientific,
math, TeX or power-limit option does not eagerly recompute cached numeric state.
The new preferred raw getters/setters are separate from upstream deprecated
descriptor spellings and their warning routing.

`set_locs` and `set_locs_view` store the original locations before numeric
preparation. Empty input retains cached numeric state. Each actual source stage
reads the current view independently, so callbacks, errors and partial writes
remain observable. Main and minor batches process their full raw locations
before visible ticks are selected. No 100000-element transport prefix is used;
the numeric reference includes a real 200001-point array whose last point
changes precision.

The named Scalar setters and `get_offset` raise checked Core errors. Base adds
`set_locs_checked`, `set_locs_view_checked` and `get_offset_checked`; existing
nonraising Base conveniences keep their signatures. Scene and SVG use the
checked path. Source errors carry their original class and message in
`Core.DataError::InvalidTicks`. NullLocator still skips the tick/format batch,
but complete original Axis.draw always reads the current major offset after
both groups. That read can report retained Scalar state or a late error.
Secondary visibility transforms occur before the final live offset read.

## Numeric preparation and profiles

Offset selection and scientific order use visible locations in their original
numeric domain. Final format inference uses the complete locations, including
offscreen/nonfinite values; it does not discard them or reuse the old pure
helper's precision cap. Int64 arithmetic retains its wrapping behavior, while
BigInt view endpoints keep exact comparisons where the original array supports
them. The NumPy refinement primitive uses staged multiplication, ties-even rint
and division with the pinned repeated-multiplication decimal factor. Python
rounding remains a separate exact-ratio path. NumPy spacing also preserves its
ufunc input domain: Boolean inputs use the float16 loop.

Integer and fractional decimal powers and BigInt log10 use adaptive directed
intervals, independently compared with stable Decimal evaluations. The numeric
JSON retains 2229 actual source observations and mathematical results alongside
one another; none differs in this corpus. This is distinct from the native
matrix-inverse coefficient differences below. Known unequal Int64 extrema that
collapse to one Float64 can make the original offset search nonterminating;
the port reports a narrowly proven Unsupported boundary. Powers whose required
BigInt bit length exceeds the representation's addressability have a separate
Resource boundary. Neither boundary is presented as a native source exception.

## Locale stages

`NumericLocale` supplies explicit decimal point, thousands separator and
borrowed grouping fields, independently of rc snapshots/reset. Its default is
the C numeric locale. Grouping follows the original CHAR_MAX=127, repeat-zero,
padding, finite negative-interval and separator rules. Width uses Python
codepoints while portable String addressability uses UTF16 units.

The implementation preserves the actual stdlib stages: locale's percent regex,
one-element argument tuple, native scalar percent conversion, numeric
localization, and the final String-tuple percent conversion. A format containing
multiple numeric conversions can therefore raise an IndexError before final
raw-format parsing. `%a` is absent from locale's regex but is valid in that final
native String pass, including its precision and padding. Literal format strings
and malformed directives are not silently accepted as ordinary labels.

In math mode the format is split at its literal commas; each part starts with a
fresh argument tuple, only introduced commas become `{,}`, and the original
commas are joined back. Unicode minus replacement applies to the entire final
result and reads the current rc option. Intermediate scalar and localized
strings have their own addressability domain; final tuple output and math comma
escaping separately check their remaining space. A padded Inf/NaN can shrink
when the original locale padding rule runs, so the final budget is not imposed
prematurely on its intermediate scalar string.

Three negative-repeat grouping fixtures execute the original stdlib until an
external 2000-line trace budget confirms its nonterminating loop. They are
recorded separately from source exceptions. The port reports the narrow
`Unsupported: locale negative repeated grouping does not terminate in CPython`
boundary. Valid precision 101/1100 and width 1001 outputs are exercised without
the old convenience caps. Huge source allocations are not run merely to test a
portable resource boundary; separate hand tests check those stages safely.

## Physical short labels and secondary timing

Ordinary integral short values and the masked singleton follow their original
early paths without reading axis context. Float short formatting uses the
actual axis view and, where installed, the actual physical pixel-neighbor
transform. Missing physical context falls back to the original view-span/1e4
rule. Data intervals, tick-space estimates and major locations are not fabricated
as additional Scalar axis dependencies.

The SVG profile uses 72 display units per inch. The forward affine explicitly
forms BboxFrom's `s=1/span`, `u=-lower*s`, followed by BboxTo's
`a=length*s`, `e=length*u+origin`; it transforms the value, moves by +/-1 display
unit, applies a separate inverse affine multiply and translation, and finally
the inverse scale. Algebraically cancelling the origin would change labels
near precision thresholds.

The original Darwin NumPy matrix inverse differs from the portable diagonal
closed-form profile in six observed coefficients. JSON retains both actual
`np.linalg.inv` results and an independent exact-Fraction inverse, without
rewriting source values. The portable profile uses `1/a` and `-e/a`, separately
rounded, followed by the original operation sequence. All six observed short
labels agree; this is not a claim of native LAPACK or general matrix inversion
bit parity. Existing nonlinear Scale geometry uses the established mathematical
tolerance profile rather than a new platform-library bit clone.

A secondary initially has its own constructor geometry: x uses figure width
and origin zero; y uses figure height and origin at the figure top. Frame
layout/draw moves the active geometry to the parent rectangle. Direct
`apply_aspect()` with no position restores the secondary's original constructor
physical bounds while synchronizing its view. Twenty complete-source x/y,
identity/affine and constructor/sync/layout/draw observations cover that timing.
Formatter copies and shared-axis removal preserve the actual last-owner binding.
The source default child-draw-before-primary ordering from D30 remains in force.

## Reproduction and evidence

The shared loader executes the complete original ScalarFormatter, real API and
deprecation machinery, `_val_or_rc`, cbook helpers and original scalar rc
validators. Its font branch executes real FontProperties/FontManager/findfont
with an explicit empty catalog. This is not OS font discovery or a simulated
positive font warning. Axis fixtures execute complete original formatter
installation, `_update_ticks`, Axis.draw, Bbox/transform bodies, Grouper/Figure
removal, SecondaryAxis, relevant base position/draw methods and Figure layout.
Known unit/Text/renderer storage sinks are listed in JSON; no Moon algorithm
generates expected labels, callback order or exceptions.

Locale has 3270 original queries: 2343 successes and 927 actual errors, plus
3 separately classified nontermination boundaries. Every source query retains
its complete assertions and independent cleanup in a private case function.
The framework registers 103 groups of at most 32 queries, 3 separate boundary
tests and 4 hand tests: 110 registered tests cover all 3270 original queries.
This grouping avoids V8's Wasm test-initializer local-variable limit; it does not
reduce source coverage or modify expected results. Group failures include the
original case id. JSON records source-query and registered-test counts separately.
Axis has 143 original stages plus 6 explicit inverse profiles, producing
129 Scene and 20 physical whitebox tests. Parameters contribute 80 tests
(76 generated and 4 hand-written) from 181 observations; numeric preparation
contributes 1315 tests (1313 generated and 2 boundary checks). The native
percent-operator matrix retains all 882 source cases in 28 registered groups,
plus 2 resource checks. Together with one configuration test, D31 adds
1685 registered tests without removing any case, expected value or assertion.

Matplotlib is pinned at commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`; `ticker.py` SHA256 is
`49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad`.
Fixed CPython 3.12.14 `locale.py` SHA256 is
`3988c5419552d5b9f0bef3695102376f79357f0f440e9cd1f32c501f966e6ef3`.
All other source hashes and the fixed NumPy 2.3.5 Darwin arm64 profile are
retained in the JSON. Mathematical primitive profiles remain explicit, with
original/native observations preserved separately. No runtime Python, NumPy or
new external dependency is introduced.

Using the fixed Python interpreter, run generation first, then the same command
with `--check`:

```text
scripts/generate_scalar_formatter_params_reference.py TICKER [--check]
scripts/generate_scalar_formatter_numeric_reference.py TICKER [--check]
scripts/generate_scalar_locale_reference.py TICKER [--check]
scripts/generate_scalar_axis_reference.py TICKER [--check]
scripts/generate_scalar_percent_reference.py [--check]
```

Dynamic Python reflection/operators, arbitrary multidimensional arrays, OS
locale mutation/discovery, full GUI/default lifecycle, native warning routing,
and complete Text/TeX/font rendering are outside this typed slice. Source-only
or budget-omitted records are not counted as passing parity tests.
