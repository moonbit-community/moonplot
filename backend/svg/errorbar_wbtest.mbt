///|
fn errorbar_capture_svg(captured : Array[RenderedErrorBar]?) -> String raise {
  let scale : Scale = {
    xmin: 0.0,
    xmax: 4.0,
    ymin: 0.0,
    ymax: 10.0,
    x_axis_scale: @ticker_scale.Linear,
    y_axis_scale: @ticker_scale.Linear,
  }
  let writer = @xml.Writer::new()
  try! writer.start_element("svg", [])
  append_errorbar(
    writer,
    scale,
    0.0,
    0.0,
    400.0,
    200.0,
    [@core.point(1.0, 4.0), @core.point(2.0, 0.0 / 0.0), @core.point(3.0, 8.0)],
    [2.0, 1.0, 1.0],
    [0.5, 1.0, 0.25],
    @core.style("red"),
    on_sample=captured.map(output => sample => output.push(sample)),
  )
  try! writer.end_element("svg")
  writer.to_string()
}

///|
test "errorbar hit capture is byte neutral and every captured segment comes from the same painted line" {
  let captured : Array[RenderedErrorBar] = []
  let static_svg = errorbar_capture_svg(None)
  let interactive = errorbar_capture_svg(Some(captured))
  assert_eq(static_svg, interactive)
  assert_eq(captured.map(sample => sample.source_index), [0, 2])
  assert_eq(captured[0].x_range, (0.5, 1.5))
  assert_eq(captured[0].y_range, (2.0, 6.0))
  let segments = []
  for sample in captured {
    for segment in sample.segments {
      segments.push(segment)
    }
  }
  let reader = @xml.Reader::from_string(interactive)
  let mut index = 0
  for event in reader.read_events_until_eof() {
    if event.kind is @xml.EventKind::Empty(element) && element.name == "line" {
      let (x0, y0, x1, y1) = segments[index]
      for (key, value) in [("x1", x0), ("y1", y0), ("x2", x1), ("y2", y1)] {
        assert_eq(@ticker.parse_float_text(element.get(key).unwrap()), value)
      }
      index += 1
    }
  }
  assert_eq(index, 12)
  assert_eq(captured[0].segments, [
    (100.0, 160.0, 100.0, 80.0),
    (96.0, 160.0, 104.0, 160.0),
    (96.0, 80.0, 104.0, 80.0),
    (50.0, 120.0, 150.0, 120.0),
    (50.0, 116.0, 50.0, 124.0),
    (150.0, 116.0, 150.0, 124.0),
  ])
}

///|
test "nonlinear error captures include only domain valid segments without inventing boundary caps" {
  let scale : Scale = {
    xmin: 4.0,
    xmax: 0.0,
    ymin: 100.0,
    ymax: 1.0,
    x_axis_scale: @ticker_scale.Linear,
    y_axis_scale: @ticker_scale.Log,
  }
  let captured : Array[RenderedErrorBar] = []
  let writer = @xml.Writer::new()
  try! writer.start_element("svg", [])
  append_errorbar(
    writer,
    scale,
    0.0,
    0.0,
    400.0,
    200.0,
    [@core.point(1.0, 10.0), @core.point(3.0, 2.0), @core.point(2.0, -1.0)],
    [5.0, 3.0, 1.0],
    [],
    @core.style("red"),
    on_sample=Some(sample => captured.push(sample)),
  )
  try! writer.end_element("svg")
  assert_eq(captured.map(sample => sample.source_index), [0, 1])
  assert_eq(captured.map(sample => sample.segments.length()), [3, 0])
  assert_eq(captured[1].y_range, (-1.0, 5.0))
  assert_true(!writer.to_string().contains("NaN"))
}
