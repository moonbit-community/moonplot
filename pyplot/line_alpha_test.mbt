///|
fn line_alpha_pyplot_colors(svg : String) -> Array[String] {
  let colors = []
  for index, element in svg.split("<polyline ").to_array() {
    if index == 0 {
      continue
    }
    if element.split_once("/>") is Some((attributes, _)) {
      let (_, remaining) = attributes.split_once("stroke=\"").unwrap()
      colors.push(remaining.split_once("\"").unwrap().0.to_owned())
    }
  }
  colors
}

///|
test "pyplot alpha is raw optional state preserved through source color and width mutations" {
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
  assert_eq(line.get_alpha(), None)
  line.set_color("#0000")
  line.set_alpha(Some(0.5))
  line.set_linewidth(4.0)
  line.set_color("red")
  assert_eq(line.get_alpha(), Some(0.5))
  assert_eq(line_alpha_pyplot_colors(fig.to_svg_checked()), [
    "rgba(255,0,0,0.5)",
  ])
  assert_true(!line.stale())
  try line.set_alpha(Some(0.0 / 0.0)) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "ValueError: alpha (nan) is outside 0-1 range")
    _ => fail("expected native alpha validation before any state mutation")
  } noraise {
    _ => fail("expected invalid NaN alpha")
  }
  assert_eq(line.get_alpha(), Some(0.5))
  assert_true(!line.stale())
  line.set_alpha(None)
  assert_eq(line_alpha_pyplot_colors(fig.to_svg_checked()), ["#ff0000"])
  assert_eq(line.get_alpha(), None)
  assert_eq(line.get_color(), "red")
}
