///|
test "quadratic and cubic Bezier segments evaluate and split" {
  let quadratic = try! @transforms.quadratic_bezier(
    @core.point(0.0, 0.0),
    @core.point(1.0, 2.0),
    @core.point(2.0, 0.0),
  )
  let midpoint = try! quadratic.evaluate(0.5)
  assert_true(Double::is_close(midpoint.x(), 1.0))
  assert_true(Double::is_close(midpoint.y(), 1.0))
  let (left, right) = try! quadratic.split(0.5)
  let join_left = try! left.evaluate(1.0)
  let join_right = try! right.evaluate(0.0)
  assert_true(Double::is_close(join_left.x(), join_right.x()))
  assert_true(Double::is_close(join_left.y(), join_right.y()))
  let cubic = try! @transforms.cubic_bezier(
    @core.point(0.0, 0.0),
    @core.point(0.0, 1.0),
    @core.point(1.0, 1.0),
    @core.point(1.0, 0.0),
  )
  assert_eq(cubic.degree(), 3)
  assert_eq(cubic.sample(4).length(), 5)
  assert_true(cubic.length() > 0.0)
}

///|
test "Bezier segments reject invalid controls and parameters" {
  try
    @transforms.quadratic_bezier(
      @core.point(0.0, 0.0),
      @core.point(1.0, 1.0),
      @core.point(0.0 / 0.0, 0.0),
    )
  catch {
    @transforms.BezierError::InvalidControlPoints(message~) =>
      assert_true(message.contains("finite"))
    _ => fail("expected invalid control points")
  } noraise {
    _ => fail("expected invalid control points")
  }
  let segment = try! @transforms.quadratic_bezier(
    @core.point(0.0, 0.0),
    @core.point(1.0, 1.0),
    @core.point(2.0, 0.0),
  )
  try segment.split(2.0) catch {
    @transforms.BezierError::InvalidParameter(message~) =>
      assert_true(message.contains("[0, 1]"))
    _ => fail("expected invalid split parameter")
  } noraise {
    _ => fail("expected invalid split parameter")
  }
}
