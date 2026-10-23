///|
fn named_numeric_range_panel(
  x_axis : @axis.Axis,
  y_axis : @axis.Axis,
  artists : Array[@render.Artist],
  x_margin~ : Double = 0.0,
  y_margin~ : Double = 0.0,
) -> @render.Panel {
  @render.panel_with_sharing(
    None,
    artists,
    None,
    [],
    None,
    x_axis,
    y_axis,
    None,
    None,
    false,
    [],
    [],
    x_margin~,
    y_margin~,
  )
}

///|
test "named Linear and Fixed nonsingular expansion precedes per-panel margins" {
  let previous = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous))
  @config.set_axes_autolimit_mode("data")
  let x_axis = @axis.axis()
  let y_axis = @axis.axis()
  x_axis.set_locator(@ticker.LinearLocator::new(numticks=3).as_locator())
  y_axis.set_locator(@ticker.FixedLocator::new([0.0]).as_locator())
  let panel = named_numeric_range_panel(
    x_axis,
    y_axis,
    [@render.Artist::Line([@core.point(100.0, 0.0)], @core.style("red"))],
    x_margin=0.1,
    y_margin=0.2,
  )
  let scale = compute_scale(@render.figure(400, 200, 0, [panel], [], None), 0)
  assert_eq((scale.xmin, scale.xmax), (94.0, 106.0))
  assert_true(Double::abs(scale.ymin + 0.07) < 1.0e-14)
  assert_true(Double::abs(scale.ymax - 0.07) < 1.0e-14)
}

///|
test "named Linear round numbers reads live count after margin padding" {
  let previous = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous))
  let x_axis = @axis.axis()
  let locator = @ticker.LinearLocator::new(numticks=5)
  x_axis.set_locator(locator.as_locator())
  let panel = named_numeric_range_panel(
    x_axis,
    @axis.axis(),
    [
      @render.Artist::Line(
        [@core.point(1.1, 0.0), @core.point(1.9, 1.0)],
        @core.style("red"),
      ),
    ],
    x_margin=0.25,
  )
  let figure = @render.figure(400, 200, 0, [panel], [], None)
  @config.set_axes_autolimit_mode("data")
  let ordinary = compute_scale(figure, 0)
  assert_true(Double::abs(ordinary.xmin - 0.9) < 1.0e-14)
  assert_true(Double::abs(ordinary.xmax - 2.1) < 1.0e-14)
  @config.set_axes_autolimit_mode("round_numbers")
  x_axis.request_autoscale()
  let rounded = compute_scale(figure, 0)
  assert_eq((rounded.xmin, rounded.xmax), (0.75, 2.25))
  locator.set_params(numticks=3)
  x_axis.request_autoscale()
  let changed = compute_scale(figure, 0)
  assert_eq((changed.xmin, changed.xmax), (0.5, 2.5))
  x_axis.set_limits(1.75, 1.25)
  locator.set_params(numticks=2)
  let explicit = compute_scale(figure, 0)
  assert_eq((explicit.xmin, explicit.xmax), (1.75, 1.25))
}
