///|
test "gca pure relim forwards visible-only and keeps omitted default-false behavior" {
  @pyplot.close()
  defer @pyplot.close()
  let fig = @pyplot.figure(width=400, height=200)
  let axes = @pyplot.axes(left=0.0, bottom=0.0, width=1.0, height=1.0)
  axes.set_x_limits(0.0, 100.0)
  axes.set_y_limits(0.0, 100.0)
  axes.set_margins(0.0, 0.0)
  ignore(
    @pyplot.plot_line(
      @scene.LineData::Numeric([10.0, 20.0]),
      @scene.LineData::Numeric([30.0, 40.0]),
      color="#7d9fc1",
    ),
  )
  let hidden = @pyplot.plot_line(
    @scene.LineData::Numeric([1000.0, 2000.0]),
    @scene.LineData::Numeric([3000.0, 4000.0]),
    color="#8eb0d2",
  )
  hidden.set_visible(false)
  @pyplot.gca().relim(visible_only=true)
  let visible = axes.data_limits()
  assert_eq((visible.lower(), visible.upper()), (10.0, 20.0))
  @pyplot.gca().relim()
  let all = axes.data_limits()
  assert_eq((all.lower(), all.upper()), (10.0, 2000.0))
  @pyplot.gca().relim_checked(visible_only=true)
  let view = axes.get_xlim_checked()
  assert_eq((view.lower(), view.upper()), (0.0, 100.0))
  assert_true(!axes.get_autoscale_on())
  axes.set_autoscale_on(true)
  axes.autoscale_view(tight=true)
  let fitted = axes.get_xlim_checked()
  assert_eq((fitted.lower(), fitted.upper()), (10.0, 20.0))
  assert_true(fig.to_svg_checked().contains("points=\"0,200 400,0\""))
  assert_true(hidden.stale())
}

///|
test "public pure visible-only relim skips hidden pending error while checked default exposes it" {
  @pyplot.close()
  defer @pyplot.close()
  let fig = @pyplot.figure()
  let axes = @pyplot.gca()
  axes.set_x_limits(0.0, 100.0)
  axes.set_y_limits(0.0, 100.0)
  ignore(
    @pyplot.plot_line(
      @scene.LineData::Numeric([1.0, 2.0]),
      @scene.LineData::Numeric([3.0, 4.0]),
    ),
  )
  let hidden = @pyplot.plot_line(
    @scene.LineData::Numeric([10.0, 20.0]),
    @scene.LineData::Numeric([30.0, 40.0]),
    color="#9fc1e3",
  )
  hidden.set_visible(false)
  hidden.set_xdata(@scene.LineData::Numeric([10.0, 15.0, 20.0]))
  @pyplot.gca().relim(visible_only=true)
  let visible = axes.data_limits()
  assert_eq((visible.lower(), visible.upper()), (1.0, 2.0))
  assert_true(!fig.to_svg_checked().contains("#9fc1e3"))
  try @pyplot.gca().relim_checked() catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("the checked default must include hidden pending data")
  } noraise {
    _ => fail("expected default-false relim failure")
  }
  hidden.set_xdata(@scene.LineData::Numeric([10.0, 20.0]))
  @pyplot.gca().relim()
  let all = axes.data_limits()
  assert_eq((all.lower(), all.upper()), (1.0, 20.0))
  assert_true(!hidden.get_visible() && hidden.stale())
}
