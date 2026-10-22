///|
test "pyplot forwards typed color images" {
  @pyplot.close()
  ignore(@pyplot.figure(width=200, height=200))
  try! @pyplot.imshow_rgb(
    [[try! @colors.rgb(1.0, 0.0, 0.0), try! @colors.rgb(0.0, 1.0, 0.0)]],
    extent=[0.0, 2.0, 0.0, 1.0],
    aspect="auto",
  )
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("fill=\"#ff0000\""))
  assert_true(svg.contains("fill=\"#00ff00\""))
  @pyplot.close()
}

///|
test "pyplot forwards raw RGBA channels and transparency" {
  @pyplot.close()
  ignore(@pyplot.figure(width=200, height=200))
  try! @pyplot.imshow_rgba_channels(
    [[[0.0, 0.0, 1.0, 0.25], [1.0, 1.0, 0.0, 0.0]]],
    extent=[0.0, 2.0, 0.0, 1.0],
    aspect="auto",
  )
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("fill=\"rgba(0,0,255,0.25)\""))
  assert_true(svg.contains("fill=\"rgba(255,255,0,0)\""))
  @pyplot.close()
}

///|
test "pyplot forwards global image alpha" {
  @pyplot.close()
  ignore(@pyplot.figure(width=200, height=200))
  try! @pyplot.imshow_rgb_channels(
    [[[1.0, 0.0, 0.0]]],
    extent=[0.0, 1.0, 0.0, 1.0],
    aspect="auto",
    alpha=0.25,
  )
  assert_true(@pyplot.render_svg().contains("fill=\"rgba(255,0,0,0.25)\""))
  @pyplot.close()
}

///|
test "pyplot forwards RGBA none interpolation" {
  @pyplot.close()
  ignore(@pyplot.figure(width=200, height=200))
  try! @pyplot.imshow_rgba_channels(
    [[[1.0, 0.0, 0.0, 0.0]]],
    aspect="auto",
    alpha=0.5,
    interpolation="none",
  )
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("data:image/png;base64,"))
  assert_true(svg.contains("opacity=\"0.5\""))
  @pyplot.close()
}
