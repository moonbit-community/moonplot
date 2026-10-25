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
