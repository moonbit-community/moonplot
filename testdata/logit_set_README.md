# LogitFormatter numeric label-set reference

D34 is accepted. The corrected set fixture passes all four targets; complete
acceptance and cumulative suite counts are in the main LogitFormatter guide.

`LogitFormatter` retains a mutable numeric set across shallow copies. Preparation
clears the same holder in place and inserts original input objects after making
an independent ndarray snapshot. Numeric hashing, identity and comparison can
therefore affect subsequent labels and exceptions.

The private `LogitLabelled` kernel implements the reachable CPython 3.12.14 set
operations: clear, add, lookup, resize and physical-order iteration. It preserves
the hash gate before numeric rich comparison, ten-slot linear probe groups,
unsigned perturb steps, the growth trigger, the strictly larger power-of-two
table, and old-slot-order clean rehash. There is no arbitrary deletion API.
The growth multiplier changes after 50000 used entries. A separate checked
resource limit reflects MoonBit Array addressability, without a 100000-key cap.

`LogitKey` preserves a `ScalarNumber` and its object identity. Equal hashes do
not imply numeric equality: NumPy Float64 comparison with a huge Python integer
can overflow, and NumPy Bool comparison can fail C-long conversion. These
failures must occur only if the set actually probes that equal-hash key.
The numeric hashing and comparison helpers are reused from the accepted
engineering formatter implementation; its dictionary table is not reused.

Portable NaN hashes are zero. Native Python hashes depend on object addresses,
so native mixed-NaN probe order is a separate host boundary. The generator
executes real builtin `set` operations on float/np.float64 NaN subclasses that
override only `__hash__` to zero, preserving numeric comparisons and identity.
Separate unordered native observations retain the corresponding host behavior.
Finite and hash-gated overflow cases execute the unmodified numeric objects.
The reference includes both directions of a NaN/huge-integer hash collision:
native NumPy NaN membership misses the hash gate and returns false, whereas
the portable zero-hash profile reaches comparison and raises integer-to-float
overflow. Python-float NaN retains its own comparison behavior. This explicit
profile difference is preserved, rather than presented as native parity.

The fixed source is CPython v3.12.14 `Objects/setobject.c`, SHA256
`e633e7ae4e427ecead8879965910e27427d34ae0fc5b956142bc337f741a367c`.
The generator verifies that hash and the 64-bit Python3.12.14/NumPy2.3.5 runtime.
The protocol is rewritten for typed MoonBit keys and arrays; the CPython license
and attribution are retained in `LICENSE-CPYTHON` and `THIRD_PARTY_NOTICES.md`.
There is no Python runtime dependency.

The generated key array reuses actual source aliases, including the NumPy Bool
singleton. Retained-handle assertions therefore observe the original identity
graph instead of constructing an independent wrapper for each repeated key.

109 independent traces contain 6548 actual source steps. Four registered
groups invoke fresh private cases and compare each operation's result, exact
exception, table capacity and every retained key identity in physical order.
One further registered test inserts all 80000 distinct integers and checks
capacity plus an ordered full-set checksum, then verifies clear resets the
table. The JSON retains the actual builtin results; no translated set model
supplies expectations.

Generate, then verify without rewriting:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_logit_set_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_logit_set_reference.py --check
```

Both commands exit0. The set reference and growth test pass on all four targets.
