# Public typed Line data and lazy cache generations

`line_data_reference.json` executes pinned Matplotlib 3.11.2 Line2D methods in
CPython 3.12.14 / NumPy 2.3.5. The generator imports no installed Matplotlib and
uses no Moon implementation to produce expected values.

It reuses `generate_line_units_reference.load_line_source()` and its fixed
complete-method loader. The generated Scene whitebox test exercises the new
typed Line handle with the source's original/cache/range state and alias rules.
The existing D39 generator, collector, and JSON values are unchanged.

## Reproduce

From the repository root:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_data_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_data_reference.py --check
```

The optional positional argument is the fixed `lib/matplotlib/ticker.py` path.
The generator is self-contained with respect to the ignored planning probes;
those files are never imported or read during generation/checking. Original
Line source is obtained by the accepted loader from its pinned official source
cache, with a mandatory SHA check before execution.

JSON SHA-256:
`d0b1bca67d729e16e232180bc06fa2a0b5034a1a29290ee4a07ed98b208af06c`.

| Fixed original source | SHA-256 |
| --- | --- |
| `lines.py` | `e928511cec1f9ce19455008c1863d337b0dbd1c71ac2b8d40224c8d5c069e05c` |
| `artist.py` | `c55a81d86db60ab7b22fcd6e70401aa84558de5d1ba6e40a16c60f6f1f03be7a` |
| `axes/_base.py` | `ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b` |
| `axis.py` | `f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0` |
| `transforms.py` | `109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8` |

The JSON records the complete loader dependency hash map, including original
category and units sources. The Python generator formats only its own generated
Moon file through stdin `moonfmt -`; this is not compilation or acceptance.

## Records, source-only domains, and registered tests

There are 25 profile records: all 21 original data/cache preparation records and
all four original owner=None profiles are preserved field-for-field. Of the
21 data records, 15 project to typed Line operations and six remain source-only.
Four attached-Line sequences and four detached profiles form eight private
scenario functions inside one registered test group. Individual sequential
operations keep their own before/after assertions; grouping does not discard
observations or retry a failure with a changed expectation.

| Data record IDs | Behavior | Projection |
| --- | --- | --- |
| 00–07 | Setter copy, raw borrow, lazy conversion, old/current views, explicit relim | Typed sequence 0 |
| 08–09 | One-coordinate invalidation and mixed-generation returned pair | Typed sequence 1 |
| 10–12 | Valid other-coordinate getter and deferred/repeated broadcast error | Typed sequence 2 |
| 13–14 | Scalar setter rejection, including partial prior x write | Source-only argument domain |
| 15–16 | Accepted mismatched sequences, later getter failure | Typed sequence 3 |
| 17–18 | Native ndarray Int64 original-container copying | Source-only container domain |
| 19 | Original Artist stale descriptor with recording callback target | Source-only GUI callback protocol |
| 20 | Native Python copy.copy(Line) | Source-only copy protocol |

The owner=None error profile contains six independently observed invalid string
inputs; it remains one bounded profile record. The source-only records execute
the actual original bodies and remain in the JSON without pretending to be new
public typed APIs. The 25 profile count is not a count of every internal source
method call.

D39's former source-only protocols09–12 are now represented by typed data
records04,05,00,03 respectively. Its scalar-y argument rejection13 remains
outside `LineData`; this does not silently relabel all five old records as
migrated or alter their accepted expected values.

## Supported handle and state behavior

`LineData` distinguishes numeric, category-string, and date originals. The stable
`Line2D` handle keeps copied originals separate from its converted Float64 cache
and the attached artist's identity. Initial `plot_line` uses the existing typed
equal-length/unit-setup convenience contract; it is not a complete Axes.plot
argument parser or an unattached Line2D graphical constructor.

Coordinate setters copy input, set only the corresponding invalid flag, and mark
Line stale. They do not convert units or validate paired lengths. `set_data`
updates x then y. Original getters borrow the stored originals; mutating a
borrowed original does not automatically invalidate cached numeric values.

Processed x/y getters check only their own invalid flag. Once invoked, recache
services invalid x then invalid y, broadcasts, and commits a fresh generation
only after success. A failure keeps the previous converted generation and
pending flags; prior converter-side effects retain their source order.

The returned x/y views share one interleaved Float64 buffer with the flat xy
view. Old views retain their old buffer after a new generation is installed.
The reference tests aliasing by temporarily writing and restoring a view, rather
than requiring a particular wrapper-object identity. In the mixed-generation
case, x was already valid when `data_values_checked` read it; y then recaches.
The returned x references the old generation, while returned y references the
new one. Preparing both first would change the original behavior.

Writing the current processed view changes current numeric Line data without
marking it invalid or recalculating dataLim. A later original mutation can still
be consumed by forced recache. Source cached Path values are retained in JSON;
no public Path object or mutable Path API is introduced. Record12's original
get_path broadcast failure is projected to the flat getter with the same
either-invalid refresh predicate and error stage.

Range caches are independent. Setters, processed getters, and successful recache
do not relim or request autoscale. Explicit `relim_checked` updates dataLim from
current processed data and still does not request a view update. The separate
units handler's force-all-Lines → relim → event-coordinate request sequence
continues to be covered by the D39 units reference package.

## Detached conversion

The four owner=None profiles execute original getters/recache and Artist unit
conversion directly, bypassing the D39 tracer that requires `axes.events`.

- Numeric originals become ordinary Float64 data.
- Category strings use ordinary float conversion. Successful cases include
  underscores, Arabic digits, Unicode whitespace, signed NaN, infinity words,
  and a 5000-digit overflowing decimal. Source float bits independently match
  Python `float`; invalid strings retain their actual ValueError diagnostics.
- Nonempty Date originals fail at actual float-array conversion with
  `TypeError: float() argument must be a string or a real number, not 'datetime.datetime'`.

The generated owner=None fixture is private whitebox construction with copied
originals, an empty cache generation, and both invalid flags set. Python's fresh
optional-cache absence is not claimed as an identical typed representation.
The fixture compares conversion outcomes, invalid/stale state, and committed
data; it introduces no public unattached constructor or full Axes.clear claim.
A previously valid detached Date cache remains readable until invalidated or
forced to convert; the original failure is not an early Date getter rejection.

## Numerical and error assertions

Finite values and infinities are compared by binary64 bits; NaN is compared by
classification, without a payload promise. Source float-text bits, including
negative NaN sign, remain in JSON as independent native evidence. Broadcast
errors use the existing unprefixed NumPy message in Core InvalidTicks. Detached
text/Date errors use the existing native-type prefix convention. Range data and
pending requests are checked before and after every attached operation.

Snapshots inspect retained cache fields directly and never call a processed
getter merely to record a pending failure state. The source host is limited to
short/default-style Lines and numeric Path storage. Long-Line optimizations,
alternate drawstyles, renderer styling, arbitrary Python objects, native ndarray
container identity, GUI stale propagation, and native copy.copy remain separate
boundaries. Project gates and accepted interface review are recorded centrally
after all writers stop.

D44 acceptance: the first full run had one identical new fixture assumption
failure on all four targets. Original recache confirmed that an already
broadcast valid x cache retains length two when only y is replaced by empty
data; ordinary refresh fails, while forced refresh rereads singleton original x
and succeeds empty. Only that hand fixture was corrected. Nine kernel hands
and two added public API/SVG hands then passed on all targets. Cumulative
coverage is 22063 tests on wasm/wasm-gc/native and 22070 on JS. All 25 new
registered tests, source checks, final check/info/fmt and the five expected
interface changes are accepted; the other 36 interfaces are unchanged.
