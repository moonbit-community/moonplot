///|
test "root Line color preserves raw snapshots without consuming colors or pending data" {
  let fig = @mathplotlib.figure()
  let axes = fig.axes()
  axes.set_color_cycle(["#112233", "#445566"])
  let line : @mathplotlib.Line2D = fig.plot_line(
    @mathplotlib.LineData::Numeric([0.0, 1.0]),
    @mathplotlib.LineData::Numeric([2.0, 3.0]),
  )
  assert_eq(line.get_color(), "#112233")
  guard axes.artists()[0] is @mathplotlib.Artist::Line(_, initial_style) else {
    fail("expected the initial Line appearance")
  }
  let previous = line.xy_values_checked()
  line.set_ydata(@mathplotlib.LineData::Numeric([4.0, 5.0, 6.0]))
  line.set_linewidth(4.25)
  line.set_color("TAB:BLUE")
  assert_eq(line.get_color(), "TAB:BLUE")
  guard axes.artists()[0] is @mathplotlib.Artist::Line(points, current_style) else {
    fail("expected the raw current Line appearance")
  }
  assert_eq(current_style.color(), "TAB:BLUE")
  assert_eq(current_style.width(), 4.25)
  assert_eq(initial_style.color(), "#112233")
  assert_eq(initial_style.width(), 2.0)
  assert_eq(points[1].y(), 3.0)
  assert_eq(previous.to_array(), [0.0, 2.0, 1.0, 3.0])
  assert_eq(axes.data_limits(horizontal=false).upper(), 3.0)
  try line.set_color("") catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("'' is not a valid value for color"))
    _ => fail("expected the original color validation error")
  } noraise {
    _ => fail("an explicit empty color must fail")
  }
  assert_eq(line.get_color(), "TAB:BLUE")
  let next = axes.plot_line(
    @mathplotlib.LineData::Numeric([0.0, 1.0]),
    @mathplotlib.LineData::Numeric([1.0, 0.0]),
  )
  assert_eq(next.get_color(), "#445566")
  assert_eq(previous.to_array(), [0.0, 2.0, 1.0, 3.0])
  line.set_ydata(@mathplotlib.LineData::Numeric([4.0, 5.0]))
  assert_eq(line.y_values_checked().to_array(), [4.0, 5.0])
  assert_eq(current_style.color(), "TAB:BLUE")
  line.set_color("none")
  assert_eq(line.get_color(), "none")
  assert_eq(current_style.color(), "TAB:BLUE")
}
