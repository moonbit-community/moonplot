///|
test "polar known line and scatter source identity content and kind replacements remain static without generic fallback" {
  for scatter in [false, true] {
    for replacement in 0..<3 {
      let fig = figure(width=400, height=240)
      let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
      p.set_radius_max(2.0)
      if scatter {
        p.scatter([0.0, 1.0], [0.5, 1.0], label="Original")
      } else {
        p.plot([0.0, 1.0], [0.5, 1.0], label="Original")
      }
      let old = fig.to_drawing()
      assert_eq(old.targets().length(), 2)
      let state = fig.axes_list()[0].state.val
      let (points, style) = match state.artists[0] {
        Line(points, style) | Scatter(points, style) => (points, style)
        _ => fail("polar artist")
      }
      match replacement {
        0 =>
          state.artists[0] = if scatter {
            Scatter(points.copy(), style)
          } else {
            Line(points.copy(), style)
          }
        1 => points[0] = @core.point(0.25, 0.75)
        _ =>
          state.artists[0] = if scatter {
            Line(points, style)
          } else {
            Scatter(points, style)
          }
      }
      let now = fig.to_drawing()
      assert_eq(now.svg(), fig.to_svg_checked())
      assert_eq((now.points().length(), now.targets().length()), (0, 0))
      assert_eq(old.targets().length(), 2)
      let point = old.targets()[0].info.point
      assert_eq(
        old.hit_test(point.screen_x, point.screen_y, radius=0.0),
        Some(point),
      )
      assert_eq(old.hit_info(point).unwrap().series, "Original")
    }
  }
}

///|
test "polar invisible or zero paint and missing singleton runs do not create observations" {
  let fig = figure(width=400, height=240)
  let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  p.set_radius_max(2.0)
  p.plot([0.0, 1.0], [0.5, 1.0], linewidth=0.0)
  p.plot([0.0], [1.0])
  p.plot([0.0, 0.0], [1.0, 1.0], closed=true)
  p.plot([0.0, 0.0 / 0.0, 1.0], [0.5, 1.0, 0.75], closed=true)
  for color in ["none", "transparent", "#11223300", "rgba(12,34,56,0)"] {
    p.plot([0.0, 1.0], [0.5, 1.0], color~)
    p.scatter([0.0, 1.0], [0.5, 1.0], color~)
  }
  p.scatter([0.0, 1.0], [0.5, 1.0], size=0.0)
  let frame = fig.to_drawing()
  assert_eq((frame.points().length(), frame.targets().length()), (0, 0))
  assert_true(frame.svg().contains("<polyline"))
  assert_true(frame.svg().contains("<circle"))
}

///|
test "polar huge original theta zero-radius ties and direction updates retain immutable original observations" {
  let fig = figure(width=400, height=240)
  let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  p.set_radius_max(1.0)
  p.scatter([1.0e308, -1.0e308, 7.0], [0.5, 0.0, 0.0], label="Raw")
  let before = fig.to_drawing()
  assert_eq(before.targets().length(), 3)
  assert_eq(before.targets()[0].info.point.data_x, 1.0e308)
  let (cx, cy, _) = before.polar_circle(0).unwrap()
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    assert_eq(
      before.hit_test(cx, cy, radius=0.0, mode~).unwrap().point_index,
      1,
    )
  }
  p.set_direction(Clockwise)
  p.set_theta_offset(0.75)
  let after = fig.to_drawing()
  assert_eq(
    after.targets().map(t => (t.info.point.data_x, t.info.point.data_y)),
    before.targets().map(t => (t.info.point.data_x, t.info.point.data_y)),
  )
  assert_true(
    after.targets()[0].info.point.screen_y !=
    before.targets()[0].info.point.screen_y,
  )
  assert_eq(before.targets()[0].info.point.data_x, 1.0e308)
  for via_figure in [false, true] {
    if via_figure {
      fig.clear_checked()
    } else {
      p.clear()
    }
    assert_eq(p.config().hit_data.length(), 0)
    assert_true(fig.to_drawing().polar_circle(0) is Some(_))
    assert_eq(fig.to_drawing().targets().length(), 0)
    p.scatter([1.0], [0.75], label="Rebuilt")
    let rebuilt = fig.to_drawing()
    assert_eq(rebuilt.targets().length(), 1)
    assert_eq(rebuilt.targets()[0].info.series, "Rebuilt")
    assert_eq(rebuilt.targets()[0].info.point.point_index, 0)
    assert_eq(before.targets().length(), 3)
  }
}
