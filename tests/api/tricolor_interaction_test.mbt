///|
test "facade Tripcolor preserves immutable original tuple mode face slot and raw value" {
  let typed : @mathplotlib.TriColorInfo = @mathplotlib.tricolor_info(
    (2, 0, 1),
    vertex_mean=true,
  )
  assert_eq(typed.vertices, (2, 0, 1))
  assert_true(typed.vertex_mean)
  let fig = @mathplotlib.figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 1.0)
  ax.set_y_limits(0.0, 1.0)
  ax.tripcolor(
    [0.0, 1.0, 0.0],
    [0.0, 0.0, 1.0],
    [[0, 1, 2]],
    [7.0],
    label="Public face",
  )
  let frame = fig.to_drawing()
  let p = frame.hit_test(80.0, 240.0, radius=0.0).unwrap()
  let info : @mathplotlib.HitInfo = frame.hit_info(p).unwrap()
  assert_eq(
    (info.kind, info.series, info.value, p.point_index),
    (@mathplotlib.HitKind::Tripcolor, "Public face", 7.0, 0),
  )
  assert_eq(info.tricolor.unwrap(), @mathplotlib.tricolor_info((0, 1, 2)))
  assert_eq(fig.containers().length(), 0)
}
