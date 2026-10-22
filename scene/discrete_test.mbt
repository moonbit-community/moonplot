///|
test "stem draws stems, baseline, and head markers" {
  let fig = @scene.figure(width=320, height=220)
  try! fig.stem([1.0, 2.0, 1.5], locs=[0.0, 1.0, 2.0], color="#123456")
  assert_eq(fig.artists().length(), 5)
  match fig.artists()[0] {
    @scene.Artist::Line(points, _) => {
      assert_eq(points[0].x(), 0.0)
      assert_eq(points[0].y(), 0.0)
      assert_eq(points[1].y(), 1.0)
    }
    _ => fail("expected a stem line")
  }
  match fig.artists()[4] {
    @scene.Artist::Scatter(points, _) => assert_eq(points.length(), 3)
    _ => fail("expected stem head markers")
  }
  assert_true(fig.to_svg().contains("#123456"))
}

///|
test "horizontal stems and eventplot render parallel markers" {
  let fig = @scene.figure(width=320, height=220)
  try! fig.stem(
    [1.0, 2.0],
    orientation="horizontal",
    bottom=0.5,
    color="#abcdef",
  )
  try! fig.eventplot(
    [[0.0, 1.0, 2.0], [0.5, 1.5]],
    lineoffsets=[1.0, 2.0],
    linelengths=[0.5, 0.25],
    color="#fedcba",
  )
  assert_eq(fig.artists().length(), 2 + 2 + 3 + 2)
  let svg = fig.to_svg()
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("#fedcba"))
}

///|
test "eventplot broadcasts scalar offsets and lengths across groups" {
  let fig = @scene.figure(width=280, height=180)
  try! fig.eventplot([[0.0], [1.0]], lineoffsets=[2.0], linelengths=[0.5])
  match fig.artists()[0] {
    @scene.Artist::Line(points, _) => assert_eq(points[0].y(), -0.25)
    _ => fail("expected first event line")
  }
  match fig.artists()[1] {
    @scene.Artist::Line(points, _) => assert_eq(points[0].y(), 2.0 - 0.25)
    _ => fail("expected second event line")
  }
}

///|
test "stem and eventplot validate controls" {
  let fig = @scene.figure()
  try fig.stem([1.0], orientation="diagonal") catch {
    @core.DataError::InvalidReference(message~) =>
      assert_true(message.contains("orientation"))
    _ => fail("expected invalid stem orientation")
  } noraise {
    _ => fail("expected invalid stem orientation")
  }
  try fig.eventplot([[0.0]], lineoffsets=[1.0, 2.0]) catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 1)
      assert_eq(actual, 2)
    }
    _ => fail("expected eventplot length mismatch")
  } noraise {
    _ => fail("expected eventplot length mismatch")
  }
}
