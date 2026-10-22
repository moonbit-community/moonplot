///|
test "spy renders nonzero matrix cells as points" {
  let fig = @scene.figure(width=320, height=240)
  try! fig.spy(
    [[0.0, 1.0, 0.0], [2.0, 0.0, -3.0]],
    precision=0.5,
    color="#123456",
    label="sparse",
  )
  let artists = fig.artists()
  assert_eq(artists.length(), 1)
  let svg = fig.to_svg()
  assert_true(svg.contains("<circle"))
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("sparse"))
}

///|
test "spy validates matrix shape and precision" {
  let fig = @scene.figure()
  try fig.spy([[1.0, 0.0], [1.0]]) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("equal length"))
    _ => fail("expected a spy shape error")
  } noraise {
    _ => fail("expected a spy shape error")
  }
  try fig.spy([[1.0]], precision=-1.0) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("precision"))
    _ => fail("expected a spy precision error")
  } noraise {
    _ => fail("expected a spy precision error")
  }
}

///|
test "spy supports marker size and lower origin" {
  let fig = @scene.figure()
  try! fig.spy([[1.0, 0.0], [0.0, 2.0]], markersize=5.0, origin="lower")
  assert_true(fig.axes().aspect_equal())
  match fig.artists()[0] {
    @scene.Artist::Scatter(points, style) => {
      assert_eq(points[0].y(), 0.0)
      assert_eq(points[1].y(), 1.0)
      assert_eq(style.radius(), 5.0)
    }
    _ => fail("expected a scatter artist")
  }
}

///|
test "spy supports automatic aspect" {
  let fig = @scene.figure()
  fig.set_aspect_equal()
  try! fig.spy([[1.0]], aspect="auto")
  assert_true(!fig.axes().aspect_equal())
}

///|
test "spy renders common marker shapes" {
  let square = @scene.figure()
  try! square.spy([[1.0]], marker="s")
  assert_true(square.to_svg().contains("<rect"))

  let triangle = @scene.figure()
  try! triangle.spy([[1.0]], marker="^")
  assert_true(triangle.to_svg().contains("<polygon"))

  let cross = @scene.figure()
  try! cross.spy([[1.0]], marker="x")
  assert_true(cross.to_svg().contains("<path"))

  let plus = @scene.figure()
  try! plus.spy([[1.0]], marker="+")
  assert_true(plus.to_svg().contains("<path"))
}

///|
test "spy validates marker size and origin" {
  let fig = @scene.figure()
  try fig.spy([[1.0]], markersize=0.0) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("markersize"))
    _ => fail("expected a spy marker size error")
  } noraise {
    _ => fail("expected a spy marker size error")
  }
  try fig.spy([[1.0]], origin="center") catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("origin"))
    _ => fail("expected a spy origin error")
  } noraise {
    _ => fail("expected a spy origin error")
  }
  try fig.spy([[1.0]], aspect="square") catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("aspect"))
    _ => fail("expected a spy aspect error")
  } noraise {
    _ => fail("expected a spy aspect error")
  }
  try fig.spy([[1.0]], marker="invalid") catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("marker"))
    _ => fail("expected a spy marker error")
  } noraise {
    _ => fail("expected a spy marker error")
  }
}
