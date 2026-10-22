///|
test "display rectangles preserve supplied geometry" {
  let bounds = @gridspec.rect(-20.0, 10.0, 0.0, 40.0)
  assert_eq(
    (bounds.x(), bounds.y(), bounds.width(), bounds.height()),
    (-20.0, 10.0, 0.0, 40.0),
  )
}

///|
test "gridspec computes row-major cells" {
  let grid = try! @gridspec.gridspec(2, 2, hspace=0.1, vspace=0.2)
  assert_eq(grid.rows(), 2)
  assert_eq(grid.columns(), 2)
  let cells = try! grid.cells(200, 100, 10)
  assert_eq(cells.length(), 4)
  assert_true(cells[0].x() == 10.0)
  assert_true(cells[0].y() == 10.0)
  assert_true(cells[1].x() > cells[0].x())
  assert_true(cells[2].y() > cells[0].y())
  assert_true(cells[0].width() > 0.0)
  assert_true(cells[0].height() > 0.0)
}

///|
test "gridspec rejects invalid dimensions and cells" {
  try @gridspec.gridspec(0, 2) catch {
    @gridspec.LayoutError::InvalidDimension => ()
    _ => fail("expected invalid dimensions")
  } noraise {
    _ => fail("expected a layout error")
  }
  let grid = try! @gridspec.gridspec(1, 1)
  try grid.cell(1, 0, 100, 100, 10) catch {
    @gridspec.LayoutError::CellOutOfBounds => ()
    _ => fail("expected an out of bounds cell")
  } noraise {
    _ => fail("expected a layout error")
  }
}

///|
test "gridspec spans rows and columns" {
  let grid = try! @gridspec.gridspec(2, 3)
  let span = try! grid.subplot(0, 2, 1, 3)
  assert_eq(span.row_start(), 0)
  assert_eq(span.row_end(), 2)
  assert_eq(span.column_start(), 1)
  assert_eq(span.column_end(), 3)
  let first = try! grid.cell(0, 1, 320, 240, 20)
  let rect = span.rect(320, 240, 20)
  assert_true(rect.x() == first.x())
  assert_true(rect.width() > first.width())
  assert_true(rect.height() > first.height())
}

///|
test "gridspec rejects malformed spans" {
  let grid = try! @gridspec.gridspec(2, 2)
  try grid.subplot(1, 1, 0, 1) catch {
    @gridspec.LayoutError::CellOutOfBounds => ()
    _ => fail("expected an invalid span")
  } noraise {
    _ => fail("expected a layout error")
  }
}

///|
test "gridspec flat indices and subplot boundaries follow row-major order" {
  let grid = try! @gridspec.gridspec(2, 3)
  let first = try! grid.index(0)
  let last = try! grid.index(-1)
  let last_by_cell = try! grid.cell_spec(-1, -1)
  assert_eq(first.row_span(), (0, 0))
  assert_eq(first.column_span(), (0, 0))
  assert_true(first.is_first_row())
  assert_true(first.is_first_col())
  assert_true(!first.is_last_row())
  assert_true(!first.is_last_col())
  assert_eq(last.row_span(), (1, 1))
  assert_eq(last.column_span(), (2, 2))
  assert_eq(last_by_cell.column_span(), (2, 2))
  assert_true(last.is_last_row())
  assert_true(last.is_last_col())
  assert_eq(grid.geometry(), (2, 3))
  assert_eq(grid.get_geometry(), (2, 3))
  assert_eq(grid.get_width_ratios(), [1.0, 1.0, 1.0])
  let geometry = first.get_geometry()
  assert_eq(geometry, (2, 3, 0, 0))
  assert_eq(first.get_gridspec().geometry(), (2, 3))
  try grid.index(6) catch {
    @gridspec.LayoutError::CellOutOfBounds => ()
    _ => fail("expected a flat index bounds error")
  } noraise {
    _ => fail("expected a flat index bounds error")
  }
}

///|
test "gridspec stores independent sharing modes" {
  let grid = try! @gridspec.gridspec(2, 3).with_shared_axes(
    @gridspec.ShareMode::Row,
    @gridspec.ShareMode::Column,
  )
  assert_true(grid.share_x_mode() is @gridspec.ShareMode::Row)
  assert_true(grid.share_y_mode() is @gridspec.ShareMode::Column)
}

///|
test "gridspec applies width and height ratios to cells" {
  let grid = try! @gridspec.gridspec(2, 2, width_ratios=[1.0, 3.0], height_ratios=[
    3.0, 1.0,
  ])
  assert_eq(grid.width_ratios(), [1.0, 3.0])
  assert_eq(grid.height_ratios(), [3.0, 1.0])
  let cells = try! grid.cells(420, 320, 56)
  assert_true(cells[1].width() > cells[0].width() * 2.9)
  assert_true(cells[0].height() > cells[2].height() * 2.9)
  let span = try! grid.subplot(0, 2, 0, 2).rect(420, 320, 56)
  assert_true(span.width() > cells[0].width() + cells[1].width())
  assert_true(span.height() > cells[0].height() + cells[2].height())
}

///|
test "gridspec validates and copies ratio inputs" {
  try @gridspec.gridspec(2, 2, width_ratios=[1.0]) catch {
    @gridspec.LayoutError::InvalidRatios => ()
    _ => fail("expected a width ratio length error")
  } noraise {
    _ => fail("expected a width ratio error")
  }
  try @gridspec.gridspec(2, 2, height_ratios=[1.0, 0.0]) catch {
    @gridspec.LayoutError::InvalidRatios => ()
    _ => fail("expected a height ratio value error")
  } noraise {
    _ => fail("expected a height ratio error")
  }
  let input = [1.0, 2.0]
  let grid = try! @gridspec.gridspec(1, 2, width_ratios=input)
  input[0] = 9.0
  assert_eq(grid.width_ratios(), [1.0, 2.0])
  let output = grid.width_ratios()
  output[0] = 8.0
  assert_eq(grid.width_ratios(), [1.0, 2.0])
  try grid.set_width_ratios([2.0, 1.0]) catch {
    _ => fail("valid ratio update failed")
  } noraise {
    _ => ()
  }
  assert_eq(grid.width_ratios(), [2.0, 1.0])
}

///|
test "gridspec spacing is a fraction of average cell size" {
  let grid = try! @gridspec.gridspec(1, 2, hspace=0.5, width_ratios=[1.0, 3.0])
  let cells = try! grid.cells(300, 100, 0)
  assert_true(Double::abs(cells[0].width() - 60.0) < 1.0e-12)
  assert_true(Double::abs(cells[1].width() - 180.0) < 1.0e-12)
  assert_true(Double::abs(cells[1].x() - 120.0) < 1.0e-12)
  assert_true(Double::abs(cells[1].x() + cells[1].width() - 300.0) < 1.0e-12)
}

///|
test "nested subgridspecs resolve inside their parent span" {
  let outer = try! @gridspec.gridspec(1, 2, width_ratios=[1.0, 2.0])
  let child = try! outer
    .cell_spec(0, 1)
    .subgridspec(2, 2, hspace=0.2, vspace=0.2, width_ratios=[3.0, 1.0])
  let left = try! child.cell_spec(0, 0).rect(420, 320, 56)
  let right = try! child.cell_spec(0, 1).rect(420, 320, 56)
  let bottom = try! child.cell_spec(1, 0).rect(420, 320, 56)
  let parent = try! outer.cell_spec(0, 1).rect(420, 320, 56)
  assert_true(left.x() >= parent.x())
  assert_true(left.y() >= parent.y())
  assert_true(right.x() > left.x())
  assert_true(bottom.y() > left.y())
  assert_true(
    right.x() + right.width() <= parent.x() + parent.width() + 1.0e-12,
  )
  assert_true(
    bottom.y() + bottom.height() <= parent.y() + parent.height() + 1.0e-12,
  )
  assert_true(left.width() > right.width() * 2.9)
}

///|
test "nested grids observe updated parent ratios" {
  let outer = try! @gridspec.gridspec(1, 2, width_ratios=[1.0, 1.0])
  let child = try! outer.cell_spec(0, 1).subgridspec(1, 1)
  let before = try! child.cell_spec(0, 0).rect(420, 320, 56)
  try! outer.set_width_ratios([3.0, 1.0])
  let after = try! child.cell_spec(0, 0).rect(420, 320, 56)
  assert_true(after.x() > before.x())
  assert_true(after.width() < before.width())
}

///|
test "grid spacing updates propagate to existing subplot rectangles" {
  let grid = try! @gridspec.gridspec(2, 2, hspace=0.1, vspace=0.1)
  let right_before = try! grid.cell_spec(0, 1).rect(420, 320, 56)
  let bottom_before = try! grid.cell_spec(1, 0).rect(420, 320, 56)
  try! grid.set_hspace(0.5)
  try! grid.set_vspace(0.5)
  assert_true(grid.hspace() == 0.5)
  assert_true(grid.vspace() == 0.5)
  let right_after = try! grid.cell_spec(0, 1).rect(420, 320, 56)
  let bottom_after = try! grid.cell_spec(1, 0).rect(420, 320, 56)
  assert_true(right_after.x() > right_before.x())
  assert_true(right_after.width() < right_before.width())
  assert_true(bottom_after.y() > bottom_before.y())
  assert_true(bottom_after.height() < bottom_before.height())
}

///|
test "grid spacing updates reach nested subplot specifications" {
  let outer = try! @gridspec.gridspec(1, 2)
  let child = try! outer.cell_spec(0, 1).subgridspec(1, 2)
  let before = try! child.cell_spec(0, 1).rect(420, 320, 56)
  try! outer.set_hspace(0.6)
  let after = try! child.cell_spec(0, 1).rect(420, 320, 56)
  assert_true(after.x() > before.x())
  assert_true(after.width() < before.width())
}

///|
test "grid spacing rejects non-finite values" {
  let grid = try! @gridspec.gridspec(1, 1)
  try grid.set_hspace(0.0 / 0.0) catch {
    @gridspec.LayoutError::InvalidSpacing => ()
    _ => fail("expected invalid horizontal spacing")
  } noraise {
    _ => fail("expected invalid horizontal spacing")
  }
  try grid.set_vspace(-1.0) catch {
    @gridspec.LayoutError::InvalidSpacing => ()
    _ => fail("expected invalid vertical spacing")
  } noraise {
    _ => fail("expected invalid vertical spacing")
  }
}
