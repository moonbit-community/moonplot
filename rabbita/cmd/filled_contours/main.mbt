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
  extended : Bool
  masked : Bool
} derive(Eq)

///|
enum Msg {
  Chart(Int32, @plot_dom.Interaction)
  Update
  Mount
  Extension
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
    Extension =>
      { ..model, charts: clear_chart(model, 0), extended: !model.extended, }
    Mask => { ..model, charts: clear_chart(model, 1), masked: !model.masked, }
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
fn series_names() -> Array[String] {
  ["Nested bands", "Island band"]
}

///|
fn levels(model : Model, index : Int32) -> Array[Double] {
  if model.revision % 2 == 1 {
    if index == 0 {
      [0.5, 1.5, 2.5, 3.5]
    } else {
      [1.5, 2.5]
    }
  } else {
    [0.5, 1.5]
  }
}

///|
fn expected_band(
  model : Model,
  index : Int32,
  slot : Int32,
) -> (Double, Double, Double)? {
  let requested = levels(model, index)
  let extended = index == 0 && model.extended
  let normal = slot - (if extended { 1 } else { 0 })
  let shifted = model.revision % 2 == 1
  let lower_data = if shifted { 1.0 } else { 0.0 }
  let upper_data = if shifted { 3.0 } else { 2.0 }
  if extended && slot == 0 {
    Some((lower_data, requested[0], (lower_data + requested[0]) / 2.0))
  } else if normal >= 0 && normal + 1 < requested.length() {
    Some(
      (
        requested[normal],
        requested[normal + 1],
        (requested[normal] + requested[normal + 1]) / 2.0,
      ),
    )
  } else if extended && slot == requested.length() {
    Some(
      (
        requested[requested.length() - 1],
        upper_data,
        (requested[requested.length() - 1] + upper_data) / 2.0,
      ),
    )
  } else {
    None
  }
}

///|
fn chart_frame(
  model : Model,
  index : Int32,
) -> (@drawing.Drawing, @plot.ContourSet?) raise {
  let fig = @plot.figure(width=400, height=300)
  fig.legend([])
  fig.axes().set_axis_off()
  let mut result : @plot.ContourSet? = None
  let shifted = model.revision % 2 == 1
  if index == 0 {
    fig.set_x_limits(-1.5, 1.5)
    fig.set_y_limits(-1.5, 1.5)
    if model.visible[index] {
      result = Some(
        fig.contourf(
          if shifted {
            [[3.0, 3.0, 3.0], [3.0, 1.0, 3.0], [3.0, 3.0, 3.0]]
          } else {
            [[2.0, 2.0, 2.0], [2.0, 0.0, 2.0], [2.0, 2.0, 2.0]]
          },
          x=[-2.0, 0.0, 2.0],
          y=[-2.0, 0.0, 2.0],
          levels=levels(model, index),
          extend_mode=if model.extended { "both" } else { "neither" },
          label=series_names()[index],
          colors=if shifted && model.extended {
            ["#647d91", "#8a70b5", "#398575", "#4d79c7", "#647d91"]
          } else if !model.extended && !shifted {
            ["#398575"]
          } else {
            ["#8a70b5", "#398575", "#4d79c7"]
          },
        ),
      )
    }
  } else {
    fig.set_x_limits(-3.5, 3.5)
    fig.set_y_limits(-1.5, 1.5)
    if model.visible[index] {
      let mesh = @scene.triangulation(
        [-2.0, -3.0, -1.0, -1.0, -3.0, 2.0, 1.0, 3.0, 3.0, 1.0],
        [0.0, -1.0, -1.0, 1.0, 1.0, 0.0, -1.0, -1.0, 1.0, 1.0],
        triangles=[
          [0, 1, 2],
          [0, 2, 3],
          [0, 3, 4],
          [0, 4, 1],
          [5, 6, 7],
          [5, 7, 8],
          [5, 8, 9],
          [5, 9, 6],
        ],
        mask=if model.masked {
          [true, false, false, false, false, false, false, false]
        } else {
          []
        },
      )
      result = Some(
        fig.tricontourf_triangulation(
          mesh,
          if shifted {
            [1.0, 2.0, 2.0, 2.0, 2.0, 1.0, 2.0, 2.0, 2.0, 2.0]
          } else {
            [0.0, 1.0, 1.0, 1.0, 1.0, 0.0, 1.0, 1.0, 1.0, 1.0]
          },
          levels=levels(model, index),
          colors=["#398575"],
          label=series_names()[index],
        ),
      )
    }
  }
  (fig.to_drawing(), result)
}

///|
fn int_attr(attrs : @html.Attrs, key : String, value : Int32) -> Unit {
  ignore(attrs.data_set(key, value.to_string()))
}

///|
fn double_attr(attrs : @html.Attrs, key : String, value : Double) -> Unit {
  ignore(attrs.data_set(key, value.to_string()))
}

///|
fn point_attrs(
  attrs : @html.Attrs,
  key : String,
  point : @drawing.HitPoint,
) -> Unit {
  int_attr(attrs, key + "slot", point.point_index)
  int_attr(attrs, key + "artist", point.artist_index)
  double_attr(attrs, key + "data-x", point.data_x)
  double_attr(attrs, key + "data-y", point.data_y)
  double_attr(attrs, key + "screen-x", point.screen_x)
  double_attr(attrs, key + "screen-y", point.screen_y)
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
  let layers = match contours {
    Some(set) => set.layers()
    None => []
  }
  int_attr(attrs, "returned-path-count", paths.length())
  int_attr(attrs, "returned-layer-count", layers.length())
  for i, layer in layers {
    double_attr(attrs, "returned-layer-\{i}", layer)
  }
  for i, path in paths {
    double_attr(attrs, "returned-path-\{i}-layer", values[i])
    int_attr(attrs, "returned-path-\{i}-count", path.length())
    for j, point in path {
      double_attr(attrs, "returned-path-\{i}-point-\{j}-x", point.x())
      double_attr(attrs, "returned-path-\{i}-point-\{j}-y", point.y())
    }
  }
  let targets = drawing.targets()
  int_attr(attrs, "target-count", targets.length())
  for i, target in targets {
    let key = "target-\{i}-"
    point_attrs(attrs, key, target.info.point)
    ignore(
      attrs.data_set(
        key + "kind",
        if target.info.kind is ContourF {
          "contourf"
        } else {
          "other"
        },
      ),
    )
    ignore(attrs.data_set(key + "series", target.info.series))
    double_attr(attrs, key + "value", target.info.value)
    if target.info.interval is Some((lower, upper)) {
      double_attr(attrs, key + "lower", lower)
      double_attr(attrs, key + "upper", upper)
    }
    let (left, top, width, height) = target.bounds
    double_attr(attrs, key + "left", left)
    double_attr(attrs, key + "top", top)
    double_attr(attrs, key + "width", width)
    double_attr(attrs, key + "height", height)
    match target.shape {
      FilledRegion(region) => {
        ignore(attrs.data_set(key + "shape", "filled-region"))
        ignore(attrs.data_set(key + "even-odd", region.even_odd().to_string()))
        let rings = region.rings()
        int_attr(attrs, key + "ring-count", rings.length())
        for j, ring in rings {
          int_attr(attrs, key + "ring-\{j}-count", ring.length())
          for k, point in ring {
            double_attr(attrs, key + "ring-\{j}-point-\{k}-x", point.0)
            double_attr(attrs, key + "ring-\{j}-point-\{k}-y", point.1)
          }
        }
      }
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
  let rows = [@html.b("填色等值区"), reading_row("系列", info.series)]
  if info.interval is Some((lower, upper)) {
    rows.push(reading_row("区间", "\{lower} – \{upper}"))
  }
  rows.push(reading_row("代表值", info.value.to_string()))
  @html.div(class="filled-reading", rows)
}

///|
fn chart_card(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let id = if index == 0 { "filled-regular" } else { "filled-islands" }
  let state = model.charts[index]
  let (drawing, contours) = chart_frame(model, index)
  let summary = match state.selected {
    Some(point) =>
      match drawing.hit_info(point) {
        Some(info) =>
          match info.interval {
            Some((lower, upper)) =>
              "Selected: \{info.series} · \{lower} – \{upper}"
            None => "Selection updated."
          }
        None => "Selection updated."
      }
    None => "Click to keep a selection."
  }
  let attrs = @html.Attrs::build()
    .data_set("clicks", state.clicks.to_string())
    .data_set("hovered", (state.hover is Some(_)).to_string())
    .data_set("selected", (state.selected is Some(_)).to_string())
    .data_set("visible", model.visible[index].to_string())
    .data_set("extended", model.extended.to_string())
    .data_set("masked", model.masked.to_string())
    .data_set("hit-mode", if index == 0 { "nearest" } else { "x-nearest" })
  frame_attrs(attrs, drawing, contours)
  if state.hover is Some(point) {
    point_attrs(attrs, "", point)
    if drawing.hit_info(point) is Some(info) {
      ignore(
        attrs.data_set(
          "kind",
          if info.kind is ContourF {
            "contourf"
          } else {
            "other"
          },
        ),
      )
      ignore(attrs.data_set("series", info.series))
      double_attr(attrs, "value", info.value)
      ignore(
        attrs.data_set(
          "category-present",
          (info.category is Some(_)).to_string(),
        ),
      )
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
      if info.interval is Some((lower, upper)) {
        double_attr(attrs, "lower", lower)
        double_attr(attrs, "upper", upper)
      }
      if expected_band(model, index, point.point_index)
        is Some((lower, upper, value)) {
        double_attr(attrs, "expected-lower", lower)
        double_attr(attrs, "expected-upper", upper)
        double_attr(attrs, "expected-value", value)
        ignore(attrs.data_set("expected-series", series_names()[index]))
      }
    }
  }
  @html.div(class="chart-card", [
    @html.div(class="chart-heading", [
      @html.div([
        @html.h2(if index == 0 { "Nested ranges" } else { "Separate rings" }),
        @html.p(
          class="chart-caption",
          if index == 0 {
            "Follow a band through the field."
          } else {
            "One band can cover separate regions."
          },
        ),
      ]),
      @html.span(class="chart-unit", "Range"),
    ]),
    @html.div(
      class="chart-options",
      if index == 0 {
        [
          @html.button(
            id="filled-extend",
            class="button button-quiet",
            on_click=emit(Extension),
            if model.extended {
              "Extend: both"
            } else {
              "Extend: neither"
            },
          ),
        ]
      } else {
        [
          @html.button(
            id="filled-mask",
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
      hit_mode=if index == 0 { Nearest } else { XNearest },
      tooltip?=if index == 0 { None } else { Some(custom_tooltip) },
      tooltip_class=if index == 0 { "" } else { "filled-tooltip" },
      legend=[
        @plot_dom.legend_item(
          "bands",
          series_names()[index],
          "#398575",
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
        id="filled-revision",
        class="data-version",
        "Revision \{model.revision}",
      ),
      @html.div(class="control-actions", [
        @html.button(
          id="filled-mount",
          class="button",
          on_click=emit(Mount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="filled-update",
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
      @html.div(id="filled-unmounted", "Charts are paused.")
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
      visible: [true, true],
      revision: 0,
      mounted: true,
      extended: true,
      masked: false,
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="filled-error", "Chart error: \{error}")
      }
    })
  }).mount("app")
}
