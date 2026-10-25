///|
test "facade Quiver exposes typed original components and indices for actual arrow parts" {
  let fig = @mathplotlib.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 5.0)
  ax.set_y_limits(0.0, 5.0)
  let xs = [1.0, 2.0, 3.0]
  let ys = [1.0, 2.0, 4.0]
  let us = [2.0, 0.0, -1.0]
  let vs = [1.0, 0.0, -2.0]
  ax.quiver(xs, ys, us, vs, label="velocity")
  let frame = fig.to_drawing()
  for array in [xs, ys, us, vs] {
    array[0] = 99.0
  }
  assert_eq(fig.to_drawing().targets(), frame.targets())
  assert_eq(frame.targets().map(t => t.info.point.point_index), [
    0, 0, 0, 2, 2, 2,
  ])
  for target in frame.targets() {
    for mode in [@mathplotlib.HitMode::Nearest, XNearest] {
      let point = frame
        .hit_test(
          target.info.point.screen_x,
          target.info.point.screen_y,
          radius=1.0e-7,
          mode~,
        )
        .unwrap()
      let info = frame.hit_info(point).unwrap()
      let vector : @mathplotlib.VectorInfo = info.vector.unwrap()
      let expected = if point.point_index == 0 {
        (1.0, 1.0, 2.0, 1.0)
      } else {
        (3.0, 4.0, -1.0, -2.0)
      }
      assert_eq((point.data_x, point.data_y, vector.u, vector.v), expected)
      assert_eq(
        (info.kind, point.artist_index, info.value, info.series),
        (@mathplotlib.HitKind::Quiver, 0, vector.v, "velocity"),
      )
    }
  }
}
