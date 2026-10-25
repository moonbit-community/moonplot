///|
fn make_barb_consumer_figure(case : Int) -> @plot.Figure raise {
  let figure = @plot.figure(width=400, height=240)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(if case == 1 { 8.0 } else { 0.0 }, if case == 1 { 0.0 } else { 8.0 })
  axes.set_y_limits(if case == 1 { 8.0 } else { 0.0 }, if case == 1 { 0.0 } else { 8.0 })
  if case < 2 {
    axes.legend([])
    let xs = [1.0, 3.0, 6.0]
    let ys = [1.0, 4.0, 6.0]
    let us = [2.0, 0.0, -2.0]
    let vs = [3.0, 0.0, -4.0]
    axes.barbs(xs, ys, us, vs, barb_length=0.75, color="#9a6c3d", label="Wind")
    for values in [xs, ys, us, vs] { values[0] = 999.0 }
  } else if case < 4 {
    axes.legend([])
    axes.barbs_with_options(
      [2.0, 6.0, 4.0, 1.0], [2.0, 6.0, 4.0, 6.0],
      [1.5, -1.75, 0.0, 0.01], [0.0, 0.0, 0.0, 0.02],
      color="#9a6c3d", label="Wind symbols", linewidth=if case == 3 { 0.0 } else { 1.0 },
      barb_length=4.0, half_increment=0.25, full_increment=0.5, flag_increment=1.0,
      pivot="middle",
    )
  } else {
    axes.plot([0.0, 4.0], [1.0, 3.0], label="Original")
    axes.barbs([], [], [], [], label="Empty wind")
  }
  figure
}

///|
fn verify_barb_consumer() -> Unit raise {
  for case in 0..<4 {
    let figure = make_barb_consumer_figure(case)
    let frame = figure.to_drawing()
    assert_eq(frame.svg(), figure.to_svg_checked())
    assert_eq(figure.containers().length(), 0)
    let basic = case < 2
    let counts = if basic {
      [1, 1, 1, 1, 1, 1, 1, 1]
    } else if case == 2 {
      [1, 4, 1, 1, 4, 1, 1, 1, 1]
    } else {
      [0, 1, 0, 0, 1, 0, 0, 1, 1]
    }
    let observed = Array::make(counts.length(), 0)
    let mut segments = 0
    let mut flags = 0
    let mut circles = 0
    for target in frame.targets() {
      let info = target.info
      let artist = info.point.artist_index
      assert_true(artist >= 0 && artist < counts.length())
      observed[artist] += 1
      let i = if basic {
        if artist < 4 { 0 } else { 2 }
      } else if artist < 3 {
        0
      } else if artist < 7 {
        1
      } else {
        artist - 5
      }
      let expected_x = if basic { [1.0, 3.0, 6.0][i] } else { [2.0, 6.0, 4.0, 1.0][i] }
      let expected_y = if basic { [1.0, 4.0, 6.0][i] } else { [2.0, 6.0, 4.0, 6.0][i] }
      let expected_u = if basic { [2.0, 0.0, -2.0][i] } else { [1.5, -1.75, 0.0, 0.01][i] }
      let expected_v = if basic { [3.0, 0.0, -4.0][i] } else { [0.0, 0.0, 0.0, 0.02][i] }
      assert_eq(info.kind, @plot.HitKind::Barbs)
      assert_eq(info.point.point_index, i)
      assert_eq((info.point.data_x, info.point.data_y), (expected_x, expected_y))
      assert_eq(info.series, if basic { "Wind" } else { "Wind symbols" })
      let vector = info.vector.unwrap()
      assert_eq((vector.u, vector.v, info.value), (expected_u, expected_v, expected_v))
      assert_eq(info.interval, None)
      assert_eq(info.fraction, None)
      assert_eq(info.band, None)
      assert_eq(info.error, None)
      assert_eq(frame.hit_info(info.point), Some(info))
      match target.shape {
        @plot.HitShape::Segment(ax, ay, bx, by) => {
          segments += 1
          assert_true(ax != bx || ay != by)
          assert_true(basic || case == 2)
        }
        @plot.HitShape::Quadrilateral(_, _, _, _, cx, cy, dx, dy) => {
          flags += 1
          assert_true(!basic && (artist == 1 || artist == 4))
          assert_eq((cx, cy), (dx, dy))
        }
        @plot.HitShape::Sector(cx, cy, radius, start, end) => {
          circles += 1
          assert_true(!basic && artist >= 7)
          assert_true((radius - 1.2).abs() < 1.0e-10)
          assert_eq((start, end), (0.0, 360.0))
          let center = if i == 2 { (200.0, 120.0) } else { (50.25, 59.7) }
          assert_true((cx - center.0).abs() < 1.0e-10)
          assert_true((cy - center.1).abs() < 1.0e-10)
        }
        _ => fail("Unexpected Barbs interaction geometry")
      }
    }
    assert_eq(observed, counts)
    assert_eq((segments, flags, circles), if basic { (8, 0, 0) } else if case == 2 { (11, 2, 2) } else { (0, 2, 2) })
    for mode in [@plot.HitMode::Nearest, XNearest] {
      if basic {
        let x = if case == 1 { 340.0 } else { 60.0 }
        let y = if case == 1 { 39.0 } else { 201.0 }
        let info = frame.hit_info(frame.hit_test(x, y, radius=1.0e-6, mode~).unwrap()).unwrap()
        assert_eq((info.point.artist_index, info.point.point_index), (0, 0))
        let blank_x = if case == 1 { 300.0 } else { 100.0 }
        let blank_y = if case == 1 { 180.0 } else { 60.0 }
        assert_eq(frame.hit_test(blank_x, blank_y, radius=0.0, mode~), None)
      } else {
        let face = frame.hit_info(frame.hit_test(127.0, 174.75, radius=0.0, mode~).unwrap()).unwrap()
        assert_eq((face.point.artist_index, face.point.point_index), (1, 0))
        assert_eq((face.point.data_x, face.point.data_y), (2.0, 2.0))
        assert_eq(frame.hit_test(112.5, 165.0, radius=0.0, mode~), None)
        for (x, y, expected_i) in [(200.75, 120.0, 2), (50.85, 59.7, 3)] {
          let calm = frame.hit_info(frame.hit_test(x, y, radius=0.0, mode~).unwrap()).unwrap()
          assert_eq(calm.point.point_index, expected_i)
          assert_eq(calm.vector.unwrap().u, [1.5, -1.75, 0.0, 0.01][expected_i])
          assert_eq(calm.vector.unwrap().v, [0.0, 0.0, 0.0, 0.02][expected_i])
        }
      }
    }
  }
  let unchanged = make_barb_consumer_figure(4).to_drawing()
  assert_eq(unchanged.targets().length(), 2)
  for target in unchanged.targets() {
    assert_eq(target.info.kind, @plot.HitKind::Line)
    assert_eq(target.info.series, "Original")
  }
}
