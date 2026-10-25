///|
fn polar_consumer_fixture(
  case : Int32,
) -> (@plot.Figure, @plot.PolarAxes, Array[Double], Array[Double]) raise {
  let pi = 3.141592653589793
  let figure = @plot.figure(width=400, height=240)
  let polar = figure.add_polar_axes(0.12, 0.18, 0.76, 0.64)
  polar.legend([])
  polar.set_radius_max(if case == 1 { 100.0 } else { 1.0 })
  let theta = if case == 1 {
    [0.0, 2.0 * pi / 5.0, 4.0 * pi / 5.0, 6.0 * pi / 5.0, 8.0 * pi / 5.0]
  } else {
    [0.0, pi / 2.0, pi, 3.0 * pi / 2.0, pi / 6.0]
  }
  let radius = if case == 0 {
    [1.0, 1.0, 1.0, 1.0, 1.0]
  } else if case == 1 {
    [70.0, 55.0, 80.0, 65.0, 75.0]
  } else {
    [1.0, 0.0 / 0.0, -1.0, 0.0, 2.0]
  }
  if case == 1 {
    polar.set_theta_offset(pi / 2.0)
    polar.set_direction(@plot.PolarDirection::Clockwise)
    let categories = ["Alpha", "Beta", "Gamma", "Delta", "Epsilon"]
    polar.radar(radius, categories, color="#398575", label="Current")
    polar.radar(
      [55.0, 70.0, 60.0, 85.0, 65.0],
      categories,
      color="#a76a42",
      label="Reference",
    )
  } else {
    polar.set_title("Polar field")
    polar.plot(theta, radius, closed=case == 2, color="#398575", label="Radius")
    polar.scatter(theta, radius, color="#54739d", size=3.5, label="Samples")
  }
  (figure, polar, theta, radius)
}

///|
fn verify_polar_consumer() -> Unit raise {
  let pi = 3.141592653589793
  for case in 0..<3 {
    let (figure, polar, theta, radius) = polar_consumer_fixture(case)
    let frame = figure.to_drawing()
    assert_eq(frame.svg(), figure.to_svg_checked())
    assert_true(frame.svg().contains("<clipPath"))
    assert_true(frame.svg().contains("<circle"))
    assert_true(!frame.svg().contains("NaN"))
    assert_true(!frame.svg().contains("Infinity"))
    assert_eq(frame.points().length(), 0)
    assert_eq(frame.targets().length(), 0)
    for mode in [@plot.HitMode::Nearest, XNearest] {
      assert_eq(frame.hit_test(200.0, 120.0, radius=10000.0, mode~), None)
    }
    let artists = figure.axes_list()[0].artists()
    assert_eq(artists.length(), 2)
    guard artists[0] is @plot.Artist::Line(points, _) else {
      fail("Original polar samples did not remain a Line")
    }
    // Closure is a rendering step; the source still contains five observations.
    assert_eq(points.length(), 5)
    for i in 0..<points.length() {
      assert_true((points[i].x() - theta[i]).abs() < 1.0e-12)
      if radius[i].is_nan() {
        assert_true(points[i].y().is_nan())
      } else {
        assert_eq(points[i].y(), radius[i])
      }
    }
    theta[0] = 123.0
    radius[0] = 456.0
    assert_eq(figure.to_svg_checked(), frame.svg())
    polar.set_theta_offset(pi / 4.0)
    polar.set_direction(@plot.PolarDirection::CounterClockwise)
    let moved = figure.to_drawing()
    assert_eq(moved.targets().length(), 0)
    assert_true(moved.svg() != frame.svg())
    guard figure.axes_list()[0].artists()[0] is @plot.Artist::Line(raw, _) else {
      fail("Direction changes lost the raw polar series")
    }
    assert_eq(raw[0].x(), 0.0)
    polar.clear()
    polar.scatter([pi / 4.0], [0.5])
    assert_eq(figure.to_drawing().points().length(), 0)
    // Figure's existing public clear path retains the typed panel identity too.
    figure.clear_checked()
    polar.scatter([pi / 4.0], [0.5])
    let cleared = figure.to_drawing()
    assert_eq(cleared.points().length(), 0)
    assert_eq(cleared.targets().length(), 0)
    assert_true(cleared.svg().contains("<clipPath"))
  }
  let mixed = @plot.figure(width=480, height=300)
  let ordinary = mixed.add_axes(0.05, 0.15, 0.4, 0.7)
  ordinary.legend([])
  ordinary.set_x_limits(0.0, 1.0)
  ordinary.set_y_limits(0.0, 1.0)
  ordinary.plot([0.0, 0.5, 1.0], [0.0, 1.0, 0.0], label="Cartesian control")
  let polar = mixed.add_polar_axes(0.55, 0.15, 0.4, 0.7)
  polar.legend([])
  polar.set_radius_max(1.0)
  polar.plot([0.0, pi / 2.0, pi], [0.5, 0.75, 1.0])
  let frame = mixed.to_drawing()
  assert_eq(frame.svg(), mixed.to_svg_checked())
  assert_eq(frame.points().length(), 3)
  assert_eq(frame.targets().length(), 3)
  assert_true(
    frame
    .targets()
    .all(t => {
      t.info.kind == @plot.HitKind::Line && t.info.series == "Cartesian control"
    }),
  )
}
