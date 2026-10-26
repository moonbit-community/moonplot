///|
test "facade polar bar requires angular width and exposes raw Bar data with no container or extra semantic values" {
  let figure = @mathplotlib.figure(width=400, height=240)
  let panel : @mathplotlib.PolarAxes = figure.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  panel.set_radius_max(1.0)
  panel.bar([0.0, 1.0], [1.2, 0.0], width=0.5, label="Rose")
  guard figure.artists()[0] is Bar(points, _) else { fail("Bar") }
  assert_eq(points.length(), 2)
  assert_eq(points[0].y(), 1.2)
  assert_eq(figure.containers().length(), 0)
  let frame = figure.to_drawing()
  assert_eq(frame.targets().length(), 1)
  let point = frame.targets()[0].info.point
  let hit = frame.hit_test(point.screen_x, point.screen_y, radius=0.0).unwrap()
  let info = frame.hit_info(hit).unwrap()
  assert_eq(info.kind, PolarBar)
  assert_eq(
    (info.point.data_x, info.point.data_y, info.value, info.series),
    (0.0, 1.2, 1.2, "Rose"),
  )
  assert_eq(info.interval, None)
  assert_eq(info.fraction, None)
}
