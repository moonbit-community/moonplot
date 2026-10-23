///|
test "log mathematical exponent option retains arbitrary integers across snapshots and resets" {
  @config.reset()
  defer @config.reset()
  assert_eq(@config.formatter_min_exponent(), @bigint.BigInt::from_int(0))
  let large = @bigint.BigInt::from_int(10).pow(@bigint.BigInt::from_int(100))
  @config.set_formatter_min_exponent(large)
  let saved = @config.rc_params()
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(-3))
  assert_eq(saved.formatter_min_exponent(), large)
  assert_eq(@config.formatter_min_exponent(), @bigint.BigInt::from_int(-3))
  @config.reset()
  assert_eq(@config.formatter_min_exponent(), @bigint.BigInt::from_int(0))
  assert_eq(saved.formatter_min_exponent(), large)
}
