///|
fn make_polar_bars_consumer_figure(
  model : Model,
  clockwise : Bool,
) -> @plot.Figure raise {
  let pi = 3.141592653589793
  let figure = @plot.figure(width=400, height=280)
  let polar = figure.add_polar_axes(0.12, 0.17, 0.76, 0.66)
  polar.legend([])
  polar.set_title(if clockwise { "Clockwise petals" } else { "Rose petals" })
  polar.set_radius_max(1.0)
  if clockwise {
    polar.set_theta_offset(pi / 2.0)
    polar.set_direction(@plot.PolarDirection::Clockwise)
  }
  polar.bar(
    [0.0, pi / 2.0, pi, 3.0 * pi / 2.0],
    if model.revision % 2 == 0 {
      [0.6, 0.8, 1.4, 0.0]
    } else {
      [0.7, 0.5, 1.6, 0.0]
    },
    width=pi / 3.0,
    color=if clockwise { "#a76a42" } else { "#398575" },
    label=if clockwise { "Clockwise petals" } else { "Rose petals" },
  )
  figure
}

///|
fn polar_bars_consumer_view(
  model : Model,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let field = make_polar_bars_consumer_figure(model, false)
  let rose = make_polar_bars_consumer_figure(model, true)
  let a = field.to_drawing()
  let b = rose.to_drawing()
  let attrs = @html.Attrs::build().data_set(
    "revision",
    model.revision.to_string(),
  )
  polar_consumer_attrs(attrs, "bars", field, a)
  polar_consumer_attrs(attrs, "rose", rose, b)
  polar_consumer_state_attrs(
    attrs,
    "bars",
    a,
    model.polar_bar_hover,
    model.polar_bar_selected,
  )
  polar_consumer_state_attrs(
    attrs,
    "rose",
    b,
    model.rose_hover,
    model.rose_selected,
  )
  @html.div(id="polar-bars-consumer", attrs~, [
    @plot_dom.view(
      a,
      id="release-polar-bars",
      on_event=e => emit(PolarBar(e)),
      hovered?=model.polar_bar_hover,
      selected?=model.polar_bar_selected,
      hit_radius=10000.0,
    ),
    @plot_dom.view(
      b,
      id="release-rose",
      on_event=e => emit(Rose(e)),
      hovered?=model.rose_hover,
      selected?=model.rose_selected,
      hit_mode=@drawing.HitMode::XNearest,
      hit_radius=10000.0,
      tooltip=info => {
        @html.b(
          attrs=@html.Attrs::build()
            .data_set("testid", "consumer-rose-tooltip")
            .data_set(
              "polar-bar",
              (info.kind == @drawing.HitKind::PolarBar).to_string(),
            )
            .data_set("theta", info.point.data_x.to_string())
            .data_set("radius", info.point.data_y.to_string()),
          "原角度 \{info.point.data_x} rad；半径 \{info.value} 单位",
        )
      },
    ),
  ])
}
