///|
test "log scale transforms and inverts positive values" {
  let scale = @scale.log_scale()
  assert_true(scale.is_log())
  assert_true(scale.is_valid(10.0))
  assert_true(!scale.is_valid(0.0))
  assert_eq(scale.transform(100.0), 2.0)
  assert_eq(scale.inverse(2.0), 100.0)
}

///|
test "log scale produces mantissa ticks over a short range" {
  let ticks = @scale.log_scale().tick_values(@core.limits(1.0, 10.0))
  assert_eq(ticks, [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])
}

///|
test "log scale produces decade ticks over a broad range" {
  let ascending = @scale.log_scale().tick_values(@core.limits(0.1, 1000.0))
  assert_eq(ascending, [0.1, 1.0, 10.0, 100.0, 1000.0])
  let descending = @scale.log_scale().tick_values(@core.limits(1000.0, 0.1))
  assert_eq(descending, [1000.0, 100.0, 10.0, 1.0, 0.1])
}

///|
test "log scale rejects non-positive tick ranges" {
  assert_eq(
    @scale.log_scale().tick_values(@core.limits(-1.0, 10.0)).length(),
    0,
  )
}

///|
test "symlog scale transforms both signs and generates symmetric ticks" {
  let scale = try! @scale.symlog_scale(linthresh=1.0, base=10.0)
  assert_true(scale.is_nonlinear())
  assert_true(!scale.is_log())
  assert_true(scale.is_valid(-100.0))
  let transformed = scale.transform(-100.0)
  assert_true(transformed < 0.0)
  assert_true(Double::abs(scale.inverse(transformed) + 100.0) < 1.0e-9)
  let ticks = scale.tick_values(@core.limits(-100.0, 100.0))
  assert_true(ticks.contains(-100.0))
  assert_true(ticks.contains(-1.0))
  assert_true(ticks.contains(0.0))
  assert_true(ticks.contains(1.0))
  assert_true(ticks.contains(100.0))
}

///|
test "symlog scale validates its parameters" {
  try @scale.symlog_scale(linthresh=0.0) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("linthresh"))
    _ => fail("expected a symlog linthresh error")
  } noraise {
    _ => fail("expected a symlog linthresh error")
  }
  try @scale.symlog_scale(base=1.0) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("base"))
    _ => fail("expected a symlog base error")
  } noraise {
    _ => fail("expected a symlog base error")
  }
}
