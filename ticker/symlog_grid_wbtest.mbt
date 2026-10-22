///|
test "SymLog simple set bypasses parameters and preserves first signed zero" {
  let locator = SymmetricalLogLocator::new(
    base=0.0 / 0.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Text("unsized")),
  )
  locator.set_numticks(LogNumTicks::Text("not numeric"))
  let ticks = locator.tick_values(-0.0, 0.5)
  assert_eq(ticks.length(), 2)
  assert_eq(ticks[0].reinterpret_as_uint64(), (-0.0).reinterpret_as_uint64())
  assert_eq(ticks[1], 0.5)
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog underflow decades retain signed zero once before subs multiplication" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=4.9406564584124654e-324,
    subs=Some(
      SymLogSubs::Values(TickValues::from_array([1.0 / 0.0, 0.0 / 0.0])),
    ),
  )
  let ticks = locator.tick_values(-0.5, 0.5)
  assert_eq(ticks.length(), 31)
  let zeros = ticks.filter(value => value == 0.0)
  assert_eq(zeros.length(), 3)
  assert_eq(zeros[0].reinterpret_as_uint64(), (-0.0).reinterpret_as_uint64())
  assert_eq(zeros[1].reinterpret_as_uint64(), 0UL)
  assert_eq(zeros[2].reinterpret_as_uint64(), 0UL)
}

///|
test "SymLog integer subs retain a live reverse view and promote multiplication" {
  let owner = [9007199254740993L, 0L, 9007199254740994L]
  let view = TickValues::from_int64_array(owner).view(2, -2, 2)
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(view)),
  )
  let before = locator.tick_values(2.0, 3.0)
  assert_eq(before, [9007199254740994.0, 9007199254740992.0])
  owner[0] = -3L
  let after = locator.tick_values(2.0, 3.0)
  assert_eq(after, [9007199254740994.0, -3.0])
  assert_true(view.is_int64())
  assert_eq(view.get_int64(1), -3L)
}

///|
test "SymLog enormous full reversed arange retains repeated Float64 phase" {
  // The original NumPy allocation is independently omitted in source case 249.
  // Its exact Float64 shape has stride 1 but (start + 1) - start == 0.
  // This checks the logical prefix without pretending an omitted source array
  // supplied numeric expected values.
  let locator = SymmetricalLogLocator::new(
    base=1.0000000000000002,
    linthresh=1.0e50,
  )
  locator.set_numticks(
    LogNumTicks::Integer(@bigint.BigInt::from_string("100000000000000000000")),
  )
  let ticks = locator.tick_values(-1.0e100, -1.0e60)
  assert_eq(ticks.length(), 100000)
  assert_true(ticks[0] < -0.5e60 && ticks[0] > -2.0e60)
  assert_eq(
    ticks[0].reinterpret_as_uint64(),
    ticks[99999].reinterpret_as_uint64(),
  )
}
