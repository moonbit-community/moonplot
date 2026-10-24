///|
fn bar_geometry_assert_close(actual : Double, expected : Double) -> Unit raise {
  assert_true((actual - expected).abs() < 1.0e-12)
}

///|
test "bar raw bounds include both sides and preserve the zero baseline" {
  let points = [
    @core.point(0.0, 3.0),
    @core.point(1.0, 5.0),
    @core.point(2.0, 4.0),
    @core.point(3.0, 7.0),
  ]
  let bars = [@render.Artist::Bar(points, @core.style("red"))]
  let x = artist_data_interval(bars, true)
  let y = artist_data_interval(bars, false)
  bar_geometry_assert_close(x.lower(), -0.4)
  bar_geometry_assert_close(x.upper(), 3.4)
  assert_eq((y.lower(), y.upper()), (0.0, 7.0))
  let sideways = [
    @render.Artist::BarH(
      points.map(p => @core.point(p.y(), p.x())),
      @core.style("red"),
    ),
  ]
  let x = artist_data_interval(sideways, true)
  let y = artist_data_interval(sideways, false)
  assert_eq((x.lower(), x.upper()), (0.0, 7.0))
  bar_geometry_assert_close(y.lower(), -0.4)
  bar_geometry_assert_close(y.upper(), 3.4)
  let positive = [
    @render.Artist::Bar(
      [@core.point(1.0, 2.0), @core.point(2.0, 4.0)],
      @core.style("red"),
    ),
  ]
  bar_geometry_assert_close(artist_minpos(positive, true), 0.6)
}

///|
test "singleton bars have finite data width independent of the viewport" {
  for horizontal in [false, true] {
    let artist = if horizontal {
      @render.Artist::BarH([@core.point(3.0, 2.0)], @core.style("blue"))
    } else {
      @render.Artist::Bar([@core.point(2.0, 3.0)], @core.style("blue"))
    }
    let width_bounds = artist_data_interval([artist], !horizontal)
    bar_geometry_assert_close(width_bounds.lower(), 1.6)
    bar_geometry_assert_close(width_bounds.upper(), 2.4)
  }
}

///|
test "bar spacing retains input order and ignores nonfinite paired points" {
  let bars = [
    @render.Artist::Bar(
      [
        @core.point(3.0, 2.0),
        @core.point(1000.0, 0.0 / 0.0),
        @core.point(1.0, 4.0),
        @core.point(1.0 / 0.0, 5.0),
        @core.point(2.0, -3.0),
      ],
      @core.style("red"),
    ),
  ]
  let x = artist_data_interval(bars, true)
  let y = artist_data_interval(bars, false)
  bar_geometry_assert_close(x.lower(), 0.6)
  bar_geometry_assert_close(x.upper(), 3.8)
  assert_eq((y.lower(), y.upper()), (-3.0, 4.0))
}

///|
test "automatically sized bar rectangles fit inside both plot directions" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  for
    points in [
      [
        @core.point(0.0, 3.0),
        @core.point(1.0, 5.0),
        @core.point(2.0, 4.0),
        @core.point(3.0, 7.0),
      ],
      [@core.point(2.0, 3.0)],
    ] {
    for horizontal in [false, true] {
      let artist = if horizontal {
        @render.Artist::BarH(
          points.map(p => @core.point(p.y(), p.x())),
          @core.style("red"),
        )
      } else {
        @render.Artist::Bar(points, @core.style("red"))
      }
      let panel = @render.panel_with_sharing(
        None,
        [artist],
        None,
        [],
        None,
        @axis.axis(),
        @axis.axis(horizontal=false),
        None,
        None,
        false,
        [],
        [],
      )
      let scale = compute_scale(
        @render.figure(400, 300, 40, [panel], [], None),
        0,
      )
      let writer = @xml.Writer::new()
      writer.start_element("svg", [])
      if horizontal {
        append_barh(
          writer,
          scale,
          40.0,
          40.0,
          320.0,
          220.0,
          points.map(p => @core.point(p.y(), p.x())),
          @core.style("red"),
        )
      } else {
        append_bars(
          writer,
          scale,
          40.0,
          40.0,
          320.0,
          220.0,
          points,
          @core.style("red"),
        )
      }
      writer.end_element("svg")
      let reader = @xml.Reader::from_string(writer.to_string())
      let mut rectangles = 0
      for event in reader.read_events_until_eof() {
        if event.kind is @xml.EventKind::Empty(element) &&
          element.name == "rect" {
          let x = @ticker.parse_float_text(element.get("x").unwrap())
          let y = @ticker.parse_float_text(element.get("y").unwrap())
          let width = @ticker.parse_float_text(element.get("width").unwrap())
          let height = @ticker.parse_float_text(element.get("height").unwrap())
          assert_true(x >= 40.0 - 1.0e-10)
          assert_true(y >= 40.0 - 1.0e-10)
          assert_true(x + width <= 360.0 + 1.0e-10)
          assert_true(y + height <= 260.0 + 1.0e-10)
          rectangles += 1
        }
      }
      assert_eq(rectangles, points.length())
    }
  }
}

///|
test "bar edge mapping keeps reversed and logarithmic width axes finite" {
  for logarithmic in [false, true] {
    for horizontal in [false, true] {
      let upper = if logarithmic { 2.0 } else { 4.0 }
      let lower = if logarithmic { 0.1 } else { -1.0 }
      let scale : Scale = {
        xmin: if horizontal {
          0.0
        } else {
          upper
        },
        xmax: if horizontal {
          5.0
        } else {
          lower
        },
        ymin: if horizontal {
          upper
        } else {
          0.0
        },
        ymax: if horizontal {
          lower
        } else {
          5.0
        },
        x_axis_scale: if logarithmic && !horizontal {
          @ticker_scale.Log
        } else {
          @ticker_scale.Linear
        },
        y_axis_scale: if logarithmic && horizontal {
          @ticker_scale.Log
        } else {
          @ticker_scale.Linear
        },
      }
      let writer = @xml.Writer::new()
      writer.start_element("svg", [])
      if horizontal {
        append_barh(
          writer,
          scale,
          40.0,
          40.0,
          320.0,
          220.0,
          [@core.point(2.0, 0.1), @core.point(4.0, 1.0)],
          @core.style("red"),
        )
      } else {
        append_bars(
          writer,
          scale,
          40.0,
          40.0,
          320.0,
          220.0,
          [@core.point(0.1, 2.0), @core.point(1.0, 4.0)],
          @core.style("red"),
        )
      }
      writer.end_element("svg")
      let svg = writer.to_string()
      assert_true(!svg.contains("NaN"))
      assert_true(!svg.contains("Infinity"))
      let reader = @xml.Reader::from_string(svg)
      let mut rectangles = 0
      for event in reader.read_events_until_eof() {
        if event.kind is @xml.EventKind::Empty(element) &&
          element.name == "rect" {
          let x = @ticker.parse_float_text(element.get("x").unwrap())
          let y = @ticker.parse_float_text(element.get("y").unwrap())
          let width = @ticker.parse_float_text(element.get("width").unwrap())
          let height = @ticker.parse_float_text(element.get("height").unwrap())
          assert_true(width > 0.0)
          assert_true(height > 0.0)
          assert_true(x >= 40.0 - 1.0e-10)
          assert_true(x + width <= 360.0 + 1.0e-10)
          assert_true(y >= 40.0 - 1.0e-10)
          assert_true(y + height <= 260.0 + 1.0e-10)
          rectangles += 1
        }
      }
      assert_eq(rectangles, 2)
    }
  }
}
