///|
test "polar projection uses one radial metric shifted direction and reduced huge finite angles" {
  let config = @render.polar_projection(
    Some(1.0),
    @math.PI / 2.0,
    true,
    [],
    [],
    None,
    [],
    [false],
  )
  let points = polar_project_points(
    [@core.point(0.0, 1.0), @core.point(@math.PI / 2.0, 1.0)],
    config,
    1.0,
    (0.0, 0.0, 200.0, 200.0),
    false,
  )
  assert_true(
    points[0].x().abs() < 1.0e-14 && (points[0].y() - 1.0).abs() < 1.0e-14,
  )
  assert_true(
    (points[1].x() - 1.0).abs() < 1.0e-14 && points[1].y().abs() < 1.0e-14,
  )
  let huge = @render.polar_projection(
    Some(1.0),
    1.0e308,
    false,
    [],
    [],
    None,
    [],
    [true],
  )
  let actual = polar_project_points(
    [@core.point(1.0e308, 1.0), @core.point(-1.0e308, 0.0)],
    huge,
    1.0,
    (0.0, 0.0, 200.0, 200.0),
    true,
  )
  assert_eq(actual.length(), 3)
  assert_true(actual.all(p => p.is_finite()))
  assert_true(
    (actual[0].x() * actual[0].x() + actual[0].y() * actual[0].y() - 1.0).abs() <
    1.0e-14,
  )
  assert_eq((actual[1].x(), actual[1].y()), (0.0, 0.0))
}

///|
test "polar missing negative and unrepresentable projected samples break runs and never acquire a closing observation" {
  let config = @render.polar_projection(
    Some(1.0),
    0.0,
    false,
    [],
    [],
    None,
    [],
    [true],
  )
  for
    bad in [
      @core.point(1.0, -1.0),
      @core.point(0.0 / 0.0, 1.0),
      @core.point(1.0, 1.0 / 0.0),
    ] {
    let result = polar_project_points(
      [@core.point(0.0, 1.0), bad, @core.point(2.0, 1.0)],
      config,
      1.0,
      (0.0, 0.0, 200.0, 200.0),
      true,
    )
    assert_eq(result.length(), 3)
    assert_true(!result[1].is_finite())
  }
  let overflow = polar_project_points(
    [@core.point(0.0, 1.0e308)],
    config,
    1.0e-308,
    (0.0, 0.0, 200.0, 200.0),
    true,
  )
  assert_eq(overflow.length(), 1)
  assert_true(!overflow[0].is_finite())
  let tiny = polar_project_points(
    [@core.point(0.0, 5.0e-324)],
    config,
    5.0e-324,
    (0.0, 0.0, 200.0, 200.0),
    false,
  )
  assert_eq((tiny[0].x(), tiny[0].y()), (1.0, 0.0))
}

///|
test "polar renderer bypasses Cartesian view and prepared Line providers and never captures generic points" {
  let called = [0]
  let x = @axis.axis()
  let y = @axis.axis(horizontal=false)
  x.bind_render_view_interval(() => {
    called[0] += 1
    raise polar_error("should not evaluate x view")
  })
  y.bind_render_minpos(
    () => {
      called[0] += 1
      raise polar_error("should not evaluate minpos")
    },
    () => [],
  )
  let points = [@core.point(0.0, 1.0), @core.point(1.0, 0.5)]
  let config = @render.polar_projection(None, 0.0, false, [], [], None, [], [
    false,
  ])
  let panel = @render.panel(
    None,
    [@render.Artist::Line(points, @core.style("purple"))],
    None,
    [],
    None,
    x,
    y,
    false,
    [],
    [],
    polar=Some(config),
    line_provider=Some(_ => {
      called[0] += 1
      raise polar_error("should not prepare Cartesian Line")
    }),
  )
  let figure = @render.figure(400, 240, 0, [panel], [], None)
  let frame = render_drawing_with_positions_checked(figure).0
  assert_eq(frame.svg(), render(figure))
  assert_eq(
    (frame.points().length(), frame.targets().length(), called[0]),
    (0, 0, 0),
  )
  assert_eq(polar_radius_max(panel, config), 1.0)
}
