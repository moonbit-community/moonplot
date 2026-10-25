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
  filtered : Bool
} derive(Eq)

///|
enum Msg {
  Chart(Int32, @plot_dom.Interaction)
  Update
  Mount
  Filter
}

///|
fn cleared(state : ChartState) -> ChartState {
  { ..state, hover: None, selected: None, }
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
    Filter => {
      let charts = model.charts.copy()
      charts[0] = cleared(charts[0])
      { ..model, charts, filtered: !model.filtered, }
    }
    Chart(index, ToggleSeries(_)) => {
      let charts = model.charts.copy()
      charts[index] = cleared(charts[index])
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
fn sample_values(changed : Bool) -> Array[Array[Double]] {
  if changed {
    [[2.0, 3.0, 4.0, 5.0, 10.0], [3.0, 4.0, 5.0, 6.0, 10.0]]
  } else {
    [[1.0, 2.0, 3.0, 4.0, 8.0], [2.0, 3.0, 4.0, 5.0, 9.0]]
  }
}

///|
fn chart_snapshot(
  model : Model,
  index : Int32,
) -> (@drawing.Drawing, @scene.Hexbin?, Array[@plot.ViolinStats]) raise {
  let fig = styled_figure()
  let changed = model.revision % 2 == 1
  let mut bins : @scene.Hexbin? = None
  let mut violins : Array[@plot.ViolinStats] = []
  if index < 2 {
    fig.set_x_limits(0.0, 4.0)
    fig.set_y_limits(0.0, 4.0)
    fig.set_xticks([0.0, 1.0, 2.0, 3.0, 4.0])
    fig.set_yticks([0.0, 1.0, 2.0, 3.0, 4.0])
    if model.visible[index] {
      let xs = [0.8, 1.2, 2.8, 3.1, 3.2]
      let ys = [1.6, 2.2, 1.6, 2.0, 2.2]
      if index == 0 {
        if changed {
          xs.push(0.9)
          ys.push(2.0)
        }
        bins = Some(
          fig.hexbin(
            xs,
            ys,
            gridsize=2,
            mincnt=if model.filtered { 3 } else { 0 },
            extent=[0.0, 4.0, 0.0, 4.0],
            vmin=0.0,
            vmax=5.0,
            edgecolor="#ffffff",
            linewidth=1.0,
            label="Observation count",
          ),
        )
      } else {
        bins = Some(
          fig.hexbin(
            xs,
            ys,
            values=if changed {
              [4.0, 8.0, 10.0, 20.0, 40.0]
            } else {
              [2.0, 6.0, 10.0, 20.0, 30.0]
            },
            gridsize=2,
            extent=[0.0, 4.0, 0.0, 4.0],
            bins="log",
            vmin=1.0,
            vmax=100.0,
            reduce_fn=@scene.hexbin_reducer(values => {
              values.fold(init=0.0, (total, value) => total + value)
            }),
            edgecolor="#ffffff",
            linewidth=1.0,
            label="Energy sum",
          ),
        )
      }
    }
  } else {
    let horizontal = index == 3
    if horizontal {
      fig.grid(visible=false)
      fig.grid(axis="x", color="#e9edf1", linewidth=0.7)
      fig.set_x_limits(0.0, 11.0)
      fig.set_y_limits(0.4, 2.6)
      fig.set_yticks([1.0, 2.0])
      fig.set_y_tick_labels(["North", "South"])
    } else {
      fig.set_x_limits(0.4, 2.6)
      fig.set_y_limits(0.0, 11.0)
      fig.set_xticks([1.0, 2.0])
      fig.set_x_tick_labels(["North", "South"])
    }
    if model.visible[index] {
      violins = fig.violinplot(
        sample_values(changed),
        positions=[1.0, 2.0],
        width=0.9,
        horizontal~,
        side=if horizontal {
          @plot.ViolinSide::Low
        } else {
          @plot.ViolinSide::Both
        },
        showmeans=true,
        showmedians=true,
        showextrema=true,
        quantiles=[[0.25, 0.75], [0.25, 0.75]],
        points=17,
        color=if horizontal { "#5e91a8" } else { "#8a70b5" },
        label="Response density",
      )
    }
  }
  (fig.to_drawing(), bins, violins)
}

///|
fn reduction_name(reduction : @drawing.HexbinReduction) -> String {
  match reduction {
    Count => "Count"
    Mean => "Mean"
    Sum => "Sum"
    Min => "Min"
    Max => "Max"
    Custom => "Custom"
  }
}

///|
fn violin_part(part : @drawing.ViolinPart) -> String {
  match part {
    Body(_, _, _) => "Body"
    Mean => "Mean"
    Median => "Median"
    Minimum => "Minimum"
    Maximum => "Maximum"
    Range => "Range"
    Quantile(_, _) => "Quantile"
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
  if info.hexbin is Some(bin) {
    @html.div(class="distribution-reading", [
      @html.b("累计用量"),
      reading_row("汇总值", "\{info.value} kWh"),
      reading_row("样本数", bin.count.to_string()),
      reading_row("中心", "\{info.point.data_x}, \{info.point.data_y}"),
      reading_row("汇总方式", "自定义求和"),
    ])
  } else if info.violin is Some(violin) {
    let region = if violin.group_index == 0 { "北区" } else { "南区" }
    let title = match violin.part {
      Body(_, _, _) => "密度估计采样"
      Mean => "均值"
      Median => "中位数"
      Minimum => "最小值"
      Maximum => "最大值"
      Range => "全范围"
      Quantile(index, _) => "分位线 \{index + 1}"
    }
    let rows = [
      @html.b("\{region} · \{title}"),
      reading_row("位置", "\{info.value} ms"),
    ]
    if violin.part is Body(_, _, density) {
      rows.push(
        reading_row("估计密度", "\{(density * 1000.0).round() / 1000.0}"),
      )
    }
    rows.push(reading_row("均值", "\{violin.mean} ms"))
    rows.push(reading_row("中位数", "\{violin.median} ms"))
    rows.push(
      reading_row("范围", "\{violin.minimum} – \{violin.maximum} ms"),
    )
    @html.div(class="distribution-reading", rows)
  } else {
    @html.span("\{info.value}")
  }
}

///|
fn chart_card(
  model : Model,
  index : Int32,
  emit : @rabbita.Emit[Msg],
) -> @html.Html raise {
  let ids = ["count", "reduce", "violin", "horizontal"]
  let titles = [
    "Observation counts", "Energy contributions", "Response density", "One side of the distribution",
  ]
  let captions = [
    "Count observations inside each hexagonal cell.", "Read the sum and sample count together.",
    "Explore estimated density and summary lines.", "Explore a horizontal, one-sided density estimate.",
  ]
  let names = [
    "Observation count", "Energy sum", "Response density", "Response density",
  ]
  let colors = ["#398575", "#4d79c7", "#8a70b5", "#5e91a8"]
  let id = "distribution-" + ids[index]
  let state = model.charts[index]
  let (drawing, bins, violins) = chart_snapshot(model, index)
  let summary = match state.selected {
    Some(point) =>
      match drawing.hit_info(point) {
        Some(info) => "Selected: \{info.series} · \{info.value}"
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
    ignore(attrs.data_set("data-x", point.data_x.to_string()))
    ignore(attrs.data_set("data-y", point.data_y.to_string()))
    if drawing.hit_info(point) is Some(info) {
      ignore(attrs.data_set("value", info.value.to_string()))
      if info.hexbin is Some(bin) {
        ignore(attrs.data_set("row", bin.row.to_string()))
        ignore(attrs.data_set("column", bin.column.to_string()))
        ignore(attrs.data_set("count", bin.count.to_string()))
        ignore(attrs.data_set("reduction", reduction_name(bin.reduction)))
        if bins is Some(source) &&
          point.point_index >= 0 &&
          point.point_index < source.counts().length() {
          let source_index = point.point_index
          ignore(
            attrs.data_set(
              "expected-count",
              source.counts()[source_index].to_string(),
            ),
          )
          ignore(
            attrs.data_set(
              "expected-value",
              source.values()[source_index].to_string(),
            ),
          )
          ignore(
            attrs.data_set(
              "expected-x",
              source.centers()[source_index].x().to_string(),
            ),
          )
          ignore(
            attrs.data_set(
              "expected-y",
              source.centers()[source_index].y().to_string(),
            ),
          )
        }
      }
      if info.violin is Some(violin) {
        ignore(attrs.data_set("group", violin.group_index.to_string()))
        ignore(attrs.data_set("position", violin.position.to_string()))
        ignore(attrs.data_set("horizontal", violin.horizontal.to_string()))
        ignore(attrs.data_set("mean", violin.mean.to_string()))
        ignore(attrs.data_set("median", violin.median.to_string()))
        ignore(attrs.data_set("minimum", violin.minimum.to_string()))
        ignore(attrs.data_set("maximum", violin.maximum.to_string()))
        ignore(attrs.data_set("part", violin_part(violin.part)))
        match violin.part {
          Body(sample, coordinate, density) => {
            ignore(attrs.data_set("sample", sample.to_string()))
            ignore(attrs.data_set("coordinate", coordinate.to_string()))
            ignore(attrs.data_set("density", density.to_string()))
            if violin.group_index >= 0 && violin.group_index < violins.length() {
              let expected = violins[violin.group_index]
              if sample >= 0 && sample < expected.coords().length() {
                ignore(
                  attrs.data_set(
                    "expected-coordinate",
                    expected.coords()[sample].to_string(),
                  ),
                )
                ignore(
                  attrs.data_set(
                    "expected-density",
                    expected.vals()[sample].to_string(),
                  ),
                )
              }
            }
          }
          Quantile(quantile, value) => {
            ignore(attrs.data_set("quantile", quantile.to_string()))
            ignore(attrs.data_set("quantile-value", value.to_string()))
          }
          _ => ()
        }
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
        if index == 0 {
          "Samples"
        } else if index == 1 {
          "Energy · kWh"
        } else {
          "Latency · ms"
        },
      ),
    ]),
    @plot_dom.view(
      drawing,
      id~,
      on_event=event => emit(Chart(index, event)),
      hovered?=state.hover,
      selected?=state.selected,
      hit_radius=if index >= 2 { 2.0 } else { 10.0 },
      tooltip?=if index == 0 { None } else { Some(custom_tooltip) },
      tooltip_class=if index == 0 { "" } else { "distribution-tooltip" },
      legend=[
        @plot_dom.legend_item(
          "distribution",
          names[index],
          colors[index],
          model.visible[index],
        ),
      ],
    ),
    if index >= 2 {
      @html.p(
        class="density-note",
        "Body values are samples of the estimated density.",
      )
    } else {
      @html.span("")
    },
    @html.div(class="chart-footer", [
      @html.div(id=id + "-status", class="selection-summary", attrs~, summary),
    ]),
  ])
}

///|
fn content(model : Model, emit : @rabbita.Emit[Msg]) -> @html.Html raise {
  @html.div([
    @html.div(class="controls", [
      @html.div([
        @html.span(
          id="distributions-revision",
          class="data-version",
          "Revision \{model.revision}",
        ),
        @html.span(
          id="distribution-filter-state",
          class="filter-state",
          "Min count \{if model.filtered { 3 } else { 0 }}",
        ),
      ]),
      @html.div(class="control-actions", [
        @html.button(
          id="distributions-filter",
          class="button",
          on_click=emit(Filter),
          if model.filtered {
            "Show all bins"
          } else {
            "Filter bins"
          },
        ),
        @html.button(
          id="distributions-mount",
          class="button",
          on_click=emit(Mount),
          if model.mounted {
            "Hide charts"
          } else {
            "Show charts"
          },
        ),
        @html.button(
          id="distributions-update",
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
          for index in 0..<4 => chart_card(model, index, emit)
        ],
      )
    } else {
      @html.div(id="distributions-unmounted", "Charts are paused.")
    },
  ])
}

///|
fn main {
  @rabbita.new(() => {
    let initial : Model = {
      charts: [
        for _ in 0..<4 => { hover: None, selected: None, clicks: 0, }
      ],
      visible: [true, true, true, true],
      revision: 0,
      mounted: true,
      filtered: false,
    }
    let (state, emit) = @rabbita.create_pure_state(initial, update~)
    state.view(model => {
      content(model, emit) catch {
        error => @html.div(id="distributions-error", "Chart error: \{error}")
      }
    })
  }).mount("app")
}
