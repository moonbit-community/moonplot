///|
fn line_dashes_pyplot_elements(svg : String) -> Array[String] {
  let values = []
  for index, element in svg.split("<polyline ").to_array() {
    if index > 0 && element.split_once("/>") is Some((attributes, _)) {
      values.push(attributes.to_owned())
    }
  }
  values
}

///|
test "pyplot pure set_dashes snapshots tuple-profile values and empty input restores solid" {
  @pyplot.close()
  defer @pyplot.close()
  let saved_scale = @config.lines_scale_dashes()
  defer @config.set_lines_scale_dashes(saved_scale)
  @config.set_lines_scale_dashes(false)
  let fig = @pyplot.figure()
  let axes = @pyplot.gca()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  let line = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([0.0, 1.0]),
    color="red",
  )
  let values = [2.0, 1.0]
  line.set_dashes(values)
  values.clear()
  assert_eq(line.get_linestyle(), "--")
  assert_true(line.is_dashed())
  let custom = line_dashes_pyplot_elements(fig.to_svg_checked())
  assert_eq(custom.length(), 1)
  assert_true(custom[0].contains("stroke-dasharray=\"2,1\""))
  assert_true(!line.stale())
  line.set_dashes([])
  assert_eq(line.get_linestyle(), "-")
  assert_true(!line.is_dashed())
  assert_true(line.stale())
  let solid = line_dashes_pyplot_elements(fig.to_svg_checked())
  assert_eq(solid.length(), 1)
  assert_true(!solid[0].contains("stroke-dash"))
  assert_true(!line.stale())
}
