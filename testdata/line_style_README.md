# String Line linestyle references

`line_style_reference.json` records 76 actual-source profiles from fixed
Matplotlib v3.11.2 under CPython 3.12.14 / NumPy 2.3.5. The generated Scene
white-box tests project 69 profiles onto the typed implementation. Seven native
non-String linestyle profiles remain complete source-only evidence.

The JSON retains three independent original groups, including every original
field, count, source hash, method-body hash and host-boundary statement:

| Group | Records | Typed projection |
| --- | ---: | ---: |
| `main.string_observations` | 18 | 18 |
| `main.coupling_observations` | 12 | 12 |
| `main.rc_pattern_observations` | 6 | 6 |
| `main.native_container_observations` | 7 | 0 |
| `main.draw_observations` | 9 | 9 |
| `suggestions.observations` | 20 | 20 |
| `sum.observations` | 4 | 4 |

Five registered tests carry the String sequence, history sequence, ten rc/sum
scenarios, twenty suggestion primitives and nine draw scenarios. Each group has
at most 32 source cases. Registered-test counts and source-record counts are
separate; there is no claim that native dynamic Python carriers are supported.

## Reproduction

From the repository root, use the fixed bundled Python runtime:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_style_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_style_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py --check
```

The generator is self-contained tracked code. It reuses accepted source loaders
and fixed downloaded source files; it never imports an ignored preparation
probe or reads an ignored expected JSON. Missing backend source is obtained by
the accepted fixed-tag loader. Missing CPython `bltinmodule.c` is downloaded
from the fixed official v3.12.14 URL and checked against its mandatory SHA256.
Both normal generation and `--check` execute the original code again.

Expected values come only from complete original Line methods, dash helpers,
real RcParams setters and validators, the real API suggestion helper, actual
CPython difflib and builtin sum, and complete original GC dash validation.
No Moon implementation supplies expected values.

The generator verifies these complete-group SHA256 values before emitting the
combined document. This prevents later primitive additions from silently
rewriting the original 52 Line observations:

```text
main 821b7a4ef0b733481df633ec1dc441bf4cbf3c45cb3fbcf289bb438becffedfe
suggestions 2f1f32bd65b99812a0375d53660184e28d408e55b16a2d0f864f454396eb2ab5
sum c437ee98595368376dd181c5716e3f7e7720cbea630e2f025039f7eb6e763afe
```

## String setters and retained state

The original accepted String spellings are `-`, `--`, `-.`, `:`, `None`, one
space, empty String, `solid`, `dashed`, `dashdot`, `dotted`, and the special
lowercase `none` normalization. The getter returns the canonical spelling.
Other case variations are rejected with the original fuzzy suggestion message.

A valid repeated linestyle setter still recomputes patterns and marks stale.
An invalid String is checked before canonical, unscaled, scaled or stale state
changes. The fixtures compare before and after canonical style, width,
unscaled/effective offsets and optional sequences, stale, invalid-coordinate
flags, existing flat cache, dataLim, autoscale requests and current dash rc.
They also retain color, alpha and visibility checks. Cache observations read
private stored buffers, without a lazy processed getter.

`mark_drawn` before each setter supplies the controlled native clean-stale
input. It is not a drawing claim. Initial linewidth 2 is the existing typed
plot convenience bridge used by the source host, not the native Line2D default.

## Captured patterns and live scale setting

Original defaults are dashed `[3.7, 1.6]`, dashdot `[6.4, 1.6, 1.0, 1.6]`,
dotted `[1.0, 1.65]`, with `scale_dashes=True`.

String `set_linestyle` copies the current rc pattern into an immutable native
tuple. A later rc change does not alter existing unscaled or effective dashes.
Repeating the linestyle setter captures the new rc list. `set_linewidth`,
including the same width, reuses the old captured unscaled pattern and reads
the current `scale_dashes`. Same-width recomputation can change effective
dashes while leaving stale false. Merely changing rc does not change the Line.

The typed state keeps copied unscaled metadata and an effective `LineStroke`
snapshot. Draw does not recompute it from current rc. Pattern getters and rc
snapshot assertions check all sequence elements; finite values, signed zero
and infinities compare by binary64 bits. NaN compares by classification, with
no portable NaN-payload promise.

The ordinary validated rc-list domain includes empty, negative, all-zero and
nonfinite values. Installation is not replaced by an eager nonnegative or
finite check. Validation that belongs to the GC remains a later draw stage.

## Offset and sum evidence

The original String offset begins as Python int 0. If the pattern sum is
truthy, modulo can produce negative zero or NaN. Examples include `[-2,-1]`
and `[1,-Inf]` producing float negative zero, `[1,NaN]` producing NaN, and
`[0,0]` retaining int 0. Native int/float metadata and tuple/list identities
remain recorded evidence; the typed offset is a Double value.

CPython 3.12 builtin float sum uses compensation. `[1e16,-1,-1e16]` sums to
`-1.0` and gives negative-zero offset; naive left summation would lose this
result. The positive counterpart gives positive zero; appending the opposite
unit cancels to zero and leaves the original int 0 offset. Four independent
records check both actual sum results and resulting Line state.

## Suggestions

The twenty primitive records call the complete original API helper with its
eleven original choices and actual CPython `get_close_matches`, n=3 and cutoff
.5. They retain complete messages and match order, including multi-candidate
ties, Unicode, NUL and long input. A length-21 `dashdot` plus suffix input can
still match at exactly .5; length 22 cannot. Longest choice length 7 bounds the
candidate-bearing domain to length 21, so autojunk is unreachable in this
fixed-choice specialization. This does not expose a general difflib library.

## Complete leaf draw and actual backend projection

The original complete no-marker `Line2D.draw` body is executed. Its
`allow_rasterization` decorator is excluded from this leaf host; body hashes
start at `def draw`, not the decorator. Transformed numeric Path storage and
unrelated renderer/GC presentation methods are explicit host capabilities.
`GraphicsContextBase.set_dashes` executes its complete actual NumPy body.

The nine typed fixtures render through the real checked SVG backend. They do
not call provider completion directly to pretend that GC validation occurred.
A fixed manual frame with Null major/minor locators isolates the leaf stage
from parent autoscale/tick work. The native leaf setup omitted `add_line` and
`_update_line_limits`, so its dataLim is null. A private white-box input bridge
seeds that same null dataLim and clears initial requests after typed attachment;
it does not change source expected values or production image/Line validation.

No-line/no-marker still recaches pending data first, skips stroke/color and
normally clears stale. Bad pending shape fails before color. A nonempty C4301
color is skipped by no-line and fails under solid. Positive-width negative and
all-zero dashes fail with the complete native GC messages. Width zero,
negative or NaN takes the original `width > 0` false branch and bypasses dash
validation. A nonempty all-nonfinite path still validates dashes before finite
segment filtering. Only successful backend completion clears stale.

These records do not claim marker rendering, rasterization, full GUI stale
callbacks, native CSS serialization or pixel-identical dash rasterization.

## Native boundary and source pins

The seven native non-String records preserve partial writes, tuple offsets,
borrowed mutable dash lists and later recomputation. The String API does not
support these carriers. Arbitrary wrong-typed rc values, custom Python
operators and NumPy/dynamic shape protocols are outside this profile.

Mandatory source pins include:

```text
lines.py e928511cec1f9ce19455008c1863d337b0dbd1c71ac2b8d40224c8d5c069e05c
cbook.py e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643
rcsetup.py a052eac4af21ce8cdb58ee49c3ab952af4c2ff5e18f36cc8b741793fa79b5f59
backend_bases.py a2b147fb149d8862fad874991f79a61cf76da3477dfd58af99755a8f9f80c074
_api/__init__.py 7e262cedd8ce1a1660c2e2caa63adeb078c29e36bd541b8e6f773cfed4c3c782
difflib.py 3eb2d371b4a171b063921de6bbf115108bc39de8bf72866315868ce2599213b7
bltinmodule.c 368b677db85bd846fc85271d6e7170ee8e529230bd1ea352d16ccef0a75787e0
```

The JSON contains additional inherited source/runtime pins and complete method
hashes. The C pin is source rationale for the actual fixed-runtime builtin sum;
it is not a replacement oracle algorithm.

## Acceptance

D51's complete suite passed on wasm, wasm-gc and native with 22179/22179 tests
each, and JavaScript with 22186/22186. The slice adds 24 registered tests:
5 source-projection groups and 19 focused/config/facade/renderer regressions.
Root independently compared all three original groups field-for-field, then
reviewed all production changes, focused tests and the four expected interface
diffs. The other 37 generated interfaces are unchanged. A separate read-only
review found no concrete defect in the source projections or the specialized
suggestion/sum helpers. Source regeneration checks passed; original D44 data
JSON remains unchanged after its private fixture gained the new history field.
