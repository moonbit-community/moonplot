///|
test "affine constructors expose rotation, shear, matrix, and deltas" {
  let quarter_turn = @transforms.rotation(@math.PI / 2.0)
  let rotated = quarter_turn.apply(@core.point(1.0, 0.0))
  assert_true(Double::abs(rotated.x()) < 0.000000000001)
  assert_true(Double::abs(rotated.y() - 1.0) < 0.000000000001)

  let value = @transforms.affine_from_values(2.0, 3.0, 4.0, 5.0, 6.0, 7.0)
  let (a, b, c, d, e, f) = value.to_values()
  assert_eq((a, b, c, d, e, f), (2.0, 3.0, 4.0, 5.0, 6.0, 7.0))
  let delta = value.apply_delta(@core.point(1.0, -1.0))
  assert_eq(delta.x(), -2.0)
  assert_eq(delta.y(), -2.0)
  assert_true(!value.is_separable())
}

///|
test "bbox exposes normalized containment and layout operations" {
  let reversed = @transforms.bbox(3.0, 4.0, 1.0, 0.0)
  assert_true(reversed.contains_x(2.0))
  assert_true(reversed.contains_y(2.0))
  assert_true(!reversed.fully_contains(1.0, 2.0))
  assert_true(reversed.fully_overlaps(@transforms.bbox(1.5, 1.0, 2.5, 3.0)))

  let pieces = @transforms.bbox(0.0, 0.0, 10.0, 4.0).split_x([0.25, 0.75])
  assert_eq(pieces.length(), 3)
  assert_eq(pieces[1].x0(), 2.5)
  assert_eq(pieces[1].x1(), 7.5)

  let shrunk = @transforms.bbox(0.0, 0.0, 10.0, 4.0).shrunk(0.5, 0.5)
  assert_eq(shrunk.x1(), 5.0)
  assert_eq(shrunk.y1(), 2.0)

  let rotated = @transforms.bbox(0.0, 0.0, 2.0, 1.0).rotated(@math.PI / 2.0)
  assert_true(Double::is_close(rotated.width(), 1.0))
  assert_true(Double::is_close(rotated.height(), 2.0))

  let empty = @transforms.null_bbox()
  assert_true(empty.x0().is_inf())
  assert_true(empty.x1().is_inf())
  assert_true(empty.x0() > empty.x1())
}

///|
test "transform trees compose, blend, map boxes, and invert" {
  let tree = @transforms.affine_transform(@transforms.translation(10.0, 0.0)).then(
    @transforms.affine_transform(@transforms.scaling(2.0, 3.0)),
  )
  let value = tree.apply(@core.point(1.0, 2.0))
  assert_eq(value.x(), 12.0)
  assert_eq(value.y(), 6.0)
  let restored = try! tree.inverse().apply(value)
  assert_true(Double::is_close(restored.x(), 1.0))
  assert_true(Double::is_close(restored.y(), 2.0))

  let mapped = @transforms.bbox_transform(
    @transforms.bbox(0.0, 0.0, 2.0, 4.0),
    @transforms.bbox(10.0, 20.0, 20.0, 40.0),
  )
  let mapped_point = mapped.apply(@core.point(1.0, 2.0))
  assert_eq(mapped_point.x(), 15.0)
  assert_eq(mapped_point.y(), 30.0)
  let mapped_back = try! mapped.inverse().apply(mapped_point)
  assert_true(Double::is_close(mapped_back.x(), 1.0))
  assert_true(Double::is_close(mapped_back.y(), 2.0))

  let blended = @transforms.blended_transform(
    @transforms.affine_transform(@transforms.translation(10.0, 0.0)),
    @transforms.affine_transform(@transforms.scaling(2.0, 3.0)),
  )
  let blended_point = blended.apply(@core.point(1.0, 2.0))
  assert_eq(blended_point.x(), 11.0)
  assert_eq(blended_point.y(), 6.0)

  let offset = @transforms.scaled_translation(
    2.0,
    3.0,
    @transforms.scaling(10.0, 20.0),
  )
  let offset_point = offset.apply(@core.point(1.0, 2.0))
  assert_eq(offset_point.x(), 21.0)
  assert_eq(offset_point.y(), 62.0)
}
