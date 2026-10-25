///|
fn mesh_axes() -> (Figure, Axes) raise {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 6.0)
  ax.set_y_limits(0.0, 8.0)
  ax.legend([])
  for axis in [ax.x_axis(), ax.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (fig, ax)
}

///|
test "flat mesh whole-cell hits retain nonuniform source ranges original values and matrix order" {
  let data = [[10.0, 20.0, 30.0], [40.0, 50.0, 60.0]]
  let xs = [0.0, 1.0, 3.0, 6.0]
  let ys = [0.0, 2.0, 8.0]
  for fast in [false, true] {
    let (fig, ax) = mesh_axes()
    if fast {
      ax.pcolormesh(data, x=xs, y=ys)
    } else {
      ax.pcolor(data, x=xs, y=ys)
    }
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_eq(frame.targets().length(), 6)
    for index, target in frame.targets() {
      let row = index / 3
      let column = index % 3
      assert_eq(target.info.kind, @drawing.HitKind::Heatmap)
      assert_eq(target.info.point.point_index, index)
      assert_eq(target.info.value, data[row][column])
      assert_eq(
        target.info.cell,
        Some(
          @drawing.cell_info(
            row,
            column,
            (xs[column], xs[column + 1]),
            (ys[row], ys[row + 1]),
          ),
        ),
      )
      guard target.shape is @drawing.HitShape::Rectangle(x, y, width, height) else {
        fail("Expected the real rectangular face")
      }
      for (fx, fy) in [(0.01, 0.99), (0.99, 0.01)] {
        assert_eq(
          frame.hit_test(x + fx * width, y + fy * height, radius=0.0),
          Some(target.info.point),
        )
      }
    }
  }
}

///|
test "flat mesh reversed bounds axes and logarithmic geometry retain source orientation" {
  let (fig, ax) = mesh_axes()
  ax.set_x_limits(100.0, 1.0)
  ax.set_y_limits(20.0, 1.0)
  ax.set_x_scale(@scale.log_scale())
  ax.set_y_scale(@scale.log_scale())
  ax.pcolor([[1.0, 2.0], [3.0, 4.0]], x=[100.0, 10.0, 1.0], y=[20.0, 3.0, 1.0])
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(
    frame.targets()[0].info.cell,
    Some(@drawing.cell_info(0, 0, (100.0, 10.0), (20.0, 3.0))),
  )
  for target in frame.targets() {
    assert_eq(
      frame.hit_test(
        target.info.point.screen_x,
        target.info.point.screen_y,
        radius=0.0,
      ),
      Some(target.info.point),
    )
    guard target.shape is @drawing.HitShape::Rectangle(_, _, w, h) else {
      fail("Expected rectangle")
    }
    assert_true(w > 0.0 && h > 0.0)
  }
  ax.clear()
  ax.set_x_scale(@scale.log_scale())
  ax.set_x_limits(1.0, 100.0)
  ax.set_y_limits(0.0, 1.0)
  ax.pcolormesh([[7.0, 8.0, 9.0]], x=[-10.0, 1.0, 10.0, 100.0], y=[0.0, 1.0])
  let invalid = fig.to_drawing()
  assert_eq(invalid.svg(), fig.to_svg_checked())
  assert_eq(invalid.targets().map(t => t.info.point.point_index), [1, 2])
}

///|
test "flat mesh masks nonfinite and normalization-bad cells never invent data or compact indices" {
  for fast in [false, true] {
    let (fig, ax) = mesh_axes()
    ax.set_x_limits(0.0, 3.0)
    ax.set_y_limits(0.0, 2.0)
    let data = @core.masked_matrix(
      [[1.0, 0.0 / 0.0, 3.0], [4.0, 5.0, 1.0 / 0.0]],
      mask=[[false, false, false], [false, true, false]],
    )
    let norm = @colors.linear_color_norm(@colors.normalize(vmin=0.0, vmax=5.0))
    let cmap = @colors.colormap("viridis")
    cmap.set_bad(@colors.rgba(1.0, 0.0, 1.0))
    if fast {
      ax.pcolormesh_masked_with_norm_and_colormap(data, norm, cmap)
    } else {
      ax.pcolor_masked_with_norm_and_colormap(data, norm, cmap)
    }
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_eq(frame.targets().map(t => t.info.point.point_index), [0, 2, 3])
    assert_eq(frame.targets().map(t => t.info.value), [1.0, 3.0, 4.0])
    assert_eq(frame.hit_test(200.0, 150.0, radius=1000.0), None)
    assert_eq(frame.hit_test(200.0, 50.0, radius=1000.0), None)
    assert_eq(frame.hit_test(350.0, 50.0, radius=1000.0), None)
  }
  let (fig, ax) = mesh_axes()
  let norm = @colors.log_color_norm(@colors.log_norm(vmin=1.0, vmax=10.0))
  let cmap = @colors.colormap("viridis")
  cmap.set_bad(@colors.rgba(1.0, 0.0, 1.0))
  ax.pcolor_with_norm_and_colormap([[0.0, 1.0, 10.0]], norm, cmap)
  let frame = fig.to_drawing()
  assert_true(frame.svg().contains("#ff00ff"))
  assert_eq(frame.targets().map(t => t.info.point.point_index), [1, 2])
}

///|
test "flat mesh values are independent of identical normalized colors and transparent paint does not hit" {
  let (fig, ax) = mesh_axes()
  let norm = @colors.linear_color_norm(@colors.normalize(vmin=0.0, vmax=10.0))
  let red = @colors.listed_colormap("one", [@colors.rgba(1.0, 0.0, 0.0)])
  ax.pcolor_with_norm_and_colormap([[2.0, 8.0]], norm, red)
  assert_eq(fig.to_drawing().targets().map(t => t.info.value), [2.0, 8.0])
  ax.clear()
  let alpha = @colors.listed_colormap("clear-red", [
    @colors.rgba(1.0, 0.0, 0.0, alpha=0.0),
    @colors.rgba(1.0, 0.0, 0.0),
  ])
  let norm = @colors.linear_color_norm(@colors.normalize(vmin=0.0, vmax=1.0))
  ax.pcolormesh_with_norm_and_colormap([[0.0, 1.0]], norm, alpha)
  assert_eq(fig.to_drawing().targets().map(t => t.info.point.point_index), [1])
}

///|
test "flat mesh clipping CSS letterboxes legends and independent panels compose" {
  let (fig, ax) = mesh_axes()
  ax.pcolormesh([[10.0, 20.0, 30.0]], x=[0.0, 1.0, 3.0, 6.0], y=[0.0, 8.0])
  ax.set_x_limits(1.0, 4.0)
  let frame = fig.to_drawing()
  assert_eq(frame.targets().map(t => t.info.point.point_index), [1, 2])
  for target in frame.targets() {
    let p = target.info.point
    assert_eq(
      frame.hit_test_client(
        10.0 + p.screen_x / 2.0,
        20.0 + p.screen_y / 2.0,
        10.0,
        20.0,
        200.0,
        100.0,
        radius=0.0,
      ),
      Some(p),
    )
    assert_eq(
      frame.hit_test_client(
        p.screen_x,
        100.0 + p.screen_y,
        0.0,
        0.0,
        400.0,
        400.0,
        radius=0.0,
      ),
      Some(p),
    )
  }
  assert_eq(frame.hit_test_client(100.0, 20.0, 0.0, 0.0, 400.0, 400.0), None)
  assert_eq(frame.hit_test(-1.0, 100.0), None)
  ax.legend([legend_entry("Mesh")])
  assert_eq(fig.to_drawing().hit_test(300.0, 24.0), None)
  let other = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  other.legend([])
  other.pcolormesh([[99.0]])
  let overlay = fig.to_drawing()
  let p = overlay.hit_test(200.0, 100.0).unwrap()
  assert_eq((p.panel_index, overlay.hit_info(p).unwrap().value), (1, 99.0))
}

///|
test "flat mesh snapshots preserve source data and update independently after a rebuild" {
  let (fig, ax) = mesh_axes()
  let input = [[2.0, 8.0]]
  let xs = [0.0, 1.0, 3.0]
  ax.pcolor(input, x=xs, y=[0.0, 8.0])
  let old = fig.to_drawing()
  input[0][0] = 999.0
  xs[0] = -100.0
  assert_eq(fig.to_drawing().targets()[0].info.value, 2.0)
  old.targets().clear()
  assert_eq(old.targets()[0].info.cell.unwrap().x_range, (0.0, 1.0))
  ax.clear()
  ax.pcolor([[42.0, 8.0]], x=[0.0, 1.0, 3.0], y=[0.0, 8.0])
  let current = fig.to_drawing()
  assert_eq(current.targets()[0].info.value, 42.0)
  assert_eq(old.targets()[0].info.value, 2.0)
}

///|
test "two dimensional histograms expose original counts both intervals empty bins and final upper edges" {
  let (fig, ax) = mesh_axes()
  ax.set_x_limits(0.0, 2.0)
  ax.set_y_limits(0.0, 2.0)
  ax.hist2d(
    [0.0, 0.2, 1.8, 2.0, 0.0 / 0.0, 99.0],
    [0.0, 0.2, 0.0, 2.0, 99.0, 0.0 / 0.0],
    bins_x=2,
    bins_y=2,
  )
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(frame.targets().map(t => t.info.value), [2.0, 1.0, 0.0, 1.0])
  for index, target in frame.targets() {
    let row = index / 2
    let column = index % 2
    assert_eq(target.info.kind, @drawing.HitKind::Histogram2D)
    assert_eq(target.info.point.point_index, index)
    assert_eq(
      target.info.cell,
      Some(
        @drawing.cell_info(
          row,
          column,
          (column.to_double(), (column + 1).to_double()),
          (row.to_double(), (row + 1).to_double()),
        ),
      ),
    )
    assert_eq(
      frame.hit_test(
        target.info.point.screen_x,
        target.info.point.screen_y,
        radius=0.0,
      ),
      Some(target.info.point),
    )
  }
  let empty = frame.hit_test(100.0, 50.0, radius=0.0).unwrap()
  assert_eq(frame.hit_info(empty).unwrap().value, 0.0)
  // Shared boundaries select the later painted row/column, matching bin starts.
  assert_eq(
    frame.hit_info(frame.hit_test(200.0, 100.0, radius=0.0).unwrap()).unwrap().value,
    1.0,
  )
}

///|
test "two dimensional unequal bin counts and constant coordinates retain exact matrix orientation" {
  let (fig, ax) = mesh_axes()
  ax.hist2d([2.0, 2.0, 2.0], [0.0, 5.0, 10.0], bins_x=3, bins_y=2)
  let frame = fig.to_drawing()
  assert_eq(frame.targets().map(t => t.info.value), [
    0.0, 1.0, 0.0, 0.0, 2.0, 0.0,
  ])
  assert_eq(frame.targets()[0].info.cell.unwrap().x_range.0, 1.5)
  assert_eq(frame.targets()[5].info.cell.unwrap().x_range.1, 2.5)
  assert_eq(frame.targets()[0].info.cell.unwrap().y_range, (0.0, 5.0))
  assert_eq(frame.targets()[5].info.cell.unwrap().y_range, (5.0, 10.0))
}

///|
test "general polygons and two dimensional grid shading keep static output without false rectangle metadata" {
  for shading in ["flat", "nearest", "gouraud"] {
    let (fig, ax) = mesh_axes()
    if shading == "flat" {
      ax.pcolor_grid(
        [[1.0]],
        [[0.0, 2.0], [0.2, 1.8]],
        [[0.0, 0.2], [1.0, 2.0]],
        shading~,
      )
    } else {
      ax.pcolormesh_grid(
        [[0.0, 1.0], [2.0, 3.0]],
        [[0.0, 2.0], [0.2, 1.8]],
        [[0.0, 0.2], [1.0, 2.0]],
        shading~,
      )
    }
    ax.fill([0.0, 1.0, 0.5], [0.0, 0.0, 1.0])
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_true(frame.svg().contains("<polygon"))
    assert_eq(frame.targets().length(), 0)
  }
}
