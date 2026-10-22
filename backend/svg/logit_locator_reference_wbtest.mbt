// Original autoscale→set_bound→Axis._set_lim, real Scale and fixed Bbox position.

///|
fn verify_logit_display_source(
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
test "Logit original transformed primary visibility 0" {
  let scale = @ticker_scale.logit_scale(nonpositive="mask")
  let major = [0.1, 0.5, 0.9].filter(value => {
    tick_in_view(value, scale, 0.01, 0.99)
  })
  assert_eq(major, [0.1, 0.5, 0.9])
  let minor = [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ].filter(value => tick_in_view(value, scale, 0.01, 0.99))
  assert_eq(minor, [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
}

///|
test "Logit original transformed primary visibility 1" {
  let scale = @ticker_scale.logit_scale(nonpositive="clip")
  let major = [0.1, 0.5, 0.9].filter(value => {
    tick_in_view(value, scale, 0.01, 0.99)
  })
  assert_eq(major, [0.1, 0.5, 0.9])
  let minor = [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ].filter(value => tick_in_view(value, scale, 0.01, 0.99))
  assert_eq(minor, [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
}

///|
test "Logit original transformed primary visibility 2" {
  let scale = @ticker_scale.logit_scale(nonpositive="mask")
  let major = [0.1, 0.5, 0.9].filter(value => {
    tick_in_view(value, scale, 0.03, 0.97)
  })
  assert_eq(major, [0.1, 0.5, 0.9])
  let minor = [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ].filter(value => tick_in_view(value, scale, 0.03, 0.97))
  assert_eq(minor, [
    0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8, 0.91,
    0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97,
  ])
}

///|
test "Logit original transformed primary visibility 3" {
  let scale = @ticker_scale.logit_scale(nonpositive="mask")
  let major = [0.02, 0.5, 0.98].filter(value => {
    tick_in_view(value, scale, 0.01, 0.99)
  })
  assert_eq(major, [0.02, 0.5, 0.98])
  let minor = [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ].filter(value => tick_in_view(value, scale, 0.01, 0.99))
  assert_eq(minor, [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
}

///|
test "Logit original transformed primary visibility 4" {
  let scale = @ticker_scale.logit_scale(nonpositive="mask")
  let major = [0.02, 0.5, 0.98].filter(value => {
    tick_in_view(value, scale, 0.01, 0.99)
  })
  assert_eq(major, [0.02, 0.5, 0.98])
  let minor = [
    0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8, 0.91,
    0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97,
  ].filter(value => tick_in_view(value, scale, 0.01, 0.99))
  assert_eq(minor, [
    0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8, 0.91,
    0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97,
  ])
}

///|
test "Logit original transformed primary visibility 5" {
  let scale = @ticker_scale.logit_scale(nonpositive="mask")
  let major = [0.1, 0.5, 0.9].filter(value => {
    tick_in_view(value, scale, 0.99, 0.01)
  })
  assert_eq(major, [0.1, 0.5, 0.9])
  let minor = [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ].filter(value => tick_in_view(value, scale, 0.99, 0.01))
  assert_eq(minor, [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
}

///|
test "Logit original transformed primary visibility 6" {
  let scale = @ticker_scale.logit_scale(nonpositive="mask")
  let major = [0.5].filter(value => tick_in_view(value, scale, 0.45, 0.55))
  assert_eq(major, [0.5])
  let minor = [].filter(value => tick_in_view(value, scale, 0.45, 0.55))
  assert_eq(minor, [])
}

///|
test "Logit original complete non tight autoscale profile 0" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 0.01)
  x.bind_shared_minpos(() => [0.01])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(2.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [
    0.006339272365148315, 0.9936607276348517,
  ])
}

///|
test "Logit original complete non tight autoscale profile 1" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 0.9)
  x.bind_shared_minpos(() => [0.9])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(2.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [
    0.08188949557659114, 0.9181105044234089,
  ])
}

///|
test "Logit original complete non tight autoscale profile 2" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 1.0)
  x.bind_shared_minpos(() => [1.0])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(2.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [0.0, 1.0])
}

///|
test "Logit original complete non tight autoscale profile 3" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 2.0)
  x.bind_shared_minpos(() => [2.0])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(2.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [1.0e-12, 2.0])
}

///|
test "Logit original complete non tight autoscale profile 4" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 0.0)
  x.bind_shared_minpos(() => [0.0])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(2.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [0.0, 1.0])
}

///|
test "Logit original complete non tight autoscale profile 5" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => -0.1)
  x.bind_shared_minpos(() => [-0.1])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(2.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [-0.1, 1.0e-12])
}

///|
test "Logit original complete non tight autoscale profile 6" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 1.0 / 0.0)
  x.bind_shared_minpos(() => [1.0 / 0.0])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(2.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [
    1.9952624945845213e-08, 0.9999999800473751,
  ])
}

///|
test "Logit original complete non tight autoscale profile 7" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 0.2)
  x.bind_shared_minpos(() => [0.2])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(0.2, 0.0), @core.point(0.8, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [
    0.17873760922563603, 0.8212623907743639,
  ])
}

///|
test "Logit original complete non tight autoscale profile 8" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 0.2)
  x.bind_shared_minpos(() => [0.2])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(0.2, 0.0), @core.point(0.2, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [
    0.013640167088182095, 0.986359832911818,
  ])
}

///|
test "Logit original complete non tight autoscale profile 9" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 2.0)
  x.bind_shared_minpos(() => [2.0])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(2.0, 0.0), @core.point(3.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [
    1.9952624945845213e-08, 0.9999999800473751,
  ])
}

///|
test "Logit original complete non tight autoscale profile 10" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 0.01)
  x.bind_shared_minpos(() => [0.01])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(2.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [0.01, 0.99])
}

///|
test "Logit original complete non tight autoscale profile 11" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 0.9)
  x.bind_shared_minpos(() => [0.9])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(2.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [
    0.09999999999999998, 0.9,
  ])
}

///|
test "Logit original complete non tight autoscale profile 12" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 1.0)
  x.bind_shared_minpos(() => [1.0])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(2.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [0.0, 1.0])
}

///|
test "Logit original complete non tight autoscale profile 13" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 2.0)
  x.bind_shared_minpos(() => [2.0])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(2.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [1.0e-12, 2.0])
}

///|
test "Logit original complete non tight autoscale profile 14" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 0.0)
  x.bind_shared_minpos(() => [0.0])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(2.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [0.0, 1.0])
}

///|
test "Logit original complete non tight autoscale profile 15" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => -0.1)
  x.bind_shared_minpos(() => [-0.1])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(2.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [-0.1, 1.0e-12])
}

///|
test "Logit original complete non tight autoscale profile 16" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 1.0 / 0.0)
  x.bind_shared_minpos(() => [1.0 / 0.0])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-1.0, 0.0), @core.point(2.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [1.0e-07, 0.9999999])
}

///|
test "Logit original complete non tight autoscale profile 17" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 0.2)
  x.bind_shared_minpos(() => [0.2])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(0.2, 0.0), @core.point(0.8, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [0.2, 0.8])
}

///|
test "Logit original complete non tight autoscale profile 18" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 0.2)
  x.bind_shared_minpos(() => [0.2])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(0.2, 0.0), @core.point(0.2, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [0.2, 0.8])
}

///|
test "Logit original complete non tight autoscale profile 19" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 2.0)
  x.bind_shared_minpos(() => [2.0])
  x.set_tick_layout(120.0, true)
  x.set_locator(@ticker.LogitLocator::new(minor=false).as_locator())
  y.set_limits(0.0, 1.0)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(2.0, 0.0), @core.point(3.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [-1.0, 2.0])
}

///|
test "Logit original primary fixed bbox positions 0" {
  let scale : Scale = {
    xmin: 0.01,
    xmax: 0.99,
    ymin: 0.01,
    ymax: 0.99,
    x_axis_scale: @ticker_scale.logit_scale(),
    y_axis_scale: @ticker_scale.logit_scale(),
  }
  verify_logit_display_source(
    [0.01, 0.1, 0.25, 0.5, 0.75, 0.9, 0.99].map(value => {
      map_x(scale, 40.0, 400.0, value)
    }),
    [
      40.0, 144.3670394245816, 192.18351971229077, 240.0, 287.8164802877092, 335.63296057541845,
      439.99999999999994,
    ],
  )
}

///|
test "Logit original primary fixed bbox positions 1" {
  let scale : Scale = {
    xmin: 0.01,
    xmax: 0.99,
    ymin: 0.01,
    ymax: 0.99,
    x_axis_scale: @ticker_scale.logit_scale(),
    y_axis_scale: @ticker_scale.logit_scale(),
  }
  verify_logit_display_source(
    [0.01, 0.1, 0.25, 0.5, 0.75, 0.9, 0.99].map(value => {
      map_y(scale, 60.0, 300.0, value)
    }),
    [
      360.0, 281.7247204315638, 245.86236021578193, 210.0, 174.1376397842181, 138.2752795684362,
      60.0,
    ],
  )
}

///|
test "Logit original owner minpos differs from requesting Axis scale minpos 0" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 0.1)
  x.bind_shared_minpos(() => [0.1, 0.01])
  y.set_limits(0.0, 1.0)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  x.set_locator(locator.as_locator())
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-2.0, 0.0), @core.point(3.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [
    0.08188949557659114, 0.9181105044234089,
  ])
}

///|
test "Logit original owner minpos differs from requesting Axis scale minpos 1" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 0.1)
  x.bind_shared_minpos(() => [0.1, 0.01])
  y.set_limits(0.0, 1.0)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  x.set_locator(locator.as_locator())
  let owner = @axis.axis()
  owner.bind_minpos(() => 0.01)
  owner.set_locator(locator.as_locator())
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(-2.0, 0.0), @core.point(3.0, 1.0)],
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
  verify_logit_display_source([actual.xmin, actual.xmax], [
    0.006339272365148315, 0.9936607276348517,
  ])
}

///|
test "Logit original full apply aspect 0: box" {
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  y.set_scale(@ticker_scale.logit_scale())
  x.set_limits(0.01, 0.99)
  y.set_limits(0.1, 0.9)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(0.01, 0.1), @core.point(0.99, 0.9)],
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
  verify_logit_display_source(
    [actual.xmin, actual.xmax, actual.ymin, actual.ymax],
    [0.01, 0.99, 0.1, 0.9],
  )
  let rect = positioned_panel_rect(figure, panel, actual)
  verify_logit_display_source([rect.0, rect.1, rect.2, rect.3], [
    0.0, 54.367039424581556, 400.0, 191.2659211508369,
  ])
}

///|
test "Logit original full apply aspect 1: datalim" {
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  y.set_scale(@ticker_scale.logit_scale())
  x.set_limits(0.01, 0.99)
  y.set_limits(0.1, 0.9)
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(0.01, 0.1), @core.point(0.99, 0.9)],
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
  verify_logit_display_source(
    [actual.xmin, actual.xmax, actual.ymin, actual.ymax],
    [0.01, 0.99, 0.030878199392016095, 0.9691218006079839],
  )
  let rect = positioned_panel_rect(figure, panel, actual)
  verify_logit_display_source([rect.0, rect.1, rect.2, rect.3], [
    0.0, 0.0, 400.0, 300.0,
  ])
}
