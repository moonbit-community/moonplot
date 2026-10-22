// Original SymmetricalLogLocator / Axis binding, raw overlap and view references.

///|
fn verify_symlog_axis_source(
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
test "SymLog original Axis raw order and overlap 0: linear raw neighbors" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(-100.0, 100.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(
    @ticker.FixedLocator::new([-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0]).as_locator(),
  )
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_symlog_axis_source(minor.call(), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
  verify_symlog_axis_source(axis.minor_tick_values_checked(view), [
    -200.0, -20.0, -2.0, 2.0, 20.0, 200.0,
  ])
  verify_symlog_axis_source(axis.tick_values_checked(view), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original Axis raw order and overlap 1: symlog transformed overlap" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let view = @core.limits(-100.0, 100.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(
    @ticker.FixedLocator::new([-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0]).as_locator(),
  )
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_symlog_axis_source(minor.call(), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
  verify_symlog_axis_source(axis.minor_tick_values_checked(view), [
    -200.0, -20.0, -2.0, 2.0, 20.0, 200.0,
  ])
  verify_symlog_axis_source(axis.tick_values_checked(view), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original Axis raw order and overlap 2: reversed view" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let view = @core.limits(100.0, -100.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(
    @ticker.FixedLocator::new([100.0, 10.0, 1.0, 0.0, -1.0, -10.0, -100.0]).as_locator(),
  )
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_symlog_axis_source(minor.call(), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
  verify_symlog_axis_source(axis.minor_tick_values_checked(view), [
    -200.0, -20.0, -2.0, 2.0, 20.0, 200.0,
  ])
  verify_symlog_axis_source(axis.tick_values_checked(view), [
    100.0, 10.0, 1.0, 0.0, -1.0, -10.0, -100.0,
  ])
}

///|
test "SymLog original Axis raw order and overlap 3: overlap disabled" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let view = @core.limits(-100.0, 100.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(
    @ticker.FixedLocator::new([-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0]).as_locator(),
  )
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(false)
  verify_symlog_axis_source(minor.call(), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
  verify_symlog_axis_source(axis.minor_tick_values_checked(view), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
  verify_symlog_axis_source(axis.tick_values_checked(view), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original Axis raw order and overlap 4: strict simple range returns bounds and zero" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let view = @core.limits(-0.8, 0.8)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([0.0]).as_locator())
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_symlog_axis_source(minor.call(), [-0.8, 0.0, 0.8])
  verify_symlog_axis_source(axis.minor_tick_values_checked(view), [-0.8, 0.8])
  verify_symlog_axis_source(axis.tick_values_checked(view), [0.0])
}

///|
test "SymLog original Axis raw order and overlap 5: negative and zero subs retain raw order" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let view = @core.limits(-100.0, 100.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([-10.0, 0.0, 10.0]).as_locator())
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(
        @ticker.TickValues::from_array([0.0, 1.0, -1.0, 2.0]),
      ),
    ),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_symlog_axis_source(minor.call(), [
    -0.0, -100.0, 100.0, -200.0, -0.0, -10.0, 10.0, -20.0, -0.0, -1.0, 1.0, -2.0,
    0.0, 0.0, 1.0, -1.0, 2.0, 0.0, 10.0, -10.0, 20.0, 0.0, 100.0, -100.0, 200.0,
  ])
  verify_symlog_axis_source(axis.minor_tick_values_checked(view), [
    -100.0, 100.0, -200.0, -20.0, -1.0, 1.0, -2.0, 1.0, -1.0, 2.0, 20.0, 100.0, -100.0,
    200.0,
  ])
  verify_symlog_axis_source(axis.tick_values_checked(view), [-10.0, 0.0, 10.0])
}

///|
test "SymLog original Axis raw order and overlap 6: mixed major duplicates retain input order" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let view = @core.limits(-20.0, 20.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(
    @ticker.FixedLocator::new([10.0, -10.0, 0.0, 10.0]).as_locator(),
  )
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_symlog_axis_source(minor.call(), [
    -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0,
  ])
  verify_symlog_axis_source(axis.minor_tick_values_checked(view), [
    -20.0, -1.0, -2.0, 1.0, 2.0, 20.0,
  ])
  verify_symlog_axis_source(axis.tick_values_checked(view), [
    10.0, -10.0, 0.0, 10.0,
  ])
}

///|
test "SymLog original Axis raw order and overlap 7: positive-only branch retains outer raw decade" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let view = @core.limits(2.1, 40.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([10.0, 100.0]).as_locator())
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(
        @ticker.TickValues::from_array([1.0, 2.0, 5.0]),
      ),
    ),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_symlog_axis_source(minor.call(), [1.0, 2.0, 5.0, 10.0, 20.0, 50.0])
  verify_symlog_axis_source(axis.minor_tick_values_checked(view), [
    1.0, 2.0, 5.0, 20.0, 50.0,
  ])
  verify_symlog_axis_source(axis.tick_values_checked(view), [10.0, 100.0])
}

///|
test "SymLog original Axis raw order and overlap 8: nearby major removed in transformed span" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let view = @core.limits(-100.0, 100.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(
    @ticker.FixedLocator::new([0.0, 1.000001, 10.0]).as_locator(),
  )
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_symlog_axis_source(minor.call(), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
  verify_symlog_axis_source(axis.minor_tick_values_checked(view), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 2.0, 20.0, 100.0, 200.0,
  ])
  verify_symlog_axis_source(axis.tick_values_checked(view), [
    0.0, 1.000001, 10.0,
  ])
}

///|
test "SymLog original Axis raw order and overlap 9: log parent uses original clip transform" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.log_scale())
  let view = @core.limits(1.0, 100.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(
    @ticker.FixedLocator::new([0.0, 1.0, 10.0, 100.0]).as_locator(),
  )
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(
        @ticker.TickValues::from_array([0.0, 1.0, 2.0]),
      ),
    ),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_symlog_axis_source(minor.call(), [
    0.0, 1.0, 2.0, 0.0, 10.0, 20.0, 0.0, 100.0, 200.0,
  ])
  verify_symlog_axis_source(axis.minor_tick_values_checked(view), [
    2.0, 20.0, 200.0,
  ])
  verify_symlog_axis_source(axis.tick_values_checked(view), [
    0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original Axis raw order and overlap 10: infinite span and positive infinite reference major" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(-1.0 / 0.0, 1.0 / 0.0)
  axis.bind_view_interval(() => (view.lower(), view.upper()))
  axis.set_locator(@ticker.FixedLocator::new([1.0 / 0.0]).as_locator())
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0 / 0.0,
    subs=Some(@ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0]))),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_symlog_axis_source(minor.call(), [-1.0 / 0.0, 0.0, 1.0 / 0.0])
  verify_symlog_axis_source(axis.minor_tick_values_checked(view), [
    -1.0 / 0.0,
    0.0,
  ])
  verify_symlog_axis_source(axis.tick_values_checked(view), [1.0 / 0.0])
}

///|
test "SymLog original Axis raw order and overlap 11: infinite span and negative infinite reference major" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(-1.0 / 0.0, 1.0 / 0.0)
  axis.bind_view_interval(() => (view.lower(), view.upper()))
  axis.set_locator(@ticker.FixedLocator::new([-1.0 / 0.0]).as_locator())
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0 / 0.0,
    subs=Some(@ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0]))),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_symlog_axis_source(minor.call(), [-1.0 / 0.0, 0.0, 1.0 / 0.0])
  verify_symlog_axis_source(axis.minor_tick_values_checked(view), [
    0.0,
    1.0 / 0.0,
  ])
  verify_symlog_axis_source(axis.tick_values_checked(view), [-1.0 / 0.0])
}

///|
test "SymLog original Axis raw order and overlap 12: infinite span and NaN reference major" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(-1.0 / 0.0, 1.0 / 0.0)
  axis.bind_view_interval(() => (view.lower(), view.upper()))
  axis.set_locator(@ticker.FixedLocator::new([0.0 / 0.0]).as_locator())
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0 / 0.0,
    subs=Some(@ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0]))),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_symlog_axis_source(minor.call(), [-1.0 / 0.0, 0.0, 1.0 / 0.0])
  verify_symlog_axis_source(axis.minor_tick_values_checked(view), [
    -1.0 / 0.0,
    0.0,
    1.0 / 0.0,
  ])
  verify_symlog_axis_source(axis.tick_values_checked(view), [0.0 / 0.0])
}

///|
test "SymLog original Axis raw order and overlap 13: infinite span and finite reference major" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(-1.0 / 0.0, 1.0 / 0.0)
  axis.bind_view_interval(() => (view.lower(), view.upper()))
  axis.set_locator(@ticker.FixedLocator::new([1.0]).as_locator())
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0 / 0.0,
    subs=Some(@ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0]))),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_symlog_axis_source(minor.call(), [-1.0 / 0.0, 0.0, 1.0 / 0.0])
  verify_symlog_axis_source(axis.minor_tick_values_checked(view), [])
  verify_symlog_axis_source(axis.tick_values_checked(view), [1.0])
}

///|
test "SymLog original Axis view and inherited nonsingular 0" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0).as_locator(),
  )
  let bounds = @core.limits(-12.0, 15.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_symlog_axis_source([actual.lower(), actual.upper()], [-12.0, 15.0])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_symlog_axis_source([actual.lower(), actual.upper()], [-12.0, 15.0])
}

///|
test "SymLog original Axis view and inherited nonsingular 1" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0).as_locator(),
  )
  let bounds = @core.limits(15.0, -12.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_symlog_axis_source([actual.lower(), actual.upper()], [-12.0, 15.0])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_symlog_axis_source([actual.lower(), actual.upper()], [-12.0, 15.0])
}

///|
test "SymLog original Axis view and inherited nonsingular 2" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0).as_locator(),
  )
  let bounds = @core.limits(0.2, 0.8)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_symlog_axis_source([actual.lower(), actual.upper()], [0.2, 0.8])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_symlog_axis_source([actual.lower(), actual.upper()], [0.2, 0.8])
}

///|
test "SymLog original Axis view and inherited nonsingular 3" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0).as_locator(),
  )
  let bounds = @core.limits(0.0, 0.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_symlog_axis_source([actual.lower(), actual.upper()], [-0.001, 0.001])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_symlog_axis_source([actual.lower(), actual.upper()], [-0.05, 0.05])
}

///|
test "SymLog original Axis view and inherited nonsingular 4" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0).as_locator(),
  )
  let bounds = @core.limits(1.0, 1.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_symlog_axis_source([actual.lower(), actual.upper()], [0.999, 1.001])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_symlog_axis_source([actual.lower(), actual.upper()], [0.95, 1.05])
}

///|
test "SymLog original Axis view and inherited nonsingular 5" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0).as_locator(),
  )
  let bounds = @core.limits(0.0 / 0.0, 1.0 / 0.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_symlog_axis_source([actual.lower(), actual.upper()], [-0.001, 0.001])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_symlog_axis_source([actual.lower(), actual.upper()], [-0.05, 0.05])
}

///|
test "SymLog original Axis view and inherited nonsingular 6" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0).as_locator(),
  )
  let bounds = @core.limits(-12.0, 15.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_symlog_axis_source([actual.lower(), actual.upper()], [-100.0, 100.0])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_symlog_axis_source([actual.lower(), actual.upper()], [-12.0, 15.0])
}

///|
test "SymLog original Axis view and inherited nonsingular 7" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0).as_locator(),
  )
  let bounds = @core.limits(15.0, -12.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_symlog_axis_source([actual.lower(), actual.upper()], [-100.0, 100.0])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_symlog_axis_source([actual.lower(), actual.upper()], [-12.0, 15.0])
}

///|
test "SymLog original Axis view and inherited nonsingular 8" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0).as_locator(),
  )
  let bounds = @core.limits(0.2, 0.8)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_symlog_axis_source([actual.lower(), actual.upper()], [0.1, 1.0])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_symlog_axis_source([actual.lower(), actual.upper()], [0.2, 0.8])
}

///|
test "SymLog original Axis view and inherited nonsingular 9" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0).as_locator(),
  )
  let bounds = @core.limits(0.0, 0.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_symlog_axis_source([actual.lower(), actual.upper()], [-0.001, 0.001])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_symlog_axis_source([actual.lower(), actual.upper()], [-0.05, 0.05])
}

///|
test "SymLog original Axis view and inherited nonsingular 10" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0).as_locator(),
  )
  let bounds = @core.limits(1.0, 1.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_symlog_axis_source([actual.lower(), actual.upper()], [0.1, 10.0])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_symlog_axis_source([actual.lower(), actual.upper()], [0.95, 1.05])
}

///|
test "SymLog original Axis view and inherited nonsingular 11" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0).as_locator(),
  )
  let bounds = @core.limits(0.0 / 0.0, 1.0 / 0.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_symlog_axis_source([actual.lower(), actual.upper()], [-0.001, 0.001])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_symlog_axis_source([actual.lower(), actual.upper()], [-0.05, 0.05])
}

///|
test "SymLog original last owner live view and independent copy x" {
  let first = @axis.axis()
  let second = @axis.axis()
  first.set_limits(-100.0, 100.0)
  second.set_limits(-0.5, 0.5)
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  first.set_locator(locator.as_locator())
  verify_symlog_axis_source(locator.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  let external = locator.copy()
  second.set_locator(locator.as_locator())
  verify_symlog_axis_source(locator.call(), [-0.5, 0.0, 0.5])
  second.set_limits(-10.0, 10.0)
  verify_symlog_axis_source(locator.call(), [-10.0, -1.0, 0.0, 1.0, 10.0])
  verify_symlog_axis_source(external.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original last owner live view and independent copy y" {
  let first = @axis.axis()
  let second = @axis.axis()
  first.set_limits(-100.0, 100.0)
  second.set_limits(-0.5, 0.5)
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  first.set_locator(locator.as_locator())
  verify_symlog_axis_source(locator.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  let external = locator.copy()
  second.set_locator(locator.as_locator())
  verify_symlog_axis_source(locator.call(), [-0.5, 0.0, 0.5])
  second.set_limits(-10.0, 10.0)
  verify_symlog_axis_source(locator.call(), [-10.0, -1.0, 0.0, 1.0, 10.0])
  verify_symlog_axis_source(external.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original shared major minor deletion and detached copies x" {
  let figure = @scene.figure()
  let axes = figure.subplots(1, 2, share_x=true)
  axes[0].set_x_limits(-100.0, 100.0)
  let major = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  axes[1].set_x_locator(major.as_locator())
  axes[1].set_x_minor_locator(minor.as_minor_locator())
  verify_symlog_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_symlog_axis_source(minor.call(), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
  let external_major = major.copy()
  let external_minor = minor.copy()
  axes[1].remove()
  verify_symlog_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_symlog_axis_source(minor.call(), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
  axes[1].set_x_limits(-0.5, 0.5)
  verify_symlog_axis_source(external_major.call(), [-0.5, 0.0, 0.5])
  verify_symlog_axis_source(external_minor.call(), [-0.5, 0.0, 0.5])
  verify_symlog_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_symlog_axis_source(minor.call(), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
}

///|
test "SymLog original shared major minor deletion and detached copies y" {
  let figure = @scene.figure()
  let axes = figure.subplots(1, 2, share_y=true)
  axes[0].set_y_limits(-100.0, 100.0)
  let major = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  axes[1].set_y_locator(major.as_locator())
  axes[1].set_y_minor_locator(minor.as_minor_locator())
  verify_symlog_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_symlog_axis_source(minor.call(), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
  let external_major = major.copy()
  let external_minor = minor.copy()
  axes[1].remove()
  verify_symlog_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_symlog_axis_source(minor.call(), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
  axes[1].set_y_limits(-0.5, 0.5)
  verify_symlog_axis_source(external_major.call(), [-0.5, 0.0, 0.5])
  verify_symlog_axis_source(external_minor.call(), [-0.5, 0.0, 0.5])
  verify_symlog_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_symlog_axis_source(minor.call(), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
}

///|
test "SymLog original secondary own view function and raw overlap 0" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_x_scale(@scale.symlog_scale(linthresh=2.0))
  axes.set_x_limits(-100.0, 100.0)
  let secondary = axes.secondary_xaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  secondary.set_locator(major.as_locator())
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_symlog_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_symlog_axis_source(minor.call(), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
  verify_symlog_axis_source(secondary.tick_values_checked(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_symlog_axis_source(secondary.minor_tick_values_checked(), [
    -200.0, -20.0, -2.0, 2.0, 20.0, 200.0,
  ])
}

///|
test "SymLog original secondary own view function and raw overlap 1" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_x_scale(@scale.log_scale())
  axes.set_x_limits(1.0, 100.0)
  let secondary = axes.secondary_xaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  secondary.set_locator(major.as_locator())
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_symlog_axis_source(major.call(), [1.0, 10.0, 100.0])
  verify_symlog_axis_source(minor.call(), [1.0, 2.0, 10.0, 20.0, 100.0, 200.0])
  verify_symlog_axis_source(secondary.tick_values_checked(), [1.0, 10.0, 100.0])
  verify_symlog_axis_source(secondary.minor_tick_values_checked(), [20.0, 200.0])
}

///|
test "SymLog original secondary own view function and raw overlap 2" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_y_scale(@scale.symlog_scale(linthresh=2.0))
  axes.set_y_limits(-100.0, 100.0)
  let secondary = axes.secondary_yaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  secondary.set_locator(major.as_locator())
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_symlog_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_symlog_axis_source(minor.call(), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
  verify_symlog_axis_source(secondary.tick_values_checked(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_symlog_axis_source(secondary.minor_tick_values_checked(), [
    -200.0, -20.0, -2.0, 2.0, 20.0, 200.0,
  ])
}

///|
test "SymLog original secondary own view function and raw overlap 3" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_y_scale(@scale.log_scale())
  axes.set_y_limits(1.0, 100.0)
  let secondary = axes.secondary_yaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  secondary.set_locator(major.as_locator())
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_symlog_axis_source(major.call(), [1.0, 10.0, 100.0])
  verify_symlog_axis_source(minor.call(), [1.0, 2.0, 10.0, 20.0, 100.0, 200.0])
  verify_symlog_axis_source(secondary.tick_values_checked(), [1.0, 10.0, 100.0])
  verify_symlog_axis_source(secondary.minor_tick_values_checked(), [20.0, 200.0])
}
