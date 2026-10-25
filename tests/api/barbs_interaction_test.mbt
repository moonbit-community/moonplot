///|
test "facade Barbs middle pivot returns original input anchor and vector on actual components" {
  let fig = @mathplotlib.figure(width=400, height=280)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 14.0)
  ax.set_y_limits(0.0, 14.0)
  ax.barbs_with_options(
    [5.0, 10.0],
    [3.0, 2.0],
    [6.5, 0.1],
    [0.0, 0.2],
    half_increment=0.5,
    full_increment=1.0,
    flag_increment=5.0,
    barb_length=12.0,
    pivot="middle",
    label="wind",
  )
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), 8)
  assert_eq(fig.containers().length(), 0)
  for target in frame.targets() {
    let selected = frame
      .hit_test(
        target.info.point.screen_x,
        target.info.point.screen_y,
        radius=1.0e-7,
      )
      .unwrap()
    let info = frame.hit_info(selected).unwrap()
    let vector : @mathplotlib.VectorInfo = info.vector.unwrap()
    let expected = if info.point.point_index == 0 {
      (5.0, 3.0, 6.5, 0.0)
    } else {
      (10.0, 2.0, 0.1, 0.2)
    }
    assert_eq(
      (info.kind, info.series, info.value),
      (@mathplotlib.HitKind::Barbs, "wind", vector.v),
    )
    assert_eq(
      (info.point.data_x, info.point.data_y, vector.u, vector.v),
      expected,
    )
  }
}
