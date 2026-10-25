///|
test "discrete snapshots copy arrays and compare every finite missing infinity and signed zero slot" {
  let nan = 0.0 / 0.0
  let points = [@core.point(-0.0, nan), @core.point(1.0, 2.0)]
  let owners = [0]
  let data = discrete_line_hit_data(
    Step,
    points,
    [discrete_datum(0, @core.point(1.0, 2.0), 2.0)],
    owners,
  ).unwrap()
  owners[0] = 99
  points[1] = @core.point(3.0, 4.0)
  assert_eq(data.owner(0), Some(0))
  assert_true(
    data.matches_path([@core.point(-0.0, nan), @core.point(1.0, 2.0)]),
  )
  assert_true(
    !data.matches_path([@core.point(0.0, nan), @core.point(1.0, 2.0)]),
  )
  assert_true(
    !data.matches_path([@core.point(-0.0, 1.0), @core.point(1.0, 2.0)]),
  )
  assert_true(
    !data.matches_path([@core.point(-0.0, nan), @core.point(nan, 2.0)]),
  )
  assert_true(discrete_line_hit_data(Line, [], [], []) is None)
  let inf = 1.0 / 0.0
  assert_true(discrete_number_equal(inf, inf))
  assert_true(!discrete_number_equal(inf, -inf))
  assert_true(!discrete_number_equal(nan, inf))
}
