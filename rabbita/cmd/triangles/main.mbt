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
  wide_scale : Array[Bool]
  revision : Int32
  mounted : Bool
  masked : Bool
  translated : Bool
} derive(Eq)

///|
enum Msg {
  Chart(Int32, @plot_dom.Interaction)
  Update
  Mount
  Mask
  Scale(Int32)
  Tooltip
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
    Mask => { ..model, charts: clear_chart(model, 0), masked: !model.masked, }
    Tooltip =>
      { ..model, charts: clear_chart(model, 1), translated: !model.translated, }
    Scale(index) => {
      let wide_scale = model.wide_scale.copy()
      wide_scale[index] = !wide_scale[index]
      { ..model, charts: clear_chart(model, index), wide_scale, }
    }
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
  ["Face values", "Vertex means"]
}

///|
fn input_x() -> Array[Double] {
  [0.0, 2.0, 2.0, 0.0, 1.0]
}

///|
fn input_y() -> Array[Double] {
  [0.0, 0.0, 2.0, 2.0, 1.0]
}

///|
fn input_faces() -> Array[Array[Int32]] {
  [[0, 1, 4], [1, 2, 4], [2, 3, 4], [3, 0, 4]]
}

///|
fn input_values(model : Model, index : Int32) -> Array[Double] {
  if index == 0 {
    if model.revision % 2 == 0 {
      [10.0, 20.0, 30.0, 40.0]
    } else {
      [12.0, 24.0, 36.0, 48.0]
    }
  } else if model.revision % 2 == 0 {
    [0.0, 3.0, 6.0, 9.0, 12.0]
  } else {
    [3.0, 6.0, 9.0, 12.0, 15.0]
  }
}

///|
fn norm_max(model : Model, index : Int32) -> Double {
  let normal = if index == 0 { 50.0 } else { 15.0 }
  normal * (if model.wide_scale[index] { 2.0 } else { 1.0 })
}

///|
fn chart_frame(
  model : Model,
  index : Int32,
) -> (@drawing.Drawing, Int32, Int32) raise {
  let fig = @plot.figure(width=400, height=300)
  fig.legend([])
  fig.axes().set_axis_off()
  fig.set_x_limits(-0.25, 2.25)
  fig.set_y_limits(-0.25, 2.25)
  if model.visible[index] {
    if index == 0 {
      fig.tripcolor(
        input_x(),
        input_y(),
        input_faces(),
        input_values(model, index),
        vmin=0.0,
        vmax=norm_max(model, index),
        mask=if model.masked { [false, true, false, false] } else { [] },
        label=series_names()[index],
      )
    } else {
      let mesh = @scene.triangulation(
        input_x(),
        input_y(),
        triangles=input_faces(),
      )
      fig.tripcolor_triangulation(
        mesh,
        input_values(model, index),
        vmin=0.0,
        vmax=norm_max(model, index),
        label=series_names()[index],
      )
    }
  }
  (fig.to_drawing(), fig.artists().length(), fig.containers().length())
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
fn info_attrs(
  attrs : @html.Attrs,
  key : String,
  info : @drawing.HitInfo,
) -> Unit {
  point_attrs(attrs, key, info.point)
  ignore(
    attrs.data_set(
      key + "kind",
      if info.kind is Tripcolor {
        "tripcolor"
      } else {
        "other"
      },
    ),
  )
  ignore(attrs.data_set(key + "series", info.series))
  double_attr(attrs, key + "value", info.value)
  ignore(
    attrs.data_set(
      key + "tricolor-present",
      (info.tricolor is Some(_)).to_string(),
    ),
  )
  if info.tricolor is Some(tricolor) {
    int_attr(attrs, key + "vertex-0", tricolor.vertices.0)
    int_attr(attrs, key + "vertex-1", tricolor.vertices.1)
    int_attr(attrs, key + "vertex-2", tricolor.vertices.2)
    ignore(
      attrs.data_set(key + "vertex-mean", tricolor.vertex_mean.to_string()),
    )
  }
  ignore(
    attrs.data_set(
      key + "category-present",
      (info.category is Some(_)).to_string(),
    ),
  )
  ignore(
    attrs.data_set(key + "cell-present", (info.cell is Some(_)).to_string()),
  )
  ignore(
    attrs.data_set(key + "error-present", (info.error is Some(_)).to_string()),
  )
  ignore(
    attrs.data_set(key + "band-present", (info.band is Some(_)).to_string()),
  )
  ignore(
    attrs.data_set(
      key + "fraction-present",
      (info.fraction is Some(_)).to_string(),
    ),
  )
  ignore(
    attrs.data_set(
      key + "interval-present",
      (info.interval is Some(_)).to_string(),
    ),
  )
  ignore(
    attrs.data_set(key + "vector-present", (info.vector is Some(_)).to_string()),
  )
  ignore(attrs.data_set(key + "box-present", (info.box is Some(_)).to_string()))
  ignore(
    attrs.data_set(key + "violin-present", (info.violin is Some(_)).to_string()),
  )
  ignore(
    attrs.data_set(key + "hexbin-present", (info.hexbin is Some(_)).to_string()),
  )
}

///|
fn frame_attrs(attrs : @html.Attrs, drawing : @drawing.Drawing) -> Unit {
  let targets = drawing.targets()
  int_attr(attrs, "target-count", targets.length())
  for i, target in targets {
    let key = "target-\{i}-"
    info_attrs(attrs, key, target.info)
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
  let rows = [@html.b("顶点均值"), reading_row("系列", info.series)]
  rows.push(reading_row("数值", info.value.to_string()))
  if info.tricolor is Some(tricolor) {
    let (a, b, c) = tricolor.vertices
    rows.push(reading_row("顶点", "\{a} · \{b} · \{c}"))
  }
  @html.div(class="triangle-reading", rows)
}

///|
fn chart_card(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let id = if index == 0 { "triangles-faces" } else { "triangles-vertices" }
  let state = model.charts[index]
  let (drawing, artists, containers) = chart_frame(model, index)
  let attrs = @html.Attrs::build()
    .data_set("clicks", state.clicks.to_string())
    .data_set("hovered", (state.hover is Some(_)).to_string())
    .data_set("selected", (state.selected is Some(_)).to_string())
    .data_set("visible", model.visible[index].to_string())
    .data_set("masked", (index == 0 && model.masked).to_string())
    .data_set("wide-scale", model.wide_scale[index].to_string())
    .data_set("revision", model.revision.to_string())
    .data_set("translated", (index == 1 && model.translated).to_string())
    .data_set("hit-mode", if index == 0 { "nearest" } else { "x-nearest" })
  double_attr(attrs, "norm-max", norm_max(model, index))
  int_attr(attrs, "artist-count", artists)
  int_attr(attrs, "container-count", containers)
  frame_attrs(attrs, drawing)
  if state.hover is Some(point) {
    if drawing.hit_info(point) is Some(info) {
      info_attrs(attrs, "", info)
    }
  }
  let summary = match state.selected {
    Some(point) =>
      match drawing.hit_info(point) {
        Some(info) => "Selected: \{info.series} · \{info.value}"
        None => "Selection updated."
      }
    None => "Click to keep a selection."
  }
  @html.div(class="chart-card", [
    @html.div(class="chart-heading", [
      @html.div([
        @html.h2(
          if index == 0 {
            "A value per face"
          } else {
            "From the vertices"
          },
        ),
        @html.p(
          class="chart-caption",
          if index == 0 {
            "One missing face leaves room to see through."
          } else {
            "Color follows the three vertex values."
          },
        ),
      ]),
      @html.span(class="chart-unit", if index == 0 { "Value" } else { "Mean" }),
    ]),
    @html.div(class="chart-options", [
      @html.button(
        id=id + "-scale",
        class="button button-quiet",
        on_click=emit(Scale(index)),
        if model.wide_scale[index] {
          "Color range: wide"
        } else {
          "Color range: normal"
        },
      ),
      if index == 0 {
        @html.button(
          id="triangles-mask",
          class="button button-quiet",
          on_click=emit(Mask),
          if model.masked {
            "Missing face: on"
          } else {
            "Missing face: off"
          },
        )
      } else {
        @html.button(
          id="triangles-tooltip",
          class="button button-quiet",
          on_click=emit(Tooltip),
          if model.translated {
            "提示：中文"
          } else {
            "Tooltip: default"
          },
        )
      },
    ]),
    @plot_dom.view(
      drawing,
      id~,
      on_event=event => emit(Chart(index, event)),
      hovered?=state.hover,
      selected?=state.selected,
      hit_radius=2.0,
      hit_mode=if index == 0 { Nearest } else { XNearest },
      tooltip?=if index == 1 && model.translated {
        Some(custom_tooltip)
      } else {
        None
      },
      tooltip_class=if index == 1 && model.translated {
        "triangle-tooltip"
      } else {
        ""
      },
      legend=[
        @plot_dom.legend_item(
          "faces",
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
        id="triangles-revision",
        class="data-version",
        "Revision \{model.revision}",
      ),
      @html.div(class="control-actions", [
        @html.button(
          id="triangles-mount",
          class="button",
          on_click=emit(Mount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="triangles-update",
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
      @html.div(id="triangles-unmounted", "Charts are paused.")
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
      wide_scale: [false, false],
      revision: 0,
      mounted: true,
      masked: true,
      translated: true,
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="triangles-error", "Chart error: \{error}")
      }
    })
  }).mount("app")
}
