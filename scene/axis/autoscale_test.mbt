///|
test "automatic enable is independent of stored manual limits" {
  let axis = @axis.axis()
  axis.set_limits(100.0, 200.0)
  assert_true(!axis.autoscale_on())
  axis.bind_shared_minpos(() => {
    raise @core.DataError::InvalidTicks(message="disabled minimum queried")
  })
  assert_true(
    axis.autoscale_bounds_checked(
      [10.0, 20.0],
      margin=0.05,
      stickies=[],
      tight=true,
    )
    is None,
  )
  axis.set_autoscale_on(true)
  assert_true(axis.autoscale_on())
  assert_eq(axis.stored_view_limits().lower(), 100.0)
  assert_eq(axis.stored_view_limits().upper(), 200.0)
  assert_true(!axis.autoscale_stale())
}

///|
test "empty data preserves a mutated viewport before querying providers" {
  let axis = @axis.axis()
  axis.set_limits(200.0, 100.0)
  axis.set_autoscale_on(true)
  axis.request_autoscale()
  assert_eq(axis.lifecycle_view_interval_checked(), (200.0, 100.0))
  assert_eq(axis.view_interval_checked(), (200.0, 100.0))
  axis.bind_shared_minpos(() => {
    raise @core.DataError::InvalidTicks(message="empty mutated minimum queried")
  })
  assert_true(axis.view_mutated())
  assert_true(
    axis.autoscale_bounds_checked(
      [1.0 / 0.0, -1.0 / 0.0, 0.0 / 0.0],
      margin=0.05,
      stickies=[],
      tight=false,
    )
    is None,
  )
  assert_eq(axis.stored_view_limits().lower(), 200.0)
  assert_eq(axis.stored_view_limits().upper(), 100.0)
  axis.set_limits(0.0, 1.0)
  assert_true(!axis.view_mutated())
}

///|
test "autoscale uses raw finite endpoints and keeps candidate and emit stages separate" {
  let axis = @axis.axis()
  let events : Array[String] = []
  axis.bind_shared_minpos(() => {
    events.push("shared")
    [1.0 / 0.0, 10.0]
  })
  axis.bind_minpos(() => {
    events.push("own")
    10.0
  })
  let candidate = axis
    .autoscale_bounds_checked(
      [10.0, 20.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
      margin=0.1,
      stickies=[],
      tight=true,
    )
    .unwrap()
  assert_eq((candidate.lower(), candidate.upper()), (9.0, 21.0))
  assert_eq(events, ["shared"])
  assert_eq(axis.stored_view_limits().lower(), 0.0)
  axis.request_autoscale()
  let view = axis.set_bound_limits_checked(candidate.upper(), candidate.lower())
  assert_eq(events, ["shared", "own"])
  assert_eq((view.lower(), view.upper()), (21.0, 9.0))
  assert_true(axis.autoscale_on())
  assert_true(!axis.autoscale_stale())
  assert_true(axis.inverted())
  assert_true(axis.limits() is None)
}

///|
test "sticky clamps keep relative tolerance for tiny finite data" {
  let axis = @axis.axis()
  let candidate = axis
    .autoscale_bounds_checked(
      [1.0e-12, 2.0e-12],
      margin=0.1,
      stickies=[1.0e-12, 2.0e-12, 1.5e-12],
      tight=true,
    )
    .unwrap()
  assert_eq(candidate.lower(), 1.0e-12)
  assert_eq(candidate.upper(), 2.0e-12)
  let padded = axis
    .autoscale_bounds_checked(
      [1.0e-12, 2.0e-12],
      margin=0.1,
      stickies=[1.5e-12],
      tight=true,
    )
    .unwrap()
  assert_true(padded.lower() < 1.0e-12)
  assert_true(padded.upper() > 2.0e-12)
}

///|
test "checked autoscale leaves the stored view on a shared minimum failure" {
  let axis = @axis.axis()
  axis.bind_shared_minpos(() => {
    raise @core.DataError::InvalidTicks(message="shared minimum failed")
  })
  try
    axis.autoscale_bounds_checked(
      [10.0, 20.0],
      margin=0.05,
      stickies=[],
      tight=false,
    )
  catch {
    @core.DataError::InvalidTicks(message="shared minimum failed") => ()
    _ => fail("expected original shared minimum failure")
  } noraise {
    _ => fail("expected failure")
  }
  let view = axis.stored_view_limits()
  assert_eq((view.lower(), view.upper()), (0.0, 1.0))
}

///|
test "render minimum fallbacks preserve explicit provider precedence" {
  let axis = @axis.axis()
  axis.bind_render_minpos(() => 0.25, () => [0.25, 0.5])
  assert_eq(axis.get_minpos(), 0.25)
  assert_eq(axis.shared_minpos_checked(), [0.25, 0.5])
  axis.bind_minpos(() => 0.125)
  axis.bind_shared_minpos(() => [0.125])
  assert_eq(axis.get_minpos(), 0.125)
  assert_eq(axis.shared_minpos_checked(), [0.125])
}

///|
test "candidate view policy keeps the locator captured before data callbacks" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let axis = @axis.axis()
  axis.set_locator(@ticker.MultipleLocator::new(base=10.0).as_locator())
  let candidate = axis
    .autoscale_bounds_checked(
      [11.0, 21.0],
      margin=0.0,
      stickies=[],
      tight=false,
      data_minpos=Some(() => {
        axis.set_locator(@ticker.NullLocator::new().as_locator())
        [11.0]
      }),
    )
    .unwrap()
  assert_eq((candidate.lower(), candidate.upper()), (10.0, 30.0))
  assert_true(axis.locator().unwrap().null_locator() is Some(_))
}
