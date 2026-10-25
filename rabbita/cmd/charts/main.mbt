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
  direct_visible : Bool
  partners_visible : Bool
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
    Chart(1, ToggleSeries("partners")) =>
      {
        ..model,
        charts: clear_charts(model.charts),
        partners_visible: !model.partners_visible,
      }
    Chart(1, ToggleSeries("direct")) =>
      {
        ..model,
        charts: clear_charts(model.charts),
        direct_visible: !model.direct_visible,
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
      let values = [
        [2.0, if changed { 8.0 } else { 5.0 }, 8.0, 11.0],
        [4.0, 0.0 / 0.0, 7.0, 10.0],
        [3.0, 6.0, 9.0, 12.0],
      ]
      fig.grid(visible=false)
      fig.imshow(
        values,
        vmin=0.0,
        vmax=12.0,
        cmap="viridis",
        origin="upper",
        aspect="auto",
        interpolation="nearest",
      )
      fig.set_xticks([0.0, 1.0, 2.0, 3.0])
      fig.set_x_tick_labels(["Mon", "Tue", "Wed", "Thu"])
      fig.set_yticks([0.0, 1.0, 2.0])
      fig.set_y_tick_labels(["North", "Mid", "South"])
      for row, cells in values {
        for column, value in cells {
          if !value.is_nan() {
            fig.text(
              column.to_double(),
              row.to_double(),
              "\{value}",
              color=if value >= 9.0 { "#244d45" } else { "#ffffff" },
            )
          }
        }
      }
    }
    1 => {
      let direct = [if changed { 11.0 } else { 8.0 }, 6.0, 9.0]
      let series = []
      let labels = []
      let colors = []
      if model.direct_visible {
        series.push(direct)
        labels.push("Direct")
        colors.push("#4d79c7")
      }
      if model.partners_visible {
        series.push([5.0, 7.0, 4.0])
        labels.push("Partners")
        colors.push("#398575")
      }
      if !series.is_empty() {
        ignore(fig.grouped_bar(["Q1", "Q2", "Q3"], series, labels~, colors~))
      }
    }
    2 =>
      ignore(
        fig.stacked_bar(
          ["North", "Central", "South"],
          [
            [if changed { 8.0 } else { 5.0 }, -3.0, 4.0],
            [2.0, -2.0, -3.0],
            [-1.0, 4.0, 2.0],
          ],
          labels=["Core", "Growth", "Adjustments"],
          colors=["#398575", "#4d79c7", "#ce8650"],
        ),
      )
    3 => {
      fig.grid(visible=false)
      fig.grid(axis="x", color="#e9edf1", linewidth=0.7)
      ignore(
        fig.stacked_bar(
          ["West", "North", "East"],
          [[6.0, -4.0, 7.0], [-2.0, 3.0, 2.0], [3.0, -1.0, -3.0]],
          labels=["Core", "Growth", "Adjustments"],
          colors=["#398575", "#4d79c7", "#ce8650"],
          horizontal=true,
          baseline=2.0,
        ),
      )
      fig.set_x_label("Change · k")
    }
    _ => {
      fig.grid(visible=false)
      fig.set_axis_off()
      // Two real Scene polygons sit under the ring. Its hole reveals both.
      fig.fill([-2.0, 0.0, 0.0, -2.0], [-2.0, -2.0, 2.0, 2.0], color="#e4efeb")
      fig.fill([0.0, 2.0, 2.0, 0.0], [-2.0, -2.0, 2.0, 2.0], color="#f0e9de")
      fig.set_x_limits(-2.0, 2.0)
      fig.set_y_limits(-2.0, 2.0)
      ignore(
        fig.donut(
          if changed {
            [0.0, 0.0, 8.0]
          } else {
            [2.0, 3.0, 5.0]
          },
          labels=["Design", "Engineering", "Operations"],
          colors=["#4d79c7", "#398575", "#ce8650"],
          start_angle=-30.0,
          inner_radius=0.58,
        ),
      )
    }
  }
  fig.to_drawing()
}

///|
fn cell_tooltip(info : @drawing.HitInfo) -> @html.Html {
  match info.cell {
    Some(cell) => {
      let regions = ["北区", "中区", "南区"]
      let days = ["周一", "周二", "周三", "周四"]
      @html.div(class="cell-reading", [
        @html.span("\{regions[cell.row]} · \{days[cell.column]}"),
        @html.b("\{info.value} 万元"),
        @html.small("原始行列 \{cell.row}, \{cell.column}"),
      ])
    }
    None => @html.span("\{info.value}")
  }
}

///|
fn chart_card(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let ids = ["heat", "grouped", "stacked", "horizontal", "donut"]
  let titles = [
    "Weekly activity", "Sales by channel", "Gains and adjustments", "Regional change",
    "Work allocation",
  ]
  let captions = [
    "Hover a whole cell. The blank cell has no value.", "Compare channels within each quarter.",
    "Positive and negative values stack separately.", "Each segment retains its value from a 2k baseline.",
    "The hole reveals two colored layers beneath the ring.",
  ]
  let id = "chart-" + ids[index]
  let state = model.charts[index]
  let drawing = chart_drawing(model, index)
  let summary = match state.selected {
    Some(point) =>
      match drawing.hit_info(point) {
        Some(info) =>
          match info.cell {
            Some(cell) =>
              "Selected: row \{cell.row}, column \{cell.column} · \{info.value}"
            None =>
              "Selected: \{info.category.unwrap_or(info.series)} · \{info.value}"
          }
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
    if drawing.hit_info(point) is Some(info) {
      ignore(attrs.data_set("value", info.value.to_string()))
      if info.cell is Some(cell) {
        ignore(attrs.data_set("row", cell.row.to_string()))
        ignore(attrs.data_set("column", cell.column.to_string()))
      }
    }
  }
  let plot = @plot_dom.view(
    drawing,
    id~,
    on_event=event => emit(Chart(index, event)),
    hovered?=state.hover,
    selected?=state.selected,
    tooltip?=if index == 0 { Some(cell_tooltip) } else { None },
    tooltip_class=if index == 0 { "cell-tooltip" } else { "" },
    legend=if index == 1 {
      [
        @plot_dom.legend_item(
          "direct",
          "Direct",
          "#4d79c7",
          model.direct_visible,
        ),
        @plot_dom.legend_item(
          "partners",
          "Partners",
          "#398575",
          model.partners_visible,
        ),
      ]
    } else {
      []
    },
  )
  let extras = if index == 0 {
    @html.div(class="heatmap-scale", [
      @html.span("0"),
      @html.span(class="heatmap-gradient", ""),
      @html.span("12 万元"),
      @html.span(class="missing-key", [@html.i(""), @html.span("No data")]),
    ])
  } else if index == 4 {
    @html.p(
      class="ring-note",
      "Colored polygons are part of the figure; the hole contains no slice.",
    )
  } else {
    @html.div("")
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
          "Sales · k"
        } else if index == 2 {
          "Change · k"
        } else {
          ""
        },
      ),
    ]),
    plot,
    extras,
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
        id="charts-revision",
        class="data-version",
        "Revision \{model.revision}",
      ),
      @html.div(class="control-actions", [
        @html.button(
          id="charts-mount",
          class="button",
          on_click=emit(Mount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="charts-update",
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
      @html.div(id="charts-unmounted", "Charts are paused.")
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
      direct_visible: true,
      partners_visible: true,
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="charts-error", "Chart error: \{error}")
      }
    })
  }).mount("app")
}
