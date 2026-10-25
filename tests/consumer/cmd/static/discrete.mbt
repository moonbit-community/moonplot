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

///|
fn verify_step_roundtrip_consumer() -> Unit raise {
  let figure = @plot.figure(width=401, height=257)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(-1.7, 4.8)
  axes.set_y_limits(-3.2, 10.3)
  axes.legend([])
  axes.step([0.2, 1.9, 4.1], [2.3, 7.2, 4.4], where_="pre")
  let frame = figure.to_drawing()
  let mut endpoint = None
  for target in frame.targets() {
    if target.info.kind == @plot.HitKind::Step &&
      target.info.point.point_index == 0 &&
      target.shape == @plot.HitShape::Point {
      endpoint = Some(target.info.point)
    }
  }
  let source = endpoint.unwrap()
  let left = 17.7
  let top = 5.8999999999999995
  let width = 377.7
  let height = 255.7
  let scale = (width / 401.0).min(height / 257.0)
  let client_x = left + (width - 401.0 * scale) / 2.0 + source.screen_x * scale
  let client_y = top + (height - 257.0 * scale) / 2.0 + source.screen_y * scale
  let picked = frame.hit_test_client(client_x, client_y, left, top, width, height, radius=1.0e-6).unwrap()
  let info = frame.hit_info(picked).unwrap()
  assert_eq((info.point.point_index, info.value), (0, 2.3))
  assert_eq((info.point.data_x, info.point.data_y), (0.2, 2.3))
}

///|
fn verify_stairs_consumer() -> Unit raise {
  for horizontal in [false, true] {
    for filled in [false, true] {
      let figure = @plot.figure(width=400, height=240)
      figure.legend([])
      if horizontal {
        figure.set_x_limits(-3.0, 4.0)
        figure.set_y_limits(0.0, 4.0)
      } else {
        figure.set_x_limits(0.0, 4.0)
        figure.set_y_limits(-3.0, 4.0)
      }
      figure.stairs(
        [3.0, -2.0],
        edges=[0.0, 1.0, 4.0],
        orientation=if horizontal { "horizontal" } else { "vertical" },
        baseline=1.0,
        fill=filled,
        label="Intervals",
      )
      let frame = figure.to_drawing()
      assert_eq(frame.svg(), figure.to_svg_checked())
      assert_true(!frame.targets().is_empty())
      for target in frame.targets() {
        let info = target.info
        assert_eq(info.kind, @plot.HitKind::Stairs)
        assert_eq(info.series, "Intervals")
        let i = info.point.point_index
        assert_true(i == 0 || i == 1)
        let value = if i == 0 { 3.0 } else { -2.0 }
        let start = if i == 0 { 0.0 } else { 1.0 }
        let end = if i == 0 { 1.0 } else { 4.0 }
        assert_eq(info.value, value)
        assert_eq(info.interval, Some((start, end)))
        assert_eq((info.point.data_x, info.point.data_y), if horizontal { (value, start) } else { (start, value) })
        assert_eq(frame.hit_info(info.point), Some(info))
        if filled {
          let band = info.band.unwrap()
          assert_eq((band.lower, band.upper), (1.0, value))
          assert_eq(band.horizontal, horizontal)
          assert_true(!band.stacked)
        } else {
          assert_eq(info.band, None)
        }
      }
    }
  }
}
