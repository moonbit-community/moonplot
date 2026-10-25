///|
test "stem head capture follows actually written circles and original missing indices with independent fill paint" {
  let scale : Scale = {
    xmin: 0.0,
    xmax: 5.0,
    ymin: 0.0,
    ymax: 5.0,
    x_axis_scale: @ticker_scale.Linear,
    y_axis_scale: @ticker_scale.Linear,
  }
  let points = [
    @core.point(1.0, 4.0),
    @core.point(2.0, 0.0 / 0.0),
    @core.point(3.0, 2.0),
  ]
  let source = @render.stem_hit_data(
      [4.0, 0.0 / 0.0, 2.0],
      [1.0, 2.0, 3.0],
      1.0,
      false,
    )
    .unwrap()
    .view()
  for
    (color, fill, radius, marker, visible) in [
      ("none", "red", 3.5, "o", true),
      ("red", "none", 3.5, "o", false),
      ("red", "", 0.0, "o", false),
      ("transparent", "", 3.5, "o", false),
      ("red", "", 3.5, "s", false),
    ] {
    let writer = @xml.Writer::new()
    writer.start_element("svg", [])
    let style = @core.style(
      color,
      fill~,
      radius~,
      marker~,
      width=0.0,
      line_alpha=Some(0.0),
    )
    let hits : DrawingCapture = { points: [], targets: [], exclusions: [], }
    append_scatter(
      writer,
      scale,
      0.0,
      0.0,
      400.0,
      200.0,
      points,
      style,
      on_circle=stem_head_capture(
        Some(hits),
        stem_heads_for_paint(Some(source), points, style),
        0,
        4,
        (0.0, 0.0, 400.0, 200.0),
        "heads",
      ),
    )
    writer.end_element("svg")
    if visible {
      assert_eq(
        hits.targets.map(t => {
          (t.info.point.point_index, t.info.point.artist_index, t.info.value)
        }),
        [(0, 4, 4.0), (2, 4, 2.0)],
      )
      assert_true(
        hits.targets.all(t => t.info.kind == Stem && t.shape == Point),
      )
      assert_true(writer.to_string().contains("fill=\"red\""))
      assert_true(!writer.to_string().contains("opacity="))
    } else {
      assert_eq(hits.targets.length(), 0)
      assert_eq(hits.points.length(), 0)
    }
  }
}

///|
test "stem authoritative prepared Line context never reuses old raw rod metadata" {
  for prepared in [false, true] {
    let points = [@core.point(1.0, 1.0), @core.point(1.0, 4.0)]
    let source = @render.stem_hit_data([4.0], [1.0], 1.0, false).unwrap()
    let x = @axis.axis()
    let y = @axis.axis(horizontal=false)
    x.set_limits(0.0, 5.0)
    y.set_limits(0.0, 5.0)
    let style = @core.style("red")
    let panel = @render.panel_with_sharing(
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
      hit_metadata=[
        @render.hit_metadata("stem", stem=Some(source.view(rod=Some(0)))),
      ],
      line_provider=if prepared {
        Some(points => {
          Some(@render.line_drawing_context(points, style, () => ()))
        })
      } else {
        None
      },
    )
    let fig = @render.figure(400, 200, 0, [panel], [], None)
    let (frame, _) = render_drawing_with_positions_checked(fig)
    assert_eq(frame.svg(), render_with_positions_checked(fig).0)
    assert_eq(frame.targets().length(), if prepared { 0 } else { 1 })
  }
}
