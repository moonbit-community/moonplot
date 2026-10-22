///|
test "arrow renders a line and filled head" {
  let fig = @scene.figure(width=320, height=240)
  try! fig.arrow(
    0.0,
    0.0,
    1.0,
    0.5,
    color="#123456",
    linewidth=1.25,
    head_length=0.2,
    head_width=0.15,
    label="direction",
  )
  assert_eq(fig.artists().length(), 2)
  let svg = fig.to_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("<polygon"))
  assert_true(svg.contains("direction"))
}

///|
test "annotate places text and points an optional arrow at the target" {
  let fig = @scene.figure(width=320, height=240)
  try! fig.annotate(
    "peak",
    1.0,
    2.0,
    offset_x=0.4,
    offset_y=0.3,
    arrow=true,
    color="#111111",
    arrowcolor="#abcdef",
  )
  assert_eq(fig.artists().length(), 3)
  let svg = fig.to_svg()
  assert_true(svg.contains("peak"))
  assert_true(svg.contains("#111111"))
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("<polygon"))
}

///|
test "arrow and annotate validate finite coordinates and styles" {
  let fig = @scene.figure()
  try fig.arrow(0.0, 0.0, 1.0, 1.0, linewidth=-1.0) catch {
    @core.DataError::InvalidAnnotation(message~) =>
      assert_true(message.contains("linewidth"))
    _ => fail("expected an annotation style error")
  } noraise {
    _ => fail("expected an annotation style error")
  }
  try fig.annotate("bad", 0.0 / 0.0, 1.0) catch {
    @core.DataError::InvalidAnnotation(message~) =>
      assert_true(message.contains("finite"))
    _ => fail("expected an annotation coordinate error")
  } noraise {
    _ => fail("expected an annotation coordinate error")
  }
  try fig.arrow(0.0, 0.0, 1.0, 1.0, head_width=-0.1) catch {
    @core.DataError::InvalidAnnotation(message~) =>
      assert_true(message.contains("head width"))
    _ => fail("expected an arrow head error")
  } noraise {
    _ => fail("expected an arrow head error")
  }
}

///|
test "annotate supports axes and figure coordinates with display connectors" {
  let fig = @scene.figure(width=360, height=260)
  try! fig.plot([0.0, 1.0], [0.0, 1.0])
  try! fig.annotate(
    "screen",
    0.25,
    0.75,
    offset_x=36.0,
    offset_y=18.0,
    arrow=true,
    arrowcolor="#abcdef",
    xycoords="axes fraction",
    textcoords="offset points",
    connector="arc3",
  )
  assert_eq(fig.artists().length(), 2)
  let svg = fig.to_svg()
  assert_true(svg.contains("screen"))
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("<path"))
  assert_true(svg.contains("<polygon"))

  try! fig.annotate(
    "figure label",
    0.1,
    0.9,
    xycoords="figure fraction",
    textcoords="figure fraction",
  )
  assert_eq(fig.artists().length(), 3)
}

///|
test "annotate validates coordinate and connector modes" {
  let fig = @scene.figure()
  try fig.annotate("bad", 0.0, 0.0, xycoords="screen") catch {
    @core.DataError::InvalidAnnotation(message~) =>
      assert_true(message.contains("xycoords"))
    _ => fail("expected an annotation coordinate error")
  } noraise {
    _ => fail("expected an annotation coordinate error")
  }
  try fig.annotate("bad", 0.0, 0.0, connector="bezier") catch {
    @core.DataError::InvalidAnnotation(message~) =>
      assert_true(message.contains("connector"))
    _ => fail("expected an annotation connector error")
  } noraise {
    _ => fail("expected an annotation connector error")
  }
}

///|
test "annotate supports display coordinates and pixel offsets" {
  let fig = @scene.figure(width=360, height=260)
  try! fig.annotate(
    "display",
    40.0,
    50.0,
    offset_x=18.0,
    offset_y=12.0,
    xycoords="display",
    textcoords="offset pixels",
    connector="straight",
    arrow=true,
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("display"))
  assert_true(svg.contains("<path"))
  try fig.annotate("bad", 0.0, 0.0, xycoords="offset pixels") catch {
    @core.DataError::InvalidAnnotation(message~) =>
      assert_true(message.contains("offset mode"))
    _ => fail("expected offset anchor error")
  } noraise {
    _ => fail("expected offset anchor error")
  }
}
