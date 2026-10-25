///|
fn verify_vector_consumer() -> Unit raise {
  for reverse in [false, true] {
    let figure = @plot.figure(width=400, height=240)
    let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
    axes.set_x_limits(if reverse { 8.0 } else { -2.0 }, if reverse { -2.0 } else { 8.0 })
    axes.set_y_limits(if reverse { 8.0 } else { -4.0 }, if reverse { -4.0 } else { 8.0 })
    axes.legend([])
    let xs = [0.0, 2.0, 4.0, 6.0]
    let ys = [0.0, 2.0, 0.0, 4.0]
    let us = [4.0, 0.0, -2.0, -1.0]
    let vs = [2.0, 0.0, 3.0, -2.0]
    axes.quiver(xs, ys, us, vs, label="Velocity")
    let container = axes.containers()[0]
    assert_true(container.kind() is Quiver)
    assert_eq(container.label(), "Velocity")
    assert_eq(container.artists().length(), 1)
    xs[0] = 999.0
    ys[0] = 999.0
    us[0] = 999.0
    vs[0] = 999.0
    let frame = figure.to_drawing()
    assert_eq(frame.svg(), figure.to_svg_checked())
    assert_eq(frame.targets().length(), 9)
    let counts = [0, 0, 0, 0]
    for target in frame.targets() {
      let info = target.info
      let i = info.point.point_index
      assert_true(i == 0 || i == 2 || i == 3)
      counts[i] += 1
      assert_eq(info.kind, @plot.HitKind::Quiver)
      assert_eq(info.series, "Velocity")
      assert_eq(info.point.artist_index, 0)
      assert_eq((info.point.data_x, info.point.data_y), ([0.0, 2.0, 4.0, 6.0][i], [0.0, 2.0, 0.0, 4.0][i]))
      let vector = info.vector.unwrap()
      assert_eq((vector.u, vector.v), ([4.0, 0.0, -2.0, -1.0][i], [2.0, 0.0, 3.0, -2.0][i]))
      assert_eq(info.value, vector.v)
      assert_eq(info.interval, None)
      assert_eq(info.fraction, None)
      assert_eq(info.band, None)
      assert_eq(info.error, None)
      assert_true(target.shape is @plot.HitShape::Segment(_, _, _, _))
      assert_eq(frame.hit_info(info.point), Some(info))
    }
    assert_eq(counts, [3, 0, 3, 3])
    for mode in [@plot.HitMode::Nearest, XNearest] {
      let x = if reverse { 240.0 } else { 160.0 }
      let y = if reverse { 100.0 } else { 140.0 }
      let info = frame.hit_info(frame.hit_test(x, y, radius=1.0e-6, mode~).unwrap()).unwrap()
      assert_eq((info.point.point_index, info.point.data_x, info.point.data_y), (0, 0.0, 0.0))
      let vector = info.vector.unwrap()
      assert_eq((vector.u, vector.v, info.value), (4.0, 2.0, 2.0))
      // The zero vector at index1 produces no observed geometry, in either mode.
      let blank_x = if reverse { 240.0 } else { 160.0 }
      let blank_y = if reverse { 120.0 } else { 120.0 }
      assert_eq(frame.hit_test(blank_x, blank_y, radius=0.0, mode~), None)
    }
  }
  let figure = @plot.figure(width=400, height=240)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.legend([])
  axes.quiver([-2.0], [0.0], [8.0], [0.0], label="Crossing")
  let frame = figure.to_drawing()
  assert_eq(frame.targets().length(), 1)
  for mode in [@plot.HitMode::Nearest, XNearest] {
    let info = frame.hit_info(frame.hit_test(200.0, 120.0, radius=0.0, mode~).unwrap()).unwrap()
    assert_eq((info.point.point_index, info.point.data_x, info.point.data_y), (0, -2.0, 0.0))
    assert_eq((info.vector.unwrap().u, info.vector.unwrap().v, info.value), (8.0, 0.0, 0.0))
  }
}
