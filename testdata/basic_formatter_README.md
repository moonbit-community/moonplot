# Named basic Formatter lifecycle

D28 is accepted. The original-source checks, interface review and four-target
validation passed. The explicit scope boundaries below remain unchanged.

`@ticker.BaseFormatter` is the explicit typed source Formatter object, with live
NullFormatter, FixedFormatter and FuncFormatter wrappers. `as_base_formatter()`
returns the same live object and retains virtual dispatch. Base construction is
allowed; its formatting primitive raises `InvalidTicks("Derived must override")`
when called. Null returns empty strings. Fixed uses the supplied optional position,
ignores the numeric value, returns empty for None or positions beyond the end,
and preserves valid Python-style negative indices. Out-of-range negative indices
raise instead of being clamped. Func receives `(Double, Int32?)` and propagates
its exact checked Core error.

The legacy `ticker.Formatter` enum, constructors, copies and pure helpers keep
their existing contracts. Named objects use separate explicit setters and checked
label methods; a raising callback is never routed through a pure enum helper and
silently converted into an empty label. Direct named Fixed with no position
returns empty, while legacy Fixed `format_value` still returns its first label.

## Retained state and checked batches

`FormatterLocations::Sequence(Array[Double])` borrows a live list with mutable
length; `NdArray(TickValues)` retains the original fixed-shape numeric view,
including signed/zero strides and dtype. `set_locs` and `set_locs_view` retain
those exact inputs. All fresh named kinds share the source class-default empty
list; tests which deliberately mutate that global default restore it afterward.
`locations()` is explicit access to retained `_locs`, not a pretend deprecated
property. The source-only deprecated `locs` observations use the real pinned
Matplotlib deprecation helper.

`format_ticks` first stores the input, then enumerates that same local input in
order. List length and elements remain live at each iteration; no captured-size
Array iterator or formatting cap replaces source behavior. View iteration retains
its shape and checked element access. Callbacks can append, shrink, replace data,
rebind the Func callback or reenter formatting. Inner formatting leaves its new
locations installed; the outer loop continues over its original local input.
An error retains stored locations and earlier effects. `format_data` and
`format_data_short` use virtual call with None and do not set locations.

Fixed label arrays, Func callbacks, offsets, locations and axis bindings are
borrowed state. Explicit `copy()` creates independent slots/state objects while
shallowly sharing their current buffers, closure and axis handle. Rebinding a
slot is independent; mutating its existing shared buffer remains observable.
Axis bindings are opaque stable identities with explicit dummy metadata only.
`create_dummy_axis(minpos=...)` allocates only while unbound; it does not implement
all dynamic Python Axis view/data methods. The basic classes do not read numeric
axis providers during formatting.

Fixed/Func `get_offset` returns their mutable `offset_string`; Base/Null return
empty. Numeric callbacks, label strings and offsets do not automatically apply
Unicode-minus replacement. Static `BaseFormatter::fix_minus` alone reads the
current `@config.unicode_minus()` Bool each call and replaces every ASCII hyphen
when enabled. The default True, mutation, snapshots and reset follow the new
explicit rc API.

## Axis, shared, secondary and SVG wiring

Axis and Secondary expose `set_named_formatter`, `set_minor_named_formatter`, live
`named_formatter`/`minor_named_formatter` getters and clear methods. Stable
`formatter_axis_binding()` handles support identity inspection. Installing a
named major clears the legacy major alternative and conflicting fixed-label
text; installing a legacy major clears the named major. Existing date/category
numeric conflicts remain checked. Shared Scene setters keep the same named handle
and rebind the last explicit requester after the group loop. Removing a shared
owner rebinds installed major/minor formatter identities to the source-ranked
first remaining axis; explicit shallow copies keep their removed owner.

Named installation stores the exact object and sets its axis; it does not notify
an existing locator. Source locator replacement calls `_set_locator`, which is a
no-op for these four builtin kinds. `formatter_warnings()` is an Axis/Secondary
latest-installation snapshot: a nonempty Fixed formatter warns only when the
current level is not Fixed. Named/legacy Fixed and explicit fixed ticks are
recognized. Empty Fixed does not warn, and later locator replacement does not
rerun installation warnings. A generic Python locator wrapper's `.base` protocol
remains source-only because the typed locator classes do not represent it.

Checked Axis label APIs are `tick_labels_checked(values,view?)` and
`minor_tick_labels_checked(values,view?)`. The live major offset helper reads
`get_offset` after the batch without reformatting. Named rendering resolves each
axis in source order: full raw major ticks, checked major batch, raw minor ticks
and transformed overlap removal, checked minor batch, then display filtering.
For major `[-1,0,1,2]` in view `[0,1]`, callbacks receive positions 0..3 and drawn
labels keep positions 1/2. An error at the offscreen -1 occurs before querying
the minor locator. NullFormatter still receives `set_locs` and preserves ticks;
NullLocator skips its entire drawing group.

Raw source numeric views are retained until formatting ends. In Fixed and Linear
preset profiles, a callback at index0 changing owner index1 affects the next
callback. Minor overlap disabled retains that view; enabled source boolean
filtering produces a fresh copy. Primary and secondary rendering preserve these
distinctions. Major Tick positions are fixed immediately after their batch;
a later minor callback mutating the major owner does not retroactively move those
Tick positions, although the formatter's retained locations still see the mutation.

Secondary formatters see their own full coordinate arrays and positions before
inverse display conversion. They have their own binding, major/minor named slots,
checked error propagation and major offset transport through Scene/IR/SVG. The
settled only-log secondary classification and placement policy is unchanged.
Major callbacks can replace a secondary minor formatter and locator: the later
minor stage reads those live slots, so Null→Fixed becomes active in that pass and
Fixed→Null skips it. Replacing the major formatter keeps the original batch running
but reads the replacement object's offset afterward.

Named minor MultipleLocator formatting retains its complete neighboring grid
before visibility, including[-.5,0,.5,1,1.5] for view[0,1]. The named formatter
transport adds no100000 cap to raw Fixed views: primary and secondary independently
pass full125001 arrays to the real batch. Existing legacy helper caps and numeric
locator algorithm caps remain separate accepted contracts.

## Explicit boundaries

This slice covers these four named classes, their typed numeric batches and
explicit axis setup. It does not migrate arbitrary Python subclasses/hooks,
non-numeric inputs, non-String callback results/label sequences, custom sequences,
non-Int32 positions, the full DummyAxis API, complete Text/Tick/cache getter
lifecycle, implicit scale/units/default formatter resets or complex formatter
families. Source `get_majorticklabels` may return Text labels outside the view and
query the locator again; the typed supplied-array label helper is a distinct API.
Host warning filters, routing, stacklevel and warning-as-error policy are not
reproduced by an Axis-owned snapshot. Offset text transport does not claim every
upstream Text layout detail. Legacy/date/category convenience policies remain
separate from newly checked named behavior.

## Independent source references

All sources are pinned to Matplotlib v3.11.2 commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`. Shared
`scripts/formatter_reference_source.py` executes the complete original TickHelper,
Formatter, Null/Fixed/Func and DummyAxis classes, full `_api` module and the real
cached deprecation helper. No placeholder descriptor or Moon production algorithm
is used as a formal oracle. The helper verifies exact source hashes and fixed
CPython 3.12.14/NumPy 2.3.5; axis references also use the fixed Darwin arm64 NumPy
binary and complete original Axis/transform/Grouper/removal/secondary bodies.
Known Bboxes, Tick/Text storage, identity units, default formatter/GUI/affine sinks
are explicit fixtures, not a claim to run the installed Matplotlib renderer.

- Parameters: 308 original observations, 81 generated + 4 hand tests = 85.
  58 source-only dynamic/descriptor/huge virtual-sequence records are labeled
  outside the typed passing-test domain.
- Batch/numerical lifecycle: 180 complete-original-AST queries, 131 successful
  and 49 real errors, plus 12 dynamic Unicode-minus queries; 192 generated +
  4 hand tests = 196. Five raw-position/non-String-return observations are
  source-only. Null/Fixed really format complete 125001-element batches; no
  budget omission or 100000 formatter cap replaces these arrays.
- Axis/render integration: 62 generated + 8 hand tests = 70. Source profiles are
  16 typed installation routes, 11 batch/draw modes, 5 primary owner aliases,
  2 shared owner/removal traces, 2 secondary own-coordinate batches, 4 secondary
  Fixed/Linear owner aliases, 1 major-position snapshot profile, 6 live secondary
  slot/locator/offset replacements, 2 Multiple raw minor profiles and 2 complete
  125001 transport batches. Nine extra
  Text/cache/wrapped-locator observations are source-only. Primary views, both
  major/minor callbacks and secondary transports execute actual source bodies.

The accepted D28 total is 352 new tests: parameters 85 + batch 196 + axis/render 70
and one root config snapshot regression. The complete suite passed 12347/12347
on wasm, wasm-gc and native, and 12354/12354 on JS. After that full run, eight
vacuous empty-sample assertions were removed from the batch reference tests;
the JSON bytes and all remaining assertions stayed unchanged. The 192 generated
batch tests then passed on all four targets in a focused recheck. Final
`moon info`/formatting, 24 all-target checking tasks and all three source
`--check` runs passed, with zero errors and the 8 existing Ref warnings. The
final interface diff was unchanged from the reviewed version. This acceptance
does not extend to full Text/default lifecycle or dynamic Python boundaries.

Generate each reference before running its dependent check, using the fixed
Python runtime and pinned source path:

```sh
python3 scripts/generate_basic_formatter_params_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_basic_formatter_batch_reference.py /path/to/pinned/ticker.py --check
python3 scripts/generate_basic_formatter_axis_reference.py /path/to/pinned/ticker.py --check
```

Source hashes are recorded in the JSON. Principal SHA256 values:

- ticker.py: `49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad`
- axis.py: `f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0`
- `_api/__init__.py`: `7e262cedd8ce1a1660c2e2caa63adeb078c29e36bd541b8e6f773cfed4c3c782`
- `_api/deprecation.py`: `364d069a9bcdf2b10f2f641220717baaa4e5c9b8e25fbe150cd9895f2f8542d2`
- transforms.py: `109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8`
- secondary: `b2aaaae077e03ff6538d1a4bf8a69c3476eed0e27120aa567de138c794599a93`
- NumPy binary: `44fdecc68c23ac6dd5825dc124c801086f7f68dc15ab008ed584ed6a47be6305`

No new dependency or runtime Python/C call is introduced. Existing upstream
license/attribution and dependency boundaries remain in docs/THIRD_PARTY_NOTICES.md
and DEPENDENCIES.md.
