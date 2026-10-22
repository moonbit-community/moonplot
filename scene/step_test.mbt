///|
test "step supports pre, post, and mid transitions" {
  let fig = @scene.figure(width=320, height=220)
  let ax = fig.axes()
  try! ax.step([0.0, 1.0, 2.0], [10.0, 20.0, 30.0], where_="pre")
  match ax.artists()[0] {
    @scene.Artist::Line(points, _) => {
      assert_eq(points.length(), 5)
      assert_eq(points[1].x(), 0.0)
      assert_eq(points[1].y(), 20.0)
      assert_eq(points[3].x(), 1.0)
      assert_eq(points[3].y(), 30.0)
    }
    _ => fail("expected a step line")
  }
  try! ax.step([0.0, 1.0, 2.0], [10.0, 20.0, 30.0], where_="post")
  match ax.artists()[1] {
    @scene.Artist::Line(points, _) => {
      assert_eq(points[1].x(), 1.0)
      assert_eq(points[1].y(), 10.0)
    }
    _ => fail("expected a post step line")
  }
  try! ax.step([0.0, 1.0, 2.0], [10.0, 20.0, 30.0], where_="mid")
  assert_true(fig.to_svg().contains("<polyline"))
}

///|
test "fill_betweenx and stairs render horizontal and filled steps" {
  let fig = @scene.figure(width=320, height=220)
  try! fig.fill_betweenx(
    [0.0, 1.0, 2.0],
    [0.0, 0.5, 0.0],
    right=[1.0, 1.5, 1.0],
    color="#123456",
  )
  try! fig.stairs(
    [1.0, 2.0, 1.5],
    edges=[0.0, 1.0, 2.0, 3.0],
    fill=true,
    color="#abcdef",
  )
  try! fig.stairs(
    [1.0, 2.0],
    edges=[0.0, 1.0, 2.0],
    orientation="horizontal",
    color="#fedcba",
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("#fedcba"))
  assert_true(svg.contains("<polygon"))
}

///|
test "step and stairs reject invalid controls" {
  let fig = @scene.figure()
  try fig.step([0.0], [1.0], where_="diagonal") catch {
    @core.DataError::InvalidReference(message~) =>
      assert_true(message.contains("pre"))
    _ => fail("expected invalid step mode")
  } noraise {
    _ => fail("expected invalid step mode")
  }
  try fig.stairs([1.0, 2.0], edges=[0.0, 1.0]) catch {
    @core.DataError::InvalidReference(message~) =>
      assert_true(message.contains("one more"))
    _ => fail("expected invalid stairs edges")
  } noraise {
    _ => fail("expected invalid stairs edges")
  }
}
