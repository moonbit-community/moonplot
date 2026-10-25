///|
fn make_contour_drawing(
  model : Model,
  triangular : Bool,
) -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=300)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.legend([])
  let shift = model.revision.to_double()
  if triangular {
    axes.set_x_limits(0.2, 0.6)
    axes.set_y_limits(0.0, 1.0)
    ignore(
      axes.tricontour(
        [0.0, 2.0, 0.0],
        [0.0, 0.0, 2.0],
        [[0, 1, 2]],
        [shift, 2.0 + shift, 2.0 + shift],
        levels=[1.0 + shift],
        color="#8f5c87",
        label="Mesh",
      ),
    )
  } else {
    axes.set_x_limits(10.0, 40.0)
    axes.set_y_limits(-3.0, 8.0)
    let contours = axes.contour(
      [
        [shift, 1.0 + shift, 2.0 + shift],
        [1.0 + shift, 2.0 + shift, 3.0 + shift],
        [2.0 + shift, 3.0 + shift, 4.0 + shift],
      ],
      x=[10.0, 20.0, 40.0],
      y=[-3.0, 1.0, 8.0],
      levels=[0.5 + shift, 1.5 + shift, 2.5 + shift],
      color="#226688",
      label="Field",
    )
    axes.clabel(contours)
  }
  figure.to_drawing()
}

///|
fn contour_consumer_view(
  model : Model,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  @html.div([
    @plot_dom.view(
      make_contour_drawing(model, false),
      id="release-contours",
      on_event=event => emit(Contour(event)),
      hovered?=model.contour_hover,
      hit_radius=2.0,
    ),
    @plot_dom.view(
      make_contour_drawing(model, true),
      id="release-tricontours",
      on_event=event => emit(TriContour(event)),
      hovered?=model.tricontour_hover,
      hit_mode=@drawing.HitMode::XNearest,
      hit_radius=2.0,
      tooltip=info => {
        @html.b(
          attrs=@html.Attrs::build()
            .data_set("testid", "consumer-contour-tooltip")
            .data_set(
              "contour",
              (info.kind == @drawing.HitKind::Contour).to_string(),
            )
            .data_set("path", info.point.point_index.to_string())
            .data_set("midpoint-x", info.point.data_x.to_string())
            .data_set("midpoint-y", info.point.data_y.to_string()),
          "\{info.series}: Level \{info.value}",
        )
      },
    ),
  ])
}
