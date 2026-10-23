///|
fn logit_locator_minpos_panel(x : @axis.Axis) -> @render.Figure {
  let y = @axis.axis()
  try! y.set_limits(0.0, 1.0)
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
  @render.figure(400, 300, 0, [panel], [], None)
}

///|
test "Logit autoscale separates three own-axis queries from raw data minima" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  let events : Array[String] = []
  x.bind_shared_minpos(() => {
    raise @core.DataError::InvalidTicks(
      message="unexpected Logit shared-axis query",
    )
  })
  x.bind_autoscale_minpos(() => {
    events.push("raw")
    [0.01]
  })
  x.bind_minpos(() => {
    events.push("own")
    0.01
  })
  x.set_locator(
    @ticker.LogitLocator::new(nbins=Some(@ticker.MaxNBins::Count(4))).as_locator(),
  )
  let actual = compute_scale(logit_locator_minpos_panel(x), 0)
  assert_eq(events, ["own", "raw", "own", "own"])
  assert_true(
    Double::abs(actual.xmin - 0.006339272365148315) <=
    0.006339272365148315 * 1.0e-12,
  )
}

///|
test "Logit checked autoscale preserves first second and final own getter failures" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  for failure in [1, 2, 3] {
    let x = @axis.axis()
    x.set_scale(@ticker_scale.logit_scale())
    let calls = [0]
    let raw = [0]
    x.bind_minpos(() => {
      calls[0] += 1
      if calls[0] == failure {
        raise @core.DataError::InvalidTicks(message="logit stage")
      }
      0.01
    })
    x.bind_autoscale_minpos(() => {
      raw[0] += 1
      [0.01]
    })
    x.set_locator(
      @ticker.LogitLocator::new(nbins=Some(@ticker.MaxNBins::Count(4))).as_locator(),
    )
    assert_true(
      try {
        ignore(compute_scale(logit_locator_minpos_panel(x), 0))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) => message == "logit stage"
        _ => false
      },
    )
    assert_eq(calls[0], failure)
    assert_eq(raw[0], if failure == 1 { 0 } else { 1 })
  }
}

///|
test "Logit explicit view skips raw autoscale minima while raw locator remains checked" {
  let x = @axis.axis()
  x.set_scale(@ticker_scale.logit_scale())
  x.bind_minpos(() => 0.01)
  x.set_locator(
    @ticker.LogitLocator::new(nbins=Some(@ticker.MaxNBins::Count(4))).as_locator(),
  )
  x.set_limits(0.01, 0.99)
  x.bind_autoscale_minpos(() => {
    raise @core.DataError::InvalidTicks(
      message="raw data minima must be skipped",
    )
  })
  let actual = compute_scale(logit_locator_minpos_panel(x), 0)
  assert_eq(actual.xmin, 0.01)
  assert_eq(actual.xmax, 0.99)
}
