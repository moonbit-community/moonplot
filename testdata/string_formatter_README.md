# Named string formatters

D29 is accepted. Original-source generation and six `--check` runs, unified
Moon checks, interface review, and four-target full tests passed. There are 5161
new tests; wasm/wasm-gc/native each pass 17508/17508, JS passes 17515/17515.
The eight pre-existing Ref deprecation warnings remain; there are no new warnings.

`FormatStrFormatter` and `StrMethodFormatter` are live named objects extending
the D28 `BaseFormatter` pipeline. `new(fmt)`, `fmt()` and `set_fmt(fmt)` retain an
unvalidated String slot; malformed syntax reports an error when formatted.
Copies have independent format slots and share current locations and axis
identity. Offset is always empty. These classes do not acquire the Func-only
offset setter or a fabricated parameter-update method.

Use `as_base_formatter()` with the existing primary/secondary named formatter
setters. Full major ticks are formatted before querying/formatting minor ticks
and before visibility filtering. Secondary formatting consumes its own tick
values before display inversion. The same objects, checked callback/error
transport and shared-axis last-owner binding introduced in D28 are reused.
This slice does not install an entire implicit formatter/default lifecycle or
claim full Text/MathText/GUI parity.

## Scalar origins and errors

Direct calls and `format_ticks(Array[Double])` retain Python-float formatting
semantics. `format_ticks_view(TickValues)` retains the actual Float64 or Int64
element origin. Float64/Int64 NumPy-style `!r`/`!a` representations therefore
include `np.float64(...)`/`np.int64(...)`; integer views retain all 64 bits.
For Int64 9007199254740993, default or `d` gives `9007199254740993`, while a
floating presentation `.0f` follows the original conversion and gives
`9007199254740992`. Existing D28 Func callbacks keep their accepted Double
argument contract.

Original formatting errors propagate through `Core.DataError::InvalidTicks`,
with the Python exception class prefixed to the message. Parsing, field lookup,
conversion, nested-spec evaluation and formatting keep the original order.
Unknown fields, malformed braces and invalid numeric specifications are errors;
the new named engines do not return an unprocessed format string as a fallback.
Explicit representation/domain boundaries use `Unsupported:` or `ResourceError:`
and are recorded separately from original Python error parity.

The old immutable `Formatter` enum and `format_str_formatter` /
`str_method_formatter` convenience helpers retain their accepted bounded,
permissive behavior. In particular, the legacy `{value}` alias and convenience
`{x:d}` conversion are not added to the new named StrMethod source contract.

## Percent strings

`FormatStrFormatter` applies the original scalar `%` operation to x; pos is
ignored. The named engine handles escapes, flags, widths, precision and length
modifiers; e/E/f/F/g/G, exact d/i/u, integer o/x/X/c and str/repr/ascii
presentations retain their source type distinctions and error order.
Its ASCII minus output remains ASCII, independently of `axes.unicode_minus`.
The actual NumPy scalar mapping-slot errors are retained rather than being
replaced with Python-float mapping errors.

## Replacement fields

`StrMethodFormatter` supplies exactly keyword roots `x` and `pos` to the original
replacement-field model. Direct pos may be None; batch positions are enumerated
integers. Empty/numbered positional fields have no supplied positional argument.
Escaped braces, repeated fields, `!s`/`!r`/`!a`, recursive width/precision fields
and the original recursion-depth/error order are supported.

Float presentations include empty, e/E/f/F/g/G/n/%; int fields additionally
support b/c/d/o/x/X and exact integer grouping. Converted strings use string
alignment/truncation rules. None accepts an empty specification, and conversion
such as `!s` explicitly changes it to a string. Fill/alignment, sign, z, #, zero
padding, comma/underscore grouping, Unicode decimal Nd widths/precision and
negative zero after rounding retain their respective source behavior.

Stable scalar suffixes include real/imag, integer numerator/denominator,
`__class__.__name__` and positive decimal String indexing, including Unicode Nd
digits. Arbitrary reflection, dtype objects, custom operators/objects and
address-bearing method representations are explicit typed boundaries. The
reference records retain the original success/error alongside that boundary;
they are not counted as source-parity assertions. A host address in one excluded
method repr is explicitly normalized in metadata for reproducibility.

Unicode minus is applied to every completed replacement field, including nested
fields, after its conversion/formatting. It replaces ASCII hyphens in numeric
signs, exponents, fill and formatted string content, while literal text stays
unchanged. The setting is read dynamically per field. A nested negative pos can
therefore produce a U+2212 in an outer format specification and trigger the
original error; applying a single replacement to the final label would differ.

Shared numeric helpers reuse exact BigInt binary ratios and ties-to-even decimal
rounding without the legacy precision-100/width-1000 policy. Empty float format
uses Python shortest notation, including `.0`, signed zero and exponent rules;
it is distinct from the six-significant-digit `g` default. Locale-dependent n is
verified against a fixed C locale; mutable locale infrastructure is deferred.

## Resource and representation boundaries

No arbitrary small valid-width/precision cap or formatter batch prefix is
introduced. The source actually formats precision 101/1100, width 1001 and a
full 125001-element Int64 batch in the replacement-field reference. Existing
numeric locator caps remain the individual locators' separate contract.
Width beyond portable Moon String Int32 addressability raises `ResourceError:`
after earlier applicable source syntax/type errors. Huge valid source allocations
are independent budget omissions, never fabricated Python exceptions. Astral
fill counts characters for width and checks the resulting String addressability.

Python integer c can produce an unpaired surrogate; the source success is
retained, while the portable typed String path reports `Unsupported:`. Valid
Unicode scalar output, including astral characters, remains supported. These
boundaries do not extend to complete dynamic Python formatting semantics.

## Independent references and reproduction

The shared `formatter_reference_source.load_string_formatters` executes the nine
complete original basic/string classes and real `_api`/deprecation descriptors.
The original `string.Formatter`, native parser/field splitter, builtin Python
formatting and actual NumPy scalar operations supply the engine expectations.
No Moon formatting algorithm is used to generate expected output. The existing
D28 default loader/hash metadata remains unchanged.

Fixed Matplotlib commit: `d3ca9172e392048ec242b90e8423e88d1a3000b2`.
`ticker.py` SHA256:
`49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad`.
CPython 3.12.14 `string.py` SHA256:
`24aeae1f0526250f442022022bf98df9a823b1cb330543ee79e70e44907462e9`.
NumPy 2.3.5 Darwin arm64 core SHA256:
`44fdecc68c23ac6dd5825dc124c801086f7f68dc15ab008ed584ed6a47be6305`.
API, deprecation and rc hashes are included in each generated JSON.
Python/NumPy are source-reference tools, not runtime dependencies.

Run the fixed Python interpreter from the repository root, passing
`.moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py` as the positional
argument to each script; generate first, then repeat with `--check`:

```text
scripts/generate_string_formatter_params_reference.py TICKER [--check]
scripts/generate_formatstr_formatter_reference.py TICKER [--check]
scripts/generate_strmethod_formatter_reference.py TICKER [--check]
scripts/generate_string_formatter_numeric_reference.py TICKER [--check]
scripts/generate_string_formatter_axis_reference.py TICKER [--check]
scripts/generate_formatter_unicode_reference.py [--check]
```

Object references have 215 original observations, 61 generated + 2 hand tests;
18 additional dynamic-object observations are source-only. Percent references
contain 2874 query tests: 2563 original successes, 303 original errors and 8
separately labeled surrogate boundaries, plus 7 hand tests. Five huge valid
percent outputs are independent allocation omissions.

Replacement references contain 1973 direct/dtype queries: 1496 original
successes and 477 original errors; 4 actual full-batch/view profiles and 7
separately labeled reflection/surrogate boundaries produce 1984 generated tests.
There are 6 additional hand tests for resource ordering, literal/sign/grouping
budgets, astral addressability, explicit reflection boundaries and preserving
the legacy helper policy. Native prefix-overflow order, explicit NUL type
distinctions and fixed Unicode 15 KeyError representations are covered separately.
One huge valid replacement output is an independent allocation omission.
All source checks and integrated acceptance passed. Independent root numeric
references contribute 162 grouped tests with 4767 float/repr assertions and
four exact Int64 mask groups; one additional mask test covers shape validation,
signed-zero bits and fresh-copy behavior. Full original Axis batches contribute
64 tests covering primary/secondary x/y, dtype, overlap, visible SVG labels and
offscreen error timing.

The private repr/KeyError printability table freezes actual CPython Unicode15.0.0
classification across all 1114112 code points. Invalid-format-specifier messages
retain the original literal spec rather than applying repr quoting. The table
is generated reference data; it does not add a Python runtime requirement.
