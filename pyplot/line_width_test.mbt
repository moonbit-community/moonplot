///|
fn line_width_pyplot_widths(svg : String, color : String) -> Array[String] {
  let widths = []
  for index, element in svg.split("<polyline ").to_array() {
    if index == 0 {
      continue
    }
    if element.split_once("/>") is Some((attributes, _)) &&
      attributes.contains("stroke=\"" + color + "\"") {
      let (_, remaining) = attributes.split_once("stroke-width=\"").unwrap()
      let (value, _) = remaining.split_once("\"").unwrap()
      widths.push(value.to_owned())
    }
  }
  widths
}

///|
test "pyplot-created Line exposes mutable width and same-value clean state after drawing" {
  @pyplot.close()
  defer @pyplot.close()
  let fig = @pyplot.figure()
  let axes = @pyplot.gca()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  let line = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([0.0, 1.0]),
    color="#abcdef",
  )
  assert_eq(line.get_linewidth(), 2.0)
  assert_eq(line_width_pyplot_widths(fig.to_svg_checked(), "#abcdef"), ["2"])
  assert_true(!line.stale())
  line.set_linewidth(5.5)
  assert_eq(line.get_linewidth(), 5.5)
  assert_true(line.stale())
  assert_eq(line_width_pyplot_widths(fig.to_svg_checked(), "#abcdef"), ["5.5"])
  assert_true(!line.stale())
  line.set_linewidth(5.5)
  assert_true(!line.stale())
  assert_eq(line.xy_values_checked().to_array(), [0.0, 0.0, 1.0, 1.0])
  assert_eq(axes.artists().length(), 1)
}
