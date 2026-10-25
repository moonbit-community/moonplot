///|
test "tripcolor preserves original ordered finite mean and drops overflowing derived means" {
  let fig = figure()
  fig.tripcolor(
    [0.0, 1.0, 0.0],
    [0.0, 0.0, 1.0],
    [[0, 1, 2]],
    [1.0e16, 1.0, -1.0e16],
    label="Legacy rounding",
  )
  let info = fig.to_drawing().targets()[0].info
  assert_eq(info.value, 0.0)
  assert_true(info.tricolor.unwrap().vertex_mean)
  let overflow = figure()
  overflow.tripcolor([0.0, 1.0, 0.0], [0.0, 0.0, 1.0], [[0, 1, 2]], [
    1.0e308, 1.0e308, -1.0e308,
  ])
  assert_eq(overflow.artists().length(), 0)
  assert_eq(overflow.to_drawing().targets().length(), 0)
}

///|
test "tripcolor nonfinite original face omissions retain source slots without rejecting the finite call" {
  let fig = figure()
  fig.tripcolor(
    [0.0, 2.0, 2.0, 0.0, 1.0],
    [0.0, 0.0, 2.0, 2.0, 1.0],
    [[0, 1, 4], [1, 2, 4], [2, 3, 4], [3, 0, 4]],
    [2.0, 0.0 / 0.0, 1.0 / 0.0, -5.0],
    label="Finite subset",
  )
  let infos = fig.to_drawing().targets().map(t => t.info)
  assert_eq(infos.map(i => (i.point.point_index, i.value)), [
    (0, 2.0),
    (3, -5.0),
  ])
  assert_true(
    infos.all(i => {
      !i.tricolor.unwrap().vertex_mean && i.series == "Finite subset"
    }),
  )
}

///|
test "tripcolor autoscale includes masked extreme and unused vertex inputs while normalization-only repaint preserves raw values" {
  for vertex_mode in [false, true] {
    let xs = if vertex_mode {
      [0.0, 2.0, 2.0, 0.0, 1.0, 5.0]
    } else {
      [0.0, 2.0, 2.0, 0.0, 1.0]
    }
    let ys = if vertex_mode {
      [0.0, 0.0, 2.0, 2.0, 1.0, 5.0]
    } else {
      [0.0, 0.0, 2.0, 2.0, 1.0]
    }
    let values = if vertex_mode {
      [0.0, 3.0, 6.0, 9.0, 12.0, 1000.0]
    } else {
      [10.0, 1000.0, 30.0, 40.0]
    }
    let lo = if vertex_mode { 0.0 } else { 10.0 }
    let figures = []
    for setting in 0..<3 {
      let fig = figure()
      let mesh = triangulation(
        xs,
        ys,
        triangles=[[0, 1, 4], [1, 2, 4], [2, 3, 4], [3, 0, 4]],
        mask=[false, true, false, false],
      )
      if setting == 0 {
        fig.tripcolor_triangulation(mesh, values)
      } else if setting == 1 {
        fig.tripcolor_triangulation(mesh, values, vmin=lo, vmax=1000.0)
      } else {
        fig.tripcolor_triangulation(mesh, values, vmin=lo, vmax=50.0)
      }
      figures.push(fig)
    }
    assert_eq(figures[0].to_svg_checked(), figures[1].to_svg_checked())
    assert_true(figures[0].to_svg_checked() != figures[2].to_svg_checked())
    assert_eq(
      figures[0].to_drawing().targets().map(t => t.info.value),
      figures[2].to_drawing().targets().map(t => t.info.value),
    )
  }
}

///|
test "direct automatic Delaunay faces expose their actual vertex triples without rebuilding a mesh in the consumer" {
  let xs = [0.0, 3.0, 2.0, 0.0]
  let ys = [0.0, 0.0, 2.0, 1.0]
  let fig = figure()
  fig.tripcolor(xs, ys, [], [0.0, 3.0, 6.0, 9.0], label="Automatic mesh")
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), 2)
  for index, t in frame.targets() {
    assert_eq(t.info.point.point_index, index)
    assert_eq(t.info.series, "Automatic mesh")
    let info = t.info.tricolor.unwrap()
    assert_true(info.vertex_mean)
    let indices = [info.vertices.0, info.vertices.1, info.vertices.2]
    guard fig.artists()[index] is Polygon(points, _) else { fail("Polygon") }
    for i, p in points {
      assert_eq((p.x(), p.y()), (xs[indices[i]], ys[indices[i]]))
    }
  }
}
