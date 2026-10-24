# Automatic date locator references

`scripts/generate_auto_locator_reference.py` executes the original Matplotlib
v3.11.2 `DateLocator`, `AutoDateLocator`, `RRuleLocator`, `YearLocator`,
`MicrosecondLocator`, `rrulewrapper` and `AutoDateFormatter` classes. It also
executes the original `ticker.MultipleLocator` and `_Edge_integer`. Only the
abstract locator base, axis attachment and warning sink are stubbed. No
installed Matplotlib is imported. The shared loader supplies the pinned date
conversion and concise formatter helpers.

Commit: `d3ca9172e392048ec242b90e8423e88d1a3000b2`. The generator validates
SHA256 hashes for `dates.py`, `ticker.py` and `mpl-data/matplotlibrc`; hashes,
inputs and outputs are retained in `auto_locator_reference.json`. Reference
runtime: Python 3.12.14, NumPy 2.3.5, dateutil 2.9.0.post0, `LC_TIME=C`.

```sh
python3 scripts/generate_auto_locator_reference.py /path/to/pinned/dates.py
python3 scripts/generate_auto_locator_reference.py /path/to/pinned/dates.py --check
moon test --target all ticker/date config scene/axis scene pyplot backend/svg tests/integration/epoch_2400 tests/integration/epoch_fraction
```

The 94 numeric-range cases cover the original eight spans with alignment on
and off, per-frequency and common maxima (including 1), minimum counts,
custom and unsorted interval tables, month ends, historical/modern/future
microseconds, point ranges, IANA zones and second-granularity fixed offsets.
The reference first converts view limits to dates, then runs the original
concrete locator, retaining distant-date 20 microsecond rounding. Four direct
DateTime cases exercise signed calendar residuals, reversed month ends and
different offsets. Six cases verify nonsingular limits. Eight successive
selections in two isolated epoch packages test live formatter binding and
the original frequency retention for insufficient microsecond spans. The
manifest also retains concise labels and shared offsets from the real
automatic ticks for the existing three-day integration scenario.

MoonBit assertions check numeric ticks, selected frequency, concrete interval
and unit, typed diagnostics, labels and limits. Handwritten tests add
configuration validation/copying, state isolation, the day-table constructor
switch, default rc capture, major/minor installation, x/y and shared axes,
zoom, inversion, singleton/empty SVG ranges, margin order and pyplot.

The typed port exposes seven `DateFrequency` variants and `DateMaxTicks::All`
or `ByFrequency`. Invalid positive-integer settings and empty interval lists
raise `DateError`. Diagnostic arrays replace Python warning emission.
`as_locator()` shares live selection state for standalone formatter binding;
Axis setters/getters and `copy()` isolate it. Numeric checked methods reject
nonfinite bounds before sorting. Generated ticks preserve the project's
descending-range contract; upstream axis views supply sorted ticks.

The original 94 timezone references use retained TZif fixtures and unambiguous
local candidates. AutoDateLocator's recurrence branch now uses the public typed
RRuleWrapper and named RRuleLocator, including source imaginary-gap and fold0
behavior. Existing explicit locator helpers keep their independent skip-gap/
double-fold extension. The year-multiple branch now uses named YearLocator as documented in
[the year reference guide](year_locator_README.md); the microsecond branch remains separate.
An optional DateParserContext supplies host now only when year selection requires it.
General SVG TeX typesetting and arbitrary system locale/OS flags remain separate
work; the fixed C strftime directives are implemented. The old range-only helper
remains available for compatibility and is not the default Axis selector.

## Automatic recurrence at transitions (D15)

`scripts/generate_automatic_wrapper_reference.py` adds **92 original-source
cases**, retained in `automatic_wrapper_reference.json` and
`ticker/date/automatic_wrapper_reference_test.mbt`. These cover NY spring/fall,
Lord Howe half-hour transitions, historical Paris seconds, negative DST tzstr,
and a year-2400 NY POSIX footer, at seconds/minutes/hours/days/months spans with
multiples enabled and disabled. The exact existing pyplot 2400 fold view is
included. Original source and fixture hashes are checked; runtime and shared
loader are the same as above, with additional pinned dateutil rrule.py,
tz/tz.py, tz/_common.py and relativedelta.py hashes listed in the manifest and
[wrapper reference guide](rrule_wrapper_README.md).

Each case checks selected frequency, interval/unit, initial wrapper metadata,
public num2date/with_timezone wall fields and offset, automatic/adapter/selected
numeric ticks, reversed order, and offset/abbreviation labels. NY/LH/Paris use
original dateutil.tzfile first-block profiles via registered fat fixtures. The
future profile uses original tzstr with the same positive-DST rules as the
supplied NY TZif footer. No installed Matplotlib is imported.

Source negative DST fromutc uses two steps: shift UTC by its UTC transition
mask, then evaluate the returned datetime.utcoffset against standard-wall
labels. These masks may disagree at the transition. The port preserves both
wall fields and the latter attached offset for dateutil profiles. Full TZif
profiles retain their existing evaluator behavior.

The automatic numeric path passes its already decoded/rounded DateTime bounds
to the named locator. It does not run public inverse conversion a second time,
which would add a fractional epoch displacement again. Existing custom epoch
fixtures cover this path. An isolated epoch test checks get_locator remains
pure; Axis major/minor tests cover duplicate gap coordinates and inverted
output, and pyplot verifies only source fold0 labels reach SVG. Ordinary
AutoDateLocator/Axis copy isolation remains unchanged; each selection creates a
new wrapper, while the returned concrete wrapper adapter follows D14 sharing.

```sh
python3 scripts/generate_automatic_wrapper_reference.py /path/to/pinned/dates.py --check
moon info && moon fmt
moon check --target all
moon test --target all
```

The Matplotlib license is in `docs/licenses/LICENSE-MATPLOTLIB`, with attribution in
`docs/THIRD_PARTY_NOTICES.md`. Python is needed only to regenerate references.
