///|
struct Model {
  hover_a : @drawing.HitPoint?
  selected_a : @drawing.HitPoint?
  hover_b : @drawing.HitPoint?
  selected_b : @drawing.HitPoint?
  line_a : Bool
  scatter_a : Bool
  line_b : Bool
  version : Int32
  mounted : Bool
  clicks_a : Int32
  clicks_b : Int32
} derive(Eq)

///|
enum Msg {
  ChartA(@plot_dom.Interaction)
  ChartB(@plot_dom.Interaction)
  UpdateData
  ToggleMount
  Reset
}

///|
fn initial_model() -> Model {
  {
    hover_a: None,
    selected_a: None,
    hover_b: None,
    selected_b: None,
    line_a: true,
    scatter_a: true,
    line_b: true,
    version: 0,
    mounted: true,
    clicks_a: 0,
    clicks_b: 0,
  }
}

///|
fn update(model : Model, msg : Msg) -> Model {
  match msg {
    ChartA(Hover(point)) => { ..model, hover_a: point, }
    ChartB(Hover(point)) => { ..model, hover_b: point, }
    ChartA(Click(point)) =>
      {
        ..model,
        selected_a: point,
        clicks_a: model.clicks_a + (if point is Some(_) { 1 } else { 0 }),
      }
    ChartB(Click(point)) =>
      {
        ..model,
        selected_b: point,
        clicks_b: model.clicks_b + (if point is Some(_) { 1 } else { 0 }),
      }
    ChartA(ToggleSeries(key)) =>
      {
        ..model,
        line_a: if key == "trend" {
          !model.line_a
        } else {
          model.line_a
        },
        scatter_a: if key == "samples" {
          !model.scatter_a
        } else {
          model.scatter_a
        },
        hover_a: None,
        selected_a: None,
      }
    ChartB(ToggleSeries(_)) =>
      { ..model, line_b: !model.line_b, hover_b: None, selected_b: None, }
    UpdateData =>
      {
        ..model,
        version: model.version + 1,
        hover_a: None,
        selected_a: None,
        hover_b: None,
        selected_b: None,
      }
    ToggleMount =>
      {
        ..model,
        mounted: !model.mounted,
        hover_a: None,
        selected_a: None,
        hover_b: None,
        selected_b: None,
      }
    Reset => initial_model()
  }
}

///|
fn first_chart(model : Model) -> @drawing.Drawing raise {
  let fig = @mathplotlib.figure(width=560, height=350)
  fig.set_title("Weekly throughput")
  fig.set_x_label("Week")
  fig.set_y_label("Items")
  fig.set_x_limits(0.5, 5.5)
  fig.set_y_limits(0.0, 10.0)
  fig.grid(axis="y", color="#e2e8f0", linewidth=0.7)
  let shift = if model.version % 2 == 0 { 0.0 } else { 1.0 }
  let line = fig.plot_line(
    @mathplotlib.LineData::Numeric([1.0, 2.0, 3.0, 4.0, 5.0]),
    @mathplotlib.LineData::Numeric([2.0 + shift, 4.5, 3.25, 6.0 + shift, 5.5]),
    color="#2563eb",
    label="Trend",
  )
  line.set_visible(model.line_a)
  let points = if model.scatter_a {
    [
      @mathplotlib.point(1.0, 2.2),
      @mathplotlib.point(2.0, 4.1 + shift),
      @mathplotlib.point(3.0, 3.7),
      @mathplotlib.point(4.0, 5.4),
      @mathplotlib.point(5.0, 6.2 + shift),
    ]
  } else {
    []
  }
  fig.scatter(points, color="#f97316", label="Samples")
  fig.set_legend_position(@mathplotlib.LegendPosition::UpperLeft)
  fig.to_drawing()
}

///|
fn second_chart(model : Model) -> @drawing.Drawing raise {
  let fig = @mathplotlib.figure(width=560, height=350)
  fig.set_title("Independent chart")
  fig.set_x_label("Sample")
  fig.set_y_label("Value")
  fig.set_x_limits(0.5, 5.5)
  fig.set_y_limits(0.0, 10.0)
  fig.grid(axis="y", color="#e2e8f0", linewidth=0.7)
  let line = fig.plot_line(
    @mathplotlib.LineData::Numeric([1.0, 2.0, 3.0, 4.0, 5.0]),
    @mathplotlib.LineData::Numeric([7.0, 6.0, 8.0, 5.0, 6.5]),
    color="#16a34a",
    label="Reference",
  )
  line.set_visible(model.line_b)
  fig.to_drawing()
}

///|
fn selected_text(point : @drawing.HitPoint?) -> String {
  match point {
    None => "none"
    Some(point) =>
      "series=\{point.artist_index}; point=\{point.point_index}; x=\{point.data_x}; y=\{point.data_y}"
  }
}

///|
fn content(model : Model, emit : @rabbita.Emit[Msg]) -> @html.Html raise {
  let charts = if model.mounted {
    @html.div(class="charts", [
      @html.div(class="chart-card", [
        @plot_dom.view(
          first_chart(model),
          id="chart-a",
          on_event=event => emit(ChartA(event)),
          hovered?=model.hover_a,
          selected?=model.selected_a,
          legend=[
            @plot_dom.legend_item("trend", "Trend", "#2563eb", model.line_a),
            @plot_dom.legend_item(
              "samples",
              "Samples",
              "#f97316",
              model.scatter_a,
            ),
          ],
        ),
        @html.div(
          id="a-selection",
          "Selected: " + selected_text(model.selected_a),
        ),
        @html.div(id="a-clicks", "Clicks: \{model.clicks_a}"),
      ]),
      @html.div(class="chart-card", [
        @plot_dom.view(
          second_chart(model),
          id="chart-b",
          on_event=event => emit(ChartB(event)),
          hovered?=model.hover_b,
          selected?=model.selected_b,
          legend=[
            @plot_dom.legend_item(
              "reference",
              "Reference",
              "#16a34a",
              model.line_b,
            ),
          ],
        ),
        @html.div(
          id="b-selection",
          "Selected: " + selected_text(model.selected_b),
        ),
        @html.div(id="b-clicks", "Clicks: \{model.clicks_b}"),
      ]),
    ])
  } else {
    @html.div(id="unmounted", "Charts removed. Mount them again to continue.")
  }
  @html.div([
    @html.div(class="controls", [
      @html.button(id="update-data", on_click=emit(UpdateData), "Update data"),
      @html.button(
        id="toggle-mount",
        on_click=emit(ToggleMount),
        if model.mounted {
          "Unmount charts"
        } else {
          "Mount charts"
        },
      ),
      @html.button(id="reset", on_click=emit(Reset), "Reset"),
      @html.span(id="data-version", "Data version: \{model.version}"),
    ]),
    charts,
  ])
}

///|
fn main {
  @rabbita.new(() => {
    let (state, emit) = @rabbita.create_pure_state(initial_model(), update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="plot-error", "Plot error: \{error}")
      }
    })
  }).mount("app")
}
