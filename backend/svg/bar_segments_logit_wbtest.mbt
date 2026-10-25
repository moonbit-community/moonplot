///|
test "bar edges retain a bounded domain between invalid endpoints without admitting domain outsiders" {
  for clipped in [false, true] {
    let axis = @ticker_scale.Scale::Logit(clip=clipped)
    for (view_first, view_last) in [(0.1, 0.9), (0.9, 0.1)] {
      for (first, last) in [(0.0, 1.0), (-1.0, 2.0)] {
        assert_eq(
          bar_segment_axis_edges(first, last, view_first, view_last, axis),
          Some((0.1, 0.9)),
        )
      }
      for (first, last) in [(-2.0, -1.0), (-1.0, 0.0), (1.0, 2.0), (2.0, 3.0)] {
        assert_eq(
          bar_segment_axis_edges(first, last, view_first, view_last, axis),
          None,
        )
      }
      assert_eq(
        bar_segment_axis_edges(0.0, 0.25, view_first, view_last, axis),
        Some((0.1, 0.25)),
      )
      assert_eq(
        bar_segment_axis_edges(0.75, 1.0, view_first, view_last, axis),
        Some((0.75, 0.9)),
      )
    }
  }
  // The ordinary Log path still retains a valid endpoint and clips only the
  // invalid endpoint, even when the viewport is reversed.
  for (view_first, view_last) in [(1.0, 100.0), (100.0, 1.0)] {
    assert_eq(
      bar_segment_axis_edges(
        0.0,
        10.0,
        view_first,
        view_last,
        @ticker_scale.Log,
      ),
      Some((1.0, 10.0)),
    )
    assert_eq(
      bar_segment_axis_edges(
        0.1,
        10.0,
        view_first,
        view_last,
        @ticker_scale.Log,
      ),
      Some((0.1, 10.0)),
    )
    assert_eq(
      bar_segment_axis_edges(
        -2.0,
        0.0,
        view_first,
        view_last,
        @ticker_scale.Log,
      ),
      None,
    )
  }
}

///|
fn logit_bar_test_scale(
  horizontal : Bool,
  inverted : Bool,
  clipped : Bool,
) -> Scale {
  let lo = if inverted { 0.9 } else { 0.1 }
  let hi = if inverted { 0.1 } else { 0.9 }
  let axis = @ticker_scale.Scale::Logit(clip=clipped)
  {
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
      axis
    } else {
      @ticker_scale.Linear
    },
    y_axis_scale: if horizontal {
      @ticker_scale.Linear
    } else {
      axis
    },
  }
}

///|
test "Logit bar rectangles cover the viewport and preserve raw endpoints indices and ranges" {
  let segments = [
    @core.bar_segment(0.0, 0.0 / 0.0),
    @core.bar_segment(0.0, 3.0, baseline=-1.0, width=0.6),
    @core.bar_segment(0.0, -3.0, baseline=2.0, width=0.6),
    @core.bar_segment(0.0, 1.0, baseline=-3.0, width=0.6),
    @core.bar_segment(0.0, 1.0, baseline=2.0, width=0.6),
  ]
  for horizontal in [false, true] {
    for inverted in [false, true] {
      for clipped in [false, true] {
        let rectangles = bar_segment_rectangles(
          logit_bar_test_scale(horizontal, inverted, clipped),
          0.0,
          0.0,
          400.0,
          200.0,
          segments,
          horizontal,
        )
        assert_eq(rectangles.map(r => r.source_index), [1, 2])
        for rectangle in rectangles {
          bar_geometry_assert_close(
            rectangle.left,
            if horizontal {
              0.0
            } else {
              140.0
            },
          )
          bar_geometry_assert_close(
            rectangle.top,
            if horizontal {
              70.0
            } else {
              0.0
            },
          )
          bar_geometry_assert_close(
            rectangle.width,
            if horizontal {
              400.0
            } else {
              120.0
            },
          )
          bar_geometry_assert_close(
            rectangle.height,
            if horizontal {
              60.0
            } else {
              200.0
            },
          )
        }
        assert_eq(
          if horizontal {
            rectangles[0].point.x()
          } else {
            rectangles[0].point.y()
          },
          2.0,
        )
        assert_eq(
          if horizontal {
            rectangles[1].point.x()
          } else {
            rectangles[1].point.y()
          },
          -1.0,
        )
      }
    }
    let raw = artist_data_interval(
      [@render.Artist::BarSegments(segments, horizontal, @core.style("red"))],
      horizontal,
    )
    assert_eq((raw.lower(), raw.upper()), (-3.0, 3.0))
  }
}

///|
test "Logit painters and hit capture use the same finite clipped rectangles" {
  for horizontal in [false, true] {
    let captured : Array[RenderedBar] = []
    let writer = @xml.Writer::new()
    writer.start_element("svg", [])
    append_bar_segments(
      writer,
      logit_bar_test_scale(horizontal, true, false),
      0.0,
      0.0,
      400.0,
      200.0,
      [@core.bar_segment(0.0, 1.0, width=0.6)],
      horizontal,
      @core.style("red"),
      on_bar=Some(rectangle => captured.push(rectangle)),
    )
    writer.end_element("svg")
    assert_eq(captured.length(), 1)
    let reader = @xml.Reader::from_string(writer.to_string())
    let mut count = 0
    for event in reader.read_events_until_eof() {
      if event.kind is @xml.EventKind::Empty(element) && element.name == "rect" {
        for
          (name, value) in [
            ("x", captured[0].left),
            ("y", captured[0].top),
            ("width", captured[0].width),
            ("height", captured[0].height),
          ] {
          bar_geometry_assert_close(
            @ticker.parse_float_text(element.get(name).unwrap()),
            value,
          )
        }
        count += 1
      }
    }
    assert_eq(count, 1)
    assert_false(writer.to_string().contains("NaN"))
    assert_false(writer.to_string().contains("Infinity"))
  }
}
