///|
test "Barbs component views share one immutable input table and guard only their small own path" {
  let inputs = [@core.point(1.0, 2.0), @core.point(3.0, 4.0)]
  let vectors = [@core.point(5.0, 6.0), @core.point(0.0 / 0.0, 0.0)]
  let call = barb_hit_data(inputs, vectors, "wind").unwrap()
  let shaft = [@core.point(1.0, 2.0), @core.point(6.0, 8.0)]
  let feather = [@core.point(2.0, 3.0), @core.point(1.0, 4.0)]
  let a = call.view(0, Stroke, shaft).unwrap()
  let b = call.view(0, Stroke, feather).unwrap()
  assert_true(physical_equal(a.source.source.points, b.source.source.points))
  assert_true(physical_equal(a.source.source.vectors, b.source.source.vectors))
  assert_eq((a.expected.length(), b.expected.length()), (2, 2))
  inputs[0] = @core.point(99.0, 99.0)
  vectors[0] = @core.point(99.0, 99.0)
  assert_eq(a.datum().unwrap().vector, @drawing.vector_info(5.0, 6.0))
  assert_eq(a.series(), "wind")
  assert_true(a.matches_points(shaft))
  shaft[0] = @core.point(9.0, 9.0)
  assert_true(!a.matches_points(shaft))
  assert_true(b.matches_points(feather))
  assert_true(call.view(-1, Stroke, feather) is None)
  assert_true(call.view(2, Stroke, feather) is None)
  assert_true(call.view(0, Flag, feather) is None)
  assert_true(barb_hit_data(inputs, [], "wind") is None)
}
