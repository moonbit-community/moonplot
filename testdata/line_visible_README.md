# Line visibility and deferred drawing

This reference executes pinned Matplotlib 3.11.2 `Artist.get_visible`,
`set_visible`, and the complete original `Line2D.draw` body. It reuses the
accepted original Line data/unit loader and never uses Moon code as an oracle.

The supported addition is Bool visibility on existing stable `Line2D` handles.
It does not add a generic style protocol, color/width/marker setters, arbitrary
Python visibility values, GUI callbacks, or a new backend/IR schema.

## Reproduce

From the repository root:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_visible_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_visible_reference.py --check
```

The optional positional argument is the fixed `lib/matplotlib/ticker.py` path.
The script is self-contained with respect to ignored planning probes. It imports
the accepted `generate_line_units_reference` loader, which checks pinned original
source hashes. It imports no installed Matplotlib. Generation formats only its
own generated file through stdin `moonfmt -`, which is not a compile gate.

Runtime: CPython 3.12.14 / NumPy 2.3.5. JSON SHA-256:
`af0b4ea0836c3b579b0634236c9607c835cb26c649a319b0720e96fae9a33b1a`.

| Original fixed source | SHA-256 |
| --- | --- |
| `lines.py` | `e928511cec1f9ce19455008c1863d337b0dbd1c71ac2b8d40224c8d5c069e05c` |
| `artist.py` | `c55a81d86db60ab7b22fcd6e70401aa84558de5d1ba6e40a16c60f6f1f03be7a` |
| `axis.py` | `f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0` |
| `axes/_base.py` | `ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b` |

The JSON records all accepted loader dependency hashes and the original draw
method source-segment hash. All fifteen preparation records are preserved in
their entirety, including original stage traces, before/after fields, and errors.

## Counts and actual production entry

Fifteen actual source operation records form one continuous typed sequence in
one registered test. Keeping one sequence retains converter-discovery effects,
category mapping, old caches, and a single pinned exported Panel throughout.
This is not a count of every internal source call or a full graphical renderer
parity claim.

The generated test obtains the real Scene-exported Panel and calls
`Panel.prepare_line(line.points)`. On success it invokes the returned completion,
representing successful completion of the leaf data phase. The helper contains
no visibility branch, cache conversion, or stale mutation. The production late
provider decides whether to skip hidden data, recache visible data, and return
a clearing or no-op completion.

No full SVG export is used for this formal leaf profile: parent primary/secondary
formatting and other parent-draw phases would be different source contexts.
Separate integration tests cover full frame behavior.

## Original ordering and checked states

Artist's visibility slot defaults True. `set_visible` first compares the old
value. Only a changed Bool is stored and followed by pchanged and stale=True.
Repeated same Bool is a no-op, including an initially clean visible Line staying
clean after `set_visible(true)`. Visibility changes do not invalidate data,
convert units, relim, or request autoscale.

The first original Line.draw guard returns if hidden. It precedes pending
recache, subslice/path-effect logic, renderer group opening and final stale=False.
Hidden successful return therefore keeps pending invalid flags and Line stale.
A completion that clears stale merely because a Line was visited would be wrong.

| Source IDs | Verified behavior |
| --- | --- |
| 00–02 | Same-value no-op, hide, repeated hide |
| 03–06 | Hidden shape error remains pending; show is lazy; visible draw fails; repair succeeds |
| 07–09 | Hidden category y does not discover converter; visible failure leaves discovered converter and no units; numeric repair works |
| 10–11 | Hidden category x does not append a label; visible draw appends it during actual conversion |
| 12–14 | Explicit owner=None hidden guard, deferred error on show, successful numeric repair |

Snapshots read the retained converted cache directly rather than triggering a
processed getter while recording pending errors. They check visibility, Line
stale, invalid flags, owner state, xy values, category mapping, converter/unit
residue, cached dataLim, and axis autoscale requests before and after every
operation. Finite/infinite values use binary64 bits; NaN uses classification.

Original errors remain exact in JSON. Existing Core InvalidTicks shape messages
are checked verbatim. The category failure uses D39's established Core conversion
boundary; the test checks its late stage and surviving converter/cache state
without introducing a verbatim Python ConversionError-wrapper contract.

## Source host and scope

The complete original Line.draw method is compiled with only its rasterization
presentation decorator removed. Original recache and Artist/Axis unit conversion
bodies run unchanged. Stage wrappers only record events.

The source host uses short/default-data-style Lines, original no-line-style
mapping and no marker. Successful draw therefore reaches actual renderer
open/close_group and the final stale reset, while avoiding graphical path,
graphics-context, color, linewidth and marker work. pchanged and renderer groups
are recording sinks. Their native traces are retained evidence, not new public
callback/event protocol assertions. Full rasterization, clipping, path effects,
long-Line optimization, styling and graphical constructor parity are excluded.

The final three records explicitly set conversion owner=None in the source and
use the corresponding private typed fixture operation. They do not independently
execute full clear/remove. D44/D45 own those lifecycle contracts. A normal removed
child is absent from fresh Axes drawing; the existing retained-IR/pinned-handle
contract is a separate Scene bridge. Visibility does not reconnect an owner or
alter removal binding or detached numeric conversion.

Hidden leaf data does not imply skipping other artists or primary/secondary
formatting. Visible successful completion still clears stale; hidden and failed
data phases do not. DataLim and requests remain independent of all these leaf
operations. Project gates and interface review are recorded centrally after all
writers stop; this source check is not their replacement.

D46 acceptance: all 15 new registered tests passed in the complete four-target
suite, 22091/22091 on wasm, wasm-gc and native and 22098/22098 on JS. Final
source/static gates passed. Scene alone gains get_visible/set_visible; the
other 40 interfaces are unchanged. The original 15 complete records and draw
source-segment hash were independently checked unchanged.
