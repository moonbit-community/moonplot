///|
test "parse hexadecimal and named colors" {
  let purple = try! @colors.parse_color("#8040ff")
  assert_true(purple.red() == 128.0 / 255.0)
  assert_true(purple.green() == 64.0 / 255.0)
  assert_true(purple.blue() == 1.0)
  assert_eq(purple.to_css(), "#8040ff")
  assert_eq(@colors.parse_color("transparent").to_css(), "rgba(0,0,0,0)")
}

///|
test "color parser rejects invalid values" {
  try @colors.parse_color("#12") catch {
    @colors.ColorError::InvalidColor(value) => assert_eq(value, "#12")
    _ => fail("expected InvalidColor")
  } noraise {
    _ => fail("expected a color error")
  }
  try @colors.rgba(2.0, 0.0, 0.0) catch {
    @colors.ColorError::ComponentOutOfRange(value) => assert_eq(value, "red")
    _ => fail("expected ComponentOutOfRange")
  } noraise {
    _ => fail("expected a color error")
  }
}

///|
test "RGBA alpha scaling preserves color and validates the factor" {
  let color = try! @colors.rgba(0.25, 0.5, 0.75, alpha=0.8)
  let scaled = try! color.scale_alpha(0.5)
  assert_eq(scaled.red(), 0.25)
  assert_eq(scaled.green(), 0.5)
  assert_eq(scaled.blue(), 0.75)
  assert_eq(scaled.alpha(), 0.4)
  try color.scale_alpha(1.5) catch {
    @colors.ColorError::ComponentOutOfRange(component) =>
      assert_eq(component, "alpha")
    _ => fail("expected an invalid alpha factor")
  } noraise {
    _ => fail("expected an invalid alpha factor")
  }
}

///|
test "builtin colormaps interpolate and clamp" {
  let gray = try! @colors.colormap("gray")
  assert_eq(gray.name(), "gray")
  assert_eq(gray.sample(0.0).to_css(), "#000000")
  assert_eq(gray.sample(1.0).to_css(), "#ffffff")
  assert_eq(gray.sample(-1.0).to_css(), "#000000")
  assert_eq(gray.sample(2.0).to_css(), "#ffffff")
  let viridis = try! @colors.colormap("Viridis")
  assert_true(viridis.sample(0.5).to_css() != "#000000")
}

///|
test "colormap lookup and custom construction validate names and stops" {
  match @colors.find_colormap("missing") {
    None => ()
    Some(_) => fail("unknown colormap should not resolve")
  }
  try @colors.colormap("missing") catch {
    @colors.ColorError::InvalidColorMap(value) => assert_eq(value, "missing")
    _ => fail("expected an invalid colormap error")
  } noraise {
    _ => fail("expected a colormap error")
  }
  let custom = try! @colors.custom_colormap("custom", [
    try! @colors.rgba(1.0, 0.0, 0.0),
    try! @colors.rgba(0.0, 0.0, 1.0),
  ])
  assert_eq(custom.sample(0.0).to_css(), "#ff0000")
  assert_eq(custom.sample(1.0).to_css(), "#0000ff")
}

///|
test "listed colormap selects discrete entries" {
  let listed = try! @colors.listed_colormap("traffic", [
    try! @colors.rgba(1.0, 0.0, 0.0),
    try! @colors.rgba(1.0, 1.0, 0.0),
    try! @colors.rgba(0.0, 1.0, 0.0),
  ])
  assert_true(listed.is_discrete())
  assert_eq(listed.sample(0.0).to_css(), "#ff0000")
  assert_eq(listed.sample(0.4).to_css(), "#ffff00")
  assert_eq(listed.sample(1.0).to_css(), "#00ff00")
}

///|
test "colormap supports under, over, and bad colors" {
  let cmap = try! @colors.colormap("gray")
  cmap.set_under(try! @colors.rgba(1.0, 0.0, 0.0))
  cmap.set_over(try! @colors.rgba(0.0, 1.0, 0.0))
  cmap.set_bad(try! @colors.rgba(0.0, 0.0, 1.0))
  assert_eq(cmap.sample_extended(-0.1).to_css(), "#ff0000")
  assert_eq(cmap.sample_extended(1.1).to_css(), "#00ff00")
  assert_eq(cmap.sample_extended(@double.not_a_number).to_css(), "#0000ff")
}
