///|
fn cell_axes() -> (Figure, Axes) raise {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  for axis in [ax.x_axis(), ax.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (fig, ax)
}

///|
test "nearest scalar cells retain original matrix indices ranges and values across their whole rectangles" {
  let (fig, ax) = cell_axes()
  let data = [[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]]
  ax.imshow(data, origin="lower", aspect="auto")
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(frame.targets().length(), 6)
  for index, target in frame.targets() {
    assert_eq(target.info.kind, @drawing.HitKind::Heatmap)
    assert_eq(target.info.point.point_index, index)
    let row = index / 3
    let column = index % 3
    assert_eq(target.info.value, data[row][column])
    assert_eq(
      target.info.cell,
      Some(
        @drawing.cell_info(
          row,
          column,
          (column.to_double() - 0.5, column.to_double() + 0.5),
          (row.to_double() - 0.5, row.to_double() + 0.5),
        ),
      ),
    )
    guard target.shape is @drawing.HitShape::Rectangle(x, y, w, h) else {
      fail("A heatmap cell must carry its real painted rectangle")
    }
    for (fx, fy) in [(0.01, 0.01), (0.99, 0.99)] {
      assert_eq(
        frame.hit_test(x + w * fx, y + h * fy, radius=0.0),
        Some(target.info.point),
      )
    }
  }
}

///|
test "heatmap origin reversed extent and inverted axes preserve raw cell identity" {
  for origin in ["upper", "lower"] {
    let (fig, ax) = cell_axes()
    ax.imshow(
      [[10.0, 20.0, 30.0], [40.0, 50.0, 60.0]],
      origin~,
      extent=[10.0, -2.0, 6.0, -4.0],
      aspect="auto",
    )
    ax.set_x_limits(-2.0, 10.0)
    ax.set_y_limits(6.0, -4.0)
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    let targets = frame.targets()
    assert_eq(targets.length(), 6)
    let y_range = if origin == "upper" { (-4.0, 1.0) } else { (6.0, 1.0) }
    assert_eq(
      targets[0].info.cell,
      Some(@drawing.cell_info(0, 0, (10.0, 6.0), y_range)),
    )
    assert_eq(targets[5].info.value, 60.0)
    for target in targets {
      assert_eq(
        frame.hit_test(target.info.point.screen_x, target.info.point.screen_y),
        Some(target.info.point),
      )
    }
  }
}

///|
test "masked and nonfinite cells do not hit or renumber later matrix samples" {
  let (fig, ax) = cell_axes()
  let data = @core.masked_matrix(
    [[1.0, 2.0, 0.0 / 0.0], [4.0, 5.0, 1.0 / 0.0]],
    mask=[[false, true, false], [false, false, false]],
  )
  ax.imshow_masked(data, origin="lower", aspect="auto")
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(frame.targets().map(t => t.info.point.point_index), [0, 3, 4])
  assert_eq(frame.hit_test(200.0, 150.0, radius=100.0), None)
  assert_eq(frame.hit_test(350.0, 150.0), None)
  assert_eq(frame.hit_test(350.0, 50.0), None)
}

///|
test "only visible nearest scalar images expose heatmap targets" {
  for interpolation in ["none", "bilinear"] {
    let (fig, ax) = cell_axes()
    ax.imshow([[1.0, 2.0]], interpolation~, aspect="auto")
    let frame = fig.to_drawing()
    assert_eq(frame.targets().length(), 0)
    assert_eq(frame.hit_test(100.0, 100.0), None)
  }
  let (fig, ax) = cell_axes()
  ax.imshow([[1.0, 2.0]], alpha=0.0, aspect="auto")
  assert_eq(fig.to_drawing().targets().length(), 0)
  ax.clear()
  ax.imshow_rgb([[try! @colors.rgb(1.0, 0.0, 0.0)]], aspect="auto")
  assert_eq(fig.to_drawing().targets().length(), 0)
}

///|
test "heatmap clipping and CSS mapping select the same visible source cell" {
  let (fig, ax) = cell_axes()
  ax.imshow(
    [[1.0, 2.0, 3.0, 4.0], [5.0, 6.0, 7.0, 8.0]],
    origin="lower",
    extent=[0.0, 4.0, 0.0, 2.0],
    aspect="auto",
  )
  ax.set_x_limits(1.0, 3.0)
  let frame = fig.to_drawing()
  assert_eq(frame.targets().map(t => t.info.point.point_index), [1, 2, 5, 6])
  let point = frame.targets()[0].info.point
  assert_eq(
    frame.hit_test_client(
      10.0 + point.screen_x / 2.0,
      20.0 + point.screen_y / 2.0,
      10.0,
      20.0,
      200.0,
      100.0,
    ),
    Some(point),
  )
  assert_eq(
    frame.hit_test_client(
      point.screen_x,
      100.0 + point.screen_y,
      0.0,
      0.0,
      400.0,
      400.0,
    ),
    Some(point),
  )
  assert_eq(frame.hit_test_client(100.0, 20.0, 0.0, 0.0, 400.0, 400.0), None)
  assert_eq(frame.hit_test(-1.0, 100.0), None)
}

///|
test "heatmap frames copy values and replace metadata on data rebuild" {
  let (fig, ax) = cell_axes()
  let data = [[1.0, 2.0]]
  ax.imshow(data, aspect="auto")
  let old = fig.to_drawing()
  data[0][0] = 999.0
  assert_eq(old.targets()[0].info.value, 1.0)
  ax.clear()
  ax.imshow([[42.0, 2.0]], aspect="auto")
  let fresh = fig.to_drawing()
  assert_eq(old.targets()[0].info.value, 1.0)
  assert_eq(fresh.targets()[0].info.value, 42.0)
  assert_eq(
    fresh.hit_info(fresh.points()[0]).unwrap().cell,
    Some(@drawing.cell_info(0, 0, (-0.5, 0.5), (-0.5, 0.5))),
  )
}

///|
test "heatmap shared edges choose the last painted cell and panels remain independent" {
  let (fig, ax) = cell_axes()
  ax.imshow([[1.0, 2.0], [3.0, 4.0]], origin="lower", aspect="auto")
  let frame = fig.to_drawing()
  assert_eq(frame.hit_test(200.0, 100.0, radius=0.0), Some(frame.points()[3]))
  let other = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  other.imshow([[100.0]], aspect="auto")
  let overlay = fig.to_drawing()
  guard overlay.hit_test(200.0, 100.0) is Some(point) else {
    fail("overlay cell absent")
  }
  assert_eq(point.panel_index, 1)
  assert_eq(overlay.hit_info(point).unwrap().value, 100.0)
}

///|
test "matshow and transparent or covered heatmap cells follow actual display semantics" {
  let fig = figure(width=400, height=200)
  fig.matshow([[11.0, 22.0], [33.0, 44.0]])
  let matrix = fig.to_drawing()
  assert_eq(matrix.svg(), fig.to_svg_checked())
  assert_eq(matrix.targets().map(t => t.info.value), [11.0, 22.0, 33.0, 44.0])
  assert_eq(matrix.targets()[3].info.cell.unwrap().row, 1)
  assert_eq(matrix.targets()[3].info.cell.unwrap().column, 1)
  let (fig, ax) = cell_axes()
  let transparent = try! @colors.listed_colormap("clear", [
    try! @colors.rgba(1.0, 0.0, 0.0, alpha=0.0),
  ])
  ax.imshow_with_colormap([[1.0, 2.0]], transparent, aspect="auto")
  assert_eq(fig.to_drawing().targets().length(), 0)
  ax.clear()
  ax.imshow([[1.0, 2.0]], aspect="auto")
  ax.legend([legend_entry("Key")])
  let covered = fig.to_drawing()
  assert_eq(covered.hit_test(300.0, 24.0, radius=0.0), None)
  guard covered.hit_test(300.0, 100.0, radius=0.0) is Some(point) else {
    fail("visible cell missing")
  }
  assert_eq(covered.hit_info(point).unwrap().value, 2.0)
}
