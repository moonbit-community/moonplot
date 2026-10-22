# General date-string parser references

The D11 generators execute Matplotlib v3.11.2 `datestr2num`/`date2num` and
dateutil 2.9.0.post0's original lexer, YMD resolver, parser and tzlocal behavior.
No installed Matplotlib is imported. Source checksums, inputs and results are
retained in the parser reference manifests. Python 3.12.14 (Unicode 15.0.0),
NumPy 2.3.5 and dateutil 2.9.0.post0 are used only to regenerate assertions.

The fixed Matplotlib commit is `d3ca9172e392048ec242b90e8423e88d1a3000b2`.
The dateutil parser source SHA256 is
`ee494377289c92c401fd7825fb7500981c33098a2bd40219aa4948713e9d1fff`.
The original `tz.py` and parser tests are checked separately. The complete
entry-point reference uses CPython's `HAVE_DECL_TZNAME=0` sampling profile on
Darwin. CPython v3.12.14 `Modules/timemodule.c` was inspected for that profile;
its source hash is recorded in the execution checkpoint.

```sh
python3 scripts/generate_parser_unicode.py --check
python3 scripts/generate_parser_foundation_reference.py /path/to/dateutil/parser/_parser.py --check
python3 scripts/generate_parser_fields_reference.py /path/to/dateutil/parser/_parser.py --check
python3 scripts/generate_parser_build_reference.py /path/to/dateutil/parser/_parser.py --check
python3 scripts/generate_string_parser_reference.py /path/to/matplotlib/dates.py /path/to/dateutil/parser/_parser.py /path/to/iana-2026e-zoneinfo --check
moon test --target all ticker/date ticker/date/tzdb scene pyplot integration/epoch_2400 integration/epoch_fraction integration/string_parser_batch_error integration/string_parser_default_error
```

The last generator's zoneinfo directory must contain the exact production
IANA 2026e `zic -b slim` blobs recorded in `ticker/date/tzdb/manifest.json`.
`scripts/generate_tzdb.py` has a reusable `generate(archive_dir, work_dir)`
function: with the pinned archives from that manifest, it leaves the compiled
files in `work_dir/zoneinfo`. Unlike its command-line wrapper's temporary
directory, an explicitly supplied work directory can be retained for this
reference. Every selected zone's bytes are checked before use.

The layers verify different requirements:

- Unicode tables reproduce CPython isalpha/isdigit/isspace and Nd decimal
  values, rather than treating input as ASCII. The lexer oracle includes all
  original default parser examples, nulls, Unicode words/digits, spaces and
  ambiguous dot/comma tokens.
- YMD assertions cover all four flag combinations, numeric/tagged fields,
  explicit centuries and leap-day feasibility. Production uses dateutil's
  default dayfirst/yearfirst settings.
- Field assertions run original `_parse`, including compact dates, AM/PM,
  fractional hours/minutes, six-digit second truncation, GMT sign reversal,
  and invalid/unused tokens. The private decimal operations preserve the
  default 28-digit round-half-even context.
- Default construction runs original `parser.parse`: omitted components,
  month-end clamping, forward weekday adjustment, inherited fixed/rule zones
  and a default's later DST fold. These assertions now call the public parser.
- Complete scalar and flat-array assertions execute the original Matplotlib
  entry point with controlled TZ and clock. They check exact numbers,
  constructor reference year, local names/offsets, clock calls and typed
  unknown-timezone diagnostics. Cases include negative DST, half-hour DST,
  historical offsets, explicit local metadata, local year boundaries and
  UTC conversion outside years 1–9999.

No-default arrays preserve NumPy's first-element type probe: the first input
is parsed again during the actual vectorization. All strings are parsed
before conversion. If the first result is aware, later naive results are
interpreted in the actual host local zone, including gap/fold preferences.
If the first result is naive, NumPy's datetime64 conversion is retained.
Explicit-default arrays parse and encode each element in sequence instead.
The two isolated error packages prove the corresponding epoch-lock timing.
The two custom-epoch packages construct the context/parser before set_epoch
and compare original numeric outputs afterward.

`DateParserContext` owns immutable TZif/POSIX rules and a signed Unix-millisecond
clock callback. System resolution reads TZ/TZDIR or `/etc/localtime`; it does
not import the optional bundled database or substitute UTC when unavailable.
The default local descriptor samples the same two instants as the pinned
CPython profile. `with_local_info` supplies another host's standard/daylight
offsets and names while preserving actual local clock/DST queries; a reference
explicitly exercises this alternate profile.

Hosts without system files use `from_tzif`, `from_posix`, `utc`, or optional
`tzdb.parser_context(name)`. The latter reuses existing bundled bytes. JS
file discovery uses guarded Node builtin lookup and has no static node:fs
import; an additional JS test removes process and exercises an explicit
context. Wasm embedding still needs the standard MoonBit runtime imports
retained by reachable host paths, even when an injected context avoids file
access. TZif version/leap/range limits remain those of the existing adapter.

`DateStringParser.parse` and `parse_many` are typed convenience methods.
Host-local recognized names yield fixed-offset snapshots; an inherited rule
zone remains retained. Plotting numeric results with a chosen IANA display
zone is covered through shared/inverted SVG axes and pyplot. Diagnostics are
copied arrays and preserve duplicates and warnings before later errors.
The default free parser is constructed lazily at the first nonempty call and
then reused; an explicit parser controls when its reference year is captured.
The default free helpers expose copied diagnostics through `date_parse_warnings()`;
reading them does not initialize the parser or select an epoch.
`copy()` isolates diagnostic state while sharing the clock callback and
immutable context. Parsing is strict; fuzzy parsing, custom parserinfo and
tzinfos are not parameters of Matplotlib's datestr2num entry point.

The current typed entry points accept String or flat Array[String]. They do
not implement Python streams/bytes, heterogeneous objects, NumPy masked or
multidimensional array containers. Existing DateTime defaults always have
an offset; there is no separate naive type or manually set fold bit for a
fixed-offset value. These boundaries are recorded separately from grammar
coverage. The Matplotlib and dateutil licenses/notices remain in the root
license files and THIRD_PARTY_NOTICES.md.
