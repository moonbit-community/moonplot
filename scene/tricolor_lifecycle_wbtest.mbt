///|
test "known tripcolor identity content and cross-kind replacements stay static without aliasing old Drawing" {
  for case in 0..<4 {
    let fig = tricolor_control_figure(0)
    let ax = fig.axes()
    let old = fig.to_drawing()
    let original = ax.state.val.artists[1]
    guard original is Polygon(points, style) else { fail("Polygon") }
    match case {
      0 => ax.state.val.artists[1] = copy_artist(original)
      1 => points[0] = @core.point(0.5, 0.5)
      2 => ax.state.val.artists[1] = Line(points, style)
      _ => ax.state.val.artists[1] = CompoundPolygon([points], style)
    }
    let current = fig.to_drawing()
    assert_eq(current.targets().length(), 2)
    assert_true(
      current
      .targets()
      .all(t => t.info.kind == Tripcolor && t.info.point.artist_index != 1),
    )
    assert_eq(old.targets().length(), 3)
    assert_eq(tricolor_pick(old, 1.0, 1.7, Nearest).unwrap().value, 30.0)
  }
}

///|
test "tripcolor known-slot cursor survives image prefixes inline contour reindex Line removal and clear" {
  let fig = figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 10.0)
  ax.set_y_limits(0.0, 10.0)
  let first = ax.plot_line(Numeric([0.0, 1.0]), Numeric([8.0, 8.0]))
  let second = ax.plot_line(Numeric([0.0, 1.0]), Numeric([9.0, 9.0]))
  ax.imshow([[0.0]], aspect="auto")
  ax.imshow([[0.0]], aspect="auto")
  let line = ax.contour(
    [[0.0, 1.0], [1.0, 2.0]],
    x=[4.0, 6.0],
    y=[1.0, 3.0],
    levels=[0.5],
    label="Contour",
  )
  ax.tripcolor(
    [1.0, 3.0, 1.0],
    [1.0, 1.0, 3.0],
    [[0, 1, 2]],
    [7.0],
    label="Face one",
  )
  ignore(
    ax.contourf(
      [[0.0, 1.0], [1.0, 2.0]],
      x=[6.0, 8.0],
      y=[6.0, 8.0],
      levels=[0.0, 2.0],
      label="Band",
    ),
  )
  ax.barbs([8.0], [8.0], [1.0], [1.0], barb_length=0.0, label="Wind")
  ax.tripcolor(
    [1.0, 3.0, 1.0],
    [1.0, 1.0, 3.0],
    [[0, 1, 2]],
    [9.0],
    label="Face two",
  )
  ax.clabel(line)
  first.remove()
  second.remove()
  let old = fig.to_drawing()
  let faces = old.targets().filter(t => t.info.kind == Tripcolor)
  assert_eq(faces.map(t => t.info.series), ["Face one", "Face two"])
  assert_eq(faces.map(t => t.info.value), [7.0, 9.0])
  assert_true(old.targets().any(t => t.info.kind == ContourF))
  assert_true(old.targets().any(t => t.info.kind == Barbs))
  for t in faces {
    let source = ax.state.val.tricolor_intents
      .get(t.info.point.artist_index)
      .unwrap().source
    assert_true(source.cursor.val > 0)
    assert_true(
      ax.state.val.artist_hits[source.cursor.val - 1].tricolor is Some(_),
    )
  }
  let p = old.hit_test(60.0, 240.0, radius=0.0).unwrap()
  assert_eq(old.hit_info(p).unwrap().series, "Face two")
  ax.clear_checked()
  assert_true(ax.state.val.tricolor_intents.is_empty())
  ax.plot([0.0, 1.0], [0.0, 1.0], label="New")
  assert_true(
    fig
    .to_drawing()
    .targets()
    .all(t => t.info.kind == Line && t.info.series == "New"),
  )
  assert_eq(old.hit_info(p).unwrap().series, "Face two")
}
