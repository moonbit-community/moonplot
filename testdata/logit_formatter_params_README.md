# LogitFormatter object and snapshot reference

`logit_formatter_params_reference.json` executes the complete original
Matplotlib v3.11.2 `LogitFormatter`, `_is_decade`, `_is_close_to_int`,
Formatter/TickHelper and the real deprecated-locations descriptor. It uses the
fixed CPython 3.12.14 / NumPy 2.3.5 runtime. No port helper creates expected values.

The pinned ticker.py SHA256 is
`49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad`.
The complete LogitFormatter source segment SHA256 is
`38685127398f0dd97b97cb053f9fe172c2adff6be9b0d394df16eab869b58194`.
The explicit `load_logit_formatter` entry appends to the shared source loader;
all accepted earlier loader bytes and branch metadata remain unchanged.

Reproduce from the repository root:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_logit_formatter_params_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_logit_formatter_params_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py --check
```

The reference contains 1222 original-source observations, 637 private cases
registered in 20 groups of at most 32, and 15 separately retained source-only
observations. Every generated case retains all its assertions. Grouping reduces
test registration overhead; it does not sample or cap source input arrays.

The raw `LogValue` parameter domain retains six Python/NumPy numeric origins,
Text and None. Constructor and four source setters do not validate or convert
these slots. Counts can fail later at comparison, NumPy unary minus or actual
slice consumption. Zero count, negative and huge integer counts, fractional
counts, NaN/infinity and Python/NumPy Bool differences remain observable.
`one_half` uses native string conversion only when the half branch is reached,
including the original 4300-digit integer-string error. Source methods here do
not read axis providers or rc; axis/dummy identity is inherited base state.

Locations follow the original `np.array` snapshot stage before clearing the
existing mutable label set. References cover all scalar-type pairs and mixed
triples in the selected domain, signed/zero-stride views, exact Int64 values,
and independent owner mutation. Float64/Int64 snapshots use copied TickValues.
The readonly `NumericArray` bridge supplies Bool, UInt64 and object snapshots;
its object entries retain the original six scalar origins. UInt64 `get_value`
projects an exact Python Integer because ScalarNumber has no NumPy UInt64
variant; `get_uint64` supplies exact unsigned access. NumericArray has no public
constructor or mutation method. These getter projections are typed bridges,
not claims that native NumPy UInt64 is a Python int during vector arithmetic.

Original input objects remain separate from normalized snapshot scalars.
Explicit `LogitKey` sequences preserve scalar identity; ndarray iteration makes
fresh scalar keys. Cases verify same-handle NaN errors, fresh-handle NaN misses,
and list versus ndarray batch behavior using `[-.2, NaN]`. Root's set reference
owns the native probing/hash profile, including the stated portable NaN-hash
boundary. This parameter reference does not substitute numeric equality for
key identity.

Shallow copies share the mutable labelled holder and initially share locations.
Preparing the copy rebinds only its snapshot while clearing/updating both
objects' label whitelist. Failed preparation after clear also affects both;
raw parameter setters retain stale prepared state. Exported labelled arrays
are readonly snapshots of key handles, so clearing an exported array does not
clear the underlying set. Parent/downcast views retain live object identity.

The 15 source-only observations are raw list/ndarray parameter containers and
0D/2D/ragged/arbitrary-object location protocols beyond these carriers. Numeric
object arrays composed of the six supported scalar origins are supported and
are covered by passing snapshot cases; they are not part of that exclusion.
Native RuntimeWarnings are retained as observations and are separate from API
diagnostics. B's numeric reference independently records any elementary-math
source/portable differences; these parameter expectations remain original-source
values and errors without tolerance or replacement.

Generation and `--check` passed. Both new production files were formatted using
stdin-only `moonfmt -`. Project compilation, reviewed interfaces and four-target behavior checks have
passed as recorded in the main LogitFormatter guide. Formatting and source
checks remain distinct evidence from those project gates.
