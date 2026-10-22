///|
test "affine transforms compose and invert" {
  let transform = @transforms.translation(10.0, -2.0).then(
    @transforms.scaling(2.0, 3.0),
  )
  let value = transform.apply(@core.point(1.0, 2.0))
  assert_true(value.x() == 12.0)
  assert_true(value.y() == 4.0)
  let restored = try! transform.inverse().apply(value)
  assert_true(restored.x() == 1.0)
  assert_true(restored.y() == 2.0)
}

///|
test "singular affine transforms reject inversion" {
  try @transforms.scaling(0.0, 1.0).inverse() catch {
    @transforms.TransformError::Singular => ()
  } noraise {
    _ => fail("expected a singular transform")
  }
}
