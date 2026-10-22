///|
test "multiple axis major and minor bindings retain live locator handles" {
  let major = @ticker.MultipleLocator::new(base=2.0)
  let minor = @ticker.MultipleLocator::new(base=1.0)
  let axis = @axis.axis()
  axis.set_locator(major.as_locator())
  axis.set_minor_locator(minor.as_minor_locator())
  let view = @core.limits(0.0, 4.0)
  assert_eq(axis.tick_values(view), [-2.0, 0.0, 2.0, 4.0, 6.0])
  assert_eq(axis.minor_tick_values(view), [1.0, 3.0])
  major.set_params(base=4.0, offset=1.0)
  assert_eq(axis.tick_values(view), [-3.0, 1.0, 5.0])
  assert_eq(axis.minor_tick_values(view), [0.0, 2.0, 3.0, 4.0])
  axis.minor_locator().unwrap().multiple_locator().unwrap().set_params(base=2.0)
  assert_eq(minor.base(), 2.0)
  assert_eq(axis.minor_tick_values(view), [0.0, 2.0, 4.0])
  axis.set_limits(4.0, 0.0)
  assert_eq(axis.tick_values(view), [5.0, 1.0, -3.0])
  assert_eq(axis.minor_tick_values(view), [4.0, 2.0, 0.0])
}

///|
test "multiple axis explicit locator copies are independent while adapter copies share" {
  let original = @ticker.MultipleLocator::new(base=2.0, offset=1.0)
  let independent = original.copy()
  let axis = @axis.axis()
  let copied_axis = @axis.axis()
  axis.set_locator(original.as_locator().copy())
  copied_axis.set_locator(independent.as_locator())
  axis.locator().unwrap().multiple_locator().unwrap().set_params(base=4.0)
  assert_eq(original.base(), 4.0)
  assert_eq(independent.base(), 2.0)
  let view = @core.limits(0.0, 5.0)
  assert_eq(axis.tick_values(view), [-3.0, 1.0, 5.0, 9.0])
  assert_eq(copied_axis.tick_values(view), [-1.0, 1.0, 3.0, 5.0, 7.0])
  independent.set_params(offset=0.5)
  assert_eq(original.offset(), 1.0)
  assert_eq(copied_axis.tick_values(view), [-1.5, 0.5, 2.5, 4.5, 6.5])
}

///|
test "multiple automatic views read current rc and preserve explicit provisional direction" {
  @config.reset()
  defer @config.reset()
  let locator = @ticker.MultipleLocator::new(base=2.0, offset=1.0)
  let axis = @axis.axis()
  axis.set_locator(locator.as_locator())
  let data = @core.limits(1.1, 4.2)
  let view = axis.view_limits(data)
  assert_eq((view.lower(), view.upper()), (1.1, 4.2))
  @config.set_axes_autolimit_mode("round_numbers")
  let rounded = axis.view_limits(data)
  assert_eq((rounded.lower(), rounded.upper()), (1.0, 5.0))
  axis.set_auto_limits(4.2, 1.1)
  let provisional = axis.view_limits(data)
  assert_eq((provisional.lower(), provisional.upper()), (4.2, 1.1))
  axis.request_autoscale()
  let inverted = axis.view_limits(data)
  assert_eq((inverted.lower(), inverted.upper()), (5.0, 1.0))
  axis.set_limits(3.9, 1.2)
  locator.set_params(base=10.0)
  axis.request_autoscale()
  let explicit = axis.view_limits(data)
  assert_eq((explicit.lower(), explicit.upper()), (3.9, 1.2))
}

///|
test "multiple numeric nonsingular bounds use inherited expansion independent of spacing" {
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.MultipleLocator::new(base=30.0, offset=17.0).as_locator(),
  )
  let zero = axis.numeric_nonsingular_bounds(0.0, 0.0)
  assert_eq((zero.lower(), zero.upper()), (-0.05, 0.05))
  let point = axis.numeric_nonsingular_bounds(100.0, 100.0)
  assert_eq((point.lower(), point.upper()), (95.0, 105.0))
  let reversed = axis.numeric_nonsingular_bounds(4.0, 1.0)
  assert_eq((reversed.lower(), reversed.upper()), (1.0, 4.0))
}
