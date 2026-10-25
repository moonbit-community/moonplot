///|
fn make_filled_contour_drawing(
  model : Model,
  triangular : Bool,
) -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=300)
  figure.legend([])
  figure.axes().set_axis_off()
  let shift = if model.revision % 2 == 0 { 0.0 } else { 1.0 }
  if triangular {
    figure.set_x_limits(-3.5, 3.5)
    figure.set_y_limits(-1.5, 1.5)
    let mesh = @scene.triangulation(
      [-2.0, -3.0, -1.0, -1.0, -3.0, 2.0, 1.0, 3.0, 3.0, 1.0],
      [0.0, -1.0, -1.0, 1.0, 1.0, 0.0, -1.0, -1.0, 1.0, 1.0],
      triangles=[
        [0, 1, 2],
        [0, 2, 3],
        [0, 3, 4],
        [0, 4, 1],
        [5, 6, 7],
        [5, 7, 8],
        [5, 8, 9],
        [5, 9, 6],
      ],
    )
    ignore(
      figure.tricontourf_triangulation(
        mesh,
        [
          shift,
          1.0 + shift,
          1.0 + shift,
          1.0 + shift,
          1.0 + shift,
          shift,
          1.0 + shift,
          1.0 + shift,
          1.0 + shift,
          1.0 + shift,
        ],
        levels=[0.5 + shift, 1.5 + shift],
        colors=["#398575"],
        label="Triangular bands",
      ),
    )
  } else {
    figure.set_x_limits(-1.5, 1.5)
    figure.set_y_limits(-1.5, 1.5)
    let levels = if shift == 0.0 { [0.5, 1.5] } else { [0.5, 1.5, 2.5, 3.5] }
    ignore(
      figure.contourf(
        [
          [2.0 + shift, 2.0 + shift, 2.0 + shift],
          [2.0 + shift, shift, 2.0 + shift],
          [2.0 + shift, 2.0 + shift, 2.0 + shift],
        ],
        x=[-2.0, 0.0, 2.0],
        y=[-2.0, 0.0, 2.0],
        levels~,
        extend_mode="both",
        label="Regular bands",
        colors=["#8a70b5", "#398575", "#4d79c7"],
      ),
    )
  }
  figure.to_drawing()
}

///|
fn filled_contour_consumer_view(
  model : Model,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let regular = make_filled_contour_drawing(model, false)
  let triangular = make_filled_contour_drawing(model, true)
  let a = regular.targets()[0].bounds
  let b = triangular.targets()[0].bounds
  @html.div(
    id="filled-contour-consumer",
    attrs=@html.Attrs::build()
      .data_set(
        "band",
        model.filled_contour_hover
        .map(point => point.point_index)
        .unwrap_or(-1)
        .to_string(),
      )
      .data_set("regular-left", a.0.to_string())
      .data_set("regular-top", a.1.to_string())
      .data_set("regular-width", a.2.to_string())
      .data_set("regular-height", a.3.to_string())
      .data_set("tri-left", b.0.to_string())
      .data_set("tri-top", b.1.to_string())
      .data_set("tri-width", b.2.to_string())
      .data_set("tri-height", b.3.to_string()),
    [
      @plot_dom.view(
        regular,
        id="release-filled-contours",
        on_event=event => emit(FilledContour(event)),
        hovered?=model.filled_contour_hover,
      ),
      @plot_dom.view(
        triangular,
        id="release-trifilled-contours",
        on_event=event => emit(TriFilledContour(event)),
        hovered?=model.trifilled_contour_hover,
        hit_mode=@drawing.HitMode::XNearest,
        tooltip=info => {
          let (lower, upper) = info.interval.unwrap()
          @html.b(
            attrs=@html.Attrs::build()
              .data_set("testid", "consumer-filled-contour-tooltip")
              .data_set(
                "contourf",
                (info.kind == @drawing.HitKind::ContourF).to_string(),
              )
              .data_set("band", info.point.point_index.to_string()),
            "填色区间 \{lower}..\{upper}；代表值 \{info.value}",
          )
        },
      ),
    ],
  )
}
