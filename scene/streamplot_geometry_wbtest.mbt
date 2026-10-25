///|
test "streamplot clip and reversed axes retain original generated midpoint and raw color while anchoring visible real stroke" {
  for reversed in [false, true] {
    let (fig, _) = streamplot_control_fixture(2)
    let ax = fig.axes()
    ax.set_x_limits(
      if reversed {
        0.9
      } else {
        0.4
      },
      if reversed {
        0.4
      } else {
        0.9
      },
    )
    if reversed {
      ax.set_y_limits(2.0, 0.0)
    }
    let frame = fig.to_drawing()
    assert_eq(frame.targets().map(t => t.info.point.point_index), [0, 1, 2, 3])
    let p = frame.targets()[0].info.point
    assert_true((p.data_x - 0.35).abs() < 1.0e-14)
    assert_eq(
      frame.targets()[0].info.streamplot.unwrap().color_value,
      Some(p.data_x),
    )
    let (left, _, width, _) = frame.targets()[0].bounds
    assert_true(p.screen_x > left && p.screen_x < left + width)
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      assert_eq(
        frame
        .hit_info(
          frame.hit_test(p.screen_x, p.screen_y, radius=0.0, mode~).unwrap(),
        )
        .unwrap().point.point_index,
        0,
      )
    }
  }
}

///|
test "streamplot nonlinear valid run skips invalid domain points without bridging or renumbering" {
  let fig = figure(width=400, height=300)
  let ax = fig.axes()
  ax.set_axis_off()
  ignore(
    ax.streamplot(
      [-1.0, 0.0, 1.0],
      [0.0, 1.0, 2.0],
      [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
      [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
      density=0.2,
      max_steps=6,
      minlength=0.0,
      maxlength=1.0,
      start_points=[@core.point(-0.75, 0.5)],
      integration_direction="forward",
      broken_streamlines=false,
      arrows=false,
    ),
  )
  ax.set_x_scale(@scale.log_scale())
  ax.set_x_limits(0.01, 1.0)
  ax.set_y_limits(0.0, 2.0)
  let frame = fig.to_drawing()
  assert_eq(frame.targets().map(t => t.info.point.point_index), [4, 5])
  assert_true(
    frame
    .targets()
    .all(t => t.info.kind == Streamplot && t.info.point.data_x > 0.0),
  )
  assert_eq(frame.svg(), fig.to_svg_checked())
}

///|
test "streamplot both modes use CSS physical segment radius and actual paint over Area" {
  let (fig, _) = streamplot_control_fixture(0)
  let frame = fig.to_drawing()
  let p = frame.targets()[0].info.point
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    let x = 10.0 + p.screen_x * 2.0
    let y = 20.0 + p.screen_y * 2.0 + 3.0
    assert_eq(
      frame.hit_test_client(x, y, 10.0, 20.0, 800.0, 600.0, radius=2.0, mode~),
      None,
    )
    assert_eq(
      frame.hit_test_client(x, y, 10.0, 20.0, 800.0, 600.0, radius=3.0, mode~),
      Some(p),
    )
    assert_eq(
      frame.hit_test(p.screen_x, p.screen_y + 20.0, radius=2.0, mode~),
      None,
    )
  }
  for flow_last in [false, true] {
    let overlay = figure(width=400, height=300)
    let ax = overlay.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_limits(0.0, 2.0)
    ax.set_y_limits(0.0, 2.0)
    for pass in 0..<2 {
      if (pass == 1) == flow_last {
        ignore(
          ax.streamplot(
            [0.0, 1.0, 2.0],
            [0.0, 1.0, 2.0],
            [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
            [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
            density=0.2,
            max_steps=6,
            minlength=0.0,
            maxlength=1.0,
            start_points=[@core.point(0.25, 1.0)],
            integration_direction="forward",
            broken_streamlines=false,
            arrows=false,
            label="Flow",
          ),
        )
      } else {
        ax.fill_between([0.0, 2.0], [0.0, 0.0], [2.0, 2.0], label="Area")
      }
    }
    let result = overlay.to_drawing()
    let anchor = result.targets().filter(t => t.info.kind == Streamplot)[0].info.point
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let hit = result
        .hit_test(anchor.screen_x, anchor.screen_y, radius=0.0, mode~)
        .unwrap()
      assert_eq(
        result.hit_info(hit).unwrap().kind,
        if flow_last {
          Streamplot
        } else {
          Area
        },
      )
    }
  }
}
