///|
test "root Line width and artist appearance snapshots share the current stable state" {
  let fig = @mathplotlib.figure()
  let axes = fig.axes()
  let line : @mathplotlib.Line2D = fig.plot_line(
    @mathplotlib.LineData::Numeric([0.0, 1.0]),
    @mathplotlib.LineData::Numeric([2.0, 3.0]),
    color="#13579b",
  )
  let previous_data = line.xy_values_checked()
  guard axes.artists()[0] is @mathplotlib.Artist::Line(_, previous_style) else {
    fail("expected the original Line appearance")
  }
  assert_eq(line.get_linewidth(), 2.0)
  line.set_ydata(@mathplotlib.LineData::Numeric([4.0, 5.0, 6.0]))
  line.set_linewidth(5.5)
  // A style query remains usable with pending incompatible original data.
  guard axes.artists()[0] is @mathplotlib.Artist::Line(points, current_style) else {
    fail("expected the current Line appearance")
  }
  assert_eq(line.get_linewidth(), 5.5)
  assert_eq(current_style.width(), 5.5)
  assert_eq(current_style.color(), "#13579b")
  assert_eq(previous_style.width(), 2.0)
  assert_eq(points.length(), 2)
  assert_eq(points[1].y(), 3.0)
  assert_eq(previous_data.to_array(), [0.0, 2.0, 1.0, 3.0])
  assert_eq(axes.data_limits(horizontal=false).upper(), 3.0)
  assert_true(line.stale())
  line.set_ydata(@mathplotlib.LineData::Numeric([4.0, 5.0]))
  assert_eq(line.y_values_checked().to_array(), [4.0, 5.0])
  assert_eq(previous_data.to_array(), [0.0, 2.0, 1.0, 3.0])
  assert_eq(previous_style.width(), 2.0)
}
