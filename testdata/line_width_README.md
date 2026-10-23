# Line2D solid linewidth reference

This reference executes fixed Matplotlib v3.11.2 source under CPython 3.12.14 and
NumPy 2.3.5. It preserves 39 original observations: 28 Line setter records and
11 independent GraphicsContext/SVG style primitives. The 28 setter records form
two continuous typed scenarios in one registered Scene white-box test. The 11
SVG primitives are source-only evidence, with their complete native results
retained in JSON; they do not assert typed CSS or full native-renderer parity.

The earlier preparation records' complete before/after fields and native outputs
are unchanged. Formal metadata adds reproduction URLs, counts and explicit
projection boundaries. The preparation JSON SHA256 was
`1e8f2db4d7ed55ac6f022a8f8f14833a9bb6ed07256da023f5178421dd9b373f`.
The formal JSON SHA256 is
`63bac549a89c0363ffc5cce4a756abd182b4f9d70733f4cbe49510c66386d88e`.

## Reproduction

From the repository root:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_width_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_width_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py --check
```

Generation writes `line_width_reference.json` and
`../scene/line_width_reference_wbtest.mbt`. `--check` re-executes original source
and compares both generated files. Moon formatting is stdin-only `moonfmt -`;
its completion is not a compiler or behavior acceptance result. Project static,
interface and four-target behavior gates are performed separately by Root.
No Moon implementation is consulted to create expected values.

## Original source and host

The accepted `generate_line_units_reference.py` loader verifies Line2D source
and its real unit/data dependencies. This generator compiles complete original
`get_linewidth`, `set_linewidth` and `_scale_dashes` AST bodies, then executes them
on the existing short/default Line numeric data host. An explicit initial width
of 2 matches the typed `plot_line` convenience setup; it does not claim native
Line2D's rc default is 2. Numeric originals on an initialized category x-axis
exercise the existing native-number bypass without changing the converter.

Additional source files are downloaded only from the official fixed v3.11.2 tag
when absent, then mandatory SHA256 checked before AST execution. A mismatching
cache or download is rejected. The generator never loads the preparation probe
or its JSON from ignored files.

| Original file | SHA256 |
| --- | --- |
| `lines.py` | `e928511cec1f9ce19455008c1863d337b0dbd1c71ac2b8d40224c8d5c069e05c` |
| `backends/backend_svg.py` | `c489775b9891f18bfb31b706e72406da267a9b52033a5d1fd60e59230c48d565` |
| `backend_bases.py` | `a2b147fb149d8862fad874991f79a61cf76da3477dfd58af99755a8f9f80c074` |
| `colors.py` | `ef4173f9e8310bc75714e32c3855719c27916c6c651b5c94e39f00163842cf04` |

The JSON records full official source URLs and complete method-body segment
hashes. The accepted actual RcParams host's selected validator table is extended
for `lines.scale_dashes` with its identical real `validate_bool` function. No
validator or width/dash computation is replaced.

For the separate SVG primitives, original consulted GC getter/setter methods and
complete `RendererSVG._get_style_dict/_get_style`, `_short_float_fmt` and
`_generate_css` bodies execute with solid dashes, no hatch, no face, black numeric
RGBA, round join and butt cap. Actual complete `to_hex`, `to_rgba` and numeric
RGBA helpers execute; `rgb2hex` is not a constant stub. The actual `_ColorMapping`
starts with an empty named-color cache because this profile supplies no named
color. This is not a new public color-validator, arbitrary GC or full renderer
contract. GUI stale callbacks and rasterization are not reconstructed.

## Typed setter projection

The public stable handle exposes `get_linewidth()->Double` and
`set_linewidth(Double)->Unit`. Original order is float conversion, IEEE inequality
comparison for marking stale, unconditional width assignment, then native dash
recalculation. The typed Double input is already a float and the solid-Line
slice has no dash slot or new dash rc API.

Each of the two source scenarios uses the same 14-step input sequence:

```
2, 2, 1, .25, +0, -0, -2, NaN, NaN, +Inf, +Inf, -Inf,
minimum positive subnormal, maximum finite Double
```

Native scenarios respectively set `lines.scale_dashes` True and False. All native
dash offsets, offset types and dash sequences remain in JSON as original source
evidence. The typed tests do not assert nonexistent dash state or introduce a
new rc setter to mimic it. Native `_scale_dashes` reads live rc on every width
setter, including equal widths; in solid style its dash sequence stays None.

Before each operation the native controlled host clears stale. The Moon fixture
uses private `mark_drawn` solely to supply this same input state; it does not
render, perform a hidden branch, invoke a completion or claim a native draw.
Each operation checks width, stale, invalid flags, retained cache, dataLim and
request flags before and after. Direct cache inspection avoids lazy conversion.
Failures retain the source row ID and scenario in their diagnostic.

All finite values, signed zero and infinities are compared by exact Double bits.
NaN is compared by classification; its recorded native bits are evidence rather
than a portable NaN payload promise. `+0` followed by `-0` stores the new sign but
does not mark stale. Repeated NaN marks stale; repeated infinity does not. No
negative, finite or positive guard is added. Setters do not recache, convert
units, relim or request autoscaling. Existing True stale is never reset by the
setter; clean-stale input here isolates the original inequality behavior.

## Native SVG evidence and explicit boundary

The 11 original SVG primitives retain input/GC bits, raw style dictionaries,
CSS strings and exceptions. All succeeded in this host:

- Both zero signs omit the entire stroke.
- Width 1 includes a stroke but omits `stroke-width`, using SVG's default.
- Widths 2 and .25 emit `2` and `0.25`.
- Negative and nonfinite widths emit `-2`, `nan`, `inf` and `-inf` literally.
- A positive minimum subnormal emits a stroke with width string `0`.
- Maximum finite width emits a long fixed decimal, without scientific notation.

The native formatter uses six-place fixed decimal text then strips trailing
zeros and the decimal point. Width truthiness is tested before text formatting.
The existing typed serializer has its own convenience style/number profile;
these omitted-stroke/default-width/fixed-format results are deliberately not
asserted as migrated CSS parity. Native text emission also does not establish
that SVG viewers accept or meaningfully render negative or nonfinite widths.
This slice does not migrate dashes, marker styling, arbitrary Python numeric
conversion objects, complete GUI callbacks or a general Artist style system.

## Acceptance

Root four-target suite passed in full: wasm/wasm-gc/native each 22,115 tests,
JavaScript 22,122. The slice adds 13 registered tests: one source group (28 setter
operations in two continuous sequences), 11 kernel/render/public hands, and one
root public snapshot regression. All 39 preparation observations and five method
segment hashes are independently unchanged. New and adapted old generators'
`--check` passed. Only Scene's two linewidth methods and the internal render
provider's Style-bearing triple changed among 41 generated interfaces.
