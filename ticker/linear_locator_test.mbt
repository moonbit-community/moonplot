///|
test "LinearLocator preset store exact keys replacement and borrowed arrays" {
  let presets = @ticker.LinearLocatorPresets::new()
  assert_eq(presets.length(), 0)
  let first = [1.0]
  let replacement = [2.0]
  presets.set(-0.0, 1.0, first)
  presets.set(0.0, 1.0, replacement)
  assert_eq(presets.length(), 1)
  replacement[0] = 7.0
  assert_eq(presets.get(-0.0, 1.0).unwrap().to_array(), [7.0])
  assert_true(presets.get(1.0, 0.0) is None)
  let nan = 0.0 / 0.0
  presets.set(nan, 1.0, [9.0])
  assert_true(presets.get(nan, 1.0) is None)
  presets.clear()
  assert_eq(presets.length(), 0)
  assert_true(presets.get(0.0, 1.0) is None)
}

///|
test "LinearLocator shallow copies keep independent count properties" {
  let locator = @ticker.LinearLocator::new(numticks=3)
  let shallow = locator.copy()
  locator.set_numticks(Some(1))
  assert_eq(locator.numticks(), 1)
  assert_eq(shallow.numticks(), 3)
  shallow.set_numticks(None)
  assert_eq(shallow.numticks(), 11)
  assert_eq(shallow.configured_numticks(), None)
  assert_eq(locator.configured_numticks(), Some(1))
  let first = locator.tick_values(0.0, 1.0)
  first.set(0, 99.0)
  assert_eq(locator.tick_values(0.0, 1.0).to_array(), [0.0])
}

///|
test "LinearLocator empty presets bypass delayed negative count errors" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(0.0, 1.0, [])
  let locator = @ticker.LinearLocator::new(numticks=-2147483648, presets~)
  assert_eq(locator.tick_values(1.0, 0.0).length(), 0)
  presets.clear()
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "LinearLocator preset views retain shape and report externally shrunk buffers" {
  let values = [1.0, 2.0, 3.0]
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(0.0, 1.0, values)
  let locator = @ticker.LinearLocator::new(presets~)
  let view = locator.tick_values(0.0, 1.0)
  ignore(values.pop())
  assert_eq(view.length(), 3)
  assert_true(
    try {
      ignore(view.get(2))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.tick_values(0.0, 1.0).length(), 3)
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0).to_array())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}
