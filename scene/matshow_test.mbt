///|
test "matshow configures matrix ticks and equal aspect" {
  let fig = @scene.figure(width=320, height=240)
  try! fig.matshow([[0.0, 1.0, 2.0], [3.0, 4.0, 5.0]], vmin=0.0, vmax=5.0)
  let axes = fig.axes()
  assert_true(axes.aspect_equal())
  assert_eq(fig.x_axis().ticks(), Some([0.0, 1.0, 2.0]))
  assert_eq(fig.y_axis().ticks(), Some([0.0, 1.0]))
  match (fig.x_limits(), fig.y_limits()) {
    (Some(x), Some(y)) => {
      assert_eq(x.lower(), -0.5)
      assert_eq(x.upper(), 2.5)
      assert_eq(y.lower(), 1.5)
      assert_eq(y.upper(), -0.5)
    }
    _ => fail("expected matrix limits")
  }
  let svg = fig.to_svg()
  assert_true(svg.contains(">0<"))
  assert_true(svg.contains(">2<"))
  assert_true(svg.contains(">1<"))
  assert_true(svg.contains("#440154"))
  assert_true(svg.contains("#fde725"))
}

///|
test "matshow rejects ragged matrices" {
  let fig = @scene.figure()
  try fig.matshow([[1.0, 2.0], [3.0]]) catch {
    @core.DataError::InvalidImage(message~) =>
      assert_true(message.contains("equal length"))
    _ => fail("expected invalid matrix error")
  } noraise {
    _ => fail("expected an image error")
  }
}

///|
test "matshow forwards interpolation to the image renderer" {
  let fig = @scene.figure(width=320, height=240)
  try! fig.matshow([[0.0, 1.0], [1.0, 0.0]], interpolation="none")
  assert_true(fig.to_svg().contains("data:image/png;base64,"))
}
