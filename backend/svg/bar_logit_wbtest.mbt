///|
fn ordinary_bar_test_svg(
  scale : Scale,
  points : Array[@core.Point],
  horizontal : Bool,
  captured~ : Array[RenderedBar]? = None,
) -> String raise {
  let writer = @xml.Writer::new()
  try! writer.start_element("svg", [])
  let on_bar = captured.map(output => rectangle => output.push(rectangle))
  if horizontal {
    append_barh(
      writer,
      scale,
      0.0,
      0.0,
      400.0,
      200.0,
      points,
      @core.style("red"),
      on_bar~,
    )
  } else {
    append_bars(
      writer,
      scale,
      0.0,
      0.0,
      400.0,
      200.0,
      points,
      @core.style("red"),
      on_bar~,
    )
  }
  try! writer.end_element("svg")
  writer.to_string()
}

///|
test "ordinary valid linear log and Logit bar SVG stays byte identical" {
  let documents = []
  for axis_scale in [@ticker_scale.Linear, Log, Logit(clip=false)] {
    for horizontal in [false, true] {
      for inverted in [false, true] {
        let (lower, upper) = if axis_scale.is_log() {
          (1.0, 100.0)
        } else if axis_scale.is_logit() {
          (0.1, 0.9)
        } else {
          (0.0, 1.0)
        }
        let (first, last) = if inverted {
          (upper, lower)
        } else {
          (lower, upper)
        }
        let scale : Scale = {
          xmin: if horizontal {
            first
          } else {
            -1.0
          },
          xmax: if horizontal {
            last
          } else {
            1.0
          },
          ymin: if horizontal {
            -1.0
          } else {
            first
          },
          ymax: if horizontal {
            1.0
          } else {
            last
          },
          x_axis_scale: if horizontal {
            axis_scale
          } else {
            @ticker_scale.Linear
          },
          y_axis_scale: if horizontal {
            @ticker_scale.Linear
          } else {
            axis_scale
          },
        }
        let points = if horizontal {
          [@core.point(upper, -0.25), @core.point(lower, 0.25)]
        } else {
          [@core.point(-0.25, upper), @core.point(0.25, lower)]
        }
        documents.push(ordinary_bar_test_svg(scale, points, horizontal))
      }
    }
  }
  debug_inspect(
    documents,
    content=(
      #|[
      #|  "<svg><rect x=\"110\" y=\"0\" width=\"79.99999999999999\" height=\"200\" fill=\"red\"/><rect x=\"210\" y=\"200\" width=\"80\" height=\"0\" fill=\"red\"/></svg>",
      #|  "<svg><rect x=\"110\" y=\"0\" width=\"79.99999999999999\" height=\"200\" fill=\"red\"/><rect x=\"210\" y=\"0\" width=\"80\" height=\"0\" fill=\"red\"/></svg>",
      #|  "<svg><rect x=\"0\" y=\"105\" width=\"400\" height=\"40\" fill=\"red\"/><rect x=\"0\" y=\"55\" width=\"0\" height=\"39.99999999999999\" fill=\"red\"/></svg>",
      #|  "<svg><rect x=\"0\" y=\"105\" width=\"400\" height=\"40\" fill=\"red\"/><rect x=\"400\" y=\"55\" width=\"0\" height=\"39.99999999999999\" fill=\"red\"/></svg>",
      #|  "<svg><rect x=\"110\" y=\"0\" width=\"79.99999999999999\" height=\"200\" fill=\"red\"/><rect x=\"210\" y=\"200\" width=\"80\" height=\"0\" fill=\"red\"/></svg>",
      #|  "<svg><rect x=\"110\" y=\"200\" width=\"79.99999999999999\" height=\"0\" fill=\"red\"/><rect x=\"210\" y=\"0\" width=\"80\" height=\"200\" fill=\"red\"/></svg>",
      #|  "<svg><rect x=\"0\" y=\"105\" width=\"400\" height=\"40\" fill=\"red\"/><rect x=\"0\" y=\"55\" width=\"0\" height=\"39.99999999999999\" fill=\"red\"/></svg>",
      #|  "<svg><rect x=\"0\" y=\"105\" width=\"0\" height=\"40\" fill=\"red\"/><rect x=\"0\" y=\"55\" width=\"400\" height=\"39.99999999999999\" fill=\"red\"/></svg>",
      #|  "<svg><rect x=\"110\" y=\"0\" width=\"79.99999999999999\" height=\"200\" fill=\"red\"/><rect x=\"210\" y=\"200\" width=\"80\" height=\"0\" fill=\"red\"/></svg>",
      #|  "<svg><rect x=\"110\" y=\"0\" width=\"79.99999999999999\" height=\"200\" fill=\"red\"/><rect x=\"210\" y=\"0\" width=\"80\" height=\"0\" fill=\"red\"/></svg>",
      #|  "<svg><rect x=\"0\" y=\"105\" width=\"400\" height=\"40\" fill=\"red\"/><rect x=\"0\" y=\"55\" width=\"0\" height=\"39.99999999999999\" fill=\"red\"/></svg>",
      #|  "<svg><rect x=\"0\" y=\"105\" width=\"400\" height=\"40\" fill=\"red\"/><rect x=\"400\" y=\"55\" width=\"0\" height=\"39.99999999999999\" fill=\"red\"/></svg>",
      #|]
    ),
  )
}

///|
test "ordinary Logit painter and capture share clipped finite rectangles and original indices" {
  for horizontal in [false, true] {
    for inverted in [false, true] {
      for clipped in [false, true] {
        let points = if horizontal {
          [
            @core.point(0.0 / 0.0, 0.0),
            @core.point(1.0, 0.0),
            @core.point(0.25, 0.0),
            @core.point(-1.0, 0.0),
          ]
        } else {
          [
            @core.point(0.0, 0.0 / 0.0),
            @core.point(0.0, 1.0),
            @core.point(0.0, 0.25),
            @core.point(0.0, -1.0),
          ]
        }
        let scale = logit_bar_test_scale(horizontal, inverted, clipped)
        let captured : Array[RenderedBar] = []
        let document = ordinary_bar_test_svg(
          scale,
          points,
          horizontal,
          captured=Some(captured),
        )
        assert_eq(document, ordinary_bar_test_svg(scale, points, horizontal))
        assert_eq(captured.map(r => r.source_index), [1, 2])
        let reader = @xml.Reader::from_string(document)
        let mut index = 0
        for event in reader.read_events_until_eof() {
          if event.kind is @xml.EventKind::Empty(element) &&
            element.name == "rect" {
            let rectangle = captured[index]
            assert_true(rectangle.segment is None)
            for
              (name, value) in [
                ("x", rectangle.left),
                ("y", rectangle.top),
                ("width", rectangle.width),
                ("height", rectangle.height),
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
        assert_true(!document.contains("NaN") && !document.contains("Infinity"))
      }
    }
  }
}

///|
test "ordinary valid Logit endpoints retain overhanging geometry outside the viewport" {
  for horizontal in [false, true] {
    for inverted in [false, true] {
      let points = if horizontal {
        [@core.point(0.95, 0.0)]
      } else {
        [@core.point(0.0, 0.95)]
      }
      let scale = logit_bar_test_scale(horizontal, inverted, false)
      let captured : Array[RenderedBar] = []
      let svg = ordinary_bar_test_svg(
        scale,
        points,
        horizontal,
        captured=Some(captured),
      )
      assert_eq(svg, ordinary_bar_test_svg(scale, points, horizontal))
      assert_eq(captured.length(), 1)
      assert_true(
        if horizontal {
          captured[0].width > 400.0
        } else {
          captured[0].height > 200.0
        },
      )
      assert_eq(
        if horizontal {
          captured[0].point.x()
        } else {
          captured[0].point.y()
        },
        0.95,
      )
    }
  }
}
