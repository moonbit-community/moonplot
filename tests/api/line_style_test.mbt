///|
test "root linestyle keeps copied stroke snapshots through independent appearance and data edits" {
  let input = [1.0, 3.0]
  let stroke : @mathplotlib.LineStroke = @mathplotlib.line_stroke(
    "--",
    offset=-0.0,
    dashes=Some(input),
  )
  let lowlevel = @mathplotlib.style("red", line_stroke=stroke)
  input[0] = 99.0
  assert_eq(lowlevel.line_stroke().dash_sequence(), Some([1.0, 3.0]))
  let copy = stroke.dash_sequence().unwrap()
  copy[0] = 88.0
  assert_eq(stroke.dash_sequence(), Some([1.0, 3.0]))
  assert_eq(stroke.dash_offset().reinterpret_as_uint64(), 0x8000000000000000UL)
  let fig = @mathplotlib.figure()
  let axes = fig.axes()
  let line = axes.plot_line(
    @mathplotlib.LineData::Numeric([0.0, 1.0]),
    @mathplotlib.LineData::Numeric([2.0, 3.0]),
  )
  assert_eq(line.get_linestyle(), "-")
  line.set_linestyle("dashed")
  guard axes.artists()[0] is @mathplotlib.Artist::Line(_, previous) else {
    fail("expected Line appearance")
  }
  assert_eq(previous.line_stroke().linestyle(), "--")
  assert_eq(previous.line_stroke().dash_sequence(), Some([7.4, 3.2]))
  line.set_alpha(Some(0.4))
  line.set_color("tab:blue")
  line.set_ydata(@mathplotlib.LineData::Numeric([4.0, 5.0, 6.0]))
  line.set_linewidth(4.0)
  assert_eq(line.get_linestyle(), "--")
  guard axes.artists()[0] is @mathplotlib.Artist::Line(points, current) else {
    fail("expected current raw appearance without data recache")
  }
  assert_eq(points[1].y(), 3.0)
  assert_eq(current.line_stroke().dash_sequence(), Some([14.8, 6.4]))
  assert_eq(current.line_alpha(), Some(0.4))
  assert_eq(current.color(), "tab:blue")
  assert_eq(previous.line_stroke().dash_sequence(), Some([7.4, 3.2]))
  assert_eq(previous.line_alpha(), None)
  try line.set_linestyle("Solid") catch {
    @mathplotlib.DataError::InvalidTicks(message~) =>
      assert_eq(
        message, "ValueError: 'Solid' is not a valid value for ls. Did you mean: 'solid'?",
      )
    _ => fail("expected invalid linestyle")
  } noraise {
    _ => fail("case-sensitive linestyle must fail")
  }
  assert_eq(line.get_linestyle(), "--")
  line.set_linestyle("none")
  assert_eq(line.get_linestyle(), "None")
  assert_eq(current.line_stroke().linestyle(), "--")
  line.set_ydata(@mathplotlib.LineData::Numeric([4.0, 5.0]))
  assert_eq(line.y_values_checked().to_array(), [4.0, 5.0])
}
