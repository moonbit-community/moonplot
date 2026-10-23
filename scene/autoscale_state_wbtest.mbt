///|
fn assert_scene_auto_limits(
  actual : @core.Limits,
  lower : Double,
  upper : Double,
) -> Unit raise {
  assert_true((actual.lower() - lower).abs() < 1.0e-12)
  assert_true((actual.upper() - upper).abs() < 1.0e-12)
}

///|
test "automatic view tight preserves margins and manual selection" {
  let axes = figure().axes()
  axes.plot([0.0, 10.0], [20.0, 30.0])
  axes.set_margins(0.1, 0.2)
  axes.autoscale_view(tight=true)
  assert_eq(axes.margins(), (0.1, 0.2))
  assert_scene_auto_limits(axes.get_xlim_checked(), -1.0, 11.0)
  assert_scene_auto_limits(axes.get_ylim_checked(), 18.0, 32.0)
  axes.set_xlim(4.0, 6.0)
  axes.autoscale_view(tight=false)
  assert_scene_auto_limits(axes.get_xlim_checked(), 4.0, 6.0)
  assert_true(!axes.get_autoscalex_on())
  axes.autoscale(axis="x", tight=true)
  assert_eq(axes.margins(), (0.0, 0.2))
  assert_scene_auto_limits(axes.get_xlim_checked(), 0.0, 10.0)
}

///|
test "auto enableNone schedules both without changing their flags" {
  let axes = figure().axes()
  axes.set_autoscale_on(false)
  axes.autoscale(enable=None, axis="x", tight=true)
  assert_true(axes.x_axis().autoscale_stale())
  assert_true(axes.y_axis().autoscale_stale())
  assert_eq(axes.margins(), (0.0, 0.0))
  assert_eq(axes.autoscale_tight(), Some(true))
  axes.unstale_view()
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
  assert_true(!axes.get_autoscale_on())
  assert_scene_auto_limits(axes.get_xlim_checked(), 0.0, 1.0)
}

///|
test "disabling autoscale does not apply tight or request a view" {
  let axes = figure().axes()
  axes.autoscale(enable=Some(false), tight=true)
  assert_eq(axes.autoscale_tight(), None)
  assert_eq(axes.margins(), (0.05, 0.05))
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
}

///|
test "shared lazy requests are found on a different peer and preserve auto flags" {
  let panels = figure().subplots(1, 2, share_x=true)
  let first = panels[0]
  let second = panels[1]
  second.set_autoscalex_on(false)
  first.plot([10.0, 20.0], [0.0, 1.0])
  assert_true(first.x_axis().autoscale_stale())
  assert_true(!second.x_axis().autoscale_stale())
  // Reading the disabled peer consumes requests but cannot update its x view.
  assert_scene_auto_limits(second.get_xlim_checked(), 0.0, 1.0)
  first.request_autoscale_view(axis="x")
  assert_scene_auto_limits(first.get_xlim_checked(), 9.5, 20.5)
  assert_scene_auto_limits(second.get_xlim_checked(), 9.5, 20.5)
  assert_true(first.get_autoscalex_on())
  assert_true(!second.get_autoscalex_on())
}

///|
test "set_xlim autoNone preserves each peer switch" {
  let panels = figure().subplots(1, 2, share_x=true)
  panels[1].set_autoscalex_on(false)
  panels[0].set_xlim(20.0, 10.0, auto=None)
  assert_scene_auto_limits(panels[0].get_xlim_checked(), 20.0, 10.0)
  assert_scene_auto_limits(panels[1].get_xlim_checked(), 20.0, 10.0)
  assert_true(panels[0].get_autoscalex_on())
  assert_true(!panels[1].get_autoscalex_on())
}

///|
test "view mutation follows current endpoints rather than a latch" {
  let axes = figure().axes()
  axes.set_xlim(2.0, 3.0)
  axes.set_autoscalex_on(true)
  axes.autoscale_view(scaley=false)
  assert_scene_auto_limits(axes.get_xlim_checked(), 2.0, 3.0)
  axes.set_xlim(0.0, 1.0, auto=Some(true))
  assert_true(!axes.x_axis().view_mutated())
  axes.autoscale_view(scaley=false)
  assert_scene_auto_limits(axes.get_xlim_checked(), -0.055, 0.055)
}

///|
test "clear retains cached data until the selected first new update" {
  let axes = figure().axes()
  axes.plot([10.0, 20.0], [100.0, 200.0])
  axes.clear_checked()
  assert_scene_auto_limits(axes.data_limits(), 10.0, 20.0)
  assert_scene_auto_limits(axes.data_limits(horizontal=false), 100.0, 200.0)
  assert_true(axes.ignore_existing_data_limits())
  axes.axhline(2.0)
  assert_scene_auto_limits(axes.data_limits(), 10.0, 20.0)
  assert_scene_auto_limits(axes.data_limits(horizontal=false), 2.0, 2.0)
  assert_true(!axes.ignore_existing_data_limits())
  axes.axvline(5.0)
  assert_scene_auto_limits(axes.data_limits(), 5.0, 20.0)
}

///|
test "relim alone changes cache without enabling or scheduling" {
  let axes = figure().axes()
  let points = [@core.point(1.0, 2.0), @core.point(3.0, 4.0)]
  axes.push_artist(Artist::Line(points, @core.style("#000000")))
  axes.unstale_view()
  axes.set_autoscale_on(false)
  points[1] = @core.point(30.0, 40.0)
  assert_scene_auto_limits(axes.data_limits(), 1.0, 3.0)
  axes.relim()
  assert_scene_auto_limits(axes.data_limits(), 1.0, 30.0)
  assert_scene_auto_limits(axes.data_limits(horizontal=false), 2.0, 40.0)
  assert_true(!axes.get_autoscale_on())
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
}

///|
test "raw update_datalim nonfinite early return differs from a line path" {
  let axes = figure().axes()
  axes.plot([1.0, 2.0], [3.0, 4.0])
  axes.clear_checked()
  let nan = 0.0 / 0.0
  axes.update_datalim([@core.point(nan, nan)])
  assert_true(axes.ignore_existing_data_limits())
  assert_scene_auto_limits(axes.data_limits(), 1.0, 2.0)
  // One finite coordinate passes the source any-finite guard. Paired masking
  // then yields empty intervals and consumes ignore.
  axes.update_datalim([@core.point(10.0, nan)])
  assert_true(!axes.ignore_existing_data_limits())
  assert_true(axes.data_limits().lower().is_inf())
  assert_true(axes.data_limits().lower() > 0.0)
  assert_true(axes.data_limits().upper() < 0.0)
  axes.clear_checked()
  axes.push_artist(
    Artist::Line([@core.point(nan, nan)], @core.style("#000000")),
  )
  assert_true(!axes.ignore_existing_data_limits())
  assert_true(axes.data_limits().lower().is_inf())
}

///|
test "minpos cache includes interior points independently of displayed scale" {
  let axes = figure().axes()
  axes.plot([-10.0, 0.25, 10.0], [2.0, 3.0, 4.0])
  assert_eq(axes.data_minpos(), 0.25)
  axes.set_xlim(-20.0, 20.0)
  assert_eq(axes.data_minpos(), 0.25)
  axes.clear_checked()
  assert_eq(axes.data_minpos(), 0.25)
  axes.axhline(100.0)
  assert_eq(axes.data_minpos(), 0.25)
  assert_eq(axes.data_minpos(horizontal=false), 100.0)
}

///|
test "checked range failure consumes pending group requests" {
  let axes = figure().axes()
  axes.plot([1.0, 2.0], [3.0, 4.0])
  axes
  .x_axis()
  .bind_autoscale_minpos(() => {
    raise @core.DataError::InvalidTicks(message="shared minpos failure")
  })
  try axes.unstale_view() catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "shared minpos failure")
    _ => fail("expected original checked range error")
  } noraise {
    _ => fail("expected original checked range error")
  }
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
  assert_scene_auto_limits(axes.x_axis().stored_view_limits(), 0.0, 1.0)
}

///|
test "nonfinite positive margin and NaN use zero delta while negative infinity is invalid" {
  let axes = figure().axes()
  axes.plot([1.0, 3.0], [2.0, 4.0])
  axes.set_x_margin(1.0 / 0.0)
  axes.set_y_margin(0.0 / 0.0)
  assert_scene_auto_limits(axes.get_xlim_checked(), 1.0, 3.0)
  assert_scene_auto_limits(axes.get_ylim_checked(), 2.0, 4.0)
  try axes.set_x_margin(-1.0 / 0.0) catch {
    @core.DataError::InvalidTicks(_) => ()
    _ => fail("expected invalid margin")
  } noraise {
    _ => fail("negative infinite margin must be rejected")
  }
  assert_eq(axes.x_margin(), 1.0 / 0.0)
}

///|
test "image limit failure retains new cache without attaching or requesting" {
  let axes = figure().axes()
  let x = axes.x_axis()
  x.bind_minpos(() => {
    raise @core.DataError::InvalidTicks(message="image minpos failure")
  })
  try axes.imshow([[1.0]], extent=[2.0, 4.0, 10.0, 20.0], aspect="auto") catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "image minpos failure")
    _ => fail("expected source image extent failure")
  } noraise {
    _ => fail("expected source image extent failure")
  }
  assert_true(axes.artists().is_empty())
  assert_scene_auto_limits(axes.data_limits(), 2.0, 4.0)
  assert_scene_auto_limits(axes.data_limits(horizontal=false), 10.0, 20.0)
  assert_true(!axes.ignore_existing_data_limits())
  assert_true(!x.autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
  assert_scene_auto_limits(x.stored_view_limits(), 0.0, 1.0)
}

///|
test "empty relim resets bounds but preserves prior minimum-positive data" {
  let axes = figure().axes()
  axes.plot([10.0, 20.0], [30.0, 40.0])
  axes.clear_checked()
  axes.relim()
  assert_true(axes.data_limits().lower().is_inf())
  assert_true(axes.data_limits().lower() > 0.0)
  assert_true(axes.data_limits().upper() < 0.0)
  assert_eq(axes.data_minpos(), 10.0)
  assert_eq(axes.data_minpos(horizontal=false), 30.0)
  assert_true(axes.ignore_existing_data_limits())
  axes.axhline(2.0)
  assert_eq(axes.data_minpos(), 10.0)
  assert_eq(axes.data_minpos(horizontal=false), 2.0)
}

///|
test "axis getters and locator setters retain user context overrides" {
  let axes = figure().axes()
  let x = axes.x_axis()
  let y = axes.y_axis()
  x.bind_minpos(() => 42.0)
  y.bind_minpos(() => 84.0)
  x.bind_data_interval(() => (100.0, 200.0))
  y.bind_data_interval(() => (300.0, 400.0))
  assert_true(physical_equal(axes.x_axis(), x))
  assert_true(physical_equal(axes.y_axis(), y))
  assert_eq(axes.x_axis().get_minpos(), 42.0)
  assert_eq(axes.y_axis().get_minpos(), 84.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  assert_eq(x.get_minpos(), 42.0)
  assert_eq(y.get_minpos(), 84.0)
  assert_scene_auto_limits(x.data_interval(), 100.0, 200.0)
  assert_scene_auto_limits(y.data_interval(), 300.0, 400.0)
}

///|
test "deleting a peer changes ticker ownership without rebinding panel providers" {
  let fig = figure()
  let panels = fig.subplots(1, 2, share_x=true, share_y=true)
  let remaining = panels[0]
  let x = remaining.x_axis()
  let y = remaining.y_axis()
  x.bind_minpos(() => 42.0)
  y.bind_minpos(() => 84.0)
  x.bind_data_interval(() => (100.0, 200.0))
  y.bind_data_interval(() => (300.0, 400.0))
  fig.delaxes(panels[1])
  assert_eq(remaining.x_axis().get_minpos(), 42.0)
  assert_eq(remaining.y_axis().get_minpos(), 84.0)
  assert_scene_auto_limits(x.data_interval(), 100.0, 200.0)
  assert_scene_auto_limits(y.data_interval(), 300.0, 400.0)
}

///|
test "autoscale reads persistent tight after nonsingular minpos callbacks" {
  let mode = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(mode)
  @config.set_axes_autolimit_mode("round_numbers")
  let axes = figure().axes()
  axes.plot([5.0, 6.0], [0.0, 1.0])
  let x = axes.x_axis()
  x.set_scale(@scale.log_scale())
  axes.state.val.x_margin = 0.0
  x.clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  x.bind_minpos(() => {
    axes.autoscale_view(tight=true, scalex=false, scaley=false)
    0.01
  })
  axes.autoscale_view(scaley=false)
  assert_eq(axes.autoscale_tight(), Some(true))
  // Original Log inverse yields neighboring binary64 values around 5 and 6;
  // the essential source choice is to skip decade rounding after this callback.
  assert_scene_auto_limits(axes.get_xlim_checked(), 5.0, 6.0)
}

///|
test "y sticky filtering captures its original scale before x callbacks" {
  let axes = figure().axes()
  // This valid image extent contributes only negative y sticky edges.
  axes.imshow([[1.0]], extent=[5.0, 6.0, -1.0, -0.5], aspect="auto")
  axes.plot([5.0, 6.0], [-1.0, 1.0])
  let x = axes.x_axis()
  let y = axes.y_axis()
  y.set_scale(@scale.log_scale())
  axes.state.val.x_margin = 0.0
  axes.state.val.y_margin = 0.1
  axes.state.val.tight = Some(true)
  x.clear_autoscale_request()
  y.clear_autoscale_request()
  x.bind_minpos(() => {
    axes.set_y_scale(@scale.linear_scale())
    0.01
  })
  axes.autoscale_view()
  assert_scene_auto_limits(axes.get_xlim_checked(), 5.0, 6.0)
  // Outer Y's negative sticky was removed while Y was still logarithmic.
  // Refiltering after the callback would incorrectly clamp the lower end to -1.
  assert_scene_auto_limits(axes.get_ylim_checked(), -1.2, 1.2)
}
