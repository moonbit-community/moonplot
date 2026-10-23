# D38 built-in units and typed locator reference

The independent generator executes pinned Matplotlib 3.11.2 source rather than
the Moon port or an installed Matplotlib package. It emits 90 cases: 23 units
scenarios with 49 observable stages, plus 67 locator/range cases (36 Date,
12 Category and 19 complete autoscale chains). Three new main-package groups
carry 72 cases (at most 32 each). The other 18 custom-epoch cases run through
the existing isolated integration/epoch_2000 registered test, via the generated
verify_units_lifecycle_epoch_reference helper after that driver selects2000.
Every case failure retains its original number and label. Numeric date epoch is
locked at first conversion/get_epoch; changing config.date_epoch later changes
only the fallback and cannot isolate test cases. DateParserContext controls
clock/local timezone, not epoch. No production reset or new epoch API is added.
The original JSON and all 90 case expectations remain byte-for-byte unchanged;
the helper relocation corrects the first full run's mixed-epoch fixture error.
Moon acceptance remains
Root-owned; generator/check success is not a compilation or test result.

The units source assembly uses complete original Axis init/clear/default setters,
update_units/_update_axisinfo/_set_converter/set_converter/set_units/convert_units,
actual units Registry/native numeric checks/AxisInfo, complete category classes,
complete date classes with actual timezone/epoch helpers, real default RcParams,
real deprecation helpers, cbook finite/native helpers and CallbackRegistry.
CallbackRegistry uses its supported exception_handler=None mode to propagate
injected callback errors. No converter or formatter algorithm is replaced by a
port implementation. The source returns from `load_units_source(ticker_path)`
are its namespace, Axis host class and Axes host class.

Shared source units fixtures execute the complete original `sharex`, creating
both real Grouper membership and common major/minor Ticker holders. The generated
Axis whitebox fixture projects that same graph through shared tickers and an
ordered unit-group provider. It does not mistake a Grouper-only graph with
independent tickers for Scene sharing. Numeric Bbox storage, axis presentation
and the units-event observer are declared host capabilities.

The units matrix checks independent four-slot default flags; manual major/minor
locators and live named formatters; first versus repeated category input; common
mutable UnitData mapping/identity across peers; converter metadata independent
of that common unit and ticker state; naïve and aware date input; rc-only changes
versus a later timezone change; explicit DateConverter selection; empty typed
sequences; scale reset followed by same-converter data; and ordered callback
failures with partial unit/slot writes. It also preserves original category and
date formatter outputs/offsets, and manual formatter identity. An implicit
switchable date converter is live at axisinfo time; original ConciseDateConverter
resets requested interval_multiples=False toTrue through its parent constructor.

The range matrix uses the original real Locator parent for Date/Category NS and
view_limits. Category inherits .05 nonsingular and .001 view limits; it has no
category-specific half-unit padding. DateLocator expands sufficiently narrow
spans according to that locator's actual unit/interval; AutoDateLocator expands
only equal points by two years. Their view_limits remains inherited .001 policy.
The 19 full-source range observations execute original autoscale_view,
set_xbound and Axis._set_lim. Moon whitebox checks compose the production
candidate kernel with its local finalizer under the same controlled raw-data,
initial-view and minpos context. This does not claim a separate Scene recache or
render implementation. All 67 original numeric outputs were compared with the
D38 read-only observations and retained exactly, including fractional microsecond
intervals and custom-epoch fallback values. Finite numbers use exact bits;
nonfinite inputs are tagged in JSON and NaN classification is explicit.

The selected Date locator is seeded directly in the range fixture, matching the
source explicit locator assignment. Its initial view is controlled independently
from units. Thus the empty [0,1] autoscale context is not confused with a custom
Date epoch's already-mutated default-interval view after a converter event.
DateTime plot convenience inputs remain aware instants; the explicit units
adapter uses RRuleDateTime to distinguish naïve from aware inputs.

This formal unit profile calls explicit Axis update methods. Actual Axes plotting
first checks have_units (converter OR unit); converter-less peers with a common
unit may discover a converter during convert_units without running default_units
or axisinfo. The explicit-update matrix must not be misreported as an oracle for
that different producer route. Root/B/C Scene and backend regressions cover
production integration, ownership and pending-range behavior separately.

The following preparation observations are not additional registered cases or a
claim that arbitrary Python inputs are supported: empty ndarray string/datetime
inference needs explicit dtype transport; heterogeneous category values can
partially append mapping before ConversionError; replacing a category unit with
a date converter can emit a warning and fail with a native object-address repr;
explicit arbitrary converter equality and registry reflection are dynamic Python
protocols. The frozen typed adapters represent homogeneous strings and explicit
naïve/aware dates, built-in converter/tag state and checked callbacks. Cross-tag
errors and any newly reachable typed operation remain required production work;
this reference does not label them supported merely by recording a source-only
boundary. Native warning-host routing and arbitrary object repr are separate
from the stable state/checked-error assertions here. The earlier 24 preparation
queries are kept as ignored evidence, not silently counted as these 90 cases.

Raw category replacement/reordering requires original artist data for recache.
This reference's category evolution is append-only. It does not alter the existing
persistent ticker/category convenience helper into a mutable object. Likewise,
unit-event observers isolate Axis sequencing; they do not simulate arbitrary
Artist recache or pretend to execute full graphical Axes construction.

The fixed dependency sources are downloaded only into the ignored cache when
missing and verified before execution:

- units.py SHA256 ecefa595cf24dc6a5da2d52cdad59c1068285071d7f98ee8d11edffb526f7b79
- category.py SHA256 52c67cadb003007f7a61fa630fe3750cb4dc4bf710c25b332084366516a25a6e

Both URLs are the official `matplotlib/matplotlib` v3.11.2 tag under
`lib/matplotlib/`. JSON includes those and the inherited source hashes plus the
actually executed NumPy binary hash. The accepted D28–D37 loaders and their
checked-in outputs are unchanged.

Run from the repository root:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_units_lifecycle_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_units_lifecycle_reference.py --check
```

The runtime is fixed CPython 3.12.14 / NumPy 2.3.5. Stdin-only moonfmt formats the
generated test file; Root performs all project interfaces/checks/four-target
behavior gates after parallel writers have stopped.

Production acceptance: 42 new registered tests (three main reference groups plus
39 directed tests), with the 18 epoch-2000 cases called by the already existing
isolated epoch test. The final full run passed wasm/wasm-gc/native 21934 each and
JS 21941, zero failures. Root reviewed all 324 interface-diff lines. Independent
integer-format probes also checked actual Python integer origins, decimal limits,
unused huge inputs and percentage arithmetic/error order. Existing convenience
converter/timezone configurations are captured into producer state; inferred unit
timezones remain separate from an explicit convenience timezone override.
