// Generated from original LogLocator and Axis minpos/shared binding AST.

///|
fn verify_log_axis_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() {
      assert_true(actual[index].is_nan())
    } else {
      assert_eq(
        actual[index].reinterpret_as_uint64(),
        value.reinterpret_as_uint64(),
      )
    }
  }
}

///|
test "Log original axis context 0" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.bind_minpos(() => 0.1)
  axis.bind_shared_minpos(() => [0.001, 0.1])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  @config.set_axes_autolimit_mode("data")
  verify_log_axis_numbers(locator.tick_values(-2.0, 100.0), [
    0.01, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_log_axis_numbers(locator.tick_values(-2.0, 100.0), [
    0.01, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
}

///|
test "Log original axis context 1" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.bind_minpos(() => 0.1)
  axis.bind_shared_minpos(() => [0.001, 0.1])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  @config.set_axes_autolimit_mode("data")
  verify_log_axis_numbers(locator.tick_values(0.1, 100.0), [
    0.01, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(0.1, 100.0)
      [pair.0, pair.1]
    },
    [0.1, 100.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(0.1, 100.0)
      [pair.0, pair.1]
    },
    [0.1, 100.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_log_axis_numbers(locator.tick_values(0.1, 100.0), [
    0.01, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(0.1, 100.0)
      [pair.0, pair.1]
    },
    [0.1, 100.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(0.1, 100.0)
      [pair.0, pair.1]
    },
    [0.1, 100.0],
  )
}

///|
test "Log original axis context 2" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.bind_minpos(() => 0.1)
  axis.bind_shared_minpos(() => [0.001, 0.1])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  @config.set_axes_autolimit_mode("data")
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(100.0, -2.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(100.0, -2.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(100.0, -2.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(100.0, -2.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
}

///|
test "Log original axis context 3" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.bind_minpos(() => 0.1)
  axis.bind_shared_minpos(() => [0.001, 0.1])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  @config.set_axes_autolimit_mode("data")
  verify_log_axis_numbers(locator.tick_values(5.0, 5.0), [1.0, 10.0])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(5.0, 5.0)
      [pair.0, pair.1]
    },
    [1.0, 10.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(5.0, 5.0)
      [pair.0, pair.1]
    },
    [1.0, 10.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_log_axis_numbers(locator.tick_values(5.0, 5.0), [1.0, 10.0])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(5.0, 5.0)
      [pair.0, pair.1]
    },
    [1.0, 10.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(5.0, 5.0)
      [pair.0, pair.1]
    },
    [1.0, 10.0],
  )
}

///|
test "Log original axis context 4" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.bind_minpos(() => 0.1)
  axis.bind_shared_minpos(() => [0.001, 0.1])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  @config.set_axes_autolimit_mode("data")
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(0.0 / 0.0, 1.0 / 0.0)
      [pair.0, pair.1]
    },
    [1, 10],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(0.0 / 0.0, 1.0 / 0.0)
      [pair.0, pair.1]
    },
    [1, 10],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(0.0 / 0.0, 1.0 / 0.0)
      [pair.0, pair.1]
    },
    [1, 10],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(0.0 / 0.0, 1.0 / 0.0)
      [pair.0, pair.1]
    },
    [1.0, 10.0],
  )
}

///|
test "Log original axis context 5" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.bind_minpos(() => 0.1)
  axis.bind_shared_minpos(() => [0.001, 0.1])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  @config.set_axes_autolimit_mode("data")
  assert_true(
    try {
      ignore(locator.tick_values(-2.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 0.0)
      [pair.0, pair.1]
    },
    [1, 10],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(-2.0, 0.0)
      [pair.0, pair.1]
    },
    [1, 10],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.tick_values(-2.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 0.0)
      [pair.0, pair.1]
    },
    [1, 10],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(-2.0, 0.0)
      [pair.0, pair.1]
    },
    [1.0, 10.0],
  )
}

///|
test "Log original axis context 6" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.bind_minpos(() => 0.1)
  axis.bind_shared_minpos(() => [0.001, 0.1])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  @config.set_axes_autolimit_mode("data")
  verify_log_axis_numbers(locator.tick_values(-2.0, 100.0), [
    0.01, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_log_axis_numbers(locator.tick_values(-2.0, 100.0), [
    0.01, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
}

///|
test "Log original axis context 7" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.bind_minpos(() => 0.1)
  axis.bind_shared_minpos(() => [0.001, 0.1])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  @config.set_axes_autolimit_mode("data")
  verify_log_axis_numbers(locator.tick_values(0.1, 100.0), [
    0.01, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(0.1, 100.0)
      [pair.0, pair.1]
    },
    [0.1, 100.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(0.1, 100.0)
      [pair.0, pair.1]
    },
    [0.1, 100.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_log_axis_numbers(locator.tick_values(0.1, 100.0), [
    0.01, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(0.1, 100.0)
      [pair.0, pair.1]
    },
    [0.1, 100.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(0.1, 100.0)
      [pair.0, pair.1]
    },
    [0.1, 100.0],
  )
}

///|
test "Log original axis context 8" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.bind_minpos(() => 0.1)
  axis.bind_shared_minpos(() => [0.001, 0.1])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  @config.set_axes_autolimit_mode("data")
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(100.0, -2.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(100.0, -2.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(100.0, -2.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(100.0, -2.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
}

///|
test "Log original axis context 9" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.bind_minpos(() => 0.1)
  axis.bind_shared_minpos(() => [0.001, 0.1])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  @config.set_axes_autolimit_mode("data")
  verify_log_axis_numbers(locator.tick_values(5.0, 5.0), [1.0, 10.0])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(5.0, 5.0)
      [pair.0, pair.1]
    },
    [1.0, 10.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(5.0, 5.0)
      [pair.0, pair.1]
    },
    [1.0, 10.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_log_axis_numbers(locator.tick_values(5.0, 5.0), [1.0, 10.0])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(5.0, 5.0)
      [pair.0, pair.1]
    },
    [1.0, 10.0],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(5.0, 5.0)
      [pair.0, pair.1]
    },
    [1.0, 10.0],
  )
}

///|
test "Log original axis context 10" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.bind_minpos(() => 0.1)
  axis.bind_shared_minpos(() => [0.001, 0.1])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  @config.set_axes_autolimit_mode("data")
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(0.0 / 0.0, 1.0 / 0.0)
      [pair.0, pair.1]
    },
    [1, 10],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(0.0 / 0.0, 1.0 / 0.0)
      [pair.0, pair.1]
    },
    [1, 10],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(0.0 / 0.0, 1.0 / 0.0)
      [pair.0, pair.1]
    },
    [1, 10],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(0.0 / 0.0, 1.0 / 0.0)
      [pair.0, pair.1]
    },
    [1.0, 10.0],
  )
}

///|
test "Log original axis context 11" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.bind_minpos(() => 0.1)
  axis.bind_shared_minpos(() => [0.001, 0.1])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  @config.set_axes_autolimit_mode("data")
  assert_true(
    try {
      ignore(locator.tick_values(-2.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 0.0)
      [pair.0, pair.1]
    },
    [1, 10],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(-2.0, 0.0)
      [pair.0, pair.1]
    },
    [1, 10],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.tick_values(-2.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 0.0)
      [pair.0, pair.1]
    },
    [1, 10],
  )
  verify_log_axis_numbers(
    {
      let pair = locator.view_limits(-2.0, 0.0)
      [pair.0, pair.1]
    },
    [1.0, 10.0],
  )
}

///|
test "Log original secondary empty minpos 0" {
  // Controlled original raw-view host, independent of constructor/draw finalization.
  let classic = @config.classic_mode()
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_scale(@scale.log_scale())
  axis.set_tick_layout(120.0, true)
  axis.bind_view_interval(() => (1.0, 100.0))
  axis.bind_minpos(() => 1.0 / 0.0)
  axis.bind_shared_minpos(() => [1.0 / 0.0])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  verify_log_axis_numbers(locator.call(), [0.1, 1.0, 10.0, 100.0, 1000.0])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(1.0, 100.0)
      [pair.0, pair.1]
    },
    [1.0, 100.0],
  )
}

///|
test "Log original secondary empty minpos 1" {
  // Controlled original raw-view host, independent of constructor/draw finalization.
  let classic = @config.classic_mode()
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_scale(@scale.log_scale())
  axis.set_tick_layout(120.0, true)
  axis.bind_view_interval(() => (-1.0, 98.0))
  axis.bind_minpos(() => 1.0 / 0.0)
  axis.bind_shared_minpos(() => [1.0 / 0.0])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-1.0, 98.0)
      [pair.0, pair.1]
    },
    [1.0e-300, 98.0],
  )
}

///|
test "Log original secondary empty minpos 2" {
  // Controlled original raw-view host, independent of constructor/draw finalization.
  let classic = @config.classic_mode()
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_scale(@scale.log_scale())
  axis.set_tick_layout(120.0, true)
  axis.bind_view_interval(() => (1.0, 100.0))
  axis.bind_minpos(() => 1.0 / 0.0)
  axis.bind_shared_minpos(() => [1.0 / 0.0])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  verify_log_axis_numbers(locator.call(), [0.1, 1.0, 10.0, 100.0, 1000.0])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(1.0, 100.0)
      [pair.0, pair.1]
    },
    [1.0, 100.0],
  )
}

///|
test "Log original secondary empty minpos 3" {
  // Controlled original raw-view host, independent of constructor/draw finalization.
  let classic = @config.classic_mode()
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_scale(@scale.log_scale())
  axis.set_tick_layout(120.0, true)
  axis.bind_view_interval(() => (-1.0, 98.0))
  axis.bind_minpos(() => 1.0 / 0.0)
  axis.bind_shared_minpos(() => [1.0 / 0.0])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-1.0, 98.0)
      [pair.0, pair.1]
    },
    [1.0e-300, 98.0],
  )
}

///|
test "Log original secondary empty minpos 4" {
  // Controlled original raw-view host, independent of constructor/draw finalization.
  let classic = @config.classic_mode()
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_scale(@scale.log_scale())
  axis.set_tick_layout(80.0, false)
  axis.bind_view_interval(() => (1.0, 100.0))
  axis.bind_minpos(() => 1.0 / 0.0)
  axis.bind_shared_minpos(() => [1.0 / 0.0])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  verify_log_axis_numbers(locator.call(), [0.1, 1.0, 10.0, 100.0, 1000.0])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(1.0, 100.0)
      [pair.0, pair.1]
    },
    [1.0, 100.0],
  )
}

///|
test "Log original secondary empty minpos 5" {
  // Controlled original raw-view host, independent of constructor/draw finalization.
  let classic = @config.classic_mode()
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_scale(@scale.log_scale())
  axis.set_tick_layout(80.0, false)
  axis.bind_view_interval(() => (-1.0, 98.0))
  axis.bind_minpos(() => 1.0 / 0.0)
  axis.bind_shared_minpos(() => [1.0 / 0.0])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-1.0, 98.0)
      [pair.0, pair.1]
    },
    [1.0e-300, 98.0],
  )
}

///|
test "Log original secondary empty minpos 6" {
  // Controlled original raw-view host, independent of constructor/draw finalization.
  let classic = @config.classic_mode()
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_scale(@scale.log_scale())
  axis.set_tick_layout(80.0, false)
  axis.bind_view_interval(() => (1.0, 100.0))
  axis.bind_minpos(() => 1.0 / 0.0)
  axis.bind_shared_minpos(() => [1.0 / 0.0])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  verify_log_axis_numbers(locator.call(), [0.1, 1.0, 10.0, 100.0, 1000.0])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(1.0, 100.0)
      [pair.0, pair.1]
    },
    [1.0, 100.0],
  )
}

///|
test "Log original secondary empty minpos 7" {
  // Controlled original raw-view host, independent of constructor/draw finalization.
  let classic = @config.classic_mode()
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_scale(@scale.log_scale())
  axis.set_tick_layout(80.0, false)
  axis.bind_view_interval(() => (-1.0, 98.0))
  axis.bind_minpos(() => 1.0 / 0.0)
  axis.bind_shared_minpos(() => [1.0 / 0.0])
  let locator = @ticker.LogLocator::new()
  axis.set_locator(locator.as_locator())
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-1.0, 98.0)
      [pair.0, pair.1]
    },
    [1.0e-300, 98.0],
  )
}

///|
test "Log original raw axis minor overlap 0" {
  let classic = @config.classic_mode()
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.set_scale(@scale.log_scale())
  axis.set_limits(2.1, 40.0)
  let major = @ticker.LogLocator::new()
  let minor = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
    ),
  )
  axis.set_locator(major.as_locator())
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_log_axis_numbers(minor.call(), [1.0, 2.0, 5.0, 10.0, 20.0, 50.0])
  verify_log_axis_numbers(
    axis.minor_tick_values_checked(@core.limits(2.1, 40.0)),
    [2.0, 5.0, 20.0, 50.0],
  )
}

///|
test "Log original raw axis minor overlap 1" {
  let classic = @config.classic_mode()
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.set_scale(@scale.log_scale())
  axis.set_limits(2.1, 40.0)
  let major = @ticker.LogLocator::new()
  let minor = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
    ),
  )
  axis.set_locator(major.as_locator())
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(false)
  verify_log_axis_numbers(minor.call(), [1.0, 2.0, 5.0, 10.0, 20.0, 50.0])
  verify_log_axis_numbers(
    axis.minor_tick_values_checked(@core.limits(2.1, 40.0)),
    [1.0, 2.0, 5.0, 10.0, 20.0, 50.0],
  )
}

///|
test "Log original raw axis minor overlap 2" {
  let classic = @config.classic_mode()
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.set_scale(@scale.log_scale())
  axis.set_limits(2.1, 40.0)
  let major = @ticker.LogLocator::new()
  let minor = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
    ),
  )
  axis.set_locator(major.as_locator())
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_log_axis_numbers(minor.call(), [1.0, 2.0, 5.0, 10.0, 20.0, 50.0])
  verify_log_axis_numbers(
    axis.minor_tick_values_checked(@core.limits(2.1, 40.0)),
    [2.0, 5.0, 20.0, 50.0],
  )
}

///|
test "Log original raw axis minor overlap 3" {
  let classic = @config.classic_mode()
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.set_scale(@scale.log_scale())
  axis.set_limits(2.1, 40.0)
  let major = @ticker.LogLocator::new()
  let minor = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
    ),
  )
  axis.set_locator(major.as_locator())
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(false)
  verify_log_axis_numbers(minor.call(), [1.0, 2.0, 5.0, 10.0, 20.0, 50.0])
  verify_log_axis_numbers(
    axis.minor_tick_values_checked(@core.limits(2.1, 40.0)),
    [1.0, 2.0, 5.0, 10.0, 20.0, 50.0],
  )
}

///|
test "Log original clipped nonpositive overlap transform" {
  let axis = @axis.axis()
  axis.set_scale(@scale.log_scale())
  axis.set_limits(1.0, 100.0)
  axis.set_locator(
    @ticker.FixedLocator::new([0.0, 1.0, 10.0, 100.0]).as_locator(),
  )
  let minor = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(
        @ticker.TickValues::from_array([-1.0, 0.0, 1.0, 2.0]),
      ),
    ),
    numticks=Some(@ticker.LogNumTicks::Number(9.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  verify_log_axis_numbers(minor.call(), [
    -0.1, 0.0, 0.1, 0.2, -1.0, 0.0, 1.0, 2.0, -10.0, 0.0, 10.0, 20.0, -100.0, 0.0,
    100.0, 200.0,
  ])
  verify_log_axis_numbers(
    axis.minor_tick_values_checked(@core.limits(1.0, 100.0)),
    [0.1, 0.2, 2.0, 20.0, 200.0],
  )
}

///|
test "Log scene original paired minpos 0" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.plot([-2.0, 0.001, 100.0], [1.0, 1.0, 1.0])
  assert_eq(axes.x_axis().get_minpos(), 0.001)
  assert_eq(axes.y_axis().get_minpos(), 1.0)
}

///|
test "Log scene original paired minpos 1" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.plot([10.0, 20.0, 40.0], [-2.0, 0.01, 4.0])
  assert_eq(axes.x_axis().get_minpos(), 10.0)
  assert_eq(axes.y_axis().get_minpos(), 0.01)
}

///|
test "Log scene original paired minpos 2" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.plot([-2.0, 0.001, 100.0, 1.0e-09, 0.0 / 0.0], [
    1.0,
    2.0,
    3.0,
    1.0 / 0.0,
    1.0e-12,
  ])
  assert_eq(axes.x_axis().get_minpos(), 0.001)
  assert_eq(axes.y_axis().get_minpos(), 1.0)
}

///|
test "Log scene original paired minpos 3" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.plot([-4.0, -2.0, 0.0], [-3.0, -1.0, 0.0])
  assert_eq(axes.x_axis().get_minpos(), 1.0 / 0.0)
  assert_eq(axes.y_axis().get_minpos(), 1.0 / 0.0)
}

///|
test "Log scene original paired minpos 4" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.plot([5.0e-324, 1.0], [1.0, 5.0e-324])
  assert_eq(axes.x_axis().get_minpos(), 5.0e-324)
  assert_eq(axes.y_axis().get_minpos(), 5.0e-324)
}

///|
test "Log scene original paired minpos 5" {
  let figure = @scene.figure()
  let axes = figure.axes()
  assert_eq(axes.x_axis().get_minpos(), 1.0 / 0.0)
  assert_eq(axes.y_axis().get_minpos(), 1.0 / 0.0)
}

///|
test "Log original Scene shared owner and removed copy x" {
  let classic = @config.classic_mode()
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let figure = @scene.figure(width=240, height=120)
  let axes = figure.subplots(1, 2, share_x=true)
  for panel in axes {
    panel.set_position(0.0, 0.0, 0.5, 2.0 / 3.0)
  }
  axes[0].plot([-2.0, 0.1, 100.0], [1.0, 1.0, 1.0])
  axes[1].plot([-2.0, 0.001, 100.0], [1.0, 1.0, 1.0])
  let locator = @ticker.LogLocator::new()
  axes[0].set_x_locator(locator.as_locator())
  verify_log_axis_numbers(locator.tick_values(-2.0, 100.0), [
    0.01, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  axes[1].set_x_locator(locator.as_locator())
  verify_log_axis_numbers(locator.tick_values(-2.0, 100.0), [
    0.0001, 0.01, 1.0, 100.0, 10000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  let external = locator.copy()
  axes[1].plot([0.00001], [1.0])
  verify_log_axis_numbers(locator.tick_values(-2.0, 100.0), [
    1.0e-06, 0.0001, 0.01, 1.0, 100.0, 10000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [1.0e-05, 100.0],
  )
  axes[1].remove()
  verify_log_axis_numbers(locator.tick_values(-2.0, 100.0), [
    0.01, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [0.1, 100.0],
  )
  verify_log_axis_numbers(external.tick_values(-2.0, 100.0), [
    1.0e-06, 0.0001, 0.01, 1.0, 100.0, 10000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = external.nonsingular(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [1.0e-05, 100.0],
  )
}

///|
test "Log original Scene shared owner and removed copy y" {
  let classic = @config.classic_mode()
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  let figure = @scene.figure(width=240, height=120)
  let axes = figure.subplots(1, 2, share_y=true)
  for panel in axes {
    panel.set_position(0.0, 0.0, 0.5, 2.0 / 3.0)
  }
  axes[0].plot([1.0, 1.0, 1.0], [-2.0, 0.1, 100.0])
  axes[1].plot([1.0, 1.0, 1.0], [-2.0, 0.001, 100.0])
  let locator = @ticker.LogLocator::new()
  axes[0].set_y_locator(locator.as_locator())
  verify_log_axis_numbers(locator.tick_values(-2.0, 100.0), [
    0.01, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  axes[1].set_y_locator(locator.as_locator())
  verify_log_axis_numbers(locator.tick_values(-2.0, 100.0), [
    0.0001, 0.01, 1.0, 100.0, 10000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [0.001, 100.0],
  )
  let external = locator.copy()
  axes[1].plot([1.0], [0.00001])
  verify_log_axis_numbers(locator.tick_values(-2.0, 100.0), [
    1.0e-06, 0.0001, 0.01, 1.0, 100.0, 10000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [1.0e-05, 100.0],
  )
  axes[1].remove()
  verify_log_axis_numbers(locator.tick_values(-2.0, 100.0), [
    0.01, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = locator.nonsingular(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [0.1, 100.0],
  )
  verify_log_axis_numbers(external.tick_values(-2.0, 100.0), [
    1.0e-06, 0.0001, 0.01, 1.0, 100.0, 10000.0,
  ])
  verify_log_axis_numbers(
    {
      let pair = external.nonsingular(-2.0, 100.0)
      [pair.0, pair.1]
    },
    [1.0e-05, 100.0],
  )
}
