// Original autoscale_view -> set_xbound -> Axis._set_lim outcomes.

///|
fn verify_log_axis_margin(actual : Double, expected : Double) -> Unit raise {
  if expected == 0.0 {
    assert_eq(actual, expected)
  } else {
    assert_true(
      Double::abs(actual - expected) <= Double::abs(expected) * 1.0e-12,
    )
  }
}

///|
test "Log original checked autoscale margin 0" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.log_scale())
  y.set_limits(0.0, 2.0)
  x.bind_minpos(() => 5.0)
  x.bind_shared_minpos(() => [5.0])
  let locator = @ticker.LogLocator::new(
    base=10.0,
    numticks=Some(@ticker.LogNumTicks::Number(9.0)),
  )
  x.set_locator(locator.as_locator())
  let panel = @render.panel_with_sharing(
    None,
    [@render.Artist::Line([@core.point(5.0, 1.0)], @core.style("red"))],
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
  )
  let figure = @render.figure(240, 120, 0, [panel], [], None)
  let actual = compute_scale(figure, 0)
  verify_log_axis_margin(actual.xmin, 0.8912509381337456)
  verify_log_axis_margin(actual.xmax, 11.220184543019636)
}

///|
test "Log original checked autoscale margin 1" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.log_scale())
  y.set_limits(0.0, 2.0)
  x.bind_minpos(() => 5.0)
  x.bind_shared_minpos(() => [5.0])
  let locator = @ticker.LogLocator::new(
    base=10.0,
    numticks=Some(@ticker.LogNumTicks::Number(9.0)),
  )
  x.set_locator(locator.as_locator())
  let panel = @render.panel_with_sharing(
    None,
    [@render.Artist::Line([@core.point(5.0, 1.0)], @core.style("red"))],
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
  )
  let figure = @render.figure(240, 120, 0, [panel], [], None)
  let actual = compute_scale(figure, 0)
  verify_log_axis_margin(actual.xmin, 0.1)
  verify_log_axis_margin(actual.xmax, 100.0)
}

///|
test "Log original checked autoscale margin 2" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.log_scale())
  y.set_limits(0.0, 2.0)
  x.bind_minpos(() => 5.0)
  x.bind_shared_minpos(() => [5.0])
  let locator = @ticker.LogLocator::new(
    base=0.0,
    numticks=Some(@ticker.LogNumTicks::Number(9.0)),
  )
  x.set_locator(locator.as_locator())
  let panel = @render.panel_with_sharing(
    None,
    [@render.Artist::Line([@core.point(5.0, 1.0)], @core.style("red"))],
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
  )
  let figure = @render.figure(240, 120, 0, [panel], [], None)
  assert_true(
    try {
      ignore(compute_scale(figure, 0))
      false
    } catch {
      @core.DataError::NonFiniteLimit(..) => true
      _ => false
    },
  )
}

///|
test "Log original checked autoscale margin 3" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.log_scale())
  y.set_limits(0.0, 2.0)
  x.bind_minpos(() => 5.0)
  x.bind_shared_minpos(() => [5.0])
  let locator = @ticker.LogLocator::new(
    base=0.0,
    numticks=Some(@ticker.LogNumTicks::Number(9.0)),
  )
  x.set_locator(locator.as_locator())
  let panel = @render.panel_with_sharing(
    None,
    [@render.Artist::Line([@core.point(5.0, 1.0)], @core.style("red"))],
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
  )
  let figure = @render.figure(240, 120, 0, [panel], [], None)
  assert_true(
    try {
      ignore(compute_scale(figure, 0))
      false
    } catch {
      @core.DataError::NonFiniteLimit(..) => true
      _ => false
    },
  )
}

///|
test "Log original checked autoscale margin 4" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.log_scale())
  y.set_limits(0.0, 2.0)
  x.bind_minpos(() => 5.0)
  x.bind_shared_minpos(() => [5.0])
  let locator = @ticker.LogLocator::new(
    base=1.0,
    numticks=Some(@ticker.LogNumTicks::Number(9.0)),
  )
  x.set_locator(locator.as_locator())
  let panel = @render.panel_with_sharing(
    None,
    [@render.Artist::Line([@core.point(5.0, 1.0)], @core.style("red"))],
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
  )
  let figure = @render.figure(240, 120, 0, [panel], [], None)
  let actual = compute_scale(figure, 0)
  verify_log_axis_margin(actual.xmin, 1.0)
  verify_log_axis_margin(actual.xmax, 1.0)
}

///|
test "Log original checked autoscale margin 5" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.log_scale())
  y.set_limits(0.0, 2.0)
  x.bind_minpos(() => 5.0)
  x.bind_shared_minpos(() => [5.0])
  let locator = @ticker.LogLocator::new(
    base=1.0,
    numticks=Some(@ticker.LogNumTicks::Number(9.0)),
  )
  x.set_locator(locator.as_locator())
  let panel = @render.panel_with_sharing(
    None,
    [@render.Artist::Line([@core.point(5.0, 1.0)], @core.style("red"))],
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
  )
  let figure = @render.figure(240, 120, 0, [panel], [], None)
  let actual = compute_scale(figure, 0)
  verify_log_axis_margin(actual.xmin, 1.0)
  verify_log_axis_margin(actual.xmax, 1.0)
}

///|
test "Log original checked autoscale margin 6" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.log_scale())
  y.set_limits(0.0, 2.0)
  x.bind_minpos(() => 5.0)
  x.bind_shared_minpos(() => [5.0])
  let locator = @ticker.LogLocator::new(
    base=0.0 / 0.0,
    numticks=Some(@ticker.LogNumTicks::Number(9.0)),
  )
  x.set_locator(locator.as_locator())
  let panel = @render.panel_with_sharing(
    None,
    [@render.Artist::Line([@core.point(5.0, 1.0)], @core.style("red"))],
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
  )
  let figure = @render.figure(240, 120, 0, [panel], [], None)
  let actual = compute_scale(figure, 0)
  verify_log_axis_margin(actual.xmin, 1.0)
  verify_log_axis_margin(actual.xmax, 10.0)
}

///|
test "Log original checked autoscale margin 7" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.log_scale())
  y.set_limits(0.0, 2.0)
  x.bind_minpos(() => 5.0)
  x.bind_shared_minpos(() => [5.0])
  let locator = @ticker.LogLocator::new(
    base=0.0 / 0.0,
    numticks=Some(@ticker.LogNumTicks::Number(9.0)),
  )
  x.set_locator(locator.as_locator())
  let panel = @render.panel_with_sharing(
    None,
    [@render.Artist::Line([@core.point(5.0, 1.0)], @core.style("red"))],
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
  )
  let figure = @render.figure(240, 120, 0, [panel], [], None)
  assert_true(
    try {
      ignore(compute_scale(figure, 0))
      false
    } catch {
      @core.DataError::NonFiniteLimit(..) => true
      _ => false
    },
  )
}

///|
test "Log original checked autoscale margin 8" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.log_scale())
  y.set_limits(0.0, 2.0)
  x.bind_minpos(() => 0.001)
  x.bind_shared_minpos(() => [0.001])
  let locator = @ticker.LogLocator::new(
    base=10.0,
    numticks=Some(@ticker.LogNumTicks::Number(9.0)),
  )
  x.set_locator(locator.as_locator())
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [
          @core.point(-2.0, 1.0),
          @core.point(0.001, 1.0),
          @core.point(100.0, 1.0),
        ],
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
  )
  let figure = @render.figure(240, 120, 0, [panel], [], None)
  let actual = compute_scale(figure, 0)
  verify_log_axis_margin(actual.xmin, 0.0005623413251903486)
  verify_log_axis_margin(actual.xmax, 177.82794100389242)
}

///|
test "Log original checked autoscale margin 9" {
  let previous = @config.axes_autolimit_mode()
  let classic = @config.classic_mode()
  defer @config.set_axes_autolimit_mode(previous)
  defer @config.set_classic_mode(classic)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("round_numbers")
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_scale(@ticker_scale.log_scale())
  y.set_limits(0.0, 2.0)
  x.bind_minpos(() => 0.001)
  x.bind_shared_minpos(() => [0.001])
  let locator = @ticker.LogLocator::new(
    base=10.0,
    numticks=Some(@ticker.LogNumTicks::Number(9.0)),
  )
  x.set_locator(locator.as_locator())
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [
          @core.point(-2.0, 1.0),
          @core.point(0.001, 1.0),
          @core.point(100.0, 1.0),
        ],
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
  )
  let figure = @render.figure(240, 120, 0, [panel], [], None)
  let actual = compute_scale(figure, 0)
  verify_log_axis_margin(actual.xmin, 0.0001)
  verify_log_axis_margin(actual.xmax, 1000.0)
}
