///|
test "facade exposes immutable area band samples and quadrilateral geometry" {
  let fig = @mathplotlib.figure(width=400, height=200)
  let ax = try! fig.add_axes(0.0, 0.0, 1.0, 1.0)
  try! ax.set_x_limits(0.0, 10.0)
  try! ax.set_y_limits(0.0, 10.0)
  ax.legend([])
  try! ax.fill_between([0.0, 10.0], [1.0, 2.0], [5.0, 8.0], label="Range")
  let frame = try! fig.to_drawing()
  let point = frame.hit_test(100.0, 140.0, radius=0.0).unwrap()
  let info : @mathplotlib.HitInfo = frame.hit_info(point).unwrap()
  let band : @mathplotlib.BandInfo = info.band.unwrap()
  assert_eq(info.kind, @mathplotlib.HitKind::Area)
  assert_eq((info.series, info.value, point.point_index), ("Range", 5.0, 0))
  assert_eq(
    (band.lower, band.upper, band.horizontal, band.stacked),
    (1.0, 5.0, false, false),
  )
  assert_true(
    frame.targets()[0].shape
    is @mathplotlib.HitShape::Quadrilateral(_, _, _, _, _, _, _, _),
  )
  assert_eq(frame.svg(), try! fig.to_svg_checked())
}
