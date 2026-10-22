///|
test "Asinh checked Scene SVG and contour keep source count errors and recover live" {
  let locator = @ticker.AsinhLocator::new(1.0)
  let original_count = locator.numticks()
  locator.set_numticks(Some(@ticker.LogNumTicks::Number(11.0)))
  let figure = @scene.figure(width=480, height=240)
  let axes = figure.axes()
  axes.set_x_scale(@scale.asinh_scale())
  axes.set_x_limits(-100.0, 100.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(locator.as_locator())
  assert_true(
    try {
      ignore(locator.as_locator().checked_tick_values(-100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  let data = [[-100.0, -1.0], [1.0, 100.0]]
  assert_true(
    try {
      ignore(figure.contour(data, locator=locator.as_locator()))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  locator.set_numticks(original_count)
  assert_eq(figure.contour(data, locator=locator.as_locator()).levels(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  ignore(figure.to_svg_checked())
}

///|
test "Asinh geometry and named locator widths remain independent live state" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_x_scale(@scale.asinh_scale(linear_width=2.0))
  axes.set_x_limits(-100.0, 100.0)
  let locator = @ticker.AsinhLocator::new(1.0)
  axes.set_x_locator(locator.as_locator())
  assert_eq(axes.x_axis().scale().asinh_linear_width(), Some(2.0))
  locator.set_linear_width(0.5)
  assert_eq(axes.x_axis().scale().asinh_linear_width(), Some(2.0))
  axes.set_x_scale(@scale.asinh_scale(linear_width=4.0))
  assert_eq(locator.linear_width(), 0.5)
  assert_eq(axes.x_axis().scale().asinh_linear_width(), Some(4.0))
}

///|
test "Asinh complete SVG clips source raw minor neighbors after transformed overlap" {
  let figure = @scene.figure(width=480, height=240)
  let axes = figure.axes()
  axes.set_x_scale(@scale.asinh_scale())
  axes.set_x_limits(-100.0, 100.0)
  axes.set_y_limits(0.0, 1.0)
  let major = @ticker.AsinhLocator::new(1.0)
  let minor = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  axes.set_x_locator(major.as_locator())
  axes.set_x_minor_locator(minor.as_minor_locator())
  let axis = axes.x_axis()
  axis.set_minor_grid(true, "#17ac39", 0.375)
  assert_eq(axis.minor_tick_values_checked(@core.limits(-100.0, 100.0)), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
  let svg = figure.to_svg_checked()
  assert_eq(svg.split("stroke=\"#17ac39\"").count() - 1, 8)
}
