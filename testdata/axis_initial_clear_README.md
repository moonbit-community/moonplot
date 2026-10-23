# Axis construction and clear reference

The generator executes the complete, unchanged Matplotlib v3.11.2
`Axis.__init__` and `Axis.clear` bodies, their original overlap property, and the
accepted original Ticker/Scale/default-setting bodies. No Moon implementation
provides expected data.

From the repository root, using pinned CPython 3.12.14 / NumPy 2.3.5:

```sh
python3 scripts/generate_axis_initial_clear_reference.py
python3 scripts/generate_axis_initial_clear_reference.py --check
```

There is no positional source argument. `--check` independently re-executes the
source and formats the generated fixture, then compares both outputs without
writing them. All source dependencies and the constructor/clear method hashes
are included in `axis_initial_clear_reference.json`.

The reusable loader is
`load(ticker_path) -> (namespace, AxisHarness)`. It builds on the accepted D35
lifecycle loader and adds the full original constructor, clear, and overlap
accessors/property. `AxisHarness` accepts `name`, intrinsic `which='x'|'y'`,
`clear=True|False`, and an optional external `axes` host. Optional `major`/`minor`
arguments are explicit post-construction graph wiring; the original constructor
always creates its own real Ticker objects first. This loader is also used by the
independent Scene clear reference.

The fixture boundaries are Text/artist presentation, callback-registry hosting,
and view/data/space/minpos/graph context. These sinks do not implement ticker
installation, flag restoration, scale changes, or shared-holder behavior.
`TextSink` is deliberately not an oracle for the complete `Text` style/text reset
API; the reference makes no source-equivalence assertion about its stored text.

## Portable cases

There are 412 independent scenarios, grouped into 13 registered MoonBit tests
with at most 32 private case functions in a group:

| Cases | Observation |
| ---: | --- |
| 32 | x/y constructor, all four x/y minor-visibility rc combinations, classic mode, TeX and locale capture |
| 320 | x/y and minor visibility, all five previous scale profiles, every four-slot user-replacement mask |
| 20 | Clearing one Axis preserves the shared holder and the peer's separate geometry |
| 10 | Old locator provider and retained formatter location cache remain attached after clear |
| 2 | Replaced IndexLocator still reads subsequent live artist-data interval changes |
| 8 | Typed date/category bookkeeping returns to numeric defaults after the original converter reset |
| 4 | Three consecutive clears retain the same holder and install fresh default objects each time |
| 16 | Retained date/category metadata does not override newly installed numeric tickers; full original query/draw evidence |

The finished public Axis constructor has real linear defaults immediately:
AutoLocator, ScalarFormatter, NullFormatter and either NullLocator or
AutoMinorLocator according to its intrinsic direction. All four default flags
are true. The constructor consumes direction before installation; a later user
axis getter is not an initialization trigger.

`Axis.clear` installs fresh defaults into the same shared holder. It preserves
view endpoints and their order, explicit or provisional typed view storage,
inversion, and the user's overlap-removal flag. The matrix distinguishes
ascending automatic context from reversed explicit and provisional views.
Each successful clear restores all four ticker-default flags to true.

The original Axis body does not detach old locator or formatter handles. Tests
retain the old stable binding, change its live view or data context, and check
that the old handle still reads it. An old formatter's borrowed location cache
remains the same array; the new ScalarFormatter points at the original default empty location state.

Clearing a single Axis does not reset the other member's geometry, even when
both members share all four new default objects. New objects belong to the Axis
being cleared; discarded objects retain the peer context they previously had.
The outer Scene/Axes operation, including peer-scale propagation and its later
minor-rc setter, has a separate reference and is not substituted here.


## Retained metadata and actual numeric queries

Sixteen appended cases execute complete original `get_majorticklocs`,
`get_minorticklocs`, `_tick_group_visible` and `_update_ticks` bodies, plus the
original transform interval-containment helper. Both x/y directions, minor
visibility, date/category metadata tags and ordinary/offset views are covered.
The original converter is a poison host capability: any attempted attribute
access raises. Its identity and the units identity survive a peer's direct
linear-scale installation; all 16 actual query runs make zero metadata reads.
Tick/Text artist positioning and text storage are presentation sinks, while the
locator, formatter, overlap and visible-tick algorithms are original source.

The Moon projection uses real `set_date_format("%Y")` or `set_categories(...)`
followed by `set_scale(Linear)`, retains that metadata, and matches the original
major/minor tick arrays, label arrays and offset through checked and convenience
queries. A 10-point label size and explicit 150-unit x / 100-unit y layout give
exactly five tick-space units, matching the controlled original Axis capability;
source expected values are not changed to accommodate a different physical size.
All raw ticks in these fixtures are visible, so the joined queried rows also
match the full original `_update_ticks` output without reproducing its filter.

For view `[0,1]`, major locations include the actual binary64
`0.6000000000000001`, and labels are `0.0` through `1.0`. For
`[1000000,1000001]`, the same numeric labels accompany offset `+1e6`. Enabled
minor ticks retain NullFormatter's empty labels. The source's old FixedFormatter
strings and converter metadata never replace these installed numeric labels.
This adds no new primitive or modified mathematical profile.

The original first 396 cases and eight source-only observations are unchanged.
Removing only these sixteen new cases and the new full-query method-hash field,
and restoring the case count, reconstructs the complete original JSON SHA-256
`586a33968855d1f79bb8bb4332113c03830d0bf57ca02fe7c7764b3ca3c33200`.

## Typed projections and source-only phases

Upstream stores view/data context outside the Axis object. The Moon Axis's
explicit `limits` and provisional `auto_view` are therefore recorded as typed
storage projections of the original body's view preservation, rather than as
invented upstream private fields. The original reference receives its context
through independent host getters. The first 396 cases inspect lifecycle state without introducing a numerical
rounding oracle. The final 16 cases execute the actual accepted numerical query
pipeline as described below.

Likewise, the eight date/category cases execute the original generic
units/converter reset and replacement of ticker roles. The Moon assertions also
verify clearing the corresponding typed date/category bookkeeping fields. They
do not claim generic converter callback installation, every raw Python unit
domain, or migration of the original date converter protocol in this slice.

Eight additional source-only observations cover the real internal constructor
phase `clear=False`: four None ticker slots, all default flags true, no scale
assigned, empty units/converter and autoscale enabled. The public typed
`axis(horizontal=...)` intentionally returns the completed `clear=True` state;
there is no deliberately empty public alternative.

No count cap, allocation-budget omission, new numerical primitive, or altered
source/math profile is introduced. Existing fixed-count sampling helpers remain
separate from installing real default AutoLocator/ScalarFormatter objects.
Constructor and clear keep their pure Moon signatures because this typed linear
installation reads no user callback and its preconditions are invariant-bound.

The fixed `axis.py` SHA-256 is
`f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0`.
The original constructor segment is
`901888fb10b0fbce220605dcd87b7d79ec716f5c408e46587d6421950f57deaa`;
the clear segment is
`e9d1991ed65103d6c62ab5d599e53953b91cb28b15f78534623432595396af3e`.
