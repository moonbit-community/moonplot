///|
fn polar_capture_figure(
  artist : @render.Artist,
  data : @render.PolarHitData?,
) -> @render.Figure {
  let config = @render.polar_projection(
    Some(1.0),
    0.0,
    false,
    [],
    [],
    None,
    [],
    [false],
    hit_data=match data {
      Some(data) => [data]
      None => []
    },
  )
  @render.figure(
    400,
    240,
    0,
    [
      @render.panel(
        None,
        [artist],
        None,
        [],
        None,
        @axis.axis(),
        @axis.axis(horizontal=false),
        false,
        [],
        [],
        polar=Some(config),
      ),
    ],
    [],
    None,
  )
}

///|
test "polar IR requires matching original source identity and kind and actual emitted visible paint" {
  let points = [@core.point(0.0, 0.5), @core.point(1.0, 0.75)]
  let line = @render.polar_hit_data(points, "Line")
  let marker = @render.polar_hit_data(points, "Marker", scatter=true)
  let cases : Array[(@render.Artist, @render.PolarHitData?, Int32)] = [
    (@render.Artist::Line(points, @core.style("red")), Some(line), 2),
    (@render.Artist::Line(points.copy(), @core.style("red")), Some(line), 0),
    (@render.Artist::Scatter(points, @core.style("red")), Some(line), 0),
    (@render.Artist::Line(points, @core.style("red")), None, 0),
    (
      @render.Artist::Line(points, @core.style("red", line_alpha=Some(0.0))),
      Some(line),
      0,
    ),
    (@render.Artist::Line(points, @core.style("red", width=0.0)), Some(line), 0),
    (
      @render.Artist::Scatter(
        points,
        @core.style("none", width=0.0, radius=4.0, fill="orange"),
      ),
      Some(marker),
      2,
    ),
    (
      @render.Artist::Scatter(
        points,
        @core.style("red", radius=4.0, line_alpha=Some(0.0)),
      ),
      Some(marker),
      2,
    ),
  ]
  for (artist, source, count) in cases {
    let f = polar_capture_figure(artist, source)
    let frame = render_drawing_with_positions_checked(f).0
    assert_eq(frame.svg(), render(f))
    assert_eq(frame.targets().length(), count)
    assert_true(frame.targets().all(t => t.info.kind == Polar))
  }
}
