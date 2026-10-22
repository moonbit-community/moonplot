///|
test "asinh view failure precedes count validation while direct calls ignore owner" {
  let locator = @ticker.AsinhLocator::new(1.0, numticks=None)
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.contains("view interval")
      _ => false
    },
  )
  let reads = Ref(0)
  locator.bind_view_interval(fn() raise @core.DataError {
    reads.val += 1
    raise @core.DataError::InvalidTicks(message="asinh checked owner")
  })
  let shallow = locator.copy()
  assert_true(
    try {
      ignore(shallow.call())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "asinh checked owner"
      _ => false
    },
  )
  assert_eq(reads.val, 1)
  locator.set_numticks(
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(1))),
  )
  assert_eq(locator.tick_values(8.0, -10.0), [8.0])
  assert_eq(reads.val, 1)
  assert_eq(locator.nonsingular(0.0, 0.0), (-0.05, 0.05))
  assert_eq(locator.view_limits(0.0, 0.0), (-0.001, 0.001))
  assert_eq(reads.val, 1)
  locator.bind_view_interval(fn() { (8.0, -10.0) })
  assert_eq(locator.call(), [8.0])
  locator.set_symthresh(1.0 / 0.0)
  assert_eq(locator.call(), [-10.0])
  assert_true(shallow.numticks() is None)
}

///|
test "asinh constructor count forwarding distinguishes omission and raw None" {
  fn make(numticks : @ticker.LogNumTicks??) -> @ticker.AsinhLocator {
    @ticker.AsinhLocator::new(1.0, numticks?)
  }
  let first = make(None)
  let second = make(Some(None))
  guard first.numticks() is Some(@ticker.LogNumTicks::Integer(value)) else {
    fail("omitted count must select eleven")
  }
  assert_eq(value, @bigint.BigInt::from_int(11))
  assert_true(second.numticks() is None)
  second.set_params(numticks=None, symthresh=None, base=None, subs=None)
  assert_true(second.numticks() is None)
  second.set_numticks(
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(1))),
  )
  assert_eq(second.tick_values(1.0, 2.0), [1.0])
}

///|
test "asinh results remain independent of borrowed numeric input" {
  let owner = [2.0]
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(1))),
    subs=Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array(owner))),
  )
  let ticks = locator.tick_values(1.0, 2.0)
  ticks[0] = 999.0
  assert_eq(owner, [2.0])
  owner[0] = 0.0
  assert_eq(ticks, [999.0])
  assert_eq(locator.tick_values(1.0, 2.0), [1.0])
}
