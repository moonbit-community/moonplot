///|
test "errorbar validates arrays and renders" {
  let fig = @scene.figure(width=240, height=180)
  try! fig.errorbar([0.0, 1.0], [1.0, 2.0], yerr=[0.2, 0.3], xerr=[0.1, 0.1])
  let svg = fig.to_svg()
  assert_true(svg.contains("<polyline"))
  assert_true(svg.contains("stroke-width=\"2\""))
  assert_true(svg.contains("<line"))
}

///|
test "errorbar rejects invalid error values" {
  let fig = @scene.figure()
  try fig.errorbar([0.0], [1.0], yerr=[-1.0]) catch {
    @core.DataError::InvalidErrorBar(message~) =>
      assert_true(message.contains("non-negative"))
    _ => fail("expected invalid error bar")
  } noraise {
    _ => fail("expected an error bar error")
  }
  try fig.errorbar([0.0, 1.0], [1.0, 2.0], yerr=[0.1]) catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 2)
      assert_eq(actual, 1)
    }
    _ => fail("expected a length mismatch")
  } noraise {
    _ => fail("expected an error bar error")
  }
}
