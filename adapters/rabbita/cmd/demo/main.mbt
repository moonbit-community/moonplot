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
fn demo_figure() -> @mathplotlib.Figure raise {
  let fig = @mathplotlib.figure(width=560, height=350)
  fig.set_x_limits(0.5, 5.5)
  fig.set_y_limits(0.0, 10.0)
  fig.grid(axis="y", color="#e9edf1", linewidth=0.7)
  fig.legend([])
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
fn first_chart(model : Model) -> @drawing.Drawing raise {
  let fig = demo_figure()
  fig.set_x_label("Week")
  let shift = if model.version % 2 == 0 { 0.0 } else { 1.0 }
  let line = fig.plot_line(
    @mathplotlib.LineData::Numeric([1.0, 2.0, 3.0, 4.0, 5.0]),
    @mathplotlib.LineData::Numeric([2.0 + shift, 4.5, 3.25, 6.0 + shift, 5.5]),
    color="#4d79c7",
    label="Trend",
  )
  line.set_visible(model.line_a)
  line.set_linewidth(2.2)
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
  fig.scatter(points, color="#ce8650", label="Samples")
  fig.to_drawing()
}

///|
fn second_chart(model : Model) -> @drawing.Drawing raise {
  let fig = demo_figure()
  fig.set_x_label("Sample")
  let line = fig.plot_line(
    @mathplotlib.LineData::Numeric([1.0, 2.0, 3.0, 4.0, 5.0]),
    @mathplotlib.LineData::Numeric([7.0, 6.0, 8.0, 5.0, 6.5]),
    color="#398575",
    label="Reference",
  )
  line.set_visible(model.line_b)
  line.set_linewidth(2.2)
  fig.to_drawing()
}

///|
fn chart_heading(title : String, caption : String, unit : String) -> @html.Html {
  @html.div(class="chart-heading", [
    @html.div([@html.h2(title), @html.p(class="chart-caption", caption)]),
    @html.span(class="chart-unit", unit),
  ])
}

///|
fn selection_summary(
  id : String,
  point : @drawing.HitPoint?,
  clicks : Int32,
  first : Bool,
) -> @html.Html {
  let attrs = @html.Attrs::build()
    .data_set("clicks", clicks.to_string())
    .data_set("selected", (point is Some(_)).to_string())
  let text = match point {
    None => "Click a point to keep its value here."
    Some(point) => {
      ignore(
        attrs
        .data_set("point", point.point_index.to_string())
        .data_set("x", point.data_x.to_string())
        .data_set("y", point.data_y.to_string()),
      )
      if first {
        "Week \{point.data_x} · \{point.data_y} items"
      } else {
        "Sample \{point.data_x} · \{point.data_y}"
      }
    }
  }
  @html.div(class="chart-footer", [
    @html.div(id~, class="selection-summary", attrs~, [
      @html.span(
        class="selection-mark",
        attrs=@html.Attrs::build().aria_hidden("true"),
        "",
      ),
      @html.span(text),
    ]),
  ])
}

///|
fn content(model : Model, emit : @rabbita.Emit[Msg]) -> @html.Html raise {
  let charts = if model.mounted {
    @html.div(class="charts", [
      @html.div(class="chart-card", [
        chart_heading(
          "Weekly throughput", "Trend and observations over five weeks.", "Items",
        ),
        @plot_dom.view(
          first_chart(model),
          id="chart-a",
          on_event=event => emit(ChartA(event)),
          hovered?=model.hover_a,
          selected?=model.selected_a,
          legend=[
            @plot_dom.legend_item("trend", "Trend", "#4d79c7", model.line_a),
            @plot_dom.legend_item(
              "samples",
              "Samples",
              "#ce8650",
              model.scatter_a,
            ),
          ],
        ),
        selection_summary("a-selection", model.selected_a, model.clicks_a, true),
      ]),
      @html.div(class="chart-card", [
        chart_heading(
          "Reference series", "A separate view, with its own selection.", "Value",
        ),
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
              "#398575",
              model.line_b,
            ),
          ],
        ),
        selection_summary(
          "b-selection",
          model.selected_b,
          model.clicks_b,
          false,
        ),
      ]),
    ])
  } else {
    @html.div(id="unmounted", [
      @html.h2("Charts are paused"),
      @html.p("Show the charts again to continue exploring."),
    ])
  }
  @html.div([
    @html.div(class="controls", [
      @html.div(class="dataset", [
        @html.span(
          class="status-dot",
          attrs=@html.Attrs::build().aria_hidden("true"),
          "",
        ),
        @html.span("Sample dataset"),
        @html.span(
          id="data-version",
          class="data-version",
          "Revision \{model.version}",
        ),
      ]),
      @html.div(class="control-actions", [
        @html.button(
          id="reset",
          class="button button-quiet",
          on_click=emit(Reset),
          "Reset",
        ),
        @html.button(
          id="toggle-mount",
          class="button",
          on_click=emit(ToggleMount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="update-data",
          class="button button-primary",
          on_click=emit(UpdateData),
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
    let (state, emit) = @rabbita.create_pure_state(initial_model(), update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="plot-error", "Plot error: \{error}")
      }
    })
  }).mount("app")
}
