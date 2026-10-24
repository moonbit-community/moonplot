# C locale date format references

`scripts/generate_date_format_reference.py` executes the original Matplotlib
v3.11.2 DateFormatter, AutoDateFormatter and ConciseDateFormatter with their
original numeric date conversion helpers. No installed Matplotlib is imported.
The reused D08 loader verifies `dates.py`, `ticker.py` and `matplotlibrc` at
commit `d3ca9172e392048ec242b90e8423e88d1a3000b2`. The reference runtime is
Python 3.12.14, NumPy 2.3.5 and dateutil 2.9.0.post0 on Darwin, `LC_TIME=C`.

```sh
python3 scripts/generate_date_format_reference.py /path/to/pinned/dates.py
python3 scripts/generate_date_format_reference.py /path/to/pinned/dates.py --check
moon test --target all ticker/date scene/axis scene pyplot tests/integration/epoch_2400 tests/integration/epoch_fraction
```

There are 90 named reference tests: 87 explicit date/time boundaries,
historical second offsets, IANA/DST instants and TeX cases; one complete
Gregorian-cycle oracle; and original automatic/concise formatter reuse.
Two isolated custom epoch packages additionally compare original formatter
outputs. Direct calendar formatting and constructing the formatter occur
before set_epoch, demonstrating that neither locks or reads it.

The explicit cases check both DateTime.strftime-equivalent local output and
the original DateFormatter's conversion/formatting. They include years
1/9999, leap/century years, ISO week-year transitions, week 53, traditional
week 00/53, and midnight/noon/AM-PM boundaries. The complete first Gregorian
cycle spans all 146097 dates in years 1–400. CPython datetime.strftime
generates `%j %U %W %G %V %u`; each year has an independent rolling summary
`h = (h * 31 + ASCII byte) % 1000000007`, initially zero. MoonBit enumerates
the dates through the existing epoch conversion and checks all 400 values.
These summaries supplement the explicit boundary labels rather than replace
direct output assertions. The manifest retains labels, numbers and summaries.

The Gregorian implementation reuses this project's existing integer calendar
functions. CPython v3.11.0 `iso_week1_monday`, `date_isocalendar` and
`wrap_strftime` were inspected as semantic references; their source SHA256
is recorded separately from the executed runtime. No CPython C code is
compiled by the generator or shipped as a library runtime dependency.

The port implements the standard Python strftime directives in a fixed C
locale. New codes are `%I`, `%p`, `%j`, `%U`, `%W`, `%u`, `%G`, `%V`, `%c`,
`%x` and `%X`. The year padding remains four digits, including `%G` and `%c`.
The generator checks this minimum-year libc behavior before recording output
instead of silently producing different platform padding. `%c` space-pads
the day, `%x` is `%m/%d/%y`, and `%X` is `%H:%M:%S`.

Names and AM/PM text remain English. Arbitrary system locales, OS extensions,
padding flags and E/O modifiers are outside this contract. Existing unknown
directive and trailing-percent literal preservation is tested separately.
Week calculations use local date fields after the existing timezone
conversion; they do not use the UTC day or the floating epoch directly.
SVG consumes the same formatters, retaining XML escaping and inverted/shared
axis behavior. General TeX layout remains separate from TeX string output.

The Matplotlib license and attribution remain in `docs/licenses/LICENSE-MATPLOTLIB` and
`docs/THIRD_PARTY_NOTICES.md`. Python is only needed for regeneration.
