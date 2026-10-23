///|
test "log generated cache retains complete enormous logical shape" {
  let base = 576460752303423488.0
  let all = log_cache_arange(base)
  assert_true(log_cache_contains(all, base))
  assert_true(log_cache_contains(all, 1.0))
  assert_true(!log_cache_contains(all, 0.0))
  assert_true(!log_cache_contains(all, base * 2.0))
  // Full arange casts the logical index before adding start. At exponent53
  // that separate addition has ties, so not every representable integer occurs.
  assert_true(!log_cache_contains(all, 9007199254740994.0))
  assert_true(log_cache_contains(all, 9007199254740996.0))
  let geom = log_cache_geom(base)
  assert_true(log_cache_contains(geom, base))
  assert_true(log_cache_contains(geom, 1.0))
  assert_true(!log_cache_contains(geom, 0.0))
  for cache in [all, geom] {
    assert_eq(
      try {
        ignore(log_cache_values(cache))
        "unexpected success"
      } catch {
        @core.DataError::InvalidTicks(message~) => message
        _ => "unexpected error"
      },
      "ResourceError: log sublabel snapshot exceeds Array addressability",
    )
  }
}

///|
test "log tiny all-label grid honors rounded stop rather than ceil base" {
  assert_eq(log_cache_values(log_cache_arange(5.0e-324)), [])
  assert_eq(log_cache_values(log_cache_arange(0.5)), [1.0])
  assert_eq(log_cache_values(log_cache_arange(10.0)), [
    1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0,
  ])
}

///|
test "log rational fractional powers resolve exact roots" {
  assert_eq(log_format_positive_power(81.0, 0.25), 3.0)
  assert_eq(log_format_positive_power(625.0, 0.25), 5.0)
  assert_eq(log_format_positive_power(81.0, -0.25), 1.0 / 3.0)
  assert_eq(log_format_positive_power(0.0625, -0.25), 2.0)
  // Both exact rational powers equal 2^-1075, halfway between +0 and the
  // minimum subnormal. Nearest-even selects +0; Decimal pow is not a tie oracle.
  assert_eq(log_format_positive_power(0.25, 537.5).reinterpret_as_uint64(), 0UL)
  assert_eq(
    log_format_positive_power(0.0625, 268.75).reinterpret_as_uint64(),
    0UL,
  )
  assert_eq(
    log_format_positive_power(
      0.25,
      0x4080cbffffffffffUL.reinterpret_as_double(),
    ).reinterpret_as_uint64(),
    1UL,
  )
  assert_eq(
    log_format_positive_power(
      0.25,
      0x4080cc0000000001UL.reinterpret_as_double(),
    ).reinterpret_as_uint64(),
    0UL,
  )
}

///|
test "log data cache filtering remains active and raw label slot restores" {
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::Text("raw"),
  )
  let base = formatter.as_base_formatter()
  let state = log_formatter_state(base)
  state.sublabels = Some(log_cache_explicit([1.0]))
  assert_eq(log_named_data(base, state, ScalarNumber::Number(2.0)), "")
  assert_true(state.label_only_base is Text("raw"))
  assert_eq(log_named_data(base, state, ScalarNumber::Number(10.0)), "10^1")
  assert_true(state.label_only_base is Text("raw"))
}
