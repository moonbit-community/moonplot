///|
test "bbox exposes extents, containment, and affine transformation" {
  let box = @transforms.bbox_from_bounds(1.0, 2.0, 3.0, 4.0)
  assert_eq(box.xmin(), 1.0)
  assert_eq(box.ymax(), 6.0)
  assert_true(box.contains(2.0, 3.0))
  assert_true(box.overlaps(@transforms.bbox(3.0, 5.0, 8.0, 9.0)))
  let intersection = box
    .intersection(@transforms.bbox(3.0, 5.0, 8.0, 9.0))
    .unwrap()
  assert_eq(intersection.x0(), 3.0)
  assert_eq(intersection.y1(), 6.0)
  let moved = box.transformed(@transforms.translation(10.0, -1.0))
  assert_eq(moved.x0(), 11.0)
  assert_eq(moved.y0(), 1.0)
}

///|
test "path constructors, extents, transforms, and containment" {
  let shape = try! @transforms.polygon_path([
    @core.point(0.0, 0.0),
    @core.point(2.0, 0.0),
    @core.point(2.0, 2.0),
    @core.point(0.0, 2.0),
  ])
  assert_eq(shape.length(), 5)
  assert_true(shape.contains_point(@core.point(1.0, 1.0)))
  assert_true(!shape.contains_point(@core.point(3.0, 1.0)))
  let extent = shape.extents().unwrap()
  assert_eq(extent.width(), 2.0)
  let moved = try! shape.transformed(@transforms.translation(3.0, 4.0))
  assert_true(moved.contains_point(@core.point(4.0, 5.0)))
}

///|
test "path validates code and vertex invariants" {
  try
    @transforms.path([@core.point(0.0, 0.0)], codes=[
      @transforms.PathCode::LineTo,
    ])
  catch {
    @transforms.PathError::InvalidCodes(message~) =>
      assert_true(message.contains("MoveTo"))
    _ => fail("expected invalid path codes")
  } noraise {
    _ => fail("expected invalid path codes")
  }
  try @transforms.path([@core.point(0.0 / 0.0, 0.0)]) catch {
    @transforms.PathError::InvalidVertex(message~) =>
      assert_true(message.contains("finite"))
    _ => fail("expected invalid path vertex")
  } noraise {
    _ => fail("expected invalid path vertex")
  }
}

///|
test "curved paths use Bezier extrema instead of control-point bounds" {
  let quadratic = try! @transforms.path(
    [@core.point(0.0, 0.0), @core.point(1.0, 2.0), @core.point(2.0, 0.0)],
    codes=[
      @transforms.PathCode::MoveTo,
      @transforms.PathCode::Curve3,
      @transforms.PathCode::Curve3,
    ],
  )
  let quadratic_extent = quadratic.extents().unwrap()
  assert_true(Double::is_close(quadratic_extent.xmin(), 0.0))
  assert_true(Double::is_close(quadratic_extent.xmax(), 2.0))
  assert_true(Double::is_close(quadratic_extent.ymax(), 1.0))

  let cubic = try! @transforms.path(
    [
      @core.point(0.0, 0.0),
      @core.point(0.0, 3.0),
      @core.point(3.0, 3.0),
      @core.point(3.0, 0.0),
    ],
    codes=[
      @transforms.PathCode::MoveTo,
      @transforms.PathCode::Curve4,
      @transforms.PathCode::Curve4,
      @transforms.PathCode::Curve4,
    ],
  )
  let cubic_extent = cubic.extents().unwrap()
  assert_true(Double::is_close(cubic_extent.ymax(), 2.25))
}

///|
test "curved paths flatten curves for point containment" {
  let arch = try! @transforms.path(
    [
      @core.point(0.0, 0.0),
      @core.point(1.0, 2.0),
      @core.point(2.0, 0.0),
      @core.point(0.0, 0.0),
      @core.point(0.0, 0.0),
    ],
    codes=[
      @transforms.PathCode::MoveTo,
      @transforms.PathCode::Curve3,
      @transforms.PathCode::Curve3,
      @transforms.PathCode::LineTo,
      @transforms.PathCode::ClosePoly,
    ],
  )
  assert_true(arch.contains_point(@core.point(1.0, 0.5)))
  assert_true(!arch.contains_point(@core.point(1.0, 1.5)))
}

///|
test "curved path codes require complete control-point groups" {
  try
    @transforms.path([@core.point(0.0, 0.0), @core.point(1.0, 1.0)], codes=[
      @transforms.PathCode::MoveTo,
      @transforms.PathCode::Curve3,
    ])
  catch {
    @transforms.PathError::InvalidCodes(message~) =>
      assert_true(message.contains("exactly two"))
    _ => fail("expected an incomplete quadratic curve error")
  } noraise {
    _ => fail("expected an incomplete quadratic curve error")
  }
}

///|
test "path clipping keeps the inside and outside rectangle regions" {
  let square = try! @transforms.polygon_path([
    @core.point(0.0, 0.0),
    @core.point(4.0, 0.0),
    @core.point(4.0, 4.0),
    @core.point(0.0, 4.0),
  ])
  let clip_box = @transforms.bbox(1.0, 1.0, 3.0, 3.0)
  let inside = try! square.clip_to_bbox(clip_box)
  let inside_extent = inside.extents().unwrap()
  assert_true(inside.contains_point(@core.point(2.0, 2.0)))
  assert_true(!inside.contains_point(@core.point(0.0, 0.0)))
  assert_true(Double::is_close(inside_extent.xmin(), 1.0))
  assert_true(Double::is_close(inside_extent.ymax(), 3.0))

  let outside = try! square.clip_to_bbox(clip_box, inside=false)
  assert_true(outside.contains_point(@core.point(0.0, 0.0)))
  assert_true(outside.contains_point(@core.point(2.0, 0.5)))
  assert_true(!outside.contains_point(@core.point(2.0, 2.0)))
}
