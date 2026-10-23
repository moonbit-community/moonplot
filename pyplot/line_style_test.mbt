///|
fn line_style_pyplot_elements(svg : String) -> Array[String] {
  let elements = []
  for index, element in svg.split("<polyline ").to_array() {
    if index > 0 && element.split_once("/>") is Some((attributes, _)) {
      elements.push(attributes.to_owned())
    }
  }
  elements
}

///|
test "pyplot Line String linestyle reaches SVG and None retains the public data lifecycle" {
  @pyplot.close()
  defer @pyplot.close()
  let saved_scale = @config.lines_scale_dashes()
  let saved_pattern = @config.lines_dotted_pattern()
  defer @config.set_lines_scale_dashes(saved_scale)
  defer @config.set_lines_dotted_pattern(saved_pattern)
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dotted_pattern([1.0, 2.0])
  let fig = @pyplot.figure()
  let axes = @pyplot.gca()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  let line = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([0.0, 1.0]),
    color="black",
  )
  assert_eq(line.get_linestyle(), "-")
  line.set_linewidth(2.0)
  line.set_linestyle("dotted")
  line.set_color("red")
  line.set_alpha(Some(0.5))
  let dotted = line_style_pyplot_elements(fig.to_svg_checked())
  assert_eq(dotted.length(), 1)
  assert_true(dotted[0].contains("stroke-dasharray=\"2,4\""))
  assert_true(dotted[0].contains("stroke=\"rgba(255,0,0,0.5)\""))
  assert_eq(line.get_linestyle(), ":")
  line.set_linestyle(" ")
  line.set_xdata(@scene.LineData::Numeric([0.25, 0.75]))
  assert_eq(line_style_pyplot_elements(fig.to_svg_checked()), [])
  assert_eq(line.x_values_checked().to_array(), [0.25, 0.75])
  assert_true(!line.stale())
  line.set_linestyle("solid")
  let solid = line_style_pyplot_elements(fig.to_svg_checked())
  assert_eq(solid.length(), 1)
  assert_true(!solid[0].contains("stroke-dash"))
  assert_eq(line.get_alpha(), Some(0.5))
}
