# LogFormatter family object and parameter references

D33 is accepted with all four project targets and all four new source checks
passing. The 500 parameter cases retain independent cleanup in 16 groups.

`scripts/generate_log_formatter_params_reference.py` executes complete original
Matplotlib v3.11.2 `LogFormatter`, `LogFormatterExponent`,
`LogFormatterMathtext`, and `LogFormatterSciNotation` classes. The explicit
`load_log_formatters` branch adds original `_is_close_to_int`, cbook
`strip_math` and context-managed `_setattr_cm`, and transforms `_nonsingular`.
It reuses the accepted real API/deprecation/RcParams loader and real scalar
validators. Controlled view/transform fixtures are identified separately; this
reference does not emulate a renderer or replace original numerical methods.

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_log_formatter_params_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_log_formatter_params_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py --check
```

The payload preserves 934 observations and 500 executable private cases in 16
registered groups of at most 32 cases. Every case has independent configuration
and `defer` cleanup. Grouping preserves all cases and assertions while keeping
the Wasm module initializer manageable. There are 21 additional source-only
records for custom-object/container truth and unsupported NumPy shapes.

The fixed runtime is CPython 3.12.14 / NumPy 2.3.5. The ticker.py SHA256 is
`49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad`;
cbook.py is `e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643`,
and transforms.py is
`109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8`.
The JSON records all source dependency hashes and the explicit host profile.
The accepted basic/string/percent/Scalar/Eng loader branches remain unchanged.

`LogValue` retains standard Text, six raw numeric origins, and explicit None.
Only constructor/set_base converts through native `float`; a failed conversion
preserves the previous base. Zero, one, negative and nonfinite bases remain
constructible and fail at the original later stage when applicable. Numeric
origins, Unicode digits and whitespace, underscores, invalid Text, and None
errors are source-derived. Label truth and linthresh remain raw values.
The larger native float-text grammar has a separate independent reference.

`LogThresholdTuple` copies its constructor array and every exported values
array. Default immutable tuples capture classic mode and retain shared identity
across same-style constructors and shallow copies. Explicit Sequence arrays
and signed, nested, zero-stride, and Int64 NumPy views remain borrowed. They
preserve live length, dtype, and owner mutation in both directions. There is no
eager two-element validation: `[0]` can finish before index 1, while `[100]`
can fail later at index 1. Extra values remain unread.

Appended empty/one-element Float64 and Int64 view cases preserve NumPy's raw
index/axis-size `IndexError` diagnostics, including negative indices. Borrowed
list pop/append/clear cases read the current length at each operation. The first
469 cases and their source expectations remain unchanged.

The source `set_locs` ignores its argument entirely and does not replace the
inherited `_locs`. Empty input still prepares from context. The typed direct
method therefore supports `set_locs()` and `set_locs(locations=values)`;
`set_locs_view(values)` is the positional view bridge. Base checked methods
retain their existing positional signatures and dispatch before saving input
for this family. Batch formatting still enumerates its actual input values.

Private cache fixtures are explicitly whitebox observations: the original
`_sublabels={13}` or `{1}` is paired with the internal explicit-cache helper.
This does not expose a public arbitrary set mutation API. Public `sublabels()`
returns a full independent sorted snapshot. Copies share the current internal
cache, borrowed threshold store, and axis; scalar slot rebinding is independent.
Successful preparation replaces only that object's cache slot; failed
preparation retains its old cache. Parameter setters do not clear stale caches.

Derived parent views retain one Base identity and the most derived virtual
implementation. `format_data` temporarily disables only labelOnlyBase, invokes
the derived call, strips math, and restores the exact original slot in finally,
including after callback mutation or failure. It retains sublabel filtering.
All four short-format paths need no axis and preserve ASCII negative zero.
All four inherited offsets are empty. Numerical labels, cache algorithms,
live rc, actual Axis lifecycle, and Scene integration have separate references.

Arbitrary Python float/index/truth protocols and NumPy 0D/2D parameter shapes
remain recorded source-only domains. Public raw cache-set mutation and direct
private `_base` rewriting are not claimed. No source errors are substituted by
resource limits, no expected values come from the MoonBit implementation, and
the existing pure logarithmic helper retains its previous interface/behavior.
