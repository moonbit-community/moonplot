# Automatic date formatter references

`scripts/generate_auto_date_reference.py` evaluates the fixed Matplotlib
v3.11.2 `AutoDateFormatter`, `RRuleLocator.get_unit_generic` and
`Axis.get_minorticklocs` AST definitions. The date/TeX helper loader is shared
with the concise reference generator. No installed Matplotlib is imported.

Commit: `d3ca9172e392048ec242b90e8423e88d1a3000b2`. The generator verifies
SHA256 checksums for `dates.py`, `axis.py` and `mpl-data/matplotlibrc`; the
manifest records them with the seven original rc defaults. Reference runtime:
Python 3.12.14, NumPy 2.3.5, dateutil 2.9.0.post0, `LC_TIME=C`.

```sh
python3 scripts/generate_auto_date_reference.py /path/to/pinned/dates.py
python3 scripts/generate_auto_date_reference.py /path/to/pinned/dates.py --check
moon test --target all ticker/date scene/axis integration/epoch_2400 integration/epoch_fraction
```

The 64 scale cases cover seven units, weekly and custom units, exact/adjacent
thresholds, negative/zero/infinite/NaN locator units, rc defaults, TeX strings,
unsorted/duplicate/infinite scale keys, empty maps and default-format fallback.
Additional cases cover missing unit metadata; scalar, numeric-array and original
datetime-array callables; seven recurrence units; six linear-date minor overlap
scenarios; and two isolated custom epochs (2400 and fractional 2000). A stub
locator supplies its unit, while the original formatter performs selection and
conversion. The original axis overlap method receives exact locator arrays,
view limits and an identity transform, matching linear date axes.

The typed port uses `DateScaleFormat::Text`, `Func`, `ValuesFunc` and `DatesFunc`.
The array forms have explicit `format_array`/`format_dates` entry points;
standard tick formatting remains scalar/index based. NaN scale keys are rejected
as unordered, while NaN locator units retain upstream fallback behavior.
Non-throwing generic DateFormatter adapters retain the project's existing
numeric fallback; named automatic methods report input/conversion errors.

Handwritten integration tests also exercise the original major/minor locator
rebinding scene, config snapshots, dictionary copy isolation, callback counts,
numeric locator replacement, automatic frequency changes after zoom, SVG x/y
and shared axes, XML encoding, DST folds, inverted views and pyplot. The complete automatic locator has its own
[pinned-class reference suite](auto_locator_README.md); formatter assertions here
remain independently scoped. General SVG TeX typesetting and
full locale/strftime support remain in their respective migration areas.

The Matplotlib license is retained in `LICENSE-MATPLOTLIB`, with attribution
in `THIRD_PARTY_NOTICES.md`. Python is required only for regeneration.
