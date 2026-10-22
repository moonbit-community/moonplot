///|
test "pie validates values and renders slices and labels" {
  let fig = @scene.figure(width=320, height=240)
  let fractions = try! fig.pie(
    [1.0, 2.0, 3.0],
    labels=["one", "two", "three"],
    colors=["#ff0000", "#00ff00", "#0000ff"],
  )
  assert_eq(fractions, [1.0 / 6.0, 2.0 / 6.0, 3.0 / 6.0])
  let svg = fig.to_svg()
  assert_true(svg.contains("<path"))
  assert_true(svg.contains("#ff0000"))
  assert_true(svg.contains("one"))
  assert_true(svg.contains("three"))
}

///|
test "pie rejects invalid values and mismatched labels" {
  let fig = @scene.figure()
  try fig.pie([1.0, -1.0]) catch {
    @core.DataError::InvalidPie(message~) =>
      assert_true(message.contains("non-negative"))
    _ => fail("expected invalid pie values")
  } noraise {
    _ => fail("expected a pie error")
  }
  try fig.pie([1.0, 2.0], labels=["only-one"]) catch {
    @core.DataError::InvalidPie(message~) =>
      assert_true(message.contains("labels"))
    _ => fail("expected invalid pie labels")
  } noraise {
    _ => fail("expected a pie error")
  }
}
