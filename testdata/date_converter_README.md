# Date converter references

`scripts/generate_date_converter_reference.py` executes the original
`DateConverter`, `ConciseDateConverter` and `_SwitchableDateConverter` AST
definitions from Matplotlib v3.11.2 commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`. It reuses the complete pinned
locator/formatter/helper loader from the D08 reference. No installed
Matplotlib is imported. SHA256 checks cover `dates.py`, `ticker.py` and
`mpl-data/matplotlibrc`; the manifest records versions, inputs and outputs.
Reference runtime: Python 3.12.14, NumPy 2.3.5, dateutil 2.9.0.post0,
`LC_TIME=C`.

```sh
python3 scripts/generate_date_converter_reference.py /path/to/pinned/dates.py
python3 scripts/generate_date_converter_reference.py /path/to/pinned/dates.py --check
moon test --target all ticker/date config scene/axis scene pyplot integration/epoch_2400 integration/epoch_fraction
```

The 40 axisinfo cases combine both converter classes, both requested
interval-multiple flags, default/UTC/fixed-second/IANA units, 141-day and
40-hour ranges, custom formats/zero formats/offset formats and offset
visibility. Four switchable cases verify rc dispatch. Assertions compare
conversion, first-element timezone, empty inferred units, label/default
limits, actual alignment, concrete ticks, labels and shared offsets. Four
additional cases run axisinfo constructed before epoch selection in two
isolated custom-epoch packages. They prove that construction/default limits
do not lock the epoch and that subsequent ticks/formatting use it.

Only `units.ConversionInterface`, the keyword AxisInfo container, abstract
ticker/formatter plumbing and the finite typed first-element helper are
stubbed. For a flat finite DateTime array, the first-element helper is exactly
`next(iter(values))`; there is no Python heterogeneous-array or missing-value
filtering claim. Automatic labels invoke the original scalar formatter as
the inherited base tick dispatcher does; concise labels invoke the original
batch formatter. CPython ZoneInfo reads the retained New York TZif fixture.

The original concise constructor assigns its requested alignment flag, then
calls `super().__init__()` without forwarding it. The pinned superclass
overwrites it with `true`. The port and reference deliberately retain this
behavior, including switchable rc dispatch; ordinary DateConverter honors
the requested flag.

The MoonBit API accepts `DateTime` or flat `Array[DateTime]`. Existing
DateTime values always carry an explicit offset, including UTC; there is no
separate naive datetime type. A retained rule zone is inferred unchanged,
otherwise an exact fixed-second zone is inferred, and an empty array returns
None. NumPy datetime64/masked arrays, dynamic Python types and a generic
units registry remain outside this slice. Concise format arrays use the
existing typed formatter's validation (including its documented empty-array
default extension).

DateAxisInfo getters share that info's live locator/formatter binding;
`copy()` creates an independent rebound pair. Axis installation captures
configuration and keeps explicit locators, fixed ticks/labels and timezones.
Shared-axis setters validate all members before writing. Handwritten tests
cover copying, rc snapshots, atomic validation, empty date plots, subsequent
series, SVG shared text/XML, x/y and pyplot. The Matplotlib license and
attribution remain in `LICENSE-MATPLOTLIB` and `THIRD_PARTY_NOTICES.md`.
