///|
fn make_filled_contour_consumer_figure(
  case : Int32,
) -> (@plot.Figure, @plot.ContourSet) raise {
  let fig = @plot.figure(width=400, height=300)
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
    let mesh = @scene.triangulation(
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
fn verify_filled_contour_consumer() -> Unit raise {
  // Exercise the facade export independently of Scene and package internals.
  let ring = [(0.0, 0.0), (2.0, 0.0), (2.0, 2.0), (0.0, 2.0)]
  let input = [ring]
  let public_region = @plot.filled_region(input, even_odd=true)
  ring[0] = (999.0, 999.0)
  input.clear()
  let exposed = public_region.rings()
  exposed[0].clear()
  exposed.clear()
  assert_true(public_region.even_odd())
  assert_eq(public_region.rings()[0][0], (0.0, 0.0))
  for case in 0..<2 {
    let (figure, result) = make_filled_contour_consumer_figure(case)
    let frame = figure.to_drawing()
    assert_eq(frame.svg(), figure.to_svg_checked())
    assert_eq(figure.containers().length(), 1)
    assert_eq(
      result.layers(),
      if case == 0 {
        [0.25, 1.0, 1.75]
      } else {
        [1.0]
      },
    )
    assert_eq(result.segments().length(), if case == 0 { 5 } else { 4 })
    let targets = frame.targets()
    assert_eq(targets.length(), if case == 0 { 3 } else { 1 })
    for i, target in targets {
      let info = target.info
      assert_eq(info.kind, @plot.HitKind::ContourF)
      assert_eq(
        info.series,
        if case == 0 {
          "Regular bands"
        } else {
          "Triangular bands"
        },
      )
      assert_eq(info.point.point_index, i)
      let interval = if case == 0 {
        [(0.0, 0.5), (0.5, 1.5), (1.5, 2.0)][i]
      } else {
        (0.5, 1.5)
      }
      let representative = if case == 0 { [0.25, 1.0, 1.75][i] } else { 1.0 }
      assert_eq((info.interval, info.value), (Some(interval), representative))
      assert_eq((info.category, info.band, info.cell), (None, None, None))
      assert_eq((info.vector, info.error, info.fraction), (None, None, None))
      guard target.shape is @plot.HitShape::FilledRegion(region) else {
        fail("Installed contour fill has no real filled-region geometry")
      }
      assert_eq(region.even_odd(), case == 1 || i > 0)
      assert_eq(
        region.rings().length(),
        if case == 1 {
          4
        } else if i == 0 {
          1
        } else {
          2
        },
      )
      // Inspection and public target copies cannot mutate the existing frame.
      let saved_rings = region.rings().map(ring => ring.copy())
      let rings = region.rings()
      rings[0][0] = (999.0, 999.0)
      rings[0].clear()
      rings.clear()
      assert_eq(region.rings(), saved_rings)
    }
    assert_eq(frame.targets(), targets)
    for mode in [@plot.HitMode::Nearest, XNearest] {
      if case == 0 {
        for
          (x, y, band) in [
            (200.0, 150.0, 0),
            (286.4, 150.0, 1),
            (65.6, 62.2666666666667, 2),
          ] {
          let info = frame
            .hit_info(frame.hit_test(x, y, radius=0.0, mode~).unwrap())
            .unwrap()
          assert_eq(
            (info.point.point_index, info.value),
            (band, [0.25, 1.0, 1.75][band]),
          )
        }
        // The old over band is visibly painted in the SVG margin, but that
        // margin is deliberately outside the interactive plot rectangle.
        assert_eq(frame.hit_test(363.2, 150.0, radius=100.0, mode~), None)
      } else {
        for x in [86.8571428571429, 313.142857142857] {
          let info = frame
            .hit_info(frame.hit_test(x, 150.0, radius=0.0, mode~).unwrap())
            .unwrap()
          assert_eq(
            (info.point.point_index, info.interval, info.value),
            (0, Some((0.5, 1.5)), 1.0),
          )
        }
        for x in [117.714285714286, 282.285714285714, 200.0, 333.714285714286] {
          assert_eq(frame.hit_test(x, 150.0, radius=100.0, mode~), None)
        }
      }
    }
  }
}
