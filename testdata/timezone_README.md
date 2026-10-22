# Date display timezone reference

The D12 reference executes unmodified definitions from Matplotlib v3.11.2
commit `d3ca9172e392048ec242b90e8423e88d1a3000b2` dates.py, including
`_get_tzinfo`, `num2date`, formatter, locator and converter classes. Abstract
axis/ticker scaffolding is shared with the previously accepted generators.
No installed Matplotlib package is imported. Python 3.12.14, NumPy 2.3.5,
python-dateutil 2.9.0.post0 and the C time locale are required only to regenerate.

The generator checks dates.py, ticker.py, rcsetup.py, matplotlibrc, and the
installed dateutil tz.py, tz/_common.py and relativedelta.py hashes. Source
hashes and observations are retained in timezone_reference.json. All four fat
fixtures must match testdata/tzif/manifest.json. Six production slim blobs must
match ticker/date/tzdb/manifest.json. Original gettz searches only the selected
fixture path for these file cases, and its noncached form prevents references
from leaking across directories.

```sh
python3 scripts/generate_timezone_reference.py \
  .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/dates.py \
  .moonagent/upstream/iana-2026e/full-zoneinfo --check
```

The 32 named references cover historical seconds, both DST sides, distant
rounding, years 1/9999, 32-bit range exhaustion, production slim behavior,
GNU H/HH/HHMM/H:MM offsets, GMT/UTC sign exceptions, default and explicit DST
rules, negative/large DST shifts, Julian/year-day rules and numeric/seconds
transition clocks. Configuration switches exercise scalar and batch labels,
cursor/offset strings, explicit UTC, converter output and all eight upstream
concrete locator constructors. Hand tests separately cover atomic registration,
invalid defaults and callbacks, typed argument conflicts, UTC helpers, epoch
ordering, host absolute/colon paths, embedded JS, axes and SVG/pyplot integration.

| Consumer | Omitted display timezone |
| --- | --- |
| `num2date` / `get_timezone` | Read current rc for each call |
| `date_formatter` | Resolve and capture at construction |
| Calendar / Auto locator | Resolve and capture at construction |
| `AutoDateFormatter` | Validate at construction; text scales resolve again at each call; callbacks bypass resolution |
| `ConciseDateFormatter` | Resolve at scalar, batch or cursor formatting time |
| Converter `axisinfo` without a unit | Locator captures rc; Auto/Concise labels remain dynamic |
| Converter with a typed unit / typed `plot_date` | Use the explicit/inferred aware unit |

The rc setter stores strings without name validation. Invalid names raise at
the original consumer boundary. `date_formatter` and `AutoDateFormatter::new`
therefore now raise checked DateError. The existing nonraising DateFormatter
render adapter retains its numeric fallback on formatting errors; named
Auto/Concise methods expose checked formatting errors. Axes map construction
errors to DataError before changing configuration. `with_offset` and
`with_timezone` bind explicit values, and bypass later rc changes.

String lookups intentionally use dateutil's first **32-bit TZif block**, first
standard prehistory type and last standard fallback. Production slim files may
have no useful compatibility transitions: this is a property of the source
gettz behavior. Full `tzif_timezone` and `tzdb.timezone` retain their 64-bit,
POSIX-footer IANA behavior. Explicit `register_timezone(name, bytes)` and
optional `tzdb.register_timezone(name)` make the string profile portable to
browsers. Unregistering does not mutate captured objects. Nonempty successful
host/string lookups are cached; local empty/colon lookups are refreshed.

Host lookup supports Unix absolute/colon paths and standard zoneinfo folders,
then GNU TZ strings. Empty strings use TZ or localtime; colon alone selects
localtime. Host files depend on runtime capabilities. UTC, explicit zones,
POSIX strings and registered bytes work without Node or filesystem access.
The optional tzdb is never a production dependency of base date/scene/pyplot.

Typed boundaries: offsets must stay strictly within one day (checked during
resolution, earlier than Python's later datetime query for out-of-range TZ
objects); leap-second files are rejected. Windows registry lookup, dateutil's
own bundled fallback database, host tzname-alias fallback, deprecated numeric
comma TZ syntax and nonstandard out-of-domain calendar rules are not included.
The GNU transition-clock range is bounded by the shared engine. RRule's typed
explicit dtstart extension preserves its inferred timezone; rrule_locator
without dtstart follows rc. Legacy from_ordinal, date_tick_values,
format_date_ticks and auto_date_formatter remain UTC/fixed-offset helpers.
Neither DateTime nor date2num nor DateStringParser reads display timezone rc.
