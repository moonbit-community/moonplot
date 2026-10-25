///|
test "step exact source endpoint survives fractional meet CSS roundtrip without absorbing real riser interiors" {
  let fig = figure(width=401, height=257)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(-1.7, 4.8)
  ax.set_y_limits(-3.2, 10.3)
  ax.legend([])
  ax.step([0.2, 1.9, 4.1], [2.3, 7.2, 4.4], where_="pre")
  let frame = fig.to_drawing()
  let canonical = frame.points().filter(p => p.point_index == 0)[0]
  let client_x = 128.10461538461536
  let client_y = 156.16361873095036
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    let selected = frame
      .hit_test_client(
        client_x,
        client_y,
        17.7,
        5.8999999999999995,
        377.7,
        255.7,
        radius=1.0e-6,
        mode~,
      )
      .unwrap()
    assert_eq(
      (selected.point_index, frame.hit_info(selected).unwrap().value),
      (0, 2.3),
    )
    // A real position one millionth of an SVG pixel inside the riser must
    // keep its incoming sample; the repair is only binary64 roundoff.
    let inside = frame
      .hit_test(
        canonical.screen_x,
        canonical.screen_y - 1.0e-6,
        radius=1.0e-5,
        mode~,
      )
      .unwrap()
    assert_eq(
      (inside.point_index, frame.hit_info(inside).unwrap().value),
      (1, 7.2),
    )
  }
}

///|
test "step coincident original samples retain the later source slot through zero edge capture in every draw mode" {
  for mode in ["pre", "post", "mid"] {
    for repeated in [2, 3] {
      let fig = figure(width=400, height=200)
      let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
      ax.set_x_limits(0.0, 10.0)
      ax.set_y_limits(0.0, 10.0)
      ax.legend([])
      let xs = Array::make(repeated, 2.0)
      let ys = Array::make(repeated, 3.0)
      xs.push(8.0)
      ys.push(6.0)
      ax.step(xs, ys, where_=mode)
      let frame = fig.to_drawing()
      assert_eq(frame.svg(), fig.to_svg_checked())
      for pick in [@drawing.HitMode::Nearest, XNearest] {
        let info = step_selected(frame, 80.0, 140.0, mode=pick)
        let interval = if mode == "pre" {
          (2.0, 2.0)
        } else if mode == "post" {
          (2.0, 8.0)
        } else {
          (2.0, 5.0)
        }
        assert_eq(
          (info.kind, info.point.point_index, info.value, info.interval),
          (Step, repeated - 1, 3.0, Some(interval)),
        )
      }
      assert_eq(
        step_selected(frame, 80.0, 180.0, mode=XNearest).point.point_index,
        repeated - 1,
      )
    }
  }
}

///|
test "stairs coincident outline originals keep later interval identity in both orientations" {
  for horizontal in [false, true] {
    let fig = figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_limits(0.0, 10.0)
    ax.set_y_limits(0.0, 10.0)
    ax.legend([])
    ax.stairs(
      [3.0, 3.0, 6.0],
      edges=[2.0, 2.0, 2.0, 8.0],
      orientation=if horizontal { "horizontal" } else { "vertical" },
    )
    let frame = fig.to_drawing()
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let info = step_selected(
        frame,
        if horizontal {
          120.0
        } else {
          80.0
        },
        if horizontal {
          160.0
        } else {
          140.0
        },
        mode~,
      )
      assert_eq(
        (info.kind, info.point.point_index, info.value, info.interval),
        (Stairs, 1, 3.0, Some((2.0, 2.0))),
      )
    }
  }
}
