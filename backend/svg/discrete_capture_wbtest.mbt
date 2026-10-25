///|
test "line same-write callback retains complete path starts after consecutive invalid slots" {
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  let scale : Scale = {
    xmin: 0.0,
    xmax: 5.0,
    ymin: 0.0,
    ymax: 5.0,
    x_axis_scale: @ticker_scale.Linear,
    y_axis_scale: @ticker_scale.Linear,
  }
  let nan = 0.0 / 0.0
  let starts : Array[(Int32, Int32)] = []
  append_line(
    writer,
    scale,
    0.0,
    0.0,
    400.0,
    200.0,
    [
      @core.point(nan, 0.0),
      @core.point(0.0, 0.0),
      @core.point(1.0, 1.0),
      @core.point(nan, 0.0),
      @core.point(nan, 0.0),
      @core.point(3.0, 3.0),
      @core.point(4.0, 4.0),
    ],
    @core.style("red"),
    on_segment=Some((run, start) => starts.push((start, run.length()))),
  )
  writer.end_element("svg")
  assert_eq(starts, [(1, 2), (5, 2)])
}
