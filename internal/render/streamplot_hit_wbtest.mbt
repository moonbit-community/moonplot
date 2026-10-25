///|
test "streamplot shared trajectory copies samples once and split views retain only their own identity range" {
  let points = [
    @core.point(0.0, 1.0),
    @core.point(1.0, 1.0),
    @core.point(2.0, 1.0),
  ]
  let first = streamplot_datum(
    0,
    @core.point(0.5, 1.0),
    @drawing.streamplot_info(4, 2.0, -1.0),
  )
  let last = streamplot_datum(
    1,
    @core.point(1.5, 1.0),
    @drawing.streamplot_info(4, 3.0, -2.0),
  )
  let samples : Array[StreamplotDatum?] = [Some(first), Some(last)]
  let source = streamplot_hit_data(points, samples)
  let whole = streamplot_body_hit(source, points, 0, "Flow")
  let split_points = [points[1], points[2]]
  let split = streamplot_body_hit(source, split_points, 1, "Flow")
  assert_true(!physical_equal(source.points, points))
  assert_true(!physical_equal(source.datums, samples))
  assert_true(
    physical_equal(whole.source.unwrap().points, split.source.unwrap().points),
  )
  assert_true(
    physical_equal(whole.source.unwrap().datums, split.source.unwrap().datums),
  )
  assert_true(whole.matches_points(points))
  assert_true(split.matches_points(split_points))
  assert_true(!whole.matches_points(points.copy()))
  assert_true(!split.matches_points(split_points.copy()))
  assert_eq(split.datum(0).unwrap().index, 1)
  samples[1] = None
  assert_eq(split.datum(0).unwrap().info.v, -2.0)
  points[0] = @core.point(-1.0, 1.0)
  assert_true(!whole.matches_points(points))
  assert_true(split.matches_points(split_points))
  split_points[1] = @core.point(3.0, 1.0)
  assert_true(!split.matches_points(split_points))
  let disabled = whole.invalidated()
  assert_true(!disabled.enabled())
  assert_true(!disabled.matches_points(points))
  assert_true(disabled.datum(0) is None)
  let arrow = streamplot_static_hit(points, "Static arrow")
  assert_true(arrow.enabled() && !arrow.body())
  assert_eq(arrow.series(), "Static arrow")
  assert_true(arrow.datum(0) is None)
}

///|
test "streamplot sparse samples and invalid view offsets never overflow or renumber the original edge" {
  let points = [
    @core.point(0.0, 0.0),
    @core.point(1.0, 0.0),
    @core.point(2.0, 0.0),
  ]
  let source = streamplot_hit_data(points, [
    None,
    Some(
      streamplot_datum(
        1,
        @core.point(1.5, 0.0),
        @drawing.streamplot_info(7, 0.0, 0.0),
      ),
    ),
  ])
  let view = streamplot_body_hit(source, points, 0, "Sparse")
  assert_true(view.datum(0) is None)
  assert_eq(view.datum(1).unwrap().index, 1)
  for index in [-1, 2, 2147483647] {
    assert_true(view.datum(index) is None)
  }
  for offset in [-1, 1, 2147483647] {
    let invalid = streamplot_body_hit(source, points, offset, "Invalid")
    assert_true(!invalid.matches_points(points))
    if offset != 1 {
      assert_true(invalid.datum(0) is None)
    }
  }
}
