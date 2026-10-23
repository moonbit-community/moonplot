# Named LogitFormatter reference

D34 is accepted. Current cumulative verification covers 21823 tests on wasm,
wasm-gc and native, and 21830 on JS. The global migration remains active.

The named `LogitFormatter` derives from the live `BaseFormatter` and can be
installed through the existing major/minor Axis pipeline. Its five constructor
parameters retain raw `LogValue` values without eager conversion. Only the four
source setters are exposed. Ordinary calls require no axis, rc, font, locale,
view or transform metadata. Offset is always empty.

`set_locs` first copies the numeric input into an owning ndarray snapshot, then
clears the shared mutable label set. Its ideal-value scan and selected labels
still consume the original input objects. A failed copy retains the old state;
later failure retains the new snapshot and any cleared or partially populated
set. A shallow copy has independent parameter/location slots while sharing the
label-set holder, so preparation through either copy can change the other's
minor filtering. The fresh inherited locations value is an empty list; it is
different from the empty ndarray produced by successful empty preparation.

The Double-array bridge creates Python-float identities for a whole batch.
`TickValues` reads produce fresh NumPy scalars, as ndarray iteration does.
The explicit `LogitKey` bridge preserves caller-owned identities and the six
`ScalarNumber` origins, including exact Python integers. NaN membership uses
identity, not an invented numeric equality or positional shortcut. Portable NaN
hashes are zero; native address-dependent collision behavior is a host boundary.

`FormatterLocations` additionally supports readonly `NumericArray` snapshots
for Bool, UInt64 and Object dtypes. Array promotion follows original `np.array`
observations. `FormatterLocations.dtype()` distinguishes sequence storage from
each ndarray dtype, including empty snapshots. `get_value` retains numeric origins where represented; UInt64
projects to an exact Python integer in the six-origin carrier, and
`get_uint64` offers exact UInt64 access. Raw multidimensional arrays, arbitrary
Python operators/reflection and deprecated mutable raw ndarray attributes are
outside this typed bridge.

Numeric preparation preserves reciprocal, subtraction, NumPy logarithm, unary
negative, diff, minimum and sum as separate stages. It selects the tail of the
actual sorted indices, including zero and negative count slicing behavior.
NaN tuple keys are a partial order: their result can depend on the comparison
sequence. The specialized sorter follows the fixed CPython 3.12.14 powersort
protocol at every length. The mutable set separately preserves CPython probe
and rehash order. Neither path truncates complete arrays at 100000 elements.

Calls apply minor membership before the domain check. Decade detection uses
separately rounded natural logs and the original NumPy tolerances; printed
exponents consume their separate log10 stage. Scientific formatting multiplies
by the exact integer power before reading location length, preserving tiny-value
overflow. Precision uses the complete second-nearest distance, including
duplicate and NaN behavior, before the source's rounding and minimum clamp.
Ordinary Float64 results use the NumPy numeric NaN-last order. Object-array
distances instead retain original scalar comparisons and NumPy's generic
quicksort/introsort protocol, including its heapsort fallback; their NaNs must
not be silently moved to the end. This distinction can change both precision
and whether formatting raises a NaN/infinity conversion error.
Math markup, overline and raw half-label string conversion follow the source.

Inherited `format_data` invokes the same derived call and retains math markup
and minor filtering. Short formatting independently uses native `:e`/`:f`
conversion at precision six, with ASCII signs; it does not consume locations.
Batch formatting prepares once, and the ordinary Axis protocol prepares full
raw batches before overlap/visibility filtering. NullLocator skips the batch;
shared/removal/secondary behavior uses existing live bindings and draw's late
current-offset lookup.

The fixed upstream commit is `d3ca9172e392048ec242b90e8423e88d1a3000b2`,
ticker.py SHA256
`49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad`.
The full original LogitFormatter class SHA256 is
`38685127398f0dd97b97cb053f9fe172c2adff6be9b0d394df16eab869b58194`.
Independent generators execute the complete original class, real Formatter
and actual Axis bodies in fixed Python3.12.14/NumPy2.3.5, with native numerical
observations separated from the portable mathematical profile. Primitive and
source differences, CPU/allocation omissions and dynamic-only inputs belong
in the individual evidence guides and are not counted as passing Moon tests.

Evidence is split into [parameter](logit_formatter_params_README.md),
[numerical](logit_formatter_numeric_README.md) and
[actual Axis](logit_formatter_axis_README.md) references, plus the independent
[tuple sort](logit_sort_README.md), [numeric set](logit_set_README.md) and
[object-distance sort](logit_object_sort_README.md) references. Together they contain 123 registered tests
retaining 3779 validation cases: parameter 637/20 groups, numerical 2417/78,
Axis 147/5, tuple sort 248/8, numeric set 109 traces plus one growth case in
five tests, and object sort 220/7. Set traces additionally retain 6548 individual
operation steps; source-stage observations have separate counts in each guide.
The complete suite initially exposed nine fixture-construction failures per
target. Only the two affected reference files changed: singleton-tail RLE
encoding and the source NumPy Bool singleton alias. All 13 tests in those files
then passed on all four targets; production and other passing tests were
unchanged. Actual source outputs remained unchanged. Only derived RLE/alias
metadata was corrected, with machine comparisons recorded in the checkpoint.
Final info/fmt/check passed with eight existing warnings, and the reviewed
93-line interface diff remained byte-identical. All six source checks pass.
These counts are validation evidence, not API coverage.

Reproduce with the fixed Python interpreter:

```text
scripts/generate_logit_formatter_params_reference.py TICKER [--check]
scripts/generate_logit_formatter_numeric_reference.py [--check]
scripts/generate_logit_formatter_axis_reference.py TICKER [--check]
scripts/generate_logit_sort_reference.py [--check]
scripts/generate_logit_set_reference.py [--check]
scripts/generate_logit_object_sort_reference.py [--check]
```
