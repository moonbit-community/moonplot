///|
fn make_polar_consumer_figure(
  model : Model,
  radar : Bool,
) -> @plot.Figure raise {
  let pi = 3.141592653589793
  let figure = @plot.figure(width=400, height=280)
  let polar = figure.add_polar_axes(0.12, 0.17, 0.76, 0.66)
  polar.legend([])
  let updated = model.revision % 2 != 0
  if radar {
    polar.set_radius_max(100.0)
    polar.set_theta_offset(pi / 2.0)
    polar.set_direction(@plot.PolarDirection::Clockwise)
    let categories = ["速度", "质量", "覆盖", "稳定", "效率"]
    polar.radar(
      if updated {
        [75.0, 50.0, 90.0, 60.0, 85.0]
      } else {
        [70.0, 55.0, 80.0, 65.0, 75.0]
      },
      categories,
      color="#398575",
      label="Current",
    )
    polar.radar(
      [55.0, 70.0, 60.0, 85.0, 65.0],
      categories,
      color="#a76a42",
      label="Reference",
    )
  } else {
    polar.set_radius_max(1.0)
    polar.set_theta_ticks([0.0, pi / 2.0, pi, 3.0 * pi / 2.0], labels=[
      "East", "North", "West", "South",
    ])
    polar.set_radius_ticks([0.25, 0.5, 0.75, 1.0])
    polar.plot(
      [0.0, pi / 6.0, pi / 2.0, pi, 3.0 * pi / 2.0],
      if updated {
        [0.5, 0.6, 0.7, 0.9, 0.65]
      } else {
        [0.35, 0.7, 0.85, 0.55, 0.9]
      },
      color="#6b4b9a",
      linewidth=2.0,
      label="Polar radius",
    )
    polar.scatter(
      [0.0, pi / 2.0, pi / 4.0],
      [0.5, 0.75, 1.3],
      color="#bd7145",
      size=4.0,
      label="Samples",
    )
  }
  figure
}

///|
fn polar_consumer_attrs(
  attrs : @html.Attrs,
  prefix : String,
  figure : @plot.Figure,
  frame : @drawing.Drawing,
) -> Unit {
  ignore(
    attrs.data_set(prefix + "-points", frame.points().length().to_string()),
  )
  ignore(
    attrs.data_set(prefix + "-targets", frame.targets().length().to_string()),
  )
  let artists = figure.axes_list()[0].artists()
  ignore(attrs.data_set(prefix + "-artists", artists.length().to_string()))
  for i, artist in artists {
    match artist {
      @plot.Artist::Line(points, _)
      | @plot.Artist::Scatter(points, _)
      | @plot.Artist::Bar(points, _) => {
        ignore(
          attrs.data_set("\{prefix}-\{i}-count", points.length().to_string()),
        )
        for j, point in points {
          ignore(
            attrs.data_set("\{prefix}-\{i}-theta-\{j}", point.x().to_string()),
          )
          ignore(
            attrs.data_set("\{prefix}-\{i}-radius-\{j}", point.y().to_string()),
          )
        }
      }
      _ => ()
    }
  }
}

///|
fn polar_consumer_state_attrs(
  attrs : @html.Attrs,
  prefix : String,
  frame : @drawing.Drawing,
  hovered : @drawing.HitPoint?,
  selected : @drawing.HitPoint?,
) -> Unit {
  if frame.polar_circle(0) is Some((cx, cy, radius)) {
    ignore(attrs.data_set(prefix + "-cx", cx.to_string()))
    ignore(attrs.data_set(prefix + "-cy", cy.to_string()))
    ignore(attrs.data_set(prefix + "-disk-radius", radius.to_string()))
  }
  for entry in [("hover", hovered), ("selected", selected)] {
    let key = prefix + "-" + entry.0
    ignore(attrs.data_set(key, "-1"))
    if entry.1 is Some(point) {
      if frame.hit_info(point) is Some(info) {
        ignore(attrs.data_set(key, point.point_index.to_string()))
        ignore(attrs.data_set(key + "-artist", point.artist_index.to_string()))
        ignore(attrs.data_set(key + "-theta", point.data_x.to_string()))
        ignore(attrs.data_set(key + "-radius", point.data_y.to_string()))
        ignore(attrs.data_set(key + "-value", info.value.to_string()))
        ignore(attrs.data_set(key + "-series", info.series))
        ignore(
          attrs.data_set(
            key + "-polar-bar",
            (info.kind == @drawing.HitKind::PolarBar).to_string(),
          ),
        )
        ignore(attrs.data_set(key + "-category", info.category.unwrap_or("")))
        ignore(
          attrs.data_set(
            key + "-polar",
            (info.kind == @drawing.HitKind::Polar).to_string(),
          ),
        )
      }
    }
  }
}

///|
fn polar_consumer_view(
  model : Model,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let field = make_polar_consumer_figure(model, false)
  let radar = make_polar_consumer_figure(model, true)
  let a = field.to_drawing()
  let b = radar.to_drawing()
  let attrs = @html.Attrs::build().data_set(
    "revision",
    model.revision.to_string(),
  )
  polar_consumer_attrs(attrs, "field", field, a)
  polar_consumer_attrs(attrs, "radar", radar, b)
  polar_consumer_state_attrs(
    attrs,
    "field",
    a,
    model.polar_hover,
    model.polar_selected,
  )
  polar_consumer_state_attrs(
    attrs,
    "radar",
    b,
    model.radar_hover,
    model.radar_selected,
  )
  @html.div(id="polar-consumer", attrs~, [
    @plot_dom.view(
      a,
      id="release-polar",
      on_event=e => emit(Polar(e)),
      hovered?=model.polar_hover,
      selected?=model.polar_selected,
    ),
    @plot_dom.view(
      b,
      id="release-radar",
      on_event=e => emit(Radar(e)),
      hovered?=model.radar_hover,
      selected?=model.radar_selected,
      hit_mode=@drawing.HitMode::XNearest,
      tooltip=info => {
        @html.b(
          attrs=@html.Attrs::build()
            .data_set("testid", "consumer-radar-tooltip")
            .data_set("theta", info.point.data_x.to_string())
            .data_set("radius", info.point.data_y.to_string())
            .data_set("category", info.category.unwrap_or("")),
          "\{info.series} · \{info.category.unwrap_or("")}：\{info.value} 分；原角度 \{info.point.data_x} rad",
        )
      },
    ),
  ])
}
