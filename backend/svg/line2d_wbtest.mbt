///|
fn line2d_ir_fixture(
  artists : Array[@render.Artist],
  line_provider~ : ((Array[@core.Point]) -> (
    Array[@core.Point],
    @core.Style,
    () -> Unit,
  )? raise @core.DataError)? = None,
  primary~ : @ticker.BaseFormatter? = None,
) -> @render.Figure raise @core.DataError {
  let x = @axis.axis()
  let y = @axis.axis(horizontal=false)
  for axis in [x, y] {
    axis.set_limits(0.0, 1.0)
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
    axis.clear_autoscale_request()
  }
  if primary is Some(formatter) {
    x.set_locator(@ticker.FixedLocator::new([0.5]).as_locator())
    x.set_named_formatter(formatter)
  }
  // Preserve these older single-stroke fixture inputs while the production
  // panel has one authoritative context provider for both paint stages.
  let drawing_provider : ((Array[@core.Point]) -> @render.LineDrawingContext? raise @core.DataError)? = line_provider.map(provider => {
      points => {
        match provider(points) {
          Some((current, style, complete)) =>
            Some(@render.line_drawing_context(current, style, complete))
          None => None
        }
      }
    },
  )
  @render.figure(
    400,
    200,
    0,
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
        line_provider=drawing_provider,
      ),
    ],
    [],
    None,
  )
}

///|
test "Line provider is queried after primary batches and completed after appending current geometry" {
  let original = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  let current = [@core.point(0.0, 1.0), @core.point(1.0, 0.0)]
  let events : Array[String] = []
  let matched = [false]
  let figure = line2d_ir_fixture(
    [@render.Artist::Line(original, @core.style("#12ab34"))],
    line_provider=Some(points => {
      events.push("prepare")
      matched[0] = physical_equal(points, original)
      Some((current, @core.style("#12ab34"), () => events.push("complete")))
    }),
    primary=Some(
      @ticker.FuncFormatter::new((_, _) => {
        events.push("primary")
        "primary"
      }).as_base_formatter(),
    ),
  )
  ignore(compute_scales(figure))
  assert_eq(events.length(), 0)
  let (svg, _) = render_with_positions_checked(figure)
  assert_true(matched[0])
  assert_eq(events, ["primary", "prepare", "complete"])
  assert_true(svg.contains("points=\"0,0 400,200\""))
  assert_true(svg.contains("stroke=\"#12ab34\""))
  assert_true(!figure.panels()[0].x_axis().autoscale_stale())
  assert_true(!figure.panels()[0].y_axis().autoscale_stale())
}

///|
test "failed lazy Line leaves its completion pending while prior Line completion remains committed" {
  let first = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  let second = [@core.point(0.0, 1.0), @core.point(1.0, 0.0)]
  let should_fail = [true]
  let first_completions = [0]
  let second_stale = [true]
  let figure = line2d_ir_fixture(
    [
      @render.Artist::Line(first, @core.style("#123abc")),
      @render.Artist::Line(second, @core.style("#456def")),
    ],
    line_provider=Some(points => {
      if physical_equal(points, first) {
        return Some(
          (first, @core.style("#123abc"), () => first_completions[0] += 1),
        )
      }
      if should_fail[0] {
        raise @core.DataError::InvalidTicks(message="late Line recache")
      }
      Some((second, @core.style("#456def"), () => second_stale[0] = false))
    }),
  )
  try render_with_positions_checked(figure) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "late Line recache")
    _ => fail("expected lazy Line recache failure")
  } noraise {
    _ => fail("expected lazy Line recache failure")
  }
  assert_eq(first_completions[0], 1)
  assert_true(second_stale[0])
  should_fail[0] = false
  ignore(render_with_positions_checked(figure))
  assert_eq(first_completions[0], 2)
  assert_true(!second_stale[0])
}

///|
test "static ownerless Lines retain fallback geometry and Scatter never queries the Line provider" {
  let points = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  let static_figure = line2d_ir_fixture([
    @render.Artist::Line(points, @core.style("#aabbcc")),
  ])
  assert_true(static_figure.panels()[0].prepare_line(points) is None)
  let static_svg = render_with_positions_checked(static_figure).0
  assert_true(static_svg.contains("points=\"0,200 400,0\""))
  let calls = [0]
  let with_fallback = line2d_ir_fixture(
    [
      @render.Artist::Line(points, @core.style("#aabbcc")),
      @render.Artist::Scatter(points, @core.style("#445566")),
    ],
    line_provider=Some(_ => {
      calls[0] += 1
      None
    }),
  )
  let svg = render_with_positions_checked(with_fallback).0
  assert_eq(calls[0], 1)
  assert_true(svg.contains("points=\"0,200 400,0\""))
  assert_true(svg.contains("#445566"))
}

///|
test "empty and fully nonfinite Lines still invoke completion after a normal draw" {
  let empty : Array[@core.Point] = []
  let invalid = [@core.point(0.0 / 0.0, 0.0), @core.point(1.0, 1.0 / 0.0)]
  let prepared = [0]
  let completed = [0]
  let figure = line2d_ir_fixture(
    [
      @render.Artist::Line(empty, @core.style("#001122")),
      @render.Artist::Line(invalid, @core.style("#334455")),
    ],
    line_provider=Some(points => {
      prepared[0] += 1
      Some(
        (
          points,
          @core.style(
            if physical_equal(points, empty) {
              "#001122"
            } else {
              "#334455"
            },
          ),
          () => completed[0] += 1,
        ),
      )
    }),
  )
  let (svg, _) = render_with_positions_checked(figure)
  assert_eq(prepared[0], 2)
  assert_eq(completed[0], 2)
  assert_true(!svg.contains("<polyline"))
}
