# EngFormatter object and prefix dictionary references

`scripts/generate_eng_formatter_params_reference.py` executes the complete pinned
Matplotlib v3.11.2 `EngFormatter` class after the accepted Scalar source loader.
It retains the real Formatter/TickHelper, deprecation descriptors, RcParams,
validators, and explicit empty-font-catalog host profile from D31. It does not
execute a Matplotlib renderer or scan the host font catalog.

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_eng_formatter_params_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_eng_formatter_params_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py --check
```

The payload contains 431 observations, 365 executable private cases, and 54
source-only records. Each group of at most 32 private cases is one registered
whitebox test, for 12 registered tests. Each case retains its own `defer` cleanup,
configuration, source expectations, and assertions. Grouping controls Wasm
initializer size without removing cases or merging their mutable state.

The original ticker.py SHA256 is
`49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad`.
The Eng class segment SHA256 is
`08220e46b87854bc79a9573fbe4cb441c8067c9d734f6917d1ff170ddd342e09`.
The loader verifies the pinned dependency hashes and records its explicit host
profile in the JSON. Python is 3.12.14 and NumPy is 2.3.5.

The object cases preserve constructor defaults versus explicit `None`, six raw
numeric origins for `places` and inherited slots, delayed `:d` errors, Bool
precision, 4300-digit conversion errors, captured rc flags, live String slots,
Scalar inheritance, and independent shallow-copy slots sharing axis, locations,
power-limit containers, and instance prefix tables. Class-table rebinding stays
live for objects without an instance override. Clearing an override restores
lookup of the current class table. The existing pure `eng_formatter` helper
keeps its previous validation, sentinel, and immutable enum behavior.

Prefix references separately identify real builtin `hash`/`dict` observations.
They preserve insertion order, numeric hash modulo `2**61-1`, stored-key origin,
hash-before-equality, NumPy weak equality, same-object NaN identity, independent
dictionary copies, and errors during colliding numeric comparisons. Empty,
missing, nonintegral, infinite, and NaN-first bounds are consumed at their actual
original stages. Huge integer/NumPy comparison errors are retained in both
insertion directions rather than hidden by converting every key to Double.

The physical table follows the general combined-table portion of CPython
v3.12.14 `Objects/dictobject.c`: unsigned perturb lookup, EMPTY/DUMMY indices,
ordered entry tombstones, `used*3` growth, and fast versus compact dictionary
copies. Its official source is recorded in the JSON with SHA256
`2139caefe57c6659db766fdda5e53c57f0e42e9335227875756307acfcdb51dd`.
This matters when NumPy equality is nontransitive: with `P=2**61-1`, `N=2**120`,
delete `N` from `{N:'A',N+P:'B'}`, then insert `N-P:'D'`. Iteration is `['B','D']`
but querying `np.float64(N)` returns `'D'`, including after dictionary copying.
A linear scan of insertion order returns the wrong value.

NaN key handles use a **portable deterministic hash of zero**. Native CPython
and NumPy NaN hashes depend on object addresses; this port does not clone those
addresses or promise identical mixed-NaN physical-slot traces. NaN equality and
identity remain distinct: the same handle replaces its entry, another NaN
handle inserts another entry, and copied tables retain key identities.

The payload contains an explicit source/profile difference. For
`H=(10**400//P)*P`, an actual native NumPy NaN dictionary accepts a distinct H
key because its native hash differs from zero. The portable zero-hash profile
instead reaches the actual NumPy NaN-versus-H comparison, which raises
`OverflowError: int too large to convert to float`. Both source outcomes are
recorded under separate origins; the test strictly checks the portable error
and resulting length, and checks that it differs from the original dictionary
length. No native address hash is serialized as a stable expected constant.
The broader trace reference keeps mixed NaN slot interleaving outside its
native-parity claim. The underlying native-rich-comparison error is executed
with the real NumPy scalar; no substitute scalar class poses as NumPy.

String unit/sep/prefix values and the six numeric key/precision origins define
the typed object domain. Arbitrary Python objects, nonnumeric keys, nonnumeric
precision values, and non-String suffix truth/string protocols remain explicit
source-only observations. Numerical formatting/preparation, actual Axis
lifecycle, and broader prefix operation traces have independent references.
Resource failures remain separate from original Python parameter errors.
