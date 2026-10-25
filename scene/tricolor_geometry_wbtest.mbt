///|
fn tricolor_geometry_figure(
  xs : Array[Double],
  ys : Array[Double],
) -> (Figure, Axes) raise {
  let fig = figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_axis_off()
  ax.set_x_limits(0.0, 2.0)
  ax.set_y_limits(0.0, 2.0)
  ax.tripcolor(xs, ys, [[0, 1, 2]], [7.0], label="Geometry")
  (fig, ax)
}

///|
test "tripcolor actual clipped edge and whole-plot cover use separate honest geometry anchors" {
  let (fig, _) = tricolor_geometry_figure([-2.0, 1.0, 1.0], [0.5, 0.5, 3.0])
  let frame = fig.to_drawing()
  let p = frame.targets()[0].info.point
  assert_eq(
    (p.data_x, p.data_y, p.screen_x, p.screen_y),
    (-0.5, 0.5, 100.0, 225.0),
  )
  assert_eq(frame.hit_test(150.0, 200.0, radius=0.0), Some(p))
  let (cover, _) = tricolor_geometry_figure([-10.0, 10.0, 0.0], [
    -10.0, -10.0, 20.0,
  ])
  let covered = cover.to_drawing()
  let center = covered.targets()[0].info.point
  assert_eq(
    (center.data_x, center.data_y, center.screen_x, center.screen_y),
    (0.0, -10.0, 200.0, 150.0),
  )
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    assert_eq(covered.hit_test(20.0, 20.0, radius=0.0, mode~), Some(center))
    assert_eq(covered.hit_test(399.0, 299.0, radius=0.0, mode~), Some(center))
  }
  let (outside, _) = tricolor_geometry_figure([3.0, 4.0, 3.0], [3.0, 3.0, 4.0])
  assert_eq(outside.to_drawing().targets().length(), 0)
}

///|
test "tripcolor finite degenerate faces remain static and actual fill visibility ignores zero stroke width or un-emitted line alpha" {
  let (degenerate, _) = tricolor_geometry_figure([0.0, 1.0, 2.0], [
    0.0, 1.0, 2.0,
  ])
  assert_eq(degenerate.artists().length(), 1)
  assert_eq(degenerate.to_drawing().targets().length(), 0)
  for fill in ["#663399", "none", "transparent", "rgba(102,51,153,0)"] {
    let (fig, ax) = tricolor_geometry_figure([0.0, 2.0, 0.0], [0.0, 0.0, 2.0])
    guard ax.state.val.artists[0] is Polygon(points, _) else { fail("Polygon") }
    ax.state.val.artists[0] = Polygon(
      points,
      @core.style("#663399", width=0.0, fill~, line_alpha=Some(0.0)),
    )
    assert_eq(fig.to_drawing().svg(), fig.to_svg_checked())
    assert_eq(
      fig.to_drawing().targets().length(),
      if fill == "#663399" {
        1
      } else {
        0
      },
    )
  }
}

///|
test "tripcolor reversed axes and actual nonlinear-domain filtering preserve original face data" {
  let (fig, ax) = tricolor_geometry_figure([0.0, 2.0, 0.0], [0.0, 0.0, 2.0])
  ax.set_x_limits(2.0, 0.0)
  ax.set_y_limits(2.0, 0.0)
  let frame = fig.to_drawing()
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    let info = frame
      .hit_info(frame.hit_test(320.0, 60.0, radius=0.0, mode~).unwrap())
      .unwrap()
    assert_eq(
      (info.kind, info.value, info.tricolor.unwrap().vertices),
      (Tripcolor, 7.0, (0, 1, 2)),
    )
  }
  let (invalid, logax) = tricolor_geometry_figure([-1.0, 1.0, 1.0], [
    0.0, 0.0, 2.0,
  ])
  logax.set_x_scale(@scale.log_scale())
  logax.set_x_limits(0.1, 10.0)
  assert_eq(invalid.artists().length(), 1)
  assert_eq(invalid.to_drawing().targets().length(), 0)
  let (valid, logax2) = tricolor_geometry_figure([0.1, 10.0, 0.1], [
    0.0, 0.0, 2.0,
  ])
  logax2.set_x_scale(@scale.log_scale())
  logax2.set_x_limits(0.1, 10.0)
  let logframe = valid.to_drawing()
  let hit = logframe.hit_test(80.0, 240.0, radius=0.0).unwrap()
  assert_eq(logframe.hit_info(hit).unwrap().value, 7.0)
}
