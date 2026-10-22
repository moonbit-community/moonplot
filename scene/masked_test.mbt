///|
fn count_token(text : String, token : String) -> Int32 {
  text.split(token).to_array().length() - 1
}

///|
test "masked line and scatter inputs preserve gaps" {
  let xs = try! @core.masked_array([0.0, 1.0, 2.0, 3.0, 4.0], mask=[
    false, false, true, false, false,
  ])
  let ys = try! @core.masked_array([0.0, 1.0, 0.0, 1.0, 0.0])
  let fig = @scene.figure(width=280, height=200)
  try! fig.plot_masked(xs, ys)
  try! fig.scatter_masked(xs, ys)
  match fig.axes().artists()[0] {
    @scene.Artist::Line(points, _) => {
      assert_eq(points.length(), 5)
      assert_true(points[2].x().is_nan())
      assert_true(points[2].y().is_nan())
    }
    _ => fail("expected a masked line artist")
  }
  let svg = fig.to_svg()
  assert_eq(count_token(svg, "<polyline"), 2)
  assert_eq(count_token(svg, "<circle"), 4)
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
}

///|
test "masked fill helpers omit invalid polygon segments" {
  let xs = try! @core.masked_array([0.0, 1.0, 2.0, 3.0, 4.0], mask=[
    false, false, true, false, false,
  ])
  let lower = try! @core.masked_array([0.0, 0.0, 0.0, 0.0, 0.0])
  let upper = try! @core.masked_array([1.0, 1.0, 1000.0, 1.0, 1.0])
  let fig = @scene.figure(width=280, height=200)
  try! fig.fill_between_masked(xs, lower, upper)
  match fig.axes().artists()[0] {
    @scene.Artist::FillBetween(upper_points, lower_points, _) => {
      assert_true(upper_points[2].y().is_nan())
      assert_true(lower_points[2].y().is_nan())
      assert_true(upper_points[2].x().is_nan())
      assert_true(lower_points[2].x().is_nan())
    }
    _ => fail("expected a masked fill artist")
  }
  let svg = fig.to_svg()
  assert_eq(count_token(svg, "<polygon"), 2)
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))

  let horizontal = @scene.figure(width=280, height=200)
  try! horizontal.fill_betweenx_masked(xs, lower, upper)
  match horizontal.axes().artists()[0] {
    @scene.Artist::FillBetween(upper_points, lower_points, _) => {
      assert_true(upper_points[2].x().is_nan())
      assert_true(lower_points[2].x().is_nan())
      assert_true(upper_points[2].y().is_nan())
      assert_true(lower_points[2].y().is_nan())
    }
    _ => fail("expected a masked horizontal fill artist")
  }
}
