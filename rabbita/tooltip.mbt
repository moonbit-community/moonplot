///|
// Resolve against this exact snapshot before displaying application-held state.
// Old callers can still construct Drawings containing only ordinary points.
fn tooltip_info(
  drawing : @drawing.Drawing,
  point : @drawing.HitPoint,
) -> @drawing.HitInfo? {
  match drawing.hit_info(point) {
    Some(info) => Some(info)
    None =>
      if drawing.points().contains(point) {
        Some(@drawing.hit_info(point, Scatter, value=point.data_y))
      } else {
        None
      }
  }
}

///|
fn tooltip_kind(kind : @drawing.HitKind) -> String {
  match kind {
    Line => "line"
    Scatter => "scatter"
    Bar => "bar"
    BarH => "barh"
    Histogram => "histogram"
    Histogram2D => "histogram2d"
    Pie => "pie"
    Heatmap => "heatmap"
    ErrorBar => "errorbar"
    Area => "area"
    BoxPlot => "boxplot"
  }
}

///|
// Keep presentation separate from the numeric metadata handed to applications.
fn tooltip_rows(info : @drawing.HitInfo) -> Array[(String, String)] {
  let rows : Array[(String, String)] = []
  if info.category is Some(category) {
    rows.push(("Category", category))
  }
  match info.kind {
    Line | Scatter =>
      if info.category is None {
        rows.push(("x", info.point.data_x.to_string()))
        rows.push(("y", info.point.data_y.to_string()))
      } else {
        rows.push(("Value", info.value.to_string()))
      }
    Histogram => {
      if info.interval is Some((lower, upper)) {
        rows.push(("Range", "\{lower} – \{upper}"))
      }
      rows.push(("Count", info.value.to_string()))
    }
    Histogram2D => {
      if info.cell is Some(cell) {
        let (xmin, xmax) = cell.x_range
        let (ymin, ymax) = cell.y_range
        rows.push(("x range", "\{xmin} – \{xmax}"))
        rows.push(("y range", "\{ymin} – \{ymax}"))
      }
      rows.push(("Count", info.value.to_string()))
    }
    Pie => {
      rows.push(("Value", info.value.to_string()))
      if info.fraction is Some(fraction) {
        let percent = (fraction * 10000.0).round() / 100.0
        rows.push(("Share", "\{percent}%"))
      }
    }
    Area =>
      if info.band is Some(band) {
        rows.push(
          if band.horizontal {
            ("y", info.point.data_y.to_string())
          } else {
            ("x", info.point.data_x.to_string())
          },
        )
        rows.push(("Lower", band.lower.to_string()))
        rows.push(("Upper", band.upper.to_string()))
        if band.stacked {
          rows.push(("Value", info.value.to_string()))
        }
      } else {
        rows.push(("Value", info.value.to_string()))
      }
    Bar | BarH => rows.push(("Value", info.value.to_string()))
    ErrorBar => {
      rows.push(("x", info.point.data_x.to_string()))
      rows.push(("y", info.point.data_y.to_string()))
      if info.error is Some(error) {
        let (xmin, xmax) = error.x_range
        let (ymin, ymax) = error.y_range
        rows.push(("x range", "\{xmin} – \{xmax}"))
        rows.push(("y range", "\{ymin} – \{ymax}"))
      }
    }
    BoxPlot =>
      if info.box is Some(box) {
        rows.push(("Group", (box.group_index + 1).to_string()))
        rows.push(("Median", box.median.to_string()))
        rows.push(("Q1", box.q1.to_string()))
        rows.push(("Q3", box.q3.to_string()))
        let lower = box.lower_whisker
        let upper = box.upper_whisker
        rows.push(("Whiskers", "\{lower} – \{upper}"))
        if box.part is Outlier(value) {
          rows.push(("Outlier", value.to_string()))
        }
      } else {
        rows.push(("Value", info.value.to_string()))
      }
    Heatmap => {
      if info.cell is Some(cell) {
        rows.push(("Row", cell.row.to_string()))
        rows.push(("Column", cell.column.to_string()))
      }
      rows.push(("Value", info.value.to_string()))
    }
  }
  rows
}

///|
fn default_tooltip(info : @drawing.HitInfo) -> @html.Html {
  let children : Array[@html.Html] = []
  if info.series != "" {
    children.push(@html.b(class="moonplot-tooltip-series", info.series))
  }
  children.push(
    @html.div(
      class="moonplot-tooltip-values",
      tooltip_rows(info).map(row => {
        @html.span(class="moonplot-coordinate", [
          @html.span(class="moonplot-coordinate-label", row.0),
          @html.b(row.1),
        ])
      }),
    ),
  )
  @html.div(class="moonplot-tooltip-content", children)
}

///|
fn tooltip_node(
  info : @drawing.HitInfo,
  id : String,
  class_name : String,
  render : ((@drawing.HitInfo) -> @rabbita.Html)?,
) -> @html.Html {
  @html.div(
    class="moonplot-tooltip" +
      (if class_name == "" { "" } else { " " + class_name }),
    attrs=@html.Attrs::build()
      .role("tooltip")
      .data_set("testid", id + "-tooltip")
      .data_set("moonplot-kind", tooltip_kind(info.kind)),
    match render {
      Some(render) => render(info)
      None => default_tooltip(info)
    },
  )
}
