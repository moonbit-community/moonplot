///|
test "polar raw theta radius call label and radar categories survive display-label changes and independent plain calls" {
  let fig = figure(width=400, height=240)
  let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  p.set_radius_max(10.0)
  let values = [3.0, 0.0, 6.0]
  let categories = ["North", "Center", "South"]
  p.radar(values, categories, label="Original radar")
  let old = fig.to_drawing()
  assert_eq(old.targets().length(), 3)
  values[0] = 90.0
  categories[0] = "Mutated"
  p.set_theta_ticks([0.0], labels=["Display only"])
  p.legend([])
  p.plot([0.0, 0.5], [4.0, 2.0], label="Plain")
  let now = fig.to_drawing()
  assert_eq(now.targets().length(), 5)
  for target in now.targets() {
    let info = target.info
    assert_eq(info.kind, Polar)
    assert_eq(info.value, info.point.data_y)
    if info.point.artist_index == 0 {
      assert_eq(info.series, "Original radar")
      assert_eq(
        info.category,
        Some(["North", "Center", "South"][info.point.point_index]),
      )
      assert_eq(
        info.point.data_x,
        2.0 * @math.PI * info.point.point_index.to_double() / 3.0,
      )
      assert_eq(info.point.data_y, [3.0, 0.0, 6.0][info.point.point_index])
    } else {
      assert_eq(info.category, None)
      assert_eq(info.series, "Plain")
    }
  }
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    let at_center = now.hit_test(200.0, 120.0, radius=0.0, mode~).unwrap()
    assert_eq(
      (at_center.artist_index, at_center.point_index, at_center.data_y),
      (0, 1, 0.0),
    )
    assert_eq(now.hit_info(at_center).unwrap().category, Some("Center"))
  }
  assert_eq(old.targets().length(), 3)
  assert_eq(old.targets()[0].info.category, Some("North"))
}

///|
test "polar missing and outside source slots do not acquire synthetic closure or singleton line targets" {
  let (fig, _) = polar_control_figure(2)
  let frame = fig.to_drawing()
  assert_eq(
    frame
    .targets()
    .map(t => (t.info.point.artist_index, t.info.point.point_index)),
    [(0, 3), (1, 0), (1, 3)],
  )
  assert_eq(frame.targets()[0].info.point.data_x, @math.PI)
  assert_eq(frame.targets()[0].info.value, 0.0)
  assert_eq(frame.svg(), fig.to_svg_checked())
}

///|
test "polar exact outer sample at noncardinal angle remains selectable under the actual circle" {
  let fig = figure(width=400, height=240)
  let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  p.legend([])
  p.set_radius_max(1.0)
  p.scatter([@math.PI / 6.0], [1.0], label="Boundary")
  let frame = fig.to_drawing()
  println(
    "POLAR_BOUNDARY targets=\{frame.targets().length()} circle=\{frame.polar_circle(0).unwrap()}",
  )
  assert_eq(frame.targets().length(), 1)
  let point = frame.targets()[0].info.point
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    assert_eq(
      frame.hit_test(point.screen_x, point.screen_y, radius=0.0, mode~),
      Some(point),
    )
  }
}
