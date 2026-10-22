///|
test "table builds labeled cells and renders through SVG" {
  let fig = @scene.figure(width=360, height=260)
  let table = try! fig.table(
    cell_text=[["1", "2"], ["3", "4"]],
    cell_colours=[["#ffeeee", "#eeffee"], ["#eeeeff", "#ffffee"]],
    row_labels=["first", "second"],
    row_colours=["#dddddd", "#cccccc"],
    col_labels=["A", "B"],
    col_colours=["#aaaaaa", "#bbbbbb"],
    loc="top",
  )
  assert_eq(table.rows(), 3)
  assert_eq(table.columns(), 3)
  assert_eq(table.cells().length(), 9)
  assert_eq(table.cell(1, 1).unwrap().text(), "1")
  assert_eq(table.cell(0, 0).unwrap().text(), "")
  let svg = fig.to_svg()
  assert_true(svg.contains(">A<"))
  assert_true(svg.contains(">first<"))
  assert_true(svg.contains(">4<"))
  assert_true(svg.contains("#ffeeee"))
  assert_true(svg.contains("<rect"))
}

///|
test "table accepts explicit normalized bbox and edge modes" {
  let fig = @scene.figure(width=300, height=220)
  let table = try! fig
    .axes()
    .table(
      cell_text=[["left", "right"]],
      cell_loc="left",
      bbox=[0.1, 0.2, 0.8, 0.3],
      edges="horizontal",
    )
  assert_true(table.x() == 0.1)
  assert_true(table.y() == 0.2)
  assert_true(fig.to_svg().contains("left"))
}

///|
test "table validates dimensions and alignment" {
  let fig = @scene.figure()
  try fig.table(cell_text=[["a", "b"], ["c"]]) catch {
    @core.DataError::InvalidReference(message~) =>
      assert_true(message.contains("equal length"))
    _ => fail("expected ragged table error")
  } noraise {
    _ => fail("expected ragged table error")
  }
  try fig.table(cell_text=[["a"]], col_labels=["a", "b"]) catch {
    @core.DataError::InvalidReference(message~) =>
      assert_true(message.contains("column labels"))
    _ => fail("expected table label error")
  } noraise {
    _ => fail("expected table label error")
  }
  try fig.table(cell_text=[["a"]], cell_loc="diagonal") catch {
    @core.DataError::InvalidReference(message~) =>
      assert_true(message.contains("left"))
    _ => fail("expected table alignment error")
  } noraise {
    _ => fail("expected table alignment error")
  }
}
