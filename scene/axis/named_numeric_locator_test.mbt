///|
test "named Linear axis keeps zero single count and preset precedence" {
  let axis = @axis.axis()
  let locator = @ticker.LinearLocator::new(numticks=0)
  axis.set_locator(locator.as_locator())
  assert_eq(axis.tick_values_checked(@core.limits(0.0, 2.0)), [])
  locator.set_params(numticks=1)
  assert_eq(axis.tick_values_checked(@core.limits(0.0, 2.0)), [0.0])
  assert_eq(axis.tick_values_checked(@core.limits(2.0, 2.0)), [1.9])
  locator.set_params(numticks=-1)
  let values = [2.0, 0.0, 1.0]
  locator.presets().set(0.0, 2.0, values)
  assert_eq(axis.tick_values_checked(@core.limits(0.0, 2.0)), values)
  let borrowed = locator.tick_values(0.0, 2.0)
  borrowed.set(0, 1.5)
  assert_eq(axis.tick_values_checked(@core.limits(0.0, 2.0)), [1.5, 0.0, 1.0])
  axis.set_limits(2.0, 0.0)
  assert_eq(axis.tick_values_checked(@core.limits(0.0, 2.0)), [1.0, 0.0, 1.5])
}

///|
test "named Fixed adapter ignores reversed and nonfinite bounds without sorting" {
  let values = [4.0, 1.0, 0.0, 1.0, -1.0]
  let locator = @ticker.FixedLocator::new(values)
  let adapter = locator.as_locator()
  assert_eq(adapter.checked_tick_values(2.0, 0.0), values)
  assert_eq(adapter.checked_tick_values(0.0 / 0.0, 1.0 / 0.0), values)
  let axis = @axis.axis()
  axis.set_locator(adapter)
  assert_eq(
    axis.tick_values_checked(@core.limits(0.0 / 0.0, 1.0 / 0.0)),
    values,
  )
  locator.tick_values(0.0, 0.0).set(0, 3.0)
  assert_eq(
    axis.locator().unwrap().fixed_locator().unwrap().locations().get(0),
    3.0,
  )
}

///|
test "named Linear and Fixed major minor live bindings preserve fixed minor order" {
  let major = @ticker.LinearLocator::new(numticks=3)
  let locations = [3.0, 1.5, 0.5, 1.0, -0.5, 0.0 / 0.0, 1.0 / 0.0]
  let minor = @ticker.FixedLocator::new(locations)
  let axis = @axis.axis()
  axis.set_locator(major.as_locator())
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_limits(2.0, 0.0)
  let view = @core.limits(0.0, 2.0)
  assert_eq(axis.tick_values_checked(view), [2.0, 1.0, 0.0])
  assert_eq(axis.minor_tick_values_checked(view), [1.5, 0.5])
  major.presets().set(0.0, 2.0, [0.0, 2.0])
  assert_eq(axis.minor_tick_values_checked(view), [1.5, 0.5, 1.0])
  axis
  .minor_locator()
  .unwrap()
  .fixed_locator()
  .unwrap()
  .tick_values(0.0, 0.0)
  .set(1, 1.75)
  assert_eq(locations[1], 1.75)
  assert_eq(axis.minor_tick_values_checked(view), [1.75, 0.5, 1.0])
}

///|
test "named Linear axis checked automatic rounding errors preserve explicit views" {
  let previous = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous))
  let locator = @ticker.LinearLocator::new(numticks=2)
  let axis = @axis.axis()
  axis.set_locator(locator.as_locator())
  let data = @core.limits(1.1, 1.9)
  @config.set_axes_autolimit_mode("data")
  let ordinary = axis.view_limits_checked(data)
  assert_eq((ordinary.lower(), ordinary.upper()), (1.1, 1.9))
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(axis.view_limits_checked(data))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  axis.set_limits(1.8, 1.2)
  let explicit = axis.view_limits_checked(data)
  assert_eq((explicit.lower(), explicit.upper()), (1.8, 1.2))
}

///|
test "named axis checked ticks preserve delayed errors from major and minor handles" {
  let axis = @axis.axis()
  let major = @ticker.LinearLocator::new(numticks=-1)
  axis.set_locator(major.as_locator())
  let view = @core.limits(0.0, 2.0)
  assert_true(
    try {
      ignore(axis.tick_values_checked(view))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  major.set_params(numticks=3)
  let minor = @ticker.FixedLocator::new([0.5, 1.5])
  minor.set_params(nbins=0.0)
  axis.set_minor_locator(minor.as_minor_locator())
  assert_true(
    try {
      ignore(axis.minor_tick_values_checked(view))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  minor.set_params(nbins=-1.0)
  assert_eq(axis.minor_tick_values_checked(view), [0.5, 1.5])
}

///|
test "named numeric adapters retain legacy helper count and fixed clipping contracts" {
  assert_eq(@ticker.linear_locator().tick_values(0.0, 6.0), [
    0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0,
  ])
  assert_eq(@ticker.linear_locator(count=1).tick_values(2.0, 2.0), [2.0])
  assert_eq(
    @ticker.LinearLocator::new(numticks=1)
    .as_locator()
    .checked_tick_values(2.0, 2.0),
    [1.9],
  )
  let legacy = @ticker.fixed_locator([-1.0, 0.0, 1.0, 2.0, 3.0])
  assert_eq(legacy.tick_values(0.0, 2.0), [0.0, 1.0, 2.0])
  assert_eq(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0, 3.0])
    .as_locator()
    .checked_tick_values(0.0, 2.0),
    [-1.0, 0.0, 1.0, 2.0, 3.0],
  )
}
