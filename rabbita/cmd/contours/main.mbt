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
  inline_labels : Bool
  masked : Bool
} derive(Eq)

///|
enum Msg {
  Chart(Int32, @plot_dom.Interaction)
  Update
  Mount
  Labels
  Mask
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
    Labels =>
      {
        ..model,
        charts: clear_chart(model, 0),
        inline_labels: !model.inline_labels,
      }
    Mask => { ..model, charts: clear_chart(model, 1), masked: !model.masked, }
    Chart(index, ToggleSeries(series)) => {
      let visible = model.visible.copy()
      let slot = index * 2 + (if series == "reference" { 1 } else { 0 })
      visible[slot] = !visible[slot]
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
fn colors() -> Array[String] {
  ["#398575", "#8a70b5"]
}

///|
fn series_names() -> Array[String] {
  ["Field levels", "Mesh levels"]
}

///|
fn reference_y(index : Int32) -> Double {
  if index == 0 {
    7.0
  } else {
    1.8
  }
}

///|
fn reference_xs(index : Int32) -> Array[Double] {
  if index == 0 {
    [12.0, 35.0]
  } else {
    [0.4, 1.6]
  }
}

///|
fn levels(model : Model, index : Int32) -> Array[Double] {
  let shifted = model.revision % 3 == 1
  if index == 0 {
    if model.revision % 3 == 2 {
      [0.75, 1.5, 2.25]
    } else if shifted {
      [1.5, 2.5, 3.5]
    } else {
      [0.5, 1.5, 2.5]
    }
  } else if shifted {
    [2.0, 4.0]
  } else {
    [1.0, 3.0]
  }
}

///|
fn regular_data(model : Model) -> Array[Array[Double]] {
  if model.revision % 3 == 2 {
    [[3.0, 3.0, 3.0], [3.0, 0.0, 3.0], [3.0, 3.0, 3.0]]
  } else if model.revision % 3 == 1 {
    [[1.0, 2.0, 3.0], [2.0, 3.0, 4.0], [3.0, 4.0, 5.0]]
  } else {
    [[0.0, 1.0, 2.0], [1.0, 2.0, 3.0], [2.0, 3.0, 4.0]]
  }
}

///|
fn chart_frame(
  model : Model,
  index : Int32,
) -> (@drawing.Drawing, @plot.ContourSet?) raise {
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
  let color = colors()[index]
  let mut result : @plot.ContourSet? = None
  if index == 0 {
    fig.set_x_limits(9.0, 41.0)
    fig.set_y_limits(-4.0, 9.0)
    if model.visible[0] {
      result = Some(
        fig.contour(
          regular_data(model),
          x=[10.0, 20.0, 40.0],
          y=[-3.0, 1.0, 8.0],
          levels=levels(model, index),
          color~,
          linewidth=1.3,
          label=series_names()[index],
        ),
      )
    }
    if model.visible[1] {
      fig.plot(
        reference_xs(index),
        [reference_y(index), reference_y(index)],
        color~,
        label="Reference",
      )
    }
    if result is Some(contours) {
      fig.clabel(
        contours,
        inline=model.inline_labels,
        fontsize=10,
        color="#627784",
      )
    }
  } else {
    fig.set_x_limits(0.25, 1.75)
    fig.set_y_limits(-0.1, 2.1)
    if model.visible[2] {
      result = Some(
        fig.tricontour(
          [0.0, 2.0, 2.0, 0.0],
          [0.0, 0.0, 2.0, 2.0],
          [[0, 1, 2], [0, 2, 3]],
          if model.revision % 3 == 1 {
            [1.0, 3.0, 5.0, 3.0]
          } else {
            [0.0, 2.0, 4.0, 2.0]
          },
          levels=levels(model, index),
          mask=if model.masked { [false, true] } else { [] },
          color~,
          linewidth=1.3,
          label=series_names()[index],
        ),
      )
    }
    if model.visible[3] {
      fig.plot(
        reference_xs(index),
        [reference_y(index), reference_y(index)],
        color~,
        label="Reference",
      )
    }
  }
  (fig.to_drawing(), result)
}

///|
fn double_attr(attrs : @html.Attrs, key : String, value : Double) -> Unit {
  ignore(attrs.data_set(key, value.to_string()))
}

///|
fn int_attr(attrs : @html.Attrs, key : String, value : Int32) -> Unit {
  ignore(attrs.data_set(key, value.to_string()))
}

///|
fn point_attrs(
  attrs : @html.Attrs,
  prefix : String,
  point : @drawing.HitPoint,
) -> Unit {
  int_attr(attrs, prefix + "slot", point.point_index)
  int_attr(attrs, prefix + "artist", point.artist_index)
  double_attr(attrs, prefix + "data-x", point.data_x)
  double_attr(attrs, prefix + "data-y", point.data_y)
  double_attr(attrs, prefix + "screen-x", point.screen_x)
  double_attr(attrs, prefix + "screen-y", point.screen_y)
}

///|
fn kind_name(info : @drawing.HitInfo) -> String {
  if info.kind is Contour {
    "contour"
  } else if info.kind is Line {
    "line"
  } else {
    "other"
  }
}

///|
fn frame_attrs(
  attrs : @html.Attrs,
  drawing : @drawing.Drawing,
  contours : @plot.ContourSet?,
) -> Unit {
  let paths = match contours {
    Some(set) => set.segments()
    None => []
  }
  let values = match contours {
    Some(set) => set.segment_levels()
    None => []
  }
  int_attr(attrs, "path-count", paths.length())
  for slot, points in paths {
    let key = "path-\{slot}-"
    double_attr(attrs, key + "level", values[slot])
    int_attr(attrs, key + "count", points.length())
    for j, point in points {
      double_attr(attrs, key + "point-\{j}-x", point.x())
      double_attr(attrs, key + "point-\{j}-y", point.y())
    }
  }
  let targets = drawing.targets()
  int_attr(attrs, "target-count", targets.length())
  for index, target in targets {
    let key = "target-\{index}-"
    point_attrs(attrs, key, target.info.point)
    ignore(attrs.data_set(key + "kind", kind_name(target.info)))
    ignore(attrs.data_set(key + "series", target.info.series))
    double_attr(attrs, key + "value", target.info.value)
    let (left, top, width, height) = target.bounds
    double_attr(attrs, key + "left", left)
    double_attr(attrs, key + "top", top)
    double_attr(attrs, key + "width", width)
    double_attr(attrs, key + "height", height)
    match target.shape {
      Segment(x0, y0, x1, y1) => {
        ignore(attrs.data_set(key + "shape", "segment"))
        double_attr(attrs, key + "x0", x0)
        double_attr(attrs, key + "y0", y0)
        double_attr(attrs, key + "x1", x1)
        double_attr(attrs, key + "y1", y1)
      }
      Point => ignore(attrs.data_set(key + "shape", "point"))
      _ => ignore(attrs.data_set(key + "shape", "other"))
    }
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
  if info.kind is Contour {
    @html.div(class="contour-reading", [
      @html.b("等值线"),
      reading_row("系列", info.series),
      reading_row("等值", info.value.to_string()),
      reading_row("线段中点", "\{info.point.data_x}, \{info.point.data_y}"),
    ])
  } else {
    @html.div(class="contour-reading", [
      @html.b("参考线"),
      reading_row("X", info.point.data_x.to_string()),
      reading_row("Y", info.point.data_y.to_string()),
    ])
  }
}

///|
fn chart_card(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let id = if index == 0 { "contour-regular" } else { "contour-triangle" }
  let state = model.charts[index]
  let (drawing, contours) = chart_frame(model, index)
  let summary = match state.selected {
    Some(point) =>
      match drawing.hit_info(point) {
        Some(info) =>
          if info.kind is Contour {
            "Selected: \{info.series} · level \{info.value}"
          } else {
            "Selected: Reference · \{info.point.data_x}, \{info.point.data_y}"
          }
        None => "Selection updated."
      }
    None => "Click to keep a selection."
  }
  let attrs = @html.Attrs::build()
    .data_set("clicks", state.clicks.to_string())
    .data_set("hovered", (state.hover is Some(_)).to_string())
    .data_set("selected", (state.selected is Some(_)).to_string())
    .data_set("inline", model.inline_labels.to_string())
    .data_set("masked", model.masked.to_string())
    .data_set("contour-visible", model.visible[index * 2].to_string())
    .data_set("reference-visible", model.visible[index * 2 + 1].to_string())
    .data_set("hit-mode", if index == 1 { "x-nearest" } else { "nearest" })
  frame_attrs(attrs, drawing, contours)
  if state.hover is Some(point) {
    point_attrs(attrs, "", point)
    if drawing.hit_info(point) is Some(info) {
      ignore(attrs.data_set("kind", kind_name(info)))
      ignore(attrs.data_set("series", info.series))
      double_attr(attrs, "value", info.value)
      ignore(attrs.data_set("cell-present", (info.cell is Some(_)).to_string()))
      ignore(
        attrs.data_set("error-present", (info.error is Some(_)).to_string()),
      )
      ignore(attrs.data_set("band-present", (info.band is Some(_)).to_string()))
      ignore(
        attrs.data_set(
          "fraction-present",
          (info.fraction is Some(_)).to_string(),
        ),
      )
      ignore(
        attrs.data_set("vector-present", (info.vector is Some(_)).to_string()),
      )
      ignore(
        attrs.data_set(
          "interval-present",
          (info.interval is Some(_)).to_string(),
        ),
      )
      if info.kind is Contour && contours is Some(set) {
        let values = set.segment_levels()
        if point.point_index >= 0 && point.point_index < values.length() {
          double_attr(attrs, "expected-level", values[point.point_index])
          ignore(attrs.data_set("expected-series", series_names()[index]))
        }
      }
    }
  }
  @html.div(class="chart-card", [
    @html.div(class="chart-heading", [
      @html.div([
        @html.h2(
          if index == 0 {
            "Across an uneven grid"
          } else {
            "Across a triangular mesh"
          },
        ),
        @html.p(
          class="chart-caption",
          if index == 0 {
            "Follow each level through the field."
          } else {
            "Compare the field with a masked face."
          },
        ),
      ]),
      @html.span(class="chart-unit", "Level"),
    ]),
    @html.div(
      class="chart-options",
      if index == 0 {
        [
          @html.button(
            id="contours-labels",
            class="button button-quiet",
            on_click=emit(Labels),
            if model.inline_labels {
              "Labels: inline"
            } else {
              "Labels: overlaid"
            },
          ),
        ]
      } else {
        [
          @html.button(
            id="contours-mask",
            class="button button-quiet",
            on_click=emit(Mask),
            if model.masked {
              "Mask: on"
            } else {
              "Mask: off"
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
      hit_radius=2.0,
      hit_mode=if index == 1 { XNearest } else { Nearest },
      tooltip?=if index == 0 { None } else { Some(custom_tooltip) },
      tooltip_class=if index == 0 { "" } else { "contour-tooltip" },
      legend=[
        @plot_dom.legend_item(
          "contour",
          series_names()[index],
          colors()[index],
          model.visible[index * 2],
        ),
        @plot_dom.legend_item(
          "reference",
          "Reference",
          colors()[index],
          model.visible[index * 2 + 1],
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
        id="contours-revision",
        class="data-version",
        "Revision \{model.revision}",
      ),
      @html.div(class="control-actions", [
        @html.button(
          id="contours-mount",
          class="button",
          on_click=emit(Mount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="contours-update",
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
      @html.div(id="contours-unmounted", "Charts are paused.")
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
      visible: [true, true, true, true],
      revision: 0,
      mounted: true,
      inline_labels: true,
      masked: true,
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="contours-error", "Chart error: \{error}")
      }
    })
  }).mount("app")
}
