///|
test "polar bar source width remains independent of identity content and original primitive kind" {
  let points = [@core.point(0.0, 1.0), @core.point(0.5, 2.0)]
  let bar = polar_bar_hit_data(points, "Rose", 0.4)
  assert_eq(bar.bar_width(), Some(0.4))
  assert_eq(bar.series(), "Rose")
  assert_true(bar.matches_bar(points))
  assert_true(!bar.matches_points(points))
  assert_true(!bar.matches_points(points, scatter=true))
  assert_true(!bar.matches_bar(points.copy()))
  assert_true(!polar_hit_data(points, "Line").matches_bar(points))
  assert_true(
    !polar_hit_data(points, "Markers", scatter=true).matches_bar(points),
  )
  points[0] = @core.point(0.0, 8.0)
  assert_true(!bar.matches_bar(points))
  assert_eq(bar.bar_width(), Some(0.4))
  assert_eq(bar.point(0).unwrap().y(), 1.0)
}
