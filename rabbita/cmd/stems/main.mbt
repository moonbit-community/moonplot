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
  clipped : Bool
  band_visible : Bool
} derive(Eq)

///|
enum Msg {
  Chart(Int32, @plot_dom.Interaction)
  Update
  Mount
  Clip
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
    Clip => { ..model, charts: clear_chart(model, 0), clipped: !model.clipped, }
    Chart(2, ToggleSeries("band")) =>
      {
        ..model,
        charts: clear_chart(model, 2),
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
fn locations() -> Array[Double] {
  [1.0, 2.0, 4.0, 7.0]
}

///|
fn heads(changed : Bool) -> Array[Double] {
  if changed {
    [3.0, 0.0 / 0.0, -2.0, 6.0]
  } else {
    [5.0, 0.0 / 0.0, -1.0, 7.0]
  }
}

///|
fn colors() -> Array[String] {
  ["#398575", "#4d79c7", "#8a70b5"]
}

///|
fn series_names() -> Array[String] {
  ["Sample response", "Horizontal response", "Measured response"]
}

///|
fn chart_drawing(model : Model, index : Int32) -> @drawing.Drawing raise {
  let fig = @plot.figure(width=560, height=400)
  fig.legend([])
  let horizontal = index == 1
  fig.grid(
    axis=if horizontal { "x" } else { "y" },
    color="#e9edf1",
    linewidth=0.7,
  )
  for spine in fig.spines() {
    spine.set_color("#d8dfe5")
    spine.set_linewidth(0.7)
    if spine.side() is (Top | Right) {
      spine.set_visible(false)
    }
  }
  if horizontal {
    fig.set_x_limits(-5.0, 11.0)
    fig.set_y_limits(0.0, 8.0)
    fig.set_yticks([1.0, 2.0, 4.0, 7.0])
  } else {
    fig.set_x_limits(0.0, 8.0)
    fig.set_y_limits(-5.0, if index == 0 && model.clipped { 6.0 } else { 11.0 })
    fig.set_xticks([1.0, 2.0, 4.0, 7.0])
  }
  if index == 2 && model.band_visible {
    fig.fill_between(
      [0.0, 1.0, 4.0, 7.0, 8.0],
      [-2.0, -2.0, -2.0, -2.0, -2.0],
      [6.0, 6.0, 6.0, 8.0, 8.0],
      color="#e6eaf1",
      label="Reference range",
    )
  }
  if model.visible[index] {
    fig.stem(
      heads(model.revision % 2 == 1),
      locs=locations(),
      bottom=1.0,
      orientation=if horizontal { "horizontal" } else { "vertical" },
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
  if info.kind is Stem {
    let location = if info.band is Some(band) && band.horizontal {
      info.point.data_y
    } else {
      info.point.data_x
    }
    let rows = [
      @html.b("采样读数"),
      reading_row("采样位置", location.to_string()),
      reading_row("原始值", "\{info.value} mV"),
    ]
    if info.band is Some(band) {
      rows.push(reading_row("基线", "\{band.lower} mV"))
    }
    @html.div(class="stem-reading", rows)
  } else {
    let rows = [@html.b("参考区间")]
    if info.band is Some(band) {
      rows.push(reading_row("范围", "\{band.lower} – \{band.upper} mV"))
    }
    @html.div(class="stem-reading", rows)
  }
}

///|
fn chart_card(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let ids = ["vertical", "horizontal", "band"]
  let titles = [
    "Above and below the baseline", "The same values, sideways", "Measurements in context",
  ]
  let captions = [
    "Inspect positive and negative sample values.", "Follow each horizontal stem to its original value.",
    "Explore measurements against a reference interval.",
  ]
  let id = "stem-" + ids[index]
  let state = model.charts[index]
  let drawing = chart_drawing(model, index)
  let summary = match state.selected {
    Some(point) =>
      match drawing.hit_info(point) {
        Some(info) => "Selected: \{info.series} · \{info.value}"
        None => "Selection updated."
      }
    None => "Click to keep a selection."
  }
  let attrs = @html.Attrs::build()
    .data_set("clicks", state.clicks.to_string())
    .data_set("hovered", (state.hover is Some(_)).to_string())
    .data_set("selected", (state.selected is Some(_)).to_string())
    .data_set("horizontal", (index == 1).to_string())
    .data_set("clipped", (index == 0 && model.clipped).to_string())
    .data_set("hit-mode", if index == 1 { "x-nearest" } else { "nearest" })
  for target in drawing.targets() {
    if target.info.kind is Stem {
      let point = target.info.point
      match target.shape {
        Point => {
          ignore(
            attrs.data_set(
              "head-\{point.point_index}-artist",
              point.artist_index.to_string(),
            ),
          )
          ignore(
            attrs.data_set(
              "head-\{point.point_index}-x",
              point.screen_x.to_string(),
            ),
          )
          ignore(
            attrs.data_set(
              "head-\{point.point_index}-y",
              point.screen_y.to_string(),
            ),
          )
        }
        Segment(x1, y1, x2, y2) => {
          ignore(
            attrs.data_set(
              "rod-\{point.point_index}-artist",
              point.artist_index.to_string(),
            ),
          )
          ignore(attrs.data_set("rod-\{point.point_index}-x1", x1.to_string()))
          ignore(attrs.data_set("rod-\{point.point_index}-y1", y1.to_string()))
          ignore(attrs.data_set("rod-\{point.point_index}-x2", x2.to_string()))
          ignore(attrs.data_set("rod-\{point.point_index}-y2", y2.to_string()))
        }
        _ => ()
      }
    }
  }
  if state.hover is Some(point) {
    ignore(attrs.data_set("point", point.point_index.to_string()))
    ignore(attrs.data_set("artist", point.artist_index.to_string()))
    ignore(attrs.data_set("data-x", point.data_x.to_string()))
    ignore(attrs.data_set("data-y", point.data_y.to_string()))
    if drawing.hit_info(point) is Some(info) {
      ignore(
        attrs.data_set("kind", if info.kind is Stem { "stem" } else { "area" }),
      )
      ignore(attrs.data_set("series", info.series))
      ignore(attrs.data_set("value", info.value.to_string()))
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
      if info.band is Some(band) {
        ignore(attrs.data_set("lower", band.lower.to_string()))
        ignore(attrs.data_set("upper", band.upper.to_string()))
        ignore(attrs.data_set("band-horizontal", band.horizontal.to_string()))
        ignore(attrs.data_set("stacked", band.stacked.to_string()))
      }
      let source_index = point.point_index
      if info.kind is Stem &&
        source_index >= 0 &&
        source_index < locations().length() {
        let head = heads(model.revision % 2 == 1)[source_index]
        let location = locations()[source_index]
        ignore(attrs.data_set("expected-value", head.to_string()))
        ignore(
          attrs.data_set(
            "expected-x",
            (if index == 1 { head } else { location }).to_string(),
          ),
        )
        ignore(
          attrs.data_set(
            "expected-y",
            (if index == 1 { location } else { head }).to_string(),
          ),
        )
        ignore(attrs.data_set("expected-lower", "1"))
        ignore(attrs.data_set("expected-series", series_names()[index]))
      }
    }
  }
  let legend = [
    @plot_dom.legend_item(
      "stem",
      series_names()[index],
      colors()[index],
      model.visible[index],
    ),
  ]
  if index == 2 {
    legend.push(
      @plot_dom.legend_item(
        "band",
        "Reference range",
        "#e6eaf1",
        model.band_visible,
      ),
    )
  }
  @html.div(
    class=if index == 2 { "chart-card stem-card-wide" } else { "chart-card" },
    [
      @html.div(class="chart-heading", [
        @html.div([
          @html.h2(titles[index]),
          @html.p(class="chart-caption", captions[index]),
        ]),
        @html.span(class="chart-unit", "Response · mV"),
      ]),
      @html.div(
        class="chart-options",
        if index == 0 {
          [
            @html.button(
              id="stems-clip",
              class="button button-quiet",
              on_click=emit(Clip),
              if model.clipped {
                "Focus range"
              } else {
                "Full range"
              },
            ),
          ]
        } else {
          [
            @html.span(
              class="chart-option-note",
              if index == 1 {
                "Baseline: 1 mV"
              } else {
                "Measurements and reference range"
              },
            ),
          ]
        },
      ),
      @plot_dom.view(
        drawing,
        id~,
        on_event=event => emit(Chart(index, event)),
        hovered?=state.hover,
        selected?=state.selected,
        hit_radius=3.0,
        hit_mode=if index == 1 { XNearest } else { Nearest },
        tooltip?=if index == 0 { None } else { Some(custom_tooltip) },
        tooltip_class=if index == 0 { "" } else { "stem-tooltip" },
        legend~,
      ),
      @html.div(class="chart-footer", [
        @html.div(id=id + "-status", class="selection-summary", attrs~, summary),
      ]),
    ],
  )
}

///|
fn content(model : Model, emit : @rabbita.Emit[Msg]) -> @html.Html raise {
  @html.div([
    @html.div(class="controls", [
      @html.span(
        id="stems-revision",
        class="data-version",
        "Revision \{model.revision}",
      ),
      @html.div(class="control-actions", [
        @html.button(
          id="stems-mount",
          class="button",
          on_click=emit(Mount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="stems-update",
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
          for index in 0..<3 => chart_card(model, index, emit)
        ],
      )
    } else {
      @html.div(id="stems-unmounted", "Charts are paused.")
    },
  ])
}

///|
fn main {
  @rabbita.new(() => {
    let initial : Model = {
      charts: [
        for _ in 0..<3 => { hover: None, selected: None, clicks: 0, }
      ],
      visible: [true, true, true],
      revision: 0,
      mounted: true,
      clipped: false,
      band_visible: true,
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="stems-error", "Chart error: \{error}")
      }
    })
  }).mount("app")
}
