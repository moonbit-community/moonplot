# Epoch reference assertions

`scripts/generate_date_epoch_reference.py` executes only `_dt64_to_ordinalf`,
`date2num`, `_from_ordinalf` and `drange` extracted from Matplotlib v3.11.2
commit `d3ca9172e392048ec242b90e8423e88d1a3000b2`. It verifies the SHA256 of the
complete upstream `dates.py` before evaluating those functions. No installed
Matplotlib version is imported. The original Matplotlib license is retained
in `docs/licenses/LICENSE-MATPLOTLIB` and `docs/THIRD_PARTY_NOTICES.md`.

Reference environment: Python 3.12.14, NumPy 2.3.5, python-dateutil 2.9.0.post0.
The generator needs these packages; checked-in MoonBit assertions do not.

```sh
python3 scripts/generate_date_epoch_reference.py /path/to/pinned/dates.py
python3 scripts/generate_date_epoch_reference.py /path/to/pinned/dates.py --check
moon test --target all tests/integration/epoch_*
```

Seven independent packages select 2000, 2400, legacy `0000-12-31`, an hourly
origin, a microsecond origin, a BCE origin, and year 10000. Each package has a
fresh date module instance; no public reset hook or test-order dependency is
required. In total, 3752 forward/inverse cases cover calendar boundaries,
microsecond rounding, deterministic random dates and seconds-level offsets;
84 inverse probes cover both sides of the distant-date correction threshold
and overflow; 14 range cases cover hourly and subsecond sequences. The JSON
manifest records versions, the source checksum, probes and sequences.

The subsecond origin intentionally retains upstream asymmetry: forward
conversion truncates the epoch to seconds, while reverse conversion adds the
full origin. Calendar occurrence objects and exact timezone conversion do not
gain that public numeric displacement. Additional handwritten integration
checks exercise configuration and locking, pure rule construction, IANA DST
and future folds, locator phase, cached recurrence queries, and SVG labels via
scene and pyplot. Invalid epoch strings fail atomically in this port; upstream
instead defers validation until conversion.
