///|
fn make_stem_drawing(model : Model) -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=240)
  figure.legend([])
  figure.set_x_limits(-4.0, 12.0)
  figure.set_y_limits(0.0, 8.0)
  figure.stem(
    [4.0 + model.revision.to_double(), -2.0, 8.0],
    locs=[1.0, 3.0, 6.0],
    bottom=1.0,
    orientation="horizontal",
    color="#8d6a46",
    label="Impulses",
  )
  figure.to_drawing()
}

///|
fn stem_consumer_view(
  model : Model,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  @plot_dom.view(
    make_stem_drawing(model),
    id="release-stem",
    on_event=event => emit(Stem(event)),
    hovered?=model.stem_hover,
    tooltip=info => {
      let band = info.band.unwrap()
      @html.b(
        attrs=@html.Attrs::build()
          .data_set("testid", "consumer-stem-tooltip")
          .data_set("stem", (info.kind == @drawing.HitKind::Stem).to_string())
          .data_set("horizontal", band.horizontal.to_string())
          .data_set("source-x", info.point.data_x.to_string())
          .data_set("source-y", info.point.data_y.to_string()),
        "Stem \{info.point.point_index}: \{info.value}; baseline=\{band.lower}; horizontal=\{band.horizontal}",
      )
    },
  )
}
