# Line2D None/Double alpha reference

This reference executes fixed Matplotlib v3.11.2 code under CPython 3.12.14 and
NumPy 2.3.5. All 59 preparation records, their original count fields, three method
hashes and the complete host declaration are preserved unchanged. The profiles
are 22 Artist setter observations, 28 color-override primitives, four native
private-cache warm-order observations and five solid/no-marker draw observations.

There are 55 typed projections and four source-only cache records. The generated
Scene file has three registered tests: one continuous 22-operation setter
sequence, one 28-primitive override group and one group of five independent leaf
draw scenarios. These counts describe actual distinct source profiles; they do
not claim 59 complete GUI, native renderer or SVG parity cases.

Preparation JSON SHA256:
`fed6aaf21b91b59fd733a6c2184ce0b7ccf0dff8c5888d99b2994670d3c966f2`.
Formal JSON SHA256:
`fbe80dd2023fb7d2525bc883d748911de136f49cd03146d9a883d6649323ae94`.

## Reproduction

From the repository root:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_alpha_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_alpha_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py --check
```

Generation writes `line_alpha_reference.json` and
`../scene/line_alpha_reference_wbtest.mbt`. `--check` executes the original code
again and compares both generated files. The tracked generator reuses the
accepted D39/D49 actual-source namespace and fixed downloads; it never loads an
ignored preparation script or its expected JSON. No Moon algorithm supplies
expected values. Source formatting uses stdin-only `moonfmt -`; this is not a
compiler or behavior acceptance result. Root runs project gates separately.

## Fixed original code and host

The generator executes complete original `Artist.get_alpha/set_alpha` bodies
with actual `numbers.Real`, complete original color validation/RGBA helpers and
the original named table. `Line.draw` is complete original AST with solid style
and no marker. The rasterization decorator is excluded from execution; its source
remains covered by the whole pinned file hash. Method-body segment hashes start
at the original `def` and are retained separately in JSON.

| Original source | SHA256 |
| --- | --- |
| `artist.py` | `c55a81d86db60ab7b22fcd6e70401aa84558de5d1ba6e40a16c60f6f1f03be7a` |
| `lines.py` | `e928511cec1f9ce19455008c1863d337b0dbd1c71ac2b8d40224c8d5c069e05c` |
| `colors.py` | `ef4173f9e8310bc75714e32c3855719c27916c6c651b5c94e39f00163842cf04` |
| `_color_data.py` | `93ec1d4e2e80ac9c64b2a05f313fbb532daa5b3f175f84e1e60b237f7d82c263` |

Artist has an explicit mandatory hash check in this generator; accepted loaders
retain their existing fixed-source/runtime guards and mandatory official-tag
color downloads. The numeric Line/unit/path storage host is inherited from those
loaders. The rc/cycler capability is declared stored data with `by_key`, rather
than arbitrary RcParams validation, custom Cycler behavior or an Axes iterator.

The original `pchanged` call is observed by a controlled stage sink, recording
alpha and stale at that point. It is not a new public callback or GUI stale
propagation contract. Draw supplies already transformed numeric Path storage,
GC configuration sinks and renderer group/path presentation sinks. Neither
visibility, alpha0, empty-path selection nor color conversion is reimplemented
in the host.

## Optional alpha setter projection

The public typed inputs are required `Double?`: None or Some Double. The source
first validates numeric type and inclusive [0,1], then changes state only when
new alpha differs. A successful unequal value is assigned before `pchanged`,
and stale=True follows the observer. Equal values perform no assignment and no
stale transition. The typed API has no callback extension.

The sequence covers repeated None and .5/1; both directions of equal signed
zero; None/zero changes; NaN, infinities, negative minimum subnormal and the next
Double above1; minimum positive subnormal and the next Double below1. In the
original clean-stale inputs, every invalid value preserves alpha/stale and emits
no pchanged observation. Complete native ValueError messages are retained and
compared through the existing Core InvalidTicks type-prefixed mapping.

Positive zero followed by negative zero retains positive bits. None followed by
negative zero stores negative bits; a subsequent positive zero retains them.
This is exact original no-assignment behavior, not zero normalization. Raw alpha
getter values are compared bit-for-bit, including zero sign. NaN inputs fail
before becoming stored alpha, so there is no NaN payload-storage promise.

Before each operation, private `mark_drawn` supplies the native controlled
stale=False input only; it does not render or claim a completion. At row20,
private `line.detach()` supplies the original explicit ownerNone input without
clearing the Axes or resetting cached ranges. The same retained Axes dataLim and
requests remain observable. This is not a second reconstruction of clear/remove.

All before/after checks cover optional alpha, stale, raw color, width, invalid
flags, directly retained cache, dataLim, requests and ownerNone. No processed
lazy getter is used to record cache. Color provenance and data conversion are
independent of alpha. Bool/Int/NumPy Real origins, arbitrary non-Real errors and
throwing GUI callbacks are outside the required None/Double API domain.

## Original RGBA override and native cache boundary

The 28 primitives cover red, none, #1234, #11223344, #0000, C0 and C1, with None,
+0, .25 and1. The controlled global cycle is ['#11223344','none']; tests restore
the previous typed global cycle. Every expected four-component bit vector is
from actual original `to_rgba(color,alpha)`.

None preserves an embedded alpha. An explicit numeric alpha replaces it, rather
than multiplying: #11223344 + .25 and #0000 + .25 both have alpha .25. Raw none
ignores these valid overrides and remains zero RGBA; C1 selecting none does the
same. The none rule cannot be inferred only from an already transparent tuple.
C lookup remains live and independent from axes automatic-cycle consumption.

Four separate original cache records retain exact native sign-history results.
After a native cache clear, -0 then +0 returns negative-zero RGBA alpha twice;
+0 then -0 returns positive-zero alpha twice. The Python cache keys treat zero
signs equal. These four observations remain source-only and unchanged: no
mutable native cache protocol or arbitrary-history bit clone is migrated.
Portable derived RGBA constructs the current override sign. This boundary is
separate from the strict raw alpha setter/getter zero-sign contract. No expected
bits are rewritten and no tolerance replaces the ordinary 28 primitive checks.

## Actual leaf draw projection

All five original draw profiles have alpha0:

- Normal nonempty red still reaches GC foreground, draws, restores GC and
  completes with stale=False.
- Pending bad shape fails in recache before renderer/color work, keeping old
  geometry and stale=True.
- Nonempty C4301 still reaches the deferred color error and keeps stale=True.
- Empty C4301 skips color conversion and completes stale=False.
- Hidden pending bad shape and C4301 skips all work and retains stale=True.

Typed tests invoke the actual exported `Panel.prepare_line`. Its successful
return supplies the completion, including the hidden no-op. When preparation
raises, no completion is invoked. The fixture has no rendering branch for
alpha0, empty or visibility and does not clear stale manually. Original
renderer, pchanged and rc event traces are evidence without a new host callback
protocol. The established D39 shape-error mapping retains the exact native
message without a ValueError prefix; newer Artist/color errors retain the native
type prefix. Both boundaries are explicit and checked exactly.

Source String mode uses real RGBA override before the existing CSS projection.
Legacy arbitrary CSS instead uses optional Line-only stroke-opacity composition;
that convenience profile may multiply an embedded CSS alpha and is not native
color override. Existing `Rgba.to_css`, SVG opacity/number text, viewer behavior,
rasterization and whole Figure/GUI rendering remain outside this source profile.

## Acceptance

Root's complete suite passed: wasm/wasm-gc/native each 22,155 tests, JavaScript
22,162. The slice adds 18 registered tests: three source groups and 15 kernel/
render/public regressions. All original 59 records, three method hashes and host
metadata are independently unchanged. Source `--check` passed; separate review
confirmed raw optional-value/observer/override/cache boundaries and actual
provider completion order. Among 41 interfaces, only core/root Style transport,
Scene alpha methods and ticker's existing float-repr wrapper changed; the other
37 remain byte-identical.
