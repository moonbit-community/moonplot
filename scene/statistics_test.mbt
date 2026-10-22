///|
test "hist returns counts and edges and renders bars" {
  let fig = @scene.figure(width=240, height=180)
  let result = try! fig.hist([0.0, 0.2, 0.8, 1.0, 0.0 / 0.0], bins=2)
  let counts = result.counts()
  let edges = result.edges()
  assert_eq(counts.length(), 2)
  assert_true(counts[0] == 2.0)
  assert_true(counts[1] == 2.0)
  assert_eq(edges.length(), 3)
  assert_true(edges[0] == 0.0)
  assert_true(edges[2] == 1.0)
  assert_eq(result.artists().length(), 1)
  assert_eq(result.patches().length(), 1)
  let patches = result.artists()
  patches.clear()
  assert_eq(result.artists().length(), 1)
  assert_true(fig.to_svg().contains("<rect"))
}

///|
test "hist rejects a non-positive bin count" {
  let fig = @scene.figure()
  try fig.hist([1.0, 2.0], bins=0) catch {
    @core.DataError::InvalidBins => ()
    _ => fail("expected invalid bins")
  } noraise {
    _ => fail("expected a histogram error")
  }
}

///|
test "hist handles empty and constant finite input" {
  let empty = @scene.figure()
  let empty_result = try! empty.hist([], bins=3)
  assert_eq(empty_result.counts().length(), 3)
  assert_eq(empty_result.edges().length(), 4)
  let constant = @scene.figure()
  let constant_result = try! constant.hist([2.0, 2.0], bins=2)
  assert_true(constant_result.edges()[0] < 2.0)
  assert_true(constant_result.edges()[2] > 2.0)
}
