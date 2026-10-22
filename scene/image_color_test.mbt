///|
test "RGB images render opaque typed colors" {
  let fig = @scene.figure(width=200, height=200)
  try! fig.imshow_rgb(
    [[try! @colors.rgb(1.0, 0.0, 0.0), try! @colors.rgb(0.0, 1.0, 0.0)]],
    extent=[0.0, 2.0, 0.0, 1.0],
    aspect="auto",
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("fill=\"#ff0000\""))
  assert_true(svg.contains("fill=\"#00ff00\""))
  assert_true(!svg.contains("rgba(255,0,0"))
}

///|
test "RGBA images preserve pixel alpha in SVG" {
  let fig = @scene.figure(width=200, height=200)
  try! fig.imshow_rgba(
    [
      [
        try! @colors.rgba(1.0, 0.0, 0.0, alpha=0.5),
        try! @colors.rgba(0.0, 0.0, 1.0, alpha=0.0),
      ],
    ],
    extent=[0.0, 2.0, 0.0, 1.0],
    aspect="auto",
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("fill=\"rgba(255,0,0,0.5)\""))
  assert_true(svg.contains("fill=\"rgba(0,0,255,0)\""))
}

///|
test "color image global alpha multiplies per-pixel alpha" {
  let fig = @scene.figure(width=200, height=200)
  try! fig.imshow_rgba(
    [[try! @colors.rgba(1.0, 0.0, 0.0, alpha=0.8)]],
    extent=[0.0, 1.0, 0.0, 1.0],
    aspect="auto",
    alpha=0.5,
  )
  assert_true(fig.to_svg().contains("fill=\"rgba(255,0,0,0.4)\""))
}

///|
test "RGBA none interpolation uses the PNG backend path" {
  let fig = @scene.figure(width=200, height=200)
  try! fig.imshow_rgba(
    [[try! @colors.rgba(1.0, 0.0, 0.0, alpha=0.0)]],
    extent=[0.0, 1.0, 0.0, 1.0],
    aspect="auto",
    alpha=0.5,
    interpolation="none",
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("data:image/png;base64,"))
  assert_true(svg.contains("opacity=\"0.5\""))
}

///|
test "color image rejects invalid global alpha" {
  let fig = @scene.figure()
  for alpha in [-0.1, 1.1, @double.not_a_number, 1.0 / 0.0] {
    try fig.imshow_rgb_channels([[[1.0, 0.0, 0.0]]], alpha~) catch {
      @core.DataError::InvalidImage(message~) =>
        assert_true(message.contains("image alpha"))
      _ => fail("expected an alpha validation error")
    } noraise {
      _ => fail("expected an alpha validation error")
    }
  }
}

///|
test "raw RGB and RGBA channel images validate shape and render" {
  let fig = @scene.figure(width=200, height=200)
  try! fig.imshow_rgb_channels(
    [[[1.0, 0.0, 0.0], [0.0, 1.0, 0.0]]],
    extent=[0.0, 2.0, 0.0, 1.0],
    aspect="auto",
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("fill=\"#ff0000\""))
  assert_true(svg.contains("fill=\"#00ff00\""))

  let rgba_fig = @scene.figure(width=200, height=200)
  try! rgba_fig.imshow_rgba_channels(
    [[[0.0, 0.0, 1.0, 0.25]]],
    extent=[0.0, 1.0, 0.0, 1.0],
    aspect="auto",
  )
  assert_true(rgba_fig.to_svg().contains("fill=\"rgba(0,0,255,0.25)\""))

  try fig.imshow_rgb_channels([[[1.0, 0.0]]]) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("3 channels"))
    _ => fail("expected a channel count error")
  } noraise {
    _ => fail("expected a channel count error")
  }
  try fig.imshow_rgba_channels([[[1.0, 0.0, 0.0]]]) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("4 channels"))
    _ => fail("expected a channel count error")
  } noraise {
    _ => fail("expected a channel count error")
  }
}

///|
test "color images reject empty and ragged matrices" {
  let fig = @scene.figure()
  try fig.imshow_rgb([]) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("at least one cell"))
    _ => fail("expected an empty image error")
  } noraise {
    _ => fail("expected an empty image error")
  }
  try fig.imshow_rgba([[try! @colors.rgba(1.0, 0.0, 0.0)], []]) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("equal length"))
    _ => fail("expected a ragged image error")
  } noraise {
    _ => fail("expected a ragged image error")
  }
  try fig.imshow_rgb_channels([[[1.0, 0.0, 0.0]], []]) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("equal length"))
    _ => fail("expected a ragged image error")
  } noraise {
    _ => fail("expected a ragged image error")
  }
}

///|
test "color image NaN pixels become transparent" {
  let fig = @scene.figure(width=200, height=200)
  try! fig.imshow_rgb_channels(
    [[[@double.not_a_number, 0.0, 1.0], [1.0, 0.0, 0.0]]],
    extent=[0.0, 2.0, 0.0, 1.0],
    aspect="auto",
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("fill=\"rgba(0,0,0,0)\""))
  assert_true(svg.contains("fill=\"#ff0000\""))
  assert_true(!svg.contains("NaN"))
}

///|
test "raw color channels clip finite values and mask infinities" {
  let clipped = @scene.figure(width=200, height=200)
  try! clipped.imshow_rgb_channels(
    [[[-0.5, 1.5, 0.5]]],
    extent=[0.0, 1.0, 0.0, 1.0],
    aspect="auto",
  )
  assert_true(clipped.to_svg().contains("fill=\"#00ff80\""))

  let infinite = @scene.figure(width=200, height=200)
  try! infinite.imshow_rgba_channels(
    [[[1.0 / 0.0, 0.0, 0.0, 1.0]]],
    extent=[0.0, 1.0, 0.0, 1.0],
    aspect="auto",
  )
  let svg = infinite.to_svg()
  assert_true(svg.contains("fill=\"rgba(0,0,0,0)\""))
  assert_true(!svg.contains("Infinity"))
}

///|
test "color images share origin extent and aspect semantics" {
  let cmap = [try! @colors.rgb(1.0, 0.0, 0.0), try! @colors.rgb(0.0, 0.0, 1.0)]
  let upper = @scene.figure(width=200, height=200)
  try! upper.imshow_rgb(
    [[cmap[0]], [cmap[1]]],
    origin="upper",
    extent=[-0.5, 0.5, -0.5, 1.5],
    aspect="auto",
  )
  try! upper.set_x_limits(-0.5, 0.5)
  try! upper.set_y_limits(-0.5, 1.5)
  assert_true(
    upper
    .to_svg()
    .contains(
      "<rect x=\"56\" y=\"56\" width=\"88\" height=\"44\" fill=\"#ff0000\"/>",
    ),
  )

  let lower = @scene.figure(width=200, height=200)
  try! lower.imshow_rgb(
    [[cmap[0]], [cmap[1]]],
    origin="lower",
    extent=[-0.5, 0.5, -0.5, 1.5],
    aspect="auto",
  )
  try! lower.set_x_limits(-0.5, 0.5)
  try! lower.set_y_limits(-0.5, 1.5)
  assert_true(
    lower
    .to_svg()
    .contains(
      "<rect x=\"56\" y=\"100\" width=\"88\" height=\"44\" fill=\"#ff0000\"/>",
    ),
  )

  let reversed = @scene.figure(width=200, height=200)
  try! reversed.imshow_rgb(
    [[cmap[0], cmap[1]], [cmap[1], cmap[0]]],
    extent=[14.0, 10.0, 24.0, 20.0],
    aspect="auto",
  )
  reversed.autoscale()
  assert_true(reversed.x_axis().inverted())
  assert_true(reversed.y_axis().inverted())
  assert_true(
    reversed
    .to_svg()
    .contains(
      "<rect x=\"56\" y=\"56\" width=\"44\" height=\"44\" fill=\"#ff0000\"/>",
    ),
  )

  let equal = @scene.figure()
  try! equal.imshow_rgb([[cmap[0]]])
  assert_true(equal.axes().aspect_equal())
  let auto = @scene.figure()
  try! auto.imshow_rgb([[cmap[0]]], aspect="auto")
  assert_true(!auto.axes().aspect_equal())
}

///|
test "color images propagate direction through shared axes" {
  let fig = @scene.figure()
  let axes = fig.subplots(1, 2, share_x=true, share_y=true)
  axes[1].imshow_rgb([
    [try! @colors.rgb(1.0, 0.0, 0.0)],
    [try! @colors.rgb(0.0, 0.0, 1.0)],
  ])
  for axis in axes {
    assert_true(axis.y_axis().inverted())
  }
  axes[0].imshow_rgb([[try! @colors.rgb(0.0, 1.0, 0.0)]], origin="lower")
  for axis in axes {
    assert_true(!axis.y_axis().inverted())
  }
  fig.clear()
  for axis in axes {
    assert_true(!axis.x_axis().inverted())
    assert_true(!axis.y_axis().inverted())
  }
}
