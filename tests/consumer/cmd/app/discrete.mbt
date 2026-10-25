///|
fn make_step_drawing(model : Model) -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=240)
  figure.legend([])
  figure.set_x_limits(0.0, 5.0)
  figure.set_y_limits(0.0, 8.0)
  let shift = model.revision.to_double()
  figure.step(
    [0.0, 2.0, 5.0],
    [2.0 + shift, 6.0 + shift, 4.0 + shift],
    where_="post",
    color="#3b786b",
    label="Steps",
  )
  figure.to_drawing()
}

///|
fn step_consumer_view(
  model : Model,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  @plot_dom.view(
    make_step_drawing(model),
    id="release-step",
    on_event=event => emit(Step(event)),
    hovered?=model.step_hover,
    tooltip=info => {
      let i = info.point.point_index
      let text = match info.interval {
        Some((a, b)) => "Step \{i}: \{info.value}; range=\{a}..\{b}"
        None => "Step \{i}: \{info.value}"
      }
      @html.b(
        attrs=@html.Attrs::build()
          .data_set("testid", "consumer-step-tooltip")
          .data_set("step", (info.kind == @drawing.HitKind::Step).to_string())
          .data_set("source-x", info.point.data_x.to_string())
          .data_set("source-y", info.point.data_y.to_string()),
        text,
      )
    },
  )
}

///|
fn make_stairs_drawing(model : Model) -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=240)
  figure.legend([])
  figure.set_x_limits(-3.0, 5.0)
  figure.set_y_limits(0.0, 4.0)
  figure.stairs(
    [3.0 + model.revision.to_double(), -2.0],
    edges=[0.0, 1.0, 4.0],
    orientation="horizontal",
    baseline=1.0,
    fill=true,
    color="#75a6b3",
    label="Intervals",
  )
  figure.to_drawing()
}

///|
fn stairs_consumer_view(
  model : Model,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  @plot_dom.view(
    make_stairs_drawing(model),
    id="release-stairs",
    on_event=event => emit(Stairs(event)),
    hovered?=model.stairs_hover,
    tooltip=info => {
      let (a, b) = info.interval.unwrap()
      let band = info.band.unwrap()
      @html.b(
        attrs=@html.Attrs::build()
          .data_set("testid", "consumer-stairs-tooltip")
          .data_set(
            "stairs",
            (info.kind == @drawing.HitKind::Stairs).to_string(),
          )
          .data_set("horizontal", band.horizontal.to_string()),
        "Stairs \{info.point.point_index}: \{info.value}; range=\{a}..\{b}; baseline=\{band.lower}",
      )
    },
  )
}

///|
fn make_ecdf_drawing() -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=240)
  figure.legend([])
  figure.set_x_limits(-0.1, 1.1)
  figure.set_y_limits(0.0, 5.0)
  ignore(
    figure.ecdf(
      [4.0, 1.0, 1.0, 3.0],
      weights=[2.0, 1.0, 2.0, 3.0],
      horizontal=true,
      complementary=true,
      compress=true,
      color="#926c54",
      label="Weighted cumulative",
    ),
  )
  figure.to_drawing()
}

///|
fn ecdf_consumer_view(
  model : Model,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  @plot_dom.view(
    make_ecdf_drawing(),
    id="release-ecdf",
    on_event=event => emit(Ecdf(event)),
    hovered?=model.ecdf_hover,
    tooltip=info => {
      let band = info.band.unwrap()
      @html.b(
        attrs=@html.Attrs::build()
          .data_set("testid", "consumer-ecdf-tooltip")
          .data_set("ecdf", (info.kind == @drawing.HitKind::Ecdf).to_string())
          .data_set("horizontal", band.horizontal.to_string())
          .data_set("source-x", info.point.data_x.to_string())
          .data_set("source-y", info.point.data_y.to_string()),
        "ECDF \{info.point.point_index}: \{info.value}; probability=\{info.fraction.unwrap()}; jump=\{band.lower}..\{band.upper}",
      )
    },
  )
}
