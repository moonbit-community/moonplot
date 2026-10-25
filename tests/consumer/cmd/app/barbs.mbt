///|
fn make_barb_drawing(model : Model) -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=300)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.legend([])
  axes.set_x_limits(0.0, 8.0)
  axes.set_y_limits(0.0, 8.0)
  axes.barbs(
    [1.0, 3.0, 6.0],
    [1.0, 4.0, 6.0],
    [2.0 + model.revision.to_double(), 0.0, -2.0],
    [3.0, 0.0, -4.0],
    color="#9a6c3d",
    barb_length=0.75,
    label="Wind",
  )
  figure.to_drawing()
}

///|
fn make_barb_symbol_drawing() -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=400)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.legend([])
  axes.set_x_limits(0.0, 14.0)
  axes.set_y_limits(0.0, 14.0)
  axes.barbs_with_options(
    [5.0, 9.0, 10.0, 3.0],
    [3.0, 10.0, 2.0, 11.0],
    [6.5, -2.5, 0.1, 0.0],
    [0.0, 0.0, 0.2, 0.0],
    color="#5d7485",
    linewidth=0.0,
    barb_length=12.0,
    half_increment=0.5,
    full_increment=1.0,
    flag_increment=5.0,
    pivot="middle",
    label="Wind symbols",
  )
  figure.to_drawing()
}

///|
fn barb_consumer_tooltip(info : @drawing.HitInfo, testid : String) -> @html.Html {
  let vector = info.vector.unwrap()
  @html.b(
    attrs=@html.Attrs::build()
      .data_set("testid", testid)
      .data_set("barbs", (info.kind == @drawing.HitKind::Barbs).to_string())
      .data_set("source-x", info.point.data_x.to_string())
      .data_set("source-y", info.point.data_y.to_string())
      .data_set("artist", info.point.artist_index.to_string())
      .data_set("value", info.value.to_string()),
    "\{info.series} \{info.point.point_index}: U=\{vector.u}; V=\{vector.v}",
  )
}

///|
fn barb_consumer_view(model : Model, emit : @rabbita.Emit[Msg]) -> @html.Html raise {
  @html.div([
    @plot_dom.view(
      make_barb_drawing(model),
      id="release-barbs",
      on_event=event => emit(Barb(event)),
      hovered?=model.barb_hover,
      hit_radius=1.0,
      tooltip=info => barb_consumer_tooltip(info, "consumer-barbs-tooltip"),
    ),
    @plot_dom.view(
      make_barb_symbol_drawing(),
      id="release-barb-symbols",
      on_event=event => emit(BarbSymbol(event)),
      hovered?=model.barb_symbol_hover,
      hit_radius=1.0,
      tooltip=info => barb_consumer_tooltip(info, "consumer-barb-symbols-tooltip"),
    ),
  ])
}
