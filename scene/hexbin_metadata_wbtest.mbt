///|
test "hexbin metadata cursor follows image prefixes and original Polygon array identities" {
  let (fig, ax) = hexbin_axes()
  ax.imshow([[-99.0]], aspect="auto")
  ignore(hexbin_pair(ax))
  assert_eq(ax.state.val.artists.length(), 3)
  assert_eq(ax.state.val.artist_hits.length(), 2)
  let cursor = @ref.Ref(0)
  for index, artist in ax.state.val.artists {
    let metadata = ax.state.val.hit_metadata(artist, index, cursor)
    if index == 0 {
      assert_true(metadata.hexbin() is None)
    } else {
      let bin = metadata.hexbin().unwrap()
      assert_eq(bin.index, index - 1)
      assert_eq(bin.value, (index + 1).to_double())
      assert_eq(bin.info.column, index - 1)
    }
  }
  assert_eq(cursor.val, 2)
  let copied = copy_artist(ax.state.val.artists[1])
  assert_true(
    ax.state.val.hit_metadata(copied, 0, @ref.Ref(0)).hexbin() is None,
  )
  let targets = fig
    .to_drawing()
    .targets()
    .filter(t => t.info.kind == @drawing.HitKind::Hexbin)
  assert_eq(targets.map(t => t.info.value), [2.0, 2.0, 3.0, 3.0])
  assert_eq(targets.map(t => t.info.point.artist_index), [1, 1, 2, 2])
}

///|
test "hexbin metadata survives inline contour expansion before the cells and line removal" {
  let (fig, ax) = hexbin_axes()
  let removed = ax.plot_line(
    LineData::Numeric([1.0, 2.0]),
    LineData::Numeric([1.0, 2.0]),
  )
  let contour = ax.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5])
  ignore(hexbin_pair(ax))
  let before = ax.state.val.artists.length()
  ax.clabel(contour, inline=true)
  assert_true(ax.state.val.artists.length() > before + 1)
  removed.remove()
  let frame = fig.to_drawing()
  let cells = frame
    .targets()
    .filter(t => t.info.kind == @drawing.HitKind::Hexbin)
  assert_eq(cells.map(t => t.info.value), [2.0, 2.0, 3.0, 3.0])
  assert_eq(cells.map(t => t.info.point.point_index), [0, 0, 1, 1])
  assert_eq(cells.map(t => t.info.hexbin.unwrap().column), [0, 0, 1, 1])
  for target in cells {
    assert_eq(
      frame.hit_info(target.info.point).unwrap().hexbin,
      target.info.hexbin,
    )
  }
}
