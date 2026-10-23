# D37 autoscale original-source reference

`generate_autoscale_reference.py` executes the complete pinned Matplotlib 3.11.2
`Axes.autoscale`, `autoscale_view`, `_request_autoscale_view`, `_unstale_viewLim`,
view-limit/bound setters and getters, original Axis final limit implementation,
and all five scale transforms. It reuses the accepted D36 original-class loader,
real ticker objects, real RcParams, and real Grouper. It never uses the MoonBit
port to compute expected results.

The 56 cases are 48 Scene lifecycle cases and eight data-cache cases, registered
in two groups of at most 32. Assertions retain exact floating-point bits,
auto-enable/stale/mutated states, per-Axes tight and margins, raw cached intervals
and minimum-positive values, shared membership, checked errors and partial writes,
and authoritative view/own-minpos callback order. NaN equality is classified;
finite values have no tolerance. Source NaN/Inf inputs are tagged in JSON.
Every grouped call retains its case ID and label when reporting a failure.
The inherited original Axis host supplies tick space 5; the Moon fixture
projects it through 10-point labels and active lengths of 150 points horizontally
or 100 points vertically (source factors 3 and 2), rather than relying on the
incidental Figure size. This is explicit controlled physical context.

The lifecycle matrix covers five scales in both directions, immediate versus lazy
operations, auto true/false/None, tight true/false/None, disabled and unselected
coordinates, empty mutated and restored viewports, shared requester ownership,
removed/rejoined members, inversion, sticky edges with positive/negative margins
and tiny coordinates, round-number policy, scale-change forcing, and positive
infinite/NaN margins. Error cases distinguish raw shared DataBox minpos, final
own-Axis minpos, first/second bound-view reads, and a late failing peer after the
initiator has stored its view and all shared stale flags have been consumed.

The cache matrix executes complete original `Axes.update_datalim`,
`_update_line_limits`, `relim`, and Bbox update/ignore/set-points methods. It covers
coordinate-selective initial updates, all-nonfinite early return, the paired
finite mask, empty versus nonempty invalid Line paths, and empty relim. Empty
relim clears intervals to the null Bbox and preserves old minpos until a later
successful ignore-existing update replaces the selected coordinate.

Numeric interval, Path vertices, presentation, and ownership capabilities are
explicit source hosts. A view read maps to the project's authoritative checked
provider; the complete original `Axis.get_inverted` performs the second read.
Sticky-edge containers correspond to whitebox-seeded Scene ColorImage extent
endpoints. This raw source-host context includes equal endpoints; it bypasses
public imshow validation, fitting, cache updates, and request scheduling without
changing their production contracts. Tests seed cached raw data and views
explicitly to isolate lifecycle behavior;
that seeding does not claim to execute a renderer or arbitrary Artist protocols.
Full unit conversion, arbitrary artist mutation/provenance, secondary autoscale,
and full graphical Axes construction remain separate migration work. D36 clear
and D35 scale-default source references retain their own accepted scopes.

The JSON records exact source hashes and the actually executed NumPy binary
hash. The loader retains accepted portable-mathematics boundaries; any observed
cross-platform primitive difference must be recorded with both values rather
than ignored or hidden by tolerance.

Run from the repository root with the fixed CPython 3.12.14 / NumPy 2.3.5 runtime:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_autoscale_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_autoscale_reference.py --check
```

The generator uses stdin-only `moonfmt` to format its generated test file. This
is formatting, not compilation or acceptance. Root performs project interfaces,
static checks and four-target testing after all parallel writers stop.

Acceptance: D37 second complete four-target run passed all21892 tests on wasm,
wasm-gc and native, and21899 on JS. The56 source cases remain strict, including
finite bits and callback order. Separate integration files add37 focused tests
(39 new registered tests in total). All three changed reference generators pass
independent --check; their original numeric JSON observations are unchanged.
The228-line interface diff was reviewed and final checks retain seven existing
Ref deprecation warnings with no errors. See MIGRATION_STATUS.md for exact logs
and the diagnosed first-run failures rather than treating that run as passing.
