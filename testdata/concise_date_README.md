# Concise date formatter reference

`scripts/generate_concise_date_reference.py` checks the SHA256 of Matplotlib
v3.11.2 `dates.py`, commit `d3ca9172e392048ec242b90e8423e88d1a3000b2`, then
executes the original `DateFormatter`, `ConciseDateFormatter`, `_wrap_in_tex`,
`_from_ordinalf`, `_dt64_to_ordinalf`, `date2num` and `num2date` AST definitions.
It never imports an installed Matplotlib version. Minimal stubs supply the
base Formatter, default configuration, and axis inversion flag; the date and
label algorithms are the pinned upstream definitions.

Reference runtime: Python 3.12.14, NumPy 2.3.5, python-dateutil 2.9.0.post0,
`LC_TIME=C`. The metadata JSON records versions, source hash, exact tick
inputs/options/results, and checksums for the IANA 2026e TZif fixtures.

```sh
python3 scripts/generate_concise_date_reference.py /path/to/pinned/dates.py
python3 scripts/generate_concise_date_reference.py /path/to/pinned/dates.py --check
moon test --target all ticker/date integration/epoch_2400 integration/epoch_fraction
```

The 104 main cases cover all six levels, fractional seconds and shared trailing
zeros, zero formats, custom formats and offsets, show_offset, scalar/cursor
labels, duplicates/singletons, reversed input and inverted axes, TeX string
wrapping, fixed seconds offsets, historical Paris, New York DST and future
POSIX rules. Two additional cases run in the existing isolated custom-epoch
test VMs, checking microseconds near 2400 and a fractional 2000 epoch. Explicit
tick arrays isolate formatter semantics from locator selection.

Historical TZif fixtures use CPython `ZoneInfo.from_file`, which Matplotlib
accepts as a timezone object. This retains abbreviation-only transitions at
equal offsets; dateutil's tzfile reader merges some such types (for example
Paris PMT versus LMT). Future-rule cases also independently exercise dateutil's
equivalent POSIX timezone. The library continues to use the original TZif data
and its existing rule adapter.

The MoonBit port treats an empty tick array as an empty layout and clears the
last offset; upstream raises an IndexError. Date formatting uses the project's
deterministic strftime subset. Optional TeX strings match upstream formatting;
the current SVG text layer does not typeset TeX. These are documented bounds,
not assertions of full locale, strftime or TeX backend compatibility. Python is
only needed to regenerate references, never to run the library/tests.

The retained Matplotlib license is in `LICENSE-MATPLOTLIB`, with attribution in
`THIRD_PARTY_NOTICES.md`.
