///|
test "Asinh billion-point full set skips plateaus and keeps both tails" {
  // The full source allocation is independently omitted, not a source error.
  // This is a descriptor/property assertion, not a fabricated source vector.
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(
      LogNumTicks::Integer(@bigint.BigInt::from_string("1000000000")),
    ),
  )
  let ticks = locator.tick_values(-100.0, 100.0)
  assert_true(ticks.length() > 20 && ticks.length() < 100)
  assert_eq(ticks[0], -100.0)
  assert_eq(ticks[ticks.length() - 1], 100.0)
  assert_true(ticks.contains(0.0))
  for index in 1..<ticks.length() {
    assert_true(ticks[index - 1] < ticks[index])
  }
}

///|
test "Asinh complete singleton proof precedes huge fallback prefix" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(
      LogNumTicks::Integer(@bigint.BigInt::from_string("1000000000")),
    ),
  )
  let ticks = locator.tick_values(1.0, 2.0)
  assert_eq(ticks.length(), 100000)
  assert_eq(ticks[0], 1.0)
  assert_true(ticks[99999] > 1.0 && ticks[99999] < 1.001)
}

///|
test "Asinh full NaN cardinality prevents fallback without enumeration" {
  let locator = AsinhLocator::new(
    0.0,
    numticks=Some(
      LogNumTicks::Integer(@bigint.BigInt::from_string("1000000000")),
    ),
  )
  let ticks = locator.tick_values(1.0, 2.0)
  assert_eq(ticks.length(), 100000)
  assert_true(ticks.all(value => value.is_nan()))
}

///|
test "Asinh live sequence chooses zero by earliest source flatten rank" {
  let subs = [0.0, 1.0, -0.0]
  let locator = AsinhLocator::new(1.0, subs=Some(AsinhSubs::Sequence(subs)))
  let first = locator.tick_values(-100.0, 100.0).filter(value => value == 0.0)
  assert_eq(first.length(), 1)
  assert_eq(first[0].reinterpret_as_uint64(), (-0.0).reinterpret_as_uint64())
  subs[0] = -1.0
  let second = locator.tick_values(-100.0, 100.0).filter(value => value == 0.0)
  assert_eq(second.length(), 1)
  assert_eq(second[0].reinterpret_as_uint64(), 0UL)
}
