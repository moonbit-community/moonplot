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
    let expected = if case == 2 { 3 } else { 10 }
    assert_eq(frame.svg(), figure.to_svg_checked())
    assert_true(frame.svg().contains("<clipPath"))
    assert_true(frame.svg().contains("<circle"))
    assert_true(!frame.svg().contains("NaN"))
    assert_true(!frame.svg().contains("Infinity"))
    assert_eq(frame.points().length(), expected)
    assert_eq(frame.targets().length(), expected)
    guard frame.polar_circle(0) is Some((cx, cy, disk_radius)) else {
      fail("A public polar Drawing must preserve its actual circle")
    }
    assert_true(disk_radius > 0.0)
    for mode in [@plot.HitMode::Nearest, XNearest] {
      // This is inside the bounding square, outside the actual circular disk.
      assert_eq(
        frame.hit_test(
          cx + 0.9 * disk_radius,
          cy + 0.9 * disk_radius,
          radius=10000.0,
          mode~,
        ),
        None,
      )
      let anchor = frame.points()[0]
      guard frame.hit_test(anchor.screen_x, anchor.screen_y, radius=0.01, mode~)
        is Some(hit) else {
        fail("A painted original polar sample must be selectable")
      }
      assert_eq(hit.data_x, anchor.data_x)
      assert_eq(hit.data_y, anchor.data_y)
    }
    let artists = figure.axes_list()[0].artists()
    assert_eq(artists.length(), 2)
    guard artists[0] is @plot.Artist::Line(points, _) else {
      fail("Original polar samples did not remain a Line")
    }
    // A synthetic closing vertex must never become a sixth observation.
    assert_eq(points.length(), 5)
    for i in 0..<points.length() {
      assert_true((points[i].x() - theta[i]).abs() < 1.0e-12)
      if radius[i].is_nan() {
        assert_true(points[i].y().is_nan())
      } else {
        assert_eq(points[i].y(), radius[i])
      }
    }
    for target in frame.targets() {
      let info = target.info
      let point = info.point
      assert_eq(info.kind, @plot.HitKind::Polar)
      assert_true(point.point_index >= 0 && point.point_index < 5)
      assert_true((point.data_x - theta[point.point_index]).abs() < 1.0e-12)
      assert_eq(info.value, point.data_y)
      assert_true(point.data_y >= 0.0)
      assert_true(point.data_y <= (if case == 1 { 100.0 } else { 1.0 }))
      if case == 1 {
        let categories = ["Alpha", "Beta", "Gamma", "Delta", "Epsilon"]
        assert_eq(info.category, Some(categories[point.point_index]))
        assert_eq(
          info.series,
          if point.artist_index == 0 {
            "Current"
          } else {
            "Reference"
          },
        )
      } else {
        assert_eq(info.category, None)
        assert_eq(
          info.series,
          if point.artist_index == 0 {
            "Radius"
          } else {
            "Samples"
          },
        )
        assert_eq(point.data_y, radius[point.point_index])
      }
    }
    let original_targets = frame.targets()
    theta[0] = 123.0
    radius[0] = 456.0
    assert_eq(figure.to_svg_checked(), frame.svg())
    assert_eq(figure.to_drawing().targets(), original_targets)
    polar.set_theta_offset(pi / 4.0)
    polar.set_direction(@plot.PolarDirection::CounterClockwise)
    let moved = figure.to_drawing()
    assert_eq(moved.targets().length(), expected)
    assert_true(moved.svg() != frame.svg())
    for i in 0..<expected {
      let before = original_targets[i].info
      let after = moved.targets()[i].info
      assert_eq(after.point.data_x, before.point.data_x)
      assert_eq(after.point.data_y, before.point.data_y)
      assert_eq(after.category, before.category)
      assert_eq(after.series, before.series)
      assert_eq(after.point.point_index, before.point.point_index)
    }
    assert_eq(frame.targets(), original_targets)
    assert_eq(frame.polar_circle(0), Some((cx, cy, disk_radius)))
    polar.clear()
    polar.scatter([pi / 4.0], [0.5])
    let typed_cleared = figure.to_drawing()
    assert_eq(typed_cleared.targets().length(), 1)
    assert_eq(typed_cleared.targets()[0].info.category, None)
    assert_eq(typed_cleared.targets()[0].info.point.point_index, 0)
    figure.clear_checked()
    polar.scatter([pi / 4.0], [0.5])
    let cleared = figure.to_drawing()
    assert_eq(cleared.points().length(), 1)
    assert_eq(cleared.targets().length(), 1)
    assert_eq(cleared.targets()[0].info.kind, @plot.HitKind::Polar)
    assert_eq(cleared.targets()[0].info.category, None)
    assert_eq(cleared.targets()[0].info.point.data_x, pi / 4.0)
    assert_eq(cleared.targets()[0].info.value, 0.5)
    assert_true(cleared.svg().contains("<clipPath"))
  }
  // Radar categories belong to their original call, not mutable tick labels.
  let categories = ["Original A", "Original B", "Original C"]
  let categorical = @plot.figure(width=400, height=240)
  let radar = categorical.add_polar_axes(0.1, 0.15, 0.8, 0.7)
  radar.set_radius_max(1.0)
  radar.radar([0.5, 0.6, 0.7], categories, label="Original profile")
  radar.scatter([0.0], [0.0], label="Ordinary polar source")
  categories[0] = "Caller mutation"
  radar.set_theta_ticks([0.0, pi / 2.0], labels=["New tick", "Other tick"])
  radar.legend([
    @scene.legend_entry("Legend override"),
    @scene.legend_entry("Other legend"),
  ])
  let categorical_frame = categorical.to_drawing()
  assert_eq(categorical_frame.targets().length(), 4)
  for target in categorical_frame.targets() {
    if target.info.point.artist_index == 0 {
      let expected = ["Original A", "Original B", "Original C"]
      assert_eq(
        target.info.category,
        Some(expected[target.info.point.point_index]),
      )
      assert_eq(target.info.series, "Original profile")
    } else {
      assert_eq(target.info.category, None)
      assert_eq(target.info.series, "Ordinary polar source")
      assert_eq(target.info.point.data_x, 0.0)
      assert_eq(target.info.value, 0.0)
    }
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
  assert_eq(frame.points().length(), 6)
  assert_eq(frame.targets().length(), 6)
  assert_eq(frame.polar_circle(0), None)
  assert_true(frame.polar_circle(1) is Some(_))
  for target in frame.targets() {
    if target.info.point.panel_index == 0 {
      assert_eq(target.info.kind, @plot.HitKind::Line)
      assert_eq(target.info.series, "Cartesian control")
      let p = target.info.point
      assert_eq(frame.hit_test(p.screen_x, p.screen_y, radius=0.01), Some(p))
    } else {
      assert_eq(target.info.kind, @plot.HitKind::Polar)
    }
  }
}
