///|
fn contour_backend_frame(
  points : Array[@core.Point],
  source : @render.ContourHitView,
  style : @core.Style,
  provider~ : ((Array[@core.Point]) -> @render.LineDrawingContext? raise @core.DataError)? = None,
  log~ : Bool = false,
) -> @drawing.Drawing raise {
  let x = @axis.axis()
  let y = @axis.axis(horizontal=false)
  if log {
    x.set_scale(@ticker_scale.Log)
  }
  x.set_limits(if log { 0.1 } else { 0.0 }, 5.0)
  y.set_limits(0.0, 5.0)
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
    hit_metadata=[@render.hit_metadata("foreign", contour=Some(source))],
    line_provider=provider,
  )
  let fig = @render.figure(400, 200, 0, [panel], [], None)
  let (frame, _) = render_drawing_with_positions_checked(fig)
  assert_eq(frame.svg(), render_with_positions_checked(fig).0)
  frame
}

///|
test "contour captures only actual emitted valid-run edges without NaN or logarithmic bridges and no lone point" {
  let points = [
    @core.point(1.0, 1.0),
    @core.point(3.0, 2.0),
    @core.point(0.0 / 0.0, 2.0),
    @core.point(-1.0, 1.0),
    @core.point(1.0, 2.0),
    @core.point(2.0, 3.0),
    @core.point(1.0 / 0.0, 3.0),
    @core.point(4.0, 4.0),
  ]
  let source = @render.contour_hit_view(points, 7, 42.0, "Runs")
  let frame = contour_backend_frame(
    points,
    source,
    @core.style("red"),
    log=true,
  )
  assert_eq(frame.targets().length(), 2)
  assert_eq(
    frame.targets().map(t => (t.info.point.data_x, t.info.point.data_y)),
    [(2.0, 1.5), (1.5, 2.5)],
  )
  assert_true(
    frame
    .targets()
    .all(t => {
      t.info.kind == Contour &&
      t.info.point.point_index == 7 &&
      t.info.value == 42.0 &&
      t.info.series == "Runs"
    }),
  )
}

///|
test "contour path and disabled provenance or unproven prepared context do not activate generic or discrete fallback" {
  for mode in 0..<4 {
    let points = [@core.point(1.0, 1.0), @core.point(3.0, 2.0)]
    let source = @render.contour_hit_view(points, 3, 0.25, "Source")
    let source = if mode == 1 { source.invalidated() } else { source }
    if mode == 0 {
      points[0] = @core.point(1.0, 2.0)
    }
    let style = @core.style("red")
    let frame = contour_backend_frame(
      points,
      source,
      style,
      provider=if mode >= 2 {
        Some(current => {
          Some(
            @render.line_drawing_context(
              current,
              style,
              () => (),
              discrete=if mode == 3 {
                @render.discrete_line_hit_data(
                  Step,
                  points,
                  [@render.discrete_datum(0, points[0], 99.0)],
                  [0],
                )
              } else {
                None
              },
            ),
          )
        })
      } else {
        None
      },
    )
    assert_eq(frame.targets().length(), 0)
    assert_eq(frame.points().length(), 0)
    assert_true(frame.svg().contains("<polyline"))
  }
}

///|
test "contour actual line visibility gates width paint opacity and unsupported dashed strokes without endpoint ghosts" {
  let points = [@core.point(1.0, 1.0), @core.point(3.0, 2.0)]
  let source = @render.contour_hit_view(points, 0, 2.0, "Paint")
  for
    (style, count) in [
      (@core.style("red"), 1),
      (@core.style("red", width=0.0), 0),
      (@core.style("none"), 0),
      (@core.style("transparent"), 0),
      (@core.style("rgba(0,0,0,0)"), 0),
      (@core.style("red", line_alpha=Some(0.0)), 0),
      (@core.style("red", line_stroke=@core.line_stroke("None")), 0),
      (@core.style("red", line_stroke=@core.line_stroke("--")), 0),
    ] {
    let frame = contour_backend_frame(points, source, style)
    assert_eq(frame.targets().length(), count)
  }
}
