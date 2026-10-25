///|
test "contour fragments share immutable lineage with one expected snapshot and disabled provenance cannot revive" {
  let points = [@core.point(1.0, 2.0), @core.point(3.0, 4.0)]
  let original = contour_hit_view(points, 7, 0.25, "Field")
  let part = [@core.point(1.0, 2.0), @core.point(1.75, 2.75)]
  let fragment = original.fragment(part)
  assert_true(physical_equal(original.source, fragment.source))
  assert_true(!physical_equal(original.expected, points))
  assert_true(!physical_equal(fragment.expected, part))
  points[0] = @core.point(99.0, 99.0)
  assert_true(!original.matches_points(points))
  assert_true(fragment.matches_points(part))
  assert_eq(
    (fragment.slot(), fragment.level(), fragment.series()),
    (7, 0.25, "Field"),
  )
  let disabled = original.invalidated().fragment(points)
  assert_true(!disabled.enabled())
  assert_true(!disabled.matches_points(points))
  assert_true(physical_equal(disabled.source, original.source))
}

///|
test "contour expected geometry distinguishes changed nonfinite values without rejecting unchanged NaN run separators" {
  let nan = 0.0 / 0.0
  let inf = 1.0 / 0.0
  let points = [
    @core.point(1.0, 2.0),
    @core.point(nan, inf),
    @core.point(3.0, 4.0),
  ]
  let source = contour_hit_view(points, 0, 2.0, "Masked")
  assert_true(source.matches_points(points.copy()))
  points[1] = @core.point(nan, -inf)
  assert_true(!source.matches_points(points))
  points[1] = @core.point(nan, inf)
  assert_true(source.matches_points(points))
  points.push(@core.point(5.0, 6.0))
  assert_true(!source.matches_points(points))
}
