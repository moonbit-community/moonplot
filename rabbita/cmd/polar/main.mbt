///|
struct Model {
  visible : Array[Array[Bool]]
  revision : Int32
  mounted : Bool
  clockwise : Bool
  hover_events : Array[Int32]
  click_events : Array[Int32]
  unexpected_hovers : Array[Int32]
  unexpected_clicks : Array[Int32]
} derive(Eq)

///|
enum Msg {
  Chart(Int32, @plot_dom.Interaction)
  Update
  Mount
  Direction
}

///|
fn update(model : Model, message : Msg) -> Model {
  match message {
    Update => { ..model, revision: model.revision + 1, }
    Mount => { ..model, mounted: !model.mounted, }
    Direction => { ..model, clockwise: !model.clockwise, }
    Chart(index, ToggleSeries(key)) => {
      let visible = model.visible.copy()
      visible[index] = visible[index].copy()
      let series = if key == "spiral" || key == "baseline" { 0 } else { 1 }
      visible[index][series] = !visible[index][series]
      { ..model, visible, }
    }
    Chart(index, Hover(point)) => {
      let hover_events = model.hover_events.copy()
      hover_events[index] += 1
      let unexpected_hovers = model.unexpected_hovers.copy()
      if point is Some(_) {
        unexpected_hovers[index] += 1
      }
      { ..model, hover_events, unexpected_hovers, }
    }
    Chart(index, Click(point)) => {
      let click_events = model.click_events.copy()
      click_events[index] += 1
      let unexpected_clicks = model.unexpected_clicks.copy()
      if point is Some(_) {
        unexpected_clicks[index] += 1
      }
      { ..model, click_events, unexpected_clicks, }
    }
  }
}

///|
fn pi() -> Double {
  3.141592653589793
}

///|
fn series_keys(index : Int32) -> Array[String] {
  if index == 0 {
    ["spiral", "samples"]
  } else {
    ["baseline", "current"]
  }
}

///|
fn series_names(index : Int32) -> Array[String] {
  if index == 0 {
    ["Spiral", "Samples"]
  } else {
    ["Baseline", "Current"]
  }
}

///|
fn series_colors(index : Int32) -> Array[String] {
  if index == 0 {
    ["#398575", "#d29b53"]
  } else {
    ["#8a9db1", "#398575"]
  }
}

///|
fn radar_labels() -> Array[String] {
  ["探索", "实现", "验证", "表达", "协作"]
}

///|
fn input_theta(model : Model, index : Int32, series : Int32) -> Array[Double] {
  if index == 0 {
    if series == 0 {
      [
        for i in 0..<=48 => {
          Double::from_int(i) * pi() / 16.0 +
          (if model.revision % 2 == 0 { 0.0 } else { pi() / 6.0 })
        }
      ]
    } else {
      [0.0, pi() / 2.0, pi(), 3.0 * pi() / 2.0, pi() / 4.0]
    }
  } else {
    [
      for i in 0..<5 => 2.0 * pi() * Double::from_int(i) / 5.0
    ]
  }
}

///|
fn input_radius(model : Model, index : Int32, series : Int32) -> Array[Double] {
  if index == 0 {
    if series == 0 {
      [
        for i in 0..<=48 => {
          if model.revision % 2 == 0 {
            0.15 + 0.85 * Double::from_int(i) / 48.0
          } else {
            0.10 + 0.75 * Double::from_int(i) / 48.0
          }
        }
      ]
    } else if model.revision % 2 == 0 {
      [0.4, 0.65, 0.8, 1.0, 1.2]
    } else {
      [0.55, 0.7, 0.45, 0.85, 1.2]
    }
  } else if series == 0 {
    if model.revision % 2 == 0 {
      [70.0, 85.0, 60.0, 90.0, 75.0]
    } else {
      [75.0, 80.0, 65.0, 85.0, 78.0]
    }
  } else if model.revision % 2 == 0 {
    [82.0, 68.0, 88.0, 72.0, 92.0]
  } else {
    [88.0, 74.0, 92.0, 78.0, 85.0]
  }
}

///|
fn chart_frame(model : Model, index : Int32) -> (@drawing.Drawing, Bool) raise {
  let fig = @plot.figure(width=460, height=320)
  fig.axes().set_axis_off()
  let panel = fig.add_polar_axes(0.08, 0.1, 0.84, 0.78)
  panel.legend([])
  panel.set_radius_max(if index == 0 { 1.0 } else { 100.0 })
  panel.set_theta_offset(if index == 0 { 0.0 } else { pi() / 2.0 })
  panel.set_direction(
    if index == 1 || model.clockwise {
      @plot.PolarDirection::Clockwise
    } else {
      @plot.PolarDirection::CounterClockwise
    },
  )
  if index == 0 {
    panel.set_title("A sampled spiral")
    panel.set_theta_ticks([0.0, pi() / 2.0, pi(), 3.0 * pi() / 2.0], labels=[
      "0", "π/2", "π", "3π/2",
    ])
    panel.set_radius_ticks([0.25, 0.5, 0.75, 1.0], labels=[
      "0.25", "0.5", "0.75", "1",
    ])
    if model.visible[index][0] {
      panel.plot(
        input_theta(model, index, 0),
        input_radius(model, index, 0),
        color=series_colors(index)[0],
        linewidth=2.0,
        label=series_names(index)[0],
      )
    }
    if model.visible[index][1] {
      panel.scatter(
        input_theta(model, index, 1),
        input_radius(model, index, 1),
        color=series_colors(index)[1],
        size=5.0,
        label=series_names(index)[1],
      )
    }
  } else {
    panel.set_title("Shared scale")
    panel.set_theta_ticks(input_theta(model, index, 0), labels=radar_labels())
    panel.set_radius_ticks([20.0, 40.0, 60.0, 80.0, 100.0], labels=[
      "20", "40", "60", "80", "100",
    ])
    for series in 0..<2 {
      if model.visible[index][series] {
        panel.radar(
          input_radius(model, index, series),
          radar_labels(),
          color=series_colors(index)[series],
          linewidth=2.0,
          label=series_names(index)[series],
        )
      }
    }
  }
  let drawing = fig.to_drawing()
  (drawing, drawing.svg() == fig.to_svg_checked())
}

///|
fn int_attr(attrs : @html.Attrs, key : String, value : Int32) -> Unit {
  ignore(attrs.data_set(key, value.to_string()))
}

///|
fn double_attr(attrs : @html.Attrs, key : String, value : Double) -> Unit {
  ignore(attrs.data_set(key, value.to_string()))
}

///|
fn source_attrs(attrs : @html.Attrs, model : Model, index : Int32) -> Unit {
  double_attr(attrs, "radius-max", if index == 0 { 1.0 } else { 100.0 })
  double_attr(attrs, "theta-offset", if index == 0 { 0.0 } else { pi() / 2.0 })
  ignore(
    attrs.data_set(
      "direction",
      if index == 1 || model.clockwise {
        "clockwise"
      } else {
        "counterclockwise"
      },
    ),
  )
  for series in 0..<2 {
    let prefix = "source-\{series}-"
    let theta = input_theta(model, index, series)
    let radius = input_radius(model, index, series)
    ignore(
      attrs.data_set(
        prefix + "visible",
        model.visible[index][series].to_string(),
      ),
    )
    ignore(attrs.data_set(prefix + "name", series_names(index)[series]))
    ignore(attrs.data_set(prefix + "color", series_colors(index)[series]))
    ignore(
      attrs.data_set(
        prefix + "geometry",
        if index == 0 && series == 1 {
          "scatter"
        } else {
          "line"
        },
      ),
    )
    ignore(attrs.data_set(prefix + "closed", (index == 1).to_string()))
    int_attr(attrs, prefix + "count", theta.length())
    for i, angle in theta {
      double_attr(attrs, prefix + "point-\{i}-theta", angle)
      double_attr(attrs, prefix + "point-\{i}-radius", radius[i])
    }
  }
}

///|
fn chart_card(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let id = if index == 0 { "polar-spiral" } else { "polar-radar" }
  let (drawing, normal_equal) = chart_frame(model, index)
  let attrs = @html.Attrs::build()
    .data_set("revision", model.revision.to_string())
    .data_set("normal-equal", normal_equal.to_string())
    .data_set("hit-mode", if index == 0 { "nearest" } else { "x-nearest" })
  int_attr(attrs, "point-count", drawing.points().length())
  int_attr(attrs, "target-count", drawing.targets().length())
  int_attr(attrs, "hover-events", model.hover_events[index])
  int_attr(attrs, "click-events", model.click_events[index])
  int_attr(attrs, "unexpected-hovers", model.unexpected_hovers[index])
  int_attr(attrs, "unexpected-clicks", model.unexpected_clicks[index])
  source_attrs(attrs, model, index)
  @html.div(class="chart-card", [
    @html.div(class="chart-heading", [
      @html.div([
        @html.h2(
          if index == 0 {
            "A spiral, sampled"
          } else {
            "Five perspectives"
          },
        ),
        @html.p(
          class="chart-caption",
          if index == 0 {
            "Two ways to describe the same circle."
          } else {
            "Two profiles share one scale."
          },
        ),
      ]),
      @html.span(
        class="chart-unit",
        if index == 0 {
          "r ≤ 1"
        } else {
          "0–100"
        },
      ),
    ]),
    @html.div(
      class="chart-options",
      if index == 0 {
        [
          @html.button(
            id="polar-direction",
            class="button button-quiet",
            on_click=emit(Direction),
            if model.clockwise {
              "Direction: clockwise"
            } else {
              "Direction: counterclockwise"
            },
          ),
        ]
      } else {
        [@html.span(class="polar-note", "Top zero · Clockwise")]
      },
    ),
    @plot_dom.view(
      drawing,
      id~,
      on_event=event => emit(Chart(index, event)),
      hit_mode=if index == 0 { Nearest } else { XNearest },
      hit_radius=300.0,
      legend=[
        for series in 0..<2 => {
          @plot_dom.legend_item(
            series_keys(index)[series],
            series_names(index)[series],
            series_colors(index)[series],
            model.visible[index][series],
          )
        }
      ],
    ),
    @html.div(class="chart-footer", [
      @html.div(
        id=id + "-status",
        class="selection-summary",
        attrs~,
        if index == 0 {
          "Spiral and samples"
        } else {
          "A shared 0–100 scale"
        },
      ),
    ]),
  ])
}

///|
fn content(model : Model, emit : @rabbita.Emit[Msg]) -> @html.Html raise {
  @html.div([
    @html.div(class="controls", [
      @html.span(
        id="polar-revision",
        class="data-version",
        "Revision \{model.revision}",
      ),
      @html.div(class="control-actions", [
        @html.button(
          id="polar-mount",
          class="button",
          on_click=emit(Mount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="polar-update",
          class="button button-primary",
          on_click=emit(Update),
          "Update data",
        ),
      ]),
    ]),
    if model.mounted {
      @html.div(
        class="charts",
        [
          for index in 0..<2 => chart_card(model, index, emit)
        ],
      )
    } else {
      @html.div(id="polar-unmounted", "Charts are paused.")
    },
  ])
}

///|
fn main {
  @rabbita.new(() => {
    let initial : Model = {
      visible: [[true, true], [true, true]],
      revision: 0,
      mounted: true,
      clockwise: false,
      hover_events: [0, 0],
      click_events: [0, 0],
      unexpected_hovers: [0, 0],
      unexpected_clicks: [0, 0],
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="polar-error", "Chart error: \{error}")
      }
    })
  }).mount("app")
}
