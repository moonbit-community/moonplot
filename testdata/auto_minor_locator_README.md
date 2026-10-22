# AutoMinorLocator / NullLocator source references

D23 passed interface generation, formatting, all-target static checking and all-target tests:
7707/7707 each on wasm, wasm-gc and native, and 7714/7714 on JavaScript.
The three source-reference `--check` commands also passed. This is 457 additional
tests per target; the overall project engineering estimate remains unchanged.

The older `auto_minor_locator(subdivisions=4)` helper keeps
its existing per-interval, clipped, validated behavior.

`AutoMinorLocator::new(ndivs=None)` stores an optional
`@config.MinorTickDivisions` without constructor validation. `Text(String)`
retains the exact token, `Number(Double)` retains fractional/negative/NaN/Inf
values, and `Integer(BigInt)` preserves Python-sized integers. Only exact
`Text("auto")` selects automatic 4/5 subdivisions. `set_ndivs(None)` resets the
first-use selection; inherited `set_params()` only records its source warning
and does not update subdivisions. `copy()` shares provider closures but keeps
later subdivision replacement independent.

The first useful `call()` reads scale, then unique major locations. Exact
`"log"` returns no ticks with a warning; fewer than two unique major locations
also returns no ticks. Neither branch captures rc. Otherwise a missing value
captures `ytick.minor.ndivs` only for the owner's exact `"y"` name, and captures
`xtick.minor.ndivs` for other names. A captured `auto` token remains automatic
when the major step changes; subsequent rc changes or rebinding do not reset
it. Capture happens before view/phase errors and persists after a failed query.

The rc setter `set_minor_tick_divisions(value, horizontal=true)` runs the
separate rc conversion contract: case-insensitive auto recognition retains its
original spelling, and numeric or integer-string input becomes a nonnegative
exact `Integer`. This deliberately differs from raw constructor input. Thus
`Text("AUTO")` can be accepted by rc validation but fails when consumed as
subdivisions. Python 3.12's Unicode 15 decimal digits, integer whitespace,
underscores, and fixed 4300-digit conversion limit have source observations;
the host's dynamic `sys.set_int_max_str_digits` setting is not exposed.

The numerical core uses the first two sorted unique majors, including exact
Int64 subtraction and wrap when majors use `TickValues.from_int64_array`.
Automatic mantissa selection uses NumPy's default isclose tolerance. The phase
uses Python ties-to-even round with arbitrary-sized integers and the fixed
NumPy int64/float64/object arange selection, rather than replacing every path
with the Double arange helper. Multiplication and addition retain their
separate rounding. Zero, negative, fractional and nonfinite subdivisions are
queried with source-delayed behavior. The direct `tick_values(lower, upper)`
method is unsupported and raises a checked data error, including after a valid
bound call. The axis adapter uses `call()`.

Four raising callbacks bind the same owner: `bind_scale`, `bind_axis_name`,
`bind_major_ticks` (returning a borrowed `TickValues`), and
`bind_view_interval`. Their getters expose the bound closures. Installing a
handle on another axis changes all four providers together. Source getters
read majors once within AutoMinor and a second time during enabled overlap
removal; the second read can fail independently. External copies retain their
old provider set after the installed handle is rebound or a shared axis is
removed. Shared deletion retains the previously accepted real Grouper order.

The raw `Axis.minor_tick_values_checked` AutoMinor path retains source neighbor
locations outside the view. `set_minor_overlap_removal(false)` disables overlap
removal. When enabled, removal operates in transformed coordinates with
absolute tolerance `abs(transformed_upper-transformed_lower)*1e-5` and zero
relative tolerance. SVG separately clips drawing to the transformed view. The
older generic minor helpers retain their documented clipping behavior.

A secondary axis owns its major locations, axis name, transformed view and
minor locator. Its `set_minor_locator`, `minor_locator`, `clear_minor_locator`,
`minor_tick_values_checked()` and overlap property parallel the primary
interfaces. Its scale name is `function` or `functionlog`, so a log parent does
not cause AutoMinor's exact-`log` early exit. Overlap uses inverse coordinates
and the parent log transform when applicable. For example, parent view [1,3],
forward `2*x+10`, own majors [12,14,15.00005] and subdivisions 2 produce raw
[12,13,14,15,16]. Linear overlap retains [13,15,16], whereas the log parent
retains [13,16]. SVG draws the secondary minor marks in their own coordinates.
This explicit-locator profile does not claim full default scale/units/clear
locator replacement when a parent later changes scale.

`NullLocator::new()` needs no axis. `call()` and `tick_values` always return an
empty array, including NaN/Inf bounds. It inherits `view_limits` with expander
.001 and `nonsingular` with expander .05. Major and minor adapters dispatch
before finite-bound filtering. The raw minor getter still reads majors and the view when overlap removal is
enabled, even when its own Null result is empty; an invalid major provider can
therefore fail that direct getter. Disabling overlap returns the empty result
without those reads. The renderer skips each Null group before
querying tick locations, formatter labels or offsets; one Null group does not
disable the other. An ordinary empty locator is distinct: the original Axis
still asks its formatter to format the empty group.

Both named objects provide `warnings()` as a copied diagnostic array for the
latest operation. `call`, `tick_values`, `view_limits`, `nonsingular` and
`set_params` clear the previous diagnostics; getters and `copy` do not.
`set_params` adds the exact inherited source message. Copies have separate
diagnostic arrays. This typed interface records `_api.warn_external` messages;
it does not reproduce host warning routing/stacklevel or `raise_if_exceeds`
logger handling. Source query errors propagate through checked Axis,
secondary and SVG calls; legacy safe conveniences retain their contract.

## Reproduction and observed scope

Use the fixed development Python 3.12.14 / NumPy 2.3.5 runtime, not a runtime
Python dependency of the MoonBit library:

```sh
python3 scripts/generate_auto_minor_params_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_auto_minor_grid_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_null_axis_reference.py /path/to/pinned/ticker.py --check
```

The parameter oracle currently records 137 rc validation cases, 14 unchecked
constructors, 27 provider-order observations, five copy stages and one inherited
warning, producing 180 generated tests plus four hand tests. The numerical
oracle records 209 cases/generated tests plus four hand tests, two independent
budget omissions, and three safe complete source arrays above the eager cap
(125000/200000/125001 elements). Two large mixed signed-zero arrays were each
queried 1000 times; the original VQSort randomized pivot produced both zero
representatives. Only those source-nondeterministic representatives accept
the observed bit set; small deterministic zeros and other finite results keep
their exact comparisons. Unified acceptance remains pending.

The Null/Axis oracle records 11 Null ranges (direct/call/view/nonsingular), one
warning, 26 primary raw/overlap profiles with both raw and Axis observations,
one later-major-provider failure, 12 owner stages, two real-Grouper deletion
traces with three queries each, eight secondary fixtures with two queries each,
two direct Null-minor overlap profiles, and nine Null-skip profiles. It generates 12 ticker tests and 38 scene tests;
two ticker hand tests, five scene integration tests and three SVG tests add
checked dispatch, duplicate reads/errors, live views, rendered clipping and
independent Null groups. The source methods themselves execute unchanged AST
bodies. Controlled fixtures supply Ticker containers, rc values, event sinks,
known identity/function/log transforms, Tick labels and secondary scale setter
sinks. They do not implement an alternate grouping, overlap or binding oracle,
and they do not render the original Matplotlib backend.

Matplotlib v3.11.2 is pinned at commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`. Verified source SHA256 values:

| Source | SHA256 |
| --- | --- |
| ticker.py | 49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad |
| axis.py | f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0 |
| transforms.py | 109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8 |
| _api/__init__.py | 7e262cedd8ce1a1660c2e2caa63adeb078c29e36bd541b8e6f773cfed4c3c782 |
| figure.py | b440ab0a5be03cb39b13529a2fec497d2d96deb083e3e56d6220593e3ec567da |
| cbook.py | e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643 |
| axes/_secondary_axes.py | b2aaaae077e03ff6538d1a4bf8a69c3476eed0e27120aa567de138c794599a93 |

The parameter generator additionally verifies rcsetup.py and matplotlibrc.
The grid and axis references fix the Darwin arm64 NumPy binary profile,
SHA256 `44fdecc68c23ac6dd5825dc124c801086f7f68dc15ab008ed584ed6a47be6305`;
this does not assert that all NumPy builds choose identical float bit patterns.
The library adds no Python/C runtime or external dependency for this slice.
Default numeric-axis lifecycle, arbitrary Python object/dtype inputs, complete
font/rc/backend behavior and general relim/dataLim caching remain separate
migration work.


The complete D23 acceptance record is in `MIGRATION_STATUS.md`. Interface review
confirmed the intended config, named locator, checked owner and secondary-minor
additions with no date-interface change or external runtime dependency. Static
checking reported only the eight pre-existing Ref deprecation warnings.
