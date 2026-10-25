///|
fn verify_step_consumer() -> Unit raise {
  for mode in ["pre", "post", "mid"] {
    let figure = @plot.figure(width=400, height=240)
    figure.legend([])
    figure.set_x_limits(0.0, 5.0)
    figure.set_y_limits(0.0, 8.0)
    let xs = [0.0, 2.0, 5.0]
    let ys = [2.0, 6.0, 4.0]
    figure.step(xs, ys, where_=mode, label="Steps")
    // The caller's input arrays are not the retained semantic snapshot.
    xs[1] = 2000.0
    ys[1] = 6000.0
    let frame = figure.to_drawing()
    assert_eq(frame.svg(), figure.to_svg_checked())
    let expected_x = [0.0, 2.0, 5.0]
    let expected_y = [2.0, 6.0, 4.0]
    let intervals = if mode == "pre" {
      [None, Some((0.0, 2.0)), Some((2.0, 5.0))]
    } else if mode == "post" {
      [Some((0.0, 2.0)), Some((2.0, 5.0)), None]
    } else {
      [Some((0.0, 1.0)), Some((1.0, 3.5)), Some((3.5, 5.0))]
    }
    let mut saw_segment = false
    for target in frame.targets() {
      let info = target.info
      assert_eq(info.kind, @plot.HitKind::Step)
      let i = info.point.point_index
      assert_true(i >= 0 && i < 3)
      assert_eq(info.series, "Steps")
      assert_eq((info.point.data_x, info.point.data_y), (expected_x[i], expected_y[i]))
      assert_eq(info.value, expected_y[i])
      assert_eq(info.interval, intervals[i])
      assert_eq(frame.hit_info(info.point), Some(info))
      if target.shape is @plot.HitShape::Segment(x0, y0, x1, y1) {
        saw_segment = true
        let picked = frame.hit_test((x0 + x1) / 2.0, (y0 + y1) / 2.0, radius=0.0).unwrap()
        let actual = frame.hit_info(picked).unwrap()
        assert_eq((actual.point.point_index, actual.value), (i, expected_y[i]))
      }
    }
    assert_true(saw_segment)
  }
}
