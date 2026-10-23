# Original secondary numeric lifecycle reference

This profile executes the complete pinned Matplotlib v3.11.2 SecondaryAxis class
and real numeric Axis/scale/default/autoscale/geometry methods. The MoonBit port
never supplies expected values.

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_secondary_lifecycle_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_secondary_lifecycle_reference.py --check
```

The optional positional argument is the fixed local `ticker.py`; another source
tree is rejected. Generation writes the JSON, Scene WB and backend placement WB
listed below. `--check` independently reruns all original observations and checks
those three artifacts byte for byte. Stdin `moonfmt` formats generated source;
it is not compilation or behavior acceptance.

## Counts

**53 source observations** contain:

- 40 stages: x/y × five parent names × constructor, direct aspect, positioned
  aspect, draw after positioning.
- 2 actual numeric error-order observations.
- 8 four-slot identity/latch/rc observations across x/y.
- 2 actual decreasing/inverted child.transData position observations.
- 1 original child-registration plus explicitly declared major-batch stagehost
  observation, linked to the independent focused Scene creation-order hand test.

The first 42 observations retain every field/value from the original constructor
planning corpus. Additional state metadata does not replace those values.
B's installer and C's control-flow planning observations are separate host
profiles, not extra parity cases to add to this count.

**22 generated Scene scenario functions** carry the 52 directly projected source
observations in **1 registered group**. Two source placement observations are
also consumed by **2 backend scenario functions in 1 additional registered
group**. Thus this generator adds **2 registered tests**, not 53 tests.
The final creation-order source observation is linked to a separate focused
Scene hand test and is not represented as a new GUI-parity generated test.

Files:

- `scripts/generate_secondary_lifecycle_reference.py`
- `testdata/secondary_lifecycle_reference.json`
- `scene/secondary_lifecycle_reference_wbtest.mbt`
- `backend/svg/secondary_placement_reference_wbtest.mbt`

Finite numbers use exact binary64 assertions. NaN is classified explicitly.
No tolerance, edited source value, artificial enumeration budget or expected
value computed by the renderer/port is used.

## Pinned source and executable host

`axes/_secondary_axes.py` is checked against SHA-256
`b2aaaae077e03ff6538d1a4bf8a69c3476eed0e27120aa567de138c794599a93`.
All transitive accepted source hashes, including scale/Axis/transforms/font
sources and the executing NumPy binary hash, are retained in the JSON.
The complete SecondaryAxis ClassDef is compiled unchanged, including its actual
constructor and the original decorators/API checks. No old source JSON or loader
is modified.

`load_secondary_source(path)` returns the actual namespace, Figure/numeric Axes/
Axis/Secondary host classes and transform namespace. It reuses accepted source
loaders and complete original FuncTransform, FuncScale, LogTransform,
InvertedLogTransform, FuncScaleLog and scale factory behavior.

The superclass graphical Axes constructor is an explicit numeric storage/style
host. It creates the original Axis init/clear objects, then executes complete
original Axes.set_figure/_set_lim_and_transforms with real Bbox.unit/null,
TransformedBbox and Python transform classes. Complete original Axis limit
finalization, source set_ticks interval expansion and D37 autoscale/request/
unstale/get-set-bound bodies execute. The accepted affine native primitive
capability remains explicit. No full Artist/Axes graphical initialization,
font discovery, GUI or custom transform reflection is claimed.

Original Axes.apply_aspect/get_position/_set_position run on the default
aspect='auto'/box_aspect=None branch. Positioned aspect explicitly invokes the
original _TransformedBoundsLocator; it is not a full Figure.draw invocation.
Secondary.draw executes the original limit-sync → parent-name check/reset →
super.draw sequence; super.draw is a presentation sink, not a complete renderer.
Post-operation snapshots query current ticks/minpos separately and do not inject
those inspection reads into the recorded operation event order.

The final creation-order observation executes original add_child_axes for y then
x. Ordered iteration over that actual registered list calls original
Secondary.draw; its declared superclass stagehost evaluates the real selected
major Formatter batch. The y callback changes parent x scale before the x child
checks it. This proves the targeted sequencing with source methods, without
claiming arbitrary full superclass draw parity. Independent Scene export/render
hand tests cover the production path.

## Covered behavior

Each child has its own numeric Axis, four default slots, default flags and stable
formatter context. Parent ticker objects or date/category metadata are not its
defaults. Only exact parent name `log` chooses functionlog; all other supported
parent names choose function. Same-name calls retain all four objects and their
captured rc state. A different nonlog parent name still installs fresh function
defaults and captures current minor-visible rc.

With the declared f(x)=2x+5/inverse pair, ordinary constructor own view is [0,1].
A log parent's constructor executes real own empty-data autoscale and returns
[5,5.234401174884448e50], not current mapped parent limits or a fixed [1,10].
The child owns null data intervals and positive minimum Inf. Direct aspect then
maps parent view into the child without reinstalling defaults; positioned aspect
also changes active physical context; draw checks for a parent name change only
after old-context limit sync.

A successful set_ticks latches source provenance and expands the raw own view,
without a synthetic nonsingular pass. A later direct locator setter keeps that
latch. At a genuine parent-name change, the source reads that CURRENT locator,
installs all four fresh defaults, then restores a fresh FixedLocator with the
current saved values. It does not restore an old set_ticks argument or preserve
custom minor/formatter slots. Retained external formatter handles keep the
stable child's binding. The JSON and generated checks retain exact per-slot
identity/default-flag observations.

The old-Fixed/constant-forward case stores [3.8,4.2] before installing new log
defaults. Reversing that order would produce different limits. A NaN-forward
case fails actual finite limit validation before installing anything, preserving
old function context, cached parent name and [0,1] view.

## Physical and coordinate stages

The baseline is dpi72, figure320×240, font10pt, parent rectangle [.2,.2,.4,.6].
Constructor/direct aspect uses the original child rectangle: x tick-space10,
y11. Positioned aspect uses actual parent active length: x4/y7. Original numeric
BBox and font/get_tick_space methods produce those results. The inverse affine
uses an already-rounded `1/72` multiplication; replacing it with endpoint
division changes y's constructor space from11 to12. View and physical context
must be synchronized at the matching source stage.

Two additional decreasing/inverted position cases use the explicitly recorded
parent rectangle [0,0,.4,.6], giving binary-exact width128 and origin0. Original
child.transData transforms raw x=[-20,-15,-10] to [128,64,0], or [0,64,128] for
inverted parent view. Original TransformedBbox sorts transformed corners, then
restores the original raw Bbox inversion. These exact original normalized-bounds
and pixel outputs drive backend WB assertions through real Axis function context,
SecondaryPlacement, bundle preparation and tick-fraction implementation. No
renderer algorithm is copied to calculate expected positions.

## Scope and acceptance

Existing scalar Double→Double functions bridge the source pointwise mathematical
mappings. Arbitrary NumPy vector callback identity/effects, user Transform objects,
full GUI/style/spine protocols, units and complete superclass drawing remain
outside this profile. No public set_functions API is added; the planning evidence
for same-name function replacement is not misrepresented as a migrated API.

Scene physical-context callbacks in fixtures provide the original positioned
BBox's selected origin/length. They do not seed a fake child tick count or
replace child limit/default logic. Source complete original raw set_ticks
interval setters preserve inversion; they are not the old harness's simplified
interval overwrite.

Implementation and Moon acceptance are separate from successful source generation.
The parent task owns all project gates and interface review. A successful Python
`--check` confirms only reproducibility of the original source artifacts.

Older locator references retain their original JSON values and declared source
hosts. Their Moon fixtures explicitly enter the recorded aspect/positioned stage
before querying a child. The old Log reference's superclass setter is a raw
interval storage sink and its scale setter only records names; its corresponding
fixture therefore uses a controlled Axis view/minpos provider, rather than
claiming those raw negative intervals come from a real Secondary constructor or
limit finalizer. The complete constructor and old-context limit finalization are
covered by this separate lifecycle profile.

Focused hand tests additionally exercise function transform capture, late minor
overlap phases, checked partial failures, raw source tick expansion, old-owner
binding, SVG child ordering and immutable placement. The legacy formatter bridge
uses the owned child's stored view; ownerless transport retains its established
parent mapping. Diagnostic source probes for these regressions are separate from
the 53 formal observations counted above.

D40 acceptance adds 38 registered tests: these 2 generated groups and 36 focused
hands. The second complete four-target suite passed every test except two older
physical-context fixtures. Their source-only Bbox profile leaves origins free;
the fixtures now choose source-verified translated origins that preserve its
exact 240/120 point lengths through the genuine affine, with every old expected
value unchanged. The full numeric-context file then passed 86/86 on each target.
Cumulative verified coverage is 21990 tests on wasm/wasm-gc/native and 21997 on JS.
All six older source generators pass `--check` with byte-identical JSON; the
formal 53-observation JSON is likewise unchanged. The 111-line interface diff
was reviewed, including removal of four old public mutable ticker mirror fields
in favor of existing getters/setters. No snapshot or tolerance was weakened.
