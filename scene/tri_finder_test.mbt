///|
test "trifinder locates interior, boundary, and exterior points" {
  let mesh = try! @scene.triangulation(
    [0.0, 1.0, 0.0, 1.0],
    [0.0, 0.0, 1.0, 1.0],
    triangles=[[0, 1, 2], [1, 3, 2]],
  )
  let finder = mesh.get_trifinder()
  assert_eq(finder.find(0.2, 0.2), 0)
  assert_eq(finder.find(0.8, 0.8), 1)
  assert_eq(finder.find(0.5, 0.5), 0)
  assert_eq(finder.find(-0.1, 0.5), -1)
  assert_eq(finder.find(0.5, 1.1), -1)
  assert_eq(finder.find(0.0 / 0.0, 0.0), -1)
  assert_eq(mesh.find_triangle(0.8, 0.8), 1)
}

///|
test "trifinder skips masked faces and supports batched queries" {
  let mesh = try! @scene.triangulation(
    [0.0, 1.0, 0.0, 1.0],
    [0.0, 0.0, 1.0, 1.0],
    triangles=[[0, 1, 2], [1, 3, 2]],
    mask=[false, true],
  )
  let finder = mesh.get_trifinder()
  assert_eq(finder.find(0.8, 0.8), -1)
  assert_eq(try! finder.find_many([0.2, 0.8, -1.0], [0.2, 0.8, 0.0]), [
    0, -1, -1,
  ])
  try finder.find_many([0.0], []) catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 1)
      assert_eq(actual, 0)
    }
    _ => fail("expected a batched finder length error")
  } noraise {
    _ => fail("expected a batched finder length error")
  }
}

///|
test "trifinder copies mesh arrays" {
  let xs = [0.0, 1.0, 0.0]
  let ys = [0.0, 0.0, 1.0]
  let mesh = try! @scene.triangulation(xs, ys, triangles=[[0, 1, 2]])
  let finder = mesh.get_trifinder()
  xs[0] = 100.0
  ys[0] = 100.0
  assert_eq(finder.find(0.2, 0.2), 0)
}
