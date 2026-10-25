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
  step_mode : Int32
  stairs_horizontal : Bool
  stairs_filled : Bool
  compressed : Bool
} derive(Eq)

///|
enum Msg {
  Chart(Int32, @plot_dom.Interaction)
  Update
  Mount
  StepMode
  StairsOrientation
  StairsFill
  Compress
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
    StepMode =>
      {
        ..model,
        charts: clear_chart(model, 0),
        step_mode: (model.step_mode + 1) % 3,
      }
    StairsOrientation =>
      {
        ..model,
        charts: clear_chart(model, 1),
        stairs_horizontal: !model.stairs_horizontal,
      }
    StairsFill =>
      {
        ..model,
        charts: clear_chart(model, 1),
        stairs_filled: !model.stairs_filled,
      }
    Compress =>
      { ..model, charts: clear_chart(model, 2), compressed: !model.compressed, }
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
fn step_mode(model : Model) -> String {
  ["pre", "post", "mid"][model.step_mode]
}

///|
fn step_xs() -> Array[Double] {
  [0.0, 2.0, 5.0, 8.0]
}

///|
fn step_ys(changed : Bool) -> Array[Double] {
  if changed {
    [3.0, 5.0, 4.0, 8.0]
  } else {
    [2.0, 6.0, 3.0, 7.0]
  }
}

///|
fn stairs_edges(changed : Bool) -> Array[Double] {
  if changed {
    [0.0, 2.0, 4.0, 5.0, 8.0]
  } else {
    [0.0, 1.0, 3.0, 6.0, 8.0]
  }
}

///|
fn stairs_values(changed : Bool) -> Array[Double] {
  if changed {
    [3.0, 4.0, -2.0, 6.0]
  } else {
    [2.0, 5.0, -1.0, 4.0]
  }
}

///|
fn colors() -> Array[String] {
  ["#398575", "#4d79c7", "#8a70b5", "#5e91a8"]
}

///|
fn series_names() -> Array[String] {
  [
    "Sample value", "Power level", "Weighted probability", "Remaining probability",
  ]
}

///|
fn styled_figure() -> @plot.Figure raise {
  let fig = @plot.figure(width=560, height=350)
  fig.legend([])
  fig.grid(axis="y", color="#e9edf1", linewidth=0.7)
  for spine in fig.spines() {
    spine.set_color("#d8dfe5")
    spine.set_linewidth(0.7)
    if spine.side() is (Top | Right) {
      spine.set_visible(false)
    }
  }
  fig
}

///|
fn chart_snapshot(
  model : Model,
  index : Int32,
) -> (@drawing.Drawing, @scene.Ecdf?) raise {
  let fig = styled_figure()
  let changed = model.revision % 2 == 1
  let mut result : @scene.Ecdf? = None
  if index == 0 {
    fig.set_x_limits(-0.5, 8.5)
    fig.set_y_limits(0.0, 9.0)
    fig.set_xticks([0.0, 2.0, 5.0, 8.0])
    if model.visible[index] {
      fig.step(
        step_xs(),
        step_ys(changed),
        where_=step_mode(model),
        color=colors()[index],
        label=series_names()[index],
      )
    }
  } else if index == 1 {
    if model.stairs_horizontal {
      fig.grid(visible=false)
      fig.grid(axis="x", color="#e9edf1", linewidth=0.7)
      fig.set_x_limits(-3.0, 7.0)
      fig.set_y_limits(-0.5, 8.5)
      fig.set_yticks(stairs_edges(changed))
    } else {
      fig.set_x_limits(-0.5, 8.5)
      fig.set_y_limits(-3.0, 7.0)
      fig.set_xticks(stairs_edges(changed))
    }
    if model.visible[index] {
      fig.stairs(
        stairs_values(changed),
        edges=stairs_edges(changed),
        orientation=if model.stairs_horizontal {
          "horizontal"
        } else {
          "vertical"
        },
        baseline=0.0,
        fill=model.stairs_filled,
        color=colors()[index],
        label=series_names()[index],
      )
    }
  } else {
    let horizontal = index == 3
    if horizontal {
      fig.grid(visible=false)
      fig.grid(axis="x", color="#e9edf1", linewidth=0.7)
      fig.set_x_limits(-0.1, 1.1)
      fig.set_y_limits(0.0, 9.0)
      fig.set_xticks([0.0, 0.25, 0.5, 0.75, 1.0])
    } else {
      fig.set_x_limits(0.0, 9.0)
      fig.set_y_limits(-0.1, 1.1)
      fig.set_yticks([0.0, 0.25, 0.5, 0.75, 1.0])
    }
    if model.visible[index] {
      result = Some(
        fig.ecdf(
          if changed {
            [6.0, 2.0, 4.0, 2.0, 8.0]
          } else {
            [5.0, 1.0, 3.0, 1.0, 7.0]
          },
          weights=if changed {
            [1.0, 2.0, 1.0, 2.0, 2.0]
          } else {
            [2.0, 1.0, 2.0, 1.0, 2.0]
          },
          complementary=horizontal,
          horizontal~,
          compress=horizontal || model.compressed,
          color=colors()[index],
          label=series_names()[index],
        ),
      )
    }
  }
  (fig.to_drawing(), result)
}

///|
fn interval_attrs(
  attrs : @html.Attrs,
  prefix : String,
  interval : (Double, Double)?,
) -> Unit {
  ignore(attrs.data_set(prefix + "-present", (interval is Some(_)).to_string()))
  if interval is Some((start, end)) {
    ignore(attrs.data_set(prefix + "-start", start.to_string()))
    ignore(attrs.data_set(prefix + "-end", end.to_string()))
  }
}

///|
fn step_interval(model : Model, index : Int32) -> (Double, Double)? {
  let xs = step_xs()
  if model.step_mode == 0 {
    if index == 0 {
      None
    } else {
      Some((xs[index - 1], xs[index]))
    }
  } else if model.step_mode == 1 {
    if index + 1 == xs.length() {
      None
    } else {
      Some((xs[index], xs[index + 1]))
    }
  } else {
    Some(
      (
        if index == 0 {
          xs[0]
        } else {
          (xs[index - 1] + xs[index]) / 2.0
        },
        if index + 1 == xs.length() {
          xs[index]
        } else {
          (xs[index] + xs[index + 1]) / 2.0
        },
      ),
    )
  }
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
  if info.kind is Stairs {
    let rows = [
      @html.b("区间用电"),
      reading_row("功率", "\{info.value} kW"),
    ]
    if info.interval is Some((start, end)) {
      rows.push(reading_row("时段", "\{start} – \{end} h"))
    }
    if info.band is Some(band) {
      rows.push(reading_row("基线", "\{band.lower} kW"))
    }
    @html.div(class="discrete-reading", rows)
  } else {
    let rows = [
      @html.b("剩余分布"),
      reading_row("响应时间", "\{info.value} ms"),
    ]
    if info.fraction is Some(probability) {
      rows.push(
        reading_row(
          "剩余概率",
          "\{(probability * 10000.0).round() / 100.0}%",
        ),
      )
    }
    if info.band is Some(band) {
      rows.push(reading_row("概率变化", "\{band.lower} → \{band.upper}"))
    }
    @html.div(class="discrete-reading", rows)
  }
}

///|
fn chart_options(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html {
  @html.div(
    class="chart-options",
    if index == 0 {
      [
        @html.button(
          id="discrete-step-mode",
          class="button button-quiet",
          on_click=emit(StepMode),
          "Alignment: \{step_mode(model)}",
        ),
      ]
    } else if index == 1 {
      [
        @html.button(
          id="discrete-stairs-orientation",
          class="button button-quiet",
          on_click=emit(StairsOrientation),
          if model.stairs_horizontal {
            "Horizontal"
          } else {
            "Vertical"
          },
        ),
        @html.button(
          id="discrete-stairs-fill",
          class="button button-quiet",
          on_click=emit(StairsFill),
          if model.stairs_filled {
            "Filled"
          } else {
            "Outline"
          },
        ),
      ]
    } else if index == 2 {
      [
        @html.button(
          id="discrete-ecdf-compress",
          class="button button-quiet",
          on_click=emit(Compress),
          if model.compressed {
            "Equal values combined"
          } else {
            "Equal values separate"
          },
        ),
      ]
    } else {
      [
        @html.span(
          class="chart-option-note",
          "Weighted · horizontal · complementary",
        ),
      ]
    },
  )
}

///|
fn chart_card(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let ids = ["step", "stairs", "ecdf", "complementary"]
  let titles = [
    "A change in steps", "Across unequal intervals", "A weighted cumulative view",
    "How much remains",
  ]
  let captions = [
    "Move the transition, keep the original sample.", "Read a value over its complete time interval.",
    "Explore values and their cumulative probabilities.", "Read the remaining probability on a horizontal axis.",
  ]
  let id = "discrete-" + ids[index]
  let changed = model.revision % 2 == 1
  let state = model.charts[index]
  let (drawing, result) = chart_snapshot(model, index)
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
    .data_set("mode", step_mode(model))
    .data_set(
      "horizontal",
      (if index == 1 { model.stairs_horizontal } else { index == 3 }).to_string(),
    )
    .data_set("filled", model.stairs_filled.to_string())
    .data_set("compressed", (index == 3 || model.compressed).to_string())
  for target in drawing.targets() {
    if target.shape is Point {
      let point = target.info.point
      ignore(
        attrs.data_set(
          "canonical-\{point.point_index}-x",
          point.screen_x.to_string(),
        ),
      )
      ignore(
        attrs.data_set(
          "canonical-\{point.point_index}-y",
          point.screen_y.to_string(),
        ),
      )
    }
  }
  if state.hover is Some(point) {
    ignore(attrs.data_set("point", point.point_index.to_string()))
    ignore(attrs.data_set("data-x", point.data_x.to_string()))
    ignore(attrs.data_set("data-y", point.data_y.to_string()))
    if drawing.hit_info(point) is Some(info) {
      ignore(attrs.data_set("value", info.value.to_string()))
      interval_attrs(attrs, "interval", info.interval)
      ignore(
        attrs.data_set(
          "fraction-present",
          (info.fraction is Some(_)).to_string(),
        ),
      )
      if info.fraction is Some(probability) {
        ignore(attrs.data_set("fraction", probability.to_string()))
      }
      ignore(attrs.data_set("band-present", (info.band is Some(_)).to_string()))
      if info.band is Some(band) {
        ignore(attrs.data_set("lower", band.lower.to_string()))
        ignore(attrs.data_set("upper", band.upper.to_string()))
        ignore(attrs.data_set("band-horizontal", band.horizontal.to_string()))
        ignore(attrs.data_set("stacked", band.stacked.to_string()))
      }
      let source_index = point.point_index
      if index == 0 && source_index >= 0 && source_index < step_xs().length() {
        ignore(
          attrs.data_set(
            "expected-value",
            step_ys(changed)[source_index].to_string(),
          ),
        )
        ignore(
          attrs.data_set("expected-x", step_xs()[source_index].to_string()),
        )
        ignore(
          attrs.data_set(
            "expected-y",
            step_ys(changed)[source_index].to_string(),
          ),
        )
        interval_attrs(
          attrs,
          "expected-interval",
          step_interval(model, source_index),
        )
      } else if index == 1 &&
        source_index >= 0 &&
        source_index < stairs_values(changed).length() {
        let edge = stairs_edges(changed)[source_index]
        let value = stairs_values(changed)[source_index]
        ignore(attrs.data_set("expected-value", value.to_string()))
        ignore(
          attrs.data_set(
            "expected-x",
            (if model.stairs_horizontal { value } else { edge }).to_string(),
          ),
        )
        ignore(
          attrs.data_set(
            "expected-y",
            (if model.stairs_horizontal { edge } else { value }).to_string(),
          ),
        )
        interval_attrs(
          attrs,
          "expected-interval",
          Some((edge, stairs_edges(changed)[source_index + 1])),
        )
      } else if result is Some(ecdf) &&
        source_index >= 0 &&
        source_index < ecdf.values().length() {
        let values = ecdf.values()
        let probabilities = ecdf.probabilities()
        let value = values[source_index]
        let probability = probabilities[source_index]
        ignore(attrs.data_set("expected-value", value.to_string()))
        ignore(
          attrs.data_set(
            "expected-x",
            (if index == 3 { probability } else { value }).to_string(),
          ),
        )
        ignore(
          attrs.data_set(
            "expected-y",
            (if index == 3 { value } else { probability }).to_string(),
          ),
        )
        ignore(attrs.data_set("expected-fraction", probability.to_string()))
        ignore(
          attrs.data_set(
            "expected-before",
            (if source_index == 0 {
              if index == 3 {
                1.0
              } else {
                0.0
              }
            } else {
              probabilities[source_index - 1]
            }).to_string(),
          ),
        )
        ignore(attrs.data_set("expected-length", values.length().to_string()))
        interval_attrs(
          attrs,
          "expected-interval",
          if source_index + 1 < values.length() {
            Some((value, values[source_index + 1]))
          } else {
            None
          },
        )
      }
    }
  }
  @html.div(class="chart-card", [
    @html.div(class="chart-heading", [
      @html.div([
        @html.h2(titles[index]),
        @html.p(class="chart-caption", captions[index]),
      ]),
      @html.span(
        class="chart-unit",
        if index == 1 {
          "Hours · kW"
        } else if index == 0 {
          "Sample value"
        } else {
          "Latency · ms"
        },
      ),
    ]),
    chart_options(model, index, emit),
    @plot_dom.view(
      drawing,
      id~,
      on_event=event => emit(Chart(index, event)),
      hovered?=state.hover,
      selected?=state.selected,
      hit_radius=3.0,
      tooltip?=if index == 1 || index == 3 {
        Some(custom_tooltip)
      } else {
        None
      },
      tooltip_class=if index == 1 || index == 3 {
        "discrete-tooltip"
      } else {
        ""
      },
      legend=[
        @plot_dom.legend_item(
          "discrete",
          series_names()[index],
          colors()[index],
          model.visible[index],
        ),
      ],
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
        id="discrete-revision",
        class="data-version",
        "Revision \{model.revision}",
      ),
      @html.div(class="control-actions", [
        @html.button(
          id="discrete-mount",
          class="button",
          on_click=emit(Mount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="discrete-update",
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
          for index in 0..<4 => chart_card(model, index, emit)
        ],
      )
    } else {
      @html.div(id="discrete-unmounted", "Charts are paused.")
    },
  ])
}

///|
fn main {
  @rabbita.new(() => {
    let initial : Model = {
      charts: [
        for _ in 0..<4 => { hover: None, selected: None, clicks: 0, }
      ],
      visible: [true, true, true, true],
      revision: 0,
      mounted: true,
      step_mode: 0,
      stairs_horizontal: false,
      stairs_filled: true,
      compressed: true,
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="discrete-error", "Chart error: \{error}")
      }
    })
  }).mount("app")
}
