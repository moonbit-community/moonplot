///|
test "path collection broadcasts styles and renders per-point markers" {
  let fig = @scene.figure(width=320, height=220)
  let points = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  let colors = ["#112233", "#aabbcc"]
  let sizes = [4.0, 25.0]
  let collection = try! fig.scatter_collection(points, colors~, sizes~)
  points.push(@core.point(2.0, 2.0))
  colors[0] = "#ffffff"
  sizes[0] = 100.0
  assert_eq(collection.length(), 2)
  assert_eq(collection.points().length(), 2)
  let styles = collection.styles()
  assert_eq(styles[0].color(), "#112233")
  assert_eq(styles[1].color(), "#aabbcc")
  assert_true(styles[0].radius() == 2.0)
  assert_true(styles[1].radius() == 5.0)
  match fig.artists()[0] {
    @scene.Artist::PathCollection(stored) => {
      assert_eq(stored.length(), 2)
      assert_eq(stored.styles()[0].color(), "#112233")
    }
    _ => fail("expected a path collection artist")
  }
  let svg = fig.to_svg()
  assert_true(svg.contains("fill=\"#112233\""))
  assert_true(svg.contains("fill=\"#aabbcc\""))
  assert_true(svg.contains("r=\"2\""))
  assert_true(svg.contains("r=\"5\""))
}

///|
test "path collection broadcasts one style and rejects malformed inputs" {
  let collection = try! @scene.path_collection(
    [@core.point(0.0, 0.0), @core.point(1.0, 1.0)],
    colors=["#123456"],
    sizes=[9.0],
  )
  assert_eq(collection.styles()[0].color(), "#123456")
  assert_eq(collection.styles()[1].color(), "#123456")
  assert_true(collection.styles()[1].radius() == 3.0)
  try
    @scene.path_collection([@core.point(0.0, 0.0), @core.point(1.0, 1.0)], colors=[
      "#123456", "#654321", "#abcdef",
    ])
  catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 2)
      assert_eq(actual, 3)
    }
    _ => fail("expected a collection length error")
  } noraise {
    _ => fail("expected a collection length error")
  }
  try @scene.path_collection([@core.point(0.0, 0.0)], sizes=[-1.0]) catch {
    @core.DataError::InvalidCollection(message~) =>
      assert_true(message.contains("non-negative"))
    _ => fail("expected an invalid collection error")
  } noraise {
    _ => fail("expected an invalid collection error")
  }
}
