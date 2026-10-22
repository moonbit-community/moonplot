///|
test "SymLog checked adapters Scene SVG and contour preserve late source errors" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_numticks(@ticker.LogNumTicks::Text("bad"))
  assert_eq(locator.as_locator().checked_tick_values(-0.5, 0.5), [
    -0.5, 0.0, 0.5,
  ])
  assert_true(
    try {
      ignore(locator.as_minor_locator().checked_tick_values([], -100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  let figure = @scene.figure(width=480, height=240)
  let axes = figure.axes()
  axes.set_x_scale(@scale.symlog_scale(linthresh=2.0))
  axes.set_x_limits(-100.0, 100.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(locator.as_locator())
  let data = [[-100.0, -1.0], [1.0, 100.0]]
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
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
  locator.set_numticks(@ticker.LogNumTicks::Number(15.0))
  let contour = figure.contour(data, locator=locator.as_locator())
  assert_eq(contour.levels(), [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0])
  ignore(figure.to_svg_checked())
}

///|
test "SymLog contour keeps raw subs order and rejects nonincreasing levels" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  assert_eq(locator.tick_values(-100.0, 100.0), [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ])
  let figure = @scene.figure()
  assert_true(
    try {
      ignore(
        figure.contour(
          [[-100.0, -1.0], [1.0, 100.0]],
          locator=locator.as_locator(),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidContour(..) => true
      _ => false
    },
  )
}

///|
test "SymLog full SVG draws only visible transformed minor neighbors" {
  let figure = @scene.figure(width=480, height=240)
  let axes = figure.axes()
  axes.set_x_scale(@scale.symlog_scale(linthresh=2.0))
  axes.set_x_limits(-100.0, 100.0)
  axes.set_y_limits(0.0, 1.0)
  let major = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  let minor = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
  )
  axes.set_x_locator(major.as_locator())
  axes.set_x_minor_locator(minor.as_minor_locator())
  let axis = axes.x_axis()
  axis.set_minor_grid(true, "#17ac39", 0.375)
  assert_eq(axis.minor_tick_values_checked(@core.limits(-100.0, 100.0)), [
    -200.0, -20.0, -2.0, 2.0, 20.0, 200.0,
  ])
  let svg = figure.to_svg_checked()
  assert_eq(svg.split("stroke=\"#17ac39\"").count() - 1, 4)
}
