///|
fn contourf_control_fixture(case : Int32) -> (Figure, ContourSet) raise {
  let fig = figure(width=400, height=300)
  fig.legend([])
  fig.axes().set_axis_off()
  if case == 0 {
    fig.set_x_limits(-1.5, 1.5)
    fig.set_y_limits(-1.5, 1.5)
    let result = fig.contourf(
      [[2.0, 2.0, 2.0], [2.0, 0.0, 2.0], [2.0, 2.0, 2.0]],
      x=[-2.0, 0.0, 2.0],
      y=[-2.0, 0.0, 2.0],
      levels=[0.5, 1.5],
      extend_mode="both",
      label="Regular bands",
      colors=["#8a70b5", "#398575", "#4d79c7"],
    )
    (fig, result)
  } else {
    fig.set_x_limits(-3.5, 3.5)
    fig.set_y_limits(-1.5, 1.5)
    let mesh = triangulation(
      [-2.0, -3.0, -1.0, -1.0, -3.0, 2.0, 1.0, 3.0, 3.0, 1.0],
      [0.0, -1.0, -1.0, 1.0, 1.0, 0.0, -1.0, -1.0, 1.0, 1.0],
      triangles=[
        [0, 1, 2],
        [0, 2, 3],
        [0, 3, 4],
        [0, 4, 1],
        [5, 6, 7],
        [5, 7, 8],
        [5, 8, 9],
        [5, 9, 6],
      ],
    )
    let result = fig.tricontourf_triangulation(
      mesh,
      [0.0, 1.0, 1.0, 1.0, 1.0, 0.0, 1.0, 1.0, 1.0, 1.0],
      levels=[0.5, 1.5],
      colors=["#398575"],
      label="Triangular bands",
    )
    (fig, result)
  }
}

///|
fn contourf_pick(
  frame : @drawing.Drawing,
  x : Double,
  y : Double,
  mode : @drawing.HitMode,
) -> @drawing.HitInfo? {
  match frame.hit_test(x, y, radius=0.0, mode~) {
    Some(point) => frame.hit_info(point)
    None => None
  }
}

///|
test "contourf actual nested extension regions use finite scalar intervals and one target per whole band" {
  let (fig, result) = contourf_control_fixture(0)
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(result.layers(), [0.25, 1.0, 1.75])
  assert_eq(result.segments().length(), 5)
  assert_eq(fig.artists().length(), 3)
  assert_eq(frame.targets().length(), 3)
  for i, target in frame.targets() {
    assert_eq(
      (target.info.kind, target.info.series, target.info.point.point_index),
      (ContourF, "Regular bands", i),
    )
    assert_eq(target.info.value, result.layers()[i])
    assert_eq(
      target.info.interval,
      Some([(0.0, 0.5), (0.5, 1.5), (1.5, 2.0)][i]),
    )
    assert_eq(
      (
        target.info.cell,
        target.info.band,
        target.info.vector,
        target.info.error,
        target.info.fraction,
      ),
      (None, None, None, None, None),
    )
    guard target.shape is FilledRegion(region) else { fail("FilledRegion") }
    assert_eq(region.even_odd(), i != 0)
    assert_eq(region.rings().length(), if i == 0 { 1 } else { 2 })
  }
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    for (x, y, slot) in [(0.0, 0.0, 0), (0.8, 0.0, 1), (1.4, -1.4, 2)] {
      let info = contourf_pick(
        frame,
        56.0 + (x + 1.5) / 3.0 * 288.0,
        56.0 + (1.5 - y) / 3.0 * 188.0,
        mode,
      ).unwrap()
      assert_eq(info.point.point_index, slot)
    }
    // Legacy SVG paints a margin beyond logical plot bounds; interaction
    // follows the existing plot-only policy rather than inventing a clipPath.
    assert_eq(frame.hit_test(363.2, 150.0, radius=100.0, mode~), None)
  }
  assert_true(!frame.svg().contains("clipPath"))
}

///|
test "tricontourf wrapper retains two disconnected annuli as one evenodd region with empty holes and component gap" {
  let (fig, result) = contourf_control_fixture(1)
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(result.layers(), [1.0])
  assert_eq(result.segments().length(), 4)
  assert_eq(frame.targets().length(), 1)
  guard frame.targets()[0].shape is FilledRegion(region) else {
    fail("FilledRegion")
  }
  assert_true(region.even_odd())
  assert_eq(region.rings().length(), 4)
  assert_eq(frame.targets()[0].info.interval, Some((0.5, 1.5)))
  let rings = region.rings()
  rings[0].clear()
  assert_eq(region.rings().length(), 4)
  assert_true(region.rings()[0].length() >= 3)
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    for x in [-2.75, 2.75] {
      let info = contourf_pick(
        frame,
        56.0 + (x + 3.5) / 7.0 * 288.0,
        56.0 + 1.25 / 3.0 * 188.0,
        mode,
      ).unwrap()
      assert_eq(
        (info.kind, info.value, info.series, info.point.point_index),
        (ContourF, 1.0, "Triangular bands", 0),
      )
    }
    for x in [-2.0, 0.0, 2.0] {
      assert_eq(
        frame.hit_test(
          56.0 + (x + 3.5) / 7.0 * 288.0,
          150.0,
          radius=100.0,
          mode~,
        ),
        None,
      )
    }
  }
}

///|
test "filled empty call keeps earlier series and static legend while logical empty extension slots remain holes" {
  for triangular in [false, true] {
    let fig = figure()
    let ax = fig.axes()
    ax.plot([0.0, 1.0], [0.0, 1.0], label="Original")
    let before = fig.to_drawing().targets()
    let result = if triangular {
      ax.tricontourf(
        [0.0, 1.0, 0.0],
        [0.0, 0.0, 1.0],
        [[0, 1, 2]],
        [0.0, 1.0, 2.0],
        levels=[5.0, 6.0],
        label="Empty",
      )
    } else {
      ax.contourf([[0.0, 1.0], [1.0, 2.0]], levels=[5.0, 6.0], label="Empty")
    }
    assert_eq(result.segments().length(), 0)
    assert_eq(fig.to_drawing().targets(), before)
    assert_eq(ax.legend_entries().map(e => e.label()), ["Original", "Empty"])
  }
  let fig = figure()
  let result = fig.contourf(
    [[2.0, 2.0, 2.0], [2.0, 0.0, 2.0], [2.0, 2.0, 2.0]],
    levels=[-1.0, 0.5, 1.5, 3.0],
    extend_mode="both",
  )
  assert_eq(result.layers(), [-0.25, 1.0, 2.25])
  assert_eq(fig.to_drawing().targets().map(t => t.info.point.point_index), [
    1, 2, 3,
  ])
}
