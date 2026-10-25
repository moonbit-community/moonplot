///|
test "facade step semantics identify original samples through real plateau and jump hits" {
  let fig = @mathplotlib.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 5.0)
  ax.set_y_limits(0.0, 10.0)
  ax.legend([])
  ax.step([0.0, 2.0, 5.0], [2.0, 6.0, 4.0], where_="post")
  let frame = fig.to_drawing()
  let info = frame
    .hit_info(frame.hit_test(80.0, 160.0, radius=0.0).unwrap())
    .unwrap()
  assert_eq(
    (info.kind, info.point.point_index, info.value, info.interval),
    (@mathplotlib.HitKind::Step, 0, 2.0, Some((0.0, 2.0))),
  )
}
