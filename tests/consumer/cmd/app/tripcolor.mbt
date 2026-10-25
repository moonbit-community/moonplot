///|
fn make_tripcolor_drawing(model : Model, mean : Bool) -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=300)
  figure.legend([])
  figure.axes().set_axis_off()
  figure.set_x_limits(-0.25, 2.25)
  figure.set_y_limits(-0.25, 2.25)
  let xs = [0.0, 2.0, 2.0, 0.0, 1.0]
  let ys = [0.0, 0.0, 2.0, 2.0, 1.0]
  let triangles = [[0, 1, 4], [1, 2, 4], [2, 3, 4], [3, 0, 4]]
  if mean {
    let shift = if model.revision % 2 == 0 { 0.0 } else { 3.0 }
    let mesh = @scene.triangulation(xs, ys, triangles~)
    figure.tripcolor_triangulation(
      mesh,
      [shift, 3.0 + shift, 6.0 + shift, 9.0 + shift, 12.0 + shift],
      vmin=0.0,
      vmax=12.0,
      label="Vertex arithmetic means",
    )
  } else {
    let shift = if model.revision % 2 == 0 { 0.0 } else { 5.0 }
    figure.tripcolor(
      xs,
      ys,
      triangles,
      [10.0 + shift, 20.0 + shift, 30.0 + shift, 40.0 + shift],
      mask=[false, true, false, false],
      vmin=0.0,
      vmax=40.0,
      label="Face scalars",
    )
  }
  figure.to_drawing()
}

///|
fn tripcolor_consumer_view(
  model : Model,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let face = make_tripcolor_drawing(model, false)
  let mean = make_tripcolor_drawing(model, true)
  let a = face.targets()[0].bounds
  let b = mean.targets()[0].bounds
  let attrs = @html.Attrs::build()
    .data_set(
      "face",
      model.tripcolor_hover.map(p => p.point_index).unwrap_or(-1).to_string(),
    )
    .data_set("face-left", a.0.to_string())
    .data_set("face-top", a.1.to_string())
    .data_set("face-width", a.2.to_string())
    .data_set("face-height", a.3.to_string())
    .data_set("mean-left", b.0.to_string())
    .data_set("mean-top", b.1.to_string())
    .data_set("mean-width", b.2.to_string())
    .data_set("mean-height", b.3.to_string())
  if model.tripcolor_hover is Some(point) {
    if face.hit_info(point) is Some(info) {
      if info.tricolor is Some(typed) {
        let (a, b, c) = typed.vertices
        ignore(attrs.data_set("face-vertices", "\{a},\{b},\{c}"))
        ignore(
          attrs.data_set("face-vertex-mean", typed.vertex_mean.to_string()),
        )
        ignore(attrs.data_set("face-value", info.value.to_string()))
      }
    }
  }
  @html.div(id="tripcolor-consumer", attrs~, [
    @plot_dom.view(
      face,
      id="release-tripcolor",
      on_event=e => emit(Tripcolor(e)),
      hovered?=model.tripcolor_hover,
    ),
    @plot_dom.view(
      mean,
      id="release-tripcolor-mean",
      on_event=e => emit(TripcolorMean(e)),
      hovered?=model.tripcolor_mean_hover,
      hit_mode=@drawing.HitMode::XNearest,
      tooltip=info => {
        let typed = info.tricolor.unwrap()
        let (a, b, c) = typed.vertices
        @html.b(
          attrs=@html.Attrs::build()
            .data_set("testid", "consumer-tripcolor-tooltip")
            .data_set(
              "tripcolor",
              (info.kind == @drawing.HitKind::Tripcolor).to_string(),
            )
            .data_set("face", info.point.point_index.to_string())
            .data_set("vertex-mean", typed.vertex_mean.to_string()),
          "顶点均值 \{info.value}；顶点 \{a},\{b},\{c}",
        )
      },
    ),
  ])
}
