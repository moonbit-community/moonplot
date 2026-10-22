///|
test "Asinh secondary SVG x and y ticks use source own function positions" {
  for horizontal in [true, false] {
    let primary_scale = @ticker_scale.asinh_scale()
    let scale : Scale = {
      xmin: if horizontal {
        -100.0
      } else {
        0.0
      },
      xmax: if horizontal {
        100.0
      } else {
        1.0
      },
      ymin: if horizontal {
        0.0
      } else {
        -100.0
      },
      ymax: if horizontal {
        1.0
      } else {
        100.0
      },
      x_axis_scale: if horizontal {
        primary_scale
      } else {
        @ticker_scale.linear_scale()
      },
      y_axis_scale: if horizontal {
        @ticker_scale.linear_scale()
      } else {
        primary_scale
      },
    }
    let axis = @render.secondary_axis(
      if horizontal {
        @render.SecondaryLocation::Top
      } else {
        @render.SecondaryLocation::Right
      },
      value => value * 2.0 + 5.0,
      value => (value - 5.0) / 2.0,
      None,
      6,
      Some([105.0]),
      None,
      None,
      minor_ticks_provider=Some(() => [-215.0, -95.0, 225.0]),
    )
    let writer = @xml.Writer::new()
    writer.start_element("svg", [])
    if horizontal {
      append_secondary_x_axis(writer, scale, 40.0, 60.0, 400.0, 300.0, [], axis)
    } else {
      append_secondary_y_axis(writer, scale, 40.0, 60.0, 400.0, 300.0, [], axis)
    }
    writer.end_element("svg")
    let reader = @xml.Reader::from_string(writer.to_string())
    let major = []
    let minor = []
    for event in reader.read_events_until_eof() {
      if event.kind is @xml.EventKind::Empty(element) && element.name == "line" {
        let coordinate = element.get(if horizontal { "x1" } else { "y1" })
        if element.get("stroke-width") == Some("0.7") {
          minor.push(coordinate.unwrap())
        } else if coordinate ==
          Some(float_text(if horizontal { 340.0 } else { 135.0 })) {
          major.push(coordinate.unwrap())
        }
      }
    }
    assert_eq(major, [float_text(if horizontal { 340.0 } else { 135.0 })])
    assert_eq(minor, [float_text(if horizontal { 140.0 } else { 285.0 })])
  }
}
