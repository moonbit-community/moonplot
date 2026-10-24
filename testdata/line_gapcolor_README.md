# Line gapcolor and ordered two-stroke references

`line_gapcolor_reference.json` preserves 54 complete actual-source observations
from Matplotlib v3.11.2 under CPython 3.12.14 / NumPy 2.3.5. The original payload
is nested under `original`; every original field, count, source/body hash,
host boundary, state snapshot, error and presentation-stage observation remains.

The typed projection covers 52 records. Two native mutable RGB storage/mutation
records remain source-only evidence for a String-or-None setter.

| Original group | Source records | Typed records | Registered tests |
| --- | ---: | ---: | ---: |
| Setter sequence, including derived RGBA | 16 | 14 | 1 |
| Independent inverse-dash primitives | 12 | 12 | 1 |
| Complete original leaf draw | 26 | 26 | 1 |

All three registered groups have at most 32 source cases. Derived RGBA checks
belong to their original records and are not counted as additional source
observations. The inverse primitives are private-kernel evidence, not arbitrary
public Line2D custom-offset/tuple input support.

## Reproduction

Run from the repository root using the fixed runtime:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_gapcolor_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_gapcolor_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py --check
```

The tracked generator is self-contained and does not import an ignored probe
or read an ignored expected JSON. It reuses accepted pinned source loaders and
executes complete original get/set_gapcolor, is_dashed, inverse helper, Line
draw, color validators/converters and GC.set_dashes. Expected results are never
obtained from Moon code. Both generation and `--check` execute actual source.

The entire original payload has a mandatory fingerprint:

```text
b87e5f99fc2da8a586b0b27926b6fbbae31b918216cca456835335db6e0924b7
```

Generation rejects any change to that fingerprint. New typed-projection
metadata is separate from the original payload.

## Setter and raw storage

The public setter accepts `String?`. Non-None uses the complete existing source
color validator with keyword `color`, so native errors refer to `color` rather
than `gapcolor`. Validation precedes assignment and stale. Invalid String
preserves the previous gap value and all Line/style/data state.

Every successful setter assigns raw input and marks stale, including repeated
None and repeated identical String. The getter preserves spelling. `Some("none")`
is a stored String, while None is absence. Cn tokens validate without resolving
the current global cycle; C4301 is accepted now and can fail at later painting.

Gap assignment does not invalidate coordinates, recache, alter dataLim, request
autoscaling or change width, foreground, alpha or dash history. The fixtures
compare raw gap and foreground, alpha/width, canonical linestyle/is_dashed,
unscaled/effective pattern offsets and sequences, captured provenance, stale,
visibility, pending flags, stored flat cache, ranges, requests and current rc.
Cache checks read stored buffers directly without a lazy query.

The native final two setter records store an RGB list by identity and mutate
it to an invalid value after assignment. Those carriers and their alias are
not provided by the typed String API; their complete source records remain.

## Alpha and live cycle

Gap color has no separate alpha parameter. Painting passes current raw Line
alpha to the original converter, replacing embedded alpha rather than
multiplying it. Native `none`, including a cycle-selected `none`, retains its
special transparent result. Alpha zero does not disable the gap branch.

Two consecutive draws retain C0 gap and C1 foreground while changing the live
global cycle. Both resolve again in original order without setters or Axes
property-cycle consumption. The source uses an explicit stored-rc/by_key host;
it does not claim full Cycler mutation, GUI callbacks or arbitrary iterator
state. Setter-derived and completed draw color values receive independent
bit-exact helper comparisons against actual-source RGBA expectations.

## Inverse pattern and captured kind

The inverse helper moves the final element of the already effective sequence
to the start and adds it to the effective offset. It does not rescale by width,
normalize modulo, filter, sort or require even length. Original `[2,4,6]` at
offset 0 becomes `[6,2,4]` at offset 6. Each primitive checks exact values,
unchanged input and distinct returned sequence.

Finite values, signed zero and infinities compare by binary64 bits. NaN uses
classification without a payload portability guarantee. The records include
large-offset rounding and NaN/Inf addition, preserving their original bits as
source evidence.

Empty inverse failure depends on captured effective container kind:

```text
IndexError: list index out of range
IndexError: tuple index out of range
```

This distinction is reachable with ordinary String dashed style and rc `[]`:
scale_dashes true materializes a list, false preserves the source tuple. The
typed Line retains a private last-scaling Bool solely for this provenance.
Current rc cannot determine it because changing rc alone does not recompute
an existing pattern. No general native list/tuple API is added.

## Actual complete draw and late failures

The source executes the complete no-marker Line.draw body. Its rasterization
decorator is excluded; the method hash starts at `def draw`. Numeric transformed
Path storage, no effects, unrelated GC presentation calls and renderer sinks
are explicit host capabilities. Stage wrappers call unchanged original helpers
and record their results or errors; they do not implement a substitute draw.

For nonempty visible dashed Lines of positive width with non-None gap, order is
gap RGBA, inverse pattern, gap GC validation, gap path draw, foreground RGBA,
foreground GC validation, foreground draw, then normal completion. The typed
tests execute the real checked backend to exercise this ordering. They do not
resolve the foreground closure early to simulate painting.

Important recorded cases include:

- Valid gap is drawn before foreground C4301 fails; stale remains true.
- Gap C4301 fails before empty inverse; valid gap with empty inverse fails before
  foreground lookup. List/tuple failures retain their exact native messages.
- Negative/all-zero inverse patterns fail in gap GC before a bad foreground.
- NaN/Inf patterns with a positive element and odd-length patterns follow real
  GC comparisons without invented finite/even restrictions.
- Some("none") with alpha zero still paints both paths.
- Width zero, negative or NaN skips gap but still resolves foreground and uses
  foreground GC `(0,None)`.
- None gap avoids inverse, allowing empty foreground dashes to succeed.
- Solid ignores gap; no-line still recaches before skipping colors; empty path
  skips paint; hidden returns before pending conversion and retains stale.
- Nonempty all-nonfinite data still reaches gap GC before finite splitting.
  Pending bad shape wins before both colors.

Successful actual SVG draws compare polyline count/order, original RGBA meaning,
width and parsed dash offset/sequence. RGBA stages are additionally compared by
bits after the real backend operation, so no early foreground evaluation is
introduced. CSS encoding uses the existing serializer convenience profile;
native SVG float strings and pixel rendering are not claimed.

Error cases retain every original successful `drawn_paths` prefix in JSON and
assert exact backend error plus Line state. A String-returning checked render
does not expose partial XML. Independent backend white-box tests inspect the
actual writer prefix after foreground failure, and verify failed completion
does not run. No public partial-SVG or arbitrary callback API is invented.

## Controlled inputs and boundaries

Setter scenarios use private `mark_drawn` only to supply the recorded native
clean-stale input. Draw scenarios use a fixed manual frame and Null locators
to isolate the source leaf from parent autoscale/tick phases. The source leaf
omits add_line/update_line_limits, so a single explicit null-dataLim/request
input bridge follows typed attachment. Later results are not normalized.

Source presentation calls, native container identities, cache behavior and
warning traces remain complete evidence. The slice does not claim native full
Line graphical construction, markers, caps/joins, effects, rasterization,
general dynamic RGB carriers, private global RGBA-cache identity, native CSS
text formatting or transparent overlap pixel artifacts. Low-level static Style
gap metadata alone does not imply automatic two-stroke expansion.

All accepted mandatory source/runtime hashes are retained. Additional body
hashes identify original get_gapcolor, set_gapcolor, is_dashed and inverse
methods. No new external runtime dependency is introduced.

## Acceptance

D53 adds 19 registered tests: three formal groups and 16 focused/public regressions.
Full wasm, wasm-gc and native suites pass 22219/22219; JS passes 22226/22226.
The new source check and four mechanically adapted earlier generators pass.
The four intended interface diffs were reviewed; the other 37 are unchanged.
