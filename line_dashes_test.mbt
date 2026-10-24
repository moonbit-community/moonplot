///|
test "root custom dashes are a pure tuple snapshot and empty input keeps pending data deferred" {
  let fig = @mathplotlib.figure()
  let axes = fig.axes()
  let line = axes.plot_line(
    @mathplotlib.LineData::Numeric([0.0, 1.0]),
    @mathplotlib.LineData::Numeric([2.0, 3.0]),
  )
  line.set_color("red")
  line.set_gapcolor(Some("blue"))
  line.set_alpha(Some(0.5))
  line.set_drawstyle("steps-post")
  line.set_linewidth(2.0)
  let install : (Array[Double]) -> Unit = values => line.set_dashes(values)
  let input = [1.0, 3.0]
  install(input)
  input[0] = 99.0
  input.push(5.0)
  assert_eq(line.get_linestyle(), "--")
  assert_true(line.is_dashed())
  guard axes.artists()[0] is @mathplotlib.Artist::Line(_, captured) else {
    fail("expected Line appearance")
  }
  assert_eq(captured.line_stroke().dash_sequence(), Some([2.0, 6.0]))
  let svg = fig.to_svg_checked()
  assert_true(svg.contains("stroke-dasharray=\"6,2\""))
  assert_true(svg.contains("stroke-dasharray=\"2,6\""))
  assert_true(!line.stale())
  line.set_ydata(@mathplotlib.LineData::Numeric([4.0, 5.0, 6.0]))
  install([])
  assert_true(line.stale() && !line.is_dashed())
  assert_eq(line.get_linestyle(), "-")
  assert_eq(line.get_gapcolor(), Some("blue"))
  assert_eq(line.get_alpha(), Some(0.5))
  assert_eq(line.get_color(), "red")
  guard axes.artists()[0] is @mathplotlib.Artist::Line(points, solid) else {
    fail("expected pure appearance query before pending data conversion")
  }
  assert_eq(points.length(), 3)
  assert_eq(solid.line_stroke().dash_sequence(), None)
  assert_eq(captured.line_stroke().dash_sequence(), Some([2.0, 6.0]))
  line.set_linewidth(0.0 / 0.0)
  install([])
  guard axes.artists()[0] is @mathplotlib.Artist::Line(_, nonfinite) else {
    fail("expected solid stroke with the ordinary scaling stage")
  }
  assert_true(nonfinite.line_stroke().dash_offset().is_nan())
  assert_eq(nonfinite.line_stroke().dash_sequence(), None)
  try line.path_values_checked() catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("expected unchanged deferred shape error")
  } noraise {
    _ => fail("set_dashes must not consume pending data")
  }
  line.set_ydata(@mathplotlib.LineData::Numeric([4.0, 5.0]))
  assert_eq(line.path_values_checked().to_array(), [
    0.0, 4.0, 1.0, 4.0, 1.0, 5.0,
  ])
}
