///|
test "public Line handle reexports preserve late data and retained views through SVG" {
  let fig = @mathplotlib.figure(width=200, height=200)
  let axes = fig.axes()
  axes.set_x_limits(0.0, 2.0)
  axes.set_y_limits(0.0, 10.0)
  let line : @mathplotlib.Line2D = fig.plot_line(
    @mathplotlib.LineData::Numeric([0.0, 1.0]),
    @mathplotlib.LineData::Numeric([0.0, 10.0]),
    color="#123456",
    label="mutable line",
  )
  let old_x = line.x_values_checked()
  ignore(fig.to_svg_checked())
  assert_true(!line.stale())
  let incoming = [10.0, 0.0]
  line.set_data(
    @mathplotlib.LineData::Numeric([0.0, 2.0]),
    @mathplotlib.LineData::Numeric(incoming),
  )
  incoming[0] = -100.0
  let (_, original_y) = line.get_data()
  guard original_y is @mathplotlib.LineData::Numeric(stored_y) else {
    fail("expected Numeric data")
  }
  assert_eq(stored_y, [10.0, 0.0])
  assert_true(line.stale())
  assert_eq(axes.data_limits().upper(), 1.0)
  let svg = fig.to_svg_checked()
  assert_true(svg.contains("points=\"56,56 144,144\""))
  assert_true(svg.contains("#123456"))
  assert_true(!line.stale())
  assert_eq(old_x.to_array(), [0.0, 1.0])
  assert_eq(line.xy_values_checked().to_array(), [0.0, 10.0, 2.0, 0.0])
  assert_eq(axes.data_limits().upper(), 1.0)
  axes.relim_checked()
  assert_eq(axes.data_limits().upper(), 2.0)
  assert_eq(fig.legend_entries()[0].label(), "mutable line")
}
