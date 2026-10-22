///|
test "category x data becomes stable positions and SVG labels" {
  let fig = @scene.figure(width=320, height=220)
  let ax = fig.axes()
  try! ax.plot_category(["low", "high", "low"], [1.0, 3.0, 2.0])
  match ax.artists()[0] {
    @scene.Artist::Line(points, _) => {
      assert_eq(points[0].x(), 0.0)
      assert_eq(points[1].x(), 1.0)
      assert_eq(points[2].x(), 0.0)
    }
    _ => fail("expected a category line")
  }
  let svg = fig.to_svg()
  assert_true(svg.contains(">low<"))
  assert_true(svg.contains(">high<"))
}

///|
test "category y data reaches horizontal bars" {
  let fig = @scene.figure(width=320, height=220)
  let ax = fig.axes()
  try! ax.bar_category_y([2.0, 4.0], ["first", "second"])
  match ax.artists()[0] {
    @scene.Artist::BarH(points, _) => {
      assert_eq(points[0].x(), 2.0)
      assert_eq(points[0].y(), 0.0)
      assert_eq(points[1].y(), 1.0)
    }
    _ => fail("expected horizontal category bars")
  }
  let svg = fig.to_svg()
  assert_true(svg.contains(">first<"))
  assert_true(svg.contains(">second<"))
}

///|
test "category plotting validates lengths and labels" {
  let fig = @scene.figure()
  try fig.axes().plot_category(["only"], [1.0, 2.0]) catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 1)
      assert_eq(actual, 2)
    }
    _ => fail("expected a category length mismatch")
  } noraise {
    _ => fail("expected a category length error")
  }
  assert_eq(fig.artists().length(), 0)
  try! fig.axes().plot_category([""], [1.0])
  assert_eq(fig.artists().length(), 1)
}

///|
test "shared category axes keep a single stable category order" {
  let fig = @scene.figure(width=420, height=240)
  let axes = try! fig.subplots(1, 2, share_x=true)
  try! axes[0].plot_category(["a", "b"], [1.0, 2.0])
  try! axes[1].scatter_category(["b", "c"], [2.0, 3.0])
  try! axes[0].plot_category(["c", "a"], [3.0, 1.0])
  match axes[0].artists()[1] {
    @scene.Artist::Line(points, _) => {
      assert_eq(points[0].x(), 2.0)
      assert_eq(points[1].x(), 0.0)
    }
    _ => fail("expected a category line")
  }
  match axes[1].artists()[0] {
    @scene.Artist::Scatter(points, _) => {
      assert_eq(points[0].x(), 1.0)
      assert_eq(points[1].x(), 2.0)
    }
    _ => fail("expected category scatter")
  }
  let svg = fig.to_svg()
  assert_true(svg.contains(">a<"))
  assert_true(svg.contains(">b<"))
  assert_true(svg.contains(">c<"))
}
