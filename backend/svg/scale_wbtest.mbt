///|
fn close_enough(first : Double, second : Double) -> Bool {
  Double::abs(first - second) < 1.0e-12
}

///|
test "date nonsingular bounds precede margins and explicit singleton ticks use expanded view" {
  let x = @axis.axis()
  x.set_date()
  let panel = @render.panel_with_sharing(
    None,
    [@render.Artist::Line([@core.point(10000.0, 1.0)], @core.style("red"))],
    None,
    [],
    None,
    x,
    @axis.axis(),
    None,
    None,
    false,
    [],
    [],
    x_margin=0.1,
  )
  let figure = @render.figure(400, 200, 0, [panel], [], None)
  let scale = compute_scale(figure, 0)
  assert_eq((scale.xmin, scale.xmax), (9124.0, 10876.0))
  x.set_limits(10000.0, 10000.0)
  let explicit = compute_scale(figure, 0)
  assert_eq((explicit.xmin, explicit.xmax), (9270.0, 10730.0))
  let values = x.tick_values(@core.limits(explicit.xmin, explicit.xmax))
  assert_true(values.length() >= 5)
  assert_true(values[0] < 10000.0 && values[values.length() - 1] > 10000.0)
}

///|
test "artist data bounds do not clamp finite values to the old sentinel" {
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(1.0e35, -2.0e35), @core.point(2.0e35, -1.0e35)],
        @core.style("red"),
      ),
    ],
    None,
    [],
    None,
    @axis.axis(),
    @axis.axis(),
    None,
    None,
    false,
    [],
    [],
    x_margin=0.0,
    y_margin=0.0,
  )
  let scale = compute_scale(@render.figure(400, 200, 0, [panel], [], None), 0)
  assert_eq(scale.xmin, 1.0e35)
  assert_eq(scale.xmax, 2.0e35)
  assert_eq(scale.ymin, -2.0e35)
  assert_eq(scale.ymax, -1.0e35)
}

///|
test "shared x autoscaling unions artists while keeping y local" {
  let x0 = @axis.axis()
  let y0 = @axis.axis()
  let x1 = @axis.axis()
  let y1 = @axis.axis()
  let first = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(0.0, 0.0), @core.point(1.0, 1.0)],
        @core.style("#123456"),
      ),
    ],
    None,
    [],
    None,
    x0,
    y0,
    Some(0),
    None,
    false,
    [],
    [],
  )
  let second = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(10.0, 2.0), @core.point(20.0, 3.0)],
        @core.style("#654321"),
      ),
    ],
    None,
    [],
    None,
    x1,
    y1,
    Some(0),
    None,
    false,
    [],
    [],
  )
  let figure = @render.figure(320, 220, 40, [first, second], [], None)
  let scales = compute_scales(figure)
  assert_eq(scales.length(), 2)
  assert_true(close_enough(scales[0].xmin, -1.0))
  assert_true(close_enough(scales[0].xmax, 21.0))
  assert_true(close_enough(scales[1].xmin, -1.0))
  assert_true(close_enough(scales[1].xmax, 21.0))
  assert_true(close_enough(scales[0].ymin, -0.05))
  assert_true(close_enough(scales[0].ymax, 1.05))
  assert_true(close_enough(scales[1].ymin, 1.95))
  assert_true(close_enough(scales[1].ymax, 3.05))
}

///|
test "autoscale margins are applied per panel before mapping" {
  let x_axis = @axis.axis()
  let y_axis = @axis.axis()
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(0.0, 0.0), @core.point(1.0, 1.0)],
        @core.style("#123456"),
      ),
    ],
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
    x_margin=0.0,
    y_margin=0.2,
  )
  let figure = @render.figure(320, 220, 40, [panel], [], None)
  let scale = compute_scales(figure)[0]
  assert_true(close_enough(scale.xmin, 0.0))
  assert_true(close_enough(scale.xmax, 1.0))
  assert_true(close_enough(scale.ymin, -0.2))
  assert_true(close_enough(scale.ymax, 1.2))
}
