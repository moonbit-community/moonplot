///|
test "polar closing-only chord endpoint maps to original zero without a synthetic identity" {
  let fig = figure(width=400, height=240)
  let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  p.set_radius_max(1.0)
  p.plot([0.0, 0.0, @math.PI / 2.0], [0.5, 0.5, 0.5], closed=true)
  let frame = fig.to_drawing()
  let indices = frame.targets().map(t => t.info.point.point_index)
  println("POLAR_CLOSING actual=\{@debug.Repr(indices)}")
  assert_eq(indices, [0, 1, 2])
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    let first = frame.targets()[0].info.point
    assert_eq(
      frame.hit_test(first.screen_x, first.screen_y, radius=0.0, mode~),
      Some(first),
    )
  }
}

///|
test "polar raw radius above max cannot become an in-domain observation through screen rounding" {
  let fig = figure(width=400, height=240)
  let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  p.set_radius_max(1.0)
  p.scatter([0.0, 0.0], [1.0, 1.0000000000000002])
  let frame = fig.to_drawing()
  let indices = frame.targets().map(t => t.info.point.point_index)
  println("POLAR_OUTSIDE_ROUNDING actual=\{@debug.Repr(indices)}")
  assert_eq(indices, [0])
}

///|
test "polar fractional panel outer anchors survive projection roundoff without a hover-radius expansion" {
  for titled in [false, true] {
    let fig = figure(width=400, height=240)
    let p = fig.add_polar_axes(0.12, 0.18, 0.76, 0.64)
    if titled {
      p.set_title("Boundary")
    }
    p.set_radius_max(1.0)
    let theta = [
      0.0,
      @math.PI / 2.0,
      @math.PI,
      3.0 * @math.PI / 2.0,
      @math.PI / 6.0,
    ]
    p.plot(theta, [1.0, 1.0, 1.0, 1.0, 1.0])
    p.scatter(theta, [1.0, 1.0, 1.0, 1.0, 1.0])
    let frame = fig.to_drawing()
    println(
      "POLAR_FRACTIONAL circle=\{@debug.Repr(frame.polar_circle(0).unwrap())} actual=\{@debug.Repr(frame.targets().map(t => (t.info.point.artist_index,t.info.point.point_index)))}",
    )
    assert_eq(frame.targets().length(), 10)
    assert_eq(frame.svg(), fig.to_svg_checked())
    for target in frame.targets() {
      let point = target.info.point
      for mode in [@drawing.HitMode::Nearest, XNearest] {
        assert_true(
          frame.hit_test(point.screen_x, point.screen_y, radius=0.0, mode~)
          is Some(_),
        )
      }
    }
    let (cx, cy, r) = frame.polar_circle(0).unwrap()
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      assert_eq(frame.hit_test(cx + r + 1.0e-8, cy, radius=1.0e9, mode~), None)
      assert_eq(frame.hit_test(cx + r, cy + r, radius=1.0e9, mode~), None)
    }
  }
}
