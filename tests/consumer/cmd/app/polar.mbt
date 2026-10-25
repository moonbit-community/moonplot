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
      @plot.Artist::Line(points, _) | @plot.Artist::Scatter(points, _) => {
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
fn polar_consumer_view(model : Model) -> @html.Html raise {
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
  @html.div(id="polar-consumer", attrs~, [
    @plot_dom.view(a, id="release-polar", on_event=_ => @rabbita.none),
    @plot_dom.view(b, id="release-radar", on_event=_ => @rabbita.none),
  ])
}
