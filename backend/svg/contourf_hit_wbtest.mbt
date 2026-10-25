///|
fn contourf_backend_frame(
  rings : Array[Array[@core.Point]],
  compound~ : Bool = false,
  style~ : @core.Style = @core.style("red", width=0.0, fill="red"),
  source~ : @render.ContourFHitData? = None,
  log~ : Bool = false,
) -> @drawing.Drawing raise {
  let x = @axis.axis()
  let y = @axis.axis(horizontal=false)
  if log {
    x.set_scale(@ticker_scale.Log)
  }
  x.set_limits(if log { 0.1 } else { 0.0 }, 1.0)
  y.set_limits(0.0, 1.0)
  let artist = if compound {
    @render.Artist::CompoundPolygon(rings, style)
  } else {
    @render.Artist::Polygon(rings[0], style)
  }
  let actual_source = source.unwrap_or(
    @render.contourf_hit_data(rings, 7, 0.25, 1.75, "Source"),
  )
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
    hit_metadata=[@render.hit_metadata("foreign", contourf=Some(actual_source))],
  )
  let fig = @render.figure(400, 200, 0, [panel], [], None)
  let (frame, _) = render_drawing_with_positions_checked(fig)
  assert_eq(frame.svg(), render_with_positions_checked(fig).0)
  frame
}

///|
test "contourf whole viewport anchor uses one actual region containment while hole viewport stays empty" {
  let outer = [
    @core.point(-1.0, -1.0),
    @core.point(2.0, -1.0),
    @core.point(2.0, 2.0),
    @core.point(-1.0, 2.0),
  ]
  let frame = contourf_backend_frame([outer])
  assert_eq(frame.targets().length(), 1)
  assert_eq(
    (
      frame.targets()[0].info.point.screen_x,
      frame.targets()[0].info.point.screen_y,
    ),
    (200.0, 100.0),
  )
  assert_eq(
    (frame.targets()[0].info.point.data_x, frame.targets()[0].info.point.data_y),
    (0.5, -1.0),
  )
  let hole = [
    @core.point(-0.5, -0.5),
    @core.point(1.5, -0.5),
    @core.point(1.5, 1.5),
    @core.point(-0.5, 1.5),
  ]
  assert_eq(
    contourf_backend_frame([outer, hole], compound=true).targets().length(),
    0,
  )
}

///|
test "contourf actual postwrite geometry reflects domain filtering and independent fill paint rather than Line alpha or stroke" {
  let ring = [
    @core.point(0.2, 0.2),
    @core.point(-1.0, 0.4),
    @core.point(0.8, 0.2),
    @core.point(0.8, 0.8),
    @core.point(0.2, 0.8),
  ]
  for compound in [false, true] {
    let frame = contourf_backend_frame([ring], compound~, log=true)
    assert_eq(frame.targets().length(), 1)
    guard frame.targets()[0].shape is FilledRegion(region) else {
      fail("Region")
    }
    assert_eq(region.rings()[0].length(), 4)
    assert_eq(region.even_odd(), compound)
  }
  let square = [
    @core.point(0.2, 0.2),
    @core.point(0.8, 0.2),
    @core.point(0.8, 0.8),
    @core.point(0.2, 0.8),
  ]
  for
    (style, count) in [
      (@core.style("red", width=0.0, fill="red", line_alpha=Some(0.0)), 1),
      (@core.style("red", width=3.0, fill="none"), 0),
      (@core.style("red", fill="transparent"), 0),
      (@core.style("red", fill="rgba(0,0,0,0)"), 0),
    ] {
    assert_eq(
      contourf_backend_frame([square], style~).targets().length(),
      count,
    )
  }
}

///|
test "contourf invalidated or changed low level source cannot revive through actual polygon or compound callbacks" {
  for compound in [false, true] {
    for replacement in [false, true] {
      let rings = [
        [
          @core.point(0.2, 0.2),
          @core.point(0.8, 0.2),
          @core.point(0.8, 0.8),
          @core.point(0.2, 0.8),
        ],
      ]
      let data = @render.contourf_hit_data(rings, 0, 0.0, 1.0, "Source")
      let data = if replacement {
        rings[0] = rings[0].copy()
        data
      } else {
        data.invalidated()
      }
      assert_eq(
        contourf_backend_frame(rings, compound~, source=Some(data))
        .targets()
        .length(),
        0,
      )
    }
  }
}

///|
test "contourf anchor ignores mapped zero edges even when original data endpoints differ" {
  let scale : Scale = {
    xmin: 0.0,
    xmax: 1.0e308,
    ymin: 0.0,
    ymax: 1.0,
    x_axis_scale: @ticker_scale.Linear,
    y_axis_scale: @ticker_scale.Linear,
  }
  let ring = [
    @core.point(1.0e-310, 0.0),
    @core.point(2.0e-310, 0.0),
    @core.point(1.0e308, 0.0),
    @core.point(1.0e308, 1.0),
    @core.point(1.0e-310, 1.0),
  ]
  let source = @render.contourf_hit_data([ring], 2, 0.0, 1.0, "Mapped")
  assert_true(source.matches_polygon(ring))
  let style = @core.style("red", width=0.0, fill="red")
  let hits : DrawingCapture = {
    points: [],
    targets: [],
    exclusions: [],
    polar_circles: [],
  }
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  append_polygon(
    writer,
    scale,
    0.0,
    0.0,
    400.0,
    200.0,
    ring,
    style,
    on_polygon=Some(actual => {
      collect_contourf_region(
        hits,
        Some(source),
        0,
        0,
        [actual],
        false,
        scale,
        (0.0, 0.0, 400.0, 200.0),
        style,
        400,
        200,
      )
    }),
  )
  writer.end_element("svg")
  assert_eq(hits.targets.length(), 1)
  let point = hits.targets[0].info.point
  assert_eq(
    (point.data_x, point.data_y, point.screen_x, point.screen_y),
    (5.0e307, 0.0, 200.0, 200.0),
  )
}

///|
test "contourf whole viewport fallback uses filled boundary rather than an earlier degenerate emitted ring" {
  let line = [
    @core.point(0.0, 0.5),
    @core.point(0.5, 0.5),
    @core.point(1.0, 0.5),
  ]
  let outer = [
    @core.point(-1.0, -1.0),
    @core.point(2.0, -1.0),
    @core.point(2.0, 2.0),
    @core.point(-1.0, 2.0),
  ]
  let frame = contourf_backend_frame([line, outer], compound=true)
  assert_eq(frame.targets().length(), 1)
  let p = frame.targets()[0].info.point
  assert_eq(
    (p.data_x, p.data_y, p.screen_x, p.screen_y),
    (0.5, -1.0, 200.0, 100.0),
  )
}
