# Original Line unit-recache reference

This reference executes pinned Matplotlib v3.11.2 source methods in CPython
3.12.14 / NumPy 2.3.5. It never calls the MoonBit implementation to generate
expected values.

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_units_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_units_reference.py --check
```

The optional positional argument is the fixed local `ticker.py` path. The
loader rejects other source trees. Generation writes only
`testdata/line_units_reference.json` and
`scene/line_units_reference_wbtest.mbt`. `--check` independently reruns the source
and checks both files byte for byte. Stdin `moonfmt` formats generated MoonBit;
formatting is not a Moon compiler or behavior gate.

## Counts and coverage

There are **24 original-source operation observations**. **19 controlled typed
cases** are emitted in **1 registered test group**, with each case isolated by
its own function/configuration defer and labelled error diagnostics. These are
not 19 registered tests. **5 source-only cases** remain in the JSON and generate
no assertions that imply an unavailable public Line object API.

Cases 00–14 retain the complete before/after states, errors and traces of the
15 original planning observations. Their existing fields were compared exactly
against the planning payload after JSON normalization; none was changed to fit
production behavior.

| Source IDs | Original behavior | Moon projection |
| --- | --- | --- |
| 00–04 | First/repeated reordered map, omitted labels appended, same handle no-op, new equal-content handle recache | Actual Scene units callback with controlled original-coordinate/point sidecar |
| 05 | Changing x units force-reconverts both original coordinates | Same; y originals deliberately differ from cached y |
| 06 | Earlier Line commits; later y conversion fails and discovers a converter; subsequent Lines and dataLim remain old | Same; pending raw y is seeded privately |
| 07 | Broadcast failure after both conversions keeps current Line/cache and old dataLim | Same; pending unequal original lengths are seeded privately |
| 08 | Setter input copy survives caller-list mutation | Private attach helper's original-coordinate copy; no claim of a public setter |
| 09–13 | Borrowed original mutation, lazy getters, explicit lazy set_xdata, getter-triggered recache, set_data partial x write | Source-only public lazy Line protocol |
| 14 | Singleton original broadcasts without replacing original length | Private forced recache |
| 15–17 | Category x/Date y, Date x/category y, timezone-only change | Actual unit callbacks; original aware Date values retained with exact offsets |
| 18–20 | Actual shared Ticker/Grouper success and failures in either member | Real shared Scene panels; ordered partial assignment/recache checked |
| 21–22 | Empty/singleton 0↔1 broadcasts to zero vertices | Controlled private recache through actual units callback |
| 23 | Category append survives a subsequent broadcast error | Same; unit map changes while the points buffer stays old |

Assertions compare finite numeric data using exact IEEE binary64 bits, and
check NaN by classification. No tolerance or edited original expectation is
used. Snapshots include unit mappings/converter state, original coordinates,
processed/path vertices, dataLim/minpos, ignore flag, invalid flags and stale
view flags. The source trace retains x/y conversion, per-Line recache,
relim/request order. The Moon projection checks observable partial states,
original-coordinate values and the exact shared artist/sidecar points-buffer
identity; it does not invent a public Python Line cache/Path handle.

## Pinned source and loader

New original source:

- [Matplotlib v3.11.2 lines.py](https://raw.githubusercontent.com/matplotlib/matplotlib/v3.11.2/lib/matplotlib/lines.py)
- SHA-256 `e928511cec1f9ce19455008c1863d337b0dbd1c71ac2b8d40224c8d5c069e05c`
- 60047 bytes, cached only in ignored
  `.moonagent/checkpoints/D39-source/lines.py`; download and reuse both verify
  the exact SHA before AST execution.

`scripts/generate_line_units_reference.py::load_line_source(path)` exposes the
source namespace and source Axis/Axes/Line host classes for independent
inspection. It reuses the accepted
`generate_units_lifecycle_reference.load_units_source` namespace, including real
category/units classes, original Axis methods, original registry/native support,
original CallbackRegistry, actual `sharex` and shared Ticker identity. It does
not substitute a Grouper-only graph for shared ticker holders. All transitive
pinned hashes and the executing NumPy binary hash are retained in the JSON.
The accepted D38 generator and `units_lifecycle_reference.json` are unchanged.

Complete unchanged original method bodies executed:

- Line2D: `set_data`, `set_xdata`, `set_ydata`, `get_data`, `get_xdata`,
  `get_ydata`, `get_xydata`, `get_path`, `recache`, `recache_always`.
- Artist: `convert_xunits`, `convert_yunits`.
- cbook: `_to_unmasked_float_array`.
- Axes: `_unit_change_handler`, `relim`, `_update_line_limits`,
  `_request_autoscale_view`.
- Bbox: `update_from_path`, `update_from_data_xy`, `set_points`, `ignore`,
  `mutatedx`, `mutatedy`.

Trace wrappers delegate the unchanged source methods. Snapshots directly read
cache fields instead of invoking processed getters that could change an invalid
Line while recording a failure.

The explicit source host supplies short default-style Line storage, identity
affine data transforms and numeric Path vertices/interpolation-step storage.
The actual graphical Line2D constructor, renderer, arbitrary transforms,
long-line subslice optimization and step styles are not emulated or claimed.
All tested inputs have at most three values, so the original long-line branch
is naturally not entered. Full Line constructor/style parity is outside this
reference.

## State and error stages

The original callback force-recaches **all Lines**, in artist order, converting
original x then original y. Numeric originals use Axis's native numeric bypass
even when a category converter is installed. Category strings are retained
separately, so a replacement mapping changes their numeric vertices; missing
labels append to that new mapping during conversion.

For each Line, conversion/broadcast/column-stack complete before `_xy`, `_x` or
`_y` is assigned. The typed helper likewise commits both coordinates together
to that Line's exact existing points buffer. Earlier Lines and converter/unit
side effects survive a later failure. Relim runs only after every Line recache
succeeds, then requests only the event coordinate. It neither prevalidates the
whole group nor rolls back completed Lines.

In case06, y originally has no converter or unit. Pending raw category strings
cause original `convert_units` to discover StrCategoryConverter before its
conversion fails for missing category information. The converter stays selected
and the unit stays None; calling `update_units` here would incorrectly create a
unit and erase the real failure. The JSON retains the exact wrapped Python
`ConversionError`; the existing typed conversion boundary is
`Core.DataError::InvalidTicks`, whose contextual missing-category text is not
claimed to be Python's repr wrapper. Broadcast errors retain the original
NumPy message exactly and are checked as such.

The shared cases use original `sharex`, not fabricated shared state. The later
created member is visited first by the real ordered Grouper. When that member
fails, its new unit/converter effects remain and the other member still has its
old unit; failure in the second member instead leaves the first member's new
vertices, relim and request intact. This is verified rather than treated as an
atomic group operation.

## Private fixtures and remaining boundaries

Generated Moon tests seed the frozen private `LineOriginalCoordinate` variants
and existing points using `attach_line_with_originals`. They restore the
source's cached raw data intervals/minpos/ignore and pending-view flags before
performing the real callback. This expresses invalid pending originals and
singleton/empty inputs without inventing new public setters or weakening
validated public plot argument contracts. Both source and Moon therefore start
at the same declared cache boundary.

No public lazy Line getter/setter migration is implied by cases09–13. Full
mutating Python raw arrays, arbitrary objects/custom converters, 0D/2D/ragged
input, graphical Path/style mutations and public Line object handles remain
outside this slice. Source dates are ordinary aware datetime instants and are
projected to retained `RRuleDateTime::aware` values; this does not add new date
string grammar or epoch-reset semantics.

The original units handler explicitly recaches Lines, then calls relim. It does
not explicitly reconvert Collection offsets from original strings. Collection,
bar, scatter, generated contour/streamplot display Lines and general artist
recache behavior are not silently included in this Line sidecar profile.
Direct Axis.clear replaces its callbacks and resets units without a units event;
full Axes.clear also detaches children. Those distinct lifecycle paths must not
be confused with a unit-change recache.

## Production acceptance

D39 adds 18 registered tests: this one generated group carries 19 typed source
cases, and 17 directed regressions cover public producers, copy/identity,
partial failures, shared/detached/clear state, generated display-Line aliases,
contour rewriting and numeric IR/SVG. The complete four-target run passed:
wasm/wasm-gc/native each 21952/21952, JS 21959/21959, zero failures.
All 41 generated public interfaces remain byte-for-byte unchanged. The initial
static check found two unnecessary mutable private fields and a missing error
type on a test helper; these were corrected before the passing full run.
The original 15 observations and the accepted D38 JSON are unchanged.
