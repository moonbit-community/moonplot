# Line2D String color and complete named-color reference

This reference runs fixed Matplotlib v3.11.2 methods under CPython 3.12.14 and
NumPy 2.3.5. All 49 preparation records remain complete and unchanged: 46 String
setter operations, one unchanged-raw live-cycle observation, and two native
mutable-RGB list records. The first 47 project onto the typed String API; the two
list/alias records remain source-only.

Additional independent original observations are four Unicode/digit-limit String
records, three solid/no-marker draw records and 1163 complete named-color RGBA
primitives. Totals are 1219 source observations, 1217 typed observations and two
source-only observations. These categories describe their actual host profiles;
they are not 1219 full GUI or SVG parity claims.

Generated Scene tests have seven registered groups: one group for two continuous
String/live-rc sequences, one for three independent draw projections, and five
for the full named table. Named primitives are split into 37 helper chunks of at
most 32 names, with at most eight chunks per registered group. This retains every
case without one oversized test driver.

Preparation JSON SHA256:
`456ca1f3cb8b01962cac220bbccd9c7046c73674b01fec0c9d45adbee4f1dbc5`.
Formal JSON SHA256:
`0204a03101c2409ed11433969c17db5a5bcae391c731e1d38cc420f4ee147689`.

## Reproduction

From the repository root:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_color_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_color_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py --check
```

Generation writes this directory's `line_color_reference.json`,
`../scene/line_color_reference_wbtest.mbt` and the production exact lookup
`../scene/line_color_names.mbt`. `--check` executes the source again and compares
all three generated outputs. The tracked generator does not import ignored
preparation scripts or JSON. Moon formatting uses stdin-only `moonfmt -`; its
completion is not a compiler or behavior acceptance result. Root runs project
static, interface and four-target behavior acceptance separately.

## Fixed complete original code

The accepted `generate_line_units_reference.py` loader validates Line and real
unit/data dependencies. The new generator executes complete original
`Line2D.get_color/set_color`, `_ColorMapping`, `_is_nth_color`, `is_color_like`,
`_check_color_like`, `to_rgba`, `_to_rgba_no_colorcycle` and `to_hex` bodies. It
executes the entire fixed `_color_data.py` and all original map-construction and
alias statements, in order. Neither the Moon lookup nor existing convenience
color parsing generates expected results.

Missing additional source files are downloaded only from the official fixed tag;
SHA256 is mandatory before execution, whether downloaded or already cached.
A mismatch is rejected. Full URLs and method-body hashes are retained in JSON.

| Original source | SHA256 |
| --- | --- |
| `lines.py` | `e928511cec1f9ce19455008c1863d337b0dbd1c71ac2b8d40224c8d5c069e05c` |
| `colors.py` | `ef4173f9e8310bc75714e32c3855719c27916c6c651b5c94e39f00163842cf04` |
| `_color_data.py` | `93ec1d4e2e80ac9c64b2a05f313fbb532daa5b3f175f84e1e60b237f7d82c263` |

Official additional sources:
[colors.py](https://raw.githubusercontent.com/matplotlib/matplotlib/v3.11.2/lib/matplotlib/colors.py),
[_color_data.py](https://raw.githubusercontent.com/matplotlib/matplotlib/v3.11.2/lib/matplotlib/_color_data.py).
The complete original draw method-body segment SHA256 is
`ee628cb4b23f6962db6545669991f0d9c065a6ee0d1bd5c23c7c50f083136cb1`.
This segment starts at `def draw`; the rasterization decorator is excluded from
execution and is covered by the whole original file hash instead.

## String setter and state projection

The source validates first, stores the original value, then unconditionally marks
stale. Repeating the same valid color still marks stale. Failure preserves the
previous raw color and stale state. The typed getter returns the exact raw String,
including case, grayscale whitespace or leading zeros; it does not return a
normalized CSS spelling or RGBA carrier.

The source setup explicitly seeds black and linewidth2 and uses the existing
numeric-Line/unit host. This matches the typed explicit-color plot bridge, not
native constructor/default-color parity. Before each setter, native controlled
stale=False maps to private `mark_drawn` solely as a fixture input; it is not a
render or completion claim. Every before/after assertion checks raw color, stale,
width, invalid flags, retained cache, dataLim and request flags. Direct retained
storage reads avoid a lazy conversion in an assertion.

Native module color-cache sizes, Python object identity and rc/cycler read traces
are preserved as evidence without introducing public cache or callback protocols.
The Rc/CycleData host supplies stored `axes.prop_cycle` and its `by_key()` data;
it does not implement arbitrary RcParams validation, custom Cycler behavior or
an Axes color iterator. RGBA helper observations are checked separately from
serialization. Full native errors retain type/message fields, mapped to existing
Core InvalidTicks with the exact native type prefix and full message.

The matrix includes names and aliases, uppercase forms, four hex lengths,
case-insensitive `none`, float grayscale strings, invalid strings, cycle indices
and live global cycle replacement. Empty String, `transparent`, single uppercase
`R`, surrounding whitespace on names, invalid hex and CSS function syntax fail.
Python-float grayscale accepts native whitespace, Unicode decimal digits and
underscores, then applies the closed interval [0,1]; NaN/infinities fail. `-0.0`
remains a signed negative zero in raw conversion components.

C syntax is capital ASCII C followed by one or more ASCII digits. Validation
accepts it without rc access or integer conversion. Later RGBA conversion reads
the current global cycle, selects by integer modulo and does not consume the
local axes cycle. A 24-digit index and leading zeros work; 4301-digit indices
are accepted by the setter but fail at later conversion under the fixed CPython
4300-digit profile. Both all-nines and all-zeros failures are retained. Exactly
4300 leading zeros succeed. The global cycle replacement changes C0's RGBA while
its raw String and Line state remain unchanged.

The extra Unicode records establish `PINK` resolving through native lowercase to
pink, while the single-character Kelvin sign is rejected because the source does
not retry lowercasing a one-character input. The complete named map is ASCII.
Root independently verified CPython Unicode15 lower(): U+212A is the only
non-ASCII codepoint that lowercases entirely to ASCII. This finite lookup rationale
is distinct from the saved Matplotlib observations.

## Complete generated name lookup

The original map contains 1163 names: 949 XKCD entries, 47 generated XKCD
 grey-to-gray aliases, 148 CSS4 entries, 10 Tableau entries, one generated Tableau
 gray-to-grey alias, and eight base colors. Original update order is retained;
exact lookup is performed before multi-character lowercase fallback.

Every saved named primitive includes the name, original map value, actual RGBA
components and exact Double bits. The production private exact lookup is generated
from those actual original conversions, merging equal RGB bit vectors only to
reduce repeated branches. All named alphas are independently checked to be one
before emitting the constructor's default alpha. `g` retains exact .5 green;
`green` retains 128/255. No byte-normalization replaces original floating values.

The named tests check both the production exact lookup and the unified private
RGBA helper against every native bit vector. Names, RGBA components and the
production table are not manually transcribed. NaN classification is used only
where raw data snapshots contain NaN; finite numbers, signed zero and infinities
are compared by bits.

## Complete draw timing and renderer boundary

Three new observations execute the complete original `Line.draw` body with solid
style and no marker. The host supplies already transformed numeric Path storage
and presentation sinks for GC configuration/clipping and renderer group/path calls.
It has no replacement `if empty` or color-conversion algorithm.

Empty path + accepted raw C4301 opens/closes the group, skips GC/color conversion
and clears stale. Nonempty finite and nonempty all-nonfinite paths both configure
GC then reach real `to_rgba`, fail at the same late index conversion and retain
stale. Filtering by finite points before deciding whether to resolve color would
lose this source distinction.

The typed draw projections call the actual exported `Panel.prepare_line` and its
returned success completion. The fixture does not branch on empty/visibility,
resolve color itself or manually clear stale. Whole Figure drawing, GUI callbacks,
transformed-path implementation and rasterization remain outside this numeric
leaf-stage host. The raw String/actual RGBA contracts do not imply native SVG CSS
text: current `Rgba.to_css` and numeric formatting remain a declared serializer
convenience profile, including its opacity/rounding choices.

The two original mutable RGB-list records retain the native borrowed-object
behavior and later mutation failure as source-only evidence. No public mutable
RGBA carrier, arbitrary Python object conversion, custom color-map mutation,
full Cycler protocol or general Artist color system is claimed by the String API.

## Acceptance

Root's complete suite passed on all four targets: wasm/wasm-gc/native each
22,137 tests, JavaScript 22,144. The slice adds 22 registered tests: seven source
groups plus 15 kernel/render/public regressions. Original49 and completeDraw3
preparation records, method hashes and host descriptions are independently
unchanged; a separate review compared all 1163 generated names/channel constants
with the original JSON bit vectors. New and adapted old generators' `--check`
passed. Of 41 interfaces, only the two Scene color methods and ticker's thin
existing Python String repr export changed; the other 39 are byte-identical.
