///|
test "pyplot Line visibility is live and repeating the same Bool preserves stale state" {
  @pyplot.close()
  defer @pyplot.close()
  let fig = @pyplot.figure(width=400, height=200)
  let axes = @pyplot.gca()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  let line = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([0.0, 1.0]),
    color="#a1bad3",
  )
  assert_true(line.get_visible())
  assert_true(fig.to_svg_checked().contains("#a1bad3"))
  assert_true(!line.stale())
  line.set_visible(true)
  assert_true(!line.stale())
  line.set_visible(false)
  assert_true(line.stale())
  assert_true(!fig.to_svg_checked().contains("#a1bad3"))
  assert_true(line.stale())
  line.set_visible(false)
  assert_true(line.stale())
  line.set_visible(true)
  assert_true(fig.to_svg_checked().contains("#a1bad3"))
  assert_true(!line.stale())
  assert_eq(axes.artists().length(), 1)
}

///|
test "pyplot hidden pending data stays lazy until explicit getter or showing" {
  @pyplot.close()
  defer @pyplot.close()
  let fig = @pyplot.figure()
  let axes = @pyplot.gca()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  let line = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([0.0, 1.0]),
    color="#b1cae3",
  )
  line.set_visible(false)
  line.set_ydata(@scene.LineData::Numeric([0.0, 0.5, 1.0]))
  assert_true(!fig.to_svg_checked().contains("#b1cae3"))
  try line.xy_values_checked() catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("visibility must not suppress an explicit processed getter")
  } noraise {
    _ => fail("expected explicit getter to retain its deferred error")
  }
  assert_true(!line.get_visible() && line.stale())
  line.set_ydata(@scene.LineData::Numeric([1.0, 0.0]))
  assert_true(!fig.to_svg_checked().contains("#b1cae3"))
  assert_true(line.stale())
  line.set_visible(true)
  assert_true(fig.to_svg_checked().contains("#b1cae3"))
  assert_true(!line.stale())
  assert_eq(line.y_values_checked().to_array(), [1.0, 0.0])
}
