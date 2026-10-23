# Stable Line handle removal

This reference executes pinned Matplotlib 3.11.2 Artist/Line removal methods in
CPython 3.12.14 / NumPy 2.3.5. It never runs the Moon implementation to generate
expected membership, cache, ranges, or errors.

The public addition covered here is `Line2D.remove()`. No `get_lines`, live
ArtistList, general `add_line`, GUI stale callback, or legend enumeration API is
introduced. Those original observations remain explicit source-only evidence.

## Reproduce

From the repository root:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_remove_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_remove_reference.py --check
```

The optional positional argument is the fixed `lib/matplotlib/ticker.py` path.
The generator reuses the accepted `generate_line_units_reference` loader and is
self-contained with respect to ignored planning probes. Generation formats only
the generated file via stdin `moonfmt -`, which is not a compilation gate.

JSON SHA-256:
`868fc13def218b269346308dfb30b66ef533bdc75b76c82752a36d2fd0239c26`.

| Original fixed source | SHA-256 |
| --- | --- |
| `lines.py` | `e928511cec1f9ce19455008c1863d337b0dbd1c71ac2b8d40224c8d5c069e05c` |
| `artist.py` | `c55a81d86db60ab7b22fcd6e70401aa84558de5d1ba6e40a16c60f6f1f03be7a` |
| `axes/_base.py` | `ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b` |
| `cbook.py` | `e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643` |
| `figure.py` | `b440ab0a5be03cb39b13529a2fec497d2d96deb083e3e56d6220593e3ec567da` |

The complete original dependency hashes are in JSON and checked by the accepted
loaders before execution. No installed Matplotlib package is used.

## Counts and projection

The original 14 preparation records are preserved completely, including every
source-only field. One additional actual-source record checks ordinary remove,
then clear, then repeated remove. Fifteen profile records contain ten typed
operation records and five source-only records. Four private sequential scenarios
run in one registered test group.

| Source IDs | Observation | Typed projection |
| --- | --- | --- |
| 00 | Complete native add_line setup | Source-only; typed plot_line is the setup bridge |
| 01,03,08 | get_lines snapshot and live ArtistList | Source-only query/container APIs |
| 02,04,05,06 | Remove, repeated error, detached data, explicit relim | Sequence 0 |
| 07 | Re-add an existing native Line | Source-only attachment API |
| 09,10,11 | Clear currently attached Line, error and retained data | Sequence 1 |
| 12,13 | delaxes retains Line owner, then remove | Sequence 2 |
| 14 | Already-removed callback survives subsequent clear | Sequence 3 |

Grouping retains each operation's before/after cache and membership assertions.
The record count is not a count of every internal source method invocation.
The old D39/D44 expected data and their public data/cache contracts are retained.

## Observable removal stages

Original Artist.remove first invokes the installed `_remove_method`. For a Line
added normally, this is its original parent children list's remove callback.
Only after success does the source clear stale_callback, discard mouseover
membership, mark the owner Axes stale, detach axes, and detach parent figure.
It does not clear the installed remove callback itself.

The typed handle therefore keeps removal binding separate from the owner used
for unit conversion. Successful remove physically removes its exact artist and
attached-Line registry entry by stable identity, sets conversion owner=None,
and retains the removal binding. It preserves originals, cache generation,
borrowed views, invalid flags, and the Line's own stale flag.

A repeated ordinary removal retries the old callback and fails before further
cleanup. The exact typed Core InvalidTicks diagnostic is:

```text
ValueError: list.remove(x): x not in list
```

Axes clear operates on currently attached children. It clears their removal
binding and conversion owner, so subsequent remove instead produces:

```text
NotImplementedError: cannot remove artist
```

An already-removed historical handle is absent from clear's attached-child loop.
Its binding survives; source record14 still yields the repeated ValueError after
clear. A global reset of every historical handle would change this behavior.

Removing a panel via Figure.delaxes is different from clearing it. It removes
panel membership and sharing links but does not clear its children. A retained
Line still has the retained Axes as conversion owner, and can remove itself from
that Axes normally afterward. The generated sequence checks both identities.

## Data, ranges, and private membership checks

Removal does not convert data, invalidate cache, relim, or request autoscale.
Old numeric data remains usable after detach under D44's owner=None rules.
The former range extrema remain cached until an explicit relim recomputes them
from the remaining attached Lines. That relim still does not request a view.

The generated whitebox test reads stable artist points and exact registry
identities to observe membership. It does not call or invent `get_lines()`.
Reading retained Line cache fields for snapshots avoids accidental lazy recache
while checking the unchanged state. Finite values and infinities use binary64
bit comparisons; NaN uses classification without a payload promise.

Original get_lines returns a new list containing the same Line objects, whereas
the original lines ArtistList remains a live view. Native add_line can reattach
an old object. These complete source records remain useful future evidence but
are not counted as implemented public capabilities in this slice.

## Source host and GUI boundaries

The generator executes complete original Artist.remove/owner/stale methods,
Axes.add_line/get_lines/ArtistList/__clear, Figure.delaxes/_remove_axes, cbook
silent_list, and original Line data/recache and Axes relim bodies. The accepted
short/default-style numeric Path storage and graphical-constructor sinks remain.
A preexisting clip path avoids constructing graphical clips. pchanged, title,
font/spine/grid presentation, canvas release and observer targets are explicit
host capabilities; no source algorithm is replaced by a port implementation.

The source host stores Axes.stale but does not reproduce the full GUI
Axes→Figure callback chain. Native parent-figure, mouseover, stale_callback and
callback-function identity fields remain in JSON without invented public typed
getters. The typed assertions check Line stale and axis autoscale requests;
they do not infer redraw scheduling from the host's Figure.stale value.

Original remove does not remove an already-created legend entry. No Legend
constructor, renderer, or new handles/labels enumeration is claimed here.
Current IR export and old helper behavior are separate integration contracts.
Project compilation, interface review and four-target acceptance are recorded
centrally after all tracked writers stop.

D45 acceptance: all 13 new registered tests passed in the complete four-target
suite: 22076/22076 on wasm, wasm-gc and native, and 22083/22083 on JS. Final
source and project static gates passed; only Scene's interface gains the
remove method, and the other 40 interfaces are unchanged. The original fourteen
complete preparation records were independently checked unchanged.
