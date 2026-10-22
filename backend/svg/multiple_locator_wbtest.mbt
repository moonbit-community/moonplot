///|
fn multiple_range_panel(
  x_axis : @axis.Axis,
  y_axis : @axis.Axis,
  artists : Array[@render.Artist],
  x_margin~ : Double = 0.0,
  y_margin~ : Double = 0.0,
  group? : Int32,
) -> @render.Panel {
  @render.panel_with_sharing(
    None,
    artists,
    None,
    [],
    None,
    x_axis,
    y_axis,
    group,
    None,
    false,
    [],
    [],
    x_margin~,
    y_margin~,
  )
}

///|
test "multiple locator nonsingular expansion precedes per-panel margins" {
  @config.reset()
  defer @config.reset()
  let x_axis = @axis.axis()
  let y_axis = @axis.axis()
  x_axis.set_locator(
    @ticker.MultipleLocator::new(base=30.0, offset=17.0).as_locator(),
  )
  y_axis.set_locator(@ticker.MultipleLocator::new(base=3.0).as_locator())
  let panel = multiple_range_panel(
    x_axis,
    y_axis,
    [@render.Artist::Line([@core.point(100.0, 0.0)], @core.style("red"))],
    x_margin=0.1,
    y_margin=0.2,
  )
  let scale = compute_scale(@render.figure(400, 200, 0, [panel], [], None), 0)
  // Upstream inherited nonsingular gives [95,105] and [-.05,.05] before padding.
  assert_eq((scale.xmin, scale.xmax), (94.0, 106.0))
  assert_true(Double::abs(scale.ymin + 0.07) < 1.0e-14)
  assert_true(Double::abs(scale.ymax - 0.07) < 1.0e-14)
}

///|
test "multiple locator round numbers follow margin padding and read rc on every render" {
  @config.reset()
  defer @config.reset()
  let x_axis = @axis.axis()
  let locator = @ticker.MultipleLocator::new()
  x_axis.set_locator(locator.as_locator())
  let panel = multiple_range_panel(
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
  let data = compute_scale(figure, 0)
  assert_true(Double::abs(data.xmin - 0.9) < 1.0e-14)
  assert_true(Double::abs(data.xmax - 2.1) < 1.0e-14)
  @config.set_axes_autolimit_mode("round_numbers")
  let rounded = compute_scale(figure, 0)
  assert_eq((rounded.xmin, rounded.xmax), (0.0, 3.0))
  locator.set_params(base=2.0, offset=0.5)
  let updated = compute_scale(figure, 0)
  assert_eq((updated.xmin, updated.xmax), (0.5, 2.5))
  x_axis.set_auto_limits(1.8, 1.2)
  let provisional = compute_scale(figure, 0)
  assert_eq((provisional.xmin, provisional.xmax), (1.8, 1.2))
  x_axis.request_autoscale()
  let inverted = compute_scale(figure, 0)
  assert_eq((inverted.xmin, inverted.xmax), (2.5, 0.5))
  x_axis.set_limits(1.75, 1.25)
  let explicit = compute_scale(figure, 0)
  assert_eq((explicit.xmin, explicit.xmax), (1.75, 1.25))
}

///|
test "multiple locator round numbers follow image sticky clamping" {
  @config.reset()
  defer @config.reset()
  let x_axis = @axis.axis()
  x_axis.set_locator(@ticker.MultipleLocator::new().as_locator())
  let image = @render.Artist::ColorImage(
    [[@colors.rgba(1.0, 0.0, 0.0)]],
    @render.ImageOrigin::Lower,
    Some((1.1, 1.9, 0.0, 1.0)),
    1.0,
    @render.ImageInterpolation::Nearest,
  )
  let panel = multiple_range_panel(x_axis, @axis.axis(), [image], x_margin=0.25)
  let figure = @render.figure(400, 200, 0, [panel], [], None)
  let data = compute_scale(figure, 0)
  assert_eq((data.xmin, data.xmax), (1.1, 1.9))
  @config.set_axes_autolimit_mode("round_numbers")
  let rounded = compute_scale(figure, 0)
  // Applying round_numbers before sticky clamping or ignoring stickies gives different bounds.
  assert_eq((rounded.xmin, rounded.xmax), (1.0, 2.0))
}

///|
test "shared multiple autoscaling unions data before rounding and shared explicit view wins" {
  @config.reset()
  defer @config.reset()
  @config.set_axes_autolimit_mode("round_numbers")
  let locator = @ticker.MultipleLocator::new(base=2.0, offset=1.0)
  let x0 = @axis.axis()
  let x1 = @axis.axis()
  x0.set_locator(locator.as_locator())
  x1.set_locator(locator.as_locator())
  let panels = [
    multiple_range_panel(
      x0,
      @axis.axis(),
      [
        @render.Artist::Line(
          [@core.point(1.2, 0.0), @core.point(2.0, 1.0)],
          @core.style("red"),
        ),
      ],
      group=0,
    ),
    multiple_range_panel(
      x1,
      @axis.axis(),
      [
        @render.Artist::Line(
          [@core.point(6.0, 2.0), @core.point(8.2, 3.0)],
          @core.style("blue"),
        ),
      ],
      group=0,
    ),
  ]
  let figure = @render.figure(400, 240, 0, panels, [], None)
  for scale in compute_scales(figure) {
    assert_eq((scale.xmin, scale.xmax), (1.0, 9.0))
  }
  x0.set_limits(8.0, 2.0)
  for scale in compute_scales(figure) {
    assert_eq((scale.xmin, scale.xmax), (8.0, 2.0))
  }
}

///|
test "multiple tick visibility follows transformed view and source boundary tolerance" {
  let linear = @ticker_scale.linear_scale()
  assert_true(tick_in_view(1.0 + 1.0e-11, linear, 0.0, 1.0))
  assert_true(tick_in_view(1.0 + 1.0e-11, linear, 1.0, 0.0))
  assert_true(!tick_in_view(1.0 + 1.0e-9, linear, 0.0, 1.0))
  assert_true(!tick_in_view(-1.0, linear, 0.0, 1.0))
  assert_true(!tick_in_view(0.0 / 0.0, linear, 0.0, 1.0))
  assert_true(!tick_in_view(1.0 / 0.0, linear, 0.0, 1.0))
  let logarithmic = @ticker_scale.log_scale()
  let near = @math.pow(10.0, 2.0 + 1.0e-10)
  let outside = @math.pow(10.0, 2.0 + 1.0e-8)
  assert_true(tick_in_view(near, logarithmic, 1.0, 100.0))
  assert_true(tick_in_view(near, logarithmic, 100.0, 1.0))
  assert_true(!tick_in_view(outside, logarithmic, 1.0, 100.0))
  assert_true(!tick_in_view(0.0, logarithmic, 1.0, 100.0))
}
