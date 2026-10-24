///|
fn drawing_ir_fixture(
  artists : Array[@render.Artist],
  line_provider~ : ((Array[@core.Point]) -> @render.LineDrawingContext? raise @core.DataError)? = None,
) -> @render.Figure raise @core.DataError {
  let x = @axis.axis()
  let y = @axis.axis(horizontal=false)
  x.set_limits(0.0, 1.0)
  y.set_limits(0.0, 1.0)
  @render.figure(
    200,
    100,
    10,
    [
      @render.panel(
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
        line_provider~,
      ),
    ],
    [],
    None,
  )
}

///|
test "Drawing preserves exact SVG and original filtered point identities" {
  let points = [
    @core.point(0.0, 0.0),
    @core.point(0.0 / 0.0, 0.2),
    @core.point(0.5, 0.5),
    @core.point(2.0, 0.7),
    @core.point(1.0, 1.0),
  ]
  let figure = drawing_ir_fixture([
    @render.Artist::Line(points, @core.style("red")),
    @render.Artist::Scatter(points, @core.style("blue")),
    @render.Artist::PathCollection(points, [
      @core.style("green"),
      @core.style("green"),
    ]),
  ])
  let (drawing, positions) = render_drawing_with_positions_checked(figure)
  assert_eq(drawing.svg(), render_with_positions_checked(figure).0)
  assert_eq((drawing.width(), drawing.height()), (200, 100))
  assert_eq(positions, [(10.0, 10.0, 180.0, 80.0)])
  let hits = drawing.points()
  assert_eq(hits.map(p => (p.panel_index, p.artist_index, p.point_index)), [
    (0, 0, 0),
    (0, 0, 2),
    (0, 0, 4),
    (0, 1, 0),
    (0, 1, 2),
    (0, 1, 4),
    (0, 2, 0),
  ])
  assert_eq((hits[1].data_x, hits[1].data_y), (0.5, 0.5))
  assert_eq((hits[1].screen_x, hits[1].screen_y), (100.0, 50.0))
  assert_eq((hits[2].screen_x, hits[2].screen_y), (190.0, 10.0))
}

///|
test "Drawing prepares and completes a double stroke Line exactly once" {
  let calls = [0, 0, 0]
  let points = [@core.point(0.25, 0.25), @core.point(0.75, 0.75)]
  let figure = drawing_ir_fixture(
    [@render.Artist::Line(points, @core.style("red"))],
    line_provider=Some(_ => {
      calls[0] += 1
      Some(
        @render.line_drawing_context(
          points,
          @core.style("red"),
          () => calls[2] += 1,
          foreground=Some(() => {
            calls[1] += 1
            @core.style("blue")
          }),
          hit_points=Some(points),
        ),
      )
    }),
  )
  let (drawing, _) = render_drawing_with_positions_checked(figure)
  assert_eq(calls, [1, 1, 1])
  assert_eq(drawing.points().length(), 2)
  assert_eq(drawing.svg().split("<polyline").count() - 1, 2)
}

///|
test "Drawing excludes scale-domain and viewport outsiders without renumbering" {
  let x = @axis.axis()
  x.set_scale(@ticker_scale.Log)
  x.set_limits(0.1, 10.0)
  let y = @axis.axis(horizontal=false)
  y.set_limits(0.0, 1.0)
  let figure = @render.figure(
    200,
    100,
    10,
    [
      @render.panel(
        None,
        [
          @render.Artist::Scatter(
            [
              @core.point(-1.0, 0.5),
              @core.point(0.1, 0.5),
              @core.point(1.0, 0.5),
              @core.point(100.0, 0.5),
            ],
            @core.style("blue"),
          ),
        ],
        None,
        [],
        None,
        x,
        y,
        false,
        [],
        [],
      ),
    ],
    [],
    None,
  )
  let (drawing, _) = render_drawing_with_positions_checked(figure)
  assert_eq(drawing.points().map(p => p.point_index), [1, 2])
}
