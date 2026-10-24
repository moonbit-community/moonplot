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
  line_visible : Bool
  tooltip_visible : Bool
} derive(Eq)

///|
enum Msg {
  Chart(Int32, @plot_dom.Interaction)
  Update
  Mount
  Tooltips
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
    Tooltips => { ..model, tooltip_visible: !model.tooltip_visible, }
    Chart(_, ToggleSeries(_)) =>
      {
        ..model,
        charts: clear_charts(model.charts),
        line_visible: !model.line_visible,
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
fn chart_drawing(model : Model, index : Int32) -> @drawing.Drawing raise {
  let fig = styled_figure()
  let changed = model.revision % 2 == 1
  match index {
    0 => {
      fig.set_x_limits(0.0, 4.0)
      fig.set_y_limits(0.0, 10.0)
      fig.set_x_label("Day")
      let line = fig.plot_line(
        @plot.LineData::Numeric([1.0, 2.0, 3.0]),
        @plot.LineData::Numeric([2.0, if changed { 8.0 } else { 7.0 }, 4.0]),
        color="#4d79c7",
        label="Temperature",
      )
      line.set_visible(model.line_visible)
      line.set_linewidth(2.2)
    }
    1 => {
      fig.set_x_limits(0.0, 4.0)
      fig.set_y_limits(0.0, 10.0)
      fig.set_x_label("Sample")
      fig.scatter(
        [@plot.point(1.0, 2.0), @plot.point(2.0, 7.0), @plot.point(3.0, 4.0)],
        color="#ce8650",
        label="Observations",
      )
    }
    2 => {
      fig.set_x_limits(-0.6, 2.6)
      fig.set_y_limits(-6.0, 12.0)
      fig.bar_category(
        ["华东", "华南", "华北"],
        [if changed { 11.0 } else { 8.0 }, -4.0, 6.0],
        color="#398575",
        label="地区销量",
      )
    }
    3 => {
      fig.set_x_limits(-8.0, 9.0)
      fig.set_y_limits(-0.6, 2.6)
      fig.bar_category_y(
        [-5.0, 3.0, 7.0],
        ["West", "North", "East"],
        color="#8a70b5",
        label="Net change",
      )
    }
    4 => {
      fig.set_x_limits(0.0, 3.0)
      fig.set_y_limits(0.0, 5.0)
      ignore(
        fig.hist(
          [0.0, 0.2, 1.0, 1.0, 2.0, 3.0, 3.0, 3.0],
          bins=3,
          color="#5e91a8",
          label="Response time",
        ),
      )
    }
    _ => {
      fig.grid(visible=false)
      fig.set_axis_off()
      ignore(
        fig.pie(
          if changed {
            [0.0, 0.0, 5.0]
          } else {
            [1.0, 2.0, 3.0]
          },
          labels=["Research", "Operations", "Services"],
          colors=["#4d79c7", "#398575", "#ce8650"],
          start_angle=0.0,
        ),
      )
    }
  }
  fig.to_drawing()
}

///|
fn custom_tooltip(index : Int32, info : @drawing.HitInfo) -> @html.Html {
  if index == 0 {
    let day = 23 + info.point.point_index
    @html.div(class="custom-reading", [
      @html.span(class="custom-label", "2026-10-\{day}"),
      @html.b("\{info.value} °C"),
      @html.span(class="custom-note", "Temperature · daily reading"),
    ])
  } else {
    let category = match info.category {
      Some(name) => name
      None => "未知地区"
    }
    @html.div(class="custom-reading", [
      @html.span(class="custom-label", category),
      @html.b("\{info.value} 万元"),
      @html.span(class="custom-note", "\{info.series} · 月度合计"),
    ])
  }
}

///|
fn chart_card(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let ids = ["line", "scatter", "bar", "barh", "hist", "pie"]
  let titles = [
    "Daily temperature", "Observed samples", "地区销量", "Regional change", "Response time",
    "Work allocation",
  ]
  let captions = [
    "Follow a day anywhere inside the plot.", "Inspect only when you are near a point.",
    "Hover anywhere inside a bar.", "Negative values keep their sign.", "Bin intervals and counts travel together.",
    "Each slice carries its value and share.",
  ]
  let id = "tip-" + ids[index]
  let state = model.charts[index]
  let drawing = chart_drawing(model, index)
  let tooltip = if index == 0 || index == 2 {
    Some(info => custom_tooltip(index, info))
  } else {
    None
  }
  let summary = match state.selected {
    Some(point) =>
      match drawing.hit_info(point) {
        Some(info) => {
          let label = match info.category {
            Some(value) => value
            None => info.series
          }
          "Selected: \{label} · \{info.value}"
        }
        None => "Selected point: \{point.data_x}, \{point.data_y}"
      }
    None => "Click to keep a selection."
  }
  let attrs = @html.Attrs::build()
    .data_set("clicks", state.clicks.to_string())
    .data_set("hovered", (state.hover is Some(_)).to_string())
    .data_set("selected", (state.selected is Some(_)).to_string())
  if state.hover is Some(point) {
    ignore(attrs.data_set("point", point.point_index.to_string()))
  }
  @html.div(class="chart-card", [
    @html.div(class="chart-heading", [
      @html.div([
        @html.h2(titles[index]),
        @html.p(class="chart-caption", captions[index]),
      ]),
    ]),
    @plot_dom.view(
      drawing,
      id~,
      on_event=event => emit(Chart(index, event)),
      hovered?=state.hover,
      selected?=state.selected,
      hit_mode=if index == 0 {
        @drawing.HitMode::XNearest
      } else {
        @drawing.HitMode::Nearest
      },
      tooltip?,
      tooltip_visible=model.tooltip_visible,
      tooltip_class=if index == 0 || index == 2 { "custom-tooltip" } else { "" },
      legend=if index == 0 {
        [
          @plot_dom.legend_item(
            "temperature",
            "Temperature",
            "#4d79c7",
            model.line_visible,
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
  let charts = if model.mounted {
    @html.div(
      class="charts",
      [
        for index in 0..<6 => chart_card(model, index, emit)
      ],
    )
  } else {
    @html.div(id="tooltips-unmounted", "Charts are paused.")
  }
  @html.div([
    @html.div(class="controls", [
      @html.span(
        id="tooltip-revision",
        class="data-version",
        "Revision \{model.revision}",
      ),
      @html.div(class="control-actions", [
        @html.button(
          id="tooltip-toggle",
          class="button",
          on_click=emit(Tooltips),
          if model.tooltip_visible {
            "Hide tooltips"
          } else {
            "Show tooltips"
          },
        ),
        @html.button(
          id="tooltip-mount",
          class="button",
          on_click=emit(Mount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="tooltip-update",
          class="button button-primary",
          on_click=emit(Update),
          "Update data",
        ),
      ]),
    ]),
    charts,
  ])
}

///|
fn main {
  @rabbita.new(() => {
    let initial : Model = {
      charts: [
        for _ in 0..<6 => { hover: None, selected: None, clicks: 0, }
      ],
      revision: 0,
      mounted: true,
      line_visible: true,
      tooltip_visible: true,
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="tooltip-error", "Chart error: \{error}")
      }
    })
  }).mount("app")
}
