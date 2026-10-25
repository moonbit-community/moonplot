///|
test "Tripcolor enabled disabled mismatched and unknown prepared ownership cannot revive other-kind capture" {
  for case in 0..<15 {
    let points = [
      @core.point(0.2, 0.2),
      @core.point(0.8, 0.2),
      @core.point(0.2, 0.8),
    ]
    let style = @core.style("purple", width=1.0, fill="purple")
    let source = @render.tripcolor_hit_data(
      points,
      7,
      3.5,
      (2, 0, 1),
      true,
      "Original face",
    )
    let artist = match case {
      0 | 1 | 2 | 7 => @render.Artist::Line(points, style)
      3 | 8 => @render.Artist::Scatter(points, style)
      4 => @render.Artist::Bar(points, style)
      5 => @render.Artist::CompoundPolygon([points], style)
      9 => @render.Artist::Polygon(points.copy(), style)
      _ => @render.Artist::Polygon(points, style)
    }
    if case == 10 {
      points[0] = @core.point(0.3, 0.3)
    }
    let x = @axis.axis()
    let y = @axis.axis(horizontal=false)
    x.set_limits(0.0, 1.0)
    y.set_limits(0.0, 1.0)
    let completed = [0]
    let panel = @render.panel_with_sharing(
      None,
      [artist],
      None,
      [],
      None,
      x,
      y,
      None,
      None,
      false,
      [],
      [],
      hit_metadata=[
        @render.hit_metadata(
          "Other record name",
          tricolor=if case == 7 || case == 8 || case == 14 {
            None
          } else if case == 11 {
            Some(source.invalidated())
          } else {
            Some(source)
          },
          contourf=if case == 12 {
            Some(@render.contourf_hit_data([points], 0, 0.0, 1.0, "Band"))
          } else {
            None
          },
          discrete=if case == 13 {
            @render.discrete_line_hit_data(
              Step,
              points,
              [@render.discrete_datum(0, points[0], 1.0)],
              [0, 0],
            )
          } else {
            None
          },
        ),
      ],
      line_provider=if case == 1 || case == 2 {
        Some(_ => {
          Some(
            @render.line_drawing_context(
              points,
              style,
              () => completed[0] += 1,
              discrete=if case == 2 {
                @render.discrete_line_hit_data(
                  Step,
                  points,
                  [@render.discrete_datum(0, points[0], 99.0)],
                  [0, 0],
                )
              } else {
                None
              },
            ),
          )
        })
      } else {
        None
      },
    )
    let fig = @render.figure(400, 300, 0, [panel], [], None)
    let frame = render_drawing_with_positions_checked(fig).0
    assert_eq(frame.svg(), render(fig))
    assert_eq(
      frame.targets().length(),
      if case == 6 {
        1
      } else if case == 7 || case == 8 {
        3
      } else {
        0
      },
    )
    if case == 1 || case == 2 {
      assert_eq(completed[0], 2)
    }
    if case == 6 {
      let info = frame.targets()[0].info
      assert_eq(
        (info.kind, info.value, info.series, info.point.point_index),
        (Tripcolor, 3.5, "Original face", 7),
      )
      assert_eq(info.tricolor.unwrap().vertices, (2, 0, 1))
    }
  }
}
