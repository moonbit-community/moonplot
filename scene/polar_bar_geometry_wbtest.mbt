///|
test "polar bar fractional circular and angular edges use physical filled regions with independent circle gate" {
  let fig = figure(width=400, height=240)
  let p = fig.add_polar_axes(0.12, 0.18, 0.76, 0.64)
  p.legend([])
  p.set_title("Fractional circle")
  p.set_radius_max(1.0)
  let theta = [
    0.0,
    @math.PI / 2.0,
    @math.PI,
    3.0 * @math.PI / 2.0,
    @math.PI / 6.0,
  ]
  p.bar(theta, [1.0, 1.0, 1.0, 1.0, 1.0], width=@math.PI / 6.0)
  let frame = fig.to_drawing()
  let (cx, cy, r) = frame.polar_circle(0).unwrap()
  assert_eq((cx, cy, r), (200.0, 129.0, 43.8))
  for i, angle in theta {
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let x = cx + r * @math.cos(angle)
      let y = cy - r * @math.sin(angle)
      let point = frame.hit_test(x, y, radius=0.0, mode~).unwrap()
      assert_eq(point.point_index, i)
      assert_eq(frame.hit_info(point).unwrap().kind, PolarBar)
    }
  }
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    assert_eq(frame.hit_test(cx - r, cy - r, radius=1.0e10, mode~), None)
    assert_eq(frame.hit_test(cx + r + 1.0e-8, cy, radius=1.0e10, mode~), None)
    assert_eq(
      frame.hit_test(
        cx + r * 0.5 * @math.cos(1.0),
        cy - r * 0.5 * @math.sin(1.0),
        radius=1.0e10,
        mode~,
      ),
      None,
    )
  }
}

///|
test "polar bar whole revolution is explicit while near whole and wrap sectors preserve their gap" {
  for width in [2.0 * @math.PI, 2.0 * @math.PI - 0.01, 6.283185307179585] {
    let fig = figure(width=400, height=240)
    let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
    p.legend([])
    p.set_radius_max(1.0)
    p.bar([0.0], [1.0], width~)
    let frame = fig.to_drawing()
    assert_eq(frame.targets().length(), 1)
    guard frame.targets()[0].shape is Sector(cx, cy, r, _, sweep) else {
      fail("Sector")
    }
    assert_eq(sweep == 360.0, width == 2.0 * @math.PI)
    assert_eq(frame.svg().contains("<path"), width != 2.0 * @math.PI)
    if width < 2.0 * @math.PI - 0.001 {
      for mode in [@drawing.HitMode::Nearest, XNearest] {
        assert_eq(frame.hit_test(cx - r * 0.5, cy, radius=1.0e6, mode~), None)
      }
    }
  }
  let fig = figure(width=400, height=240)
  let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  p.legend([])
  p.set_radius_max(1.0)
  p.bar([0.02], [1.0], width=0.1)
  let frame = fig.to_drawing()
  let (cx, cy, r) = frame.polar_circle(0).unwrap()
  for angle in [-0.03, 0.02, 0.07] {
    let point = frame
      .hit_test(
        cx + r * 0.7 * @math.cos(angle),
        cy - r * 0.7 * @math.sin(angle),
        radius=0.0,
      )
      .unwrap()
    assert_eq(point.data_x, 0.02)
  }
  assert_eq(
    frame.hit_test(
      cx + r * 0.7 * @math.cos(0.070001),
      cy - r * 0.7 * @math.sin(0.070001),
      radius=1.0e6,
    ),
    None,
  )
}

///|
test "polar bar reduced angle center supports clockwise offset and source raw radius without synthetic values" {
  for clockwise in [false, true] {
    let fig = figure(width=400, height=240)
    let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
    p.legend([])
    p.set_radius_max(1.0)
    p.set_theta_offset(1.0e308)
    if clockwise {
      p.set_direction(Clockwise)
    }
    let theta = -1.0e308
    p.bar([theta], [2.0], width=0.4)
    let frame = fig.to_drawing()
    let target = frame.targets()[0]
    let (cx, cy, r) = frame.polar_circle(0).unwrap()
    let reduced = theta % (2.0 * @math.PI)
    let phi = 1.0e308 % (2.0 * @math.PI) +
      (if clockwise { -reduced } else { reduced })
    let x = cx + r / 2.0 * @math.cos(phi)
    let y = cy - r / 2.0 * @math.sin(phi)
    assert_eq((target.info.point.screen_x, target.info.point.screen_y), (x, y))
    assert_eq(
      (target.info.point.data_x, target.info.point.data_y, target.info.value),
      (theta, 2.0, 2.0),
    )
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      assert_eq(
        frame.hit_test(x, y, radius=0.0, mode~),
        Some(target.info.point),
      )
    }
  }
}
