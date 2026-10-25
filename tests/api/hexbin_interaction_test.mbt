///|
test "facade hexbin metadata exposes original center count reduction and returned bin index" {
  let fig = @mathplotlib.figure(width=400, height=200)
  let result = try! fig.hexbin(
    [0.1, 0.1, 0.1],
    [0.1, 0.1, 0.1],
    values=[1.0, 3.0, 5.0],
    gridsize=2,
    extent=[0.0, 4.0, 0.0, 4.0],
    reduce="sum",
    bins="log",
    label="Totals",
  )
  let frame = try! fig.to_drawing()
  let target = frame.targets()[0]
  let bin : @mathplotlib.HexbinInfo = target.info.hexbin.unwrap()
  let reduction : @mathplotlib.HexbinReduction = bin.reduction
  assert_eq(reduction, @mathplotlib.HexbinReduction::Sum)
  assert_eq((bin.row, bin.column, bin.count), (0, 0, 3))
  assert_eq((target.info.value, target.info.series), (9.0, "Totals"))
  assert_eq(
    (target.info.point.data_x, target.info.point.data_y),
    (result.centers()[0].x(), result.centers()[0].y()),
  )
  assert_eq(target.info.point.point_index, 0)
  assert_eq(frame.points().length(), 1)
  assert_eq(frame.targets().length(), 2)
  assert_eq(frame.targets()[0].info, frame.targets()[1].info)
}
