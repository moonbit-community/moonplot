///|
test "root gapcolor keeps raw spelling and appearance snapshots without consuming pending path data" {
  let metadata = @mathplotlib.style("blue", line_gapcolor=Some("red"))
  assert_eq(metadata.line_gapcolor(), Some("red"))
  let fig = @mathplotlib.figure()
  let axes = fig.axes()
  let line = axes.plot_line(
    @mathplotlib.LineData::Numeric([0.0, 1.0]),
    @mathplotlib.LineData::Numeric([2.0, 3.0]),
  )
  assert_eq(line.get_gapcolor(), None)
  assert_true(!line.is_dashed())
  guard axes.artists()[0] is @mathplotlib.Artist::Line(_, initial) else {
    fail("expected initial Line appearance")
  }
  line.set_gapcolor(Some("RED"))
  line.set_alpha(Some(0.5))
  line.set_color("tab:blue")
  line.set_linewidth(3.0)
  line.set_linestyle("dashed")
  line.set_drawstyle("steps-mid")
  ignore(fig.to_svg_checked())
  assert_true(!line.stale() && line.is_dashed())
  assert_eq(line.get_gapcolor(), Some("RED"))
  line.set_gapcolor(Some("RED"))
  assert_true(line.stale())
  guard axes.artists()[0] is @mathplotlib.Artist::Line(_, colored) else {
    fail("expected current Line appearance")
  }
  assert_eq(initial.line_gapcolor(), None)
  assert_eq(colored.line_gapcolor(), Some("RED"))
  assert_eq(colored.line_alpha(), Some(0.5))
  assert_eq(
    colored.line_stroke().dash_sequence(),
    Some([11.100000000000001, 4.800000000000001]),
  )
  line.set_ydata(@mathplotlib.LineData::Numeric([4.0, 5.0, 6.0]))
  line.set_gapcolor(None)
  assert_eq(line.get_gapcolor(), None)
  try line.set_gapcolor(Some("")) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(
        message.has_prefix("ValueError: '' is not a valid value for color:"),
      )
    _ => fail("expected source color validation before a path refresh")
  } noraise {
    _ => fail("empty String gapcolor must fail")
  }
  assert_eq(line.get_gapcolor(), None)
  assert_eq(line.get_drawstyle(), "steps-mid")
  assert_eq(line.get_linestyle(), "--")
  assert_eq(line.get_color(), "tab:blue")
  assert_eq(line.get_alpha(), Some(0.5))
  assert_eq(colored.line_gapcolor(), Some("RED"))
  guard axes.artists()[0] is @mathplotlib.Artist::Line(points, current) else {
    fail("expected a pure appearance query with pending invalid data")
  }
  assert_eq(points.length(), 4)
  assert_eq(current.line_gapcolor(), None)
  line.set_linewidth(0.0)
  assert_true(line.is_dashed())
  line.set_linestyle("None")
  assert_true(!line.is_dashed())
  line.set_ydata(@mathplotlib.LineData::Numeric([4.0, 5.0]))
  assert_eq(line.y_values_checked().to_array(), [4.0, 5.0])
}
