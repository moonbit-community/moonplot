# Named PercentFormatter

D30 is accepted. Unified checks, generated-interface review, original-source
reference checks and all four target suites passed. There are 2293 new tests;
wasm/wasm-gc/native each pass 19801/19801 and JS passes 19808/19808. The eight
pre-existing Ref warnings remain, with no new warnings. The full implicit
formatter and Text lifecycle remains separate migration work.

`PercentFormatter` is a live named object. Install `as_base_formatter()` with
primary or secondary `set_named_formatter` / `set_minor_named_formatter`.
Defaults are `xmax=PercentXMax::Number(100)`,
`decimals=PercentDecimals::Automatic`, `symbol=Some("%")`, `is_latex=false`.
The old immutable `Formatter` enum and pure percentage convenience helper keep
their existing behavior.

`xmax` preserves typed Python Number/Integer/Boolean and NumPy Float64/Int64
origins. Construction executes the original `xmax + 0.0`; `set_xmax` stores a
raw replacement. Decimal precision is Automatic, Number, Integer, Text or
Boolean, with integer conversion delayed until formatting. `fmt` and a fabricated
`set_params` are not part of this class. Copies have independent parameter slots
and share their current axis binding and locations; offset is always empty.

## Number and symbol behavior

Conversion follows `100.0 * (x / xmax)` in the original scalar order. Automatic
precision uses the absolute axis range, scaled through the same conversion,
and the original `ceil(2 - log10(2 * scaled_range))`, limited to 0–5 places only
in Automatic mode. Explicit precision keeps source conversion, error order and
valid large output behavior. The exact fixed-point digit formatter from D29 is
reused without its legacy convenience limits.

`convert_to_pct` and `format_pct` do not require an axis. `format_pct` appends the
current symbol but does not apply Unicode minus. A call, including inherited
`format_data` / `format_data_short`, reads its axis first and applies the current
Unicode-minus setting after number and symbol formatting. Pos is ignored.
A callback that changes precision or rc while returning the range therefore
affects the same call.

The symbol getter reads `text.usetex` dynamically. None and empty symbols return
empty; `is_latex=true` bypasses escaping. Otherwise the original reserved
characters are escaped in the original order, beginning with backslash. This
implements label strings, not a TeX typesetter. NumPy arithmetic warnings are
recorded separately in references; they are not fabricated formatter diagnostics.

## Live axis intervals

`FormatterAxisBinding` carries stable identity and an optional live, raising
view provider. Its interval is `FormatterViewInterval::Sequence(Array[Double])`,
`Integers(Array[BigInt])`, or `NdArray(TickValues)`. `set_view_interval` retains
the supplied interval and replaces a provider; `bind_view_interval` installs a
provider. Ordinary new bindings have no view until configured. A dummy has the
original Python-integer default `[0, 1]`; `create_dummy_axis` only creates one
when the formatter is unbound.

Each formatted value reads the provider once, even with explicit decimals.
Empty batches assign their locations but do not read a view. A later failure
retains the full batch locations and stops subsequent calls. Full primary major
ticks are formatted before querying/formatting minors and before visibility
filtering. Offscreen values can therefore raise an error. Secondary ticks are
formatted in their own coordinates before display inversion.

The scalar domain of the view is preserved through subtraction and absolute
value. NumPy Int64 subtraction wraps, including the absolute value of Int64.MIN.
A Python-integer dummy range, a Python-float range and a NumPy-float range can
produce different zero-division/error behavior with the same raw zero `xmax`.
These are tested as distinct inputs. A floating materialization before range
arithmetic would lose that contract.

Primary bindings read the actual current view as a Float64 array. Explicit
limit changes inside a major callback are visible to subsequent formatter calls
and to the final visibility filter. Shared tickers use the last formatter
installer's axis. Removing that axis rebinds installed major/minor formatters to
the first remaining source-order sibling; external copies retain their old
binding. Controlled local views in the shared reference expose ownership; this
does not assert that normal shared Matplotlib axes have unsynchronized limits.

## Secondary synchronization and frame order

A secondary formatter reads its stored own view. With a linear parent this is
initially `[0, 1]`; direct calls do not eagerly apply the parent mapping.
`apply_aspect()` performs the source `_set_lims` synchronization. Parent changes
leave the stored view unchanged until synchronization. The default layout and
child draw synchronize and format the secondary before primary-axis callbacks,
matching the original secondary zorder 0 versus primary-axis zorder 1.5.
A parent callback can thus observe the new primary range and the secondary
range already used earlier in that frame. Later explicit synchronization updates
that secondary range.

Synchronization validates mapped endpoints before locator nonsingular handling.
Equal finite values expand according to the installed major locator; inherited
expansion is 5%. Direct NaN/Inf or mapping overflow is rejected. The source does
not repeat its finite check after nonsingular expansion, so finite MAX endpoints
can produce and retain an infinite expanded endpoint.

A log parent has a different initial stored view: installing the original
functionlog scale changes its nonsingular defaults and invokes empty-data
autoscaling during construction. The focused original-source profile uses data
mode and the default captured x/y margin 0.05. Identity mapping starts near
`[0.8912509381337456, 11.220184543019636]`. Mapping `2*x+5` / `(x-5)/2` starts
at `[5, 5.234401174884448e50]` because original LogTransform clips the lower
inverse value to -1000 before margin expansion. The first `apply_aspect` with
parent `[1,100]` instead stores `[7,205]`. These constructor observations are
separate from full default-locator installation, tight layouts or every rc
combination. These geometry-derived constructor bounds reuse the existing portable Log
geometry profile and use relative tolerance 1e-12 with no absolute floor;
percentage strings and error messages remain exact. Changing the parent scale
after construction and the complete implicit scale/default reset lifecycle
remain separate work.

## References, reproduction and limits

The shared `formatter_reference_source.load_percent_formatter` executes the
complete original class, inherited basic classes, and real `_api` and
deprecation descriptors. Axis references additionally execute original interval
getter/setter factories, formatter installation, `_update_ticks`, `_set_lim`,
Grouper/Figure removal, complete SecondaryAxis, original `autoscale_view`,
Figure layout and Axes draw ordering. Known numeric Bboxes, identity units,
Text/Tick storage and GUI/super-draw sinks are explicit. Moon algorithms do not
generate expected labels, binding order, limits or exceptions.

The parameter reference has 257 observations and 92 generated + 4 hand tests;
10 additional dynamic-Python observations are source-only. Numeric references
have 2076 generated + 3 resource hand tests, including 693 precision-threshold
pairs evaluated with both native original log10 and an independent high-precision
profile; none differs. Axis references have 117 original observations and 117
generated tests. Runtime warning routing, arbitrary dynamic Python objects and
shape/broadcasting remain distinct from the typed one-dimensional contract.
No Python or NumPy runtime dependency is introduced.

Matplotlib is fixed at commit `d3ca9172e392048ec242b90e8423e88d1a3000b2`.
`ticker.py` SHA256 is
`49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad`;
the complete PercentFormatter class hash is
`ce16ea47e597ba4e9107b3c068fdfe2740660a3455338b7739319b60a0e0eb2a`.
Other source hashes, CPython 3.12.14 and NumPy 2.3.5 metadata are in each JSON.
The numeric reference retains the fixed Darwin arm64 NumPy profile; portable
log10 uses the existing D26 mathematical profile.

From the repository root, run the fixed Python interpreter with the pinned
`ticker.py` positional path. Generate first, then repeat each command with
`--check`:

```text
scripts/generate_percent_formatter_params_reference.py TICKER [--check]
scripts/generate_percent_numeric_reference.py TICKER [--check]
scripts/generate_percent_formatter_axis_reference.py TICKER [--check]
```

Source exceptions propagate through the checked chain with their Python class
prefixed in `Core.DataError::InvalidTicks`, including the new secondary
synchronization's original ValueError message. Existing primary limit validation
retains its typed Core errors. Valid output beyond portable String addressability reports an
explicit resource boundary before allocation. Dynamic object operators, full
implicit defaults, Text/TeX rendering and complete GUI/layout infrastructure are
not covered by this named formatter slice.
