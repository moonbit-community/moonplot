# Named LogitFormatter numerical profile

The named formatter preserves the complete original preparation and call sequence.
The existing pure logit convenience formatter remains separate. This numerical
slice adds no axis or configuration reads: precision depends on the prepared
locations, and short text follows its own fixed native-format branches.

The formal reference runs the pinned complete `LogitFormatter` class and original
`_is_decade` and `_is_close_to_int` helpers through
`formatter_reference_source.load_logit_formatter`. It executes actual NumPy,
builtin set/sorted/round and Python formatting. No Moon formatter or copied
selection algorithm supplies expected output. Reproduce from the repository root:

```
python scripts/generate_logit_formatter_numeric_reference.py
python scripts/generate_logit_formatter_numeric_reference.py --check
```

Use the pinned CPython3.12.14 / NumPy2.3.5 Darwinarm64 runtime. There is no positional
source-path argument. Dependency hashes are retained in the JSON. The corpus has
2,389 numerical cases in 75 registered groups, 26 primitive cases in 1 group, and
2 hand tests: 2,417 validation cases in 78 registered tests. Actual-source and
mathematical observations are counted separately: 9,574 and 9,572 respectively.
Project acceptance is complete; all numerical and primitive groups and both
hand tests passed on all four targets. See the root checkpoint for full evidence.

## Mathematical and native profiles

The mathematical namespace changes only positive finite elementary ln/log10
values, independently evaluated at Decimal180/320 with matching binary64 results. Native ufunc calls
first retain the real dtype, supported input domain, errors and RuntimeWarnings;
independently computed values replace finite results. Complete class branches,
array promotion, NumPy round, native set/sort and formatting remain source code.
The sampled corpus has no source/math output differences. Both profiles remain
recorded separately; this does not claim all-input equivalence with Darwin libm.
Native NumPy RuntimeWarnings are stored separately from API warning diagnostics.

Decade detection deliberately computes rounded `np.log(abs(x))/np.log(10)`,
NumPy round and `np.isclose` with both explicit rtol1e-7 and default atol1e-8.
It does not substitute log10 or the different math.isclose helper. NumPy Int64
absolute-value wrapping and Python-integer ufunc domain errors remain observable.
The ideal half test also retains the late `int(np.round(2*x))` stage: a legal
Python integer2^63 can reach a larger object-dtype round and throw its native
ufunc error, rather than merely returning false.

For nonideal values, scientific normalization evaluates exact Python integer-base
`10**(-exponent)` and its scalar multiplication before reading the locations
length. Tiny non-decade probabilities can therefore fail float conversion even
with an empty cache; ideal tiny decades may take an earlier successful branch.
Precision then uses the second sorted absolute distance, round/ceil and the
source minimum. Nonfinite-distance errors precede the minimum clamp. Final fixed
digits reuse the accepted uncapped formatting kernel. No100-digit precision
clamp, logit-transform rewrite or new transcendental primitive is introduced.

## Origin, identity and array stages

Preparation first creates an independent owning ndarray snapshot, then clears the
existing shared label-set holder. Failure before snapshot completion keeps old
state; later failures retain the new snapshot and cleared or partially updated
set. The ideal scan, length comparisons and selected-key update still consume the
original input. Original scalar origins and explicit key identities are retained;
they are not replaced by the promoted snapshot's elements.

A fresh formatter inherits a Python list as its default locations container.
`1-list` can fail for a complement query, whereas `set_locs([])` creates an empty
ndarray and permits the same query. Boolean snapshots, UInt64 snapshots and
object snapshots each retain their own native operations:1-bool promotes to
Int64,1-UInt64 wraps in UInt64, and object loops complete reciprocal/subtraction
passes before a later ufunc failure. UInt64 snapshot records project their exact
integers through the documented numeric bridge; `.get_uint64` assertions preserve
all64 bits, including values above2^53.

For numeric Float64 distances, the second rank is found with a complete linear
scan and NumPy's NaN-last numeric ordering. Object distances instead keep the
complete subtraction and absolute-value passes, then call the separate fixed
NumPy2.3.5 object quicksort implementation. Its partial NaN comparisons differ
from numeric sorting. Three complete original-class regressions explicitly retain
these distinct outcomes for query.2:

- `[2**64,.2,nan,.2001]` prints`0.2`.
- `[.2,nan,.2001,2**64]` raises the original NaN-to-integer error.
- `[nan,.2,.2001,2**64]` raises the original infinity-to-integer error.

Minor selection computes reciprocal, subtraction, ln, unary negative, difference
and padded neighbor keys as separate source operations. It calls the independent
fixed CPython3.12.14 powersort implementation for the full index order. Ordinary
stable sorting is insufficient for reachable NaN keys. Number0 selects the full
tail slice; negative counts, NumPy integer wrapping and late float/bool slicing
errors follow source consumption order. There is no minor-count reduction.

Minor membership occurs before probability validation. The key/set implementation
preserves explicit NaN identity and supported numeric hash/rich-comparison
behavior. The identity hand test verifies that the same cached NaN key reaches
its numerical error while a distinct NaN key returns an empty label. The UInt64
hand test verifies an independent snapshot, wrapping complement and resulting
public label. These tests complement the complete-source cases.

## Complete resources and error visibility

The formal source executes a complete200001-point ndarray, including the full
minor sort and selected set. The generated fixture reconstructs the exact source
linspace input; Python checks every input bit against the actual NumPy array
before emitting it. The high-end selected label is asserted, so retaining only
an initial100000-point prefix cannot satisfy the case. Independent full per-point
Decimal enumeration of this large vector is one explicit CPU-budget omission;
the actual source allocation and sort execute fully. The omission is neither a
source exception nor a library input limit.

Array addressability is the existing typed-container boundary. String preflight
uses actual wrapper length. No arbitrary point, precision or sorting budget is
presented as a source error. One-half text is inserted verbatim, overline mode
uses its current truth value, and both ordinary labels and short text keep their
source ASCII-minus behavior. Inherited format_data preserves minor filtering and
math markup; it does not borrow the D33 strip-math or filter-relaxation protocol.
