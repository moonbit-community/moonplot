///|
test "MultipleLocator typed finite domain rejects nonfinite configuration" {
  for value in [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0] {
    assert_true(
      try {
        ignore(@ticker.MultipleLocator::new(base=value))
        false
      } catch {
        @core.DataError::InvalidTicks(..) => true
        _ => false
      },
    )
    assert_true(
      try {
        ignore(@ticker.MultipleLocator::new(offset=value))
        false
      } catch {
        @core.DataError::InvalidTicks(..) => true
        _ => false
      },
    )
  }
}

///|
test "MultipleLocator typed updates reject invalid tuples atomically" {
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=0.75)
  let live = locator.as_locator()
  for value in [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0] {
    assert_true(
      try {
        locator.set_params(base=5.0, offset=value)
        false
      } catch {
        @core.DataError::InvalidTicks(..) => true
        _ => false
      },
    )
    assert_eq(locator.base(), 2.5)
    assert_eq(locator.offset(), 0.75)
    assert_true(
      try {
        locator.set_params(base=value, offset=-3.0)
        false
      } catch {
        @core.DataError::InvalidTicks(..) => true
        _ => false
      },
    )
    assert_eq(live.multiple_locator().unwrap().base(), 2.5)
    assert_eq(live.multiple_locator().unwrap().offset(), 0.75)
  }
}

///|
test "MultipleLocator adapters retain handles and explicit copies are independent" {
  let locator = @ticker.MultipleLocator::new(base=0.25)
  let independent = locator.copy()
  let major = locator.as_locator().copy()
  let minor = locator.as_minor_locator().copy()
  assert_eq(minor.tick_values([0.0, 1.0], 0.0, 1.0), [0.25, 0.5, 0.75])
  minor.multiple_locator().unwrap().set_params(base=0.5, offset=0.25)
  assert_eq(locator.base(), 0.5)
  assert_eq(major.multiple_locator().unwrap().offset(), 0.25)
  assert_eq(minor.tick_values([0.0, 1.0], 0.0, 1.0), [0.25, 0.75])
  assert_eq(independent.base(), 0.25)
  assert_eq(independent.offset(), 0.0)
  independent.set_params(base=2.0)
  assert_eq(locator.base(), 0.5)
  let values = locator.tick_values(0.0, 1.0)
  values[0] = 1000.0
  assert_eq(locator.tick_values(0.0, 1.0), [-0.25, 0.25, 0.75, 1.25])
}

///|
test "MultipleLocator convenience defaults and getters distinguish locator kinds" {
  let locator = @ticker.multiple_locator()
  assert_eq(locator.tick_values(0.0, 1.0), [-1.0, 0.0, 1.0, 2.0])
  assert_eq(locator.multiple_locator().unwrap().base(), 1.0)
  assert_eq(locator.multiple_locator().unwrap().offset(), 0.0)
  assert_true(@ticker.linear_locator().multiple_locator() is None)
  assert_true(@ticker.auto_minor_locator().multiple_locator() is None)
}
