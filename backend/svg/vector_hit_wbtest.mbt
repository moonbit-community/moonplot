///|
test "quiver capture follows actual stroke attributes and after-write shaft wing order" {
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
    @core.point(2.0, 2.0),
    @core.point(3.0, 4.0),
  ]
  let vectors = [
    @core.point(2.0, 1.0),
    @core.point(0.0, 0.0),
    @core.point(-1.0, -2.0),
  ]
  let source = @render.vector_hit_data(points, vectors).unwrap()
  for
    (style, visible) in [
      (
        @core.style(
          "red",
          line_alpha=Some(0.0),
          line_stroke=@core.line_stroke("None"),
          fill="none",
          line_gapcolor=Some("transparent"),
        ),
        true,
      ),
      (
        @core.style(
          "red",
          line_stroke=@core.line_stroke("--", dashes=Some([2.0, 3.0])),
        ),
        true,
      ),
      (@core.style("red", width=0.0, fill="blue"), false),
      (@core.style("none", fill="blue"), false),
      (@core.style("transparent"), false),
      (@core.style("#1230"), false),
      (@core.style("rgba(0,0,0,0)"), false),
    ] {
    let writer = @xml.Writer::new()
    writer.start_element("svg", [])
    let hits : DrawingCapture = {
      points: [],
      targets: [],
      exclusions: [],
      polar_circles: [],
    }
    append_quiver(
      writer,
      scale,
      0.0,
      0.0,
      400.0,
      200.0,
      points,
      vectors,
      style,
      on_arrow=vector_capture(
        Some(hits),
        vector_for_paint(Some(source), points, vectors, style),
        2,
        7,
        (0.0, 0.0, 400.0, 200.0),
        "vectors",
      ),
    )
    writer.end_element("svg")
    let plain = @xml.Writer::new()
    plain.start_element("svg", [])
    append_quiver(plain, scale, 0.0, 0.0, 400.0, 200.0, points, vectors, style)
    plain.end_element("svg")
    assert_eq(writer.to_string(), plain.to_string())
    assert_true(!writer.to_string().contains("opacity="))
    assert_true(!writer.to_string().contains("stroke-dasharray="))
    if visible {
      assert_eq(hits.targets.map(t => t.info.point.point_index), [
        0, 0, 0, 2, 2, 2,
      ])
      assert_eq(hits.targets[0].shape, Segment(80.0, 160.0, 240.0, 120.0))
      for index, target in hits.targets {
        assert_eq(
          (
            target.info.point.panel_index,
            target.info.point.artist_index,
            target.info.series,
          ),
          (2, 7, "vectors"),
        )
        guard target.shape is Segment(x0, y0, x1, y1) else {
          fail("Actual arrow part must be a segment")
        }
        assert_true(
          writer
          .to_string()
          .contains(
            "x1=\"\{float_text(x0)}\" y1=\"\{float_text(y0)}\" x2=\"\{float_text(x1)}\" y2=\"\{float_text(y1)}\"",
          ),
        )
        if index % 3 != 0 {
          let shaft = hits.targets[index - index % 3]
          guard shaft.shape is Segment(_, _, tip_x, tip_y) else {
            fail("Expected preceding shaft")
          }
          assert_eq((x0, y0), (tip_x, tip_y))
        }
      }
    } else {
      assert_eq((hits.targets.length(), hits.points.length()), (0, 0))
    }
  }
}

///|
test "quiver never invokes Line drawing provider and its actual arrays remain authoritative" {
  for prefix_line in [false, true] {
    for mutate_vectors in [false, true] {
      let points = [@core.point(1.0, 1.0)]
      let vectors = [@core.point(2.0, 1.0)]
      let source = @render.vector_hit_data(points, vectors).unwrap()
      let style = @core.style("red")
      let calls = [0]
      let x = @axis.axis()
      let y = @axis.axis(horizontal=false)
      x.set_limits(0.0, 5.0)
      y.set_limits(0.0, 5.0)
      let artists = []
      let metadata = []
      if prefix_line {
        artists.push(
          @render.Artist::Line(
            [@core.point(0.0, 0.0), @core.point(1.0, 0.0)],
            style,
          ),
        )
        metadata.push(@render.hit_metadata("line"))
      }
      artists.push(@render.Artist::Quiver(points, vectors, style))
      metadata.push(@render.hit_metadata("vector", vector=Some(source)))
      let panel = @render.panel_with_sharing(
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
        hit_metadata=metadata,
        line_provider=Some(current => {
          calls[0] += 1
          if mutate_vectors {
            vectors[0] = @core.point(1.0, 1.0)
          } else {
            points[0] = @core.point(2.0, 1.0)
          }
          Some(@render.line_drawing_context(current, style, () => ()))
        }),
      )
      let fig = @render.figure(400, 200, 0, [panel], [], None)
      let (frame, _) = render_drawing_with_positions_checked(fig)
      assert_eq(calls[0], if prefix_line { 1 } else { 0 })
      assert_eq(
        frame.targets().filter(t => t.info.kind == Quiver).length(),
        if prefix_line {
          0
        } else {
          3
        },
      )
      assert_eq(frame.svg(), render_with_positions_checked(fig).0)
      assert_eq(calls[0], if prefix_line { 2 } else { 0 })
    }
  }
}
