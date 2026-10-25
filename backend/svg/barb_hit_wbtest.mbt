///|
test "Barbs actual flag paint separates fill and stroke independently of absent Line alpha properties" {
  let scale : Scale = {
    xmin: 0.0,
    xmax: 5.0,
    ymin: 0.0,
    ymax: 5.0,
    x_axis_scale: @ticker_scale.Linear,
    y_axis_scale: @ticker_scale.Linear,
  }
  let points = [
    @core.point(1.0, 1.0),
    @core.point(3.0, 1.0),
    @core.point(1.0, 3.0),
  ]
  let call = @render.barb_hit_data(
    [@core.point(0.0, 0.0)],
    [@core.point(55.0, 0.0)],
    "flag",
  ).unwrap()
  let source = call.view(0, Flag, points).unwrap()
  for
    (style, count) in [
      (@core.style("none", width=0.0, fill="red", line_alpha=Some(0.0)), 1),
      (@core.style("red", fill="none", line_alpha=Some(0.0)), 3),
      (@core.style("red", width=0.0, fill="none"), 0),
      (@core.style("rgba(0,0,0,0)", fill="red"), 1),
      (@core.style("red", fill="rgba(0,0,0,0)"), 3),
      (@core.style("red", fill="red"), 4),
    ] {
    let writer = @xml.Writer::new()
    writer.start_element("svg", [])
    let hits : DrawingCapture = { points: [], targets: [], exclusions: [], }
    append_polygon(
      writer,
      scale,
      0.0,
      0.0,
      400.0,
      200.0,
      points,
      style,
      on_polygon=Some(actual => {
        collect_barb_flag(
          hits,
          Some(source),
          0,
          4,
          actual,
          scale,
          (0.0, 0.0, 400.0, 200.0),
          style,
        )
      }),
    )
    writer.end_element("svg")
    assert_eq(hits.targets.length(), count)
    assert_true(!writer.to_string().contains("opacity="))
    for target in hits.targets {
      assert_eq(
        (target.info.kind, target.info.point.artist_index, target.info.series),
        (Barbs, 4, "flag"),
      )
      assert_eq(target.info.vector, Some(@drawing.vector_info(55.0, 0.0)))
    }
  }
}

///|
test "Barbs source path mutation and overriding prepared Line context conservatively suppress fake endpoint fallback" {
  for mode in 0..<3 {
    let points = [@core.point(1.0, 1.0), @core.point(3.0, 2.0)]
    let call = @render.barb_hit_data(
      [@core.point(1.0, 1.0)],
      [@core.point(2.0, 1.0)],
      "wind",
    ).unwrap()
    let source = call.view(0, Stroke, points).unwrap()
    if mode == 1 {
      points[0] = @core.point(1.0, 2.0)
    }
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
      hit_metadata=[@render.hit_metadata("external", barb=Some(source))],
      line_provider=if mode == 2 {
        Some(current => {
          Some(@render.line_drawing_context(current, style, () => ()))
        })
      } else {
        None
      },
    )
    let fig = @render.figure(400, 200, 0, [panel], [], None)
    let (frame, _) = render_drawing_with_positions_checked(fig)
    assert_eq(frame.svg(), render_with_positions_checked(fig).0)
    assert_eq(frame.targets().length(), if mode == 0 { 1 } else { 0 })
    assert_eq(frame.points().length(), if mode == 0 { 1 } else { 0 })
  }
}

///|
test "Barbs calm full disk follows actual circle fill and radius independently of zero width" {
  let scale : Scale = {
    xmin: 0.0,
    xmax: 5.0,
    ymin: 0.0,
    ymax: 5.0,
    x_axis_scale: @ticker_scale.Linear,
    y_axis_scale: @ticker_scale.Linear,
  }
  let points = [@core.point(2.0, 1.0)]
  let call = @render.barb_hit_data(
    [@core.point(1.0, 1.0)],
    [@core.point(1.0, 0.0)],
    "calm",
  ).unwrap()
  let source = call.view(0, Calm, points).unwrap()
  for
    (fill, radius, count) in [
      ("red", 3.0, 1),
      ("none", 3.0, 0),
      ("red", 0.0, 0),
    ] {
    let style = @core.style(
      "none",
      fill~,
      radius~,
      width=0.0,
      line_alpha=Some(0.0),
    )
    let writer = @xml.Writer::new()
    writer.start_element("svg", [])
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
      on_circle=barb_calm_capture(
        Some(hits),
        barb_calm_for_paint(Some(source), points, style),
        0,
        3,
        (0.0, 0.0, 400.0, 200.0),
        radius,
      ),
    )
    writer.end_element("svg")
    assert_eq(hits.targets.length(), count)
    if count == 1 {
      assert_eq(hits.targets[0].shape, Sector(160.0, 160.0, 3.0, 0.0, 360.0))
    }
  }
}
