// Original autoscale/full aspect methods and complete transform-tree geometry.

///|
fn verify_asinh_display_source(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() {
      assert_true(actual[index].is_nan())
    } else if value.is_inf() || value == 0.0 {
      assert_eq(
        actual[index].reinterpret_as_uint64(),
        value.reinterpret_as_uint64(),
      )
    } else {
      assert_true(
        Double::abs(actual[index] - value) <= Double::abs(value) * 1.0e-12,
      )
    }
  }
}

///|
test "Asinh original transformed primary visibility 0" {
  let scale = @ticker_scale.linear_scale()
  let major = [100.005].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(major, [])
  let minor = [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(minor, [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0])
}

///|
test "Asinh original transformed primary visibility 1" {
  let scale = @ticker_scale.asinh_scale(linear_width=1.0)
  let major = [100.005].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(major, [])
  let minor = [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(minor, [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0])
}

///|
test "Asinh original transformed primary visibility 2" {
  let scale = @ticker_scale.asinh_scale(linear_width=1.0)
  let major = [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(major, [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0])
  let minor = [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ].filter(value => tick_in_view(value, scale, -100.0, 100.0))
  assert_eq(minor, [-50.0, -20.0, -5.0, -2.0, 2.0, 5.0, 20.0, 50.0])
}

///|
test "Asinh original transformed primary visibility 3" {
  let scale = @ticker_scale.asinh_scale(linear_width=1.0)
  let major = [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(major, [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0])
  let minor = [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ].filter(value => tick_in_view(value, scale, -100.0, 100.0))
  assert_eq(minor, [-50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0])
}

///|
test "Asinh original transformed primary visibility 4" {
  let scale = @ticker_scale.asinh_scale(linear_width=1.0)
  let major = [100.0, 0.0, -100.0].filter(value => {
    tick_in_view(value, scale, 100.0, -100.0)
  })
  assert_eq(major, [100.0, 0.0, -100.0])
  let minor = [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ].filter(value => tick_in_view(value, scale, 100.0, -100.0))
  assert_eq(minor, [-50.0, -20.0, -5.0, -2.0, 2.0, 5.0, 20.0, 50.0])
}

///|
test "Asinh original transformed primary visibility 5" {
  let scale = @ticker_scale.asinh_scale(linear_width=2.0)
  let major = [100.005].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(major, [])
  let minor = [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(minor, [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0])
}

///|
test "Asinh original transformed primary visibility 6" {
  let scale = @ticker_scale.asinh_scale(linear_width=1.0)
  let major = [0.0].filter(value => tick_in_view(value, scale, -0.5, 0.5))
  assert_eq(major, [0.0])
  let minor = [-0.5, -0.2, -0.05, -0.02, 0.02, 0.05, 0.2, 0.5].filter(value => {
    tick_in_view(value, scale, -0.5, 0.5)
  })
  assert_eq(minor, [-0.5, -0.2, -0.05, -0.02, 0.02, 0.05, 0.2, 0.5])
}

///|
test "Asinh original transformed primary visibility 7" {
  let scale = @ticker_scale.asinh_scale(linear_width=1.0)
  let major = [1.0, 10.0, 100.0].filter(value => {
    tick_in_view(value, scale, 1.0, 100.0)
  })
  assert_eq(major, [1.0, 10.0, 100.0])
  let minor = [2.0, 5.0, 20.0, 50.0, 200.0, 500.0].filter(value => {
    tick_in_view(value, scale, 1.0, 100.0)
  })
  assert_eq(minor, [2.0, 5.0, 20.0, 50.0])
}

///|
test "Asinh original autoscale nonsingular margin view pipeline 0" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.asinh_scale(linear_width=1.0))
  x.set_locator(@ticker.AsinhLocator::new(1.0).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-100.0, 0.0), @core.point(100.0, 1.0)],
        @core.style("red"),
      ),
    ],
    None,
    [],
    None,
    x,
    y,
    None,
    None,
    false,
    [],
    [],
    x_margin=0.05,
    y_margin=0.0,
  )
  let actual = compute_scale(@render.figure(400, 300, 0, [panel], [], None), 0)
  verify_asinh_display_source([actual.xmin, actual.xmax], [
    -169.86784591068982, 169.86784591068982,
  ])
}

///|
test "Asinh original autoscale nonsingular margin view pipeline 1" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.asinh_scale(linear_width=2.0))
  x.set_locator(@ticker.AsinhLocator::new(1.0).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(100.0, 1.0)],
        @core.style("red"),
      ),
    ],
    None,
    [],
    None,
    x,
    y,
    None,
    None,
    false,
    [],
    [],
    x_margin=0.1,
    y_margin=0.0,
  )
  let actual = compute_scale(@render.figure(400, 300, 0, [panel], [], None), 0)
  verify_asinh_display_source([actual.xmin, actual.xmax], [
    -2.3192290860309193, 166.3147737266857,
  ])
}

///|
test "Asinh original autoscale nonsingular margin view pipeline 2" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.asinh_scale(linear_width=1.0))
  x.set_locator(@ticker.AsinhLocator::new(1.0).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(5.0, 0.0), @core.point(5.0, 1.0)],
        @core.style("red"),
      ),
    ],
    None,
    [],
    None,
    x,
    y,
    None,
    None,
    false,
    [],
    [],
    x_margin=0.05,
    y_margin=0.0,
  )
  let actual = compute_scale(@render.figure(400, 300, 0, [panel], [], None), 0)
  verify_asinh_display_source([actual.xmin, actual.xmax], [
    4.726239799114395, 5.2762861368801195,
  ])
}

///|
test "Asinh original autoscale nonsingular margin view pipeline 3" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.asinh_scale(linear_width=1.0e-308))
  x.set_locator(@ticker.AsinhLocator::new(1.0).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(1.0, 1.0)],
        @core.style("red"),
      ),
    ],
    None,
    [],
    None,
    x,
    y,
    None,
    None,
    false,
    [],
    [],
    x_margin=0.0,
    y_margin=0.0,
  )
  let actual = compute_scale(@render.figure(400, 300, 0, [panel], [], None), 0)
  verify_asinh_display_source([actual.xmin, actual.xmax], [
    -0.9999999999999584, 0.9999999999999584,
  ])
}

///|
test "Asinh original autoscale nonsingular margin view pipeline 4" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.asinh_scale(linear_width=0.0 / 0.0))
  x.set_locator(@ticker.AsinhLocator::new(1.0).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(1.0, 0.0), @core.point(2.0, 1.0)],
        @core.style("red"),
      ),
    ],
    None,
    [],
    None,
    x,
    y,
    None,
    None,
    false,
    [],
    [],
    x_margin=0.05,
    y_margin=0.0,
  )
  let actual = compute_scale(@render.figure(400, 300, 0, [panel], [], None), 0)
  verify_asinh_display_source([actual.xmin, actual.xmax], [-0.001, 0.001])
}

///|
test "Asinh original autoscale nonsingular margin view pipeline 5" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.asinh_scale(linear_width=1.0 / 0.0))
  x.set_locator(@ticker.AsinhLocator::new(1.0).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(1.0, 0.0), @core.point(2.0, 1.0)],
        @core.style("red"),
      ),
    ],
    None,
    [],
    None,
    x,
    y,
    None,
    None,
    false,
    [],
    [],
    x_margin=0.05,
    y_margin=0.0,
  )
  let actual = compute_scale(@render.figure(400, 300, 0, [panel], [], None), 0)
  verify_asinh_display_source([actual.xmin, actual.xmax], [-0.001, 0.001])
}

///|
test "Asinh original full apply_aspect 0: box" {
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.asinh_scale(linear_width=1.0))
  x.set_limits(-100.0, 100.0)
  y.set_limits(-1.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-100.0, 0.0), @core.point(100.0, 1.0)],
        @core.style("red"),
      ),
    ],
    None,
    [],
    None,
    x,
    y,
    None,
    None,
    false,
    [],
    [],
    x_margin=0.0,
    y_margin=0.0,
    aspect=1.0,
    adjustable="box",
  )
  let figure = @render.figure(400, 300, 0, [panel], [], None)
  let actual = resolve_panel_scale(figure, 0)
  verify_asinh_display_source(
    [actual.xmin, actual.xmax, actual.ymin, actual.ymax],
    [-100.0, 100.0, -1.0, 1.0],
  )
  let rect = positioned_panel_rect(figure, panel, actual)
  verify_asinh_display_source([rect.0, rect.1, rect.2, rect.3], [
    0.0, 112.25234494129343, 400.0, 75.49531011741315,
  ])
}

///|
test "Asinh original full apply_aspect 1: box" {
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.asinh_scale(linear_width=2.0))
  x.set_limits(-100.0, 100.0)
  y.set_limits(-1.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-100.0, 0.0), @core.point(100.0, 1.0)],
        @core.style("red"),
      ),
    ],
    None,
    [],
    None,
    x,
    y,
    None,
    None,
    false,
    [],
    [],
    x_margin=0.0,
    y_margin=0.0,
    aspect=2.0,
    adjustable="box",
  )
  let figure = @render.figure(400, 300, 0, [panel], [], None)
  let actual = resolve_panel_scale(figure, 0)
  verify_asinh_display_source(
    [actual.xmin, actual.xmax, actual.ymin, actual.ymax],
    [-100.0, 100.0, -1.0, 1.0],
  )
  let rect = positioned_panel_rect(figure, panel, actual)
  verify_asinh_display_source([rect.0, rect.1, rect.2, rect.3], [
    0.0, 106.57149470626088, 400.0, 86.85701058747827,
  ])
}

///|
test "Asinh original full apply_aspect 2: datalim" {
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.asinh_scale(linear_width=1.0))
  x.set_limits(-100.0, 100.0)
  y.set_limits(-1.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-100.0, 0.0), @core.point(100.0, 1.0)],
        @core.style("red"),
      ),
    ],
    None,
    [],
    None,
    x,
    y,
    None,
    None,
    false,
    [],
    [],
    x_margin=0.0,
    y_margin=0.0,
    aspect=1.0,
    adjustable="datalim",
  )
  let figure = @render.figure(400, 300, 0, [panel], [], None)
  let actual = resolve_panel_scale(figure, 0)
  verify_asinh_display_source(
    [actual.xmin, actual.xmax, actual.ymin, actual.ymax],
    [-100.0, 100.0, -3.9737567742079416, 3.9737567742079416],
  )
  let rect = positioned_panel_rect(figure, panel, actual)
  verify_asinh_display_source([rect.0, rect.1, rect.2, rect.3], [
    0.0, 0.0, 400.0, 300.0,
  ])
}

///|
test "Asinh original full apply_aspect 3: datalim" {
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.asinh_scale(linear_width=2.0))
  x.set_limits(-100.0, 100.0)
  y.set_limits(-1.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-100.0, 0.0), @core.point(100.0, 1.0)],
        @core.style("red"),
      ),
    ],
    None,
    [],
    None,
    x,
    y,
    None,
    None,
    false,
    [],
    [],
    x_margin=0.0,
    y_margin=0.0,
    aspect=2.0,
    adjustable="datalim",
  )
  let figure = @render.figure(400, 300, 0, [panel], [], None)
  let actual = resolve_panel_scale(figure, 0)
  verify_asinh_display_source(
    [actual.xmin, actual.xmax, actual.ymin, actual.ymax],
    [-100.0, 100.0, -3.4539526282435675, 3.4539526282435675],
  )
  let rect = positioned_panel_rect(figure, panel, actual)
  verify_asinh_display_source([rect.0, rect.1, rect.2, rect.3], [
    0.0, 0.0, 400.0, 300.0,
  ])
}

///|
test "Asinh original fixed bbox primary x and y display 0" {
  let scale : Scale = {
    xmin: -100.0,
    xmax: 100.0,
    ymin: -100.0,
    ymax: 100.0,
    x_axis_scale: @ticker_scale.asinh_scale(linear_width=1.0),
    y_axis_scale: @ticker_scale.asinh_scale(linear_width=1.0),
  }
  let values = [-100.0, -1.0, -0.0, 0.0, 1.0, 100.0]
  verify_asinh_display_source(
    values.map(value => map_x(scale, 40.0, 400.0, value)),
    [40.0, 206.73021385933137, 240.0, 240.0, 273.26978614066866, 440.0],
  )
  verify_asinh_display_source(
    values.map(value => map_y(scale, 60.0, 300.0, value)),
    [360.0, 234.95233960550144, 210.0, 210.0, 185.0476603944985, 60.0],
  )
}

///|
test "Asinh original fixed bbox primary x and y display 1" {
  let scale : Scale = {
    xmin: -100.0,
    xmax: 100.0,
    ymin: -100.0,
    ymax: 100.0,
    x_axis_scale: @ticker_scale.asinh_scale(linear_width=2.0),
    y_axis_scale: @ticker_scale.asinh_scale(linear_width=2.0),
  }
  let values = [-100.0, -1.0, -0.0, 0.0, 1.0, 100.0]
  verify_asinh_display_source(
    values.map(value => map_x(scale, 40.0, 400.0, value)),
    [
      40.00000000000003, 219.10168970798915, 240.0, 240.0, 260.8983102920109, 440.0,
    ],
  )
  verify_asinh_display_source(
    values.map(value => map_y(scale, 60.0, 300.0, value)),
    [
      359.99999999999994, 225.67373271900817, 210.0, 210.0, 194.32626728099183, 60.0,
    ],
  )
}

///|
test "Asinh original secondary own function position and visibility 0" {
  let scale : Scale = {
    xmin: -100.0,
    xmax: 100.0,
    ymin: -100.0,
    ymax: 100.0,
    x_axis_scale: @ticker_scale.asinh_scale(),
    y_axis_scale: @ticker_scale.asinh_scale(),
  }
  let secondary = secondary_display_scale(scale, true)
  let visible : Array[Double] = []
  let actual : Array[Double] = []
  for value in [-215.0, -195.0, -95.0, 5.0, 105.0, 205.0, 225.0] {
    let primary = (value - 5.0) / 2.0
    if tick_in_view(primary, secondary.x_axis_scale, -100.0, 100.0) {
      visible.push(value)
      actual.push(map_x(secondary, 40.0, 400.0, primary))
    }
  }
  assert_eq(visible, [-195.0, -95.0, 5.0, 105.0, 205.0])
  verify_asinh_display_source(actual, [40.0, 140.0, 240.0, 340.0, 440.0])
}

///|
test "Asinh original secondary own function position and visibility 1" {
  let scale : Scale = {
    xmin: -100.0,
    xmax: 100.0,
    ymin: -100.0,
    ymax: 100.0,
    x_axis_scale: @ticker_scale.asinh_scale(),
    y_axis_scale: @ticker_scale.asinh_scale(),
  }
  let secondary = secondary_display_scale(scale, false)
  let visible : Array[Double] = []
  let actual : Array[Double] = []
  for value in [-215.0, -195.0, -95.0, 5.0, 105.0, 205.0, 225.0] {
    let primary = (value - 5.0) / 2.0
    if tick_in_view(primary, secondary.y_axis_scale, -100.0, 100.0) {
      visible.push(value)
      actual.push(map_y(secondary, 60.0, 300.0, primary))
    }
  }
  assert_eq(visible, [-195.0, -95.0, 5.0, 105.0, 205.0])
  verify_asinh_display_source(actual, [360.0, 285.0, 210.0, 135.0, 60.0])
}
