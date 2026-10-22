///|
test "Logit in domain Scene SVG clips raw minor neighbors after actual transform overlap" {
  let figure = @scene.figure(width=480, height=240)
  let axes = figure.axes()
  axes.set_x_scale(@scale.logit_scale())
  axes.set_x_limits(0.03, 0.97)
  axes.set_y_limits(0.0, 1.0)
  let minor = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  axes.set_x_locator(@ticker.FixedLocator::new([0.1, 0.5, 0.9]).as_locator())
  axes.set_x_minor_locator(minor.as_minor_locator())
  axes.x_axis().set_minor_grid(true, "#17ac39", 0.375)
  let raw = minor.call()
  assert_eq(raw[0], 0.02)
  assert_eq(raw[raw.length() - 1], 0.98)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split("stroke=\"#17ac39\"").count() - 1, 20)
}

///|
test "Logit checked Scene and contour propagate live own minpos errors and recover" {
  let figure = @scene.figure(width=480, height=240)
  let axes = figure.axes()
  axes.plot([0.01, 0.99], [0.0, 1.0])
  axes.set_x_scale(@scale.logit_scale())
  axes.set_x_limits(0.01, 0.99)
  axes.set_y_limits(0.0, 1.0)
  let locator = @ticker.LogitLocator::new(
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  axes.set_x_locator(locator.as_locator())
  axes
  .x_axis()
  .bind_minpos(() => {
    raise @core.DataError::InvalidTicks(message="logit own minpos")
  })
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "logit own minpos"
      _ => false
    },
  )
  assert_true(
    try {
      ignore(
        figure.contour([[0.01, 0.1], [0.9, 0.99]], locator=locator.as_locator()),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "logit own minpos"
      _ => false
    },
  )
  axes.x_axis().bind_minpos(() => 0.01)
  assert_eq(
    figure
    .contour([[0.01, 0.1], [0.9, 0.99]], locator=locator.as_locator())
    .levels(),
    [0.01, 0.1, 0.5, 0.9, 0.99],
  )
  ignore(figure.to_svg_checked())
}

///|
test "Logit own minpos is raw local positive metadata and stays independent from the scale" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.plot([-1.0, 0.9, 2.0], [0.0, 1.0, 2.0])
  axes.set_x_scale(@scale.logit_scale())
  let locator = @ticker.LogitLocator::new(
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  axes.set_x_locator(locator.as_locator())
  assert_eq(axes.x_axis().get_minpos(), 0.9)
  assert_eq(locator.nonsingular(-1.0, 2.0), (0.9, 1.0 - 0.9))
  axes.set_x_scale(@scale.linear_scale())
  assert_eq(locator.nonsingular(-1.0, 2.0), (0.9, 1.0 - 0.9))
  axes.plot([0.01], [1.0])
  assert_eq(axes.x_axis().get_minpos(), 0.01)
  assert_eq(locator.nonsingular(-1.0, 2.0), (0.01, 0.99))
}
