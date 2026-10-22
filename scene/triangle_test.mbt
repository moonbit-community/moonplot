///|
test "triplot and tripcolor render indexed triangle meshes" {
  let fig = @scene.figure(width=360, height=260)
  let xs = [0.0, 1.0, 0.0, 1.0]
  let ys = [0.0, 0.0, 1.0, 1.0]
  let triangles = [[0, 1, 2], [1, 3, 2]]
  try! fig.triplot(xs, ys, triangles, color="#123456", label="mesh")
  try! fig.tripcolor(
    xs,
    ys,
    triangles,
    [0.0, 0.5, 0.75, 1.0],
    vmin=0.0,
    vmax=1.0,
    cmap="viridis",
    label="faces",
  )
  assert_eq(fig.artists().length(), 4)
  let svg = fig.to_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("fill=\"#"))
  assert_true(svg.contains("<polygon"))
  assert_true(svg.contains("mesh"))
  assert_true(svg.contains("faces"))
}

///|
test "triangle mesh validates indices and scalar lengths" {
  let fig = @scene.figure()
  try fig.triplot([0.0, 1.0], [0.0, 1.0], [[0, 1, 2]]) catch {
    @core.DataError::InvalidContour(message~) =>
      assert_true(message.contains("vertices"))
    _ => fail("expected a triangle vertex error")
  } noraise {
    _ => fail("expected a triangle vertex error")
  }
  try fig.triplot([0.0, 1.0, 0.0], [0.0, 0.0, 1.0], [[0, 1, 3]]) catch {
    @core.DataError::InvalidContour(message~) =>
      assert_true(message.contains("in range"))
    _ => fail("expected a triangle index error")
  } noraise {
    _ => fail("expected a triangle index error")
  }
  try
    fig.tripcolor([0.0, 1.0, 0.0], [0.0, 0.0, 1.0], [[0, 1, 2]], [1.0, 2.0])
  catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 3)
      assert_eq(actual, 2)
    }
    _ => fail("expected a triangle scalar error")
  } noraise {
    _ => fail("expected a triangle scalar error")
  }
}

///|
test "tricontour rejects non-finite vertex values" {
  let fig = @scene.figure()
  try
    fig.tricontour(
      [0.0, 1.0, 0.0],
      [0.0, 0.0, 1.0],
      [[0, 1, 2]],
      [0.0, 1.0, @double.not_a_number],
      levels=[0.5],
    )
  catch {
    @core.DataError::NonFiniteLimit(axis~) => assert_eq(axis, "z")
    _ => fail("expected a non-finite triangle value error")
  } noraise {
    _ => fail("expected a non-finite triangle value error")
  }
}

///|
test "tricontour and tricontourf reuse indexed triangle geometry" {
  let fig = @scene.figure(width=360, height=260)
  let xs = [0.0, 1.0, 0.0]
  let ys = [0.0, 0.0, 1.0]
  let triangles = [[0, 1, 2]]
  let lines = try! fig.tricontour(
    xs,
    ys,
    triangles,
    [0.0, 1.0, 2.0],
    levels=[0.5, 1.5],
    color="#123456",
    label="tri-levels",
  )
  assert_eq(lines.levels(), [0.5, 1.5])
  assert_true(!lines.filled())
  let filled = try! fig.tricontourf(
    xs,
    ys,
    triangles,
    [0.0, 1.0, 2.0],
    levels=[0.0, 1.0, 2.0],
    colors=["#abcdef", "#fedcba"],
    label="tri-bands",
  )
  assert_true(filled.filled())
  let svg = fig.to_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("<polygon"))
  assert_true(svg.contains("tri-levels"))
  assert_true(svg.contains("tri-bands"))
}

///|
test "tricontour stitches crossings across shared triangle edges" {
  let fig = @scene.figure()
  let contours = try! fig.tricontour(
    [0.0, 1.0, 0.0, 1.0],
    [0.0, 0.0, 1.0, 1.0],
    [[0, 1, 2], [1, 3, 2]],
    [0.0, 1.0, 2.0, 3.0],
    levels=[1.5],
  )
  assert_eq(contours.segments.length(), 1)
  assert_eq(contours.segment_levels, [1.5])
  assert_eq(contours.segments[0].length(), 3)
  assert_true(
    Double::abs(contours.segments[0][0].x() - contours.segments[0][2].x()) > 0.1 ||
    Double::abs(contours.segments[0][0].y() - contours.segments[0][2].y()) > 0.1,
  )
}

///|
test "tricontour accepts per-level colors and linewidths" {
  let fig = @scene.figure()
  ignore(
    try! fig.tricontour(
      [0.0, 1.0, 0.0],
      [0.0, 0.0, 1.0],
      [[0, 1, 2]],
      [0.0, 1.0, 2.0],
      levels=[0.5, 1.5],
      colors=["#111111", "#222222"],
      linewidths=[0.5, 2.0],
    ),
  )
  match (fig.artists()[0], fig.artists()[1]) {
    (@scene.Artist::Line(_, first), @scene.Artist::Line(_, second)) => {
      assert_eq(first.color(), "#111111")
      assert_eq(first.width(), 0.5)
      assert_eq(second.color(), "#222222")
      assert_eq(second.width(), 2.0)
    }
    _ => fail("expected one line artist for each triangle level")
  }
}

///|
test "tricontour preserves closed loops and masked face boundaries" {
  let loop_fig = @scene.figure()
  let closed_contours = try! loop_fig.tricontour(
    [0.0, -1.0, 1.0, 1.0, -1.0],
    [0.0, -1.0, -1.0, 1.0, 1.0],
    [[0, 1, 2], [0, 2, 3], [0, 3, 4], [0, 4, 1]],
    [0.0, 1.0, 1.0, 1.0, 1.0],
    levels=[0.5],
  )
  assert_eq(closed_contours.segments.length(), 1)
  assert_eq(closed_contours.segments[0].length(), 5)
  assert_true(
    Double::abs(
      closed_contours.segments[0][0].x() - closed_contours.segments[0][4].x(),
    ) <
    1.0e-10 &&
    Double::abs(
      closed_contours.segments[0][0].y() - closed_contours.segments[0][4].y(),
    ) <
    1.0e-10,
  )
  let masked_fig = @scene.figure()
  let masked = try! masked_fig.tricontour(
    [0.0, 1.0, 0.0, 1.0],
    [0.0, 0.0, 1.0, 1.0],
    [[0, 1, 2], [1, 3, 2]],
    [0.0, 1.0, 2.0, 3.0],
    levels=[1.5],
    mask=[false, true],
  )
  assert_eq(masked.segments.length(), 1)
  assert_eq(masked.segments[0].length(), 2)
}

///|
test "tricontourf unions adjacent clipped faces into one band boundary" {
  let fig = @scene.figure()
  let filled = try! fig.tricontourf(
    [0.0, 1.0, 0.0, 1.0],
    [0.0, 0.0, 1.0, 1.0],
    [[0, 1, 2], [1, 3, 2]],
    [0.0, 1.0, 2.0, 3.0],
    levels=[0.5, 2.5],
    colors=["#abcdef"],
  )
  assert_true(filled.filled())
  assert_eq(fig.artists().length(), 1)
  assert_true(fig.to_svg().contains("#abcdef"))
}

///|
test "tricontourf renders an annular band as an even-odd compound path" {
  let fig = @scene.figure()
  let filled = try! fig.tricontourf(
    [0.0, -1.0, 1.0, 1.0, -1.0],
    [0.0, -1.0, -1.0, 1.0, 1.0],
    [[0, 1, 2], [0, 2, 3], [0, 3, 4], [0, 4, 1]],
    [0.0, 1.0, 1.0, 1.0, 1.0],
    levels=[0.5, 1.5],
    colors=["#abcdef"],
  )
  assert_eq(filled.segments().length(), 2)
  assert_eq(fig.artists().length(), 1)
  match fig.artists()[0] {
    @scene.Artist::CompoundPolygon(rings, style) => {
      assert_eq(rings.length(), 2)
      assert_eq(style.fill(), "#abcdef")
    }
    _ => fail("expected an annular compound polygon")
  }
  let svg = fig.to_svg()
  assert_true(svg.contains("fill-rule=\"evenodd\""))
  assert_true(svg.contains("<path"))
}

///|
test "tricontourf supports under and over extension bands" {
  let fig = @scene.figure()
  let result = try! fig.tricontourf(
    [0.0, 1.0, 0.0],
    [0.0, 0.0, 1.0],
    [[0, 1, 2]],
    [0.0, 2.0, 4.0],
    levels=[1.0, 3.0],
    colors=["#111111", "#222222", "#333333"],
    extend_mode="both",
  )
  assert_eq(result.extend_mode(), "both")
  assert_true(fig.artists().length() > 0)
  assert_true(fig.to_svg().contains("#333333"))
}

///|
test "triangle plotters honor per-face masks" {
  let xs = [0.0, 1.0, 0.0, 1.0]
  let ys = [0.0, 0.0, 1.0, 1.0]
  let triangles = [[0, 1, 2], [1, 3, 2]]
  let values = [0.0, 1.0, 2.0, 3.0]
  let visible = @scene.figure()
  try! visible.triplot(xs, ys, triangles, mask=[false, true])
  try! visible.tripcolor(xs, ys, triangles, values, mask=[false, true])
  assert_eq(visible.artists().length(), 2)
  let contours = @scene.figure()
  ignore(
    try! contours.tricontour(xs, ys, triangles, values, levels=[1.5], mask=[
      false, true,
    ]),
  )
  assert_true(contours.artists().length() > 0)
  let filled = @scene.figure()
  ignore(
    try! filled.tricontourf(xs, ys, triangles, values, levels=[0.5, 2.5], mask=[
      false, true,
    ]),
  )
  assert_true(filled.artists().length() > 0)
  try visible.triplot(xs, ys, triangles, mask=[true]) catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 2)
      assert_eq(actual, 1)
    }
    _ => fail("expected a triangle mask length error")
  } noraise {
    _ => fail("expected a triangle mask length error")
  }
}

///|
test "tripcolor accepts one scalar per triangular face" {
  let fig = @scene.figure()
  try! fig.tripcolor(
    [0.0, 1.0, 0.0, 1.0],
    [0.0, 0.0, 1.0, 1.0],
    [[0, 1, 2], [1, 3, 2]],
    [0.1, 0.9],
    vmin=0.0,
    vmax=1.0,
  )
  assert_eq(fig.artists().length(), 2)
  try! fig.tripcolor(
    [0.0, 1.0, 0.0, 1.0],
    [0.0, 0.0, 1.0, 1.0],
    [[0, 1, 2], [1, 3, 2]],
    [0.1, 0.9],
    mask=[true, false],
  )
  assert_eq(fig.artists().length(), 3)
}

///|
test "triangulation builds Delaunay faces and topology" {
  let mesh = try! @scene.triangulation([0.0, 1.0, 0.0, 1.0], [
    0.0, 0.0, 1.0, 1.0,
  ])
  assert_true(mesh.is_delaunay())
  let triangles = mesh.triangles()
  assert_eq(triangles.length(), 2)
  assert_eq(mesh.edges().length(), 5)
  let neighbors = mesh.neighbors()
  assert_eq(neighbors.length(), 2)
  let mut shared = 0
  for row in neighbors {
    for neighbor in row {
      if neighbor >= 0 {
        shared += 1
      }
    }
  }
  assert_eq(shared, 2)
  let fig = @scene.figure()
  try! fig.triplot_triangulation(mesh, color="#123456")
  assert_eq(fig.artists().length(), 5)
  try! fig.tripcolor_triangulation(mesh, [0.0, 1.0, 2.0, 3.0])
  assert_eq(fig.artists().length(), 7)
  let irregular = try! @scene.triangulation([0.0, 2.0, 2.0, 0.0, 1.0], [
    0.0, 0.0, 2.0, 2.0, 0.7,
  ])
  assert_eq(irregular.triangles().length(), 4)
  assert_eq(irregular.edges().length(), 8)
}

///|
test "triangulation masks faces when deriving topology" {
  let mesh = try! @scene.triangulation(
    [0.0, 1.0, 0.0, 1.0],
    [0.0, 0.0, 1.0, 1.0],
    triangles=[[0, 1, 2], [1, 3, 2]],
    mask=[false, true],
  )
  assert_true(!mesh.is_delaunay())
  assert_eq(mesh.edges().length(), 3)
  assert_eq(mesh.get_masked_triangles().length(), 1)
  for row in mesh.neighbors() {
    for neighbor in row {
      assert_eq(neighbor, -1)
    }
  }
}

///|
test "triangulation rejects duplicate and collinear vertices" {
  try @scene.triangulation([0.0, 0.0, 1.0], [0.0, 0.0, 1.0]) catch {
    @core.DataError::InvalidContour(message~) =>
      assert_true(message.contains("unique"))
    _ => fail("expected duplicate vertex error")
  } noraise {
    _ => fail("expected duplicate vertex error")
  }
  try @scene.triangulation([0.0, 1.0, 2.0], [0.0, 0.0, 0.0]) catch {
    @core.DataError::InvalidContour(message~) =>
      assert_true(message.contains("collinear"))
    _ => fail("expected collinear vertex error")
  } noraise {
    _ => fail("expected collinear vertex error")
  }
}
