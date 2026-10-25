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
    Chart(index, ToggleSeries(_)) => {
      let charts = model.charts.copy()
      charts[index] = { ..charts[index], hover: None, selected: None, }
      let visible = model.visible.copy()
      visible[index] = !visible[index]
      { ..model, charts, visible, }
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
  fig.grid(visible=false)
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
  fig.set_x_limits(0.0, 6.0)
  fig.set_y_limits(0.0, if index == 1 { 4.0 } else { 5.0 })
  fig.set_xticks(
    if index == 1 {
      [0.0, 2.0, 4.0, 6.0]
    } else {
      [0.0, 1.0, 3.0, 6.0]
    },
  )
  fig.set_yticks(if index == 1 { [0.0, 2.0, 4.0] } else { [0.0, 2.0, 5.0] })
  if model.visible[index] {
    match index {
      0 =>
        fig.pcolormesh(
          [[2.0, 0.0 / 0.0, 8.0], [5.0, if changed { 9.0 } else { 3.0 }, 11.0]],
          x=[0.0, 1.0, 3.0, 6.0],
          y=[0.0, 2.0, 5.0],
          vmin=0.0,
          vmax=12.0,
          cmap="viridis",
        )
      1 => {
        let xs = [0.0, 0.2, 2.0, 3.5, 6.0, 0.0 / 0.0, 2.0]
        let ys = [0.0, 0.2, 2.0, 3.5, 4.0, 2.0, 0.0 / 0.0]
        if changed {
          xs.push(6.0)
          xs.push(6.0)
          ys.push(4.0)
          ys.push(4.0)
        }
        fig.hist2d(xs, ys, bins_x=3, bins_y=2, cmap="viridis")
      }
      _ =>
        fig.pcolormesh(
          [[if changed { 4.0 } else { 1.0 }, 4.0, 7.0], [2.0, 6.0, 10.0]],
          x=[6.0, 3.0, 1.0, 0.0],
          y=[5.0, 2.0, 0.0],
          vmin=0.0,
          vmax=12.0,
          cmap="viridis",
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
fn cell_tooltip(info : @drawing.HitInfo) -> @html.Html {
  match info.cell {
    Some(cell) =>
      @html.div(class="grid-reading", [
        @html.b("第 \{cell.row + 1} 行 · 第 \{cell.column + 1} 列"),
        reading_row("能量", "\{info.value} kWh"),
        reading_row("时间", "\{cell.x_range.0} – \{cell.x_range.1} h"),
        reading_row("高度", "\{cell.y_range.0} – \{cell.y_range.1} m"),
      ])
    None => @html.span("\{info.value}")
  }
}

///|
fn chart_card(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let ids = ["mesh", "hist", "reverse"]
  let titles = ["Energy map", "Observation counts", "Descending intervals"]
  let captions = [
    "Read uneven cells. The blank interval has no value.", "Explore two ranges, including bins with no observations.",
    "Follow intervals that run in reverse.",
  ]
  let names = ["Energy", "Observations", "Descending grid"]
  let id = "grid-" + ids[index]
  let state = model.charts[index]
  let drawing = chart_drawing(model, index)
  let summary = match state.selected {
    Some(point) =>
      match drawing.hit_info(point) {
        Some(info) =>
          if info.cell is Some(cell) {
            "Selected: row \{cell.row + 1}, column \{cell.column + 1} · \{info.value}"
          } else {
            "Selection updated."
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
        ignore(attrs.data_set("x-lower", cell.x_range.0.to_string()))
        ignore(attrs.data_set("x-upper", cell.x_range.1.to_string()))
        ignore(attrs.data_set("y-lower", cell.y_range.0.to_string()))
        ignore(attrs.data_set("y-upper", cell.y_range.1.to_string()))
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
          "Samples"
        } else {
          "Energy · kWh"
        },
      ),
    ]),
    @plot_dom.view(
      drawing,
      id~,
      on_event=event => emit(Chart(index, event)),
      hovered?=state.hover,
      selected?=state.selected,
      tooltip?=if index == 1 { None } else { Some(cell_tooltip) },
      tooltip_class=if index == 1 { "" } else { "grid-tooltip" },
      legend=[
        @plot_dom.legend_item(
          "grid",
          names[index],
          "#398575",
          model.visible[index],
        ),
      ],
    ),
    @html.div(class="grid-scale", [
      @html.span("0"),
      @html.span(class="grid-gradient", ""),
      @html.span(
        if index == 1 {
          if model.revision % 2 == 1 {
            "3 samples"
          } else {
            "2 samples"
          }
        } else {
          "12 kWh"
        },
      ),
      if index == 0 {
        @html.span(class="missing-key", [@html.i(""), @html.span("No data")])
      } else {
        @html.span("")
      },
    ]),
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
        id="grids-revision",
        class="data-version",
        "Revision \{model.revision}",
      ),
      @html.div(class="control-actions", [
        @html.button(
          id="grids-mount",
          class="button",
          on_click=emit(Mount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="grids-update",
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
      @html.div(id="grids-unmounted", "Charts are paused.")
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
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="grids-error", "Chart error: \{error}")
      }
    })
  }).mount("app")
}
