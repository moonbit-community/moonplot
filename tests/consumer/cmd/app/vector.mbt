///|
fn make_vector_drawing(model : Model) -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=300)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.legend([])
  axes.set_x_limits(0.0, 8.0)
  axes.set_y_limits(0.0, 8.0)
  axes.quiver(
    [1.0, 3.0, 6.0],
    [1.0, 4.0, 6.0],
    [2.0 + model.revision.to_double(), 0.0, -2.0],
    [3.0, 0.0, -4.0],
    color="#0f766e",
    label="Velocity",
  )
  figure.to_drawing()
}

///|
fn vector_consumer_view(model : Model, emit : @rabbita.Emit[Msg]) -> @html.Html raise {
  @plot_dom.view(
    make_vector_drawing(model),
    id="release-vector",
    on_event=event => emit(Vector(event)),
    hovered?=model.vector_hover,
    hit_radius=1.0,
    tooltip=info => {
      let vector = info.vector.unwrap()
      @html.b(
        attrs=@html.Attrs::build()
          .data_set("testid", "consumer-vector-tooltip")
          .data_set("quiver", (info.kind == @drawing.HitKind::Quiver).to_string())
          .data_set("source-x", info.point.data_x.to_string())
          .data_set("source-y", info.point.data_y.to_string())
          .data_set("value", info.value.to_string()),
        "Vector \{info.point.point_index}: U=\{vector.u}; V=\{vector.v}",
      )
    },
  )
}
