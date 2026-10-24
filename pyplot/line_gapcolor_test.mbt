///|
fn line_gapcolor_pyplot_elements(svg : String) -> Array[String] {
  let values = []
  for index, element in svg.split("<polyline ").to_array() {
    if index > 0 && element.split_once("/>") is Some((attributes, _)) {
      values.push(attributes.to_owned())
    }
  }
  values
}

///|
test "pyplot optional gapcolor renders before foreground and None restores the single stroke" {
  @pyplot.close()
  defer @pyplot.close()
  let fig = @pyplot.figure()
  let axes = @pyplot.gca()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  let line = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([0.0, 1.0]),
    color="black",
  )
  assert_eq(line.get_gapcolor(), None)
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("blue"))
  line.set_color("red")
  line.set_alpha(Some(0.5))
  let striped = line_gapcolor_pyplot_elements(fig.to_svg_checked())
  assert_eq(striped.length(), 2)
  assert_true(striped[0].contains("stroke=\"rgba(0,0,255,0.5)\""))
  assert_true(striped[1].contains("stroke=\"rgba(255,0,0,0.5)\""))
  assert_eq(line.get_gapcolor(), Some("blue"))
  assert_true(!line.stale())
  line.set_gapcolor(None)
  assert_eq(line_gapcolor_pyplot_elements(fig.to_svg_checked()).length(), 1)
  assert_true(!line.stale())
  try line.set_gapcolor(Some("transparent")) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("not a valid value for color"))
    _ => fail("gap String setter must use native color validation")
  } noraise {
    _ => fail("expected native invalid transparent String")
  }
  assert_eq(line.get_gapcolor(), None)
  assert_eq(line.get_alpha(), Some(0.5))
  assert_true(!line.stale())
}
