///|
test "cell metadata preserves reversed intervals and rejects invalid indices or nonfinite ranges" {
  let point = @drawing.hit_point(0, 0, 0, 2.0, 3.0, 50.0, 50.0)
  let good = @drawing.cell_info(1, 2, (4.0, 0.0), (6.0, 0.0))
  let info = @drawing.hit_info(point, Heatmap, value=42.0, cell=Some(good))
  let target = @drawing.hit_target(
    info,
    Rectangle(0.0, 0.0, 100.0, 100.0),
    (0.0, 0.0, 100.0, 100.0),
  )
  let frame = @drawing.drawing(100, 100, "", [point], targets=[target])
  assert_eq(frame.hit_test(1.0, 99.0, radius=0.0), Some(point))
  assert_eq(frame.hit_info(point).unwrap().cell, Some(good))
  for
    cell in [
      @drawing.cell_info(-1, 0, (0.0, 1.0), (0.0, 1.0)),
      @drawing.cell_info(0, -1, (0.0, 1.0), (0.0, 1.0)),
      @drawing.cell_info(0, 0, (0.0, 0.0), (0.0, 1.0)),
      @drawing.cell_info(0, 0, (0.0, 1.0), (0.0, 1.0 / 0.0)),
    ] {
    let invalid = @drawing.hit_info(point, Heatmap, value=42.0, cell=Some(cell))
    let bad = @drawing.drawing(100, 100, "", [point], targets=[
      @drawing.hit_target(invalid, target.shape, target.bounds),
    ])
    assert_eq(bad.hit_test(50.0, 50.0, radius=0.0), None)
    assert_eq(bad.hit_test(50.0, 50.0, mode=XNearest), None)
  }
}
