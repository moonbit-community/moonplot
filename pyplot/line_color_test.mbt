///|
fn line_color_pyplot_strokes(svg : String) -> Array[String] {
  let colors = []
  for index, element in svg.split("<polyline ").to_array() {
    if index == 0 {
      continue
    }
    if element.split_once("/>") is Some((attributes, _)) {
      let (_, remaining) = attributes.split_once("stroke=\"").unwrap()
      let (color, _) = remaining.split_once("\"").unwrap()
      colors.push(color.to_owned())
    }
  }
  colors
}

///|
test "pyplot source color preserves raw gray text and repeated valid color always marks stale" {
  @pyplot.close()
  defer @pyplot.close()
  let fig = @pyplot.figure()
  let axes = @pyplot.gca()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  let line = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([0.0, 1.0]),
    color="#123456",
  )
  line.set_color("0_0.5")
  assert_eq(line.get_color(), "0_0.5")
  assert_eq(line_color_pyplot_strokes(fig.to_svg_checked()), ["#808080"])
  assert_true(!line.stale())
  line.set_color("0_0.5")
  assert_true(line.stale())
  assert_eq(line_color_pyplot_strokes(fig.to_svg_checked()), ["#808080"])
  assert_true(!line.stale())
  assert_eq(line.xy_values_checked().to_array(), [0.0, 0.0, 1.0, 1.0])
}

///|
test "pyplot explicit empty color fails without taking the next local automatic color" {
  @pyplot.close()
  defer @pyplot.close()
  let fig = @pyplot.figure()
  let axes = @pyplot.gca()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_color_cycle(["#112233", "#445566"])
  let first = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([0.0, 1.0]),
  )
  ignore(fig.to_svg_checked())
  try first.set_color("") catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("'' is not a valid value for color"))
    _ => fail("expected source validation instead of old empty-color sentinel")
  } noraise {
    _ => fail("expected explicit empty color error")
  }
  assert_eq(first.get_color(), "#112233")
  assert_true(!first.stale())
  let second = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([1.0, 0.0]),
  )
  assert_eq(second.get_color(), "#445566")
  assert_eq(line_color_pyplot_strokes(fig.to_svg_checked()), [
    "#112233", "#445566",
  ])
}
