///|
fn streamplot_guard_frame(
  artist : @render.Artist,
  metadata : @render.HitMetadata,
  provider~ : ((Array[@core.Point]) -> @render.LineDrawingContext? raise @core.DataError)? = None,
) -> @drawing.Drawing raise {
  let x = @axis.axis()
  let y = @axis.axis(horizontal=false)
  for axis in [x, y] {
    axis.set_limits(0.0, 1.0)
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
    hit_metadata=[metadata],
    line_provider=provider,
  )
  let fig = @render.figure(400, 300, 0, [panel], [], None)
  let frame = render_drawing_with_positions_checked(fig).0
  assert_eq(frame.svg(), render(fig))
  frame
}

///|
test "streamplot unknown prepared providers cross kinds and invalid sources stay static without changing normal controls" {
  let points = [
    @core.point(0.2, 0.2),
    @core.point(0.8, 0.2),
    @core.point(0.2, 0.8),
  ]
  let style = @core.style("purple", fill="purple")
  let source = @render.streamplot_hit_data(points, [
    Some(
      @render.streamplot_datum(
        0,
        @core.point(0.5, 0.2),
        @drawing.streamplot_info(7, 1.0, 2.0),
      ),
    ),
    Some(
      @render.streamplot_datum(
        1,
        @core.point(0.5, 0.5),
        @drawing.streamplot_info(7, 1.0, 2.0),
      ),
    ),
  ])
  let view = @render.streamplot_body_hit(source, points, 0, "Generated")
  let metadata = @render.hit_metadata("Generated", streamplot=Some(view))
  let completed = [0]
  for prepared in 0..<3 {
    let frame = streamplot_guard_frame(
      @render.Artist::Line(points, style),
      metadata,
      provider=if prepared == 0 {
        None
      } else {
        Some(_ => {
          Some(
            @render.line_drawing_context(
              points,
              style,
              () => completed[0] += 1,
              discrete=if prepared == 2 {
                @render.discrete_line_hit_data(
                  Step,
                  points,
                  [@render.discrete_datum(0, points[0], 99.0)],
                  [0, 0],
                )
              } else {
                None
              },
            ),
          )
        })
      },
    )
    assert_eq(frame.targets().length(), if prepared == 0 { 2 } else { 0 })
  }
  assert_eq(completed[0], 4)
  for
    artist in [
      @render.Artist::Scatter(points, style),
      @render.Artist::Bar(points, style),
      @render.Artist::Polygon(points, style),
      @render.Artist::CompoundPolygon([points], style),
      @render.Artist::Line(points.copy(), style),
    ] {
    assert_eq(streamplot_guard_frame(artist, metadata).targets().length(), 0)
  }
  for
    invalid in [
      view.invalidated(),
      @render.streamplot_static_hit(points, "Arrow"),
    ] {
    for
      artist in [
        @render.Artist::Line(points, style),
        @render.Artist::Polygon(points, style),
      ] {
      assert_eq(
        streamplot_guard_frame(
          artist,
          @render.hit_metadata("Static", streamplot=Some(invalid)),
        )
        .targets()
        .length(),
        0,
      )
    }
  }
  for
    artist in [
      @render.Artist::Line(points, style),
      @render.Artist::Scatter(points, style),
    ] {
    let plain = streamplot_guard_frame(artist, @render.hit_metadata("Ordinary"))
    assert_eq(plain.targets().length(), 3)
    assert_true(plain.targets().all(t => t.info.streamplot is None))
  }
  let conflict = @render.hit_metadata(
    "Conflicting",
    streamplot=Some(view),
    discrete=@render.discrete_line_hit_data(
      Step,
      points,
      [@render.discrete_datum(0, points[0], 99.0)],
      [0, 0],
    ),
  )
  assert_eq(
    streamplot_guard_frame(@render.Artist::Line(points, style), conflict)
    .targets()
    .length(),
    0,
  )
}

///|
test "streamplot actual valid run callback keeps original edge gaps and only captures visible solid strokes" {
  let nan = 0.0 / 0.0
  let points = [
    @core.point(0.1, 0.2),
    @core.point(0.4, 0.2),
    @core.point(nan, 0.5),
    @core.point(0.6, 0.8),
    @core.point(0.9, 0.8),
  ]
  let source = @render.streamplot_hit_data(points, [
    Some(
      @render.streamplot_datum(
        0,
        @core.point(0.25, 0.2),
        @drawing.streamplot_info(9, 1.0, 0.0),
      ),
    ),
    None,
    None,
    Some(
      @render.streamplot_datum(
        3,
        @core.point(0.75, 0.8),
        @drawing.streamplot_info(9, 2.0, 0.0),
      ),
    ),
  ])
  let view = @render.streamplot_body_hit(source, points, 0, "Runs")
  let metadata = @render.hit_metadata("Runs", streamplot=Some(view))
  let frame = streamplot_guard_frame(
    @render.Artist::Line(points, @core.style("purple")),
    metadata,
  )
  assert_eq(frame.targets().map(t => t.info.point.point_index), [0, 3])
  assert_true(frame.targets().all(t => t.info.kind == Streamplot))
  for
    style in [
      @core.style("none"),
      @core.style("transparent"),
      @core.style("purple", width=0.0),
      @core.style("purple", line_alpha=Some(0.0)),
      @core.style("purple", line_stroke=@core.line_stroke("--")),
    ] {
    assert_eq(
      streamplot_guard_frame(@render.Artist::Line(points, style), metadata)
      .targets()
      .length(),
      0,
    )
  }
  let split = [points[3], points[4]]
  let split_frame = streamplot_guard_frame(
    @render.Artist::Line(split, @core.style("purple")),
    @render.hit_metadata(
      "Split",
      streamplot=Some(@render.streamplot_body_hit(source, split, 3, "Split")),
    ),
  )
  assert_eq(split_frame.targets().map(t => t.info.point.point_index), [3])
}
