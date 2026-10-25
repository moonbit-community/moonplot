///|
test "facade stairs retains original interval and signed fill bounds" {
  let fig = @mathplotlib.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 4.0)
  ax.set_y_limits(-3.0, 5.0)
  ax.legend([])
  ax.stairs([3.0, -2.0], edges=[0.0, 1.0, 4.0], baseline=1.0, fill=true)
  let frame = fig.to_drawing()
  let info = frame
    .hit_info(frame.hit_test(250.0, 137.5, radius=0.0).unwrap())
    .unwrap()
  assert_eq(
    (info.kind, info.point.point_index, info.value, info.interval),
    (@mathplotlib.HitKind::Stairs, 1, -2.0, Some((1.0, 4.0))),
  )
  let band = info.band.unwrap()
  assert_eq((band.lower, band.upper, band.horizontal), (1.0, -2.0, false))
}
