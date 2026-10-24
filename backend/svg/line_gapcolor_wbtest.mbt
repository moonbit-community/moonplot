///|
fn line_gapcolor_backend_scale() -> Scale {
  {
    xmin: 0.0,
    xmax: 1.0,
    ymin: 0.0,
    ymax: 1.0,
    x_axis_scale: @ticker_scale.Scale::Linear,
    y_axis_scale: @ticker_scale.Scale::Linear,
  }
}

///|
fn line_gapcolor_backend_elements(svg : String) -> Array[String] {
  let values = []
  for index, element in svg.split("<polyline ").to_array() {
    if index > 0 && element.split_once("/>") is Some((attributes, _)) {
      values.push(attributes.to_owned())
    }
  }
  values
}

///|
test "foreground error retains gap XML prefix and earlier completed Line without completing the failed Line" {
  let points = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  let events : Array[String] = []
  let prior = @render.line_drawing_context(points, @core.style("green"), () => {
    events.push("prior-complete")
  })
  let first = @core.style(
    "blue",
    line_stroke=@core.line_stroke("--", offset=4.0, dashes=Some([4.0, 2.0])),
  )
  let failed = @render.line_drawing_context(
    points,
    first,
    () => events.push("failed-complete"),
    foreground=Some(() => {
      events.push("foreground")
      raise @core.DataError::InvalidTicks(
        message="ValueError: foreground color failed",
      )
    }),
  )
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  append_line_context(
    writer,
    line_gapcolor_backend_scale(),
    0.0,
    0.0,
    400.0,
    200.0,
    prior,
  )
  try
    append_line_context(
      writer,
      line_gapcolor_backend_scale(),
      0.0,
      0.0,
      400.0,
      200.0,
      failed,
    )
  catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "ValueError: foreground color failed")
    _ => fail("expected foreground resolution only after first stroke append")
  } noraise {
    _ => fail("expected foreground error")
  }
  writer.end_element("svg")
  let elements = line_gapcolor_backend_elements(writer.to_string())
  assert_eq(elements.length(), 2)
  assert_true(elements[0].contains("stroke=\"green\""))
  assert_true(elements[1].contains("stroke=\"blue\""))
  assert_true(elements[1].contains("stroke-dasharray=\"4,2\""))
  assert_true(elements[1].contains("stroke-dashoffset=\"4\""))
  assert_eq(events, ["prior-complete", "foreground"])
}

///|
test "first-stroke GC failure blocks foreground and all-nonfinite path still runs foreground stage" {
  let points = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  let events : Array[String] = []
  let bad = @core.style(
    "blue",
    line_stroke=@core.line_stroke("--", dashes=Some([-1.0, 2.0])),
  )
  let context = @render.line_drawing_context(
    points,
    bad,
    () => events.push("complete"),
    foreground=Some(() => {
      events.push("foreground")
      @core.style("red")
    }),
  )
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  try
    append_line_context(
      writer,
      line_gapcolor_backend_scale(),
      0.0,
      0.0,
      400.0,
      200.0,
      context,
    )
  catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(
        message, "ValueError: All values in the dash list must be non-negative",
      )
    _ => fail("expected first-stroke GC failure")
  } noraise {
    _ => fail("expected negative first-stroke dashes")
  }
  assert_eq(events, [])
  let nonfinite = [@core.point(0.0 / 0.0, 0.0), @core.point(1.0, 1.0 / 0.0)]
  let both = @render.line_drawing_context(
    nonfinite,
    @core.style("blue"),
    () => events.push("complete"),
    foreground=Some(() => {
      events.push("foreground")
      @core.style("red")
    }),
  )
  append_line_context(
    writer,
    line_gapcolor_backend_scale(),
    0.0,
    0.0,
    400.0,
    200.0,
    both,
  )
  writer.end_element("svg")
  assert_eq(line_gapcolor_backend_elements(writer.to_string()), [])
  assert_eq(events, ["foreground", "complete"])
}

///|
test "ownerless static gap metadata does not silently add another stroke or affect Errorbar" {
  let points = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  let style = @core.style(
    "red",
    line_gapcolor=Some("blue"),
    line_stroke=@core.line_stroke("--", dashes=Some([1.0, 2.0])),
  )
  let figure = line2d_ir_fixture([
    @render.Artist::Line(points, style),
    @render.Artist::ErrorBar(points, [], [], style),
  ])
  let elements = line_gapcolor_backend_elements(
    render_with_positions_checked(figure).0,
  )
  assert_eq(elements.length(), 2)
  for element in elements {
    assert_true(element.contains("stroke=\"red\""))
  }
  assert_true(elements[0].contains("stroke-dasharray=\"1,2\""))
  assert_true(!elements[1].contains("stroke-dash"))
}
