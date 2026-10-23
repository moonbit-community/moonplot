///|
test "Logit minor NaN identity precedes numerical validation" {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  let base = formatter.as_base_formatter()
  let state = logit_formatter_state(base)
  let nan = LogitKey::new(ScalarNumber::Number(0.0 / 0.0))
  let input = LogitInput::from_keys([
    LogitKey::new(ScalarNumber::Number(0.23)),
    nan,
    LogitKey::new(ScalarNumber::Number(0.77)),
  ])
  logit_named_prepare(base, state, input)
  assert_true(state.labelled.contains(nan))
  let other = LogitKey::new(ScalarNumber::Number(0.0 / 0.0))
  assert_true(!state.labelled.contains(other))
  assert_eq(logit_named_call(base, state, other, None), "")
  assert_eq(
    try {
      ignore(logit_named_call(base, state, nan, None))
      "unexpected success"
    } catch {
      @core.DataError::InvalidTicks(message~) => message
      _ => "unexpected error"
    },
    "ValueError: cannot convert float NaN to integer",
  )
}

///|
test "Logit UInt64 snapshot and complement preserve original array arithmetic" {
  let keys = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_uint64(9223372036854775808UL)),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_uint64(18446744073709551615UL)),
    ),
  ]
  let input = LogitInput::from_keys(keys)
  let formatter = LogitFormatter::new()
  let base = formatter.as_base_formatter()
  let state = logit_formatter_state(base)
  logit_named_prepare(base, state, input)
  keys[0] = LogitKey::new(ScalarNumber::Number(0.25))
  let snapshot = match base.locations {
    Typed(array) => array
    _ => abort("unexpected snapshot")
  }
  assert_eq(snapshot.dtype(), "uint64")
  assert_eq(snapshot.get_uint64(0), 9223372036854775808UL)
  let complement = match logit_array_complement(base.locations) {
    Typed(array) => array
    _ => abort("unexpected complement")
  }
  assert_eq(complement.dtype(), "uint64")
  assert_eq(complement.get_uint64(0), 9223372036854775809UL)
  assert_eq(complement.get_uint64(1), 2UL)
  assert_eq(
    logit_named_call(
      base,
      state,
      LogitKey::new(ScalarNumber::Number(0.95)),
      None,
    ),
    "$\\mathdefault{1-5\\cdot10^{-2}}$",
  )
}
