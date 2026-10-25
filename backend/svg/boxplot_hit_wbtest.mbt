///|
test "boxplot capture reuses every emitted rectangle line and outlier circle exactly" {
  let stats = [
    @boxplot.box_stats([1.0, 2.0, 3.0, 4.0, 5.0, 20.0]),
    @boxplot.box_stats([2.0, 2.0, 2.0]),
  ]
  for horizontal in [false, true] {
    let scale : Scale = {
      xmin: if horizontal {
        0.0
      } else {
        0.0
      },
      xmax: if horizontal {
        25.0
      } else {
        3.0
      },
      ymin: 0.0,
      ymax: if horizontal {
        3.0
      } else {
        25.0
      },
      x_axis_scale: @ticker_scale.Linear,
      y_axis_scale: @ticker_scale.Linear,
    }
    let samples : Array[RenderedBoxPlot] = []
    let writer = @xml.Writer::new()
    writer.start_element("svg", [])
    append_boxplot(
      writer,
      scale,
      0.0,
      0.0,
      400.0,
      200.0,
      stats,
      horizontal,
      @core.style("red"),
      on_box=Some(sample => samples.push(sample)),
    )
    writer.end_element("svg")
    assert_eq(samples.map(s => s.source_index), [0, 1])
    assert_eq(samples.map(s => s.segments.length()), [5, 5])
    assert_eq(samples[0].fliers.length(), 1)
    assert_eq(samples[0].fliers[0].0, 20.0)
    assert_eq(samples[1].fliers.length(), 0)
    let segments : Array[(Double, Double, Double, Double)] = []
    for sample in samples {
      for segment in sample.segments {
        segments.push(segment)
      }
    }
    let reader = @xml.Reader::from_string(writer.to_string())
    let mut rect_index = 0
    let mut line_index = 0
    let mut circle_index = 0
    for event in reader.read_events_until_eof() {
      if event.kind is @xml.EventKind::Empty(element) {
        let fields = if element.name == "rect" {
          let (x, y, w, h) = samples[rect_index].rectangle
          rect_index += 1
          [("x", x), ("y", y), ("width", w), ("height", h)]
        } else if element.name == "line" {
          let (x0, y0, x1, y1) = segments[line_index]
          line_index += 1
          [("x1", x0), ("y1", y0), ("x2", x1), ("y2", y1)]
        } else if element.name == "circle" {
          let (_, x, y) = samples[0].fliers[circle_index]
          circle_index += 1
          [("cx", x), ("cy", y)]
        } else {
          []
        }
        for (name, value) in fields {
          assert_true(
            (@ticker.parse_float_text(element.get(name).unwrap()) - value).abs() <
            1.0e-10,
          )
        }
      }
    }
    assert_eq((rect_index, line_index, circle_index), (2, 10, 1))
  }
}
