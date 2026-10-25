///|
test "polar source uses original identity and immutable content category table and projection container" {
  let points = [
    @core.point(0.0, 1.0),
    @core.point(0.0 / 0.0, 0.5),
    @core.point(2.0, 0.0),
  ]
  let labels = ["A", "Missing", "C"]
  let source = polar_hit_data(points, "Call", categories=Some(labels))
  assert_true(source.matches_points(points))
  assert_true(!source.matches_points(points.copy()))
  assert_true(!source.matches_points(points, scatter=true))
  labels[0] = "Changed"
  assert_eq(source.category(0), Some("A"))
  let changed = source.with_categories(["New", "Missing", "C"])
  assert_eq(changed.category(0), Some("New"))
  assert_eq(source.category(0), Some("A"))
  let table = [source]
  let config = polar_projection(
    Some(1.0),
    0.0,
    false,
    [],
    [],
    None,
    [],
    [false],
    hit_data=table,
  )
  table[0] = changed
  assert_eq(config.hit_data(0).unwrap().category(0), Some("A"))
  points[0] = @core.point(0.0, 0.75)
  assert_true(!source.matches_points(points))
  assert_eq(source.point(0).unwrap().y(), 1.0)
  assert_true(source.point(3) is None)
  assert_true(source.category(3) is None)
}
