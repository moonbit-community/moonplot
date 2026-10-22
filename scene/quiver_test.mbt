///|
test "quiver renders vector arrows" {
  let fig = @scene.figure(width=320, height=240)
  try! fig.quiver(
    [0.0, 1.0],
    [0.0, 1.0],
    [1.0, -0.5],
    [0.5, 1.0],
    color="#123456",
    label="field",
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("field"))
  assert_true(svg.contains("<line"))
}

///|
test "quiver validates vector lengths and finite values" {
  let fig = @scene.figure()
  try fig.quiver([0.0], [0.0], [1.0, 2.0], [0.0]) catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 1)
      assert_eq(actual, 2)
    }
    _ => fail("expected a vector length error")
  } noraise {
    _ => fail("expected a vector error")
  }
  try fig.quiver([0.0], [0.0], [0.0 / 0.0], [0.0]) catch {
    @core.DataError::InvalidQuiver(message~) =>
      assert_true(message.contains("finite"))
    _ => fail("expected an invalid vector error")
  } noraise {
    _ => fail("expected a vector error")
  }
}
