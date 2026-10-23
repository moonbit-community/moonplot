# EngFormatter numerical reference

This package runs the complete pinned Matplotlib v3.11.2 `EngFormatter` and its
real `ScalarFormatter` parent, API/deprecation helpers and RcParams through
`scripts/formatter_reference_source.py::load_eng_formatter`. The original class
is the oracle. It does not use the old MoonBit engineering convenience formatter.

Reproduce with the fixed Python runtime, then compare without writing:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_eng_formatter_numeric_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_eng_formatter_numeric_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py --check
```

The JSON records upstream/helper hashes, CPython 3.12.14 and NumPy 2.3.5,
1163 numerical cases, 1609 actual-source observations and 37 registered tests.
Every case has a private function; 32 functions form one registered test, with
all case assertions and configuration restoration preserved. Two additional
hand tests distinguish structural output addressability and the inherited,
proved Int64 offset-search nontermination boundary from source exceptions.

The actual and mathematical namespaces retain the complete class algorithms.
Only base-ten powers and `math.log`/`math.log10` primitives are redirected in the
mathematical namespace. Independent Decimal180/320 agreement defines the existing
portable correctly rounded profile. Engineering order rounds natural ln(span)
and ln(1000) separately, then divides the two Doubles; it does not substitute an
exact logarithm ratio, log10(span)/3 or a decimal exponent bin.

There are six numerical profile differences: the natural logs and resulting
base1000 ratios for Python integers `10**400`, `10**400-1` and `2**10000` differ
by one or two ULPs from the source host. Both actual and mathematical values are
explicitly retained, and the tests require the mathematical bits exactly. Their
engineering orders agree. No complete formatted string or exception differs in
this matrix. Seven additional records differ only because original NumPy power
emits a native RuntimeWarning for a custom prefix table at exponent330; the
portable mathematical primitive has no NumPy host warning route. These are
separately counted as `native_warning_only_difference_count`, with both warning
records intact. Native NumPy warnings are separate from `_api.warn_external`.

The source reference covers:

- All six ScalarNumber origins, signed zero, NaN/Inf errors, Int64 wrapping,
  huge Python integers, subnormals, maxfinite and native precision/type errors.
- SI power neighborhoods, ties and one-step prefix promotion after formatting;
  default six-significant-digit `g`, fixed precision101/1100 and the upper SI clamp.
- Live mutable maps with fractional and BigInt bounds, holes, empty tables,
  NaN key order, Boolean/NumPy Boolean keys, wider IEEE ranges and late int-key lookup.
- Exact NumPy clip dtype behavior, including discarded out-of-range pure Python
  integer endpoints, subsequent promotion, NaNs and signed-zero ties.
- First-view midpoint/engineering range preparation, retained partial states,
  cached offset calls, integer-base offset factors, inherited short formatting
  with NumPy Bool float16 spacing, literal math strings and whole-result minus.
- A full200001-element source array whose final value affects Scalar refinement.
  This new engine applies no prefix cap or arbitrary precision cap.

Valid giant fixed outputs near the Int32 string-address limit are independently
omitted from source allocation; this is a recorded oracle budget decision. It is
not a Python exception. The port checks actual structural String addressability
before allocating an impossible result. The inherited unequal-Int64/extrema
collapse case is an explicit Unsupported boundary with a proof that the original
search does not terminate, rather than a fabricated source error or loop budget.

The old `formatter_engineering.mbt` pure helper and existing accepted reference
expectations remain unchanged. The D31 ten-digit rounding entry delegates to a
shared digits primitive; its existing numerical source `--check` also passes.
Host font discovery, TeX rendering and native warning routing retain their
previous explicit capability boundaries.
