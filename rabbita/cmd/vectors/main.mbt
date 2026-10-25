///|
struct ChartState {
  hover : @drawing.HitPoint?
  selected : @drawing.HitPoint?
  clicks : Int32
} derive(Eq)

///|
struct Model {
  charts : Array[ChartState]
  visible : Array[Bool]
  revision : Int32
  mounted : Bool
  focused : Bool
  band_visible : Bool
} derive(Eq)

///|
enum Msg {
  Chart(Int32, @plot_dom.Interaction)
  Update
  Mount
  Focus
}

///|
fn cleared(state : ChartState) -> ChartState {
  { ..state, hover: None, selected: None, }
}

///|
fn clear_chart(model : Model, index : Int32) -> Array[ChartState] {
  let charts = model.charts.copy()
  charts[index] = cleared(charts[index])
  charts
}

///|
fn update(model : Model, message : Msg) -> Model {
  match message {
    Update =>
      {
        ..model,
        charts: model.charts.map(cleared),
        revision: model.revision + 1,
      }
    Mount =>
      { ..model, charts: model.charts.map(cleared), mounted: !model.mounted, }
    Focus =>
      { ..model, charts: clear_chart(model, 0), focused: !model.focused, }
    Chart(1, ToggleSeries("band")) =>
      {
        ..model,
        charts: clear_chart(model, 1),
        band_visible: !model.band_visible,
      }
    Chart(index, ToggleSeries(_)) => {
      let visible = model.visible.copy()
      visible[index] = !visible[index]
      { ..model, charts: clear_chart(model, index), visible, }
    }
    Chart(index, event) => {
      let charts = model.charts.copy()
      let old = charts[index]
      charts[index] = match event {
        Hover(point) => { ..old, hover: point, }
        Click(point) =>
          {
            ..old,
            selected: point,
            clicks: old.clicks + (if point is Some(_) { 1 } else { 0 }),
          }
        ToggleSeries(_) => old
      }
      { ..model, charts, }
    }
  }
}

///|
fn xs() -> Array[Double] {
  [1.0, 3.0, 7.0, 1.0]
}

///|
fn ys() -> Array[Double] {
  [1.0, 2.0, 6.0, 7.0]
}

///|
fn us(changed : Bool) -> Array[Double] {
  if changed {
    [3.0, 0.0, -2.0, 1.0]
  } else {
    [2.0, 0.0, -3.0, 2.0]
  }
}

///|
fn vs(changed : Bool) -> Array[Double] {
  if changed {
    [2.0, 0.0, -3.0, -3.0]
  } else {
    [3.0, 0.0, -2.0, -2.0]
  }
}

///|
fn colors() -> Array[String] {
  ["#398575", "#8a70b5"]
}

///|
fn series_names() -> Array[String] {
  ["Measured vectors", "Context vectors"]
}

///|
fn chart_drawing(model : Model, index : Int32) -> @drawing.Drawing raise {
  let fig = @plot.figure(width=560, height=400)
  fig.legend([])
  fig.grid(axis="both", color="#e9edf1", linewidth=0.7)
  for spine in fig.spines() {
    spine.set_color("#d8dfe5")
    spine.set_linewidth(0.7)
    if spine.side() is (Top | Right) {
      spine.set_visible(false)
    }
  }
  fig.set_x_limits(0.0, if index == 0 && model.focused { 4.5 } else { 8.0 })
  fig.set_y_limits(0.0, 8.0)
  fig.set_xticks(
    if index == 0 && model.focused {
      [0.0, 2.0, 4.0]
    } else {
      [0.0, 2.0, 4.0, 6.0, 8.0]
    },
  )
  fig.set_yticks([0.0, 2.0, 4.0, 6.0, 8.0])
  if index == 1 && model.band_visible {
    fig.fill_between(
      [0.0, 4.0, 8.0],
      [0.5, 0.5, 0.5],
      [7.5, 7.5, 7.5],
      color="#e6eaf1",
      label="Reference range",
    )
  }
  if model.visible[index] {
    let changed = model.revision % 2 == 1
    fig.quiver(
      xs(),
      ys(),
      us(changed),
      vs(changed),
      color=colors()[index],
      label=series_names()[index],
    )
  }
  fig.to_drawing()
}

///|
fn reading_row(label : String, value : String) -> @html.Html {
  @html.span(class="moonplot-coordinate", [
    @html.span(class="moonplot-coordinate-label", label),
    @html.b(value),
  ])
}

///|
fn custom_tooltip(info : @drawing.HitInfo) -> @html.Html {
  if info.vector is Some(vector) {
    @html.div(class="vector-reading", [
      @html.b("向量分量"),
      reading_row("原位置", "\{info.point.data_x}, \{info.point.data_y}"),
      reading_row("横向 U", vector.u.to_string()),
      reading_row("纵向 V", vector.v.to_string()),
    ])
  } else {
    let rows = [@html.b("参考区域")]
    if info.band is Some(band) {
      rows.push(reading_row("范围", "\{band.lower} – \{band.upper}"))
    }
    @html.div(class="vector-reading", rows)
  }
}

///|
fn chart_card(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let ids = ["raw", "context"]
  let titles = ["Every direction has components", "Vectors in context"]
  let captions = [
    "Inspect the original position and both components.", "Read the same vectors against a reference area.",
  ]
  let id = "vector-" + ids[index]
  let state = model.charts[index]
  let drawing = chart_drawing(model, index)
  let summary = match state.selected {
    Some(point) =>
      match drawing.hit_info(point) {
        Some(info) =>
          "Selected: \{info.series} · \{info.point.data_x}, \{info.point.data_y}"
        None => "Selection updated."
      }
    None => "Click to keep a selection."
  }
  let attrs = @html.Attrs::build()
    .data_set("clicks", state.clicks.to_string())
    .data_set("hovered", (state.hover is Some(_)).to_string())
    .data_set("selected", (state.selected is Some(_)).to_string())
    .data_set("focused", (index == 0 && model.focused).to_string())
    .data_set("hit-mode", if index == 1 { "x-nearest" } else { "nearest" })
  let counts = [ for _ in 0..<4 => 0 ]
  for target in drawing.targets() {
    if target.info.kind is Quiver && target.shape is Segment(_, _, _, _) {
      let source = target.info.point.point_index
      if source >= 0 && source < counts.length() {
        counts[source] += 1
      }
    }
  }
  for source in 0..<counts.length() {
    ignore(attrs.data_set("segments-\{source}", counts[source].to_string()))
  }
  if state.hover is Some(point) {
    ignore(attrs.data_set("point", point.point_index.to_string()))
    ignore(attrs.data_set("artist", point.artist_index.to_string()))
    ignore(attrs.data_set("data-x", point.data_x.to_string()))
    ignore(attrs.data_set("data-y", point.data_y.to_string()))
    if drawing.hit_info(point) is Some(info) {
      ignore(
        attrs.data_set(
          "kind",
          if info.kind is Quiver {
            "quiver"
          } else {
            "area"
          },
        ),
      )
      ignore(attrs.data_set("series", info.series))
      ignore(attrs.data_set("value", info.value.to_string()))
      ignore(
        attrs.data_set("vector-present", (info.vector is Some(_)).to_string()),
      )
      ignore(
        attrs.data_set(
          "interval-present",
          (info.interval is Some(_)).to_string(),
        ),
      )
      ignore(
        attrs.data_set(
          "fraction-present",
          (info.fraction is Some(_)).to_string(),
        ),
      )
      ignore(attrs.data_set("band-present", (info.band is Some(_)).to_string()))
      if info.vector is Some(vector) {
        ignore(attrs.data_set("u", vector.u.to_string()))
        ignore(attrs.data_set("v", vector.v.to_string()))
        let source = point.point_index
        if source >= 0 && source < xs().length() {
          let changed = model.revision % 2 == 1
          ignore(attrs.data_set("expected-x", xs()[source].to_string()))
          ignore(attrs.data_set("expected-y", ys()[source].to_string()))
          ignore(attrs.data_set("expected-u", us(changed)[source].to_string()))
          ignore(attrs.data_set("expected-v", vs(changed)[source].to_string()))
          ignore(attrs.data_set("expected-series", series_names()[index]))
        }
      }
    }
  }
  let legend = [
    @plot_dom.legend_item(
      "vectors",
      series_names()[index],
      colors()[index],
      model.visible[index],
    ),
  ]
  if index == 1 {
    legend.push(
      @plot_dom.legend_item(
        "band",
        "Reference range",
        "#e6eaf1",
        model.band_visible,
      ),
    )
  }
  @html.div(class="chart-card", [
    @html.div(class="chart-heading", [
      @html.div([
        @html.h2(titles[index]),
        @html.p(class="chart-caption", captions[index]),
      ]),
      @html.span(class="chart-unit", "Components"),
    ]),
    @html.div(
      class="chart-options",
      if index == 0 {
        [
          @html.button(
            id="vectors-focus",
            class="button button-quiet",
            on_click=emit(Focus),
            if model.focused {
              "Focus area"
            } else {
              "Full area"
            },
          ),
        ]
      } else {
        [@html.span(class="chart-option-note", "Vectors and reference range")]
      },
    ),
    @plot_dom.view(
      drawing,
      id~,
      on_event=event => emit(Chart(index, event)),
      hovered?=state.hover,
      selected?=state.selected,
      hit_radius=2.0,
      hit_mode=if index == 1 { XNearest } else { Nearest },
      tooltip?=if index == 0 { None } else { Some(custom_tooltip) },
      tooltip_class=if index == 0 { "" } else { "vector-tooltip" },
      legend~,
    ),
    @html.div(class="chart-footer", [
      @html.div(id=id + "-status", class="selection-summary", attrs~, summary),
    ]),
  ])
}

///|
fn content(model : Model, emit : @rabbita.Emit[Msg]) -> @html.Html raise {
  @html.div([
    @html.div(class="controls", [
      @html.span(
        id="vectors-revision",
        class="data-version",
        "Revision \{model.revision}",
      ),
      @html.div(class="control-actions", [
        @html.button(
          id="vectors-mount",
          class="button",
          on_click=emit(Mount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="vectors-update",
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
      @html.div(id="vectors-unmounted", "Charts are paused.")
    },
  ])
}

///|
fn main {
  @rabbita.new(() => {
    let initial : Model = {
      charts: [
        for _ in 0..<2 => { hover: None, selected: None, clicks: 0, }
      ],
      visible: [true, true],
      revision: 0,
      mounted: true,
      focused: false,
      band_visible: true,
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="vectors-error", "Chart error: \{error}")
      }
    })
  }).mount("app")
}
