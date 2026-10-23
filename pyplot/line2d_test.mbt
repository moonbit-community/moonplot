///|
test "pyplot Line handle defers shape failure and recovers for the same active Axes" {
  @pyplot.close()
  defer @pyplot.close()
  let fig = @pyplot.figure(width=200, height=200)
  let line = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([2.0, 3.0]),
    color="#654321",
    label="pyplot handle",
  )
  let old_y = line.y_values_checked()
  line.set_xdata(@scene.LineData::Numeric([0.0, 1.0, 2.0]))
  assert_eq(line.y_values_checked().to_array(), [2.0, 3.0])
  try fig.to_svg_checked() catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("expected deferred shape error")
  } noraise {
    _ => fail("expected deferred shape error")
  }
  assert_true(line.stale())
  assert_eq(old_y.to_array(), [2.0, 3.0])
  line.set_ydata(@scene.LineData::Numeric([3.0, 4.0, 5.0]))
  let svg = fig.to_svg_checked()
  assert_true(svg.contains("#654321"))
  assert_true(!line.stale())
  assert_eq(line.x_values_checked().to_array(), [0.0, 1.0, 2.0])
  assert_eq(line.y_values_checked().to_array(), [3.0, 4.0, 5.0])
  assert_eq(old_y.to_array(), [2.0, 3.0])
  assert_eq(fig.artists().length(), 1)
  assert_eq(fig.legend_entries()[0].label(), "pyplot handle")
}
