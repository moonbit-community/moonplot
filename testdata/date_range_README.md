# Date duration and range reference assertions

`../ticker/date/range_reference_test.mbt` contains 340 duration vectors and
51 range scenarios computed independently from fixed Matplotlib v3.11.2.
They cover half-even microseconds, full timedelta day limits, negative values,
linspace endpoints, fixed second offsets, DST gaps/folds and calendar overflow.
The normal MoonBit tests consume these checked-in assertions with no Python.

`date_range_reference.json` records exact source hash and reference runtime
versions. To reproduce with Python 3.12.14, NumPy 2.3.5 and python-dateutil
2.9.0.post0, run from the repository root:

```sh
python3 scripts/generate_date_range_reference.py /path/to/pinned/dates.py --check
```

The script requires the `dates.py` at Matplotlib commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2` and verifies its SHA-256 before
executing only `_dt64_to_ordinalf`, `date2num`, `num2timedelta` and `drange`.
It does not import an installed Matplotlib. The only cbook adaptation is the
identity unpack for the standard datetime inputs used by these tests. Same
named endpoints reuse one tzinfo object, matching Python aware comparison.

Historical/current dateutil zones read the pinned IANA 2026e fat test fixtures.
Future New York arithmetic uses dateutil's POSIX TZ object, equivalent to the
NY TZif footer, because dateutil's tzfile does not extrapolate that footer.
The MoonBit implementation retains the actual IANA footer through its existing
adapter. Metadata-only runtime version changes must be reviewed on regeneration.
