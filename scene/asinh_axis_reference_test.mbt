// Original AsinhLocator and actual Axis raw/view/overlap/owner source bodies.

///|
fn verify_asinh_axis_source(
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
test "Asinh original Axis raw order transformed overlap 0: linear comparison" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(-100.0, 100.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([100.005]).as_locator())
  let minor = @ticker.AsinhLocator::new(1.0)
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_asinh_axis_source(minor.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_asinh_axis_source(axis.minor_tick_values_checked(view), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_asinh_axis_source(axis.tick_values_checked(view), [100.005])
}

///|
test "Asinh original Axis raw order transformed overlap 1: actual asinh transformed overlap" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.asinh_scale(linear_width=1.0))
  let view = @core.limits(-100.0, 100.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([100.005]).as_locator())
  let minor = @ticker.AsinhLocator::new(1.0)
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_asinh_axis_source(minor.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_asinh_axis_source(axis.minor_tick_values_checked(view), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0,
  ])
  verify_asinh_axis_source(axis.tick_values_checked(view), [100.005])
}

///|
test "Asinh original Axis raw order transformed overlap 2: negative positive default minors" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.asinh_scale(linear_width=1.0))
  let view = @core.limits(-100.0, 100.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(
    @ticker.FixedLocator::new([-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0]).as_locator(),
  )
  let minor = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_asinh_axis_source(minor.call(), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
  verify_asinh_axis_source(axis.minor_tick_values_checked(view), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
  verify_asinh_axis_source(axis.tick_values_checked(view), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh original Axis raw order transformed overlap 3: raw overlap disabled" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.asinh_scale(linear_width=1.0))
  let view = @core.limits(-100.0, 100.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(
    @ticker.FixedLocator::new([-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0]).as_locator(),
  )
  let minor = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(false)
  verify_asinh_axis_source(minor.call(), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
  verify_asinh_axis_source(axis.minor_tick_values_checked(view), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
  verify_asinh_axis_source(axis.tick_values_checked(view), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh original Axis raw order transformed overlap 4: reversed view retains source set ordering" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.asinh_scale(linear_width=1.0))
  let view = @core.limits(100.0, -100.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([100.0, 0.0, -100.0]).as_locator())
  let minor = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_asinh_axis_source(minor.call(), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
  verify_asinh_axis_source(axis.minor_tick_values_checked(view), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
  verify_asinh_axis_source(axis.tick_values_checked(view), [100.0, 0.0, -100.0])
}

///|
test "Asinh original Axis raw order transformed overlap 5: axis width independent of locator width" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.asinh_scale(linear_width=2.0))
  let view = @core.limits(-100.0, 100.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([100.005]).as_locator())
  let minor = @ticker.AsinhLocator::new(1.0)
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_asinh_axis_source(minor.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_asinh_axis_source(axis.minor_tick_values_checked(view), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0,
  ])
  verify_asinh_axis_source(axis.tick_values_checked(view), [100.005])
}

///|
test "Asinh original Axis raw order transformed overlap 6: narrow view and zero" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.asinh_scale(linear_width=1.0))
  let view = @core.limits(-0.5, 0.5)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([0.0]).as_locator())
  let minor = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_asinh_axis_source(minor.call(), [
    -0.5, -0.2, -0.05, -0.02, 0.0, 0.02, 0.05, 0.2, 0.5,
  ])
  verify_asinh_axis_source(axis.minor_tick_values_checked(view), [
    -0.5, -0.2, -0.05, -0.02, 0.02, 0.05, 0.2, 0.5,
  ])
  verify_asinh_axis_source(axis.tick_values_checked(view), [0.0])
}

///|
test "Asinh original Axis raw order transformed overlap 7: positive asymmetric view" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_scale(@scale.asinh_scale(linear_width=1.0))
  let view = @core.limits(1.0, 100.0)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([1.0, 10.0, 100.0]).as_locator())
  let minor = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_asinh_axis_source(minor.call(), [2.0, 5.0, 20.0, 50.0, 200.0, 500.0])
  verify_asinh_axis_source(axis.minor_tick_values_checked(view), [
    2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
  verify_asinh_axis_source(axis.tick_values_checked(view), [1.0, 10.0, 100.0])
}

///|
test "Asinh original Axis inherited pure range policy 0" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.AsinhLocator::new(
      0.0 / 0.0,
      numticks=Some(@ticker.LogNumTicks::Text("bad")),
      base=0.0 / 0.0,
    ).as_locator(),
  )
  let bounds = @core.limits(0.0, 0.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_asinh_axis_source([actual.lower(), actual.upper()], [-0.001, 0.001])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_asinh_axis_source([actual.lower(), actual.upper()], [-0.05, 0.05])
}

///|
test "Asinh original Axis inherited pure range policy 1" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.AsinhLocator::new(
      0.0 / 0.0,
      numticks=Some(@ticker.LogNumTicks::Text("bad")),
      base=0.0 / 0.0,
    ).as_locator(),
  )
  let bounds = @core.limits(1.0, 1.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_asinh_axis_source([actual.lower(), actual.upper()], [0.999, 1.001])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_asinh_axis_source([actual.lower(), actual.upper()], [0.95, 1.05])
}

///|
test "Asinh original Axis inherited pure range policy 2" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.AsinhLocator::new(
      0.0 / 0.0,
      numticks=Some(@ticker.LogNumTicks::Text("bad")),
      base=0.0 / 0.0,
    ).as_locator(),
  )
  let bounds = @core.limits(10.0, -10.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_asinh_axis_source([actual.lower(), actual.upper()], [-10.0, 10.0])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_asinh_axis_source([actual.lower(), actual.upper()], [-10.0, 10.0])
}

///|
test "Asinh original Axis inherited pure range policy 3" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.AsinhLocator::new(
      0.0 / 0.0,
      numticks=Some(@ticker.LogNumTicks::Text("bad")),
      base=0.0 / 0.0,
    ).as_locator(),
  )
  let bounds = @core.limits(0.0 / 0.0, 1.0 / 0.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_asinh_axis_source([actual.lower(), actual.upper()], [-0.001, 0.001])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_asinh_axis_source([actual.lower(), actual.upper()], [-0.05, 0.05])
}

///|
test "Asinh original Axis inherited pure range policy 4" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.AsinhLocator::new(
      0.0 / 0.0,
      numticks=Some(@ticker.LogNumTicks::Text("bad")),
      base=0.0 / 0.0,
    ).as_locator(),
  )
  let bounds = @core.limits(0.0, 0.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_asinh_axis_source([actual.lower(), actual.upper()], [-0.001, 0.001])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_asinh_axis_source([actual.lower(), actual.upper()], [-0.05, 0.05])
}

///|
test "Asinh original Axis inherited pure range policy 5" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.AsinhLocator::new(
      0.0 / 0.0,
      numticks=Some(@ticker.LogNumTicks::Text("bad")),
      base=0.0 / 0.0,
    ).as_locator(),
  )
  let bounds = @core.limits(1.0, 1.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_asinh_axis_source([actual.lower(), actual.upper()], [0.999, 1.001])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_asinh_axis_source([actual.lower(), actual.upper()], [0.95, 1.05])
}

///|
test "Asinh original Axis inherited pure range policy 6" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.AsinhLocator::new(
      0.0 / 0.0,
      numticks=Some(@ticker.LogNumTicks::Text("bad")),
      base=0.0 / 0.0,
    ).as_locator(),
  )
  let bounds = @core.limits(10.0, -10.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_asinh_axis_source([actual.lower(), actual.upper()], [-10.0, 10.0])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_asinh_axis_source([actual.lower(), actual.upper()], [-10.0, 10.0])
}

///|
test "Asinh original Axis inherited pure range policy 7" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.AsinhLocator::new(
      0.0 / 0.0,
      numticks=Some(@ticker.LogNumTicks::Text("bad")),
      base=0.0 / 0.0,
    ).as_locator(),
  )
  let bounds = @core.limits(0.0 / 0.0, 1.0 / 0.0)
  {
    let actual = axis.view_limits_checked(bounds)
    verify_asinh_axis_source([actual.lower(), actual.upper()], [-0.001, 0.001])
  }
  let actual = axis.numeric_nonsingular_bounds_checked(
    bounds.lower(),
    bounds.upper(),
  )
  verify_asinh_axis_source([actual.lower(), actual.upper()], [-0.05, 0.05])
}

///|
test "Asinh original last owner live view and shallow copy x" {
  let first = @axis.axis()
  let second = @axis.axis()
  first.set_limits(-100.0, 100.0)
  second.set_limits(-0.5, 0.5)
  let locator = @ticker.AsinhLocator::new(1.0)
  first.set_locator(locator.as_locator())
  verify_asinh_axis_source(locator.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  let external = locator.copy()
  second.set_locator(locator.as_locator())
  verify_asinh_axis_source(locator.call(), [-0.1, -0.01, 0.0, 0.01, 0.1])
  second.set_limits(-10.0, 10.0)
  verify_asinh_axis_source(locator.call(), [
    -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0,
  ])
  verify_asinh_axis_source(external.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh original last owner live view and shallow copy y" {
  let first = @axis.axis()
  let second = @axis.axis()
  first.set_limits(-100.0, 100.0)
  second.set_limits(-0.5, 0.5)
  let locator = @ticker.AsinhLocator::new(1.0)
  first.set_locator(locator.as_locator())
  verify_asinh_axis_source(locator.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  let external = locator.copy()
  second.set_locator(locator.as_locator())
  verify_asinh_axis_source(locator.call(), [-0.1, -0.01, 0.0, 0.01, 0.1])
  second.set_limits(-10.0, 10.0)
  verify_asinh_axis_source(locator.call(), [
    -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0,
  ])
  verify_asinh_axis_source(external.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh original shared removal and independent detached copies x" {
  let figure = @scene.figure()
  let axes = figure.subplots(1, 2, share_x=true)
  axes[0].set_x_limits(-100.0, 100.0)
  let major = @ticker.AsinhLocator::new(1.0)
  let minor = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  axes[1].set_x_locator(major.as_locator())
  axes[1].set_x_minor_locator(minor.as_minor_locator())
  verify_asinh_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_asinh_axis_source(minor.call(), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
  let external_major = major.copy()
  let external_minor = minor.copy()
  axes[1].remove()
  verify_asinh_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_asinh_axis_source(minor.call(), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
  axes[1].set_x_limits(-0.5, 0.5)
  verify_asinh_axis_source(external_major.call(), [-0.1, -0.01, 0.0, 0.01, 0.1])
  verify_asinh_axis_source(external_minor.call(), [
    -0.5, -0.2, -0.05, -0.02, 0.0, 0.02, 0.05, 0.2, 0.5,
  ])
  verify_asinh_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_asinh_axis_source(minor.call(), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
}

///|
test "Asinh original shared removal and independent detached copies y" {
  let figure = @scene.figure()
  let axes = figure.subplots(1, 2, share_y=true)
  axes[0].set_y_limits(-100.0, 100.0)
  let major = @ticker.AsinhLocator::new(1.0)
  let minor = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  axes[1].set_y_locator(major.as_locator())
  axes[1].set_y_minor_locator(minor.as_minor_locator())
  verify_asinh_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_asinh_axis_source(minor.call(), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
  let external_major = major.copy()
  let external_minor = minor.copy()
  axes[1].remove()
  verify_asinh_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_asinh_axis_source(minor.call(), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
  axes[1].set_y_limits(-0.5, 0.5)
  verify_asinh_axis_source(external_major.call(), [-0.1, -0.01, 0.0, 0.01, 0.1])
  verify_asinh_axis_source(external_minor.call(), [
    -0.5, -0.2, -0.05, -0.02, 0.0, 0.02, 0.05, 0.2, 0.5,
  ])
  verify_asinh_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_asinh_axis_source(minor.call(), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
}

///|
test "Asinh original secondary own function view and raw overlap 0" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_x_scale(@scale.asinh_scale())
  axes.set_x_limits(-100.0, 100.0)
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.AsinhLocator::new(1.0)
  let minor = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  secondary.set_locator(major.as_locator())
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_asinh_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_asinh_axis_source(minor.call(), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
  verify_asinh_axis_source(secondary.tick_values_checked(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_asinh_axis_source(secondary.minor_tick_values_checked(), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
}

///|
test "Asinh original secondary own function view and raw overlap 1" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_y_scale(@scale.asinh_scale())
  axes.set_y_limits(-100.0, 100.0)
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.AsinhLocator::new(1.0)
  let minor = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  secondary.set_locator(major.as_locator())
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_asinh_axis_source(major.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_asinh_axis_source(minor.call(), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
  verify_asinh_axis_source(secondary.tick_values_checked(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  verify_asinh_axis_source(secondary.minor_tick_values_checked(), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
}
