# Named EngFormatter reference

D32 is accepted: wasm, wasm-gc and native each pass 21548 tests; JS passes
21555. All five new source checks pass. The 62 new registered tests preserve
1740 individual validation cases, including 99 dictionary traces with 6200
operation steps. This slice adds the explicitly installed named engineering
object and its inherited Scalar state. The older engineering
convenience formatter keeps its established behavior. No implicit default
formatter lifecycle, GUI/Text/TeX implementation or font discovery is claimed.

## Object and inherited state

`EngFormatter::new` defaults to an empty unit, automatic places, a single-space
separator, and disabled automatic offset. MathText and TeX options resolve the
current rc values as in the original constructor; locale is initially disabled.
Unit, separator and raw optional `ScalarNumber` places remain live fields.
Precision is consumed by the original integer format-code rule rather than
silently truncated or clamped.

`as_base_formatter()` and `as_scalar_formatter()` retain the same object.
Inherited Scalar setters and raw cache getters use the latter view. Their
call/data/preparation/offset methods still dispatch to the Eng implementation;
the short-format method is the actual inherited Scalar behavior. Copies share
axis, locations and power-limit references but have independent inherited and
engineering scalar/cache slots. A shared handle is not a copy.

The prefix map is live. The default SI mapping has 21 entries from quecto to
quetta, using the micro sign U+00B5. `EngPrefixes` preserves typed numeric keys,
insertion order and mutable values; class fallback and instance override remain
distinct. An incomplete map is not silently filled with SI entries. Key, min/max,
lookup and promotion errors are delayed until the original consuming stage.
Parameter and numeric references describe the wider typed-map domain separately
from the default-SI axis examples here.

`EngPrefixes::new()` starts empty; `si()` constructs the SI table. The `_key`
lookup/mutation methods retain opaque `EngPrefixKey` handles, while ordinary
set/get/remove accept the six `ScalarNumber` origins. Replacement preserves the
first key's origin and iteration position. Class-table rebinding affects all
existing objects and copies without an override. Instance overrides are shared
by copies; rebinding one slot is independent, and `clear_prefixes()` resumes
current class lookup.

Matching uses the fixed CPython numeric hash modulus 2**61-1 before stored-key
numeric comparison. A nearby NumPy float and Python integer may compare equal
but have different hashes and remain separate; real hash collisions can instead
merge mathematically unequal values. The implementation retains the original
combined hash-table probe, tombstones, growth and copy/compaction rules. These
are observable when NumPy's weak equality is not transitive: after deletion and
reinsertion, the first matching probe can differ from iteration order. The
independent builtin-dict operation traces cover this behavior. Lookup/mutation
methods raise checked errors because genuine collisions can reach native
float/C-long conversion failures.

NaN handles preserve same-object lookup and distinct-object coexistence. Their
portable identity-hash profile is zero; native Python/NumPy NaN hashes derive
from process addresses. Mixed NaN/hash-collision probe behavior is consequently
a host boundary, including which huge-integer comparisons are reached. The
randomized parity traces omit this address-dependent mixed domain; isolated NaN
identity/copy observations remain in the parameter references. No process
address hash is frozen as a universal expected value. Arbitrary Python keys and
non-String unit/sep/prefix values are outside the typed dictionary domain.

Engineering data constructs `g` or `.Nf` before examining the value. Floating
places therefore fail through `:d` before NaN processing; negative integer places
construct a string successfully and can fail later. The true 4300-digit Python
integer-string limit remains distinct from portable output resource limits.
Data order uses floor(rounded-log10(value)/3)*3, followed by NumPy clipping in the
original bound domain. Out-of-range pure Python integer bounds are removed
before ufunc promotion. Fractional bounds affect the denominator before int(phase)
lookup. Empty maps, holes and NaN-first maps keep their late failures; custom wide
maps can expose IEEE underflow/overflow and are not clamped back to SI bounds.
The formatted mantissa can promote once, using the original unrounded mantissa.

The span's natural logarithm and ln(1000) each round separately before division.
Directed BigInt intervals and stable independent Decimal evaluations define the
portable mathematical profile. Original native observations are retained beside
it, including last-bit differences; no correctly rounded kernel is advertised
as a native libm bit clone. Math-mode offset text retains the source's nested
dollar delimiters and literal units.

## Preparation, calls and checked errors

Nonempty `set_locs` always reads the axis view, even when scientific and offset
options are disabled. It stores the original locations first. Automatic offset
then invokes inherited `_compute_offset`, which independently reads the view
again. If an offset was justified, Eng replaces it with the first captured
view's midpoint rounded to three decimal places. Engineering order is
`floor(log(span, 1000))*3` from that first view. Neither the inherited scientific
flag nor fixed power limits bypasses this step. Singleton precision preparation
reads the view once more; two or more locations use their full retained array.

Thus an automatic singleton reads three views; an automatic multi-location
batch reads two; forced/disabled offset uses one fewer. Each callback can change
the next result. Errors retain locations and any earlier cache writes. View
carrier origin matters: Int64 span subtraction can wrap, while a Python BigInt
span can write its engineering order before a later Float power overflows.

Empty locations skip preparation but retain numeric caches. In contrast to
Scalar's empty call, an Eng call with empty locations or zero offset immediately
formats the value in independent engineering notation. With nonempty locations
and nonzero offset, the call uses cached residual formatting. `format_data` and
its `format_eng` alias need no axis. They do not apply locale or whole-result
Unicode-minus replacement; `call` and `get_offset` apply the latter afterward,
including minus signs inside literal unit text. Later enabling inherited locale
affects residual and cursor formatting while engineering f-string output keeps
its original decimal convention.

Named preparation, batch, data, short and offset paths use checked Core errors.
Original exception class and message are preserved in
`Core.DataError::InvalidTicks`. Valid output has no legacy precision-100 or
width-1000 clamp; String addressability is an explicit resource boundary.
Native runtime warnings and separately omitted huge source allocations are not
relabelled as original exceptions.

## Axis, shared ownership and final offset

Primary and minor full raw tick locations are prepared and formatted before
display filtering. With view `[1000000,1000004]`, automatic offset and unit Hz,
major values `[1000000,1000002,1000004]` produce `−2`, `0`, `2`, then final
offset text `1 Hz+1 MHz`. Retained offscreen neighbors also participate in
precision and callbacks. The named batch does not add a transport prefix cap.

The complete original Axis.draw reads the current major offset after both
batches and visibility transforms. If the same Eng object formats singleton
minor `[1000001]`, that later preparation resets its automatic offset; the
earlier major labels remain unchanged but final offset is empty. A minor
callback changing unit to `s` instead changes final offset to `1 s+1 Ms`.
Changing places to -1 can succeed through all labels and fail only at final
offset formatting. The checked renderer propagates that late error.

NullLocator skips the group's preparation and value formatting, while complete
draw still asks the current named major formatter for offset. Previously
prepared Eng state can therefore retain visible offset text under Null. A fresh
empty object returns empty offset. Zero offset suppresses the engineering
multiplier text even if cached order is nonzero.

Shared formatters use the last setter's local axis view. Removing that owner
rebinds the installed object to the first remaining shared sibling, while an
external copy retains the removed owner's binding. Axis references execute
the original formatter setters, Grouper and Figure removal bodies, rather than
generating these expectations with the Moon binding implementation.

## Secondary and cursor context

Secondary formatters read their own stored numeric view. Parent changes do not
eagerly replace it; explicit `apply_aspect` or the established frame synchronization
updates it. The child-draw-before-primary timing accepted in D30 remains in
effect. The secondary inverse visibility transform can change Eng parameters
after batches; final offset must read that live state. Both x/y source probes
with an inverse callback changing unit to `after` return exactly
`1 after+2.00001 Mafter`.

The inherited short formatter uses the D31 physical pixel-neighbor provider,
not engineering prefixes or units. Integral and masked early paths remain
unchanged; a dummy context uses view-span/1e4. Ordinary axes use actual active
display origin/length and existing Scale transforms in the fixed SVG72 profile.
Twenty complete original secondary constructor, direct sync, frame layout,
child draw and subsequent direct-sync stages retain D31's physical timing.
For a 1000x800 figure and a 100x80 parent rectangle, identity short output
changes from `0.123` at constructor geometry to `0.12` in the frame and back
after direct `apply_aspect()` restores original physical bounds.

D31's source/native matrix-inverse evidence and separate portable diagonal
mathematical profile remain applicable to this inherited method. The forward
Bbox composition and separate inverse multiply/translation are preserved;
there is no new native LAPACK, affine C-kernel or arbitrary GUI bit-parity claim.
Only log parents retain the already established special secondary display-scale
classification. No new geometry or generic axis-provider protocol is needed.

## Sources and reproduction

The shared `load_eng_formatter` executes the complete original Eng class after
the accepted full Scalar/Formatter/API/deprecation namespace. Real RcParams,
cbook, `_val_or_rc` and the documented empty font-catalog profile are retained.
Axis references additionally run original formatter installation, `_update_ticks`,
Axis.draw, Bbox interval getters, Grouper/Figure removal, SecondaryAxis and
relevant complete base/Figure geometry methods. Identity units, Text storage,
renderer/GUI sinks and the inherited NumPy affine primitive are explicit.
No Moon engine supplies expected labels, callback order, cached state or errors.

The axis reference records 108 original observations: 93 successes,
11 ValueErrors, 3 OverflowErrors and 1 AttributeError. All 88 regular and 20
physical case bodies retain independent cleanup and explicit source ids. They
register as three Scene groups and one physical whitebox group, at most 32
cases each, to avoid the Wasm test-initializer local-variable limit. Four
registered tests therefore preserve all 108 original cases and their assertions.
Other parameter/numeric/dispatch totals are recorded in their respective JSON
and the final migration checkpoint; source-only and budget records are separate.

The [parameter reference](eng_formatter_params_README.md) contributes 365 cases
in 12 registered groups, from 431 original observations and 54 separately
classified source-only records. The [numeric reference](eng_formatter_numeric_README.md)
contributes 1163 cases in 37 groups plus two resource/nontermination tests.
Its six numerical primitive differences and seven native-warning-only differences
retain both profiles; complete labels and exceptions agree. Axis contributes
108 cases in four groups. Three dispatch regressions and the 99 builtin-dict
traces in four groups complete the total. A grouped test retains every case's
assertions and cleanup; registered-test counts are not source-query counts.

Matplotlib is pinned at commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`. The full `ticker.py` SHA256 is
`49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad`;
the complete Eng class segment SHA256 is
`08220e46b87854bc79a9573fbe4cb441c8067c9d734f6917d1ff170ddd342e09`.
Other original source hashes, fixed CPython 3.12.14 / NumPy 2.3.5 Darwin arm64
metadata and host boundaries are in JSON. Numerical references distinguish
native observations and independent mathematical profiles; source expectations
are not hand-edited to match a port result. No runtime Python/NumPy or new
external dependency is introduced.

Generate with the fixed Python interpreter, then repeat with `--check`:

```text
scripts/generate_eng_formatter_params_reference.py TICKER [--check]
scripts/generate_eng_formatter_numeric_reference.py TICKER [--check]
scripts/generate_eng_formatter_axis_reference.py TICKER [--check]
scripts/generate_eng_dispatch_reference.py TICKER [--check]
scripts/generate_eng_prefix_trace_reference.py TICKER [--check]
```

The typed numerical/profile domain is distinct from arbitrary Python operator
overloading, reflection, multidimensional arrays and native warning routing.
Full implicit defaults, GUI/font discovery and complete Text/TeX rendering
remain outside this explicitly installed named formatter slice.
