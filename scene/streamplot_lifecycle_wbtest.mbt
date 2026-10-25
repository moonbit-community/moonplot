///|
test "streamplot known component identity content and cross-kind replacements cannot revive body or arrow generic targets" {
  for case in 0..<5 {
    let (fig, _) = streamplot_control_fixture(1)
    let axes = fig.axes()
    let old = fig.to_drawing()
    let index = if case < 3 { 0 } else { case - 2 }
    let original = axes.state.val.artists[index]
    match (case, original) {
      (0, _) => axes.state.val.artists[index] = copy_artist(original)
      (1, Line(points, _)) => points[0] = @core.point(1.7, 1.7)
      (2, Line(points, style)) =>
        axes.state.val.artists[index] = Scatter(points, style)
      (3, _) => axes.state.val.artists[index] = copy_artist(original)
      (4, Polygon(points, style)) =>
        axes.state.val.artists[index] = Scatter(points, style)
      _ => fail("Expected actual body shaft or filled head")
    }
    let current = fig.to_drawing()
    assert_eq(current.targets().length(), if case < 3 { 6 } else { 12 })
    assert_true(current.targets().all(t => t.info.kind == Streamplot))
    assert_eq(old.targets().length(), 12)
    assert_eq(
      old.hit_info(old.targets()[0].info.point),
      Some(old.targets()[0].info),
    )
  }
}

///|
test "streamplot shared known-slot cursors survive image prefixes inline reindex and Line removal without borrowing other kind provenance" {
  let fig = figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 2.0)
  ax.set_y_limits(0.0, 2.0)
  let first = ax.plot_line(Numeric([0.0, 0.1]), Numeric([1.8, 1.8]))
  let second = ax.plot_line(Numeric([0.0, 0.1]), Numeric([1.9, 1.9]))
  ax.imshow([[0.0]], aspect="auto")
  ax.imshow([[0.0]], aspect="auto")
  let contour = ax.contour(
    [[0.0, 1.0], [1.0, 2.0]],
    x=[0.0, 2.0],
    y=[0.0, 2.0],
    levels=[0.5],
    label="Contour",
  )
  for label in ["Flow one", "Flow two"] {
    ignore(
      ax.streamplot(
        [0.0, 1.0, 2.0],
        [0.0, 1.0, 2.0],
        [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
        [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
        density=0.2,
        max_steps=6,
        minlength=0.0,
        maxlength=1.0,
        start_points=[@core.point(0.25, 1.5)],
        integration_direction="forward",
        broken_streamlines=false,
        arrows=true,
        label~,
      ),
    )
  }
  ax.tripcolor(
    [1.6, 1.9, 1.6],
    [0.1, 0.1, 0.4],
    [[0, 1, 2]],
    [7.0],
    label="Face",
  )
  ignore(
    ax.contourf(
      [[0.0, 1.0], [1.0, 2.0]],
      x=[1.6, 1.9],
      y=[0.5, 0.8],
      levels=[0.0, 2.0],
      label="Band",
    ),
  )
  ax.barbs([1.7], [1.0], [0.1], [0.1], barb_length=0.0, label="Wind")
  ax.clabel(contour)
  first.remove()
  second.remove()
  let old = fig.to_drawing()
  let flows = old.targets().filter(t => t.info.kind == Streamplot)
  assert_eq(flows.length(), 12)
  assert_eq(flows.map(t => t.info.series), [
    "Flow one", "Flow one", "Flow one", "Flow one", "Flow one", "Flow one", "Flow two",
    "Flow two", "Flow two", "Flow two", "Flow two", "Flow two",
  ])
  assert_true(old.targets().any(t => t.info.kind == Tripcolor))
  assert_true(old.targets().any(t => t.info.kind == ContourF))
  assert_true(old.targets().any(t => t.info.kind == Barbs))
  for target in flows {
    let source = ax.state.val.streamplot_intents
      .get(target.info.point.artist_index)
      .unwrap().source
    assert_true(source.cursor.val > 0)
    assert_true(
      ax.state.val.artist_hits[source.cursor.val - 1].streamplot is Some(_),
    )
  }
  let p = flows[0].info.point
  let selected = old.hit_test(p.screen_x, p.screen_y, radius=0.0).unwrap()
  assert_eq(old.hit_info(selected).unwrap().series, "Flow two")
  ax.clear_checked()
  assert_true(ax.state.val.streamplot_intents.is_empty())
  ax.plot([0.0, 1.0], [0.0, 1.0], label="New ordinary")
  assert_true(
    fig
    .to_drawing()
    .targets()
    .all(t => t.info.kind == Line && t.info.series == "New ordinary"),
  )
  assert_eq(old.hit_info(selected).unwrap().series, "Flow two")
}

///|
test "streamplot actual shafts heads and bars stay owned static for alternate arrow styles" {
  for arrowstyle in ["-", "<-", "<->", "|-|", "<|-|>"] {
    let fig = figure(width=400, height=300)
    let set = fig.streamplot(
      [0.0, 1.0, 2.0],
      [0.0, 1.0, 2.0],
      [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
      [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
      density=0.2,
      max_steps=6,
      minlength=0.0,
      maxlength=1.0,
      start_points=[@core.point(0.25, 1.0)],
      integration_direction="forward",
      broken_streamlines=false,
      arrows=true,
      arrowstyle~,
      num_arrows=2,
    )
    assert_eq(set.lines().length(), 1)
    assert_true(set.arrows().length() > 0)
    let frame = fig.to_drawing()
    assert_eq(frame.targets().length(), 6)
    assert_true(
      frame
      .targets()
      .all(t => t.info.kind == Streamplot && t.info.point.artist_index == 0),
    )
    for i in 1..<fig.artists().length() {
      let owned = fig.axes().state.val.streamplot_intents.get(i).unwrap().source.view
      assert_true(owned.enabled() && !owned.body())
    }
  }
}
