///|
test "Log checked Scene calls propagate shared minpos errors and explicit views skip autoscale" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let figure = @scene.figure(width=240, height=120)
  let axes = figure.axes()
  axes.plot([-2.0, 0.001, 100.0], [1.0, 1.0, 1.0])
  axes.set_x_scale(@scale.log_scale())
  axes.set_y_limits(0.0, 2.0)
  let locator = @ticker.LogLocator::new()
  axes.set_x_locator(locator.as_locator())
  axes
  .x_axis()
  .bind_shared_minpos(() => {
    raise @core.DataError::InvalidTicks(message="shared minpos callback")
  })
  // Scale installation already resolved its forced view. An explicit request
  // is required before the new provider is consulted by autoscale again.
  axes.request_autoscale_view(axis="x")
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "shared minpos callback"
      _ => false
    },
  )
  // The failing lazy request was consumed before its checked work.
  axes.request_autoscale_view(axis="x")
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "shared minpos callback"
      _ => false
    },
  )
  axes.set_x_limits(1.0, 100.0)
  ignore(figure.to_svg_checked())
  axes
  .x_axis()
  .bind_minpos(() => {
    raise @core.DataError::InvalidTicks(message="own minpos callback")
  })
  assert_true(
    try {
      ignore(locator.tick_values(-2.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "own minpos callback"
      _ => false
    },
  )
  ignore(figure.to_svg_checked())
}

///|
test "Log local minpos uses positive interior data even when the other display scale rejects it" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.plot([-2.0, 0.001, 100.0], [-10.0, -1.0, 1.0])
  axes.set_y_scale(@scale.log_scale())
  assert_eq(axes.x_axis().get_minpos(), 0.001)
  assert_eq(axes.y_axis().get_minpos(), 1.0)
  axes.set_x_limits(1.0, 10.0)
  assert_eq(axes.x_axis().get_minpos(), 0.001)
  axes.plot([0.00001], [-2.0])
  assert_eq(axes.x_axis().get_minpos(), 0.00001)
}

///|
test "Log raw minor neighbors survive the Axis getter and are clipped during SVG drawing" {
  let figure = @scene.figure(width=480, height=240)
  let axes = figure.axes()
  axes.set_x_scale(@scale.log_scale())
  axes.set_x_limits(2.1, 40.0)
  axes.set_y_limits(0.0, 1.0)
  let major = @ticker.LogLocator::new()
  let minor = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
    ),
  )
  axes.set_x_locator(major.as_locator())
  axes.set_x_minor_locator(minor.as_minor_locator())
  axes.x_axis().set_minor_grid(true, "#17ac39", 0.375)
  assert_eq(minor.call(), [1.0, 2.0, 5.0, 10.0, 20.0, 50.0])
  assert_eq(axes.x_axis().minor_tick_values_checked(@core.limits(2.1, 40.0)), [
    2.0, 5.0, 20.0, 50.0,
  ])
  let svg = figure.to_svg_checked()
  assert_eq(svg.split("stroke=\"#17ac39\"").count() - 1, 2)
  axes.x_axis().set_minor_overlap_removal(false)
  let unfiltered = figure.to_svg_checked()
  assert_eq(unfiltered.split("stroke=\"#17ac39\"").count() - 1, 3)
}

///|
test "Log contour levels use bound local minpos and propagate unbound source errors" {
  let figure = @scene.figure()
  let data = [[-1.0, 1.0], [10.0, 100.0]]
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Number(9.0)),
  )
  assert_true(
    try {
      ignore(figure.contour(data, locator=locator.as_locator()))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  let axes = figure.axes()
  axes.plot([0.01, 100.0], [1.0, 1.0])
  axes.set_x_locator(locator.as_locator())
  let first = figure.contour(data, locator=locator.as_locator())
  assert_eq(first.levels(), [0.001, 0.01, 0.1, 1.0, 10.0, 100.0, 1000.0])
  locator.set_params(base=Some(2.0))
  let updated = figure.contourf(data, locator=locator.as_locator())
  assert_true(updated.levels() != first.levels())
  assert_eq(first.levels(), [0.001, 0.01, 0.1, 1.0, 10.0, 100.0, 1000.0])
}

///|
test "Log actual axis physical budgets retain integer transport for huge exponent source errors" {
  for horizontal in [true, false] {
    let axis = @axis.axis()
    axis.set_tick_layout(if horizontal { 120.0 } else { 80.0 }, horizontal)
    let locator = @ticker.LogLocator::new(base=0.9999999999999999)
    axis.set_locator(locator.as_locator())
    assert_true(
      locator.tick_space_provider().unwrap()()
      is @ticker.LogTickSpace::Integer(_),
    )
    assert_true(
      try {
        ignore(locator.tick_values(5.0e-324, 1.7976931348623157e308))
        false
      } catch {
        @core.DataError::InvalidTicks(..) => true
        _ => false
      },
    )
    locator.bind_tick_space(() => @ticker.LogTickSpace::Number(4.0))
    assert_true(
      try {
        ignore(locator.tick_values(5.0e-324, 1.7976931348623157e308))
        false
      } catch {
        @core.DataError::InvalidTicks(..) => true
        _ => false
      },
    )
  }
}

///|
test "Log secondary checked SVG keeps its empty minpos and permits recovery by replacing the locator" {
  let figure = @scene.figure(width=240, height=120)
  let axes = figure.axes()
  axes.plot([0.001, 100.0], [1.0, 1.0])
  axes.set_x_limits(-2.0, 100.0)
  axes.set_y_limits(0.0, 2.0)
  let secondary = axes.secondary_xaxis(value => value, value => value)
  let major = @ticker.LogLocator::new()
  secondary.set_locator(major.as_locator())
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  secondary.set_locator(
    @ticker.FixedLocator::new([1.0, 10.0, 100.0]).as_locator(),
  )
  let minor = @ticker.LogLocator::new(subs=None)
  secondary.set_minor_locator(minor.as_minor_locator())
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  ignore(figure.to_svg_checked())
}
