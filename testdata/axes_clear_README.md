# Explicit Scene clear source reference

`scripts/generate_axes_clear_reference.py` produces
`testdata/axes_clear_reference.json` and
`scene/axes_clear_reference_wbtest.mbt`. Expected state comes from fixed
Matplotlib v3.11.2 Python bodies, not the Moon implementation.

The reference contains 54 scenarios in two registered tests, with at most32
private scenario functions per group. Each scenario owns its rc restoration and
fresh source/typed graph. It enters the unchanged complete `Axes.__clear` body
60 times: 55 finish successfully and five raise at a deliberately selected late
checked provider boundary. Shared assertion helpers retain every state check
without repeating the check implementation in every scenario.

## Executed source

The generator imports the stable loader from
`generate_axis_initial_clear_reference.py`. That loader executes complete
original Axis.__init__/clear together with the accepted actual ticker, scale,
formatter, rc-validator and descriptor namespace. This reference additionally
executes complete original bodies for:

- `_AxesBase.__clear`, sharex/sharey and `_validate_converted_limits`;
- Axis._set_lim, limit_range_for_scale and both autoscale-flag helpers;
- real Grouper and `_OrderedSet`;
- GridSpec.subplots and FigureBase._remove_axes.

Required files are checked against these fixed SHA-256 identities:

| Upstream file | SHA-256 |
| --- | --- |
| axes/_base.py | ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b |
| axis.py | f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0 |
| cbook.py | e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643 |
| figure.py | b440ab0a5be03cb39b13529a2fec497d2d96deb083e3e56d6220593e3ec567da |
| gridspec.py | df8395306765d9b93f98d6b2e867836a9b2b0786cf5b39a26103309c4331afde |

Hashes for the complete ticker/scale/formatter dependency chain are inherited
from the stable loader and included in the JSON. The runtime is CPython3.12.14
and NumPy2.3.5 on Darwin arm64. Actual NumPy core SHA-256 is
`b11f1ef3534cc6bb0a9c8141206350b27cadf48632c34acfcfc97ca6e700363e`,
the explicitly audited D35 signature profile; the old signed binary hash is not
used to describe this run.

## Scenarios and asserted state

The first36 scenarios preserve the original preparation matrix: four x/y minor
visibility combinations, no removal/original-reference removal/nonreference
removal, and each of three possible clear initiators. Four descending-view
scenarios and two repeated-clear scenarios extend that matrix. Other cases
cover five late failures, three Scene allocation entry projections, and two
Figure/SubFigure retain-panel clear projections.

Two additional cases repeat the actual original removed-target scenario in
ascending and descending directions, simultaneously checking x and y, while
using the Scene's builtin view provider. They deliberately omit the controlled
`axes_clear_bind_stored_views` helper. They verify the lifecycle reads the removed
target's own (100,200)/(300,400), or reversed endpoints, even after it rejoins a
group whose surviving peer still retains (10,20)/(30,40). The preceding52 source
scenarios and all their expected observations remain unchanged.

Every result asserts geometry, exact stored view endpoints, automatic/manual
view selection, real ordered group members, retained share target identity,
all four locator/formatter classes, all four default flags, shared live handle
identity, object owners, active Figure membership and local artist counts.
A final public provider witness disambiguates locator ownership, including a
locator bound to a retained removed panel. Formatter binding identity is checked
directly. The per-coordinate minpos read sequence also verifies finalization
order and that Figure/SubFigure do not clear a nested panel twice.

Important source behavior represented here includes:

- x then y, initiating Axis.clear first, followed by its actual Grouper peers;
- a late rc-visible AutoMinor install that leaves only the minor-locator default
  flag false and gives that locator to the initiating axis;
- an original reference axis resetting (0,1)/auto=true and emitting to peers;
- a nonreference axis joining and aliasing its retained target before a checked
  get_xlim/ylim failure can occur;
- removed targets rejoining the shared group without rejoining the Figure;
- copying a removed target's old scale only after successful limit finalization,
  which can leave log geometry with shared new linear tickers;
- exceptions from own minpos or a late target view getter preserving all earlier
  holder, membership, artist and per-coordinate limit mutations.

The five source ValueErrors are projected to typed `Core.DataError` callbacks.
They are not tolerated, discarded, or treated as successful atomic clears.

## Host and scope boundaries

Numeric view/data/minpos, unitless conversion and Figure ownership are explicit
host capabilities. Text, font, patch, spine, grid and callback presentation use
sinks. Source algorithms for default installation, sharing, ordering, numeric
limit finalization and clear itself remain unchanged. The host x/y setters
delegate to the real Axis._set_lim body. Typed view providers read stored views,
matching this controlled source view host and avoiding an unrelated renderer or
lazy autoscale implementation. The final two builtin-provider regressions instead
exercise the production Scene binding directly, so the controlled host cannot
conceal a bug in that integration.

The three construction cases check the finished state reached by the complete
Axis constructor and final original Axes.__clear phase through `figure().axes()`,
`add_axes`, and `add_subplot`. They do not claim execution of the entire graphical
Axes.__init__ method or arbitrary projection constructors.

The accepted Moon Figure/SubFigure clear convenience retains panels. Its two
scenarios therefore execute actual source Axes.__clear once per selected unique
active panel in creation order, and check that same explicit projection. They do
not label it as original Figure.clear, which removes panels. The nested
SubFigure case also checks duplicate references do not repeat numeric resets.

These references do not cover arbitrary Python units, custom scales or injected
Python classes, weak-reference expiry without retained handles, secondary default
installation, full Artist removal callbacks, glyph layout or a real renderer.
Presentation Text reset sinks are not used as evidence about source label text.

## Reproduction

Run generation and its exact comparison sequentially with the fixed runtime:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_axes_clear_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_axes_clear_reference.py --check
```

The source run and `--check` pass. Moon compilation, interfaces and all-target
acceptance are recorded centrally in `docs/MIGRATION_STATUS.md`; source generation
and stdin formatting alone are not a claim of those gates passing.
