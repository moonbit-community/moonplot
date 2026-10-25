///|
fn make_streamplot_drawing(
  model : Model,
  styled : Bool,
) -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=300)
  figure.legend([])
  figure.axes().set_axis_off()
  figure.set_x_limits(0.0, 2.0)
  figure.set_y_limits(0.0, 2.0)
  let updated = model.revision % 2 != 0
  let u = if updated { 1.5 } else { 1.0 }
  let v = if updated { 0.25 } else { 0.0 }
  let xs = [0.0, 1.0, 2.0]
  let us = [[u, u, u], [u, u, u], [u, u, u]]
  let vs = [[v, v, v], [v, v, v], [v, v, v]]
  if styled {
    let shift = if updated { 5.0 } else { 0.0 }
    ignore(
      figure.streamplot_with_style_grids(
        xs,
        xs,
        us,
        vs,
        linewidths=[[1.0, 2.0, 3.0], [1.0, 2.0, 3.0], [1.0, 2.0, 3.0]],
        color_values=[
          [shift, shift + 1.0, shift + 2.0],
          [shift, shift + 1.0, shift + 2.0],
          [shift, shift + 1.0, shift + 2.0],
        ],
        vmin=0.0,
        vmax=2.0,
        density=0.2,
        max_steps=6,
        minlength=0.01,
        maxlength=1.0,
        start_points=[@plot.point(2.0, 1.0), @plot.point(0.25, 1.0)],
        integration_direction="forward",
        broken_streamlines=false,
        arrows=true,
        num_arrows=1,
        arrowstyle="->",
        label="Styled flow",
      ),
    )
  } else {
    ignore(
      figure.streamplot(
        xs,
        xs,
        us,
        vs,
        density=0.2,
        max_steps=6,
        minlength=0.01,
        maxlength=1.0,
        start_points=[@plot.point(0.25, 0.5), @plot.point(0.25, 1.5)],
        integration_direction="forward",
        broken_streamlines=false,
        arrows=true,
        num_arrows=1,
        arrowstyle="-|>",
        label="Flow samples",
      ),
    )
  }
  figure.to_drawing()
}

///|
fn streamplot_consumer_view(
  model : Model,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let body = make_streamplot_drawing(model, false)
  let styled = make_streamplot_drawing(model, true)
  let a = body.targets()[0].bounds
  let b = styled.targets()[0].bounds
  let attrs = @html.Attrs::build()
    .data_set("seed", "-1")
    .data_set("edge", "-1")
    .data_set("body-left", a.0.to_string())
    .data_set("body-top", a.1.to_string())
    .data_set("body-width", a.2.to_string())
    .data_set("body-height", a.3.to_string())
    .data_set("style-left", b.0.to_string())
    .data_set("style-top", b.1.to_string())
    .data_set("style-width", b.2.to_string())
    .data_set("style-height", b.3.to_string())
  if model.streamplot_hover is Some(point) {
    if body.hit_info(point) is Some(info) {
      if info.streamplot is Some(sample) {
        ignore(attrs.data_set("seed", sample.seed_index.to_string()))
        ignore(attrs.data_set("edge", point.point_index.to_string()))
        ignore(attrs.data_set("artist", point.artist_index.to_string()))
        ignore(attrs.data_set("u", sample.u.to_string()))
        ignore(attrs.data_set("v", sample.v.to_string()))
        ignore(attrs.data_set("value", info.value.to_string()))
        ignore(
          attrs.data_set(
            "color-present",
            (sample.color_value is Some(_)).to_string(),
          ),
        )
      }
    }
  }
  @html.div(id="streamplot-consumer", attrs~, [
    @plot_dom.view(
      body,
      id="release-streamplot",
      on_event=e => emit(Streamplot(e)),
      hovered?=model.streamplot_hover,
    ),
    @plot_dom.view(
      styled,
      id="release-streamplot-style",
      on_event=e => emit(StreamplotStyle(e)),
      hovered?=model.streamplot_style_hover,
      hit_mode=@drawing.HitMode::XNearest,
      hit_radius=1.0,
      tooltip=info => {
        let sample = info.streamplot.unwrap()
        let color = sample.color_value.unwrap()
        @html.b(
          attrs=@html.Attrs::build()
            .data_set("testid", "consumer-streamplot-tooltip")
            .data_set(
              "kind",
              (info.kind == @drawing.HitKind::Streamplot).to_string(),
            )
            .data_set("seed", sample.seed_index.to_string())
            .data_set("edge", info.point.point_index.to_string())
            .data_set("artist", info.point.artist_index.to_string())
            .data_set("u", sample.u.to_string())
            .data_set("v", sample.v.to_string())
            .data_set("color", color.to_string())
            .data_set("value", info.value.to_string()),
          "采样 U \{sample.u}；V \{sample.v}；颜色 \{color}",
        )
      },
    ),
  ])
}
