///|
test "known contourf component identity inner-array and content rewrites remain static without generic Line ownership" {
  for mode in 0..<4 {
    let (fig, _) = contourf_control_fixture(0)
    let ax = fig.axes()
    let old = fig.to_drawing()
    let index = if mode == 0 { 0 } else { 1 }
    let original = ax.state.val.artists[index]
    match (mode, original) {
      (0, _) => ax.state.val.artists[index] = copy_artist(original)
      (1, CompoundPolygon(rings, _)) => rings[0] = rings[0].copy()
      (2, CompoundPolygon(rings, _)) => rings[0][0] = @core.point(0.0, 0.0)
      (3, CompoundPolygon(rings, style)) =>
        ax.state.val.artists[index] = Line(rings[0], style)
      _ => fail("Expected fixture component")
    }
    let current = fig.to_drawing()
    assert_eq(
      current.targets().filter(t => t.info.point.artist_index == index).length(),
      0,
    )
    assert_eq(current.targets().length(), 2)
    assert_eq(old.targets().length(), 3)
  }
}

///|
test "contourf known slots and both other intent maps survive image prefixes inline erasure Line removal clear and old frames" {
  let fig = figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 10.0)
  ax.set_y_limits(0.0, 10.0)
  let first = ax.plot_line(Numeric([0.0, 1.0]), Numeric([8.0, 8.0]))
  let second = ax.plot_line(Numeric([0.0, 1.0]), Numeric([9.0, 9.0]))
  ax.imshow([[0.0]], aspect="auto")
  ax.imshow([[0.0]], aspect="auto")
  ignore(
    ax.contourf(
      [[2.0, 2.0, 2.0], [2.0, 0.0, 2.0], [2.0, 2.0, 2.0]],
      levels=[0.5, 1.5],
      extend_mode="both",
      label="Bands",
    ),
  )
  let line = ax.contour(
    [[0.0, 1.0], [1.0, 2.0]],
    x=[4.0, 6.0],
    y=[1.0, 3.0],
    levels=[0.5],
    label="Line",
  )
  ax.barbs([5.0], [5.0], [1.0], [1.0], barb_length=0.0, label="Wind")
  ax.clabel(line)
  first.remove()
  second.remove()
  let old = fig.to_drawing()
  assert_eq(old.targets().filter(t => t.info.kind == ContourF).length(), 3)
  assert_eq(old.targets().filter(t => t.info.kind == Barbs).length(), 1)
  for target in old.targets().filter(t => t.info.kind == ContourF) {
    let intent = ax.state.val.contourf_intents
      .get(target.info.point.artist_index)
      .unwrap()
    assert_eq(target.info.series, "Bands")
    assert_true(intent.source.cursor.val > 0)
    assert_true(
      ax.state.val.artist_hits[intent.source.cursor.val - 1].contourf is Some(_),
    )
  }
  ax.clear_checked()
  assert_true(ax.state.val.contourf_intents.is_empty())
  assert_true(ax.state.val.contour_intents.is_empty())
  assert_true(ax.state.val.barb_intents.is_empty())
  ax.plot([0.0, 1.0], [0.0, 1.0], label="New")
  assert_true(
    fig
    .to_drawing()
    .targets()
    .all(t => t.info.kind == Line && t.info.series == "New"),
  )
  assert_eq(old.targets().filter(t => t.info.kind == ContourF).length(), 3)
}
