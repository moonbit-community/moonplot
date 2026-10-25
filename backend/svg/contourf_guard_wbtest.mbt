///|
test "ContourF metadata on an unproven Line context cannot become generic Line points" {
  let points = [
    @core.point(0.2, 0.2),
    @core.point(0.8, 0.2),
    @core.point(0.5, 0.8),
  ]
  let style = @core.style("purple")
  let data = @render.contourf_hit_data([points], 4, 0.5, 1.5, "filled-owner")
  let counts = []
  for prepared in [false, true] {
    let x = @axis.axis()
    let y = @axis.axis(horizontal=false)
    for a in [x, y] {
      a.set_limits(0.0, 1.0)
      a.set_locator(@ticker.NullLocator::new().as_locator())
      a.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
      a.clear_autoscale_request()
    }
    let p = @render.panel_with_sharing(
      None,
      [@render.Artist::Line(points, style)],
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
      hit_metadata=[@render.hit_metadata("filled-owner", contourf=Some(data))],
      line_provider=if prepared {
        Some(_ => Some(@render.line_drawing_context(points, style, () => ())))
      } else {
        None
      },
    )
    let f = render_drawing_with_positions_checked(
        @render.figure(400, 300, 0, [p], [], None),
      ).0
    counts.push(f.targets().length())
    println(
      "ContourF-metadata-Line prepared=\{prepared} actual-targets=\{f.targets().length()}",
    )
  }
  assert_eq(counts, [0, 0])
}

///|
test "ContourF capture stays in Polygon domain including prepared discrete context and preserves ordinary Line Scatter controls" {
  let points = [
    @core.point(0.2, 0.2),
    @core.point(0.8, 0.2),
    @core.point(0.5, 0.8),
  ]
  let style = @core.style("purple", fill="purple")
  let data = @render.contourf_hit_data([points], 4, 0.5, 1.5, "filled-owner")
  for case in 0..<7 {
    let x = @axis.axis()
    let y = @axis.axis(horizontal=false)
    for axis in [x, y] {
      axis.set_limits(0.0, 1.0)
    }
    let completed = [0]
    let artist = match case {
      0 | 4 => @render.Artist::Line(points, style)
      1 | 5 => @render.Artist::Scatter(points, style)
      2 => @render.Artist::Bar(points, style)
      3 => @render.Artist::Polygon(points, style)
      _ => @render.Artist::CompoundPolygon([points], style)
    }
    // The actual Compound array must be the source array for its positive
    // control. Other kinds receive the same deliberately unproven metadata.
    let source = match artist {
      @render.Artist::CompoundPolygon(rings, _) =>
        @render.contourf_hit_data(rings, 4, 0.5, 1.5, "filled-owner")
      _ => data
    }
    let panel = @render.panel_with_sharing(
      None,
      [artist],
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
      hit_metadata=[
        @render.hit_metadata(
          "filled-owner",
          contourf=if case == 4 || case == 5 { None } else { Some(source) },
        ),
      ],
      line_provider=if case == 0 {
        Some(_ => {
          Some(
            @render.line_drawing_context(
              points,
              style,
              () => completed[0] += 1,
              discrete=@render.discrete_line_hit_data(
                Step,
                points,
                [@render.discrete_datum(0, points[0], 99.0)],
                [0, 0],
              ),
            ),
          )
        })
      } else {
        None
      },
    )
    let fig = @render.figure(400, 300, 0, [panel], [], None)
    let frame = render_drawing_with_positions_checked(fig).0
    assert_eq(
      frame.targets().length(),
      if case < 3 {
        0
      } else if case == 4 || case == 5 {
        3
      } else {
        1
      },
    )
    if case == 0 {
      assert_eq(completed[0], 1)
    }
    if case == 3 || case == 6 {
      assert_eq(frame.targets()[0].info.kind, ContourF)
    }
    if case == 4 {
      assert_true(frame.targets().all(t => t.info.kind == Line))
    }
    if case == 5 {
      assert_true(frame.targets().all(t => t.info.kind == Scatter))
    }
  }
}
