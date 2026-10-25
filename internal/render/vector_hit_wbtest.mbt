///|
test "vector source table copies both arrays and guards complete original positions and components" {
  let points = [@core.point(-2.0, 1.0), @core.point(3.0, 4.0)]
  let vectors = [@core.point(2.0, -1.0), @core.point(0.0, 0.0)]
  let data = vector_hit_data(points, vectors).unwrap()
  assert_true(data.matches(points, vectors))
  assert_true(!physical_equal(data.points, points))
  assert_true(!physical_equal(data.vectors, vectors))
  points[0] = @core.point(99.0, 1.0)
  assert_true(!data.matches(points, vectors))
  points[0] = @core.point(-2.0, 1.0)
  vectors[0] = @core.point(99.0, -1.0)
  assert_true(!data.matches(points, vectors))
  let datum = data.datum(0).unwrap()
  assert_eq(
    (
      datum.index,
      datum.point.x(),
      datum.point.y(),
      datum.vector.u,
      datum.vector.v,
    ),
    (0, -2.0, 1.0, 2.0, -1.0),
  )
  assert_true(data.datum(2) is None)
  assert_true(vector_hit_data(points, []) is None)
}
