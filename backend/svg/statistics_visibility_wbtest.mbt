///|
fn statistics_visibility_figure(
  artist : @render.Artist,
  horizontal~ : Bool = false,
  value_limits~ : (Double, Double) = (0.0, 25.0),
) -> @render.Figure raise {
  let x = @axis.axis()
  let y = @axis.axis(horizontal=false)
  if horizontal {
    x.set_limits(value_limits.0, value_limits.1)
    y.set_limits(0.0, 3.0)
  } else {
    x.set_limits(0.0, 3.0)
    y.set_limits(value_limits.0, value_limits.1)
  }
  @render.figure(
    400,
    200,
    0,
    [@render.panel(None, [artist], None, [], None, x, y, false, [], [])],
    [],
    None,
  )
}

///|
fn statistics_visible_frame(figure : @render.Figure) -> @drawing.Drawing raise {
  let (frame, _) = render_drawing_with_positions_checked(figure)
  assert_eq(frame.svg(), render_with_positions_checked(figure).0)
  frame
}

///|
fn visibility_box_stats() -> Array[@boxplot.BoxStats] raise {
  [@boxplot.box_stats([1.0, 2.0, 3.0, 4.0, 5.0, 20.0])]
}

///|
test "zero-width error strokes ignore independent fill without altering SVG" {
  for width in [0.0, -0.0] {
    let frame = statistics_visible_frame(
      statistics_visibility_figure(
        @render.Artist::ErrorBar(
          [@core.point(1.0, 4.0)],
          [2.0],
          [0.5],
          @core.style("red", width~, fill="blue"),
        ),
      ),
    )
    assert_eq(frame.targets(), [])
    assert_eq(frame.points(), [])
    assert_eq(frame.hit_test(133.0, 168.0, radius=100.0), None)
    assert_eq(frame.svg().split("<polyline").count() - 1, 1)
    assert_eq(frame.svg().split("<line").count() - 1, 6)
  }
  for color in ["none", "transparent"] {
    let frame = statistics_visible_frame(
      statistics_visibility_figure(
        @render.Artist::ErrorBar(
          [@core.point(1.0, 4.0)],
          [2.0],
          [0.5],
          @core.style(color, fill="blue"),
        ),
      ),
    )
    assert_eq(frame.targets(), [])
  }
}

///|
test "boxes with invisible strokes keep independently visible fill and no whisker cap or outlier targets" {
  for horizontal in [false, true] {
    for color in ["none", "transparent", "#f000", "#ff000000"] {
      let frame = statistics_visible_frame(
        statistics_visibility_figure(
          @render.Artist::BoxPlot(
            visibility_box_stats(),
            horizontal,
            @core.style(color, fill="red"),
          ),
          horizontal~,
        ),
      )
      assert_eq(frame.targets().length(), 1)
      let target = frame.targets()[0]
      assert_true(target.shape is @drawing.HitShape::Rectangle(_, _, _, _))
      assert_eq(target.info.box.unwrap().part, @drawing.BoxPart::Box)
      assert_eq(target.info.box.unwrap().median, 3.5)
      assert_eq(
        frame.hit_test(
          target.info.point.screen_x,
          target.info.point.screen_y,
          radius=0.0,
        ),
        Some(target.info.point),
      )
    }
  }
}

///|
test "zero-width boxes keep their fill and outlier circles because circles are not stroked" {
  for horizontal in [false, true] {
    let frame = statistics_visible_frame(
      statistics_visibility_figure(
        @render.Artist::BoxPlot(
          visibility_box_stats(),
          horizontal,
          @core.style("red", width=0.0, fill="blue"),
        ),
        horizontal~,
      ),
    )
    assert_eq(frame.targets().length(), 2)
    assert_eq(frame.targets().map(t => t.info.box.unwrap().part), [
      @drawing.BoxPart::Box,
      Outlier(20.0),
    ])
    assert_true(
      frame.targets()[0].shape is @drawing.HitShape::Rectangle(_, _, _, _),
    )
    assert_true(frame.targets()[1].shape is @drawing.HitShape::Point)
    let empty_box = statistics_visible_frame(
      statistics_visibility_figure(
        @render.Artist::BoxPlot(
          visibility_box_stats(),
          horizontal,
          @core.style("red", width=0.0, fill="none"),
        ),
        horizontal~,
      ),
    )
    assert_eq(empty_box.targets().length(), 1)
    assert_eq(
      empty_box.targets()[0].info.box.unwrap().part,
      @drawing.BoxPart::Outlier(20.0),
    )
  }
}

///|
test "unfilled boxes capture original outline segments rather than invisible interior" {
  for horizontal in [false, true] {
    for fill in ["none", "transparent", "#0000"] {
      let frame = statistics_visible_frame(
        statistics_visibility_figure(
          @render.Artist::BoxPlot(
            visibility_box_stats(),
            horizontal,
            @core.style("red", fill~),
          ),
          horizontal~,
        ),
      )
      assert_eq(frame.targets().length(), 10)
      assert_true(
        frame
        .targets()
        .all(t => !(t.shape is @drawing.HitShape::Rectangle(_, _, _, _))),
      )
      let (interior_x, interior_y, edge_x, edge_y) = if horizontal {
        (
          3.0 / 25.0 * 400.0,
          (1.0 - 1.1 / 3.0) * 200.0,
          2.25 / 25.0 * 400.0,
          (1.0 - 1.1 / 3.0) * 200.0,
        )
      } else {
        (
          1.1 / 3.0 * 400.0,
          (1.0 - 3.0 / 25.0) * 200.0,
          1.1 / 3.0 * 400.0,
          (1.0 - 2.25 / 25.0) * 200.0,
        )
      }
      assert_eq(frame.hit_test(interior_x, interior_y, radius=0.0), None)
      let edge = frame.hit_test(edge_x, edge_y, radius=1.0e-10).unwrap()
      assert_eq(
        frame.hit_info(edge).unwrap().box.unwrap().part,
        @drawing.BoxPart::Box,
      )
    }
  }
}

///|
test "clipped unfilled boxes do not invent strokes at viewport boundaries" {
  for horizontal in [false, true] {
    let frame = statistics_visible_frame(
      statistics_visibility_figure(
        @render.Artist::BoxPlot(
          visibility_box_stats(),
          horizontal,
          @core.style("red", fill="none"),
        ),
        horizontal~,
        value_limits=(3.0, 4.0),
      ),
    )
    assert_eq(frame.targets().length(), 3)
    let (inside_x, inside_y, edge_x, edge_y) = if horizontal {
      (0.0, (1.0 - 1.1 / 3.0) * 200.0, 1.0, (1.0 - 0.7 / 3.0) * 200.0)
    } else {
      (1.1 / 3.0 * 400.0, 0.0, 0.7 / 3.0 * 400.0, 1.0)
    }
    assert_eq(frame.hit_test(inside_x, inside_y, radius=0.0), None)
    assert_true(frame.hit_test(edge_x, edge_y, radius=1.0e-10) is Some(_))
  }
}

///|
test "hidden box strokes retain fixed segment slots and zero-area fills create no area hits" {
  for horizontal in [false, true] {
    let scale : Scale = {
      xmin: 0.0,
      xmax: 25.0,
      ymin: 0.0,
      ymax: 25.0,
      x_axis_scale: @ticker_scale.Linear,
      y_axis_scale: @ticker_scale.Linear,
    }
    for color in ["none", "transparent"] {
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
        visibility_box_stats(),
        horizontal,
        @core.style(color, fill="red"),
        on_box=Some(sample => samples.push(sample)),
      )
      writer.end_element("svg")
      assert_eq(samples.length(), 1)
      assert_eq(samples[0].segments.length(), 5)
      assert_true(samples[0].fill_visible)
      assert_true(!samples[0].stroke_visible)
      assert_eq(samples[0].fliers, [])
    }
    let frame = statistics_visible_frame(
      statistics_visibility_figure(
        @render.Artist::BoxPlot(
          [@boxplot.box_stats([2.0, 2.0, 2.0])],
          horizontal,
          @core.style("red", width=0.0, fill="blue"),
        ),
        horizontal~,
      ),
    )
    assert_eq(frame.targets(), [])
  }
}
