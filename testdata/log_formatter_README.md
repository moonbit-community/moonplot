# Named LogFormatter family reference

D33 is accepted: wasm, wasm-gc and native each pass 21700 tests; JS passes
21707. All four new source checks pass, and the additional exact midpoint hand
assertions pass on all four targets. This slice exposes
the complete explicitly installed LogFormatter, LogFormatterExponent,
LogFormatterMathtext and LogFormatterSciNotation family. The older convenient
logarithmic formatter retains its established interface. Full implicit default
installation, GUI/font discovery and complete Text/TeX rendering remain later
migration work.

## Live objects and parameters

All four objects derive from BaseFormatter. Their live family views share the
same object; an explicit copy has independent parameter and cache slots while
sharing referenced axis, retained locations and borrowed threshold containers.
The base-family downcast recognizes every derived object; Mathtext recognizes
SciNotation as well. This family does not inherit ScalarFormatter.

`LogValue` preserves the six accepted ScalarNumber origins, Text and NoneValue.
The base constructor and setter perform the original float conversion before
replacing the stored Double. Text accepts Unicode decimal digits, underscores,
native decimal rounding, outer Unicode whitespace, signed zero/NaN and overflow
to infinity. Invalid text retains the full native exception representation.
The independent builtin float corpus covers 2152 cases, including every one of
Unicode 15's 660 decimal digits, exact binary64 midpoint neighborhoods, range
boundaries and 5000-digit inputs. Lone Python surrogates have no MoonBit String
representation and are outside this text bridge.

Label-only mode remains a raw live value. Thresholds preserve an immutable
LogThresholdTuple, a borrowed Sequence or one-dimensional TickValues NdArray,
or an unvalidated raw scalar. Tuple construction and `values()` copy arrays;
constructor defaults share immutable handles for `(1, 0.4)` or classic `(0, 0)`.
Constructor None chooses that default, whereas a later setter storing None
retains actual None and fails only at the original consuming stage. No eager
two-element validation replaces source indexing and its late errors.

`set_locs()` accepts an optional labelled `locations` argument. The additional
typed bridge `set_locs_view(values)` is positional. Both ignore the supplied
locations and prepare from the live axis context, without assigning retained
locations. A batch still enumerates its supplied values. Even an empty batch
refreshes the sublabel cache; NullLocator skips the complete batch and therefore
retains it. This distinction is covered through the actual Axis pipeline.

## Numeric behavior and generated sublabels

Logarithms of the value and base round separately before division. The portable
mathematical profile uses directed BigInt intervals and independent stable
Decimal reference evaluations. Positive fractional powers handle exact rational
roots separately and refine logarithm/exponential bounds otherwise. This avoids
an arbitrary fixed-precision approximation or exponent clamp. Original native
libm observations remain alongside the mathematical profile, including differing
labels; mathematical correctness is not advertised as Darwin libm bit parity.

Preparation preserves source ordering: inspect threshold zero, return early for
either infinity, optionally probe the actual transform's linthresh, then read
and sort the view. Only AttributeError from the transform probe is swallowed.
Explicit non-None linthresh bypasses that probe. Threshold indexing, NumPy dtype
conversion, negative/zero/NaN bases and arithmetic errors remain late. A failure
retains the old cache until an actual source assignment replaces it.

The generated cache represents the complete arange or rounded geomspace set,
including its full source shape and separately forced endpoint. Membership
uses that complete logical set without a 100000-point transport cap. The
readonly `sublabels()` snapshot returns every unique coefficient in sorted
order, skipping repeated plateaus; source set iteration order is not a public
ordering contract. Array addressability is a separate checked resource limit.
There is no public arbitrary mutable Python-set protocol. Rounded coefficients
queried by the formatter are exactly representable binary64 integers, which is
the domain supporting this generated-set membership representation.

Zero returns before base or context work. Other calls compute the logarithm,
decade test and coefficient before applying label-only and cached-subset gates.
Plain LogFormatter and Exponent then consume the view; Mathtext and SciNotation
calls need no axis. Plain/Exponent discard a negative input's sign as in the
source; the mathematical variants retain the source's ASCII sign in math text.
Int64 minimum absolute-value wrap and arbitrary Python-integer logarithms keep
their original typed arithmetic behavior.

`format_data` temporarily disables raw label-only mode, invokes the derived
call, strips math through the source replacement order and restores the exact
old raw value after success or error. Cached subset filtering still applies.
`format_data_short` is native `%-12g` with trailing spaces removed and has no
axis or physical cursor dependency. Offset is always the empty string.
Mathtext's minimum exponent is a live arbitrary-precision integer config value;
RcParams snapshots and reset preserve the established independent-copy rules.

## Axis integration and evidence

Primary Axis bindings expose their current scale's optional symlog linthresh.
Secondary and dummy bindings have no such attribute; a secondary function
transform does not inherit a parent's threshold. The focused
[Axis reference](log_formatter_axis_README.md) preserves 200 original
observations in seven registered groups, plus two hand tests. It includes
actual transforms, full raw major/minor batches before visibility, NullLocator,
shared-owner removal, empty preparation and complete Axis.draw's late current
offset lookup. No extra generic Python transform protocol is invented.

Parameter and numeric evidence have independent generators and guides. Source
observations, mathematical-profile values, source-only dynamic domains,
CPU/allocation omissions and registered-test counts are recorded separately.
Grouping at most 32 independent case calls per registered test preserves every
assertion and cleanup while avoiding the Wasm initializer local-variable limit.

The [parameter reference](log_formatter_params_README.md) has 500 cases in
16 groups, from 934 original observations, with 21 additional source-only
records. The [numeric reference](log_formatter_numeric_README.md) has 1589
numeric cases in 50 groups, 109 mathematical cases in four groups and four
hand tests. Axis contributes 200 cases in seven groups and two hand tests.
The 2152 builtin float cases occupy 68 groups, with one separate config test.
Together these are 152 registered tests retaining 4557 validation cases;
source queries and primitive-profile comparisons have their own counts.

Matplotlib is pinned at commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`. The full ticker.py SHA256 is
`49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad`.
All four complete original class hashes and required helper hashes are retained
in the JSON references. The shared loader executes original classes, real
Formatter/API/RcParams and the original helper functions. No Moon algorithm
supplies source expected values. The fixed reference environment is CPython
3.12.14, NumPy 2.3.5, Unicode 15, Darwin arm64. No new runtime dependency is
introduced.

Generate with the fixed Python interpreter, then repeat with `--check`:

```text
scripts/generate_log_formatter_params_reference.py TICKER [--check]
scripts/generate_log_formatter_numeric_reference.py [--check]
scripts/generate_log_formatter_axis_reference.py TICKER [--check]
scripts/generate_log_float_text_reference.py [--check]
```

Arbitrary Python operators, dynamic subclasses/reflection, multidimensional
arrays and native warning delivery are separate documented boundaries. The
global migration remains active after acceptance of this named family.
