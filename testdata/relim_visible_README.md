# relim with visible_only

This reference executes complete pinned Matplotlib 3.11.2 `Axes.relim`,
`_update_line_limits`, Bbox update/reset, and Line data/cache methods. It uses
CPython 3.12.14 / NumPy 2.3.5, not the Moon implementation, to generate results.

The added typed capability is the optional Bool `visible_only` argument on
existing `relim` and `relim_checked`. Its default is false. Independent static
artists still have no public visibility property and remain eligible; this
slice introduces no general Artist visibility or autoscale-eligibility API.

## Reproduce

From the repository root:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_relim_visible_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_relim_visible_reference.py --check
```

The optional positional argument is the pinned `lib/matplotlib/ticker.py` path.
The accepted `generate_line_units_reference` loader checks fixed source hashes.
The script does not depend on ignored planning probes or installed Matplotlib.
It formats only its generated file through stdin `moonfmt -`; source generation
and checking do not replace project compilation or behavioral acceptance.

JSON SHA-256:
`85eac4285171592dfd225887149ab964f3dbea874bdab04f43a4f01539677490`.

| Original fixed source | SHA-256 |
| --- | --- |
| `axes/_base.py` | `ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b` |
| `artist.py` | `c55a81d86db60ab7b22fcd6e70401aa84558de5d1ba6e40a16c60f6f1f03be7a` |
| `lines.py` | `e928511cec1f9ce19455008c1863d337b0dbd1c71ac2b8d40224c8d5c069e05c` |
| `transforms.py` | `109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8` |

The JSON contains the complete accepted loader dependency hash map.

## Records and sequence

All nine preparation records are preserved in full, with their original
before/after states, events and error messages. They form one continuous typed
sequence inside one registered test group. This retains the updated minimum
positive values, pending bad Line and source prefix state between operations.

| ID | Actual operation and result |
| --- | --- |
| 00 | Default relim includes the hidden second Line |
| 01 | visible_only=true recomputes only the visible first range |
| 02 | All hidden produces null bounds while retaining old minpos |
| 03 | Explicit false includes both hidden Lines again |
| 04 | Visible edited prefix recaches; hidden pending shape error is skipped |
| 05 | Default relim reaches the hidden error after merging the prefix |
| 06 | Show then true reaches the same late error and retains prefix state |
| 07 | Repair merges the complete visible union |
| 08 | All hidden again retains the updated finite minpos |

Both public convenience and checked entries are exercised. Native error records
use the checked entry so the existing pure `try!` convenience bridge is not used
to catch a failure. Nine records are not a count of every internal method call.

## Filtering and partial-state order

Original relim first sets Bbox ignore, resets its points to the null box, and
sets `ignore_existing_data_limits=true`. It then walks children in order.
Default/explicit false short-circuits the visibility check, so hidden Lines
remain included. With true, get_visible runs before `_get_in_autoscale`, type
dispatch, get_path and any lazy recache.

The typed implementation therefore skips a registered hidden Line before its
points snapshot and range merge. That preserves a hidden pending error/cache
until a later unfiltered call or show. The source host's ordinary Lines have
private `in_autoscale=true`; its traces preserve this source stage without
creating a new typed eligibility setter or arbitrary Artist callback protocol.

Resetting Bbox points does not reset its old minimum-positive metadata. With
all Lines hidden, source bounds become null and ignore remains true, while
minpos stays `[1,10]` initially and `[5,50]` after the later finite update.
The JSON preserves the accepted explicit nonfinite format, such as
`{"float": "inf"}` and `{"float": "-inf"}`, rather than replacing it with
nonstandard JSON Infinity literals or silently changing source expectations.

A late error is not transactional. The visible first Line has already merged
`[[5,50],[6,60]]` before the second Line's broadcast error, so those prefix
bounds/minpos remain. The failing cache and invalid flags survive. Shape error
text is checked exactly through the existing Core InvalidTicks mapping.

## Views, stale state and units

Every before/after check includes raw bounds, minpos, ignore state, Line
visibility/stale/invalid/cache, stored viewport, autoscale-on and pending
request flags. Cache snapshots inspect retained fields directly; they do not
call a processed getter that could consume the pending error. Views use
`stored_view_limits`, not lazy get_xlim or a render-derived view.

The accepted numeric source host stores its initial `[0,1]` view in a plain
Bbox. Scene's unit setup has a live autoscale provider and can resolve an empty
range while installing category defaults. Before the first operation only,
the typed fixture seeds the source's recorded initial stored views through
`Axis.set_view_limits`, retaining auto-enable, then consumes initial requests.
This aligns the controlled host input; it does not change relim's expected
states, normalize views after operations, or alter any original JSON record.

relim does not request/consume autoscale, change the stored view, flip auto-on,
or mark Lines drawn. Successful recache updates invalid flags but leaves Line
stale under the existing D44 contract. Finite/infinite numbers use binary64 bits;
NaN uses classification without payload promises.

The units callback remains separate: original `_unit_change_handler` force
recaches every Line, then calls relim with default false, then requests the
event coordinate. Neither the hidden draw guard from D46 nor this explicit
filter may silently change that force-all callback pipeline.

## Source host boundary

The existing short/default-style numeric Line/Path storage host executes the
complete original methods. Original Artist visibility/in-autoscale methods are
added; wrappers record their call order without changing behavior. No port code
produces expected output. Full graphical constructors, renderer styling,
arbitrary Artist visibility and new producer discovery are excluded. Registered
Line identity and existing static-artist fallback remain separate integration
contracts. Central migration checkpoints record project gates and interface
review after all writers stop.

D47 acceptance: the first complete run had one identical formal-fixture initial
stored-view mismatch on all targets. Only the initial controlled-host bridge
described above was corrected; production and original JSON records were
unchanged. The formal group then passed on all four targets. Together with the
other tests already passed in the full run, cumulative coverage is 22102 tests
on wasm/wasm-gc/native and 22109 on JS. All 11 new registrations, source/static
gates and the expected two Scene optional-argument changes are accepted; the
other 40 interfaces are unchanged.
