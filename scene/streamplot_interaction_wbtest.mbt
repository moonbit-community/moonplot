///|
fn streamplot_control_fixture(case : Int32) -> (Figure, StreamplotSet) raise {
  let fig = figure(width=400, height=300)
  fig.axes().set_axis_off()
  fig.set_x_limits(0.0, 2.0)
  fig.set_y_limits(0.0, 2.0)
  let xs = [0.0, 1.0, 2.0]
  let ys = [0.0, 1.0, 2.0]
  let us = [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]]
  let vs = [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]]
  let seeds = if case == 2 {
    [@core.point(0.25, 1.0)]
  } else {
    [@core.point(0.25, 0.5), @core.point(0.25, 1.5)]
  }
  let label = if case == 0 {
    "Fixed flow"
  } else if case == 1 {
    "Mesh flow with arrows"
  } else {
    "Style-grid flow"
  }
  let result = if case == 0 {
    fig.streamplot(
      xs,
      ys,
      us,
      vs,
      density=0.2,
      max_steps=6,
      minlength=0.0,
      maxlength=1.0,
      start_points=seeds,
      integration_direction="forward",
      broken_streamlines=false,
      color="#398575",
      linewidth=1.5,
      arrows=false,
      label~,
    )
  } else if case == 1 {
    fig.streamplot_mesh(
      [[0.0, 1.0, 2.0], [0.0, 1.0, 2.0], [0.0, 1.0, 2.0]],
      [[0.0, 0.0, 0.0], [1.0, 1.0, 1.0], [2.0, 2.0, 2.0]],
      us,
      vs,
      density=0.2,
      max_steps=6,
      minlength=0.0,
      maxlength=1.0,
      start_points=seeds,
      integration_direction="forward",
      broken_streamlines=false,
      color="#398575",
      linewidth=1.5,
      arrows=true,
      num_arrows=1,
      arrowstyle="-|>",
      label~,
    )
  } else {
    fig
    .axes()
    .streamplot_with_style_grids(
      xs,
      ys,
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
      start_points=seeds,
      integration_direction="forward",
      broken_streamlines=false,
      color="#398575",
      linewidth=1.5,
      arrows=true,
      num_arrows=1,
      arrowstyle="->",
      label~,
    )
  }
  (fig, result)
}

///|
test "streamplot continuous actual body segments preserve generated field samples and every static arrow component" {
  for case in 0..<3 {
    let (fig, result) = streamplot_control_fixture(case)
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_eq(fig.artists().length(), [2, 6, 8][case])
    assert_eq(fig.containers().length(), 1)
    assert_eq(fig.containers()[0].artists().length(), [2, 6, 8][case])
    assert_eq(result.lines().length(), if case == 2 { 6 } else { 2 })
    assert_eq(result.arrows().length(), [0, 2, 1][case])
    assert_eq(frame.targets().length(), if case == 2 { 6 } else { 12 })
    for i, t in frame.targets() {
      let edge = i % 6
      let seed = i / 6
      let expected_artist = if case == 0 {
        seed
      } else if case == 1 {
        seed * 3
      } else {
        edge
      }
      let info = t.info
      assert_true(t.shape is Segment(_, _, _, _))
      assert_eq(
        (info.kind, info.point.point_index, info.point.artist_index, info.value),
        (Streamplot, edge, expected_artist, 0.0),
      )
      assert_eq(
        info.series,
        ["Fixed flow", "Mesh flow with arrows", "Style-grid flow"][case],
      )
      let sample = info.streamplot.unwrap()
      assert_eq((sample.seed_index, sample.u, sample.v), (seed, 1.0, 0.0))
      if case == 2 {
        assert_eq(sample.color_value, Some(info.point.data_x))
      } else {
        assert_eq(sample.color_value, None)
      }
      assert_eq(
        (
          info.cell,
          info.interval,
          info.fraction,
          info.band,
          info.vector,
          info.tricolor,
        ),
        (None, None, None, None, None, None),
      )
    }
    let p = frame.targets()[0].info.point
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let hit = frame
        .hit_test(p.screen_x, p.screen_y, radius=0.0, mode~)
        .unwrap()
      assert_eq(frame.hit_info(hit).unwrap(), frame.targets()[0].info)
      assert_eq(frame.hit_test(p.screen_x, 100.0, radius=0.0, mode~), None)
    }
  }
}

///|
test "streamplot returned nested point aliases invalidate only actual owned components while old Drawing remains immutable" {
  for case in [0, 2] {
    let (fig, result) = streamplot_control_fixture(case)
    let old = fig.to_drawing()
    let before = old.targets()[0].info
    guard result.lines()[0] is Line(points, _) else { fail("Line") }
    points[0] = @core.point(1.8, 1.8)
    let current = fig.to_drawing()
    assert_eq(current.targets().length(), if case == 0 { 6 } else { 5 })
    assert_true(
      current
      .targets()
      .all(t => t.info.kind == Streamplot && t.info.point.artist_index != 0),
    )
    assert_eq(old.hit_info(before.point), Some(before))
    assert_eq(old.targets().length(), if case == 0 { 12 } else { 6 })
  }
}
