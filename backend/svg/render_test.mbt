///|
test "svg renders category tick labels from an axis" {
  let x_axis = @axis.axis()
  try! x_axis.set_categories(["alpha", "beta"])
  let y_axis = @axis.axis()
  let panel = @render.panel(
    None,
    [],
    None,
    [],
    None,
    x_axis,
    y_axis,
    false,
    [],
    [],
  )
  let figure = @render.figure(240, 180, 40, [panel], [], None)
  let svg = @svg.render(figure)
  assert_true(svg.contains(">alpha<"))
  assert_true(svg.contains(">beta<"))
}

///|
test "svg keeps logarithmic bars finite" {
  let x_axis = @axis.axis()
  let y_axis = @axis.axis()
  try! y_axis.set_scale(@ticker_scale.log_scale())
  let points = [@core.point(1.0, 1.0), @core.point(2.0, 10.0)]
  let panel = @render.panel(
    None,
    [@render.Artist::Bar(points, @core.style("#2ca02c"))],
    None,
    [],
    None,
    x_axis,
    y_axis,
    false,
    [],
    [],
  )
  let svg = @svg.render(@render.figure(320, 220, 40, [panel], [], None))
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
}

///|
test "svg skips non-positive image cells on logarithmic axes" {
  let x_axis = @axis.axis()
  let y_axis = @axis.axis()
  try! x_axis.set_scale(@ticker_scale.log_scale())
  try! y_axis.set_scale(@ticker_scale.log_scale())
  let image = @render.Artist::Image(
    [[0.0, 1.0], [2.0, 3.0]],
    None,
    None,
    try! @colors.colormap("gray"),
  )
  let panel = @render.panel(
    None,
    [image],
    None,
    [],
    None,
    x_axis,
    y_axis,
    false,
    [],
    [],
  )
  let svg = @svg.render(@render.figure(320, 220, 40, [panel], [], None))
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
}

///|
test "svg position queries match the rectangles returned by drawing" {
  let x_axis = @axis.axis()
  let y_axis = @axis.axis()
  x_axis.set_limits(0.0, 1.0)
  y_axis.set_limits(0.0, 1.0)
  let panel = @render.panel(
    None,
    [
      @render.Artist::Line(
        [@core.point(0.0, 0.0), @core.point(1.0, 1.0)],
        @core.style("#123456"),
      ),
    ],
    None,
    [],
    None,
    x_axis,
    y_axis,
    true,
    [],
    [],
  )
  let figure = @render.figure(400, 200, 50, [panel], [], None)
  let (svg, positions) = @svg.render_with_positions(figure)
  assert_eq(svg, @svg.render(figure))
  assert_eq(positions, [(150.0, 50.0, 100.0, 100.0)])
  assert_eq(@svg.panel_position(figure, 0), Some(positions[0]))
  assert_true(svg.contains("points=\"150,150 250,50\""))
  assert_true(@svg.panel_position(figure, -1) is None)
  assert_true(@svg.panel_position(figure, 1) is None)
  let empty = @render.figure(400, 200, 50, [], [], None)
  assert_true(@svg.panel_position(empty, 0) is None)
  assert_eq(@svg.render_with_positions(empty).1.length(), 0)
}

///|
test "svg numeric aspect overrides legacy equal flags and matches active queries" {
  let x_axis = @axis.axis()
  let y_axis = @axis.axis()
  x_axis.set_limits(0.0, 1.0)
  y_axis.set_limits(0.0, 1.0)
  for aspect in [0.5, 2.0] {
    let panel = @render.panel(
      None,
      [],
      None,
      [],
      None,
      x_axis,
      y_axis,
      true,
      [],
      [],
      aspect~,
    )
    let shared = @render.panel_with_sharing(
      None,
      [],
      None,
      [],
      None,
      x_axis,
      y_axis,
      None,
      None,
      true,
      [],
      [],
      aspect~,
    )
    assert_eq(panel.aspect(), Some(aspect))
    assert_eq(shared.aspect(), Some(aspect))
    assert_true(!panel.equal_aspect())
    let figure = @render.figure(400, 200, 50, [panel], [], None)
    let (svg, positions) = @svg.render_with_positions(figure)
    assert_eq(Some(positions[0]), @svg.panel_position(figure, 0))
    assert_eq(positions[0].3 / positions[0].2, aspect)
    assert_eq(svg, @svg.render(figure))
  }
}

///|
test "svg anchor queries and draw positions agree for lower left fractions" {
  let x_axis = @axis.axis()
  let y_axis = @axis.axis()
  x_axis.set_limits(0.0, 1.0)
  y_axis.set_limits(0.0, 1.0)
  for
    (aspect, anchor, expected) in [
      (1.0, (0.0, 0.0), (50.0, 50.0, 100.0, 100.0)),
      (1.0, (1.0, 1.0), (250.0, 50.0, 100.0, 100.0)),
      (0.25, (0.0, 0.0), (50.0, 75.0, 300.0, 75.0)),
      (0.25, (1.0, 1.0), (50.0, 50.0, 300.0, 75.0)),
    ] {
    let panel = @render.panel(
      None,
      [],
      None,
      [],
      None,
      x_axis,
      y_axis,
      false,
      [],
      [],
      aspect~,
      anchor~,
    )
    let shared = @render.panel_with_sharing(
      None,
      [],
      None,
      [],
      None,
      x_axis,
      y_axis,
      None,
      None,
      false,
      [],
      [],
      aspect~,
      anchor~,
    )
    assert_eq(panel.anchor(), anchor)
    assert_eq(shared.anchor(), anchor)
    let figure = @render.figure(400, 200, 50, [panel], [], None)
    let (svg, positions) = @svg.render_with_positions(figure)
    assert_eq(positions, [expected])
    assert_eq(@svg.panel_position(figure, 0), Some(expected))
    assert_eq(svg, @svg.render(figure))
  }
}

///|
test "datalim panel views remain pure and match rendered limits and positions" {
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_limits(0.0, 1.0)
  y.set_limits(0.0, 1.0)
  let panel = @render.panel(
    None,
    [
      @render.Artist::Line(
        [@core.point(0.0, 0.0), @core.point(1.0, 1.0)],
        @core.style("#123456"),
      ),
    ],
    None,
    [],
    None,
    x,
    y,
    true,
    [],
    [],
    adjustable="datalim",
  )
  let fig = @render.figure(400, 200, 0, [panel], [], None)
  let view = @svg.panel_view(fig, 0).unwrap()
  assert_eq(view.0, (0.0, 0.0, 400.0, 200.0))
  assert_eq((view.1.lower(), view.1.upper()), (-0.5, 1.5))
  assert_eq((view.2.lower(), view.2.upper()), (0.0, 1.0))
  let (svg, positions) = @svg.render_with_positions(fig)
  assert_eq(positions, [view.0])
  assert_true(svg.contains("points=\"100,200 300,0\""))
  assert_eq(x.limits().unwrap().lower(), 0.0)
  assert_eq(x.limits().unwrap().upper(), 1.0)
  assert_true(@svg.panel_view(fig, -1) is None)
  assert_true(@svg.panel_view(fig, 1) is None)
}

///|
test "checked panel view reports invalid datalim sharing while position query returns none" {
  let x = @axis.axis()
  let y = @axis.axis()
  let panel = @render.panel_with_sharing(
    None,
    [],
    None,
    [],
    None,
    x,
    y,
    Some(0),
    Some(0),
    true,
    [],
    [],
    adjustable="datalim",
  )
  let fig = @render.figure(400, 200, 0, [panel, panel], [], None)
  try @svg.panel_view(fig, 0) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected invalid datalim sharing")
  } noraise {
    _ => fail("expected invalid datalim sharing")
  }
  assert_true(@svg.panel_position(fig, 0) is None)
  assert_true(
    x.current_view_limits() is None && y.current_view_limits() is None,
  )
}

///|
test "box aspect metadata and pure views match auto and numeric draw geometry" {
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_limits(0.0, 1.0)
  y.set_limits(0.0, 1.0)
  let artists = [
    @render.Artist::Line(
      [@core.point(0.0, 0.0), @core.point(1.0, 1.0)],
      @core.style("#123456"),
    ),
  ]
  for aspect in [None, Some(2.0)] {
    let panel = @render.panel(
      None,
      artists,
      None,
      [],
      None,
      x,
      y,
      false,
      [],
      [],
      aspect?,
      adjustable="datalim",
      box_aspect=1.0,
    )
    let shared = @render.panel_with_sharing(
      None,
      artists,
      None,
      [],
      None,
      x,
      y,
      None,
      None,
      false,
      [],
      [],
      aspect?,
      adjustable="datalim",
      box_aspect=1.0,
    )
    assert_eq(panel.box_aspect(), Some(1.0))
    assert_eq(shared.box_aspect(), Some(1.0))
    let fig = @render.figure(400, 200, 0, [panel], [], None)
    let view = @svg.panel_view(fig, 0).unwrap()
    assert_eq(view.0, (100.0, 0.0, 200.0, 200.0))
    let (svg, positions) = @svg.render_with_positions(fig)
    assert_eq(positions, [view.0])
    if aspect is None {
      assert_eq((view.1.lower(), view.1.upper()), (0.0, 1.0))
      assert_true(svg.contains("points=\"100,200 300,0\""))
    } else {
      assert_eq((view.1.lower(), view.1.upper()), (-0.5, 1.5))
      assert_true(svg.contains("points=\"150,200 250,0\""))
    }
    assert_eq(x.limits().unwrap().lower(), 0.0)
    assert_eq(x.limits().unwrap().upper(), 1.0)
  }
}

///|
test "box strategy ignores saved box ratios for numeric data and rejects invalid auto combinations" {
  let x = @axis.axis()
  let y = @axis.axis()
  x.set_limits(0.0, 1.0)
  y.set_limits(0.0, 1.0)
  let fixed = @render.panel(
    None,
    [],
    None,
    [],
    None,
    x,
    y,
    true,
    [],
    [],
    box_aspect=2.0,
  )
  let fig = @render.figure(400, 200, 0, [fixed], [], None)
  assert_eq(@svg.panel_view(fig, 0).unwrap().0, (100.0, 0.0, 200.0, 200.0))
  let automatic = @render.panel(
    None,
    [],
    None,
    [],
    None,
    x,
    y,
    false,
    [],
    [],
    box_aspect=2.0,
  )
  let invalid = @render.figure(400, 200, 0, [automatic], [], None)
  try @svg.panel_view(invalid, 0) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected invalid auto box strategy")
  } noraise {
    _ => fail("expected invalid auto box strategy")
  }
  assert_true(@svg.panel_position(invalid, 0) is None)
}
