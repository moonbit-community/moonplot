///|
fn streamplot_consumer_fixture(
  case : Int32,
) -> (@plot.Figure, @plot.StreamplotSet) raise {
  let figure = @plot.figure(width=400, height=300)
  figure.axes().set_axis_off()
  figure.legend([])
  figure.set_x_limits(0.0, 2.0)
  figure.set_y_limits(0.0, 2.0)
  let xs = [0.0, 1.0, 2.0]
  let us = [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]]
  let vs = [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]]
  let starts = [@plot.point(0.25, 0.5), @plot.point(0.25, 1.5)]
  let flow = if case == 0 {
    figure.streamplot(
      xs,
      xs,
      us,
      vs,
      density=0.2,
      max_steps=6,
      minlength=0.0,
      maxlength=1.0,
      start_points=starts,
      integration_direction="forward",
      broken_streamlines=false,
      arrows=false,
      color="#398575",
      linewidth=1.5,
      label="Fixed flow",
    )
  } else if case == 1 {
    figure.streamplot_mesh(
      [[0.0, 1.0, 2.0], [0.0, 1.0, 2.0], [0.0, 1.0, 2.0]],
      [[0.0, 0.0, 0.0], [1.0, 1.0, 1.0], [2.0, 2.0, 2.0]],
      us,
      vs,
      density=0.2,
      max_steps=6,
      minlength=0.0,
      maxlength=1.0,
      start_points=starts,
      integration_direction="forward",
      broken_streamlines=false,
      arrows=true,
      num_arrows=1,
      arrowstyle="-|>",
      color="#398575",
      linewidth=1.5,
      label="Mesh flow with arrows",
    )
  } else {
    figure
    .axes()
    .streamplot_with_style_grids(
      xs,
      xs,
      us,
      vs,
      linewidths=[[1.0, 2.0, 3.0], [1.0, 2.0, 3.0], [1.0, 2.0, 3.0]],
      color_values=[[0.0, 1.0, 2.0], [0.0, 1.0, 2.0], [0.0, 1.0, 2.0]],
      vmin=0.0,
      vmax=2.0,
      density=0.2,
      max_steps=6,
      minlength=0.0,
      maxlength=1.0,
      start_points=[@plot.point(0.25, 1.0)],
      integration_direction="forward",
      broken_streamlines=false,
      arrows=true,
      num_arrows=1,
      arrowstyle="->",
      label="Style-grid flow",
    )
  }
  (figure, flow)
}

///|
fn verify_streamplot_consumer() -> Unit raise {
  for case in 0..<3 {
    let (figure, flow) = streamplot_consumer_fixture(case)
    let frame = figure.to_drawing()
    let targets = frame.targets()
    let expected = if case == 2 { 6 } else { 12 }
    let label = if case == 0 {
      "Fixed flow"
    } else if case == 1 {
      "Mesh flow with arrows"
    } else {
      "Style-grid flow"
    }
    assert_eq(frame.svg(), figure.to_svg_checked())
    assert_eq(figure.containers().length(), 1)
    assert_eq(targets.length(), expected)
    assert_eq(flow.lines().length(), if case == 2 { 6 } else { 2 })
    assert_eq(
      flow.arrows().length(),
      if case == 0 {
        0
      } else if case == 1 {
        2
      } else {
        1
      },
    )
    for index, target in targets {
      let seed = if case == 2 { 0 } else { index / 6 }
      let edge = index % 6
      let artist = if case == 0 {
        seed
      } else if case == 1 {
        seed * 3
      } else {
        edge
      }
      let info = target.info
      let typed = info.streamplot.unwrap()
      assert_eq(
        (info.kind, info.series, info.value),
        (@plot.HitKind::Streamplot, label, 0.0),
      )
      assert_eq(
        (info.point.point_index, info.point.artist_index, typed.seed_index),
        (edge, artist, seed),
      )
      assert_eq((typed.u, typed.v), (1.0, 0.0))
      let line = flow.lines()[if case == 2 { edge } else { seed }]
      guard line is @plot.Artist::Line(points, _) else { fail("Body Line") }
      let first = if case == 2 { 0 } else { edge }
      let mx = (points[first].x() + points[first + 1].x()) / 2.0
      let my = (points[first].y() + points[first + 1].y()) / 2.0
      assert_eq((info.point.data_x, info.point.data_y), (mx, my))
      if case == 2 {
        assert_true((typed.color_value.unwrap() - mx).abs() < 1.0e-12)
      } else {
        assert_eq(typed.color_value, None)
      }
      let rebuilt = @drawing.hit_info(
        info.point,
        Streamplot,
        value=0.0,
        series=label,
        streamplot=Some(
          @plot.streamplot_info(seed, 1.0, 0.0, color_value=typed.color_value),
        ),
      )
      assert_eq(rebuilt, info)
      guard target.shape is @plot.HitShape::Segment(ax, ay, bx, by) else {
        fail("Continuous body did not use the actual Segment")
      }
      assert_true(ax != bx || ay != by)
      let sx = (ax + bx) / 2.0
      let sy = (ay + by) / 2.0
      assert_eq((info.point.screen_x, info.point.screen_y), (sx, sy))
      for mode in [@plot.HitMode::Nearest, XNearest] {
        let hit = frame.hit_test(sx, sy, radius=0.0, mode~).unwrap()
        assert_eq(frame.hit_info(hit).unwrap(), info)
      }
    }
    let bounds = targets[0].bounds
    for mode in [@plot.HitMode::Nearest, XNearest] {
      assert_eq(
        frame.hit_test(
          bounds.0 + bounds.2 / 2.0,
          bounds.1 + bounds.3 * 0.1,
          radius=1.0,
          mode~,
        ),
        None,
      )
    }
    // Set getters copy the outer array; nested Line points are real aliases.
    let copied_lines = flow.lines()
    copied_lines.clear()
    assert_eq(figure.to_drawing().targets(), targets)
    guard flow.lines()[0] is @plot.Artist::Line(points, _) else {
      fail("Body Line")
    }
    points[0] = @plot.point(points[0].x() + 0.03125, points[0].y())
    let after = figure.to_drawing()
    assert_eq(
      after.targets().length(),
      expected - (if case == 2 { 1 } else { 6 }),
    )
    assert_true(after.targets().all(t => t.info.kind == Streamplot))
    assert_true(after.svg() != frame.svg())
    assert_eq(frame.targets(), targets)
  }
}
