///|
test "Log Python true division retains arbitrarily large denominator ratios" {
  let huge = @bigint.BigInt::from_int(1) << 2000
  assert_eq(log_grid_integer_ratio(huge, huge), 1.0)
  assert_eq(log_grid_integer_ratio(huge.neg(), huge << 1), -0.5)
  assert_eq(log_grid_integer_ratio(@bigint.BigInt::from_int(1), huge), 0.0)
  assert_eq(
    log_grid_integer_ratio(@bigint.BigInt::from_int(-1), huge).reinterpret_as_uint64(),
    0x8000000000000000UL,
  )
}

///|
test "Log clip retains signed unsigned and object scalar origins" {
  assert_true(
    log_grid_space(LogTickSpace::Integer(@bigint.BigInt::from_int(5)))
    is NumpyInteger(5L),
  )
  assert_true(
    log_grid_space(LogTickSpace::Integer(@bigint.BigInt::from_int(1) << 63))
    is NumpyUnsigned(9UL),
  )
  assert_true(
    log_grid_space(LogTickSpace::Integer(@bigint.BigInt::from_int(1) << 64))
    is PythonInteger(value) &&
    value == @bigint.BigInt::from_int(9),
  )
  assert_true(log_grid_space(LogTickSpace::Number(5.0)) is NumpyFloat(5.0))
}

///|
test "Log fallback sees the visible subdivision after the eager prefix" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let owner = Array::make(62501, 1.0e9)
  owner[62500] = 1.0
  let locator = LogLocator::new(
    subs=Some(LogSubs::Values(TickValues::from_array(owner))),
  )
  let ticks = locator.tick_values(1.0, 1.0)
  assert_eq(ticks.length(), 100000)
  assert_eq(ticks[0], 1.0e8)
  assert_eq(ticks[62500], 0.1)
  assert_eq(ticks[62501], 1.0e9)
  assert_eq(ticks[99999], 1.0e9)
}

///|
test "Log logical subdivisions use full visible count without enumerating a trillion entries" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = LogLocator::new(base=1.0e12, subs=Some(LogSubs::Text("all")))
  let ticks = locator.tick_values(1.0, 1.0)
  assert_eq(ticks.length(), 100000)
  assert_eq(ticks[0], 1.0e-12)
  assert_eq(ticks[99999], 1.0e-7)
}
