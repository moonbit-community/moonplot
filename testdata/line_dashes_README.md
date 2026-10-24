# Line set_dashes snapshot references

`line_dashes_reference.json` retains 54 complete actual-source observations
from Matplotlib v3.11.2 under CPython 3.12.14 / NumPy 2.3.5. The original payload
is nested under `original`, preserving every original field, source/body hash,
count, host statement, identity observation, pattern bit and draw-stage record.

The typed projection covers 44 records using an explicit immutable-tuple
snapshot profile. Eight native list alias/history and two native None-pair
records remain complete source-only evidence.

| Original group | Source records | Typed records |
| --- | ---: | ---: |
| Tuple setter matrix, two scale modes × nine inputs | 18 | 18 |
| Tuple snapshot/caller mutation/repeated setter/rc/width history | 12 | 12 |
| Native mutable list alias/history | 8 | 0 |
| Native tuple/list None-pair boundary | 2 | 0 |
| Actual custom tuple setter followed by complete leaf draw | 14 | 14 |

Two registered tests carry the 30 setter/history and 14 draw records, each
within the 32-case group limit. Source, typed and registered-test counts are
different measures.

## Reproduction and fixed source

From the repository root:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_dashes_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_dashes_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py --check
```

The generator is self-contained tracked code and never imports an ignored
probe or reads ignored expected JSON. It reuses accepted pinned loaders and
executes complete original set_dashes, set_linestyle tuple dispatch,
_get_dash_pattern, _scale_dashes and the original color/inverse/GC/Line.draw
namespace. No Moon implementation generates expected values. Generation and
`--check` both rerun actual source.

The entire original payload is checked against this mandatory SHA256 before
emission:

```text
fcfcd4164e1b55027d1ff4c07376609f9c0ebe8ad1c0e1c4870575bae9fc42c2
```

The original Line source SHA256 is
`e928511cec1f9ce19455008c1863d337b0dbd1c71ac2b8d40224c8d5c069e05c`;
the complete set_dashes body SHA256 is
`f2772184b7ba726d20e195e36ecee68a06cb039815f8882bcb7886e80e53f64b`.
All inherited source/runtime pins and required method-body hashes remain in
JSON. No new external dependency or source download is introduced.

## Explicit copied-tuple profile

Typed `set_dashes(Array[Double])` copies the caller input. The source records
used for this projection actually pass immutable Python tuples. They do not
pass native lists and then silently describe borrowed storage as copying.

In each history scenario, a separate caller list is converted once to a tuple
before source assignment. Mutating that caller list leaves the captured tuple
unchanged. The typed test passes its Array to set_dashes, changes the Array,
and checks the Line snapshot remains unchanged. A later repeated source use of
the original tuple is projected with the original values, not the modified
caller Array. Retained effective Style values remain their old generation.

Native tuple/list physical identity and type observations are preserved as
source evidence. They do not require a general Python container protocol or a
borrowed mutable Array contract from this copied setter.

## Dispatch, normalization and stale

The original method dispatches empty input or `(None,None)` to solid `-`;
otherwise it calls set_linestyle with `(0, supplied_sequence)`. Thus typed empty
input becomes solid and is_dashed is false. It does not create a dashed style
with an empty pattern, so it does not reach D53's empty inverse error.

Every successful setter delegates to the existing linestyle behavior and
marks stale, including repeated values and empty input. Nonempty input uses
canonical `--`. No eager even-length, positive, nonzero, finite or nonnegative
guard is added. Odd, all-zero, negative and NaN/Inf sequences install and defer
relevant GC failures until drawing.

Custom values are supplied directly, without reading the current dashed rc
template. Zero offset uses the same actual sum/modulo normalization as the
String route. The cancellation input `[1e16,-1,-1e16]` exercises CPython 3.12
compensated sum and captures negative zero. Current width and scale_dashes
produce the effective pattern; raw originals, converted cache, pending flags,
ranges and requests are untouched.

All finite values, signed zero and infinities are compared by binary64 bits.
NaN is compared by classification without a native payload portability promise.
Native Python int/float offset types remain recorded metadata.

## History and provenance

The immutable source tuple gives effective list storage with scaling true and
tuple storage with scaling false. The existing captured kind Bool therefore
supports this copied profile. No second appearance slot or new carrier is
needed.

Changing the rc template alone does not replace custom captured values.
Same-width assignment reads current scale_dashes and rescales the old snapshot,
without reading the new pattern or redoing normalization. Equal width does not
mark stale. A later String set_linestyle('dashed') captures the new rc template
and marks stale. The fixtures compare these transitions, retained old Style
values, raw gap/foreground/alpha, flags, cache, dataLim and requests.

## Source-only carriers

The eight native mutable-list records retain a different contract. Native
unscaled storage borrows the list; scaling false also borrows it as effective
storage, so mutation can change draw behavior without stale. Scaling true
keeps an effective copy until width refresh. Same-width refresh consumes edited
unscaled values but leaves the old captured modulo offset, including negative
zero. String style replacement detaches the current metadata from that list.
These aliases are not promised by the typed copied-input API.

Native `(None,None)` is a shortcut to solid. Native `[None,None]` is not equal
to that tuple and fails during sum after canonical `--` has been written,
leaving prior dash/stale state. Both carriers are outside Array[Double], so
their complete records remain source-only rather than fake typed error cases.

## Actual backend draw

Fourteen source cases call actual set_dashes(tuple), then complete original
no-marker Line.draw with real inverse/color/GC helpers. The typed tests invoke
the real checked backend. They do not pre-resolve a foreground closure to
simulate painting.

The draw profiles verify empty custom input is solid and ignores gapcolor;
odd tuples can paint foreground or both strokes; scaling false preserves
unscaled lengths; negative/all-zero patterns fail at the proper GC stage;
NaN/Inf with a positive element follow real GC comparisons. Width zero or NaN
skips bad gap and dash validation while still handling foreground. Explicit
no-line style, hidden Line, empty Path and pending shape error retain their
existing color/recache/completion order.

Successful SVG paints are checked in source order for count, RGBA meaning,
width and parsed dash offset/sequence. Completed original RGBA stages also get
bit-exact independent helper checks after actual rendering, never before it.
Errors are checked with complete native messages and raw Line state. Source
prefixes remain recorded; existing private backend tests inspect partial XML
writer prefixes because no public partial-SVG return API is introduced.

## Host and verification boundaries

Private mark_drawn supplies only the original clean-stale input. Leaf draw uses
a fixed manual frame and Null ticks, with one explicit null-dataLim/request
seed after typed attachment, matching source setup that omitted
add_line/update_line_limits. Later operation results are not normalized.
State checks read retained storage directly rather than causing a lazy query.

The source no-marker/rasterization-excluded host, numeric transformed Path
storage, presentation sinks and stage observers are stated in full in the
original payload. Native list identities, tuple physical layout, arbitrary
callbacks, dynamic NumPy containers, markers/caps/joins, native CSS formatting
and pixel overlap are outside this slice. CSS transport checks use the existing
serializer convenience profile; they do not claim native SVG text parity.

## Acceptance

D54 adds 14 registered tests: two formal groups and 12 focused/public regressions.
Full wasm, wasm-gc and native suites pass 22233/22233; JS passes 22240/22240.
The new original-source check passes. Only Scene gains the intended pure
set_dashes method; the other 40 interface files remain unchanged.
