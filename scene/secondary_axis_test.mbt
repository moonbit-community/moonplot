///|
test "secondary axes render transformed ticks and labels" {
  let fig = @scene.figure(width=360, height=240)
  try! fig.set_bounds(@core.bounds(0.0, 2.0, 0.0, 1.0))
  let x_axis = try! fig.secondary_xaxis(x => x * 2.0, x => x / 2.0)
  x_axis.set_label("double x")
  try! x_axis.set_ticks([0.0, 2.0, 4.0])
  let y_axis = try! fig.secondary_yaxis(y => y + 10.0, y => y - 10.0)
  y_axis.set_label("shifted y")
  let svg = fig.to_svg()
  assert_true(svg.contains("double x"))
  assert_true(svg.contains("shifted y"))
  assert_true(svg.contains(">4<"))
  assert_true(svg.contains(">11<"))
}

///|
test "multiple secondary axes render independently" {
  let fig = @scene.figure(width=420, height=280)
  try! fig.set_bounds(@core.bounds(0.0, 2.0, 0.0, 2.0))
  let x_top = try! fig.secondary_xaxis(x => x * 2.0, x => x / 2.0)
  x_top.set_label("x double")
  try! x_top.set_ticks([0.0, 2.0, 4.0])
  let x_bottom = try! fig.secondary_xaxis(
    x => x + 10.0,
    x => x - 10.0,
    location=@scene.SecondaryAxisLocation::Bottom,
  )
  x_bottom.set_label("x shifted")
  try! x_bottom.set_ticks([10.0, 11.0, 12.0])
  let y_left = try! fig.secondary_yaxis(
    y => y * 3.0,
    y => y / 3.0,
    location=@scene.SecondaryAxisLocation::Left,
  )
  y_left.set_label("y triple")
  let y_right = try! fig.secondary_yaxis(y => y + 20.0, y => y - 20.0)
  y_right.set_label("y shifted")
  let svg = fig.to_svg()
  assert_true(svg.contains("x double"))
  assert_true(svg.contains("x shifted"))
  assert_true(svg.contains("y triple"))
  assert_true(svg.contains("y shifted"))
  assert_true(svg.contains(">12<"))
  assert_true(svg.contains(">20<"))
}

///|
test "secondary axis validates explicit ticks" {
  let fig = @scene.figure()
  let axis = try! fig.secondary_xaxis(x => x, x => x)
  try axis.set_ticks([0.0 / 0.0]) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("finite"))
    _ => fail("expected invalid secondary tick error")
  } noraise {
    _ => fail("expected a tick error")
  }
}

///|
test "secondary axes reject locations on the wrong coordinate" {
  let fig = @scene.figure()
  try
    fig.secondary_xaxis(
      x => x,
      x => x,
      location=@scene.SecondaryAxisLocation::Left,
    )
  catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("x axis location"))
    _ => fail("expected an x-axis location error")
  } noraise {
    _ => fail("expected an x-axis location error")
  }
  try
    fig.secondary_yaxis(
      y => y,
      y => y,
      location=@scene.SecondaryAxisLocation::Top,
    )
  catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("y axis location"))
    _ => fail("expected a y-axis location error")
  } noraise {
    _ => fail("expected a y-axis location error")
  }
}

///|
test "secondary axes use independent locators and formatters" {
  let fig = @scene.figure(width=420, height=280)
  try! fig.set_bounds(@core.bounds(0.0, 2.0, 0.0, 1.0))
  let axis = try! fig.secondary_xaxis(x => x * x, x => x.sqrt())
  try! axis.set_locator(@ticker.linear_locator(count=5))
  axis.set_formatter(@ticker.format_str_formatter("s=%.0f"))
  let svg = fig.to_svg()
  assert_true(svg.contains(">s=0<"))
  assert_true(svg.contains(">s=1<"))
  assert_true(svg.contains(">s=2<"))
  assert_true(svg.contains(">s=3<"))
  assert_true(svg.contains(">s=4<"))
}

///|
test "secondary axis locator and formatter values are isolated copies" {
  let fig = @scene.figure()
  let axis = try! fig.secondary_xaxis(x => x, x => x)
  let locator_values = [1.0, 2.0]
  try! axis.set_locator(try! @ticker.fixed_locator(locator_values))
  locator_values[0] = 99.0
  match axis.locator() {
    Some(@ticker.Locator::Fixed(values)) => assert_eq(values, [1.0, 2.0])
    _ => fail("expected a fixed locator")
  }
  let returned_locator = axis.locator()
  match returned_locator {
    Some(@ticker.Locator::Fixed(values)) => {
      values[0] = 77.0
      assert_eq(values, [77.0, 2.0])
    }
    _ => fail("expected a fixed locator")
  }
  match axis.locator() {
    Some(@ticker.Locator::Fixed(values)) => assert_eq(values, [1.0, 2.0])
    _ => fail("expected a fixed locator")
  }
  let formatter_labels = ["one", "two"]
  axis.set_formatter(@ticker.fixed_formatter(formatter_labels))
  formatter_labels[0] = "changed"
  match axis.formatter() {
    Some(@ticker.Formatter::Fixed(labels)) => assert_eq(labels, ["one", "two"])
    _ => fail("expected a fixed formatter")
  }
}
