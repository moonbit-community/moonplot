///|
test "barbs actual shaft feather flag fill edges and calm disk retain original input vector and component identity" {
  let counts = [8, 11, 3, 2, 3, 3, 1, 0]
  let artists = [8, 8, 3, 2, 4, 4, 4, 0]
  let component_indices = [
    [0, 1, 2, 3, 4, 5, 6, 7],
    [0, 1, 1, 1, 1, 2, 3, 4, 5, 6, 7],
    [0, 1, 2],
    [0, 1],
    [1, 2, 3],
    [0, 2, 3],
    [0],
    [],
  ]
  for case in 0..<8 {
    let fig = barbs_control_figure(case)
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_eq(fig.artists().length(), artists[case])
    assert_eq(fig.containers().length(), 0)
    assert_eq(frame.targets().length(), counts[case])
    assert_eq(
      frame.targets().map(t => t.info.point.artist_index),
      component_indices[case],
    )
    let expected = match case {
      0 => [(1.0, 1.0, 2.0, 1.0), (3.0, 2.0, 0.0, 0.0), (5.0, 3.0, -1.0, 1.0)]
      1 => [(0.0, 0.0, 55.0, 0.0), (2.0, 1.0, 25.0, 0.0), (4.0, 3.0, 0.0, 0.0)]
      2 => [(10.0, 10.0, -12.0, -5.0)]
      3 => [(1.0, 1.0, 1.0, 0.0), (4.0, 3.0, 0.0, 0.0)]
      4 => [(0.0, 1.0, 4.0, 0.0)]
      5 => [(-2.0, 1.0, 10.0, 0.0)]
      6 => [(-8.0e307, -8.0e307, 1.7e308, 1.7e308)]
      _ => []
    }
    for target in frame.targets() {
      assert_eq(target.info.kind, Barbs)
      assert_true(!(target.shape is Point))
      for mode in [@drawing.HitMode::Nearest, XNearest] {
        let point = frame
          .hit_test(
            target.info.point.screen_x,
            target.info.point.screen_y,
            radius=1.0e-7,
            mode~,
          )
          .unwrap()
        let info = frame.hit_info(point).unwrap()
        let (x, y, u, v) = expected[info.point.point_index]
        assert_eq(
          (info.kind, info.point.data_x, info.point.data_y, info.value),
          (Barbs, x, y, v),
        )
        assert_eq(info.vector, Some(@drawing.vector_info(u, v)))
        assert_eq(info.band, None)
        if case == 0 {
          assert_eq(info.series, "basic")
        }
        if case == 1 {
          assert_eq(info.series, "advanced")
        }
      }
    }
    if case == 0 {
      assert_eq(frame.targets().map(t => t.info.point.point_index), [
        0, 0, 0, 0, 2, 2, 2, 2,
      ])
    }
    if case == 3 {
      assert_true(frame.targets().all(t => t.shape is Sector(_, _, _, _, _)))
    }
  }
}

///|
test "barbs source copies retain original values and constant component guards reject changed paths and copied artists" {
  let fig = figure()
  let ax = fig.axes()
  let xs = [1.0]
  let ys = [1.0]
  let us = [2.0]
  let vs = [1.0]
  ax.barbs(xs, ys, us, vs, label="original")
  let old = fig.to_drawing()
  for array in [xs, ys, us, vs] {
    array[0] = 99.0
  }
  assert_eq(fig.to_drawing().targets(), old.targets())
  guard ax.state.val.artists[0] is Artist::Line(points, _) else {
    fail("Expected shaft")
  }
  let copied = copy_artist(ax.state.val.artists[0])
  assert_true(ax.state.val.hit_metadata(copied, 0, @ref.Ref(0)).barb() is None)
  points[0] = @core.point(1.0, 2.0)
  assert_eq(
    fig
    .to_drawing()
    .targets()
    .filter(t => t.info.point.artist_index == 0)
    .length(),
    0,
  )
  assert_eq(old.targets()[0].info.vector, Some(@drawing.vector_info(2.0, 1.0)))
  ax.clear_checked()
  ax.plot([0.0, 1.0], [0.0, 1.0])
  assert_true(fig.to_drawing().targets().all(t => t.info.kind == Line))
}

///|
test "Barbs partial invalid calls retain original indices and immutable label on every completed component" {
  for advanced in [false, true] {
    let fig = figure()
    let ax = fig.axes()
    try {
      if advanced {
        ax.barbs_with_options(
          [0.0, 1.0],
          [0.0, 0.0],
          [55.0, 0.0 / 0.0],
          [0.0, 0.0],
          label="prefix",
        )
      } else {
        ax.barbs(
          [0.0, 1.0],
          [0.0, 0.0],
          [2.0, 0.0 / 0.0],
          [1.0, 0.0],
          label="prefix",
        )
      }
    } catch {
      _ => ()
    } noraise {
      _ => fail("Expected ordered error")
    }
    let frame = fig.to_drawing()
    assert_true(frame.targets().length() > 0)
    for target in frame.targets() {
      assert_eq(
        (target.info.kind, target.info.series, target.info.point.point_index),
        (Barbs, "prefix", 0),
      )
    }
    ax.barbs([], [], [], [], label="empty")
    assert_eq(fig.to_drawing().targets(), frame.targets())
  }
}

///|
test "Barbs filled triangle and calm disk use their real interiors with no bounding box or panel fallback" {
  let flags = barbs_control_figure(1).to_drawing()
  let flag = flags
    .targets()
    .filter(t => t.shape is Quadrilateral(_, _, _, _, _, _, _, _))[0]
  let circles = barbs_control_figure(3).to_drawing()
  let circle = circles.targets()[0]
  guard circle.shape is Sector(cx, cy, r, _, _) else {
    fail("Expected actual calm disk")
  }
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    let selected = flags
      .hit_test(
        flag.info.point.screen_x,
        flag.info.point.screen_y,
        radius=0.0,
        mode~,
      )
      .unwrap()
    assert_eq(flags.hit_info(selected).unwrap().point.artist_index, 1)
    assert_eq(flags.hit_test(301.0, 81.0, radius=0.0, mode~), None)
    let selected = circles
      .hit_test(cx + r * 0.75, cy, radius=0.0, mode~)
      .unwrap()
    assert_eq(
      circles.hit_info(selected).unwrap().vector,
      Some(@drawing.vector_info(1.0, 0.0)),
    )
    assert_eq(circles.hit_test(cx + r * 1.25, cy, radius=0.0, mode~), None)
    assert_eq(circles.hit_test(100.0, 100.0, radius=0.0, mode~), None)
  }
}

///|
test "Barbs known transparent paint has no ghost while zero stroke width retains real flag and calm fill" {
  for color in ["none", "transparent", "#1230", "rgba(0,0,0,0)"] {
    let fig = figure()
    fig.barbs([0.0], [0.0], [1.0], [1.0], color~)
    fig.barbs_with_options(
      [0.0, 2.0],
      [0.0, 2.0],
      [55.0, 0.0],
      [0.0, 0.0],
      color~,
    )
    assert_eq(fig.to_drawing().targets().length(), 0)
  }
  let fig = figure()
  fig.barbs_with_options(
    [0.0, 10.0],
    [0.0, 10.0],
    [55.0, 0.0],
    [0.0, 0.0],
    linewidth=0.0,
    barb_length=5.0,
  )
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), 2)
  assert_true(frame.targets()[0].shape is Quadrilateral(_, _, _, _, _, _, _, _))
  assert_true(frame.targets()[1].shape is Sector(_, _, _, _, _))
}
