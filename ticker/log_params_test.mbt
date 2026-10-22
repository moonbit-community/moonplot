///|
test "log provider getters and shallow copies retain live closures until rebind" {
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(3))),
  )
  let space = Ref(4.0)
  let view = Ref((1.0, 100.0))
  let minimum = Ref(0.01)
  let shared = [0.01, 0.1]
  locator.bind_tick_space(fn() { @ticker.LogTickSpace::Number(space.val) })
  locator.bind_view_interval(fn() { view.val })
  locator.bind_minpos(fn() { minimum.val })
  locator.bind_shared_minpos(fn() { shared })
  let shallow = locator.copy()
  space.val = 7.0
  view.val = (10.0, 1000.0)
  minimum.val = 0.001
  shared[0] = 0.001
  assert_eq(
    shallow.tick_space_provider().unwrap()(),
    @ticker.LogTickSpace::Number(7.0),
  )
  assert_eq(shallow.view_interval_provider().unwrap()(), (10.0, 1000.0))
  assert_eq(shallow.minpos_provider().unwrap()(), 0.001)
  assert_eq(shallow.shared_minpos_provider().unwrap()(), [0.001, 0.1])
  locator.bind_view_interval(fn() { (1.0, 10.0) })
  assert_eq(shallow.view_interval_provider().unwrap()(), (10.0, 1000.0))
  assert_eq(locator.view_interval_provider().unwrap()(), (1.0, 10.0))
}

///|
test "log warnings are copied operation snapshots and clear on checked failure" {
  let locator = @ticker.LogLocator::new()
  assert_eq(locator.nonsingular(-2.0, 0.0), (1.0, 10.0))
  let message = "Data has no positive values, and therefore cannot be log-scaled."
  assert_eq(locator.warnings(), [message])
  let external = locator.copy()
  let warnings = locator.warnings()
  warnings.clear()
  assert_eq(locator.warnings(), [message])
  assert_true(
    try {
      ignore(locator.nonsingular(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(external.warnings(), [message])
  assert_true(
    try {
      ignore(external.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(external.warnings(), [])
}

///|
test "log partial binding never supplies a missing required provider" {
  let locator = @ticker.LogLocator::new()
  assert_true(locator.tick_space_provider() is None)
  assert_true(locator.view_interval_provider() is None)
  assert_true(locator.minpos_provider() is None)
  assert_true(locator.shared_minpos_provider() is None)
  locator.bind_minpos(fn() { 0.01 })
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 10.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  locator.set_numticks(
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(9)),
  )
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.nonsingular(1.0, 10.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(!locator.tick_values(1.0, 10.0).is_empty())
}
