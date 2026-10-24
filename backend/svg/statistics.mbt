///|
fn append_boxplot(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  stats : Array[@boxplot.BoxStats],
  horizontal : Bool,
  style : @core.Style,
) -> Unit {
  let fill = if style.fill() == "" { style.color() } else { style.fill() }
  let box_width = 0.6
  let cap_width = 0.2
  for index, stat in stats {
    let position = Double::from_int(index + 1)
    if horizontal {
      if !scale.x_axis_scale.is_valid(stat.q1()) ||
        !scale.x_axis_scale.is_valid(stat.q3()) {
        continue
      }
      let center_y = map_y(scale, top, plot_height, position)
      let y1 = map_y(scale, top, plot_height, position + box_width / 2.0)
      let y2 = map_y(scale, top, plot_height, position - box_width / 2.0)
      let x1 = map_x(scale, left, plot_width, stat.q1())
      let x2 = map_x(scale, left, plot_width, stat.q3())
      try! writer.empty_element("rect", [
        ("x", float_text(Double::min(x1, x2))),
        ("y", float_text(Double::min(y1, y2))),
        ("width", float_text(Double::abs(x2 - x1))),
        ("height", float_text(Double::abs(y2 - y1))),
        ("fill", fill),
        ("fill-opacity", "0.35"),
        ("stroke", style.color()),
        ("stroke-width", float_text(style.width())),
      ])
      let median_x = map_x(scale, left, plot_width, stat.median())
      let lower_x = map_x(scale, left, plot_width, stat.lower_whisker())
      let upper_x = map_x(scale, left, plot_width, stat.upper_whisker())
      append_error_segment(writer, lower_x, center_y, x1, center_y, style)
      append_error_segment(writer, x2, center_y, upper_x, center_y, style)
      append_error_segment(writer, median_x, y1, median_x, y2, style)
      let cap1 = map_y(scale, top, plot_height, position - cap_width / 2.0)
      let cap2 = map_y(scale, top, plot_height, position + cap_width / 2.0)
      append_error_segment(writer, lower_x, cap1, lower_x, cap2, style)
      append_error_segment(writer, upper_x, cap1, upper_x, cap2, style)
      for flier in stat.fliers() {
        if scale.x_axis_scale.is_valid(flier) {
          try! writer.empty_element("circle", [
            ("cx", float_text(map_x(scale, left, plot_width, flier))),
            ("cy", float_text(center_y)),
            ("r", "3"),
            ("fill", style.color()),
          ])
        }
      }
    } else {
      if !scale.y_axis_scale.is_valid(stat.q1()) ||
        !scale.y_axis_scale.is_valid(stat.q3()) {
        continue
      }
      let center_x = map_x(scale, left, plot_width, position)
      let x1 = map_x(scale, left, plot_width, position - box_width / 2.0)
      let x2 = map_x(scale, left, plot_width, position + box_width / 2.0)
      let y1 = map_y(scale, top, plot_height, stat.q1())
      let y2 = map_y(scale, top, plot_height, stat.q3())
      try! writer.empty_element("rect", [
        ("x", float_text(Double::min(x1, x2))),
        ("y", float_text(Double::min(y1, y2))),
        ("width", float_text(Double::abs(x2 - x1))),
        ("height", float_text(Double::abs(y2 - y1))),
        ("fill", fill),
        ("fill-opacity", "0.35"),
        ("stroke", style.color()),
        ("stroke-width", float_text(style.width())),
      ])
      let median_y = map_y(scale, top, plot_height, stat.median())
      let lower_y = map_y(scale, top, plot_height, stat.lower_whisker())
      let upper_y = map_y(scale, top, plot_height, stat.upper_whisker())
      append_error_segment(writer, center_x, lower_y, center_x, y1, style)
      append_error_segment(writer, center_x, y2, center_x, upper_y, style)
      append_error_segment(writer, x1, median_y, x2, median_y, style)
      let cap1 = map_x(scale, left, plot_width, position - cap_width / 2.0)
      let cap2 = map_x(scale, left, plot_width, position + cap_width / 2.0)
      append_error_segment(writer, cap1, lower_y, cap2, lower_y, style)
      append_error_segment(writer, cap1, upper_y, cap2, upper_y, style)
      for flier in stat.fliers() {
        if scale.y_axis_scale.is_valid(flier) {
          try! writer.empty_element("circle", [
            ("cx", float_text(center_x)),
            ("cy", float_text(map_y(scale, top, plot_height, flier))),
            ("r", "3"),
            ("fill", style.color()),
          ])
        }
      }
    }
  }
}

///|
fn violin_side_bounds(
  position : Double,
  width : Double,
  side : @render.ViolinSide,
) -> (Double, Double) {
  let half = width / 2.0
  match side {
    @render.ViolinSide::Both => (position - half, position + half)
    @render.ViolinSide::Low => (position - half, position)
    @render.ViolinSide::High => (position, position + half)
  }
}

///|
fn violin_polygon_points_text(
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  upper : Array[@core.Point],
  lower : Array[@core.Point],
) -> String {
  polygon_points_text(scale, left, top, plot_width, plot_height, upper, lower)
}

///|
fn append_violin_body(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  stat : @render.ViolinStats,
  position : Double,
  width : Double,
  horizontal : Bool,
  side : @render.ViolinSide,
  body_style : @core.Style,
  line_style : @core.Style,
  opacity : Double,
) -> Unit {
  let coords = stat.coords()
  let vals = stat.vals()
  let count = Int32::min(coords.length(), vals.length())
  if count < 2 {
    return
  }
  let mut maximum = 0.0
  for index in 0..<count {
    if vals[index] > maximum {
      maximum = vals[index]
    }
  }
  if maximum <= 0.0 || maximum.is_nan() || maximum.is_inf() {
    return
  }
  let upper = Array(capacity=count)
  let lower = Array(capacity=count)
  let half = width / 2.0
  for index in 0..<count {
    let coordinate = coords[index]
    let ratio = Double::max(0.0, vals[index] / maximum)
    let offset = half * ratio
    let low = match side {
      @render.ViolinSide::Both | @render.ViolinSide::Low => position - offset
      @render.ViolinSide::High => position
    }
    let high = match side {
      @render.ViolinSide::Both | @render.ViolinSide::High => position + offset
      @render.ViolinSide::Low => position
    }
    if horizontal {
      upper.push(@core.point(coordinate, high))
      lower.push(@core.point(coordinate, low))
    } else {
      upper.push(@core.point(high, coordinate))
      lower.push(@core.point(low, coordinate))
    }
  }
  let mut valid = true
  for index in 0..<count {
    if !valid_point(scale, upper[index]) || !valid_point(scale, lower[index]) {
      valid = false
    }
  }
  if valid {
    try! writer.empty_element("polygon", [
      (
        "points",
        violin_polygon_points_text(
          scale, left, top, plot_width, plot_height, upper, lower,
        ),
      ),
      ("fill", body_style.fill()),
      ("fill-opacity", float_text(opacity)),
      ("stroke", line_style.color()),
      ("stroke-width", float_text(line_style.width())),
    ])
  }
}

///|
fn append_violin_perpendicular(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  value : Double,
  position : Double,
  width : Double,
  horizontal : Bool,
  side : @render.ViolinSide,
  style : @core.Style,
) -> Unit {
  let (first, second) = violin_side_bounds(position, width, side)
  if horizontal {
    if scale.x_axis_scale.is_valid(value) &&
      scale.y_axis_scale.is_valid(first) &&
      scale.y_axis_scale.is_valid(second) {
      append_error_segment(
        writer,
        map_x(scale, left, plot_width, value),
        map_y(scale, top, plot_height, first),
        map_x(scale, left, plot_width, value),
        map_y(scale, top, plot_height, second),
        style,
      )
    }
  } else if scale.y_axis_scale.is_valid(value) &&
    scale.x_axis_scale.is_valid(first) &&
    scale.x_axis_scale.is_valid(second) {
    append_error_segment(
      writer,
      map_x(scale, left, plot_width, first),
      map_y(scale, top, plot_height, value),
      map_x(scale, left, plot_width, second),
      map_y(scale, top, plot_height, value),
      style,
    )
  }
}

///|
fn append_violin_parallel(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  lower : Double,
  upper : Double,
  position : Double,
  horizontal : Bool,
  style : @core.Style,
) -> Unit {
  if horizontal {
    if scale.x_axis_scale.is_valid(lower) &&
      scale.x_axis_scale.is_valid(upper) &&
      scale.y_axis_scale.is_valid(position) {
      append_error_segment(
        writer,
        map_x(scale, left, plot_width, lower),
        map_y(scale, top, plot_height, position),
        map_x(scale, left, plot_width, upper),
        map_y(scale, top, plot_height, position),
        style,
      )
    }
  } else if scale.y_axis_scale.is_valid(lower) &&
    scale.y_axis_scale.is_valid(upper) &&
    scale.x_axis_scale.is_valid(position) {
    append_error_segment(
      writer,
      map_x(scale, left, plot_width, position),
      map_y(scale, top, plot_height, lower),
      map_x(scale, left, plot_width, position),
      map_y(scale, top, plot_height, upper),
      style,
    )
  }
}

///|
fn append_violin(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  stats : Array[@render.ViolinStats],
  positions : Array[Double],
  widths : Array[Double],
  horizontal : Bool,
  side : @render.ViolinSide,
  showmeans : Bool,
  showextrema : Bool,
  showmedians : Bool,
  body_style : @core.Style,
  line_style : @core.Style,
  opacity : Double,
) -> Unit {
  let count = Int32::min(
    stats.length(),
    Int32::min(positions.length(), widths.length()),
  )
  for index in 0..<count {
    let stat = stats[index]
    let position = positions[index]
    let width = widths[index]
    append_violin_body(
      writer, scale, left, top, plot_width, plot_height, stat, position, width, horizontal,
      side, body_style, line_style, opacity,
    )
    if showmeans {
      append_violin_perpendicular(
        writer,
        scale,
        left,
        top,
        plot_width,
        plot_height,
        stat.mean(),
        position,
        width,
        horizontal,
        side,
        line_style,
      )
    }
    if showmedians {
      append_violin_perpendicular(
        writer,
        scale,
        left,
        top,
        plot_width,
        plot_height,
        stat.median(),
        position,
        width,
        horizontal,
        side,
        line_style,
      )
    }
    if showextrema {
      append_violin_perpendicular(
        writer,
        scale,
        left,
        top,
        plot_width,
        plot_height,
        stat.min(),
        position,
        width,
        horizontal,
        side,
        line_style,
      )
      append_violin_perpendicular(
        writer,
        scale,
        left,
        top,
        plot_width,
        plot_height,
        stat.max(),
        position,
        width,
        horizontal,
        side,
        line_style,
      )
      append_violin_parallel(
        writer,
        scale,
        left,
        top,
        plot_width,
        plot_height,
        stat.min(),
        stat.max(),
        position,
        horizontal,
        line_style,
      )
    }
    for quantile in stat.quantiles() {
      append_violin_perpendicular(
        writer, scale, left, top, plot_width, plot_height, quantile, position, width,
        horizontal, side, line_style,
      )
    }
  }
}
