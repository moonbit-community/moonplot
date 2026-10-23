///|
fn log_locator_minpos_panel(x : @axis.Axis) -> @render.Figure {
  let y = @axis.axis()
  try! y.set_limits(0.0, 2.0)
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
  @render.figure(240, 120, 0, [panel], [], None)
}

///|
test "Log autoscale keeps three locator-shared queries and independent raw data minima" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  x.set_scale(@ticker_scale.log_scale())
  let shared = [0]
  let own = [0]
  let raw = [0]
  x.bind_shared_minpos(() => {
    shared[0] += 1
    [5.0]
  })
  x.bind_minpos(() => {
    own[0] += 1
    5.0
  })
  x.bind_autoscale_minpos(() => {
    raw[0] += 1
    [5.0]
  })
  x.set_locator(@ticker.LogLocator::new().as_locator())
  ignore(compute_scale(log_locator_minpos_panel(x), 0))
  assert_eq(shared[0], 3)
  assert_eq(raw[0], 1)
  assert_eq(own[0], 1)
}

///|
test "Log checked autoscale propagates the third nonsingular and final own provider errors" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  for fail_shared in [true, false] {
    let x = @axis.axis()
    x.set_scale(@ticker_scale.log_scale())
    let shared = [0]
    let own = [0]
    let raw = [0]
    x.bind_shared_minpos(() => {
      shared[0] += 1
      if fail_shared && shared[0] == 3 {
        raise @core.DataError::InvalidTicks(message="third nonsingular minpos")
      }
      [5.0]
    })
    x.bind_minpos(() => {
      own[0] += 1
      raise @core.DataError::InvalidTicks(message="final own minpos")
    })
    x.bind_autoscale_minpos(() => {
      raw[0] += 1
      [5.0]
    })
    x.set_locator(@ticker.LogLocator::new().as_locator())
    assert_true(
      try {
        ignore(compute_scale(log_locator_minpos_panel(x), 0))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          (if fail_shared {
            "third nonsingular minpos"
          } else {
            "final own minpos"
          })
        _ => false
      },
    )
    assert_eq(shared[0], 3)
    assert_eq(raw[0], 1)
    assert_eq(own[0], if fail_shared { 0 } else { 1 })
  }
}
