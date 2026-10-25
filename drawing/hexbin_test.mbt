///|
test "hexbin metadata is immutable scalar data with optional backwards compatible defaults" {
  let point = @drawing.hit_point(0, 2, 5, 1.0, 1.5, 50.0, 50.0)
  let bin = @drawing.hexbin_info(3, 4, 7, reduction=Sum)
  let info = @drawing.hit_info(point, Hexbin, value=42.0, hexbin=Some(bin))
  let frame = @drawing.drawing(100, 100, "", [point], targets=[
    @drawing.hit_target(
      info,
      Rectangle(10.0, 10.0, 80.0, 80.0),
      (0.0, 0.0, 100.0, 100.0),
    ),
  ])
  assert_eq(frame.hit_info(point).unwrap().hexbin, Some(bin))
  assert_eq(frame.hit_info(point).unwrap().value, 42.0)
  frame.targets().clear()
  assert_eq(frame.hit_test(20.0, 20.0, radius=0.0), Some(point))
  assert_eq(@drawing.hit_info(point, Scatter, value=1.0).hexbin, None)
  assert_eq(
    @drawing.hexbin_info(0, 0, 1).reduction,
    @drawing.HexbinReduction::Count,
  )
}

///|
test "hexbin metadata rejects invalid lattice indices counts and nonfinite source values" {
  let point = @drawing.hit_point(0, 0, 0, 1.0, 1.0, 50.0, 50.0)
  for
    bin in [
      @drawing.hexbin_info(-1, 0, 1),
      @drawing.hexbin_info(0, -1, 1),
      @drawing.hexbin_info(0, 0, 0),
      @drawing.hexbin_info(0, 0, -1),
    ] {
    let frame = @drawing.drawing(100, 100, "", [], targets=[
      @drawing.hit_target(
        @drawing.hit_info(point, Hexbin, value=1.0, hexbin=Some(bin)),
        Rectangle(10.0, 10.0, 80.0, 80.0),
        (0.0, 0.0, 100.0, 100.0),
      ),
    ])
    assert_eq(frame.hit_test(50.0, 50.0), None)
  }
  for value in [0.0 / 0.0, 1.0 / 0.0] {
    let frame = @drawing.drawing(100, 100, "", [], targets=[
      @drawing.hit_target(
        @drawing.hit_info(
          point,
          Hexbin,
          value~,
          hexbin=Some(@drawing.hexbin_info(0, 0, 1)),
        ),
        Rectangle(10.0, 10.0, 80.0, 80.0),
        (0.0, 0.0, 100.0, 100.0),
      ),
    ])
    assert_eq(frame.hit_test(50.0, 50.0), None)
  }
}
