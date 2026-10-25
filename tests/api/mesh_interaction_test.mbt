///|
test "facade flat mesh and histogram2d expose existing typed cell ranges and original values" {
  let fig = @mathplotlib.figure(width=400, height=200)
  try! fig.pcolor([[2.0, 8.0]], x=[0.0, 1.0, 4.0], y=[0.0, 2.0])
  let frame = try! fig.to_drawing()
  let cell : @mathplotlib.CellInfo = frame.targets()[1].info.cell.unwrap()
  assert_eq(
    (cell.row, cell.column, cell.x_range, cell.y_range),
    (0, 1, (1.0, 4.0), (0.0, 2.0)),
  )
  assert_eq(frame.targets()[1].info.value, 8.0)
  fig.clear()
  try! fig.hist2d([0.0, 1.0], [0.0, 1.0], bins_x=2, bins_y=2)
  let histogram = try! fig.to_drawing()
  assert_true(
    histogram
    .targets()
    .all(t => t.info.kind == @mathplotlib.HitKind::Histogram2D),
  )
  assert_eq(histogram.targets().map(t => t.info.value), [1.0, 0.0, 0.0, 1.0])
}
