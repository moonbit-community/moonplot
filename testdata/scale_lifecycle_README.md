# Explicit scale lifecycle reference

`generate_scale_lifecycle_reference.py` executes the fixed Matplotlib v3.11.2
`Axis`, `Ticker`, and five scale default installers. Expected states come from
these original bodies; the MoonBit implementation is never an oracle.

Run from the repository root with the pinned CPython 3.12.14 / NumPy 2.3.5
runtime:

```sh
python3 scripts/generate_scale_lifecycle_reference.py
python3 scripts/generate_scale_lifecycle_reference.py --check
```

The script has no positional source argument. It validates the pinned source
hashes. `--check` recomputes the original observations and the formatted MoonBit
fixture without writing either output. The original bodies and dependencies are
loaded through `load_scale_defaults`; the lifecycle module also exports
`load(ticker_path) -> (namespace, AxisHarness)` for the independent shared-axis
reference. Only artist notifications, graph/context hosts, and renderer-free
view/data/space/minpos providers are fixture sinks. In particular, the source
setters, four flags, scale factory, and Asinh `Artist._update_props` loop execute
the real bodies.

## Cases

There are 180 portable scenarios in 6 registered tests, with at most 32 private
case functions per registered test:

- 80 repeats: five scale profiles times every combination of the four user
  locator/formatter replacements. A user setter changes exactly its own flag;
  every completed explicit scale install replaces all four objects and sets all
  four flags to true, even for the same geometry and zero user replacements.
- 50 directed switches: all 25 profile pairs with descending positive and
  entirely negative view intervals. Installation preserves the original view
  context; it does not validate old fixed ticks against the new scale.
- 25 retained-context cases: all profile pairs retain an old locator provider
  and formatter binding. Replacing their slots does not detach them. The old
  locator reads subsequent changes to the same Axis context.
- 20 direct shared-holder cases: five profiles times the four setters. Sharing
  preserves the recipient's geometry and the existing owner's context; each
  later user setter changes the same shared slot and flag. The separate Scene
  suite covers original Grouper traversal and the final shared owner.
- 5 convenience-state projections: a source FixedLocator/FixedFormatter pair
  is replaced by scale defaults. The Moon fixture additionally verifies that
  the existing fixed-tick/label and legacy formatter slots are cleared by that
  replacement. Those convenience slots are the typed bridge, not additional
  upstream public fields.

Source states record class names, each independent default flag, owner identity,
and view context. Identity assertions inspect the underlying named locator
objects, not temporary enum adapters returned by getters. Previous formatters
remain bound to the original stable Axis binding.

The profile is linear; base-ten log; symlog with threshold 2, linscale 1, base 10;
asinh with width 1 and its source default base-ten numeric ticker profile; and
logit with masked invalid data. Minor visibility is explicitly false in both
coordinates and restored after every case. Numeric constructor defaults and
minor-visible rc capture have their own scale-default references. No numerical
kernel is replaced or re-profiled here, and there are no source/math differences,
allocation omissions, arbitrary count caps, or skipped portable scenarios.

## Source-only boundaries

Twelve further original-source diagnostics are stored separately from the 180
portable cases:

- Five manually constructed SymmetricalLogScale instances bypass transform
  validation, exposing bases 0, 1, negative, NaN, and infinity. These are not a
  claim that a Python public scale constructor accepts the raw Moon enum domain.
- Four dynamic `ScaleBase` subclasses raise after successive setter stages.
  The original `_set_scale` keeps the newly assigned scale and all earlier
  mutations; the final four-flag reset has not run. The current five valid typed
  geometries do not expose arbitrary Python setter hooks, so these exceptions
  are not manufactured as Moon requirements.
- Three factory errors (log base 1, asinh width 0, symlog threshold 0) occur before
  scale assignment, retaining the old scale and all four old ticker objects.
  The typed geometry constructors perform their own validation before an Axis
  receives a geometry.

Constructor defaults, `Axis.clear`, unit-converter default updates, and secondary
scale-name following remain separate lifecycle work. The 53 original stages in
`D35-axis-default-lifecycle-notes.md` document that remaining scope; the formal
generator does not read ignored checkpoint evidence as expected data.

`axis.py` SHA-256 is
`f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0`;
`scale.py` SHA-256 is
`4800482469b280454eb6e7a48f866ae7b146b27d1395644ffc09df0e91c9d7c1`.
All other dependency and selected method hashes are recorded in the JSON.
