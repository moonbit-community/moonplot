///|
test "tripcolor constant face snapshot requires original identity and content without mutable mesh exposure" {
  let points = [
    @core.point(0.0, 0.0),
    @core.point(2.0, 0.0),
    @core.point(0.0, 2.0),
  ]
  let data = tripcolor_hit_data(
    points,
    7,
    -3.5,
    (4, 8, 2),
    true,
    "Original mean",
  )
  assert_true(data.matches_points(points))
  assert_true(!data.matches_points(points.copy()))
  assert_true(!physical_equal(data.expected, points))
  assert_eq(data.expected.length(), 3)
  assert_eq(
    (
      data.slot(),
      data.value(),
      data.info().vertices,
      data.info().vertex_mean,
      data.series(),
    ),
    (7, -3.5, (4, 8, 2), true, "Original mean"),
  )
  let disabled = data.invalidated()
  assert_true(!disabled.enabled())
  assert_true(physical_equal(disabled.expected, data.expected))
  assert_true(!disabled.matches_points(points))
  points[1] = @core.point(3.0, 0.0)
  assert_true(!data.matches_points(points))
  assert_eq(data.info().vertices, (4, 8, 2))
}

///|
test "tripcolor source area handles large finite subtraction without NaN becoming nonzero" {
  for
    (points, area) in [
      (
        [
          @core.point(-1.0e308, -1.0e308),
          @core.point(0.0, 0.0),
          @core.point(1.0e308, 1.0e308),
        ],
        false,
      ),
      (
        [
          @core.point(-1.0e308, 0.0),
          @core.point(1.0e308, 0.0),
          @core.point(0.0, 1.0e308),
        ],
        true,
      ),
      (
        [
          @core.point(1.0e308, 1.0e308),
          @core.point(1.2e308, 1.0e308),
          @core.point(1.0e308, 1.2e308),
        ],
        true,
      ),
    ] {
    let data = tripcolor_hit_data(
      points,
      0,
      7.0,
      (0, 1, 2),
      false,
      "Source area",
    )
    assert_eq(data.matches_points(points), area)
  }
}

///|
test "tripcolor area normalization cannot open another exactly collinear integer source" {
  let points = [
    @core.point(0.0, 0.0),
    @core.point(1.0, 5.0),
    @core.point(5.0, 25.0),
  ]
  assert_true(
    !tripcolor_hit_data(points, 0, 8.0, (0, 1, 2), false, "Collinear").matches_points(
      points,
    ),
  )
}

///|
test "tripcolor source area preserves per-axis units through both scaling stages" {
  for
    points in [
      [
        @core.point(0.0, 0.0),
        @core.point(2.0e200, 0.0),
        @core.point(0.0, 3.0e-200),
      ],
      [
        @core.point(-1.0e308, 0.0),
        @core.point(1.0e308, 0.0),
        @core.point(0.0, 3.0e-200),
      ],
      [
        @core.point(0.0, -1.0e308),
        @core.point(3.0e-200, 0.0),
        @core.point(0.0, 1.0e308),
      ],
    ] {
    assert_true(
      tripcolor_hit_data(
        points,
        0,
        37.0,
        (0, 1, 2),
        false,
        "Different axis units",
      ).matches_points(points),
    )
  }
}
