///|
test "contour resolved automatic levels corner masking and public visibility retain actual path metadata" {
  let nan = 0.0 / 0.0
  for corner_mask in [false, true] {
    let fig = figure()
    let result = fig.contour(
      [[0.0, 2.0], [nan, 4.0]],
      levels=[1.0],
      corner_mask~,
      label="Masked",
    )
    let frame = fig.to_drawing()
    assert_eq(result.segments().length(), if corner_mask { 1 } else { 0 })
    assert_eq(frame.targets().length(), if corner_mask { 1 } else { 0 })
    assert_true(
      frame
      .targets()
      .all(t => {
        t.info.kind == Contour &&
        t.info.value == 1.0 &&
        t.info.series == "Masked"
      }),
    )
  }
  let fig = figure()
  let result = fig.contour(
    [[0.0, 1.0, 2.0], [1.0, 2.0, 3.0], [2.0, 3.0, 4.0]],
    nlevels=4,
    label="Automatic",
  )
  let frame = fig.to_drawing()
  assert_true(frame.targets().length() > 0)
  for target in frame.targets() {
    assert_eq(
      target.info.value,
      result.segment_levels()[target.info.point.point_index],
    )
    assert_true(result.levels().contains(target.info.value))
  }
  for color in ["none", "transparent"] {
    let invisible = figure()
    ignore(invisible.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5], color~))
    assert_eq(invisible.to_drawing().targets().length(), 0)
  }
  let invisible = figure()
  ignore(
    invisible.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5], linewidth=0.0),
  )
  assert_eq(invisible.to_drawing().targets().length(), 0)
}

///|
test "contour logarithmic invalid prefix and reversed clipped viewport keep generated preclip anchors" {
  for reverse in [false, true] {
    let fig = figure(width=400, height=300)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_scale(@scale.Log)
    ax.set_x_limits(
      if reverse {
        6.0
      } else {
        0.5
      },
      if reverse {
        0.5
      } else {
        6.0
      },
    )
    ax.set_y_limits(
      if reverse {
        3.0
      } else {
        1.0
      },
      if reverse {
        1.0
      } else {
        3.0
      },
    )
    ignore(
      ax.contour(
        [[0.0, 0.0, 0.0], [2.0, 2.0, 2.0], [4.0, 4.0, 4.0]],
        x=[-10.0, 1.0, 10.0],
        y=[1.0, 2.0, 3.0],
        levels=[1.0],
        label="Log",
      ),
    )
    let frame = fig.to_drawing()
    assert_eq(frame.targets().length(), 2)
    let anchors = frame.targets().map(t => t.info.point.data_x)
    assert_true(anchors.contains(3.25))
    assert_true(anchors.contains(7.75))
    for target in frame.targets() {
      assert_eq(
        (target.info.kind, target.info.value, target.info.point.data_y),
        (Contour, 1.0, 1.5),
      )
      let p = target.info.point
      for mode in [@drawing.HitMode::Nearest, XNearest] {
        assert_eq(
          frame
          .hit_info(
            frame
            .hit_test(p.screen_x, p.screen_y, radius=1.0e-7, mode~)
            .unwrap(),
          )
          .unwrap().kind,
          Contour,
        )
        assert_eq(
          frame.hit_test(
            p.screen_x,
            if reverse {
              20.0
            } else {
              280.0
            },
            radius=0.1,
            mode~,
          ),
          None,
        )
      }
    }
  }
}

///|
test "contour generated edge midpoint remains finite when a direct endpoint sum would overflow" {
  let fig = figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(9.0e307, 1.3e308)
  ax.set_y_limits(0.0, 2.0)
  ax.set_x_ticks([1.0e308, 1.2e308])
  ignore(
    ax.contour(
      [[0.0, 0.0], [2.0, 2.0]],
      x=[1.0e308, 1.2e308],
      y=[0.0, 2.0],
      levels=[1.0],
      label="Large",
    ),
  )
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), 2)
  let anchors = frame.targets().map(t => t.info.point.data_x)
  assert_true(anchors.any(x => (x / 1.05e308 - 1.0).abs() < 1.0e-14))
  assert_true(anchors.any(x => (x / 1.15e308 - 1.0).abs() < 1.0e-14))
  for target in frame.targets() {
    let p = target.info.point
    assert_eq((p.data_y, target.info.value), (1.0, 1.0))
    assert_eq(
      frame
      .hit_info(frame.hit_test(p.screen_x, p.screen_y, radius=1.0e-7).unwrap())
      .unwrap().series,
      "Large",
    )
  }
}

///|
test "closed contour paths remain physical strokes with an empty center in both modes" {
  let fig = figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 2.0)
  ax.set_y_limits(0.0, 2.0)
  let result = ax.contour(
    [[2.0, 2.0, 2.0], [2.0, 0.0, 2.0], [2.0, 2.0, 2.0]],
    levels=[1.5],
    label="Loop",
  )
  let frame = fig.to_drawing()
  assert_eq(result.segments().length(), 1)
  assert_eq(frame.targets().length(), result.segments()[0].length() - 1)
  assert_true(frame.targets().all(t => t.shape is Segment(_, _, _, _)))
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    assert_eq(frame.hit_test(200.0, 150.0, radius=0.1, mode~), None)
  }
}

///|
test "contour panel call identity and CSS pixel radius follow the exact Drawing viewport" {
  let fig = figure(width=400, height=200)
  for i in 0..<2 {
    let ax = fig.add_axes(i.to_double() / 2.0, 0.0, 0.5, 1.0)
    ax.set_x_limits(0.0, 2.0)
    ax.set_y_limits(0.0, 2.0)
    ignore(
      ax.contour(
        [[0.0, 0.0], [2.0, 2.0]],
        levels=[1.0],
        color="red",
        label="Panel\{i}",
      ),
    )
  }
  let frame = fig.to_drawing()
  for i in 0..<2 {
    let targets = frame.targets().filter(t => t.info.point.panel_index == i)
    assert_eq(targets.length(), 2)
    let p = targets[0].info.point
    let client_x = 10.0 + p.screen_x * 2.0
    let client_y = 20.0 + p.screen_y * 2.0 + 6.0
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      assert_eq(
        frame.hit_test_client(
          client_x,
          client_y,
          10.0,
          20.0,
          800.0,
          400.0,
          radius=5.99,
          mode~,
        ),
        None,
      )
      let selected = frame
        .hit_test_client(
          client_x,
          client_y,
          10.0,
          20.0,
          800.0,
          400.0,
          radius=6.01,
          mode~,
        )
        .unwrap()
      assert_eq(frame.hit_info(selected).unwrap().series, "Panel\{i}")
      assert_eq(selected.panel_index, i)
    }
  }
}
