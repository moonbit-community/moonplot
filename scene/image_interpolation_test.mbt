///|
test "imshow defaults to nearest vector cells" {
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow([[0.0, 1.0]], vmin=0.0, vmax=1.0, aspect="auto")
  let svg = fig.to_svg()
  assert_true(svg.contains("<rect"))
  assert_true(!svg.contains("data:image/png;base64,"))
}

///|
test "imshow none embeds an original resolution PNG" {
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow(
    [[0.0, 1.0], [1.0, 0.0]],
    vmin=0.0,
    vmax=1.0,
    aspect="auto",
    interpolation="NONE",
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("data:image/png;base64,"))
  assert_true(
    svg.contains("image-rendering:crisp-edges;image-rendering:pixelated"),
  )
  assert_true(svg.contains("<image"))
}

///|
test "imshow bilinear embeds a display-sized smooth PNG" {
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow(
    [[0.0, 1.0], [1.0, 0.0]],
    vmin=0.0,
    vmax=1.0,
    aspect="auto",
    interpolation="BILINEAR",
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("data:image/png;base64,"))
  assert_true(svg.contains("image-rendering:auto"))
  assert_true(!svg.contains("image-rendering:crisp-edges"))
  assert_true(svg.contains("<image width=\"128\" height=\"68\""))
}

///|
test "imshow auto accepts case-insensitive filtered mode" {
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow(
    [[0.0, 1.0], [1.0, 0.0]],
    vmin=0.0,
    vmax=1.0,
    aspect="auto",
    interpolation="AuTo",
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("data:image/png;base64,"))
  // At this large integer upscale, Matplotlib's `auto` policy chooses nearest.
  assert_true(
    svg.contains("image-rendering:crisp-edges;image-rendering:pixelated"),
  )
}

///|
test "imshow supports Matplotlib filter names" {
  for
    interpolation in [
      "bilinear", "bicubic", "spline16", "spline36", "hanning", "hamming", "hermite",
      "kaiser", "quadric", "catrom", "gaussian", "bessel", "mitchell", "sinc", "lanczos",
      "blackman", "antialiased",
    ] {
    let fig = @scene.figure(width=240, height=180)
    try! fig.imshow(
      [[0.0, 1.0], [1.0, 0.0]],
      vmin=0.0,
      vmax=1.0,
      aspect="auto",
      interpolation~,
    )
    let svg = fig.to_svg()
    assert_true(svg.contains("data:image/png;base64,"))
    if interpolation == "antialiased" {
      assert_true(
        svg.contains("image-rendering:crisp-edges;image-rendering:pixelated"),
      )
    } else {
      assert_true(svg.contains("image-rendering:auto"))
    }
  }
}

///|
test "imshow none preserves origin, reversed extent, alpha, and clipping transform" {
  // A 200 x 200 figure has an 88 x 88 axes viewport with 56 px margins.
  for
    (origin, extent, matrix) in [
      ("upper", [0.0, 4.0, 0.0, 4.0], "44 0 0 44 0 0"),
      ("lower", [0.0, 4.0, 0.0, 4.0], "44 0 0 -44 0 88"),
      ("upper", [4.0, 0.0, 4.0, 0.0], "-44 0 0 -44 88 88"),
      ("lower", [4.0, 0.0, 4.0, 0.0], "-44 0 0 44 88 0"),
    ] {
    let fig = @scene.figure(width=200, height=200)
    fig.imshow(
      [[0.0, 1.0], [0.5, 0.25]],
      origin~,
      extent~,
      aspect="auto",
      alpha=0.5,
      interpolation="none",
    )
    // Keep axes direction independent of the image's extent direction.
    fig.set_x_limits(0.0, 4.0)
    fig.set_y_limits(0.0, 4.0)
    let svg = fig.to_svg()
    assert_true(svg.contains("<image width=\"2\" height=\"2\""))
    assert_true(svg.contains("transform=\"matrix(\{matrix})\""))
    assert_true(svg.contains("opacity=\"0.5\""))
    assert_true(
      svg.contains(
        "<svg x=\"56\" y=\"56\" width=\"88\" height=\"88\" overflow=\"hidden\"",
      ),
    )
  }
}

///|
test "imshow none follows reversed axes and clips partial and invisible images" {
  let fig = @scene.figure(width=200, height=200)
  fig.imshow(
    [[0.0, 1.0], [0.5, 0.25]],
    extent=[0.0, 4.0, 0.0, 4.0],
    aspect="auto",
    interpolation="none",
  )
  fig.set_x_limits(4.0, 0.0)
  fig.set_y_limits(4.0, 0.0)
  assert_true(fig.to_svg().contains("transform=\"matrix(-44 0 0 -44 88 88)\""))
  fig.set_x_limits(1.0, 3.0)
  fig.set_y_limits(1.0, 3.0)
  let cropped = fig.to_svg()
  assert_true(cropped.contains("transform=\"matrix(88 0 0 88 -44 -44)\""))
  assert_true(
    cropped.contains(
      "<svg x=\"56\" y=\"56\" width=\"88\" height=\"88\" overflow=\"hidden\"",
    ),
  )
  fig.set_x_limits(5.0, 6.0)
  assert_true(!fig.to_svg().contains("data:image/png;base64,"))
}

///|
test "imshow none forwards masked images" {
  let data = try! @core.masked_matrix([[0.0, 1.0]], mask=[[true, false]])
  let fig = @scene.figure(width=240, height=180)
  try! fig.imshow_masked(data, cmap="gray", aspect="auto", interpolation="none")
  assert_true(fig.to_svg().contains("data:image/png;base64,"))
}

///|
test "imshow none falls back to vector cells on nonlinear axes" {
  let fig = @scene.figure(width=240, height=180)
  try! fig.set_x_scale(@scale.log_scale())
  try! fig.imshow(
    [[1.0, 2.0]],
    vmin=1.0,
    vmax=2.0,
    extent=[1.0, 3.0, 0.0, 1.0],
    aspect="auto",
    interpolation="none",
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("<rect"))
  assert_true(!svg.contains("data:image/png;base64,"))
  assert_true(!svg.contains("NaN"))
}

///|
test "imshow rejects unsupported interpolation names" {
  let fig = @scene.figure()
  try fig.imshow([[0.0]], interpolation="unsupported") catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("interpolation"))
    _ => fail("expected an interpolation error")
  } noraise {
    _ => fail("expected an interpolation error")
  }
}
