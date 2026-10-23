# Line drawstyle and cached Path references

`line_drawstyle_reference.json` retains 75 complete actual-source observations
from Matplotlib v3.11.2, executed under CPython 3.12.14 / NumPy 2.3.5. The
original payload is nested under `original`; every original field, body/source
hash, count, host-boundary statement, array description and record is preserved.

The typed projection covers 74 observations. Native `None` reset at id12 is the
only source-only input carrier. The public typed setter accepts String.

| Original IDs | Source records | Typed records | Registered group |
| --- | ---: | ---: | --- |
| 0–12 | 13 | 12 | String setters and invalidation |
| 13–42 | 30 | 30 | Five styles and actual Path vertex matrix |
| 43–54 | 12 | 12 | Borrowed processed xy and cached Path |
| 55–74 | 20 | 20 | Lazy errors, units and retained Path generations |

Four registered tests carry these observations, each with at most 32 source
cases. Source counts, typed cases and registered tests are separate measures.

## Reproduction and fixed source

From the repository root:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_drawstyle_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_line_drawstyle_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py --check
```

The tracked generator is self-contained and never imports an ignored probe or
reads ignored expected JSON. It reuses the accepted actual Line/unit/Axes/Bbox
loader, then executes complete original drawstyle, recache and path-query
bodies with original cbook step functions and map. All expected results come
from actual source; Moon code is not an oracle.

The native Path source is downloaded, when absent, from:

```text
https://raw.githubusercontent.com/matplotlib/matplotlib/v3.11.2/lib/matplotlib/path.py
43936 bytes
SHA256 5c726cf2765c7c4549de79d3327adabd5613dba0dd4e9bf208fafb48799ee12f
```

The mandatory hash is checked before execution. The generator executes complete
original `Path.__init__`, `_update_values`, `vertices` and `codes` properties
with their required class constants, original float-array conversion and real
`_api.check_shape`. The two Path rc reads use a read-only capability populated
from original rcsetup `_Param` defaults. This is not the older simplified
`PathStorage` host used by D39.

The original complete payload is fingerprinted before emission:

```text
a47d23b3136bbdeeccb9a7ac08b912405752605a44035f46e6d8c7336c9e34f4
```

The generator rejects changes to that fingerprint. New projection metadata is
separate from the preserved original payload. Source/body/runtime pins and
additional inherited dependencies are recorded in the JSON.

## String setter contract

Supported Strings, in original error-message order, are `default`,
`steps-mid`, `steps-pre`, `steps-post`, `steps`. The getter preserves the exact
accepted String. `steps` selects the same function as `steps-pre` but does not
normalize to it; switching between them is a change.

Changed valid style marks stale and invalidates x only. It leaves y's pending
flag, raw originals, processed buffers, old cached Path, dataLim, stored view
and requests alone. The same style is a complete no-op, including existing
invalid flags and stale. Invalid String validation precedes writes and uses
the complete original supported-values message, without fuzzy suggestions.

The original native None-to-default route remains recorded at id12 but is not
represented by a String setter. No dynamic type coercion or extra spelling is
implied by this slice.

## Processed data and Path separation

Processed x/y/xy remain unexpanded broadcast data. `path_values_checked()` is a
borrowed flat `[x0,y0,...]` bridge to original `get_path().vertices`; it recaches
when either coordinate is invalid. The other processed query rules remain
unchanged. Default Path is the same current flat xy object, including an empty
buffer. Step variants own a separate expanded generation, even when empty.

Pre/post contain `max(2N-1,0)` vertices; mid contains `2N`. The actual functions
cover empty, singleton, two-point, larger, nonfinite and maximal finite inputs.
All sequence order, duplicate vertices and nonmonotonic coordinates are kept.
There is no sorting, filtering, clipping or arbitrary output cap.

Midpoint arithmetic is the source `(left + right) / 2`. Two maximal finite
coordinates produce infinite intermediate midpoints and an actual NumPy
overflow warning. Split-halves arithmetic would not reproduce this profile.
Finite values, signed zero and infinities are checked by binary64 bits; NaN is
checked by classification without a payload portability promise.

## Real aliases and retained generations

The fixtures use actual public TickValues writes, not a simulation of expected
alias effects. They also compare default Path's physical identity with current
flat xy, including empty. Native empty arrays can have identity while
`np.shares_memory` is false, because no memory cells overlap.

Borrowed xy writes immediately affect a valid default Path but not an existing
step Path. Borrowed default Path writes affect xy; step Path writes do not.
These writes do not themselves invalidate or mark stale. Equal drawstyle
preserves the modified Path. Changed drawstyle retains it until a lazy query;
the subsequent generation leaves old borrowed buffers alive.

A retained-cache detail is tested explicitly: modify default Path y to `-50`,
then change style. Only x becomes invalid. Lazy recache reads raw x but retains
valid modified y, so the new step Path still contains `-50`. Only forced
`recache_checked(always=true)` restores raw y. Rebuilding both coordinates for
every style change would violate the original mixed-generation behavior.

## Lazy errors, relim and units

Y-only invalidation leaves processed x queries on the old generation. A later
style change invalidates x and makes that query recache both pending
coordinates. `get_path` and xy queries test either flag. Queries and recache do
not clear stale or automatically update ranges.

Late shape failures retain old xy and Path plus pending flags. Original relim
has already reset dataLim before it reaches the same failure; this prefix state
is checked without rolling it back. Retained buffers, minpos, requests and
stored view are compared separately.

Relim and drawing consume the cached Path. An actual Category remap makes the
distinction observable without external buffer mutation: raw x
`['a','b','a']`, remapped to `['b','a']`, gives processed x `[1,0,1]`, while the
steps-mid Path x is `[1,.5,.5,.5,.5,1]`. The actual unit handler force-recaches,
relims to `[.5,1]` and then requests x only. Using unexpanded xy would give the
wrong `[0,1]` range. The fixture executes the real unit replacement and checked
Scene relim path, rather than constructing those after results privately.

## Controlled fixture inputs and evidence boundaries

The original host builds a short Line and recaches it before attachment. Public
typed `plot_line` is only the attachment bridge. One initial forced recache
establishes its requested cached Path; an explicit initial stored-view,
dataLim and minpos seed matches the source's plain controlled host. This is
done once per independent scenario. No later operation or expected after
snapshot is normalized. Matrix cases then set the style without querying the
Path, preserving the original pending x flag and old default Path.

`mark_drawn` supplies only the recorded clean-stale input. It does not pretend a
render happened. Before/after assertions read raw originals and private
processed/path caches directly. Public lazy getters appear only at the actual
source operation or initial retained-handle capture. Stored view is read
without lazy `get_xlim`/`get_ylim`.

Native ndarray shape, strides and contiguity, Path code/readonly/interpolation/
simplification metadata, warning records and conversion/recache trace remain
complete source evidence. The typed flat-view bridge does not claim those
physical layouts, a general mutable Python Path object or arbitrary GUI
callback/warning protocols. Short identity-transform Lines avoid the native
large-Line clipping/subslice optimization and compiled `_path` algorithms.

The reference does not expand general Path codes, readonly replacement,
masked/ragged arrays, markers, rasterization or arbitrary transforms. Actual
SVG consumption and existing visibility/no-line-style timing have separate
integration tests; this generator does not invent a replacement Line draw.

## Acceptance

D52's complete suite passed on wasm, wasm-gc and native with 22200/22200 tests
each, and JavaScript with 22207/22207. The slice adds 21 registered tests:
4 source-projection groups and 17 focused/facade/renderer regressions. The
original 75-record payload was independently compared field-for-field.
Root reviewed all production, focused tests, generator and guide; a separate
read-only review found no concrete projection/setup/alias defect. Source
regeneration checks passed, and the previous D44 JSON is unchanged after its
private detached fixture gained the new default path fields. Only Scene's
generated interface adds three expected methods; the other 40 are unchanged.
