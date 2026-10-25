///|
struct Model {
  hovered : @drawing.HitPoint?
  selected : @drawing.HitPoint?
  show_trend : Bool
  revision : Int32
  clicks : Int32
  bar_hover : @drawing.HitPoint?
  cell_hover : @drawing.HitPoint?
  statistics_hover : @drawing.HitPoint?
  box_hover : @drawing.HitPoint?
} derive(Eq)

///|
enum Msg {
  Chart(@plot_dom.Interaction)
  UpdateData
  Bar(@plot_dom.Interaction)
  Cell(@plot_dom.Interaction)
  Statistics(@plot_dom.Interaction)
  Box(@plot_dom.Interaction)
}

///|
fn update(model : Model, message : Msg) -> Model {
  match message {
    Chart(Hover(point)) => { ..model, hovered: point, }
    Chart(Click(point)) =>
      {
        ..model,
        selected: point,
        clicks: model.clicks + (if point is Some(_) { 1 } else { 0 }),
      }
    Chart(ToggleSeries("trend")) =>
      { ..model, show_trend: !model.show_trend, hovered: None, selected: None, }
    Chart(ToggleSeries(_)) => model
    UpdateData =>
      {
        ..model,
        revision: model.revision + 1,
        hovered: None,
        selected: None,
        bar_hover: None,
        cell_hover: None,
        statistics_hover: None,
        box_hover: None,
      }
    Bar(Hover(point)) => { ..model, bar_hover: point, }
    Bar(_) => model
    Cell(Hover(point)) => { ..model, cell_hover: point, }
    Cell(_) => model
    Statistics(Hover(point)) => { ..model, statistics_hover: point, }
    Statistics(_) => model
    Box(Hover(point)) => { ..model, box_hover: point, }
    Box(_) => model
  }
}

///|
fn make_drawing(model : Model) -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=360)
  figure.set_x_limits(0.5, 3.5)
  figure.set_y_limits(0.0, 8.0)
  figure.set_x_label("Sample")
  figure.set_y_label("Value")
  figure.grid(axis="y", color="#e9edf1", linewidth=0.7)
  figure.legend([])
  let first_value = if model.revision % 2 == 0 { 2.0 } else { 3.0 }
  let line = figure.plot_line(
    @plot.LineData::Numeric([1.0, 2.0, 3.0]),
    @plot.LineData::Numeric([first_value, 5.0, 4.0]),
    color="#4d79c7",
  )
  line.set_visible(model.show_trend)
  line.set_linewidth(2.2)
  figure.scatter(
    [@plot.point(1.0, 4.0), @plot.point(2.0, 2.0), @plot.point(3.0, 6.0)],
    color="#ce8650",
  )
  figure.to_drawing()
}

///|
fn selection(model : Model) -> @html.Html {
  let attrs = @html.Attrs::build()
    .data_set("selected", (model.selected is Some(_)).to_string())
    .data_set("clicks", model.clicks.to_string())
  let text = match model.selected {
    None => "Click a point to keep its value here."
    Some(point) => {
      ignore(
        attrs
        .data_set("point", point.point_index.to_string())
        .data_set("x", point.data_x.to_string())
        .data_set("y", point.data_y.to_string()),
      )
      "Sample \{point.data_x}: \{point.data_y}"
    }
  }
  @html.p(id="selection", class="selection", attrs~, text)
}

///|
fn content(model : Model, emit : @rabbita.Emit[Msg]) -> @html.Html raise {
  @html.div(class="card", [
    @html.div(class="toolbar", [
      @html.div([
        @html.h2("Measurements"),
        @html.p(id="revision", "Dataset revision \{model.revision}"),
      ]),
      @html.button(id="update-data", on_click=emit(UpdateData), "Update data"),
    ]),
    @plot_dom.view(
      make_drawing(model),
      id="release-chart",
      on_event=event => emit(Chart(event)),
      hovered?=model.hovered,
      selected?=model.selected,
      legend=[
        @plot_dom.legend_item("trend", "Trend", "#4d79c7", model.show_trend),
      ],
    ),
    selection(model),
    @html.h2("Categorical bars"),
    @plot_dom.view(
      make_bar_drawing(model),
      id="release-bars",
      on_event=event => emit(Bar(event)),
      hovered?=model.bar_hover,
      tooltip=info => {
        let category = info.category.unwrap_or("")
        @html.b(
          attrs=@html.Attrs::build().data_set(
            "testid", "consumer-custom-tooltip",
          ),
          "\{info.series} · \{category}: \{info.value} items",
        )
      },
    ),
    @html.h2("Matrix cells"),
    @plot_dom.view(
      make_cell_drawing(),
      id="release-cells",
      on_event=event => emit(Cell(event)),
      hovered?=model.cell_hover,
      tooltip=info => {
        let cell = info.cell.unwrap()
        @html.b(
          attrs=@html.Attrs::build().data_set("testid", "consumer-cell-tooltip"),
          "Cell \{cell.row},\{cell.column}: \{info.value}",
        )
      },
    ),
    @html.h2("Intervals and measurements"),
    @plot_dom.view(
      make_statistics_drawing(model),
      id="release-statistics",
      on_event=event => emit(Statistics(event)),
      hovered?=model.statistics_hover,
      tooltip=info => {
        let text = if info.error is Some(error) {
          "Measured: \{info.value} [\{error.y_range.0}, \{error.y_range.1}]"
        } else if info.band is Some(band) {
          "Band: \{band.lower}..\{band.upper}"
        } else {
          "Value: \{info.value}"
        }
        @html.b(
          attrs=@html.Attrs::build().data_set(
            "testid", "consumer-statistics-tooltip",
          ),
          text,
        )
      },
    ),
    @html.h2("Distribution statistics"),
    @plot_dom.view(
      make_box_drawing(),
      id="release-boxes",
      on_event=event => emit(Box(event)),
      hovered?=model.box_hover,
      tooltip=info => {
        let box = info.box.unwrap()
        let text = "Box: \{box.q1} / \{box.median} / \{box.q3}; value=\{info.value}"
        @html.b(
          attrs=@html.Attrs::build().data_set("testid", "consumer-box-tooltip"),
          text,
        )
      },
    ),
  ])
}

///|
fn make_bar_drawing(model : Model) -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=240)
  figure.legend([])
  figure.grouped_bar(
    ["North", "South"],
    [[4.0 + model.revision.to_double(), -2.0], [2.0, 3.0]],
    labels=["Orders", "Returns"],
  )
  figure.to_drawing()
}

///|
fn make_cell_drawing() -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=240)
  figure.imshow([[1.0, 2.0], [3.0, 0.0 / 0.0]], aspect="auto")
  figure.to_drawing()
}

///|
fn make_statistics_drawing(model : Model) -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=240)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.legend([])
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 10.0)
  axes.fill_between(
    [0.0, 4.0],
    [1.0, 1.0],
    [7.0, 7.0],
    color="#deebe7",
    label="Band",
  )
  axes.errorbar(
    [1.0, 3.0],
    [4.0 + model.revision.to_double(), 6.0],
    yerr=[2.0, 1.0],
    color="#975a40",
    label="Measured",
  )
  figure.to_drawing()
}

///|
fn make_box_drawing() -> @drawing.Drawing raise {
  let figure = @plot.figure(width=600, height=240)
  figure.legend([])
  ignore(
    figure.boxplot(
      [[1.0, 2.0, 3.0, 4.0, 5.0, 20.0]],
      color="#567681",
      label="Distribution",
    ),
  )
  figure.to_drawing()
}

///|
fn main {
  @rabbita.new(() => {
    let (state, emit) = @rabbita.create_pure_state(
      {
        hovered: None,
        selected: None,
        show_trend: true,
        revision: 0,
        clicks: 0,
        bar_hover: None,
        cell_hover: None,
        statistics_hover: None,
        box_hover: None,
      },
      update~,
    )
    state.view(model => {
      content(model, emit) catch {
        error => @html.p(id="plot-error", "Plot error: \{error}")
      }
    })
  }).mount("app")
}
