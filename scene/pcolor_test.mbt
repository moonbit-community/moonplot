///|
test "pcolor and pcolormesh render colored grid cells" {
  let fig = @scene.figure(width=320, height=240)
  try! fig.pcolor(
    [[0.0, 0.5], [1.0, 0.25]],
    x=[10.0, 20.0, 30.0],
    y=[-1.0, 0.0, 1.0],
    vmin=0.0,
    vmax=1.0,
    cmap="gray",
  )
  assert_eq(fig.artists().length(), 4)
  try! fig.pcolormesh([[0.0, 1.0]], cmap="viridis")
  let svg = fig.to_svg()
  assert_true(svg.contains("<polygon"))
  assert_true(svg.contains("#000000"))
  assert_true(svg.contains("#ffffff"))
  assert_true(svg.contains("#440154"))
}

///|
test "pcolor skips non-finite cells" {
  let fig = @scene.figure(width=280, height=200)
  try! fig.pcolormesh([[0.0, 0.0 / 0.0], [1.0, 2.0]])
  assert_eq(fig.artists().length(), 3)
  assert_true(!fig.to_svg().contains("NaN"))
}

///|
test "pcolor validates data and boundary coordinates" {
  let fig = @scene.figure()
  try fig.pcolor([[0.0, 1.0], [1.0]]) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("equal length"))
    _ => fail("expected a pcolor grid error")
  } noraise {
    _ => fail("expected a pcolor grid error")
  }
  try fig.pcolor([[0.0, 1.0], [1.0, 2.0]], x=[0.0, 1.0]) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("together"))
    _ => fail("expected a pcolor coordinate pairing error")
  } noraise {
    _ => fail("expected a pcolor coordinate pairing error")
  }
  try
    fig.pcolor([[0.0, 1.0], [1.0, 2.0]], x=[0.0, 1.0, 0.5], y=[0.0, 1.0, 2.0])
  catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("monotonic"))
    _ => fail("expected a pcolor coordinate order error")
  } noraise {
    _ => fail("expected a pcolor coordinate order error")
  }
  try fig.pcolor([[0.0]], cmap="missing") catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("unknown colormap"))
    _ => fail("expected a pcolor colormap error")
  } noraise {
    _ => fail("expected a pcolor colormap error")
  }
}

///|
test "pcolor honors explicit boundary normalization and extension colors" {
  let norm = @colors.boundary_color_norm(
    try! @colors.boundary_norm([0.0, 1.0, 2.0], 2),
  )
  let cmap = try! @colors.listed_colormap("traffic", [
    try! @colors.rgba(1.0, 0.0, 0.0),
    try! @colors.rgba(0.0, 0.0, 1.0),
  ])
  cmap.set_under(try! @colors.rgba(0.0, 1.0, 0.0))
  cmap.set_over(try! @colors.rgba(1.0, 1.0, 0.0))
  let fig = @scene.figure(width=320, height=220)
  try! fig.pcolor_with_norm_and_colormap([[-1.0, 0.5, 1.5, 3.0]], norm, cmap)
  let svg = fig.to_svg()
  assert_true(svg.contains("#00ff00"))
  assert_true(svg.contains("#ff0000"))
  assert_true(svg.contains("#0000ff"))
  assert_true(svg.contains("#ffff00"))
}

///|
test "pcolormesh uses a custom bad color for invalid cells" {
  let norm = @colors.linear_color_norm(
    try! @colors.normalize(vmin=0.0, vmax=1.0),
  )
  let cmap = try! @colors.custom_colormap("red-blue", [
    try! @colors.rgba(1.0, 0.0, 0.0),
    try! @colors.rgba(0.0, 0.0, 1.0),
  ])
  cmap.set_bad(try! @colors.rgba(1.0, 0.0, 1.0))
  let fig = @scene.figure(width=300, height=200)
  try! fig.pcolormesh_with_norm_and_colormap(
    [[0.0, 0.0 / 0.0, 1.0]],
    norm,
    cmap,
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("#ff00ff"))
  assert_true(svg.contains("#ff0000"))
  assert_true(svg.contains("#0000ff"))
  assert_true(!svg.contains("NaN"))
}

///|
test "pcolormesh masked cells propagate to the bad color" {
  let data = try! @core.masked_matrix([[0.0, 1.0], [2.0, 3.0]], mask=[
    [false, true],
    [false, false],
  ])
  let norm = @colors.linear_color_norm(
    try! @colors.normalize(vmin=0.0, vmax=3.0),
  )
  let cmap = try! @colors.colormap("viridis")
  cmap.set_bad(try! @colors.rgba(1.0, 0.0, 1.0))
  let fig = @scene.figure(width=240, height=180)
  try! fig.pcolormesh_masked_with_norm_and_colormap(data, norm, cmap)
  let svg = fig.to_svg()
  assert_true(svg.contains("#ff00ff"))
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
}

///|
test "pcolor omits masked polygons" {
  let data = try! @core.masked_matrix([[0.0, 1.0], [2.0, 3.0]], mask=[
    [false, true],
    [false, false],
  ])
  let fig = @scene.figure(width=240, height=180)
  try! fig.pcolor_masked(data, vmin=0.0, vmax=3.0)
  assert_eq(fig.artists().length(), 3)
}

///|
test "pcolor maps finite values rejected by LogNorm to bad color" {
  let norm = @colors.log_color_norm(try! @colors.log_norm(vmin=1.0, vmax=10.0))
  let cmap = try! @colors.colormap("viridis")
  cmap.set_bad(try! @colors.rgba(1.0, 0.0, 1.0))
  let fig = @scene.figure(width=300, height=200)
  try! fig.pcolor_with_norm_and_colormap([[0.0, 1.0, 10.0]], norm, cmap)
  assert_eq(fig.artists().length(), 3)
  let svg = fig.to_svg()
  assert_true(svg.contains("#ff00ff"))
  assert_true(svg.contains("#440154"))
  assert_true(svg.contains("#fde725"))
}

///|
test "pcolor omits source masked cells even with a bad color" {
  let data = try! @core.masked_matrix([[0.0, 1.0], [2.0, 3.0]], mask=[
    [false, true],
    [false, false],
  ])
  let norm = @colors.linear_color_norm(
    try! @colors.normalize(vmin=0.0, vmax=3.0),
  )
  let cmap = try! @colors.colormap("viridis")
  cmap.set_bad(try! @colors.rgba(1.0, 0.0, 1.0))
  let fig = @scene.figure(width=240, height=180)
  try! fig.pcolor_masked_with_norm_and_colormap(data, norm, cmap)
  assert_eq(fig.artists().length(), 3)
  assert_true(!fig.to_svg().contains("#ff00ff"))
}

///|
test "pcolor_grid renders curvilinear flat and nearest meshes" {
  let flat = @scene.figure(width=320, height=220)
  try! flat.pcolor_grid(
    [[0.0, 0.5], [1.0, 0.25]],
    [[0.0, 1.0, 2.0], [0.1, 1.1, 2.1], [0.2, 1.2, 2.2]],
    [[0.0, 0.0, 0.0], [1.0, 1.1, 1.0], [2.0, 2.0, 2.2]],
    shading="flat",
    vmin=0.0,
    vmax=1.0,
    cmap="gray",
  )
  assert_eq(flat.artists().length(), 4)
  assert_true(flat.to_svg().contains("<polygon"))
  let nearest = @scene.figure(width=320, height=220)
  try! nearest.pcolormesh_grid(
    [[0.0, 1.0], [2.0, 3.0]],
    [[0.0, 1.0], [0.2, 1.2]],
    [[0.0, 0.1], [1.0, 1.1]],
    shading="nearest",
  )
  assert_eq(nearest.artists().length(), 4)
  assert_true(nearest.to_svg().contains("#440154"))
}

///|
test "pcolor_grid validates shading and coordinate shape" {
  let fig = @scene.figure()
  try
    fig.pcolor_grid([[0.0]], [[0.0, 1.0]], [[0.0, 1.0]], shading="bogus")
  catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("shading"))
    _ => fail("expected a shading error")
  } noraise {
    _ => fail("expected a shading error")
  }
  try
    fig.pcolormesh_grid(
      [[0.0, 1.0]],
      [[0.0, 1.0], [0.0, 1.0]],
      [[0.0, 1.0], [0.0, 1.0]],
      shading="flat",
    )
  catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(
        message.contains("row count") || message.contains("column count"),
      )
    _ => fail("expected a coordinate shape error")
  } noraise {
    _ => fail("expected a coordinate shape error")
  }
}

///|
test "pcolor_grid renders gouraud triangles with vertex colors" {
  let fig = @scene.figure(width=320, height=220)
  try! fig.pcolor_grid(
    [[0.0, 0.5, 1.0], [0.25, 0.75, 1.25], [0.5, 1.0, 1.5]],
    [[0.0, 1.0, 2.0], [0.0, 1.0, 2.0], [0.0, 1.0, 2.0]],
    [[0.0, 0.0, 0.0], [1.0, 1.0, 1.0], [2.0, 2.0, 2.0]],
    shading="gouraud",
    vmin=0.0,
    vmax=1.5,
    cmap="gray",
  )
  assert_eq(fig.artists().length(), 8)
  match fig.artists()[0] {
    @scene.Artist::GouraudTriangle(points, colors) => {
      assert_eq(points.length(), 3)
      assert_eq(colors.length(), 3)
      assert_eq(colors[0], "#000000")
    }
    _ => fail("expected a Gouraud triangle artist")
  }
  let svg = fig.to_svg()
  assert_true(svg.contains("linearGradient"))
  assert_true(svg.contains("url(#gouraud-0-0)"))
}

///|
test "pcolor_grid validates gouraud vertex dimensions" {
  let fig = @scene.figure()
  try
    fig.pcolormesh_grid(
      [[0.0, 1.0], [1.0, 2.0]],
      [[0.0, 1.0, 2.0], [0.0, 1.0, 2.0], [0.0, 1.0, 2.0]],
      [[0.0, 0.0, 0.0], [1.0, 1.0, 1.0], [2.0, 2.0, 2.0]],
      shading="gouraud",
    )
  catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(
        message.contains("row count") || message.contains("column count"),
      )
    _ => fail("expected a Gouraud coordinate shape error")
  } noraise {
    _ => fail("expected a Gouraud coordinate shape error")
  }
}

///|
test "masked curvilinear grids omit cells using masked data and coordinates" {
  let data = try! @core.masked_matrix([[0.0, 1.0], [2.0, 3.0]], mask=[
    [false, true],
    [false, false],
  ])
  let x = try! @core.masked_matrix(
    [[0.0, 1.0, 2.0], [0.0, 1.0, 2.0], [0.0, 1.0, 2.0]],
    mask=[[true, false, false], [false, false, false], [false, false, false]],
  )
  let y = try! @core.masked_matrix([
    [0.0, 0.0, 0.0],
    [1.0, 1.0, 1.0],
    [2.0, 2.0, 2.0],
  ])
  let fig = @scene.figure(width=320, height=220)
  try! fig.pcolor_grid_masked(data, x, y, shading="flat")
  assert_eq(fig.artists().length(), 2)
  assert_true(fig.to_svg().contains("<polygon"))
}

///|
test "masked curvilinear gouraud grids omit masked vertex cells" {
  let data = try! @core.masked_matrix([
    [0.0, 0.5, 1.0],
    [0.25, 0.75, 1.25],
    [0.5, 1.0, 1.5],
  ])
  let x = try! @core.masked_matrix(
    [[0.0, 1.0, 2.0], [0.0, 1.0, 2.0], [0.0, 1.0, 2.0]],
    mask=[[true, false, false], [false, false, false], [false, false, false]],
  )
  let y = try! @core.masked_matrix([
    [0.0, 0.0, 0.0],
    [1.0, 1.0, 1.0],
    [2.0, 2.0, 2.0],
  ])
  let fig = @scene.figure(width=320, height=220)
  try! fig.pcolormesh_grid_masked(data, x, y, shading="gouraud")
  assert_eq(fig.artists().length(), 6)
  assert_true(fig.to_svg().contains("linearGradient"))
}

///|
test "curvilinear grid antialiasing controls polygon edge width" {
  let pcolor = @scene.figure()
  try! pcolor.pcolor_grid(
    [[0.0]],
    [[0.0, 1.0], [0.0, 1.0]],
    [[0.0, 0.0], [1.0, 1.0]],
    shading="flat",
    antialiased=true,
  )
  match pcolor.artists()[0] {
    @scene.Artist::Polygon(_, style) => assert_eq(style.width(), 0.5)
    _ => fail("expected an antialiased polygon")
  }
  let pcolormesh = @scene.figure()
  try! pcolormesh.pcolormesh_grid(
    [[0.0]],
    [[0.0, 1.0], [0.0, 1.0]],
    [[0.0, 0.0], [1.0, 1.0]],
    shading="flat",
    antialiased=false,
  )
  match pcolormesh.artists()[0] {
    @scene.Artist::Polygon(_, style) => assert_eq(style.width(), 0.0)
    _ => fail("expected a non-antialiased polygon")
  }
}

///|
test "rectangular mesh antialiasing follows pcolor defaults" {
  let pcolor = @scene.figure()
  try! pcolor.pcolor([[0.0]], antialiased=true)
  match pcolor.artists()[0] {
    @scene.Artist::Polygon(_, style) => assert_eq(style.width(), 0.5)
    _ => fail("expected an antialiased pcolor polygon")
  }
  let pcolormesh = @scene.figure()
  try! pcolormesh.pcolormesh([[0.0]], antialiased=false)
  match pcolormesh.artists()[0] {
    @scene.Artist::Polygon(_, style) => assert_eq(style.width(), 0.0)
    _ => fail("expected a pcolormesh polygon")
  }
}
