///|
test "mesh metadata cursor handles image prefixes with stable Polygon identity instead of colors or copies" {
  let (fig, ax) = mesh_axes()
  ax.imshow([[-99.0]], aspect="auto")
  ax.pcolor([[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]])
  assert_eq(ax.state.val.artists.length(), 7)
  assert_eq(ax.state.val.artist_hits.length(), 6)
  let cursor = @ref.Ref(0)
  for index, artist in ax.state.val.artists {
    let metadata = ax.state.val.hit_metadata(artist, index, cursor)
    if index == 0 {
      assert_true(metadata.mesh() is None)
    } else {
      let mesh = metadata.mesh().unwrap()
      assert_eq(mesh.value, index.to_double())
      assert_eq(mesh.cell.row * mesh.columns + mesh.cell.column, index - 1)
    }
  }
  assert_eq(cursor.val, 6)
  let copied = copy_artist(ax.state.val.artists[1])
  assert_true(ax.state.val.hit_metadata(copied, 0, @ref.Ref(0)).mesh() is None)
  let frame = fig.to_drawing()
  let cells = frame.targets().filter(t => t.info.point.artist_index > 0)
  assert_eq(cells.map(t => t.info.value), [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
}

///|
test "mesh metadata survives inline contour expansion preceding it and stable line removal" {
  let (fig, ax) = mesh_axes()
  let removed = ax.plot_line(
    LineData::Numeric([1.0, 2.0]),
    LineData::Numeric([1.0, 2.0]),
    label="Remove",
  )
  let contour = ax.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5])
  ax.pcolormesh([[11.0, 12.0], [21.0, 22.0]])
  let before = ax.state.val.artists.length()
  ax.clabel(contour, inline=true)
  assert_true(ax.state.val.artists.length() > before + 1)
  removed.remove()
  let frame = fig.to_drawing()
  let cells = frame
    .targets()
    .filter(t => t.info.kind == @drawing.HitKind::Heatmap)
  assert_eq(cells.map(t => t.info.value), [11.0, 12.0, 21.0, 22.0])
  assert_eq(cells.map(t => t.info.point.point_index), [0, 1, 2, 3])
  for target in cells {
    assert_eq(frame.hit_info(target.info.point).unwrap().cell, target.info.cell)
  }
}
