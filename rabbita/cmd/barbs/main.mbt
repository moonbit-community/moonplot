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
  pivot : Int32
  flipped : Bool
  fill_empty : Bool
} derive(Eq)

///|
enum Msg {
  Chart(Int32, @plot_dom.Interaction)
  Update
  Mount
  Pivot
  Flip
  Calm
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
    Pivot =>
      { ..model, charts: clear_chart(model, 1), pivot: (model.pivot + 1) % 3, }
    Flip => { ..model, charts: clear_chart(model, 1), flipped: !model.flipped, }
    Calm =>
      { ..model, charts: clear_chart(model, 1), fill_empty: !model.fill_empty, }
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
fn pivot(model : Model) -> String {
  ["middle", "tip", "tail"][model.pivot]
}

///|
fn xs(index : Int32) -> Array[Double] {
  if index == 0 {
    [1.0, 3.0, 7.0, 1.0]
  } else {
    [5.0, 9.0, 10.0, 3.0]
  }
}

///|
fn ys(index : Int32) -> Array[Double] {
  if index == 0 {
    [1.0, 2.0, 6.0, 7.0]
  } else {
    [3.0, 10.0, 2.0, 11.0]
  }
}

///|
fn us(index : Int32, changed : Bool) -> Array[Double] {
  if index == 0 {
    if changed {
      [3.0, 0.0, -2.0, 1.0]
    } else {
      [2.0, 0.0, -3.0, 2.0]
    }
  } else if changed {
    [5.5, -3.5, 0.2, 0.0]
  } else {
    [6.5, -2.5, 0.1, 0.0]
  }
}

///|
fn vs(index : Int32, changed : Bool) -> Array[Double] {
  if index == 0 {
    if changed {
      [2.0, 0.0, -3.0, -3.0]
    } else {
      [3.0, 0.0, -2.0, -2.0]
    }
  } else if changed {
    [0.0, 0.0, -0.1, 0.0]
  } else {
    [0.0, 0.0, 0.2, 0.0]
  }
}

///|
fn colors() -> Array[String] {
  ["#398575", "#8a70b5"]
}

///|
fn series_names() -> Array[String] {
  ["Basic wind", "Detailed wind"]
}

///|
fn chart_drawing(model : Model, index : Int32) -> @drawing.Drawing raise {
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
  let limit = if index == 0 { 8.0 } else { 14.0 }
  fig.set_x_limits(0.0, limit)
  fig.set_y_limits(0.0, limit)
  let changed = model.revision % 2 == 1
  if model.visible[index] {
    if index == 0 {
      fig.barbs(
        xs(index),
        ys(index),
        us(index, changed),
        vs(index, changed),
        color=colors()[index],
        linewidth=1.2,
        barb_length=0.7,
        label=series_names()[index],
      )
    } else {
      fig.barbs_with_options(
        xs(index),
        ys(index),
        us(index, changed),
        vs(index, changed),
        color=colors()[index],
        linewidth=1.2,
        barb_length=12.0,
        label=series_names()[index],
        half_increment=0.5,
        full_increment=1.0,
        flag_increment=5.0,
        rounding=true,
        flip=model.flipped,
        fill_empty=model.fill_empty,
        pivot=pivot(model),
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
fn custom_tooltip(info : @drawing.HitInfo) -> @html.Html {
  if info.vector is Some(vector) {
    @html.div(class="barb-reading", [
      @html.b("原始风矢量"),
      reading_row("输入位置", "\{info.point.data_x}, \{info.point.data_y}"),
      reading_row("横向 U", vector.u.to_string()),
      reading_row("纵向 V", vector.v.to_string()),
    ])
  } else {
    @html.span(info.value.to_string())
  }
}

///|
fn chart_card(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let id = if index == 0 { "barb-basic" } else { "barb-advanced" }
  let state = model.charts[index]
  let drawing = chart_drawing(model, index)
  let summary = match state.selected {
    Some(point) =>
      match drawing.hit_info(point) {
        Some(info) =>
          "Selected: \{info.series} · \{info.point.data_x}, \{info.point.data_y}"
        None => "Selection updated."
      }
    None => "Click to keep a selection."
  }
  let attrs = @html.Attrs::build()
    .data_set("clicks", state.clicks.to_string())
    .data_set("hovered", (state.hover is Some(_)).to_string())
    .data_set("selected", (state.selected is Some(_)).to_string())
    .data_set("pivot", if index == 0 { "tail" } else { pivot(model) })
    .data_set("flipped", (index == 1 && model.flipped).to_string())
    .data_set("fill-empty", (index == 1 && model.fill_empty).to_string())
    .data_set("hit-mode", if index == 1 { "x-nearest" } else { "nearest" })
  let segments = [ for _ in 0..<4 => 0 ]
  let flags = [ for _ in 0..<4 => 0 ]
  let circles = [ for _ in 0..<4 => 0 ]
  for target in drawing.targets() {
    if target.info.kind is Barbs {
      let source = target.info.point.point_index
      if source >= 0 && source < 4 {
        match target.shape {
          Segment(_, _, _, _) => segments[source] += 1
          Quadrilateral(_, _, _, _, _, _, _, _) => {
            flags[source] += 1
            ignore(
              attrs.data_set(
                "flag-\{source}-artist",
                target.info.point.artist_index.to_string(),
              ),
            )
          }
          Sector(_, _, _, _, _) => {
            circles[source] += 1
            ignore(
              attrs.data_set(
                "circle-\{source}-artist",
                target.info.point.artist_index.to_string(),
              ),
            )
          }
          _ => ()
        }
      }
    }
  }
  for source in 0..<4 {
    ignore(attrs.data_set("segments-\{source}", segments[source].to_string()))
    ignore(attrs.data_set("flags-\{source}", flags[source].to_string()))
    ignore(attrs.data_set("circles-\{source}", circles[source].to_string()))
  }
  if state.hover is Some(point) {
    ignore(attrs.data_set("point", point.point_index.to_string()))
    ignore(attrs.data_set("artist", point.artist_index.to_string()))
    ignore(attrs.data_set("data-x", point.data_x.to_string()))
    ignore(attrs.data_set("data-y", point.data_y.to_string()))
    if drawing.hit_info(point) is Some(info) {
      ignore(attrs.data_set("series", info.series))
      ignore(attrs.data_set("value", info.value.to_string()))
      ignore(
        attrs.data_set("vector-present", (info.vector is Some(_)).to_string()),
      )
      ignore(attrs.data_set("band-present", (info.band is Some(_)).to_string()))
      ignore(
        attrs.data_set(
          "interval-present",
          (info.interval is Some(_)).to_string(),
        ),
      )
      ignore(
        attrs.data_set(
          "fraction-present",
          (info.fraction is Some(_)).to_string(),
        ),
      )
      if info.vector is Some(vector) {
        ignore(attrs.data_set("u", vector.u.to_string()))
        ignore(attrs.data_set("v", vector.v.to_string()))
        let source = point.point_index
        if source >= 0 && source < 4 {
          let changed = model.revision % 2 == 1
          ignore(attrs.data_set("expected-x", xs(index)[source].to_string()))
          ignore(attrs.data_set("expected-y", ys(index)[source].to_string()))
          ignore(
            attrs.data_set("expected-u", us(index, changed)[source].to_string()),
          )
          ignore(
            attrs.data_set("expected-v", vs(index, changed)[source].to_string()),
          )
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
            "A line and its feathers"
          } else {
            "Flags, feathers and calm"
          },
        ),
        @html.p(
          class="chart-caption",
          if index == 0 {
            "Follow a shaft or one of its three feathers."
          } else {
            "Inspect marks at their original input position."
          },
        ),
      ]),
      @html.span(class="chart-unit", "Components"),
    ]),
    @html.div(
      class="chart-options",
      if index == 0 {
        [@html.span(class="chart-option-note", "Basic wind barbs")]
      } else {
        [
          @html.button(
            id="barbs-pivot",
            class="button button-quiet",
            on_click=emit(Pivot),
            "Anchor: \{pivot(model)}",
          ),
          @html.button(
            id="barbs-flip",
            class="button button-quiet",
            on_click=emit(Flip),
            if model.flipped {
              "Feathers: flipped"
            } else {
              "Feathers: normal"
            },
          ),
          @html.button(
            id="barbs-calm",
            class="button button-quiet",
            on_click=emit(Calm),
            if model.fill_empty {
              "Calm: visible"
            } else {
              "Calm: hidden"
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
      tooltip_class=if index == 0 { "" } else { "barb-tooltip" },
      legend=[
        @plot_dom.legend_item(
          "barbs",
          series_names()[index],
          colors()[index],
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
        id="barbs-revision",
        class="data-version",
        "Revision \{model.revision}",
      ),
      @html.div(class="control-actions", [
        @html.button(
          id="barbs-mount",
          class="button",
          on_click=emit(Mount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="barbs-update",
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
      @html.div(id="barbs-unmounted", "Charts are paused.")
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
      pivot: 0,
      flipped: false,
      fill_empty: true,
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="barbs-error", "Chart error: \{error}")
      }
    })
  }).mount("app")
}
