///|
test "explicit bar segments share true widths baselines endpoints ranges and minpos" {
  let segments = [
    @core.bar_segment(2.0, 3.0, baseline=4.0, width=1.2),
    @core.bar_segment(4.0, -2.0, baseline=4.0, width=0.6),
  ]
  for horizontal in [false, true] {
    let artists = [
      @render.Artist::BarSegments(segments, horizontal, @core.style("red")),
    ]
    let categories = artist_data_interval(artists, !horizontal)
    let values = artist_data_interval(artists, horizontal)
    bar_geometry_assert_close(categories.lower(), 1.4)
    bar_geometry_assert_close(categories.upper(), 4.3)
    assert_eq((values.lower(), values.upper()), (2.0, 7.0))
    bar_geometry_assert_close(artist_minpos(artists, !horizontal), 1.4)
    assert_eq(artist_minpos(artists, horizontal), 2.0)
    assert_eq(artist_sticky_edges(artists, horizontal), [4.0, 4.0])
    assert_eq(artist_sticky_edges(artists, !horizontal), [])
  }
}

///|
test "explicit rectangles map original source indices and exact two endpoints" {
  let scale : Scale = {
    xmin: -1.0,
    xmax: 1.0,
    ymin: -4.0,
    ymax: 6.0,
    x_axis_scale: @ticker_scale.Linear,
    y_axis_scale: @ticker_scale.Linear,
  }
  let rectangles = bar_segment_rectangles(
    scale,
    0.0,
    0.0,
    400.0,
    200.0,
    [
      @core.bar_segment(0.0, 3.0, baseline=2.0, width=0.6),
      @core.bar_segment(0.0, 0.0 / 0.0),
      @core.bar_segment(0.0, -2.0, baseline=2.0, width=0.6),
    ],
    false,
  )
  assert_eq(rectangles.map(r => r.source_index), [0, 2])
  for
    (rectangle, expected_top, expected_height) in [
      (rectangles[0], 20.0, 60.0),
      (rectangles[1], 80.0, 40.0),
    ] {
    bar_geometry_assert_close(rectangle.left, 140.0)
    bar_geometry_assert_close(rectangle.width, 120.0)
    bar_geometry_assert_close(rectangle.top, expected_top)
    bar_geometry_assert_close(rectangle.height, expected_height)
  }
  assert_eq(rectangles[0].point.y(), 5.0)
  assert_eq(rectangles[0].segment.unwrap().value, 3.0)
  assert_eq(rectangles[1].point.y(), 0.0)
  assert_eq(rectangles[1].segment.unwrap().value, -2.0)
}

///|
test "explicit painter and hit callback share every SVG rectangle without minimum pixel widening" {
  let scale : Scale = {
    xmin: -1.0,
    xmax: 1.0,
    ymin: -4.0,
    ymax: 6.0,
    x_axis_scale: @ticker_scale.Linear,
    y_axis_scale: @ticker_scale.Linear,
  }
  let captured : Array[RenderedBar] = []
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  append_bar_segments(
    writer,
    scale,
    0.0,
    0.0,
    400.0,
    200.0,
    [
      @core.bar_segment(-0.5, 3.0, baseline=2.0, width=0.001),
      @core.bar_segment(0.5, -2.0, baseline=2.0, width=0.2),
    ],
    false,
    @core.style("red"),
    on_bar=Some(rectangle => captured.push(rectangle)),
  )
  writer.end_element("svg")
  let reader = @xml.Reader::from_string(writer.to_string())
  let mut index = 0
  for event in reader.read_events_until_eof() {
    if event.kind is @xml.EventKind::Empty(element) && element.name == "rect" {
      let expected = captured[index]
      for
        (name, value) in [
          ("x", expected.left),
          ("y", expected.top),
          ("width", expected.width),
          ("height", expected.height),
        ] {
        bar_geometry_assert_close(
          @ticker.parse_float_text(element.get(name).unwrap()),
          value,
        )
      }
      index += 1
    }
  }
  assert_eq(index, 2)
  bar_geometry_assert_close(captured[0].width, 0.2)
}

///|
test "explicit segment rectangles support either inversion and log domain clipping" {
  for horizontal in [false, true] {
    for inverted in [false, true] {
      let lo = if inverted { 100.0 } else { 1.0 }
      let hi = if inverted { 1.0 } else { 100.0 }
      let scale : Scale = {
        xmin: if horizontal {
          lo
        } else {
          -1.0
        },
        xmax: if horizontal {
          hi
        } else {
          1.0
        },
        ymin: if horizontal {
          -1.0
        } else {
          lo
        },
        ymax: if horizontal {
          1.0
        } else {
          hi
        },
        x_axis_scale: if horizontal {
          @ticker_scale.Log
        } else {
          @ticker_scale.Linear
        },
        y_axis_scale: if horizontal {
          @ticker_scale.Linear
        } else {
          @ticker_scale.Log
        },
      }
      let rectangles = bar_segment_rectangles(
        scale,
        0.0,
        0.0,
        400.0,
        200.0,
        [
          @core.bar_segment(0.0, 10.0, baseline=0.0, width=0.6),
          @core.bar_segment(0.0, -2.0, baseline=-1.0, width=0.6),
        ],
        horizontal,
      )
      assert_eq(rectangles.length(), 1)
      let rectangle = rectangles[0]
      assert_true(rectangle.left >= 0.0 && rectangle.top >= 0.0)
      assert_true(rectangle.left + rectangle.width <= 400.0 + 1.0e-10)
      assert_true(rectangle.top + rectangle.height <= 200.0 + 1.0e-10)
      assert_true(rectangle.width > 0.0 && rectangle.height > 0.0)
      bar_geometry_assert_close(
        if horizontal {
          rectangle.width
        } else {
          rectangle.height
        },
        if horizontal {
          200.0
        } else {
          100.0
        },
      )
    }
  }
}

///|
test "raw invalid segment geometry is excluded from drawing and limits" {
  let segments = [
    @core.bar_segment(0.0, 2.0, baseline=3.0),
    @core.bar_segment(1000.0, 0.0 / 0.0),
    @core.bar_segment(1.0 / 0.0, 2.0),
    @core.bar_segment(20.0, 2.0, width=-1.0),
    @core.bar_segment(30.0, 2.0, width=0.0),
    @core.bar_segment(40.0, 2.0, baseline=1.0 / 0.0),
    @core.bar_segment(50.0, 1.7e308, baseline=1.7e308),
  ]
  let artists = [
    @render.Artist::BarSegments(segments, false, @core.style("blue")),
  ]
  let x = artist_data_interval(artists, true)
  let y = artist_data_interval(artists, false)
  bar_geometry_assert_close(x.lower(), -0.4)
  bar_geometry_assert_close(x.upper(), 0.4)
  assert_eq((y.lower(), y.upper()), (3.0, 5.0))
  let scale : Scale = {
    xmin: -1.0,
    xmax: 1.0,
    ymin: 0.0,
    ymax: 6.0,
    x_axis_scale: @ticker_scale.Linear,
    y_axis_scale: @ticker_scale.Linear,
  }
  assert_eq(
    bar_segment_rectangles(scale, 0.0, 0.0, 400.0, 200.0, segments, false).length(),
    1,
  )
}
