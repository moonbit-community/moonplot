///|
test "vector metadata keeps raw components and finite validation does not require a magnitude" {
  let vector = @drawing.vector_info(1.7e308, 1.7e308)
  let p = @drawing.hit_point(0, 0, 2, -8.0e307, -8.0e307, 50.0, 50.0)
  let info = @drawing.hit_info(p, Quiver, value=vector.v, vector=Some(vector))
  let target = @drawing.hit_target(
    info,
    Segment(25.0, 50.0, 75.0, 50.0),
    (0.0, 0.0, 100.0, 100.0),
  )
  let frame = @drawing.drawing(100, 100, "", [], targets=[target])
  assert_eq(
    frame.hit_info(frame.hit_test(50.0, 50.0, radius=0.0).unwrap()).unwrap().vector,
    Some(vector),
  )
  for (u, v) in [(1.0 / 0.0, 1.0), (1.0, 0.0 / 0.0)] {
    let bad = @drawing.hit_info(
      p,
      Quiver,
      value=1.0,
      vector=Some(@drawing.vector_info(u, v)),
    )
    let frame = @drawing.drawing(100, 100, "", [], targets=[
      @drawing.hit_target(
        bad,
        Segment(25.0, 50.0, 75.0, 50.0),
        (0.0, 0.0, 100.0, 100.0),
      ),
    ])
    assert_true(frame.hit_test(50.0, 50.0) is None)
  }
  assert_true(@drawing.hit_info(p, Line, value=1.0).vector is None)
}
