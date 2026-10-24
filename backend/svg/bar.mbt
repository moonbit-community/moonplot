///|
fn append_bars(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  points : Array[@core.Point],
  style : @core.Style,
) -> Unit {
  let visible = bar_geometry_points(points)
  let baseline_value = if scale.y_axis_scale.is_log() {
    scale.ymin
  } else {
    clamp_to_limits(0.0, scale.ymin, scale.ymax)
  }
  let baseline = map_y(scale, top, plot_height, baseline_value)
  for i in 0..<visible.length() {
    let p = visible[i]
    if !valid_point(scale, p) {
      continue
    }
    let half = bar_data_half_span(visible, i, false)
    let first = map_x(
      scale,
      left,
      plot_width,
      bar_valid_edge(
        p.x() - half,
        p.x(),
        scale.xmin,
        scale.xmax,
        scale.x_axis_scale,
      ),
    )
    let last = map_x(
      scale,
      left,
      plot_width,
      bar_valid_edge(
        p.x() + half,
        p.x(),
        scale.xmin,
        scale.xmax,
        scale.x_axis_scale,
      ),
    )
    let width = Double::max(Double::abs(last - first), 1.0)
    let y = map_y(scale, top, plot_height, p.y())
    let rect_y = Double::min(y, baseline)
    let rect_height = Double::abs(y - baseline)
    let fill = if style.fill() == "" { style.color() } else { style.fill() }
    try! writer.empty_element("rect", [
      ("x", float_text((first + last - width) / 2.0)),
      ("y", float_text(rect_y)),
      ("width", float_text(width)),
      ("height", float_text(rect_height)),
      ("fill", fill),
    ])
  }
}

///|
fn append_barh(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  points : Array[@core.Point],
  style : @core.Style,
) -> Unit {
  let visible = bar_geometry_points(points)
  let baseline_value = if scale.x_axis_scale.is_log() {
    scale.xmin
  } else {
    clamp_to_limits(0.0, scale.xmin, scale.xmax)
  }
  let baseline = map_x(scale, left, plot_width, baseline_value)
  for i in 0..<visible.length() {
    let p = visible[i]
    if !valid_point(scale, p) {
      continue
    }
    let x = map_x(scale, left, plot_width, p.x())
    let half = bar_data_half_span(visible, i, true)
    let first = map_y(
      scale,
      top,
      plot_height,
      bar_valid_edge(
        p.y() - half,
        p.y(),
        scale.ymin,
        scale.ymax,
        scale.y_axis_scale,
      ),
    )
    let last = map_y(
      scale,
      top,
      plot_height,
      bar_valid_edge(
        p.y() + half,
        p.y(),
        scale.ymin,
        scale.ymax,
        scale.y_axis_scale,
      ),
    )
    let height = Double::max(Double::abs(last - first), 1.0)
    let rect_x = Double::min(x, baseline)
    let rect_width = Double::abs(x - baseline)
    let fill = if style.fill() == "" { style.color() } else { style.fill() }
    try! writer.empty_element("rect", [
      ("x", float_text(rect_x)),
      ("y", float_text((first + last - height) / 2.0)),
      ("width", float_text(rect_width)),
      ("height", float_text(height)),
      ("fill", fill),
    ])
  }
}
