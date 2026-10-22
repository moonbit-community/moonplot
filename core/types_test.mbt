///|
test "point and bounds use finite checks" {
  let p = @core.point(1.0, -2.0)
  assert_true(p.is_finite())
  assert_true(!p.is_missing())
  let missing = @core.point(1.0 / 0.0, 0.0)
  assert_true(!missing.is_finite())
  assert_true(missing.is_missing())
  assert_true(@core.bounds(-1.0, 2.0, -3.0, 4.0).is_finite())
}
