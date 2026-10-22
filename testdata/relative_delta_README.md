# Calendar-relative date references

The original dateutil 2.9.0.post0 relativedelta.py and weekday class are executed
unchanged by these generators. Their hashes are checked against the fixed
source and runtime. Python is a reference dependency only.

```sh
python3 scripts/generate_relative_delta_reference.py \
  .moonagent/upstream/dateutil-2.9.0.post0/src/dateutil/relativedelta.py --check
python3 scripts/generate_relative_apply_reference.py \
  .moonagent/upstream/dateutil-2.9.0.post0/src/dateutil/relativedelta.py --check
```

The constructor manifest contains 155 named cases and an invalid-input group:
separate fractional components, signed carry thresholds and nextafter values,
Int64 month/year boundaries, absolute zero/invalid values, year-day precedence,
and integer/object weekday inputs. One hand test covers typed finite/overflow
and mutually exclusive arguments. Source weekday equality distinguishes None,
0 and 1; RelativeDelta equality normalizes their effective occurrence
as the original class does.

The application manifest has 100 named deltas with 1300 observations, including
month-end clamps, leap days, raw absolute overrides, fractional timedelta
accumulation, huge cancellation, bounds, DST gaps/folds and future rules.
Reference timezone inputs must be equivalent: dateutil.tzfile uses the first
32-bit block, so Moon uses explicitly registered identical fat bytes. Separate
POSIX future cases use the same tzstr profile on both sides. This avoids
mistaking differences between modern POSIX rules and historical IANA LMT for
calendar arithmetic errors. The reference checks tz.py, tzrange and fixture
hashes. CPython 3.12.14's fixed datetime source and runtime provide independent
mixed-float accumulation and microsecond round-to-even behavior.

Current typed interface: RelativeDelta::new uses Int64 years/months, finite
Double relative day/time/leap fields and Int32 absolute fields. Absolute fields
are stored until application, including source year/month/day=0 fallback.
RelativeWeekday objects retain an arbitrary Int32 weekday and optional nth;
the direct delta weekday integer follows Python tuple indices -7..6. Dates
remain years 1..9999. Construction and application do not use display timezone
rc or numeric epoch. Fixed offsets and rule-zone wall-clock semantics follow
the previously accepted DateTime model.

The normalized manifest contains 320 named cases plus four direct decimal-round
groups (3431 binary64 observations). The reference checks fixed CPython
floatobject.c; the runtime uses its correctly rounded dtoa/strtod round path.
Moon obtains the exact binary64 rational with BigInt, rounds a decimal quantum
half-to-even and uses the standard string parser to convert back. Tests compare
output bits, including subnormals, signed zero, max finite values, nextafter
neighbors and random encodings. Each normalized field then follows the source's
11/10/8/0 decimal stages.

The between manifest contains 183 named cases with original constructor output
and reconstruction. They include bounds, month ends, second offsets, reversed
ranges, NY/Lord Howe, shared versus separate equivalent tzinfo instances, folds
and UTC mixtures. The operations manifest contains 713 named cases, including an
Eq group with 144 observations. Absolute None/zero and leapday precedence,
neg/abs, mutable-weeks-equivalent copies, timedelta combinations, independent
scale truncation, reciprocal division, month/year carry cancellation at Int64
limits and datetime subtraction are compared to the original class.

Additional reproduction commands:

```sh
python3 scripts/generate_relative_normalize_reference.py \
  .moonagent/upstream/dateutil-2.9.0.post0/src/dateutil/relativedelta.py --check
python3 scripts/generate_relative_between_reference.py \
  .moonagent/upstream/dateutil-2.9.0.post0/src/dateutil/relativedelta.py --check
python3 scripts/generate_relative_operations_reference.py \
  .moonagent/upstream/dateutil-2.9.0.post0/src/dateutil/relativedelta.py --check
```

Typed scope: the API stores Int64 calendar years, normalized month remainders,
finite Double relative day/time/leap components, and Int32 absolute/weekday
fields. Intermediate integer scale/carry calculations are exact; results must
fit those public component types. Raw Python arbitrary-precision integer day
objects, date-only/naive dynamic mixtures, arbitrary field mutation, runtime
reflection/serialization, and other Python object protocols are not claimed.
Day/time and weeks getters use Double values; with_weeks returns an
immutable copy. Debug uses the project's structured MoonBit debug convention.

An independent integration package invokes construction, normalization,
application, between and object arithmetic before selecting a custom epoch,
under an invalid display timezone rc. This proves those operations do not lock
the epoch or consult display defaults. Shared inverted SVG axes verify the
calendar-month-end results through typed plot_date and the existing backend.
Reference names and sub-observations are validation evidence, not API coverage
percentages or full Matplotlib completion.
