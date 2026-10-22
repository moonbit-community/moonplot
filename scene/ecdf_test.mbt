///|
test "ecdf sorts values, compresses duplicates, and renders" {
  let fig = @scene.figure(width=360, height=260)
  let result = try! fig.ecdf(
    [3.0, 1.0, 1.0, 2.0],
    weights=[1.0, 2.0, 1.0, 1.0],
    compress=true,
    color="#123456",
    label="cdf",
  )
  assert_eq(result.values(), [1.0, 2.0, 3.0])
  assert_true(result.probabilities()[0] == 0.6)
  assert_true(result.probabilities()[2] == 1.0)
  let svg = fig.to_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("<polyline"))
  assert_true(svg.contains("cdf"))
}

///|
test "ecdf supports complementary horizontal output and validates weights" {
  let fig = @scene.figure(width=320, height=220)
  let result = try! fig.ecdf(
    [1.0, 2.0, 3.0],
    complementary=true,
    horizontal=true,
  )
  assert_true(result.probabilities()[0] < 1.0)
  try fig.ecdf([1.0, 2.0], weights=[1.0]) catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 2)
      assert_eq(actual, 1)
    }
    _ => fail("expected an ecdf weight length error")
  } noraise {
    _ => fail("expected an ecdf weight length error")
  }
  try fig.ecdf([1.0, 2.0], weights=[1.0, -1.0]) catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("non-negative"))
    _ => fail("expected an ecdf weight error")
  } noraise {
    _ => fail("expected an ecdf weight error")
  }
}
