///|
struct ChartState {
  hover : @drawing.HitPoint?
  selected : @drawing.HitPoint?
  clicks : Int32
} derive(Eq)

///|
struct Model {
  charts : Array[ChartState]
  revision : Int32
  mounted : Bool
  band_visible : Bool
} derive(Eq)

///|
enum Msg {
  Chart(Int32, @plot_dom.Interaction)
  Update
  Mount
}

///|
fn clear_charts(charts : Array[ChartState]) -> Array[ChartState] {
  charts.map(state => { ..state, hover: None, selected: None, })
}

///|
fn update(model : Model, message : Msg) -> Model {
  match message {
    Update =>
      {
        ..model,
        charts: clear_charts(model.charts),
        revision: model.revision + 1,
      }
    Mount =>
      { ..model, charts: clear_charts(model.charts), mounted: !model.mounted, }
    Chart(1, ToggleSeries("forecast")) =>
      {
        ..model,
        charts: clear_charts(model.charts),
        band_visible: !model.band_visible,
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
fn box_data(changed : Bool) -> Array[Array[Double]] {
  [
    if changed {
      [2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 30.0]
    } else {
      [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 20.0]
    },
    [2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0],
  ]
}

///|
fn chart_drawing(model : Model, index : Int32) -> @drawing.Drawing raise {
  let fig = styled_figure()
  let changed = model.revision % 2 == 1
  match index {
    0 => {
      fig.set_x_limits(0.0, 4.0)
      fig.set_y_limits(0.0, 11.0)
      fig.set_xticks([1.0, 2.0, 3.0])
      fig.set_x_tick_labels(["Mon", "Tue", "Wed"])
      fig.errorbar(
        [1.0, 2.0, 3.0],
        [4.0, if changed { 7.0 } else { 6.0 }, 5.0],
        xerr=[0.25, if changed { 0.5 } else { 0.25 }, 0.25],
        yerr=[1.0, if changed { 2.5 } else { 1.5 }, 0.75],
        color="#4d79c7",
        label="Measured signal",
      )
    }
    1 => {
      fig.set_x_limits(0.0, 6.0)
      fig.set_y_limits(0.0, 11.0)
      fig.set_xticks([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
      if model.band_visible {
        let missing = 0.0 / 0.0
        let lower = [
          2.0,
          if changed {
            4.0
          } else {
            3.0
          },
          2.0,
          missing,
          4.0,
          3.0,
          4.0,
        ]
        let upper = [
          5.0,
          if changed {
            9.0
          } else {
            7.0
          },
          6.0,
          missing,
          8.0,
          7.0,
          8.0,
        ]
        fig.fill_between(
          [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0],
          lower,
          upper,
          color="#8dbeb0",
          label="Forecast band",
        )
        let line = fig.plot_line(
          @plot.LineData::Numeric([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0]),
          @plot.LineData::Numeric(
            [
              for i in 0..<lower.length() => (lower[i] + upper[i]) / 2.0
            ],
          ),
          color="#398575",
        )
        line.set_linewidth(1.8)
        fig.errorbar(
          [1.0, 5.0],
          [if changed { 6.5 } else { 5.0 }, 5.5],
          yerr=[if changed { 1.0 } else { 0.5 }, 0.7],
          color="#ce8650",
          label="Observed",
        )
      }
    }
    2 => {
      fig.set_x_limits(0.0, 3.0)
      fig.set_y_limits(0.0, 13.0)
      fig.set_xticks([0.0, 1.0, 2.0, 3.0])
      fig.set_x_tick_labels(["Q1", "Q2", "Q3", "Q4"])
      ignore(
        fig.stackplot(
          [0.0, 1.0, 2.0, 3.0],
          [
            [2.0, if changed { 6.0 } else { 4.0 }, 3.0, 5.0],
            [1.0, 2.0, 4.0, 2.0],
            [3.0, 1.0, 2.0, 4.0],
          ],
          labels=["Direct", "Partners", "Other"],
          colors=["#4d79c7", "#398575", "#ce8650"],
        ),
      )
    }
    3 => {
      fig.set_x_limits(0.3, 2.7)
      fig.set_y_limits(0.0, if changed { 32.0 } else { 22.0 })
      fig.set_xticks([1.0, 2.0])
      fig.set_x_tick_labels(["North", "South"])
      ignore(
        fig.boxplot(box_data(changed), color="#8a70b5", label="Response time"),
      )
    }
    _ => {
      fig.grid(visible=false)
      fig.grid(axis="x", color="#e9edf1", linewidth=0.7)
      fig.set_x_limits(0.0, if changed { 32.0 } else { 22.0 })
      fig.set_y_limits(0.3, 2.7)
      fig.set_yticks([1.0, 2.0])
      fig.set_y_tick_labels(["North", "South"])
      ignore(
        fig.boxplot(
          box_data(changed),
          horizontal=true,
          color="#5e91a8",
          label="Response time",
        ),
      )
    }
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
fn box_part(part : @drawing.BoxPart) -> String {
  match part {
    Box => "四分位区间"
    LowerWhisker => "下须"
    UpperWhisker => "上须"
    LowerCap => "下须端"
    UpperCap => "上须端"
    Outlier(_) => "离群值"
  }
}

///|
fn custom_tooltip(index : Int32, info : @drawing.HitInfo) -> @html.Html {
  if index == 0 && info.error is Some(error) {
    @html.div(class="statistics-reading", [
      @html.b("采样 \{info.point.point_index + 1} · 测量温度"),
      reading_row("测量值", "\{info.value} °C"),
      reading_row(
        "温度区间",
        "\{error.y_range.0} – \{error.y_range.1} °C",
      ),
      reading_row(
        "横轴区间",
        "\{error.x_range.0} – \{error.x_range.1} 天",
      ),
    ])
  } else if index == 2 && info.band is Some(band) {
    @html.div(class="statistics-reading", [
      @html.b(info.series),
      reading_row("Value", "\{info.value} k"),
      reading_row("Stack bounds", "\{band.lower} – \{band.upper} k"),
      reading_row("Quarter", "Q\{info.point.point_index + 1}"),
    ])
  } else if info.box is Some(box) {
    let region = if box.group_index == 0 { "北区" } else { "南区" }
    let rows = [
      @html.b("\{region} · \{box_part(box.part)}"),
      reading_row("中位数", "\{box.median} ms"),
      reading_row("四分位", "\{box.q1} – \{box.q3} ms"),
      reading_row("须端", "\{box.lower_whisker} – \{box.upper_whisker} ms"),
    ]
    if box.part is Outlier(value) {
      rows.push(reading_row("离群值", "\{value} ms"))
    }
    @html.div(class="statistics-reading", rows)
  } else {
    @html.span("\{info.value}")
  }
}

///|
fn chart_card(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let ids = ["error", "band", "stack", "box", "boxh"]
  let titles = [
    "Measured signal", "Forecast range", "Traffic sources", "Response distribution",
    "Regional response",
  ]
  let captions = [
    "Explore each point, its range and either cap.", "Inspect the band. The gap has no observation.",
    "Each source keeps its own contribution.", "Explore quartiles, whiskers and outliers.",
    "Compare the same distributions horizontally.",
  ]
  let units = [
    "Temperature · °C", "Prediction", "Requests · k", "Latency · ms", "Latency · ms",
  ]
  let id = "stat-" + ids[index]
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
  if state.hover is Some(point) {
    ignore(attrs.data_set("point", point.point_index.to_string()))
    ignore(attrs.data_set("data-x", point.data_x.to_string()))
    ignore(attrs.data_set("data-y", point.data_y.to_string()))
    if drawing.hit_info(point) is Some(info) {
      ignore(attrs.data_set("value", info.value.to_string()))
      if info.error is Some(error) {
        ignore(attrs.data_set("x-lower", error.x_range.0.to_string()))
        ignore(attrs.data_set("x-upper", error.x_range.1.to_string()))
        ignore(attrs.data_set("y-lower", error.y_range.0.to_string()))
        ignore(attrs.data_set("y-upper", error.y_range.1.to_string()))
      }
      if info.band is Some(band) {
        ignore(attrs.data_set("lower", band.lower.to_string()))
        ignore(attrs.data_set("upper", band.upper.to_string()))
        ignore(attrs.data_set("horizontal", band.horizontal.to_string()))
        ignore(attrs.data_set("stacked", band.stacked.to_string()))
      }
      if info.box is Some(box) {
        ignore(attrs.data_set("group", box.group_index.to_string()))
        ignore(attrs.data_set("part", box_part(box.part)))
        ignore(attrs.data_set("q1", box.q1.to_string()))
        ignore(attrs.data_set("median", box.median.to_string()))
        ignore(attrs.data_set("q3", box.q3.to_string()))
        ignore(attrs.data_set("lower", box.lower_whisker.to_string()))
        ignore(attrs.data_set("upper", box.upper_whisker.to_string()))
      }
    }
  }
  @html.div(class="chart-card", [
    @html.div(class="chart-heading", [
      @html.div([
        @html.h2(titles[index]),
        @html.p(class="chart-caption", captions[index]),
      ]),
      @html.span(class="chart-unit", units[index]),
    ]),
    @plot_dom.view(
      drawing,
      id~,
      on_event=event => emit(Chart(index, event)),
      hovered?=state.hover,
      selected?=state.selected,
      hit_radius=if index == 0 || index >= 3 { 2.0 } else { 10.0 },
      tooltip?=if index == 1 {
        None
      } else {
        Some(info => custom_tooltip(index, info))
      },
      tooltip_class=if index == 1 { "" } else { "statistics-tooltip" },
      legend=if index == 1 {
        [
          @plot_dom.legend_item(
            "forecast",
            "Forecast band",
            "#8dbeb0",
            model.band_visible,
          ),
        ]
      } else {
        []
      },
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
        id="statistics-revision",
        class="data-version",
        "Revision \{model.revision}",
      ),
      @html.div(class="control-actions", [
        @html.button(
          id="statistics-mount",
          class="button",
          on_click=emit(Mount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="statistics-update",
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
          for index in 0..<5 => chart_card(model, index, emit)
        ],
      )
    } else {
      @html.div(id="statistics-unmounted", "Charts are paused.")
    },
  ])
}

///|
fn main {
  @rabbita.new(() => {
    let initial : Model = {
      charts: [
        for _ in 0..<5 => { hover: None, selected: None, clicks: 0, }
      ],
      revision: 0,
      mounted: true,
      band_visible: true,
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="statistics-error", "Chart error: \{error}")
      }
    })
  }).mount("app")
}
