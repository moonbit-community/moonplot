///|
test "imshow validates rectangular data and renders cells" {
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow([[0.0, 0.5], [1.0, 0.25]], vmin=0.0, vmax=1.0)
  let svg = fig.to_svg()
  assert_true(svg.contains("fill=\"#000000\""))
  assert_true(svg.contains("fill=\"#ffffff\""))
}

///|
test "imshow applies global alpha after colormap sampling" {
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow([[0.0, 1.0]], vmin=0.0, vmax=1.0, alpha=0.5)
  let svg = fig.to_svg()
  assert_true(svg.contains("fill=\"rgba(0,0,0,0.5)\""))
  assert_true(svg.contains("fill=\"rgba(255,255,255,0.5)\""))
}

///|
test "masked imshow applies global alpha to its bad color" {
  let data = try! @core.masked_matrix([[0.0, 1.0]], mask=[[true, false]])
  let cmap = try! @colors.colormap("gray")
  cmap.set_bad(try! @colors.rgba(1.0, 0.0, 1.0, alpha=0.8))
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow_masked_with_colormap(
    data,
    cmap,
    vmin=0.0,
    vmax=1.0,
    alpha=0.5,
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("fill=\"rgba(255,0,255,0.4)\""))
  assert_true(svg.contains("fill=\"rgba(255,255,255,0.5)\""))
}

///|
test "imshow rejects non-finite and out of range alpha" {
  let fig = @scene.figure()
  for alpha in [-0.1, 1.1, @double.not_a_number, 1.0 / 0.0] {
    try fig.imshow([[0.0]], alpha~) catch {
      @core.DataError::InvalidImage(message~) =>
        assert_true(message.contains("image alpha"))
      _ => fail("expected an alpha validation error")
    } noraise {
      _ => fail("expected an alpha validation error")
    }
  }
}

///|
test "imshow rejects ragged data" {
  let fig = @scene.figure()
  try fig.imshow([[1.0, 2.0], [3.0]]) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("equal length"))
    _ => fail("expected invalid image")
  } noraise {
    _ => fail("expected an image error")
  }
}

///|
test "imshow applies a named colormap" {
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow([[0.0, 1.0]], vmin=0.0, vmax=1.0, cmap="viridis")
  let svg = fig.to_svg()
  assert_true(svg.contains("#440154"))
  assert_true(svg.contains("#fde725"))
}

///|
test "imshow rejects an unknown colormap" {
  let fig = @scene.figure()
  try fig.imshow([[0.0]], cmap="missing") catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("unknown colormap"))
    _ => fail("expected an invalid colormap error")
  } noraise {
    _ => fail("expected an image error")
  }
}

///|
test "imshow accepts a custom colormap object" {
  let cmap = try! @colors.custom_colormap("red-blue", [
    try! @colors.rgba(1.0, 0.0, 0.0),
    try! @colors.rgba(0.0, 0.0, 1.0),
  ])
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow_with_colormap([[0.0, 1.0]], cmap, vmin=0.0, vmax=1.0)
  let svg = fig.to_svg()
  assert_true(svg.contains("#ff0000"))
  assert_true(svg.contains("#0000ff"))
}

///|
test "imshow accepts an explicit logarithmic normalization" {
  let norm = @colors.log_color_norm(try! @colors.log_norm(vmin=1.0, vmax=100.0))
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow_with_norm([[1.0, 10.0, 100.0]], norm, cmap="gray")
  let svg = fig.to_svg()
  assert_true(svg.contains("fill=\"#000000\""))
  assert_true(svg.contains("fill=\"#ffffff\""))
  assert_true(!svg.contains("NaN"))
}

///|
test "logarithmic image normalization skips non-positive cells" {
  let norm = @colors.log_color_norm(try! @colors.log_norm(vmin=1.0, vmax=10.0))
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow_with_norm([[0.0, 1.0, 10.0]], norm)
  let svg = fig.to_svg()
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
}

///|
test "symmetric-log image normalization handles values around zero" {
  let norm = @colors.symlog_color_norm(
    try! @colors.symlog_norm(1.0, vmin=-100.0, vmax=100.0),
  )
  let fig = @scene.figure(width=300, height=180)
  try! fig.imshow_with_norm(
    [[-100.0, -1.0, 0.0, 1.0, 100.0]],
    norm,
    cmap="gray",
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("fill=\"#000000\""))
  assert_true(svg.contains("fill=\"#ffffff\""))
  assert_true(svg.contains("fill=\"#808080\""))
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
}

///|
test "two-slope image normalization keeps its center at the midpoint" {
  let norm = @colors.two_slope_color_norm(
    try! @colors.two_slope_norm(0.0, vmin=-4.0, vmax=10.0),
  )
  let fig = @scene.figure(width=300, height=180)
  try! fig.imshow_with_norm([[-4.0, 0.0, 10.0]], norm, cmap="gray")
  let svg = fig.to_svg()
  assert_true(svg.contains("fill=\"#000000\""))
  assert_true(svg.contains("fill=\"#ffffff\""))
  assert_true(svg.contains("fill=\"#808080\""))
  assert_true(!svg.contains("NaN"))
}

///|
test "power and centered image normalizations render through SVG" {
  let power = @colors.power_color_norm(
    try! @colors.power_norm(2.0, vmin=0.0, vmax=4.0),
  )
  let centered = @colors.centered_color_norm(
    try! @colors.centered_norm(vcenter=0.0, halfrange=2.0),
  )
  let fig = @scene.figure(width=300, height=180)
  try! fig.imshow_with_norm([[0.0, 2.0, 4.0]], power, cmap="gray")
  try! fig.imshow_with_norm([[-2.0, 0.0, 2.0]], centered, cmap="gray")
  let svg = fig.to_svg()
  assert_true(svg.contains("fill=\"#000000\""))
  assert_true(svg.contains("fill=\"#ffffff\""))
  assert_true(svg.contains("fill=\"#404040\""))
  assert_true(!svg.contains("NaN"))
}

///|
test "imshow accepts a discrete boundary normalization" {
  let norm = @colors.boundary_color_norm(
    try! @colors.boundary_norm([0.0, 1.0, 2.0, 3.0], 3),
  )
  let cmap = try! @colors.listed_colormap("traffic", [
    try! @colors.rgba(1.0, 0.0, 0.0),
    try! @colors.rgba(1.0, 1.0, 0.0),
    try! @colors.rgba(0.0, 1.0, 0.0),
  ])
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow_with_norm_and_colormap([[0.5, 1.5, 2.5]], norm, cmap)
  let svg = fig.to_svg()
  assert_true(svg.contains("#ff0000"))
  assert_true(svg.contains("#ffff00"))
  assert_true(svg.contains("#00ff00"))
}

///|
test "imshow masked cells use the colormap bad color" {
  let data = try! @core.masked_matrix([[0.0, 1.0], [2.0, 3.0]], mask=[
    [false, true],
    [false, false],
  ])
  let cmap = try! @colors.colormap("viridis")
  cmap.set_bad(try! @colors.rgba(1.0, 0.0, 1.0))
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow_masked_with_colormap(data, cmap, vmin=0.0, vmax=3.0)
  let svg = fig.to_svg()
  assert_true(svg.contains("#ff00ff"))
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
}

///|
test "imshow masked values are excluded from automatic normalization" {
  let data = try! @core.masked_matrix([[1.0, 1000.0, 2.0]], mask=[
    [false, true, false],
  ])
  let fig = @scene.figure(width=280, height=180)
  try! fig.imshow_masked(data, cmap="gray")
  let svg = fig.to_svg()
  assert_true(svg.contains("fill=\"#ffffff\""))
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
}

///|
test "masked imshow forwards origin extent and aspect" {
  let data = try! @core.masked_matrix([[0.0, 1.0], [2.0, 3.0]], mask=[
    [false, true],
    [false, false],
  ])
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow_masked(
    data,
    cmap="gray",
    origin="lower",
    extent=[10.0, 14.0, 20.0, 24.0],
    aspect="auto",
  )
  assert_true(!fig.axes().aspect_equal())
  let svg = fig.to_svg()
  assert_true(svg.contains("fill=\"#000000\""))
  assert_true(!svg.contains("NaN"))
}

///|
test "all masked images use an explicit bad color" {
  let data = try! @core.masked_matrix([[1.0, 2.0]], mask=[[true, true]])
  let cmap = try! @colors.colormap("viridis")
  cmap.set_bad(try! @colors.rgba(1.0, 0.0, 1.0))
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow_masked_with_colormap(data, cmap)
  let svg = fig.to_svg()
  assert_true(svg.contains("#ff00ff"))
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
}

///|
test "imshow origin controls row placement inside an explicit extent" {
  let cmap = try! @colors.listed_colormap("red-blue", [
    try! @colors.rgba(1.0, 0.0, 0.0),
    try! @colors.rgba(0.0, 0.0, 1.0),
  ])
  let upper = @scene.figure(width=200, height=200)
  try! upper.imshow_with_colormap(
    [[0.0], [1.0]],
    cmap,
    vmin=0.0,
    vmax=1.0,
    origin="upper",
    extent=[-0.5, 0.5, -0.5, 1.5],
    aspect="auto",
  )
  try! upper.set_x_limits(-0.5, 0.5)
  try! upper.set_y_limits(-0.5, 1.5)
  let upper_svg = upper.to_svg()
  assert_true(
    upper_svg.contains(
      "<rect x=\"56\" y=\"56\" width=\"88\" height=\"44\" fill=\"#ff0000\"/>",
    ),
  )

  let lower = @scene.figure(width=200, height=200)
  try! lower.imshow_with_colormap(
    [[0.0], [1.0]],
    cmap,
    vmin=0.0,
    vmax=1.0,
    origin="lower",
    extent=[-0.5, 0.5, -0.5, 1.5],
    aspect="auto",
  )
  try! lower.set_x_limits(-0.5, 0.5)
  try! lower.set_y_limits(-0.5, 1.5)
  let lower_svg = lower.to_svg()
  assert_true(
    lower_svg.contains(
      "<rect x=\"56\" y=\"100\" width=\"88\" height=\"44\" fill=\"#ff0000\"/>",
    ),
  )
}

///|
test "imshow extent maps cells into data coordinates" {
  let cmap = try! @colors.listed_colormap("red-blue", [
    try! @colors.rgba(1.0, 0.0, 0.0),
    try! @colors.rgba(0.0, 0.0, 1.0),
  ])
  let extent = @scene.figure(width=200, height=200)
  try! extent.imshow_with_colormap(
    [[0.0, 1.0], [1.0, 0.0]],
    cmap,
    vmin=0.0,
    vmax=1.0,
    extent=[10.0, 14.0, 20.0, 26.0],
    aspect="auto",
  )
  try! extent.set_x_limits(10.0, 14.0)
  try! extent.set_y_limits(20.0, 26.0)
  let extent_svg = extent.to_svg()
  assert_true(
    extent_svg.contains(
      "<rect x=\"56\" y=\"56\" width=\"44\" height=\"44\" fill=\"#ff0000\"/>",
    ),
  )

  let default_extent = @scene.figure(width=200, height=200)
  try! default_extent.imshow_with_colormap(
    [[0.0, 1.0], [1.0, 0.0]],
    cmap,
    vmin=0.0,
    vmax=1.0,
    aspect="auto",
  )
  try! default_extent.set_x_limits(10.0, 14.0)
  try! default_extent.set_y_limits(20.0, 26.0)
  assert_true(
    !default_extent
    .to_svg()
    .contains("<rect x=\"56\" y=\"56\" width=\"44\" height=\"44\""),
  )
}

///|
test "imshow validates origin aspect and extent" {
  let fig = @scene.figure()
  try fig.imshow([[1.0]], origin="sideways") catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("origin"))
    _ => fail("expected an origin error")
  } noraise {
    _ => fail("expected an origin error")
  }
  try fig.imshow([[1.0]], aspect="square") catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("aspect"))
    _ => fail("expected an aspect error")
  } noraise {
    _ => fail("expected an aspect error")
  }
  try fig.imshow([[1.0]], extent=[0.0, 1.0, 2.0]) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("four"))
    _ => fail("expected an extent length error")
  } noraise {
    _ => fail("expected an extent length error")
  }
  try fig.imshow([[1.0]], extent=[0.0, 0.0, 0.0, 1.0]) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("distinct"))
    _ => fail("expected a degenerate extent error")
  } noraise {
    _ => fail("expected a degenerate extent error")
  }
  try fig.imshow([[1.0]], extent=[0.0, 1.0, 0.0 / 0.0, 1.0]) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("finite"))
    _ => fail("expected a non-finite extent error")
  } noraise {
    _ => fail("expected a non-finite extent error")
  }
}

///|
test "imshow aspect selects the axes layout" {
  let equal = @scene.figure(width=320, height=200)
  try! equal.imshow([[0.0, 1.0], [1.0, 0.0]], aspect="equal")
  assert_true(equal.axes().aspect_equal())
  let auto = @scene.figure(width=320, height=200)
  try! auto.imshow([[0.0, 1.0], [1.0, 0.0]], aspect="auto")
  assert_true(!auto.axes().aspect_equal())
  assert_true(equal.to_svg() != auto.to_svg())
}
