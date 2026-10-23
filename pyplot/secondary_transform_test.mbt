///|
fn secondary_transform_pyplot_attribute(
  svg : String,
  label : String,
  attribute : String,
) -> String raise {
  let found : Array[String] = []
  for element in svg.split("<text ") {
    if element.contains(">" + label + "</text>") {
      let (_, attributes) = element.split_once(attribute + "=\"").unwrap()
      let (value, _) = attributes.split_once("\"").unwrap()
      found.push(value.to_owned())
    }
  }
  assert_eq(found.length(), 1)
  found[0]
}

///|
test "pyplot forwards both location affines and omitted None restores parent placement" {
  @pyplot.close()
  defer @pyplot.close()
  let fig = @pyplot.figure(width=320, height=240)
  let axes = @pyplot.axes(left=0.2, bottom=0.25, width=0.5, height=0.5)
  axes.set_x_limits(1.0, 4.0)
  axes.set_y_limits(10.0, 20.0)
  let supplied = @transforms.translation(15.0, 25.0)
  let x = @pyplot.secondary_xaxis(
    value => value,
    value => value,
    location=@scene.SecondaryAxisLocation::Position(0.25),
    transform=Some(supplied),
  )
  let y = @pyplot.secondary_yaxis(
    value => value,
    value => value,
    location=@scene.SecondaryAxisLocation::Position(0.25),
    transform=Some(supplied),
  )
  x.set_ticks([2.5])
  y.set_ticks([15.0])
  x.set_named_formatter(
    @ticker.FixedFormatter::new(["pyplot-affine-x"]).as_base_formatter(),
  )
  y.set_named_formatter(
    @ticker.FixedFormatter::new(["pyplot-affine-y"]).as_base_formatter(),
  )
  let svg = fig.to_svg_checked()
  assert_eq(
    secondary_transform_pyplot_attribute(svg, "pyplot-affine-x", "x"),
    144.0.to_string(),
  )
  assert_eq(
    secondary_transform_pyplot_attribute(svg, "pyplot-affine-x", "y"),
    232.75.to_string(),
  )
  assert_eq(
    secondary_transform_pyplot_attribute(svg, "pyplot-affine-y", "x"),
    7.25.to_string(),
  )
  assert_eq(
    secondary_transform_pyplot_attribute(svg, "pyplot-affine-y", "y"),
    123.0.to_string(),
  )
  x.set_location(@scene.SecondaryAxisLocation::Position(0.75))
  y.set_location(@scene.SecondaryAxisLocation::Position(0.75), transform=None)
  let cleared = fig.to_svg_checked()
  assert_eq(
    secondary_transform_pyplot_attribute(cleared, "pyplot-affine-x", "y"),
    108.0.to_string(),
  )
  assert_eq(
    secondary_transform_pyplot_attribute(cleared, "pyplot-affine-y", "x"),
    176.0.to_string(),
  )
  assert_true(x.alignment() is @scene.SecondaryAxisAlignment::Bottom)
  assert_true(y.alignment() is @scene.SecondaryAxisAlignment::Left)
}

///|
test "pyplot rejects nonseparable constructor affines without attaching a failed child" {
  @pyplot.close()
  defer @pyplot.close()
  let fig = @pyplot.figure(width=320, height=240)
  let axes = @pyplot.axes(left=0.2, bottom=0.25, width=0.5, height=0.5)
  axes.set_x_limits(1.0, 4.0)
  axes.set_y_limits(10.0, 20.0)
  let before = fig.to_svg_checked()
  let invalid = Some(
    @transforms.affine_from_values(1.0, 1.0, 1.0, 1.0, 0.0, 0.0),
  )
  try
    @pyplot.secondary_xaxis(
      value => value,
      value => value,
      location=@scene.SecondaryAxisLocation::Position(0.25),
      transform=invalid,
    )
  catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(
        message, "ValueError: Both *x_transform* and *y_transform* must be 2D affine transforms",
      )
    _ => fail("expected source affine constructor error")
  } noraise {
    _ => fail("expected source affine constructor error")
  }
  try
    @pyplot.secondary_yaxis(
      value => value,
      value => value,
      location=@scene.SecondaryAxisLocation::Position(0.25),
      transform=invalid,
    )
  catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(
        message, "ValueError: Both *x_transform* and *y_transform* must be 2D affine transforms",
      )
    _ => fail("expected source affine constructor error")
  } noraise {
    _ => fail("expected source affine constructor error")
  }
  try
    @pyplot.secondary_xaxis(
      value => value,
      value => value,
      location=@scene.SecondaryAxisLocation::Left,
      transform=invalid,
    )
  catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("secondary x axis location"))
    _ => fail("expected location validation before affine blend")
  } noraise {
    _ => fail("expected location validation before affine blend")
  }
  assert_eq(fig.to_svg_checked(), before)
  assert_eq(@pyplot.gcf().width(), 320)
  assert_eq(fig.axes_list().length(), 1)
  let valid = @pyplot.secondary_yaxis(
    value => value,
    value => value,
    transform=Some(@transforms.scaling(0.0, 0.0)),
  )
  valid.set_label("valid-after-failure")
  assert_true(fig.to_svg_checked().contains("valid-after-failure"))
}
