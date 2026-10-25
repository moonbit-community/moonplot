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
  arrows : Bool
  with_color : Bool
} derive(Eq)

///|
enum Msg {
  Chart(Int32, @plot_dom.Interaction)
  Update
  Mount
  Arrows
  Color
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
    Arrows => { ..model, charts: clear_chart(model, 0), arrows: !model.arrows, }
    Color =>
      { ..model, charts: clear_chart(model, 1), with_color: !model.with_color, }
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
  ["Flow samples", "Color field"]
}

///|
fn field_grid(model : Model, horizontal : Bool) -> Array[Array[Double]] {
  let amplitude = if horizontal {
    if model.revision % 2 == 0 {
      1.0
    } else {
      1.5
    }
  } else if model.revision % 2 == 0 {
    0.0
  } else {
    0.375
  }
  [
    [amplitude, amplitude, amplitude],
    [0.0, 0.0, 0.0],
    [amplitude, amplitude, amplitude],
  ]
}

///|
fn color_grid(model : Model) -> Array[Array[Double]] {
  let shift = if model.revision % 2 == 0 { 0.0 } else { 3.0 }
  [
    [shift, shift + 1.0, shift + 2.0],
    [shift + 2.0, shift + 3.0, shift + 4.0],
    [shift + 4.0, shift + 5.0, shift + 6.0],
  ]
}

///|
fn width_grid(model : Model) -> Array[Array[Double]] {
  let row = if model.revision % 2 == 0 {
    [1.0, 2.0, 3.0]
  } else {
    [1.5, 2.0, 2.5]
  }
  [row.copy(), row.copy(), row.copy()]
}

///|
fn chart_frame(
  model : Model,
  index : Int32,
) -> (
  @drawing.Drawing,
  Array[@plot.Artist],
  Array[@scene.Container],
  @plot.StreamplotSet?,
) raise {
  let fig = @plot.figure(width=400, height=300)
  fig.legend([])
  fig.axes().set_axis_off()
  fig.set_x_limits(0.0, 2.0)
  fig.set_y_limits(0.0, 2.0)
  let mut result : @plot.StreamplotSet? = None
  if model.visible[index] {
    if index == 0 {
      result = Some(
        fig.streamplot_mesh(
          [[0.0, 1.0, 2.0], [0.0, 1.0, 2.0], [0.0, 1.0, 2.0]],
          [[0.0, 0.0, 0.0], [1.0, 1.0, 1.0], [2.0, 2.0, 2.0]],
          field_grid(model, true),
          field_grid(model, false),
          start_points=[
            @plot.point(0.25, 0.5),
            @plot.point(0.25, 1.0),
            @plot.point(0.25, 1.5),
          ],
          density=0.2,
          max_steps=6,
          minlength=0.0,
          maxlength=1.0,
          integration_direction="forward",
          broken_streamlines=false,
          color="#398575",
          linewidth=1.75,
          arrows=model.arrows,
          num_arrows=1,
          arrowstyle="-|>",
          arrow_size=1.2,
          label=series_names()[index],
        ),
      )
    } else {
      let shift = if model.revision % 2 == 0 { 0.0 } else { 3.0 }
      result = Some(
        fig.streamplot_with_style_grids(
          [0.0, 1.0, 2.0],
          [0.0, 1.0, 2.0],
          field_grid(model, true),
          field_grid(model, false),
          linewidths=width_grid(model),
          color_values=if model.with_color { color_grid(model) } else { [] },
          vmin=shift,
          vmax=shift + 3.0,
          start_points=[@plot.point(0.25, 1.0), @plot.point(0.25, 0.5)],
          density=0.2,
          max_steps=6,
          minlength=0.0,
          maxlength=1.0,
          integration_direction="forward",
          broken_streamlines=false,
          color="#398575",
          linewidth=1.75,
          arrows=true,
          num_arrows=1,
          arrowstyle="->",
          arrow_size=1.2,
          label=series_names()[index],
        ),
      )
    }
  }
  (fig.to_drawing(), fig.artists(), fig.containers(), result)
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
  int_attr(attrs, key + "edge", point.point_index)
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
      if info.kind is Streamplot {
        "streamplot"
      } else {
        "other"
      },
    ),
  )
  ignore(attrs.data_set(key + "series", info.series))
  double_attr(attrs, key + "value", info.value)
  ignore(
    attrs.data_set(
      key + "streamplot-present",
      (info.streamplot is Some(_)).to_string(),
    ),
  )
  if info.streamplot is Some(stream) {
    int_attr(attrs, key + "seed", stream.seed_index)
    double_attr(attrs, key + "u", stream.u)
    double_attr(attrs, key + "v", stream.v)
    ignore(
      attrs.data_set(
        key + "color-present",
        (stream.color_value is Some(_)).to_string(),
      ),
    )
    if stream.color_value is Some(value) {
      double_attr(attrs, key + "color-value", value)
    }
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
  ignore(
    attrs.data_set(
      key + "tricolor-present",
      (info.tricolor is Some(_)).to_string(),
    ),
  )
}

///|
fn artist_attrs(
  attrs : @html.Attrs,
  key : String,
  artists : Array[@plot.Artist],
) -> Unit {
  int_attr(attrs, key + "count", artists.length())
  for i, artist in artists {
    let prefix = key + "\{i}-"
    match artist {
      @plot.Artist::Line(points, style)
      | @plot.Artist::Polygon(points, style) => {
        ignore(
          attrs.data_set(
            prefix + "kind",
            if artist is Line(_, _) {
              "line"
            } else {
              "polygon"
            },
          ),
        )
        ignore(attrs.data_set(prefix + "color", style.color()))
        ignore(attrs.data_set(prefix + "fill", style.fill()))
        double_attr(attrs, prefix + "width", style.width())
        int_attr(attrs, prefix + "point-count", points.length())
        for j, point in points {
          double_attr(attrs, prefix + "point-\{j}-x", point.x())
          double_attr(attrs, prefix + "point-\{j}-y", point.y())
        }
      }
      _ => ignore(attrs.data_set(prefix + "kind", "other"))
    }
  }
}

///|
fn frame_attrs(
  attrs : @html.Attrs,
  drawing : @drawing.Drawing,
  artists : Array[@plot.Artist],
  containers : Array[@scene.Container],
  result : @plot.StreamplotSet?,
) -> Unit {
  artist_attrs(attrs, "paint-", artists)
  int_attr(attrs, "container-count", containers.length())
  for i, container in containers {
    ignore(
      attrs.data_set(
        "container-\{i}-kind",
        if container.kind() is Streamplot {
          "streamplot"
        } else {
          "other"
        },
      ),
    )
    ignore(attrs.data_set("container-\{i}-label", container.label()))
    artist_attrs(attrs, "container-\{i}-artist-", container.artists())
  }
  match result {
    Some(result) => {
      artist_attrs(attrs, "returned-line-", result.lines())
      artist_attrs(attrs, "returned-arrow-", result.arrows())
    }
    None => {
      int_attr(attrs, "returned-line-count", 0)
      int_attr(attrs, "returned-arrow-count", 0)
    }
  }
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
      Segment(x0, y0, x1, y1) => {
        ignore(attrs.data_set(key + "shape", "segment"))
        double_attr(attrs, key + "x0", x0)
        double_attr(attrs, key + "y0", y0)
        double_attr(attrs, key + "x1", x1)
        double_attr(attrs, key + "y1", y1)
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
fn display_number(value : Double) -> String {
  ((value * 1000.0).round() / 1000.0).to_string()
}

///|
fn custom_tooltip(info : @drawing.HitInfo) -> @html.Html {
  let rows = [@html.b("流场采样"), reading_row("系列", info.series)]
  if info.streamplot is Some(stream) {
    rows.push(reading_row("U", display_number(stream.u)))
    rows.push(reading_row("V", display_number(stream.v)))
    if stream.color_value is Some(value) {
      rows.push(reading_row("颜色值", display_number(value)))
    }
  }
  @html.div(class="stream-reading", rows)
}

///|
fn chart_card(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let id = if index == 0 { "streamlines-flow" } else { "streamlines-color" }
  let state = model.charts[index]
  let (drawing, artists, containers, result) = chart_frame(model, index)
  let attrs = @html.Attrs::build()
    .data_set("clicks", state.clicks.to_string())
    .data_set("hovered", (state.hover is Some(_)).to_string())
    .data_set("selected", (state.selected is Some(_)).to_string())
    .data_set("visible", model.visible[index].to_string())
    .data_set("arrows", (index == 1 || model.arrows).to_string())
    .data_set("with-color", (index == 1 && model.with_color).to_string())
    .data_set("revision", model.revision.to_string())
    .data_set("hit-radius", "1.5")
    .data_set("hit-mode", if index == 0 { "nearest" } else { "x-nearest" })
  frame_attrs(attrs, drawing, artists, containers, result)
  if state.hover is Some(point) {
    if drawing.hit_info(point) is Some(info) {
      info_attrs(attrs, "", info)
    }
  }
  let summary = match state.selected {
    Some(point) =>
      match drawing.hit_info(point) {
        Some(info) =>
          match info.streamplot {
            Some(stream) =>
              "Selected: \{info.series} · U \{display_number(stream.u)} · V \{display_number(stream.v)}"
            None => "Selection updated."
          }
        None => "Selection updated."
      }
    None => "Click to keep a selection."
  }
  @html.div(class="chart-card", [
    @html.div(class="chart-heading", [
      @html.div([
        @html.h2(
          if index == 0 {
            "Follow a line"
          } else {
            "One more dimension"
          },
        ),
        @html.p(
          class="chart-caption",
          if index == 0 {
            "Explore the flow between the arrows."
          } else {
            "A separate color field along the flow."
          },
        ),
      ]),
      @html.span(class="chart-unit", if index == 0 { "U / V" } else { "Color" }),
    ]),
    @html.div(class="chart-options", [
      if index == 0 {
        @html.button(
          id="streamlines-arrows",
          class="button button-quiet",
          on_click=emit(Arrows),
          if model.arrows {
            "Arrows: on"
          } else {
            "Arrows: off"
          },
        )
      } else {
        @html.button(
          id="streamlines-color-samples",
          class="button button-quiet",
          on_click=emit(Color),
          if model.with_color {
            "Color samples: on"
          } else {
            "Color samples: off"
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
      hit_radius=1.5,
      hit_mode=if index == 0 { Nearest } else { XNearest },
      tooltip?=if index == 1 { Some(custom_tooltip) } else { None },
      tooltip_class=if index == 1 { "stream-tooltip" } else { "" },
      legend=[
        @plot_dom.legend_item(
          "flow",
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
        id="streamlines-revision",
        class="data-version",
        "Revision \{model.revision}",
      ),
      @html.div(class="control-actions", [
        @html.button(
          id="streamlines-mount",
          class="button",
          on_click=emit(Mount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="streamlines-update",
          class="button button-primary",
          on_click=emit(Update),
          "Update field",
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
      @html.div(id="streamlines-unmounted", "Charts are paused.")
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
      arrows: true,
      with_color: true,
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="streamlines-error", "Chart error: \{error}")
      }
    })
  }).mount("app")
}
