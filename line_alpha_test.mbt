///|
test "root Line alpha is retained by raw appearance snapshots and independent style edits" {
  let transported = @mathplotlib.style("#abcdef", line_alpha=Some(0.25))
  assert_eq(transported.line_alpha(), Some(0.25))
  let fig = @mathplotlib.figure()
  let axes = fig.axes()
  let line : @mathplotlib.Line2D = fig.plot_line(
    @mathplotlib.LineData::Numeric([0.0, 1.0]),
    @mathplotlib.LineData::Numeric([2.0, 3.0]),
    color="#123456",
  )
  assert_eq(line.get_alpha(), None)
  guard axes.artists()[0] is @mathplotlib.Artist::Line(_, initial_style) else {
    fail("expected the initial Line appearance")
  }
  let previous_data = line.xy_values_checked()
  line.set_alpha(Some(0.375))
  assert_eq(line.get_alpha(), Some(0.375))
  line.set_ydata(@mathplotlib.LineData::Numeric([4.0, 5.0, 6.0]))
  line.set_linewidth(5.25)
  line.set_color("tab:blue")
  guard axes.artists()[0] is @mathplotlib.Artist::Line(points, current_style) else {
    fail("expected the current raw Line appearance")
  }
  assert_eq(current_style.line_alpha(), Some(0.375))
  assert_eq(current_style.color(), "tab:blue")
  assert_eq(current_style.width(), 5.25)
  assert_eq(initial_style.line_alpha(), None)
  assert_eq(points[1].y(), 3.0)
  assert_eq(previous_data.to_array(), [0.0, 2.0, 1.0, 3.0])
  assert_eq(axes.data_limits(horizontal=false).upper(), 3.0)
  try line.set_alpha(Some(1.0 / 0.0)) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "ValueError: alpha (inf) is outside 0-1 range")
    _ => fail("expected the original alpha range error")
  } noraise {
    _ => fail("an infinite alpha must fail")
  }
  assert_eq(line.get_alpha(), Some(0.375))
  assert_eq(line.get_color(), "tab:blue")
  assert_eq(line.get_linewidth(), 5.25)
  line.set_alpha(None)
  assert_eq(line.get_alpha(), None)
  assert_eq(current_style.line_alpha(), Some(0.375))
  line.set_ydata(@mathplotlib.LineData::Numeric([4.0, 5.0]))
  assert_eq(line.y_values_checked().to_array(), [4.0, 5.0])
  assert_eq(previous_data.to_array(), [0.0, 2.0, 1.0, 3.0])
}
