///|
test "stem component views share one copied source table and guard exact missing slots" {
  let heads = [4.0, 0.0 / 0.0, -1.0]
  let locations = [1.0, 2.0, 4.0]
  let source = stem_hit_data(heads, locations, 1.0, false).unwrap()
  let marker = source.view()
  for i in 0..<3 {
    let rod = source.view(rod=Some(i))
    assert_true(physical_equal(marker.source.datums, rod.source.datums))
    assert_true(physical_equal(source.datums, rod.source.datums))
    assert_eq(rod.rod(), Some(i))
  }
  heads[0] = 99.0
  locations[0] = 99.0
  assert_eq(source.datums[0].value, 4.0)
  assert_eq(marker.datum(2).unwrap().band, Some(@drawing.band_info(1.0, -1.0)))
  let points = [
    @core.point(1.0, 4.0),
    @core.point(2.0, 0.0 / 0.0),
    @core.point(4.0, -1.0),
  ]
  assert_true(marker.matches_points(points))
  points[1] = @core.point(2.0, 3.0)
  assert_true(!marker.matches_points(points))
  let rod = source.view(rod=Some(0))
  assert_true(
    rod.matches_points([@core.point(1.0, 1.0), @core.point(1.0, 4.0)]),
  )
  assert_true(
    !rod.matches_points([@core.point(1.0, 1.0), @core.point(1.0, 5.0)]),
  )
  assert_true(!source.view(rod=Some(9)).matches_points([]))
}
