///|
fn float_text(value : Double) -> String {
  Double::to_string(value)
}

///|
fn valid_point(scale : Scale, point : @core.Point) -> Bool {
  point.is_finite() &&
  scale.x_axis_scale.is_valid(point.x()) &&
  scale.y_axis_scale.is_valid(point.y())
}

///|
fn clamp_to_limits(value : Double, first : Double, second : Double) -> Double {
  if first <= second {
    Double::clamp(value, min=first, max=second)
  } else {
    Double::clamp(value, min=second, max=first)
  }
}

///|
fn points_text(
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  points : Array[@core.Point],
) -> String {
  let result = StringBuilder()
  for i in 0..<points.length() {
    let p = points[i]
    result.write_string(float_text(map_x(scale, left, plot_width, p.x())))
    result.write_string(",")
    result.write_string(float_text(map_y(scale, top, plot_height, p.y())))
    if i + 1 < points.length() {
      result.write_string(" ")
    }
  }
  result.to_string()
}

///|
fn append_line_segment(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  points : Array[@core.Point],
  style : @core.Style,
) -> Unit {
  if points.length() == 0 {
    return
  }
  try! writer.empty_element("polyline", [
    ("fill", "none"),
    ("stroke", style.color()),
    ("stroke-width", float_text(style.width())),
    ("points", points_text(scale, left, top, plot_width, plot_height, points)),
  ])
}

///|
fn append_line(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  points : Array[@core.Point],
  style : @core.Style,
) -> Unit {
  let mut segment : Array[@core.Point] = []
  for p in points {
    if valid_point(scale, p) {
      segment.push(p)
    } else if segment.length() > 0 {
      append_line_segment(
        writer, scale, left, top, plot_width, plot_height, segment, style,
      )
      segment = []
    }
  }
  if segment.length() > 0 {
    append_line_segment(
      writer, scale, left, top, plot_width, plot_height, segment, style,
    )
  }
}

///|
fn marker_polygon_points(values : Array[Double]) -> String {
  let result = StringBuilder()
  let count = values.length() / 2
  for index in 0..<count {
    if index > 0 {
      result.write_string(" ")
    }
    result.write_string(float_text(values[index * 2]))
    result.write_string(",")
    result.write_string(float_text(values[index * 2 + 1]))
  }
  result.to_string()
}

///|
fn marker_cross_path(x : Double, y : Double, radius : Double) -> String {
  let result = StringBuilder()
  result.write_string("M ")
  result.write_string(float_text(x - radius))
  result.write_string(" ")
  result.write_string(float_text(y - radius))
  result.write_string(" L ")
  result.write_string(float_text(x + radius))
  result.write_string(" ")
  result.write_string(float_text(y + radius))
  result.write_string(" M ")
  result.write_string(float_text(x + radius))
  result.write_string(" ")
  result.write_string(float_text(y - radius))
  result.write_string(" L ")
  result.write_string(float_text(x - radius))
  result.write_string(" ")
  result.write_string(float_text(y + radius))
  result.to_string()
}

///|
fn marker_plus_path(x : Double, y : Double, radius : Double) -> String {
  let result = StringBuilder()
  result.write_string("M ")
  result.write_string(float_text(x - radius))
  result.write_string(" ")
  result.write_string(float_text(y))
  result.write_string(" L ")
  result.write_string(float_text(x + radius))
  result.write_string(" ")
  result.write_string(float_text(y))
  result.write_string(" M ")
  result.write_string(float_text(x))
  result.write_string(" ")
  result.write_string(float_text(y - radius))
  result.write_string(" L ")
  result.write_string(float_text(x))
  result.write_string(" ")
  result.write_string(float_text(y + radius))
  result.to_string()
}

///|
fn append_marker(
  writer : @xml.Writer,
  x : Double,
  y : Double,
  style : @core.Style,
  marker : String,
) -> Unit {
  let radius = style.radius()
  let color = style.color()
  let fill = if style.fill() == "" { color } else { style.fill() }
  let stroke_width = Double::max(1.0, style.width())
  match marker {
    "o" =>
      try! writer.empty_element("circle", [
        ("cx", float_text(x)),
        ("cy", float_text(y)),
        ("r", float_text(radius)),
        ("fill", fill),
      ])
    "." =>
      try! writer.empty_element("circle", [
        ("cx", float_text(x)),
        ("cy", float_text(y)),
        ("r", float_text(Double::max(0.75, radius / 2.0))),
        ("fill", fill),
      ])
    "," =>
      try! writer.empty_element("circle", [
        ("cx", float_text(x)),
        ("cy", float_text(y)),
        ("r", "0.75"),
        ("fill", fill),
      ])
    "s" =>
      try! writer.empty_element("rect", [
        ("x", float_text(x - radius)),
        ("y", float_text(y - radius)),
        ("width", float_text(radius * 2.0)),
        ("height", float_text(radius * 2.0)),
        ("fill", fill),
      ])
    "^" =>
      try! writer.empty_element("polygon", [
        (
          "points",
          marker_polygon_points([
            x,
            y - radius,
            x + radius,
            y + radius,
            x - radius,
            y + radius,
          ]),
        ),
        ("fill", fill),
      ])
    "v" =>
      try! writer.empty_element("polygon", [
        (
          "points",
          marker_polygon_points([
            x - radius,
            y - radius,
            x + radius,
            y - radius,
            x,
            y + radius,
          ]),
        ),
        ("fill", fill),
      ])
    "D" =>
      try! writer.empty_element("polygon", [
        (
          "points",
          marker_polygon_points([
            x,
            y - radius,
            x + radius,
            y,
            x,
            y + radius,
            x - radius,
            y,
          ]),
        ),
        ("fill", fill),
      ])
    "x" =>
      try! writer.empty_element("path", [
        ("d", marker_cross_path(x, y, radius)),
        ("fill", "none"),
        ("stroke", color),
        ("stroke-width", float_text(stroke_width)),
      ])
    "+" =>
      try! writer.empty_element("path", [
        ("d", marker_plus_path(x, y, radius)),
        ("fill", "none"),
        ("stroke", color),
        ("stroke-width", float_text(stroke_width)),
      ])
    "|" =>
      try! writer.empty_element("line", [
        ("x1", float_text(x)),
        ("y1", float_text(y - radius)),
        ("x2", float_text(x)),
        ("y2", float_text(y + radius)),
        ("stroke", color),
        ("stroke-width", float_text(stroke_width)),
      ])
    "_" =>
      try! writer.empty_element("line", [
        ("x1", float_text(x - radius)),
        ("y1", float_text(y)),
        ("x2", float_text(x + radius)),
        ("y2", float_text(y)),
        ("stroke", color),
        ("stroke-width", float_text(stroke_width)),
      ])
    _ =>
      try! writer.empty_element("circle", [
        ("cx", float_text(x)),
        ("cy", float_text(y)),
        ("r", float_text(radius)),
        ("fill", fill),
      ])
  }
}

///|
fn append_scatter(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  points : Array[@core.Point],
  style : @core.Style,
) -> Unit {
  for p in points {
    if valid_point(scale, p) {
      append_marker(
        writer,
        map_x(scale, left, plot_width, p.x()),
        map_y(scale, top, plot_height, p.y()),
        style,
        style.marker(),
      )
    }
  }
}

///|
fn append_path_collection(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  points : Array[@core.Point],
  styles : Array[@core.Style],
) -> Unit {
  let count = Int32::min(points.length(), styles.length())
  for i in 0..<count {
    let p = points[i]
    let style = styles[i]
    if valid_point(scale, p) {
      append_marker(
        writer,
        map_x(scale, left, plot_width, p.x()),
        map_y(scale, top, plot_height, p.y()),
        style,
        style.marker(),
      )
    }
  }
}

///|
fn bar_width(
  points : Array[@core.Point],
  index : Int32,
  scale : Scale,
  plot_width : Double,
) -> Double {
  let p = points[index]
  let gap = if index + 1 < points.length() {
    points[index + 1].x() - p.x()
  } else if index > 0 {
    p.x() - points[index - 1].x()
  } else {
    (scale.xmax - scale.xmin) / 10.0
  }
  let span = scale.xmax - scale.xmin
  let width = if span == 0.0 {
    plot_width
  } else {
    Double::abs(gap * 0.8 / span * plot_width)
  }
  Double::max(width, 1.0)
}

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
  let visible = Array(capacity=points.length())
  for p in points {
    if valid_point(scale, p) {
      visible.push(p)
    }
  }
  let baseline_value = if scale.y_axis_scale.is_log() {
    scale.ymin
  } else {
    clamp_to_limits(0.0, scale.ymin, scale.ymax)
  }
  let baseline = map_y(scale, top, plot_height, baseline_value)
  for i in 0..<visible.length() {
    let p = visible[i]
    let center = map_x(scale, left, plot_width, p.x())
    let width = bar_width(visible, i, scale, plot_width)
    let y = map_y(scale, top, plot_height, p.y())
    let rect_y = Double::min(y, baseline)
    let rect_height = Double::abs(y - baseline)
    let fill = if style.fill() == "" { style.color() } else { style.fill() }
    try! writer.empty_element("rect", [
      ("x", float_text(center - width / 2.0)),
      ("y", float_text(rect_y)),
      ("width", float_text(width)),
      ("height", float_text(rect_height)),
      ("fill", fill),
    ])
  }
}

///|
fn barh_width(
  points : Array[@core.Point],
  index : Int32,
  scale : Scale,
  plot_height : Double,
) -> Double {
  let p = points[index]
  let gap = if index + 1 < points.length() {
    points[index + 1].y() - p.y()
  } else if index > 0 {
    p.y() - points[index - 1].y()
  } else {
    (scale.ymax - scale.ymin) / 10.0
  }
  let span = scale.ymax - scale.ymin
  let height = if span == 0.0 {
    plot_height
  } else {
    Double::abs(gap * 0.8 / span * plot_height)
  }
  Double::max(height, 1.0)
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
  let visible = Array(capacity=points.length())
  for p in points {
    if valid_point(scale, p) {
      visible.push(p)
    }
  }
  let baseline_value = if scale.x_axis_scale.is_log() {
    scale.xmin
  } else {
    clamp_to_limits(0.0, scale.xmin, scale.xmax)
  }
  let baseline = map_x(scale, left, plot_width, baseline_value)
  for i in 0..<visible.length() {
    let p = visible[i]
    let x = map_x(scale, left, plot_width, p.x())
    let center = map_y(scale, top, plot_height, p.y())
    let height = barh_width(visible, i, scale, plot_height)
    let rect_x = Double::min(x, baseline)
    let rect_width = Double::abs(x - baseline)
    let fill = if style.fill() == "" { style.color() } else { style.fill() }
    try! writer.empty_element("rect", [
      ("x", float_text(rect_x)),
      ("y", float_text(center - height / 2.0)),
      ("width", float_text(rect_width)),
      ("height", float_text(height)),
      ("fill", fill),
    ])
  }
}

///|
fn polygon_points_text(
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  upper : Array[@core.Point],
  lower : Array[@core.Point],
) -> String {
  let result = StringBuilder()
  for i in 0..<upper.length() {
    let p = upper[i]
    result.write_string(float_text(map_x(scale, left, plot_width, p.x())))
    result.write_string(",")
    result.write_string(float_text(map_y(scale, top, plot_height, p.y())))
    result.write_string(" ")
  }
  for i in 0..<lower.length() {
    let p = lower[lower.length() - 1 - i]
    result.write_string(float_text(map_x(scale, left, plot_width, p.x())))
    result.write_string(",")
    result.write_string(float_text(map_y(scale, top, plot_height, p.y())))
    if i + 1 < lower.length() {
      result.write_string(" ")
    }
  }
  result.to_string()
}

///|
fn append_fill_segment(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  upper : Array[@core.Point],
  lower : Array[@core.Point],
  style : @core.Style,
) -> Unit {
  if upper.length() < 2 || lower.length() < 2 {
    return
  }
  let fill = if style.fill() == "" { style.color() } else { style.fill() }
  try! writer.empty_element("polygon", [
    (
      "points",
      polygon_points_text(
        scale, left, top, plot_width, plot_height, upper, lower,
      ),
    ),
    ("fill", fill),
    ("stroke", "none"),
  ])
}

///|
fn append_fill_between(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  upper : Array[@core.Point],
  lower : Array[@core.Point],
  style : @core.Style,
) -> Unit {
  let mut upper_segment : Array[@core.Point] = []
  let mut lower_segment : Array[@core.Point] = []
  let count = Int32::min(upper.length(), lower.length())
  for i in 0..<count {
    let up = upper[i]
    let low = lower[i]
    if valid_point(scale, up) && valid_point(scale, low) {
      upper_segment.push(up)
      lower_segment.push(low)
    } else {
      append_fill_segment(
        writer, scale, left, top, plot_width, plot_height, upper_segment, lower_segment,
        style,
      )
      upper_segment = []
      lower_segment = []
    }
  }
  append_fill_segment(
    writer, scale, left, top, plot_width, plot_height, upper_segment, lower_segment,
    style,
  )
}

///|
fn append_polygon(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  points : Array[@core.Point],
  style : @core.Style,
) -> Unit {
  if points.length() < 3 {
    return
  }
  let visible = Array(capacity=points.length())
  for point in points {
    if valid_point(scale, point) {
      visible.push(point)
    }
  }
  if visible.length() < 3 {
    return
  }
  let fill = if style.fill() == "" { style.color() } else { style.fill() }
  try! writer.empty_element("polygon", [
    ("points", points_text(scale, left, top, plot_width, plot_height, visible)),
    ("fill", fill),
    ("stroke", style.color()),
    ("stroke-width", float_text(style.width())),
  ])
}

///|
/// Render several boundary loops as one even-odd filled path.
///
/// A compound path is required when a filled contour band contains a hole:
/// separate SVG polygons would paint the hole again, while an even-odd path
/// preserves the topology of the union.
fn append_compound_polygon(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  polygons : Array[Array[@core.Point]],
  style : @core.Style,
) -> Unit {
  let path = StringBuilder()
  let mut loop_count = 0
  for points in polygons {
    if points.length() < 3 {
      continue
    }
    let visible = Array(capacity=points.length())
    for point in points {
      if valid_point(scale, point) {
        visible.push(point)
      }
    }
    if visible.length() < 3 {
      continue
    }
    if loop_count > 0 {
      path.write_string(" ")
    }
    let first = visible[0]
    path.write_string("M ")
    path.write_string(float_text(map_x(scale, left, plot_width, first.x())))
    path.write_string(" ")
    path.write_string(float_text(map_y(scale, top, plot_height, first.y())))
    for index in 1..<visible.length() {
      let point = visible[index]
      path.write_string(" L ")
      path.write_string(float_text(map_x(scale, left, plot_width, point.x())))
      path.write_string(" ")
      path.write_string(float_text(map_y(scale, top, plot_height, point.y())))
    }
    path.write_string(" Z")
    loop_count += 1
  }
  if loop_count == 0 {
    return
  }
  let fill = if style.fill() == "" { style.color() } else { style.fill() }
  try! writer.empty_element("path", [
    ("d", path.to_string()),
    ("fill", fill),
    ("stroke", style.color()),
    ("stroke-width", float_text(style.width())),
    ("fill-rule", "evenodd"),
  ])
}

///|
/// Render one Gouraud triangle using an SVG user-space linear gradient.
///
/// SVG does not expose a portable barycentric gradient primitive.  The
/// gradient is therefore aligned with the first edge and receives a third
/// stop at the projection of the remaining vertex.  This preserves all three
/// vertex colors and gives a smooth, backend-native approximation of the
/// triangle interpolation used by `pcolor(..., shading="gouraud")`.
fn append_gouraud_triangle(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  points : Array[@core.Point],
  colors : Array[String],
  gradient_id : String,
) -> Unit {
  if points.length() != 3 || colors.length() != 3 {
    return
  }
  let p0 = points[0]
  let p1 = points[1]
  let p2 = points[2]
  if !valid_point(scale, p0) ||
    !valid_point(scale, p1) ||
    !valid_point(scale, p2) {
    return
  }
  let s0 = @core.point(
    map_x(scale, left, plot_width, p0.x()),
    map_y(scale, top, plot_height, p0.y()),
  )
  let s1 = @core.point(
    map_x(scale, left, plot_width, p1.x()),
    map_y(scale, top, plot_height, p1.y()),
  )
  let s2 = @core.point(
    map_x(scale, left, plot_width, p2.x()),
    map_y(scale, top, plot_height, p2.y()),
  )
  let dx = s1.x() - s0.x()
  let dy = s1.y() - s0.y()
  let length_squared = dx * dx + dy * dy
  let projection = if length_squared == 0.0 {
    0.5
  } else {
    Double::clamp(
      ((s2.x() - s0.x()) * dx + (s2.y() - s0.y()) * dy) / length_squared,
      min=0.0,
      max=1.0,
    )
  }
  try! writer.start_element("defs", [])
  try! writer.start_element("linearGradient", [
    ("id", gradient_id),
    ("gradientUnits", "userSpaceOnUse"),
    ("x1", float_text(s0.x())),
    ("y1", float_text(s0.y())),
    ("x2", float_text(s1.x())),
    ("y2", float_text(s1.y())),
  ])
  try! writer.empty_element("stop", [
    ("offset", "0%"),
    ("stop-color", colors[0]),
  ])
  try! writer.empty_element("stop", [
    ("offset", "\{Double::to_string(projection * 100.0)}%"),
    ("stop-color", colors[2]),
  ])
  try! writer.empty_element("stop", [
    ("offset", "100%"),
    ("stop-color", colors[1]),
  ])
  try! writer.end_element("linearGradient")
  try! writer.end_element("defs")
  try! writer.empty_element("polygon", [
    ("points", points_text(scale, left, top, plot_width, plot_height, points)),
    ("fill", "url(#\{gradient_id})"),
    ("stroke", "none"),
  ])
}

///|
fn append_reference_line(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  value : Double,
  horizontal : Bool,
  style : @core.Style,
) -> Unit {
  if horizontal {
    if !scale.y_axis_scale.is_valid(value) {
      return
    }
  } else if !scale.x_axis_scale.is_valid(value) {
    return
  }
  let attrs = if horizontal {
    [
      ("x1", float_text(left)),
      ("y1", float_text(map_y(scale, top, plot_height, value))),
      ("x2", float_text(left + plot_width)),
      ("y2", float_text(map_y(scale, top, plot_height, value))),
    ]
  } else {
    [
      ("x1", float_text(map_x(scale, left, plot_width, value))),
      ("y1", float_text(top)),
      ("x2", float_text(map_x(scale, left, plot_width, value))),
      ("y2", float_text(top + plot_height)),
    ]
  }
  let attributes = Array(capacity=6)
  for attribute in attrs {
    attributes.push(attribute)
  }
  attributes.push(("stroke", style.color()))
  attributes.push(("stroke-width", float_text(style.width())))
  try! writer.empty_element("line", attributes)
}

///|
fn append_axline_candidate(
  points : Array[@core.Point],
  point : @core.Point,
  xmin : Double,
  xmax : Double,
  ymin : Double,
  ymax : Double,
  x_scale : @ticker_scale.Scale,
  y_scale : @ticker_scale.Scale,
) -> Unit {
  if point.x().is_nan() ||
    point.x().is_inf() ||
    point.y().is_nan() ||
    point.y().is_inf() ||
    point.x() < xmin ||
    point.x() > xmax ||
    point.y() < ymin ||
    point.y() > ymax ||
    !x_scale.is_valid(point.x()) ||
    !y_scale.is_valid(point.y()) {
    return
  }
  for existing in points {
    if Double::abs(existing.x() - point.x()) < 1.0e-12 &&
      Double::abs(existing.y() - point.y()) < 1.0e-12 {
      return
    }
  }
  points.push(point)
}

///|
fn append_transformed_axline_candidate(
  points : Array[@core.Point],
  point : @core.Point,
  xmin : Double,
  xmax : Double,
  ymin : Double,
  ymax : Double,
) -> Unit {
  if point.x().is_nan() ||
    point.x().is_inf() ||
    point.y().is_nan() ||
    point.y().is_inf() ||
    point.x() < xmin ||
    point.x() > xmax ||
    point.y() < ymin ||
    point.y() > ymax {
    return
  }
  for existing in points {
    if Double::abs(existing.x() - point.x()) < 1.0e-12 &&
      Double::abs(existing.y() - point.y()) < 1.0e-12 {
      return
    }
  }
  points.push(point)
}

///|
/// Clip an axline in transformed coordinates for logarithmic axes.
///
/// Matplotlib's two-point form represents a straight line in display space.
/// Transforming both points before clipping preserves that meaning when one
/// or both axes use a nonlinear scale.
fn append_transformed_axline(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  point : @core.Point,
  direction : @core.Point,
  style : @core.Style,
) -> Unit {
  if !scale.x_axis_scale.is_valid(point.x()) ||
    !scale.y_axis_scale.is_valid(point.y()) {
    return
  }
  let second = @core.point(point.x() + direction.x(), point.y() + direction.y())
  if !scale.x_axis_scale.is_valid(second.x()) ||
    !scale.y_axis_scale.is_valid(second.y()) {
    return
  }
  let tx0 = scale.x_axis_scale.transform(point.x())
  let ty0 = scale.y_axis_scale.transform(point.y())
  let tx1 = scale.x_axis_scale.transform(second.x())
  let ty1 = scale.y_axis_scale.transform(second.y())
  let xmin = Double::min(
    scale.x_axis_scale.transform(scale.xmin),
    scale.x_axis_scale.transform(scale.xmax),
  )
  let xmax = Double::max(
    scale.x_axis_scale.transform(scale.xmin),
    scale.x_axis_scale.transform(scale.xmax),
  )
  let ymin = Double::min(
    scale.y_axis_scale.transform(scale.ymin),
    scale.y_axis_scale.transform(scale.ymax),
  )
  let ymax = Double::max(
    scale.y_axis_scale.transform(scale.ymin),
    scale.y_axis_scale.transform(scale.ymax),
  )
  let dx = tx1 - tx0
  let dy = ty1 - ty0
  if dx == 0.0 && dy == 0.0 {
    return
  }
  let candidates : Array[@core.Point] = []
  if dx == 0.0 {
    append_transformed_axline_candidate(
      candidates,
      @core.point(tx0, ymin),
      xmin,
      xmax,
      ymin,
      ymax,
    )
    append_transformed_axline_candidate(
      candidates,
      @core.point(tx0, ymax),
      xmin,
      xmax,
      ymin,
      ymax,
    )
  } else {
    let y_at_xmin = ty0 + (xmin - tx0) * dy / dx
    let y_at_xmax = ty0 + (xmax - tx0) * dy / dx
    append_transformed_axline_candidate(
      candidates,
      @core.point(xmin, y_at_xmin),
      xmin,
      xmax,
      ymin,
      ymax,
    )
    append_transformed_axline_candidate(
      candidates,
      @core.point(xmax, y_at_xmax),
      xmin,
      xmax,
      ymin,
      ymax,
    )
    if dy != 0.0 {
      let x_at_ymin = tx0 + (ymin - ty0) * dx / dy
      let x_at_ymax = tx0 + (ymax - ty0) * dx / dy
      append_transformed_axline_candidate(
        candidates,
        @core.point(x_at_ymin, ymin),
        xmin,
        xmax,
        ymin,
        ymax,
      )
      append_transformed_axline_candidate(
        candidates,
        @core.point(x_at_ymax, ymax),
        xmin,
        xmax,
        ymin,
        ymax,
      )
    }
  }
  if candidates.length() >= 2 {
    let first = candidates[0]
    let second = candidates[1]
    let first_data = @core.point(
      scale.x_axis_scale.inverse(first.x()),
      scale.y_axis_scale.inverse(first.y()),
    )
    let second_data = @core.point(
      scale.x_axis_scale.inverse(second.x()),
      scale.y_axis_scale.inverse(second.y()),
    )
    try! writer.empty_element("line", [
      ("x1", float_text(map_x(scale, left, plot_width, first_data.x()))),
      ("y1", float_text(map_y(scale, top, plot_height, first_data.y()))),
      ("x2", float_text(map_x(scale, left, plot_width, second_data.x()))),
      ("y2", float_text(map_y(scale, top, plot_height, second_data.y()))),
      ("stroke", style.color()),
      ("stroke-width", float_text(style.width())),
    ])
  }
}

///|
fn append_axline(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  point : @core.Point,
  direction : @core.Point,
  style : @core.Style,
) -> Unit {
  if scale.x_axis_scale.is_nonlinear() || scale.y_axis_scale.is_nonlinear() {
    append_transformed_axline(
      writer, scale, left, top, plot_width, plot_height, point, direction, style,
    )
    return
  }
  let xmin = Double::min(scale.xmin, scale.xmax)
  let xmax = Double::max(scale.xmin, scale.xmax)
  let ymin = Double::min(scale.ymin, scale.ymax)
  let ymax = Double::max(scale.ymin, scale.ymax)
  let dx = direction.x()
  let dy = direction.y()
  if dx == 0.0 && dy == 0.0 {
    return
  }
  let candidates : Array[@core.Point] = []
  if dx == 0.0 {
    append_axline_candidate(
      candidates,
      @core.point(point.x(), ymin),
      xmin,
      xmax,
      ymin,
      ymax,
      scale.x_axis_scale,
      scale.y_axis_scale,
    )
    append_axline_candidate(
      candidates,
      @core.point(point.x(), ymax),
      xmin,
      xmax,
      ymin,
      ymax,
      scale.x_axis_scale,
      scale.y_axis_scale,
    )
  } else {
    let y_at_xmin = point.y() + (xmin - point.x()) * dy / dx
    let y_at_xmax = point.y() + (xmax - point.x()) * dy / dx
    append_axline_candidate(
      candidates,
      @core.point(xmin, y_at_xmin),
      xmin,
      xmax,
      ymin,
      ymax,
      scale.x_axis_scale,
      scale.y_axis_scale,
    )
    append_axline_candidate(
      candidates,
      @core.point(xmax, y_at_xmax),
      xmin,
      xmax,
      ymin,
      ymax,
      scale.x_axis_scale,
      scale.y_axis_scale,
    )
    if dy != 0.0 {
      let x_at_ymin = point.x() + (ymin - point.y()) * dx / dy
      let x_at_ymax = point.x() + (ymax - point.y()) * dx / dy
      append_axline_candidate(
        candidates,
        @core.point(x_at_ymin, ymin),
        xmin,
        xmax,
        ymin,
        ymax,
        scale.x_axis_scale,
        scale.y_axis_scale,
      )
      append_axline_candidate(
        candidates,
        @core.point(x_at_ymax, ymax),
        xmin,
        xmax,
        ymin,
        ymax,
        scale.x_axis_scale,
        scale.y_axis_scale,
      )
    }
  }
  if candidates.length() >= 2 {
    let first = candidates[0]
    let second = candidates[1]
    try! writer.empty_element("line", [
      ("x1", float_text(map_x(scale, left, plot_width, first.x()))),
      ("y1", float_text(map_y(scale, top, plot_height, first.y()))),
      ("x2", float_text(map_x(scale, left, plot_width, second.x()))),
      ("y2", float_text(map_y(scale, top, plot_height, second.y()))),
      ("stroke", style.color()),
      ("stroke-width", float_text(style.width())),
    ])
  }
}

///|
fn append_span(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  lower : Double,
  upper : Double,
  horizontal : Bool,
  style : @core.Style,
) -> Unit {
  let fill = if style.fill() == "" { style.color() } else { style.fill() }
  if horizontal {
    if !scale.y_axis_scale.is_valid(lower) ||
      !scale.y_axis_scale.is_valid(upper) {
      return
    }
    let first = map_y(scale, top, plot_height, lower)
    let second = map_y(scale, top, plot_height, upper)
    try! writer.empty_element("rect", [
      ("x", float_text(left)),
      ("y", float_text(Double::min(first, second))),
      ("width", float_text(plot_width)),
      ("height", float_text(Double::abs(second - first))),
      ("fill", fill),
      ("fill-opacity", "0.35"),
      ("stroke", "none"),
    ])
  } else {
    if !scale.x_axis_scale.is_valid(lower) ||
      !scale.x_axis_scale.is_valid(upper) {
      return
    }
    let first = map_x(scale, left, plot_width, lower)
    let second = map_x(scale, left, plot_width, upper)
    try! writer.empty_element("rect", [
      ("x", float_text(Double::min(first, second))),
      ("y", float_text(top)),
      ("width", float_text(Double::abs(second - first))),
      ("height", float_text(plot_height)),
      ("fill", fill),
      ("fill-opacity", "0.35"),
      ("stroke", "none"),
    ])
  }
}

///|
fn append_error_segment(
  writer : @xml.Writer,
  x1 : Double,
  y1 : Double,
  x2 : Double,
  y2 : Double,
  style : @core.Style,
) -> Unit {
  try! writer.empty_element("line", [
    ("x1", float_text(x1)),
    ("y1", float_text(y1)),
    ("x2", float_text(x2)),
    ("y2", float_text(y2)),
    ("stroke", style.color()),
    ("stroke-width", float_text(style.width())),
  ])
}

///|
fn append_errorbar(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  points : Array[@core.Point],
  yerr : Array[Double],
  xerr : Array[Double],
  style : @core.Style,
) -> Unit {
  append_line(writer, scale, left, top, plot_width, plot_height, points, style)
  let cap = 4.0
  for i in 0..<points.length() {
    let p = points[i]
    if valid_point(scale, p) {
      let x = map_x(scale, left, plot_width, p.x())
      let y = map_y(scale, top, plot_height, p.y())
      let y_error = if yerr.length() == 0 { 0.0 } else { yerr[i] }
      let x_error = if xerr.length() == 0 { 0.0 } else { xerr[i] }
      if y_error > 0.0 &&
        scale.y_axis_scale.is_valid(p.y() - y_error) &&
        scale.y_axis_scale.is_valid(p.y() + y_error) {
        let low = map_y(scale, top, plot_height, p.y() - y_error)
        let high = map_y(scale, top, plot_height, p.y() + y_error)
        append_error_segment(writer, x, low, x, high, style)
        append_error_segment(writer, x - cap, low, x + cap, low, style)
        append_error_segment(writer, x - cap, high, x + cap, high, style)
      }
      if x_error > 0.0 &&
        scale.x_axis_scale.is_valid(p.x() - x_error) &&
        scale.x_axis_scale.is_valid(p.x() + x_error) {
        let low = map_x(scale, left, plot_width, p.x() - x_error)
        let high = map_x(scale, left, plot_width, p.x() + x_error)
        append_error_segment(writer, low, y, high, y, style)
        append_error_segment(writer, low, y - cap, low, y + cap, style)
        append_error_segment(writer, high, y - cap, high, y + cap, style)
      }
    }
  }
}

///|
fn append_grid(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  x_ticks : Array[Double],
  y_ticks : Array[Double],
  x_minor_ticks : Array[Double],
  y_minor_ticks : Array[Double],
  x_labels : Array[String],
  y_labels : Array[String],
  x_minor_labels : Array[String],
  y_minor_labels : Array[String],
  x_offset_label : String,
  y_offset_label : String,
  x_position : @axis.TickPosition?,
  y_position : @axis.TickPosition?,
  show_x_tick_labels : Bool,
  show_y_tick_labels : Bool,
  x_grid_visible : Bool,
  x_grid_color : String,
  x_grid_width : Double,
  y_grid_visible : Bool,
  y_grid_color : String,
  y_grid_width : Double,
  x_minor_grid_visible : Bool,
  x_minor_grid_color : String,
  x_minor_grid_width : Double,
  y_minor_grid_visible : Bool,
  y_minor_grid_color : String,
  y_minor_grid_width : Double,
  x_tick_label_size : Double,
  y_tick_label_size : Double,
) -> Unit {
  let x_top = match x_position {
    Some(@axis.TickPosition::Top) => true
    Some(@axis.TickPosition::Both) => true
    _ => false
  }
  let x_bottom = match x_position {
    Some(@axis.TickPosition::Top) => false
    _ => true
  }
  let y_left = match y_position {
    Some(@axis.TickPosition::Right) => false
    _ => true
  }
  let y_right = match y_position {
    Some(@axis.TickPosition::Right) => true
    Some(@axis.TickPosition::Both) => true
    _ => false
  }
  for value in x_minor_ticks {
    if tick_in_view(value, scale.x_axis_scale, scale.xmin, scale.xmax) &&
      x_minor_grid_visible {
      let x = map_x(scale, left, plot_width, value)
      try! writer.empty_element("line", [
        ("x1", float_text(x)),
        ("y1", float_text(top)),
        ("x2", float_text(x)),
        ("y2", float_text(top + plot_height)),
        ("stroke", x_minor_grid_color),
        ("stroke-width", float_text(x_minor_grid_width)),
      ])
    }
  }
  for value in y_minor_ticks {
    if tick_in_view(value, scale.y_axis_scale, scale.ymin, scale.ymax) &&
      y_minor_grid_visible {
      let y = map_y(scale, top, plot_height, value)
      try! writer.empty_element("line", [
        ("x1", float_text(left)),
        ("y1", float_text(y)),
        ("x2", float_text(left + plot_width)),
        ("y2", float_text(y)),
        ("stroke", y_minor_grid_color),
        ("stroke-width", float_text(y_minor_grid_width)),
      ])
    }
  }
  for index in 0..<x_minor_ticks.length() {
    let value = x_minor_ticks[index]
    let label = x_minor_labels[index]
    if label != "" &&
      show_x_tick_labels &&
      tick_in_view(value, scale.x_axis_scale, scale.xmin, scale.xmax) {
      let x = map_x(scale, left, plot_width, value)
      if x_bottom {
        append_text(
          writer,
          x,
          top + plot_height + 18.0,
          label,
          "middle",
          x_tick_label_size,
        )
      }
      if x_top {
        append_text(writer, x, top - 8.0, label, "middle", x_tick_label_size)
      }
    }
  }
  for index in 0..<y_minor_ticks.length() {
    let value = y_minor_ticks[index]
    let label = y_minor_labels[index]
    if label != "" &&
      show_y_tick_labels &&
      tick_in_view(value, scale.y_axis_scale, scale.ymin, scale.ymax) {
      let y = map_y(scale, top, plot_height, value)
      if y_left {
        append_text(
          writer,
          left - 8.0,
          y + 3.0,
          label,
          "end",
          y_tick_label_size,
        )
      }
      if y_right {
        append_text(
          writer,
          left + plot_width + 8.0,
          y + 3.0,
          label,
          "start",
          y_tick_label_size,
        )
      }
    }
  }
  for i in 0..<x_ticks.length() {
    let value = x_ticks[i]
    if tick_in_view(value, scale.x_axis_scale, scale.xmin, scale.xmax) {
      let x = map_x(scale, left, plot_width, value)
      if x_grid_visible {
        try! writer.empty_element("line", [
          ("x1", float_text(x)),
          ("y1", float_text(top)),
          ("x2", float_text(x)),
          ("y2", float_text(top + plot_height)),
          ("stroke", x_grid_color),
          ("stroke-width", float_text(x_grid_width)),
        ])
      }
      if x_bottom && show_x_tick_labels {
        append_text(
          writer,
          x,
          top + plot_height + 18.0,
          x_labels[i],
          "middle",
          x_tick_label_size,
        )
      }
      if x_top && show_x_tick_labels {
        append_text(
          writer,
          x,
          top - 8.0,
          x_labels[i],
          "middle",
          x_tick_label_size,
        )
      }
    }
  }
  if x_offset_label != "" && show_x_tick_labels {
    if x_bottom {
      append_text(
        writer,
        left + plot_width,
        top + plot_height + 33.0,
        x_offset_label,
        "end",
        9,
      )
    }
    if x_top {
      append_text(
        writer,
        left + plot_width,
        top - 23.0,
        x_offset_label,
        "end",
        9,
      )
    }
  }
  for i in 0..<y_ticks.length() {
    let value = y_ticks[i]
    if tick_in_view(value, scale.y_axis_scale, scale.ymin, scale.ymax) {
      let y = map_y(scale, top, plot_height, value)
      if y_grid_visible {
        try! writer.empty_element("line", [
          ("x1", float_text(left)),
          ("y1", float_text(y)),
          ("x2", float_text(left + plot_width)),
          ("y2", float_text(y)),
          ("stroke", y_grid_color),
          ("stroke-width", float_text(y_grid_width)),
        ])
      }
      if y_left && show_y_tick_labels {
        append_text(
          writer,
          left - 8.0,
          y + 3.0,
          y_labels[i],
          "end",
          y_tick_label_size,
        )
      }
      if y_right && show_y_tick_labels {
        append_text(
          writer,
          left + plot_width + 8.0,
          y + 3.0,
          y_labels[i],
          "start",
          y_tick_label_size,
        )
      }
    }
  }
  if y_offset_label != "" && show_y_tick_labels {
    if y_left {
      append_text(writer, left - 8.0, top - 8.0, y_offset_label, "end", 9)
    }
    if y_right {
      append_text(
        writer,
        left + plot_width + 8.0,
        top - 8.0,
        y_offset_label,
        "start",
        9,
      )
    }
  }
}

///|
fn secondary_value_label(value : Double) -> String {
  float_text(value)
}

///|
fn secondary_primary_ticks(
  primary_ticks : Array[Double],
  count : Int32,
) -> Array[Double] {
  if primary_ticks.length() < 2 || count < 2 {
    primary_ticks.copy()
  } else {
    let result = Array(capacity=count)
    let first = primary_ticks[0]
    let last = primary_ticks[primary_ticks.length() - 1]
    for index in 0..<count {
      result.push(
        first +
        (last - first) * Double::from_int(index) / Double::from_int(count - 1),
      )
    }
    result
  }
}

///|
fn secondary_axis_ticks(
  axis : @render.SecondaryAxis,
  primary_ticks : Array[Double],
  primary_lower : Double,
  primary_upper : Double,
) -> Array[(Double, Double)] raise @core.DataError {
  if axis.tick_group_is_null() {
    return []
  }
  match axis.fixed_ticks() {
    Some(values) => values.map(value => (axis.inverse()(value), value))
    None =>
      match axis.locator() {
        Some(locator) => {
          let values = locator.tick_values_for_axis(
            axis.forward()(primary_lower),
            axis.forward()(primary_upper),
          )
          values.map(value => (axis.inverse()(value), value))
        }
        None =>
          secondary_primary_ticks(primary_ticks, axis.tick_count()).map(primary => {
            (primary, axis.forward()(primary))
          })
      }
  }
}

///|
fn secondary_axis_tick_labels(
  axis : @render.SecondaryAxis,
  values : Array[Double],
  primary_lower : Double,
  primary_upper : Double,
) -> Array[String] raise @core.DataError {
  if axis.tick_group_is_null() {
    return []
  }
  if axis.named_formatter() is Some(formatter) {
    return formatter.format_ticks(values)
  }
  match axis.formatter() {
    Some(formatter) => {
      let view = if axis.has_placement_provider() {
        // An owned child's source interval may include nonsingular expansion,
        // or still precede a later function sync. Do not remap parent bounds.
        axis
        .formatter_view_interval()
        .map(bounds => @core.limits(bounds.0, bounds.1))
      } else {
        Some(
          @core.limits(
            axis.forward()(primary_lower),
            axis.forward()(primary_upper),
          ),
        )
      }
      formatter.format_values_with_view(values, view)
    }
    None => values.map(secondary_value_label)
  }
}

///|
// SecondaryAxis only inherits a logarithmic parent scale. Other parents use
// function(inverse) and normalize the inverse coordinates linearly.
fn secondary_display_scale(scale : Scale, horizontal : Bool) -> Scale {
  let parent = if horizontal { scale.x_axis_scale } else { scale.y_axis_scale }
  let secondary = if parent.is_log() {
    @ticker_scale.Scale::Log
  } else {
    @ticker_scale.Scale::Linear
  }
  {
    xmin: scale.xmin,
    xmax: scale.xmax,
    ymin: scale.ymin,
    ymax: scale.ymax,
    x_axis_scale: if horizontal {
      secondary
    } else {
      scale.x_axis_scale
    },
    y_axis_scale: if horizontal {
      scale.y_axis_scale
    } else {
      secondary
    },
  }
}

///|
fn append_secondary_x_axis(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  primary_ticks : Array[Double],
  axis : @render.SecondaryAxis,
  prepared~ : SecondaryTickBundle? = None,
) -> Unit raise @core.DataError {
  let scale = secondary_display_scale(scale, true)
  let bundle = match prepared {
    Some(bundle) => bundle
    None => secondary_axis_bundle(axis, primary_ticks, scale.xmin, scale.xmax)
  }
  let (left, top, right, bottom, plot_width, alignment) = match bundle.drawing {
    Some(context) =>
      (
        context.left(),
        context.top(),
        context.right(),
        context.bottom(),
        context.right() - context.left(),
        context.alignment(),
      )
    None =>
      (
        left,
        top,
        left + plot_width,
        top + plot_height,
        plot_width,
        axis.location(),
      )
  }
  let at_top = alignment is @render.SecondaryLocation::Top
  let axis_y = if at_top { top } else { bottom }
  try! writer.empty_element("line", [
    ("x1", float_text(left)),
    ("y1", float_text(axis_y)),
    ("x2", float_text(right)),
    ("y2", float_text(axis_y)),
    ("stroke", "#374151"),
    ("stroke-width", "1"),
  ])
  let ticks = bundle.major
  let labels = bundle.major_labels
  for index, (primary, value) in bundle.minor {
    if secondary_tick_fraction(
        bundle,
        primary,
        value,
        scale.x_axis_scale,
        scale.xmin,
        scale.xmax,
      )
      is Some(fraction) {
      let x = match bundle.placement {
        Some(_) => left + fraction * plot_width
        None => map_x(scale, left, plot_width, primary)
      }
      let direction = if at_top { -1.0 } else { 1.0 }
      try! writer.empty_element("line", [
        ("x1", float_text(x)),
        ("y1", float_text(axis_y)),
        ("x2", float_text(x)),
        ("y2", float_text(axis_y + direction * 3.0)),
        ("stroke", "#374151"),
        ("stroke-width", "0.7"),
      ])
      if index < bundle.minor_labels.length() {
        append_text(
          writer,
          x,
          axis_y + direction * 17.0,
          bundle.minor_labels[index],
          "middle",
          axis.tick_label_size(),
        )
      }
    }
  }
  for index, tick in ticks {
    let (primary, value) = tick
    if secondary_tick_fraction(
        bundle,
        primary,
        value,
        scale.x_axis_scale,
        scale.xmin,
        scale.xmax,
      )
      is Some(fraction) {
      let x = match bundle.placement {
        Some(_) => left + fraction * plot_width
        None => map_x(scale, left, plot_width, primary)
      }
      let direction = if at_top { -1.0 } else { 1.0 }
      try! writer.empty_element("line", [
        ("x1", float_text(x)),
        ("y1", float_text(axis_y)),
        ("x2", float_text(x)),
        ("y2", float_text(axis_y + direction * 5.0)),
        ("stroke", "#374151"),
        ("stroke-width", "1"),
      ])
      append_text(
        writer,
        x,
        axis_y + direction * 17.0 + (if at_top { 0.0 } else { 1.0 }),
        labels[index],
        "middle",
        axis.tick_label_size(),
      )
    }
  }
  if bundle.offset != "" {
    append_text(
      writer,
      right,
      axis_y + (if at_top { -8.0 } else { 30.0 }),
      bundle.offset,
      "end",
      9,
    )
  }
  match axis.label() {
    Some(value) =>
      append_text(
        writer,
        left + plot_width / 2.0,
        axis_y + (if at_top { -34.0 } else { 38.0 }),
        value,
        "middle",
        13,
      )
    None => ()
  }
}

///|
fn append_secondary_y_axis(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  primary_ticks : Array[Double],
  axis : @render.SecondaryAxis,
  prepared~ : SecondaryTickBundle? = None,
) -> Unit raise @core.DataError {
  let scale = secondary_display_scale(scale, false)
  let bundle = match prepared {
    Some(bundle) => bundle
    None => secondary_axis_bundle(axis, primary_ticks, scale.ymin, scale.ymax)
  }
  let (left, top, right, bottom, plot_height, alignment) = match
    bundle.drawing {
    Some(context) =>
      (
        context.left(),
        context.top(),
        context.right(),
        context.bottom(),
        context.bottom() - context.top(),
        context.alignment(),
      )
    None =>
      (
        left,
        top,
        left + plot_width,
        top + plot_height,
        plot_height,
        axis.location(),
      )
  }
  let at_right = alignment is @render.SecondaryLocation::Right
  let axis_x = if at_right { right } else { left }
  try! writer.empty_element("line", [
    ("x1", float_text(axis_x)),
    ("y1", float_text(top)),
    ("x2", float_text(axis_x)),
    ("y2", float_text(bottom)),
    ("stroke", "#374151"),
    ("stroke-width", "1"),
  ])
  let ticks = bundle.major
  let labels = bundle.major_labels
  for index, (primary, value) in bundle.minor {
    if secondary_tick_fraction(
        bundle,
        primary,
        value,
        scale.y_axis_scale,
        scale.ymin,
        scale.ymax,
      )
      is Some(fraction) {
      let y = match bundle.placement {
        Some(_) => top + (1.0 - fraction) * plot_height
        None => map_y(scale, top, plot_height, primary)
      }
      let direction = if at_right { 1.0 } else { -1.0 }
      try! writer.empty_element("line", [
        ("x1", float_text(axis_x)),
        ("y1", float_text(y)),
        ("x2", float_text(axis_x + direction * 3.0)),
        ("y2", float_text(y)),
        ("stroke", "#374151"),
        ("stroke-width", "0.7"),
      ])
      if index < bundle.minor_labels.length() {
        append_text(
          writer,
          axis_x + direction * 8.0,
          y + 3.0,
          bundle.minor_labels[index],
          if at_right {
            "start"
          } else {
            "end"
          },
          axis.tick_label_size(),
        )
      }
    }
  }
  for index, tick in ticks {
    let (primary, value) = tick
    if secondary_tick_fraction(
        bundle,
        primary,
        value,
        scale.y_axis_scale,
        scale.ymin,
        scale.ymax,
      )
      is Some(fraction) {
      let y = match bundle.placement {
        Some(_) => top + (1.0 - fraction) * plot_height
        None => map_y(scale, top, plot_height, primary)
      }
      let direction = if at_right { 1.0 } else { -1.0 }
      try! writer.empty_element("line", [
        ("x1", float_text(axis_x)),
        ("y1", float_text(y)),
        ("x2", float_text(axis_x + direction * 5.0)),
        ("y2", float_text(y)),
        ("stroke", "#374151"),
        ("stroke-width", "1"),
      ])
      append_text(
        writer,
        axis_x + direction * 8.0,
        y + 3.0,
        labels[index],
        if at_right {
          "start"
        } else {
          "end"
        },
        axis.tick_label_size(),
      )
    }
  }
  if bundle.offset != "" {
    append_text(
      writer,
      axis_x + (if at_right { 8.0 } else { -8.0 }),
      top - 8.0,
      bundle.offset,
      if at_right {
        "start"
      } else {
        "end"
      },
      9,
    )
  }
  match axis.label() {
    Some(value) =>
      append_text(
        writer,
        axis_x + (if at_right { 42.0 } else { -40.0 }),
        top + plot_height / 2.0,
        value,
        "middle",
        13,
      )
    None => ()
  }
}

///|
fn spine_finite(value : Double) -> Bool {
  !value.is_nan() && !value.is_inf()
}

///|
fn append_spine(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  spine : @render.Spine,
) -> Unit {
  if !spine.visible() {
    return
  }
  let (x1, y1, x2, y2) = match spine.side() {
    @render.SpineSide::Left => {
      let x = match spine.position() {
        @render.SpinePosition::Axes => left
        @render.SpinePosition::Data(value) =>
          map_x(scale, left, plot_width, value)
        @render.SpinePosition::Outward(value) => left - value
      }
      let (lower, upper) = match spine.bounds() {
        Some((lower, upper)) =>
          (
            map_y(scale, top, plot_height, lower),
            map_y(scale, top, plot_height, upper),
          )
        None => (top + plot_height, top)
      }
      (x, lower, x, upper)
    }
    @render.SpineSide::Right => {
      let x = match spine.position() {
        @render.SpinePosition::Axes => left + plot_width
        @render.SpinePosition::Data(value) =>
          map_x(scale, left, plot_width, value)
        @render.SpinePosition::Outward(value) => left + plot_width + value
      }
      let (lower, upper) = match spine.bounds() {
        Some((lower, upper)) =>
          (
            map_y(scale, top, plot_height, lower),
            map_y(scale, top, plot_height, upper),
          )
        None => (top + plot_height, top)
      }
      (x, lower, x, upper)
    }
    @render.SpineSide::Bottom => {
      let y = match spine.position() {
        @render.SpinePosition::Axes => top + plot_height
        @render.SpinePosition::Data(value) =>
          map_y(scale, top, plot_height, value)
        @render.SpinePosition::Outward(value) => top + plot_height + value
      }
      let (lower, upper) = match spine.bounds() {
        Some((lower, upper)) =>
          (
            map_x(scale, left, plot_width, lower),
            map_x(scale, left, plot_width, upper),
          )
        None => (left, left + plot_width)
      }
      (lower, y, upper, y)
    }
    @render.SpineSide::Top => {
      let y = match spine.position() {
        @render.SpinePosition::Axes => top
        @render.SpinePosition::Data(value) =>
          map_y(scale, top, plot_height, value)
        @render.SpinePosition::Outward(value) => top - value
      }
      let (lower, upper) = match spine.bounds() {
        Some((lower, upper)) =>
          (
            map_x(scale, left, plot_width, lower),
            map_x(scale, left, plot_width, upper),
          )
        None => (left, left + plot_width)
      }
      (lower, y, upper, y)
    }
  }
  if spine_finite(x1) &&
    spine_finite(y1) &&
    spine_finite(x2) &&
    spine_finite(y2) {
    try! writer.empty_element("line", [
      ("x1", float_text(x1)),
      ("y1", float_text(y1)),
      ("x2", float_text(x2)),
      ("y2", float_text(y2)),
      ("stroke", spine.color()),
      ("stroke-width", float_text(spine.linewidth())),
    ])
  }
}

///|
fn append_axes(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  spines : Array[@render.Spine],
) -> Unit {
  if spines.length() == 0 {
    try! writer.empty_element("rect", [
      ("x", float_text(left)),
      ("y", float_text(top)),
      ("width", float_text(plot_width)),
      ("height", float_text(plot_height)),
      ("fill", "none"),
      ("stroke", "#374151"),
      ("stroke-width", "1.2"),
    ])
  } else {
    for spine in spines {
      append_spine(writer, scale, left, top, plot_width, plot_height, spine)
    }
  }
}

///|
fn append_text(
  writer : @xml.Writer,
  x : Double,
  y : Double,
  value : String,
  anchor : String,
  size : Double,
) -> Unit {
  try! writer.start_element("text", [
    ("x", float_text(x)),
    ("y", float_text(y)),
    ("text-anchor", anchor),
    ("font-family", "sans-serif"),
    ("font-size", float_text(size)),
  ])
  try! writer.text(value)
  try! writer.end_element("text")
}

///|
fn append_artist_text(
  writer : @xml.Writer,
  x : Double,
  y : Double,
  value : String,
  style : @core.Style,
) -> Unit {
  try! writer.start_element("text", [
    ("x", float_text(x)),
    ("y", float_text(y)),
    ("text-anchor", "start"),
    ("font-family", "sans-serif"),
    ("font-size", style.font_size().to_string()),
    ("fill", style.color()),
  ])
  try! writer.text(value)
  try! writer.end_element("text")
}

///|
fn annotation_coordinate_point(
  coordinate : String,
  x : Double,
  y : Double,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  figure_width : Double,
  figure_height : Double,
) -> @core.Point? {
  if coordinate == "data" {
    if valid_point(scale, @core.point(x, y)) {
      Some(
        @core.point(
          map_x(scale, left, plot_width, x),
          map_y(scale, top, plot_height, y),
        ),
      )
    } else {
      None
    }
  } else if coordinate == "axes fraction" {
    Some(@core.point(left + x * plot_width, top + (1.0 - y) * plot_height))
  } else if coordinate == "figure fraction" {
    Some(@core.point(x * figure_width, (1.0 - y) * figure_height))
  } else if coordinate == "display" {
    Some(@core.point(x, y))
  } else {
    None
  }
}

///|
fn annotation_path(
  connector : String,
  start : @core.Point,
  end : @core.Point,
) -> String {
  let result = StringBuilder()
  if connector == "arc3" {
    let control_x = (start.x() + end.x()) / 2.0
    let control_y = (start.y() + end.y()) / 2.0 -
      Double::abs(end.x() - start.x()) * 0.15
    result.write_string("M ")
    result.write_string(float_text(start.x()))
    result.write_string(" ")
    result.write_string(float_text(start.y()))
    result.write_string(" Q ")
    result.write_string(float_text(control_x))
    result.write_string(" ")
    result.write_string(float_text(control_y))
    result.write_string(" ")
    result.write_string(float_text(end.x()))
    result.write_string(" ")
    result.write_string(float_text(end.y()))
  } else {
    result.write_string("M ")
    result.write_string(float_text(start.x()))
    result.write_string(" ")
    result.write_string(float_text(start.y()))
    result.write_string(" L ")
    result.write_string(float_text(end.x()))
    result.write_string(" ")
    result.write_string(float_text(end.y()))
  }
  result.to_string()
}

///|
fn append_annotation_arrowhead(
  writer : @xml.Writer,
  tail : @core.Point,
  tip : @core.Point,
  color : String,
  linewidth : Double,
  head_length : Double,
  head_width : Double,
) -> Unit {
  let dx = tip.x() - tail.x()
  let dy = tip.y() - tail.y()
  let magnitude = (dx * dx + dy * dy).sqrt()
  if magnitude == 0.0 {
    return
  }
  let length = Double::min(head_length, magnitude)
  if length == 0.0 || head_width == 0.0 {
    return
  }
  let unit_x = dx / magnitude
  let unit_y = dy / magnitude
  let base_x = tip.x() - unit_x * length
  let base_y = tip.y() - unit_y * length
  let half_width = head_width / 2.0
  let left_x = base_x - unit_y * half_width
  let left_y = base_y + unit_x * half_width
  let right_x = base_x + unit_y * half_width
  let right_y = base_y - unit_x * half_width
  try! writer.empty_element("polygon", [
    (
      "points",
      marker_polygon_points([left_x, left_y, tip.x(), tip.y(), right_x, right_y]),
    ),
    ("fill", color),
    ("stroke", color),
    ("stroke-width", float_text(linewidth)),
  ])
}

///|
fn append_annotation(
  writer : @xml.Writer,
  figure : @render.Figure,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  annotation : @render.Annotation,
) -> Unit {
  let figure_width = Double::from_int(figure.width())
  let figure_height = Double::from_int(figure.height())
  let anchor = annotation_coordinate_point(
    annotation.xycoords(),
    annotation.x(),
    annotation.y(),
    scale,
    left,
    top,
    plot_width,
    plot_height,
    figure_width,
    figure_height,
  )
  let text = match anchor {
    None => None
    Some(anchor) =>
      if annotation.textcoords() == "offset points" {
        Some(
          @core.point(
            anchor.x() + annotation.text_x() * 4.0 / 3.0,
            anchor.y() - annotation.text_y() * 4.0 / 3.0,
          ),
        )
      } else if annotation.textcoords() == "offset pixels" {
        Some(
          @core.point(
            anchor.x() + annotation.text_x(),
            anchor.y() + annotation.text_y(),
          ),
        )
      } else {
        annotation_coordinate_point(
          annotation.textcoords(),
          annotation.text_x(),
          annotation.text_y(),
          scale,
          left,
          top,
          plot_width,
          plot_height,
          figure_width,
          figure_height,
        )
      }
  }
  match (anchor, text) {
    (Some(anchor), Some(text)) => {
      if annotation.arrow() {
        let connector = annotation.connector()
        if connector == "angle" {
          let elbow = @core.point(anchor.x(), text.y())
          try! writer.empty_element("polyline", [
            ("fill", "none"),
            ("stroke", annotation.arrowcolor()),
            ("stroke-width", float_text(annotation.linewidth())),
            (
              "points",
              marker_polygon_points([
                text.x(),
                text.y(),
                elbow.x(),
                elbow.y(),
                anchor.x(),
                anchor.y(),
              ]),
            ),
          ])
          append_annotation_arrowhead(
            writer,
            elbow,
            anchor,
            annotation.arrowcolor(),
            annotation.linewidth(),
            annotation.head_length(),
            annotation.head_width(),
          )
        } else {
          try! writer.empty_element("path", [
            ("d", annotation_path(connector, text, anchor)),
            ("fill", "none"),
            ("stroke", annotation.arrowcolor()),
            ("stroke-width", float_text(annotation.linewidth())),
          ])
          append_annotation_arrowhead(
            writer,
            text,
            anchor,
            annotation.arrowcolor(),
            annotation.linewidth(),
            annotation.head_length(),
            annotation.head_width(),
          )
        }
      }
      append_artist_text(
        writer,
        text.x(),
        text.y(),
        annotation.value(),
        annotation.style(),
      )
    }
    _ => ()
  }
}

///|
fn table_edge_visible(edges : String, edge : String) -> Bool {
  if edges == "closed" {
    true
  } else if edges == "open" {
    false
  } else if edges == "horizontal" {
    edge == "B" || edge == "T"
  } else if edges == "vertical" {
    edge == "L" || edge == "R"
  } else {
    edges.contains(edge)
  }
}

///|
fn append_table(
  writer : @xml.Writer,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  table : @render.Table,
) -> Unit {
  if table.rows() <= 0 || table.columns() <= 0 {
    return
  }
  let cell_height = table.height() / Double::from_int(table.rows())
  for cell in table.cells() {
    let mut column_offset = 0.0
    for index in 0..<cell.column() {
      column_offset += table.column_widths()[index]
    }
    let cell_width = table.column_widths()[cell.column()] * table.width()
    let cell_x = left + (table.x() + column_offset) * plot_width
    let cell_y_norm = table.y() +
      table.height() -
      Double::from_int(cell.row() + 1) * cell_height
    let cell_y = top + (1.0 - cell_y_norm - cell_height) * plot_height
    let pixel_width = cell_width * plot_width
    let pixel_height = cell_height * plot_height
    try! writer.empty_element("rect", [
      ("x", float_text(cell_x)),
      ("y", float_text(cell_y)),
      ("width", float_text(pixel_width)),
      ("height", float_text(pixel_height)),
      ("fill", cell.facecolor()),
      ("stroke", "none"),
    ])
    if table_edge_visible(cell.visible_edges(), "B") {
      try! writer.empty_element("line", [
        ("x1", float_text(cell_x)),
        ("y1", float_text(cell_y + pixel_height)),
        ("x2", float_text(cell_x + pixel_width)),
        ("y2", float_text(cell_y + pixel_height)),
        ("stroke", cell.edgecolor()),
        ("stroke-width", "1"),
      ])
    }
    if table_edge_visible(cell.visible_edges(), "T") {
      try! writer.empty_element("line", [
        ("x1", float_text(cell_x)),
        ("y1", float_text(cell_y)),
        ("x2", float_text(cell_x + pixel_width)),
        ("y2", float_text(cell_y)),
        ("stroke", cell.edgecolor()),
        ("stroke-width", "1"),
      ])
    }
    if table_edge_visible(cell.visible_edges(), "L") {
      try! writer.empty_element("line", [
        ("x1", float_text(cell_x)),
        ("y1", float_text(cell_y)),
        ("x2", float_text(cell_x)),
        ("y2", float_text(cell_y + pixel_height)),
        ("stroke", cell.edgecolor()),
        ("stroke-width", "1"),
      ])
    }
    if table_edge_visible(cell.visible_edges(), "R") {
      try! writer.empty_element("line", [
        ("x1", float_text(cell_x + pixel_width)),
        ("y1", float_text(cell_y)),
        ("x2", float_text(cell_x + pixel_width)),
        ("y2", float_text(cell_y + pixel_height)),
        ("stroke", cell.edgecolor()),
        ("stroke-width", "1"),
      ])
    }
    let (anchor, text_x) = match cell.align() {
      "left" => ("start", cell_x + pixel_width * 0.08)
      "center" => ("middle", cell_x + pixel_width / 2.0)
      _ => ("end", cell_x + pixel_width * 0.92)
    }
    append_text(
      writer,
      text_x,
      cell_y + pixel_height * 0.65,
      cell.text(),
      anchor,
      11,
    )
  }
}

///|
fn append_legend(
  writer : @xml.Writer,
  left : Double,
  top : Double,
  plot_width : Double,
  entries : Array[@render.LegendEntry],
) -> Unit {
  if entries.length() == 0 {
    return
  }
  let box_width = 152.0
  let box_height = 12.0 + Double::from_int(entries.length()) * 20.0
  let box_x = left + plot_width - box_width - 8.0
  let box_y = top + 8.0
  try! writer.empty_element("rect", [
    ("x", float_text(box_x)),
    ("y", float_text(box_y)),
    ("width", float_text(box_width)),
    ("height", float_text(box_height)),
    ("fill", "white"),
    ("fill-opacity", "0.85"),
    ("stroke", "#9ca3af"),
    ("stroke-width", "1"),
  ])
  for i in 0..<entries.length() {
    let entry = entries[i]
    let y = box_y + 20.0 + Double::from_int(i) * 20.0
    let sample_x = box_x + 10.0
    match entry.kind() {
      @render.LegendKind::Line =>
        try! writer.empty_element("line", [
          ("x1", float_text(sample_x)),
          ("y1", float_text(y - 4.0)),
          ("x2", float_text(sample_x + 22.0)),
          ("y2", float_text(y - 4.0)),
          ("stroke", entry.color()),
          ("stroke-width", "2"),
        ])
      @render.LegendKind::Marker =>
        try! writer.empty_element("circle", [
          ("cx", float_text(sample_x + 11.0)),
          ("cy", float_text(y - 4.0)),
          ("r", "4"),
          ("fill", entry.color()),
        ])
      @render.LegendKind::Patch =>
        try! writer.empty_element("rect", [
          ("x", float_text(sample_x)),
          ("y", float_text(y - 12.0)),
          ("width", "22"),
          ("height", "12"),
          ("fill", entry.color()),
        ])
    }
    append_text(writer, sample_x + 32.0, y, entry.label(), "start", 11)
  }
}

///|
fn colorbar_float(value : Double) -> String {
  Double::to_string(value)
}

///|
fn colorbar_tick_value(norm : @colors.ColorNorm, ratio : Double) -> Double {
  match norm {
    @colors.ColorNorm::Boundary(boundary) => {
      let values = boundary.boundaries()
      let position = ratio * Double::from_int(values.length() - 1)
      values[Int32::min(values.length() - 1, Int32::max(0, position.to_int()))]
    }
    _ => try! norm.inverse(ratio)
  }
}

///|
fn colorbar_extensions(norm : @colors.ColorNorm) -> (Bool, Bool) {
  match norm {
    @colors.ColorNorm::Boundary(boundary) => {
      let mode = boundary.extend_mode()
      (mode == "min" || mode == "both", mode == "max" || mode == "both")
    }
    _ => (false, false)
  }
}

///|
fn colorbar_ticks(
  norm : @colors.ColorNorm,
  count : Int32,
) -> Array[(Double, Double)] {
  match norm {
    @colors.ColorNorm::Boundary(boundary) => {
      let values = boundary.boundaries()
      let result : Array[(Double, Double)] = []
      if values.length() == 1 {
        result.push((0.0, values[0]))
      } else {
        for index in 0..<values.length() {
          result.push(
            (
              Double::from_int(index) / Double::from_int(values.length() - 1),
              values[index],
            ),
          )
        }
      }
      result
    }
    _ => {
      let result : Array[(Double, Double)] = []
      let actual_count = Int32::max(2, count)
      for tick in 0..<actual_count {
        let ratio = Double::from_int(tick) / Double::from_int(actual_count - 1)
        result.push((ratio, colorbar_tick_value(norm, ratio)))
      }
      result
    }
  }
}

///|
fn append_colorbar_vertical(
  writer : @xml.Writer,
  figure : @render.Figure,
  bar : @colorbar.Colorbar,
  index : Int32,
) -> Unit {
  let width = 16.0
  let left = Double::from_int(figure.width() - figure.margin()) +
    22.0 +
    Double::from_int(index) * 48.0
  let top = Double::from_int(figure.margin())
  let height = Double::from_int(figure.height() - figure.margin() * 2)
  let steps = 64
  for step in 0..<steps {
    let ratio = 1.0 - Double::from_int(step) / Double::from_int(steps - 1)
    let y = top + Double::from_int(step) / Double::from_int(steps) * height
    try! writer.empty_element("rect", [
      ("x", float_text(left)),
      ("y", float_text(y)),
      ("width", float_text(width)),
      ("height", float_text(height / Double::from_int(steps) + 1.0)),
      ("fill", bar.cmap().sample(ratio).to_css()),
      ("stroke", "none"),
    ])
  }
  let (extend_min, extend_max) = colorbar_extensions(bar.norm())
  if extend_max {
    try! writer.empty_element("polygon", [
      (
        "points",
        float_text(left) +
        "," +
        float_text(top) +
        " " +
        float_text(left + width) +
        "," +
        float_text(top) +
        " " +
        float_text(left + width / 2.0) +
        "," +
        float_text(top - 7.0),
      ),
      ("fill", bar.cmap().sample_extended(1.1).to_css()),
      ("stroke", "none"),
    ])
  }
  if extend_min {
    let bottom = top + height
    try! writer.empty_element("polygon", [
      (
        "points",
        float_text(left) +
        "," +
        float_text(bottom) +
        " " +
        float_text(left + width) +
        "," +
        float_text(bottom) +
        " " +
        float_text(left + width / 2.0) +
        "," +
        float_text(bottom + 7.0),
      ),
      ("fill", bar.cmap().sample_extended(-0.1).to_css()),
      ("stroke", "none"),
    ])
  }
  try! writer.empty_element("rect", [
    ("x", float_text(left)),
    ("y", float_text(top)),
    ("width", float_text(width)),
    ("height", float_text(height)),
    ("fill", "none"),
    ("stroke", "#374151"),
    ("stroke-width", "1"),
  ])
  if bar.norm().scaled() {
    for (ratio, value) in colorbar_ticks(bar.norm(), bar.tick_count()) {
      let y = top + (1.0 - ratio) * height
      try! writer.empty_element("line", [
        ("x1", float_text(left + width)),
        ("y1", float_text(y)),
        ("x2", float_text(left + width + 5.0)),
        ("y2", float_text(y)),
        ("stroke", "#374151"),
        ("stroke-width", "1"),
      ])
      append_text(
        writer,
        left + width + 8.0,
        y + 3.0,
        colorbar_float(value),
        "start",
        10,
      )
    }
  }
  match bar.label() {
    Some(value) =>
      append_text(
        writer,
        left + width + 42.0,
        top + height / 2.0,
        value,
        "middle",
        12,
      )
    None => ()
  }
}

///|
fn append_colorbar_horizontal(
  writer : @xml.Writer,
  figure : @render.Figure,
  bar : @colorbar.Colorbar,
  index : Int32,
) -> Unit {
  let left = Double::from_int(figure.margin())
  let top = Double::from_int(figure.height() - figure.margin()) +
    24.0 +
    Double::from_int(index) * 48.0
  let width = Double::from_int(figure.width() - figure.margin() * 2)
  let height = 16.0
  let steps = 64
  for step in 0..<steps {
    let ratio = Double::from_int(step) / Double::from_int(steps - 1)
    let x = left + ratio * width
    try! writer.empty_element("rect", [
      ("x", float_text(x)),
      ("y", float_text(top)),
      ("width", float_text(width / Double::from_int(steps) + 1.0)),
      ("height", float_text(height)),
      ("fill", bar.cmap().sample(ratio).to_css()),
      ("stroke", "none"),
    ])
  }
  let (extend_min, extend_max) = colorbar_extensions(bar.norm())
  if extend_min {
    try! writer.empty_element("polygon", [
      (
        "points",
        float_text(left) +
        "," +
        float_text(top) +
        " " +
        float_text(left) +
        "," +
        float_text(top + height) +
        " " +
        float_text(left - 7.0) +
        "," +
        float_text(top + height / 2.0),
      ),
      ("fill", bar.cmap().sample_extended(-0.1).to_css()),
      ("stroke", "none"),
    ])
  }
  if extend_max {
    let right = left + width
    try! writer.empty_element("polygon", [
      (
        "points",
        float_text(right) +
        "," +
        float_text(top) +
        " " +
        float_text(right) +
        "," +
        float_text(top + height) +
        " " +
        float_text(right + 7.0) +
        "," +
        float_text(top + height / 2.0),
      ),
      ("fill", bar.cmap().sample_extended(1.1).to_css()),
      ("stroke", "none"),
    ])
  }
  try! writer.empty_element("rect", [
    ("x", float_text(left)),
    ("y", float_text(top)),
    ("width", float_text(width)),
    ("height", float_text(height)),
    ("fill", "none"),
    ("stroke", "#374151"),
    ("stroke-width", "1"),
  ])
  if bar.norm().scaled() {
    for (ratio, value) in colorbar_ticks(bar.norm(), bar.tick_count()) {
      let x = left + ratio * width
      try! writer.empty_element("line", [
        ("x1", float_text(x)),
        ("y1", float_text(top + height)),
        ("x2", float_text(x)),
        ("y2", float_text(top + height + 5.0)),
        ("stroke", "#374151"),
        ("stroke-width", "1"),
      ])
      append_text(
        writer,
        x,
        top + height + 17.0,
        colorbar_float(value),
        "middle",
        10,
      )
    }
  }
  match bar.label() {
    Some(value) =>
      append_text(
        writer,
        left + width / 2.0,
        top + height + 34.0,
        value,
        "middle",
        12,
      )
    None => ()
  }
}

///|
fn append_colorbar(
  writer : @xml.Writer,
  figure : @render.Figure,
  bar : @colorbar.Colorbar,
  index : Int32,
) -> Unit {
  match bar.orientation() {
    @colorbar.Orientation::Vertical =>
      append_colorbar_vertical(writer, figure, bar, index)
    @colorbar.Orientation::Horizontal =>
      append_colorbar_horizontal(writer, figure, bar, index)
  }
}

///|
fn pie_point(
  center_x : Double,
  center_y : Double,
  radius : Double,
  angle : Double,
) -> (Double, Double) {
  let radians = angle * @math.PI / 180.0
  (
    center_x + radius * @math.cos(radians),
    center_y - radius * @math.sin(radians),
  )
}

///|
fn pie_path(
  center_x : Double,
  center_y : Double,
  radius : Double,
  start_angle : Double,
  end_angle : Double,
) -> String {
  let (start_x, start_y) = pie_point(center_x, center_y, radius, start_angle)
  let (end_x, end_y) = pie_point(center_x, center_y, radius, end_angle)
  let large_arc = if Double::abs(end_angle - start_angle) > 180.0 {
    1
  } else {
    0
  }
  "M \{float_text(center_x)},\{float_text(center_y)} " +
  "L \{float_text(start_x)},\{float_text(start_y)} " +
  "A \{float_text(radius)},\{float_text(radius)} 0 \{large_arc} 0 " +
  "\{float_text(end_x)},\{float_text(end_y)} Z"
}

///|
fn append_pie(
  writer : @xml.Writer,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  values : Array[Double],
  labels : Array[String],
  colors : Array[String],
  start_angle : Double,
) -> Unit {
  if values.length() == 0 {
    return
  }
  let mut total = 0.0
  for value in values {
    if !value.is_nan() && !value.is_inf() && value > 0.0 {
      total += value
    }
  }
  if total <= 0.0 {
    return
  }
  let center_x = left + plot_width / 2.0
  let center_y = top + plot_height / 2.0
  let radius = Double::min(plot_width, plot_height) * 0.32
  let mut angle = start_angle
  for index in 0..<values.length() {
    let value = values[index]
    if value <= 0.0 || value.is_nan() || value.is_inf() {
      continue
    }
    let sweep = value / total * 360.0
    let end_angle = angle + sweep
    let fill = if index < colors.length() { colors[index] } else { "#9ca3af" }
    if sweep >= 359.999 {
      try! writer.empty_element("circle", [
        ("cx", float_text(center_x)),
        ("cy", float_text(center_y)),
        ("r", float_text(radius)),
        ("fill", fill),
        ("stroke", "white"),
        ("stroke-width", "1"),
      ])
    } else {
      try! writer.empty_element("path", [
        ("d", pie_path(center_x, center_y, radius, angle, end_angle)),
        ("fill", fill),
        ("stroke", "white"),
        ("stroke-width", "1"),
      ])
    }
    if index < labels.length() && labels[index] != "" {
      let label_angle = angle + sweep / 2.0
      let (label_x, label_y) = pie_point(
        center_x,
        center_y,
        radius * 1.12,
        label_angle,
      )
      append_text(writer, label_x, label_y, labels[index], "middle", 11)
    }
    angle = end_angle
  }
}

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
fn append_quiver(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  points : Array[@core.Point],
  vectors : Array[@core.Point],
  style : @core.Style,
) -> Unit {
  let count = Int32::min(points.length(), vectors.length())
  for index in 0..<count {
    let point = points[index]
    let vector = vectors[index]
    let end = @core.point(point.x() + vector.x(), point.y() + vector.y())
    if valid_point(scale, point) && valid_point(scale, end) {
      let x1 = map_x(scale, left, plot_width, point.x())
      let y1 = map_y(scale, top, plot_height, point.y())
      let x2 = map_x(scale, left, plot_width, end.x())
      let y2 = map_y(scale, top, plot_height, end.y())
      let dx = x2 - x1
      let dy = y2 - y1
      if dx != 0.0 || dy != 0.0 {
        append_error_segment(writer, x1, y1, x2, y2, style)
        let angle = @math.atan2(dy, dx)
        let head = 7.0
        let wing = 0.55
        let left_x = x2 - head * @math.cos(angle - wing)
        let left_y = y2 - head * @math.sin(angle - wing)
        let right_x = x2 - head * @math.cos(angle + wing)
        let right_y = y2 - head * @math.sin(angle + wing)
        append_error_segment(writer, x2, y2, left_x, left_y, style)
        append_error_segment(writer, x2, y2, right_x, right_y, style)
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

///|
fn panel_rect(
  figure : @render.Figure,
  panel : @render.Panel,
) -> (Double, Double, Double, Double) {
  match panel.rect() {
    Some(rect) => (rect.x(), rect.y(), rect.width(), rect.height())
    None =>
      (
        Double::from_int(figure.margin()),
        Double::from_int(figure.margin()),
        Double::from_int(figure.width() - figure.margin() * 2),
        Double::from_int(figure.height() - figure.margin() * 2),
      )
  }
}

///|
fn anchored_panel_rect(
  rect : (Double, Double, Double, Double),
  width : Double,
  height : Double,
  anchor : (Double, Double),
) -> (Double, Double, Double, Double) {
  (
    rect.0 + (rect.2 - width) * anchor.0,
    rect.1 + (rect.3 - height) * (1.0 - anchor.1),
    width,
    height,
  )
}

///|
fn box_aspect_panel_rect(
  figure : @render.Figure,
  panel : @render.Panel,
) -> (Double, Double, Double, Double) {
  let raw = panel_rect(figure, panel)
  guard panel.adjustable() == "datalim" && panel.box_aspect() is Some(aspect) else {
    return raw
  }
  let height = raw.2 * aspect
  if height <= raw.3 {
    anchored_panel_rect(raw, raw.2, height, panel.anchor())
  } else {
    anchored_panel_rect(raw, raw.3 / aspect, raw.3, panel.anchor())
  }
}

///|
fn data_aspect_rect(
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  aspect : Double,
  anchor : (Double, Double),
) -> (Double, Double, Double, Double) {
  // Match Axes.get_data_ratio's floor for very small transformed intervals.
  let x_span = Double::max(
    Double::abs(
      scale.x_axis_scale.transform(scale.xmax) -
      scale.x_axis_scale.transform(scale.xmin),
    ),
    1.0e-30,
  )
  let y_span = Double::max(
    Double::abs(
      scale.y_axis_scale.transform(scale.ymax) -
      scale.y_axis_scale.transform(scale.ymin),
    ),
    1.0e-30,
  )
  if aspect <= 0.0 || aspect.is_nan() || aspect.is_inf() {
    (left, top, plot_width, plot_height)
  } else {
    let x_units = plot_width / x_span
    let y_units = plot_height / y_span / aspect
    if x_units > y_units {
      let width = y_units * x_span
      anchored_panel_rect(
        (left, top, plot_width, plot_height),
        width,
        plot_height,
        anchor,
      )
    } else {
      let height = x_units * aspect * y_span
      anchored_panel_rect(
        (left, top, plot_width, plot_height),
        plot_width,
        height,
        anchor,
      )
    }
  }
}

///|
fn positioned_panel_rect(
  figure : @render.Figure,
  panel : @render.Panel,
  scale : Scale,
) -> (Double, Double, Double, Double) {
  let (raw_left, raw_top, raw_width, raw_height) = panel_rect(figure, panel)
  if panel.adjustable() == "datalim" {
    return box_aspect_panel_rect(figure, panel)
  }
  match panel.aspect() {
    Some(aspect) =>
      data_aspect_rect(
        scale,
        raw_left,
        raw_top,
        raw_width,
        raw_height,
        aspect,
        panel.anchor(),
      )
    None => (raw_left, raw_top, raw_width, raw_height)
  }
}

///|
/// Resolve a panel's active display rectangle using the same ranges and
/// aspect/anchor calculation as SVG rendering. Invalid panel indices return None.
/// Aspect resolution failures also return None; panel_view preserves DataError.
/// The tuple is (left, top, width, height) in pixels from the top left.
///
/// ```mbt check
/// test {
///   let x_axis = @axis.axis()
///   let y_axis = @axis.axis()
///   x_axis.set_limits(0.0, 1.0)
///   y_axis.set_limits(0.0, 1.0)
///   let panel = @render.panel(
///     None,
///     [],
///     None,
///     [],
///     None,
///     x_axis,
///     y_axis,
///     true,
///     [],
///     [],
///   )
///   let figure = @render.figure(400, 200, 50, [panel], [], None)
///   assert_eq(@svg.panel_position(figure, 0), Some((150.0, 50.0, 100.0, 100.0)))
///   assert_true(@svg.panel_position(figure, 1) is None)
/// }
/// ```
pub fn panel_position(
  figure : @render.Figure,
  panel_index : Int32,
) -> (Double, Double, Double, Double)? {
  try panel_view(figure, panel_index) catch {
    _ => None
  } noraise {
    Some((position, _, _)) => Some(position)
    None => None
  }
}

///|
fn render_panel(
  writer : @xml.Writer,
  figure : @render.Figure,
  panel : @render.Panel,
  scale : Scale,
  panel_index : Int32,
  position : (Double, Double, Double, Double),
) -> Unit raise @core.DataError {
  let (left, top, plot_width, plot_height) = position
  // Earlier panels can change the limits of a shared axis in this frame.
  let (xmin, xmax) = panel.x_axis().view_interval_checked()
  let (ymin, ymax) = panel.y_axis().view_interval_checked()
  let scale : Scale = {
    xmin,
    xmax,
    ymin,
    ymax,
    x_axis_scale: scale.x_axis_scale,
    y_axis_scale: scale.y_axis_scale,
  }
  // The default child-axes zorder precedes the primary Axis artists. Evaluate
  // live secondary batches now; their XML can still follow the plot artists.
  let secondary_scale = scale
  let secondary_order = ordered_secondary_axes(panel)
  let secondary_x_bundles : Array[SecondaryTickBundle?] = Array::make(
    panel.secondary_x().length(),
    None,
  )
  let secondary_y_bundles : Array[SecondaryTickBundle?] = Array::make(
    panel.secondary_y().length(),
    None,
  )
  let mut owned_child_prepared = false
  for (horizontal, index, axis, _) in secondary_order {
    let prepared = if axis.prepare_draw() {
      owned_child_prepared = true
      // The original superclass draw evaluates its locator and calls the
      // child's aspect after the old-context map and parent-name reset.
      ignore(axis.positioned_aspect(left, top, plot_width, plot_height))
      let (lower, upper) = if horizontal {
        (scale.xmin, scale.xmax)
      } else {
        (scale.ymin, scale.ymax)
      }
      Some(secondary_axis_bundle(axis, [], lower, upper))
    } else {
      None
    }
    if horizontal {
      secondary_x_bundles[index] = prepared
    } else {
      secondary_y_bundles[index] = prepared
    }
  }
  // Child callbacks update the source parent's live transData before its
  // primary axes and data artists draw. Never redo finished child bundles.
  let scale = if owned_child_prepared {
    let (xmin, xmax) = panel.x_axis().view_interval_checked()
    let (ymin, ymax) = panel.y_axis().view_interval_checked()
    {
      xmin,
      xmax,
      ymin,
      ymax,
      x_axis_scale: panel.x_axis().scale(),
      y_axis_scale: panel.y_axis().scale(),
    }
  } else {
    scale
  }
  let x_bundle = numeric_axis_bundle(
    panel.x_axis(),
    @core.limits(scale.xmin, scale.xmax),
  )
  let (xmin, xmax) = panel.x_axis().view_interval_checked()
  let y_bundle = numeric_axis_bundle(
    panel.y_axis(),
    @core.limits(scale.ymin, scale.ymax),
  )
  let (ymin, ymax) = panel.y_axis().view_interval_checked()
  let scale : Scale = {
    xmin,
    xmax,
    ymin,
    ymax,
    x_axis_scale: scale.x_axis_scale,
    y_axis_scale: scale.y_axis_scale,
  }
  let x_ticks = x_bundle.major
  let y_ticks = y_bundle.major
  let x_minor_ticks = x_bundle.minor
  let y_minor_ticks = y_bundle.minor
  let x_labels = x_bundle.major_labels
  let y_labels = y_bundle.major_labels
  let x_minor_labels = x_bundle.minor_labels
  let y_minor_labels = y_bundle.minor_labels
  let x_offset_label = x_bundle.offset
  let y_offset_label = y_bundle.offset
  if panel.frame_visible() {
    append_grid(
      writer,
      scale,
      left,
      top,
      plot_width,
      plot_height,
      x_ticks,
      y_ticks,
      x_minor_ticks,
      y_minor_ticks,
      x_labels,
      y_labels,
      x_minor_labels,
      y_minor_labels,
      x_offset_label,
      y_offset_label,
      panel.x_axis().tick_position(),
      panel.y_axis().tick_position(),
      panel.show_x_tick_labels(),
      panel.show_y_tick_labels(),
      panel.x_axis().grid_visible(),
      panel.x_axis().grid_color(),
      panel.x_axis().grid_width(),
      panel.y_axis().grid_visible(),
      panel.y_axis().grid_color(),
      panel.y_axis().grid_width(),
      panel.x_axis().minor_grid_visible(),
      panel.x_axis().minor_grid_color(),
      panel.x_axis().minor_grid_width(),
      panel.y_axis().minor_grid_visible(),
      panel.y_axis().minor_grid_color(),
      panel.y_axis().minor_grid_width(),
      panel.x_axis().tick_label_size(),
      panel.y_axis().tick_label_size(),
    )
    append_axes(
      writer,
      scale,
      left,
      top,
      plot_width,
      plot_height,
      panel.spines(),
    )
  }
  for artist_index, artist in panel.artists() {
    match artist {
      @render.Artist::Line(points, style) =>
        match panel.prepare_line(points) {
          Some((current, current_style, complete)) => {
            append_line(
              writer, scale, left, top, plot_width, plot_height, current, current_style,
            )
            complete()
          }
          None =>
            append_line(
              writer, scale, left, top, plot_width, plot_height, points, style,
            )
        }
      @render.Artist::Scatter(points, style) =>
        append_scatter(
          writer, scale, left, top, plot_width, plot_height, points, style,
        )
      @render.Artist::PathCollection(points, styles) =>
        append_path_collection(
          writer, scale, left, top, plot_width, plot_height, points, styles,
        )
      @render.Artist::Bar(points, style) =>
        append_bars(
          writer, scale, left, top, plot_width, plot_height, points, style,
        )
      @render.Artist::BarH(points, style) =>
        append_barh(
          writer, scale, left, top, plot_width, plot_height, points, style,
        )
      @render.Artist::FillBetween(upper, lower, style) =>
        append_fill_between(
          writer, scale, left, top, plot_width, plot_height, upper, lower, style,
        )
      @render.Artist::Polygon(points, style) =>
        append_polygon(
          writer, scale, left, top, plot_width, plot_height, points, style,
        )
      @render.Artist::CompoundPolygon(polygons, style) =>
        append_compound_polygon(
          writer, scale, left, top, plot_width, plot_height, polygons, style,
        )
      @render.Artist::GouraudTriangle(points, colors) =>
        append_gouraud_triangle(
          writer,
          scale,
          left,
          top,
          plot_width,
          plot_height,
          points,
          colors,
          "gouraud-\{panel_index}-\{artist_index}",
        )
      @render.Artist::HLine(value, style) =>
        append_reference_line(
          writer, scale, left, top, plot_width, plot_height, value, true, style,
        )
      @render.Artist::VLine(value, style) =>
        append_reference_line(
          writer, scale, left, top, plot_width, plot_height, value, false, style,
        )
      @render.Artist::AxLine(point, direction, style) =>
        append_axline(
          writer, scale, left, top, plot_width, plot_height, point, direction, style,
        )
      @render.Artist::HSpan(lower, upper, style) =>
        append_span(
          writer, scale, left, top, plot_width, plot_height, lower, upper, true,
          style,
        )
      @render.Artist::VSpan(lower, upper, style) =>
        append_span(
          writer, scale, left, top, plot_width, plot_height, lower, upper, false,
          style,
        )
      @render.Artist::Text(x, y, value, style) =>
        append_artist_text(
          writer,
          map_x(scale, left, plot_width, x),
          map_y(scale, top, plot_height, y),
          value,
          style,
        )
      @render.Artist::Annotation(value) =>
        append_annotation(
          writer, figure, scale, left, top, plot_width, plot_height, value,
        )
      @render.Artist::ErrorBar(points, yerr, xerr, style) =>
        append_errorbar(
          writer, scale, left, top, plot_width, plot_height, points, yerr, xerr,
          style,
        )
      @render.Artist::Image(data, vmin, vmax, cmap) => {
        let norm = match (vmin, vmax) {
          (Some(lower), Some(upper)) =>
            @colors.linear_color_norm(
              try! @colors.normalize(vmin=lower, vmax=upper),
            )
          (Some(lower), None) =>
            @colors.linear_color_norm(try! @colors.normalize(vmin=lower))
          (None, Some(upper)) =>
            @colors.linear_color_norm(try! @colors.normalize(vmax=upper))
          (None, None) => @colors.linear_color_norm(try! @colors.normalize())
        }
        append_image(
          writer,
          scale,
          left,
          top,
          plot_width,
          plot_height,
          data,
          norm,
          cmap,
          @render.ImageOrigin::Upper,
          None,
          1.0,
          @render.ImageInterpolation::Nearest,
        )
      }
      @render.Artist::ImageNorm(
        data,
        norm,
        cmap,
        origin,
        extent,
        alpha,
        interpolation
      ) =>
        append_image(
          writer, scale, left, top, plot_width, plot_height, data, norm, cmap, origin,
          extent, alpha, interpolation,
        )
      @render.Artist::ColorImage(data, origin, extent, alpha, interpolation) =>
        append_color_image(
          writer, scale, left, top, plot_width, plot_height, data, origin, extent,
          alpha, interpolation,
        )
      @render.Artist::Table(table) =>
        append_table(writer, left, top, plot_width, plot_height, table)
      @render.Artist::Pie(values, labels, colors, start_angle) =>
        append_pie(
          writer, left, top, plot_width, plot_height, values, labels, colors, start_angle,
        )
      @render.Artist::BoxPlot(stats, horizontal, style) =>
        append_boxplot(
          writer, scale, left, top, plot_width, plot_height, stats, horizontal, style,
        )
      @render.Artist::Quiver(points, vectors, style) =>
        append_quiver(
          writer, scale, left, top, plot_width, plot_height, points, vectors, style,
        )
      @render.Artist::Violin(
        stats,
        positions,
        widths,
        horizontal,
        side,
        showmeans,
        showextrema,
        showmedians,
        body_style,
        line_style,
        opacity
      ) =>
        append_violin(
          writer, scale, left, top, plot_width, plot_height, stats, positions, widths,
          horizontal, side, showmeans, showextrema, showmedians, body_style, line_style,
          opacity,
        )
    }
  }
  if panel.frame_visible() {
    for (horizontal, index, axis, _) in secondary_order {
      if horizontal {
        append_secondary_x_axis(
          writer,
          secondary_scale,
          left,
          top,
          plot_width,
          plot_height,
          x_ticks,
          axis,
          prepared=secondary_x_bundles[index],
        )
      } else {
        append_secondary_y_axis(
          writer,
          secondary_scale,
          left,
          top,
          plot_width,
          plot_height,
          y_ticks,
          axis,
          prepared=secondary_y_bundles[index],
        )
      }
    }
  }
  append_legend(writer, left, top, plot_width, panel.legend())
  match panel.title() {
    Some(value) =>
      append_text(
        writer,
        left + plot_width / 2.0,
        top - 18.0,
        value,
        "middle",
        15,
      )
    None => ()
  }
  if panel.frame_visible() {
    match panel.x_axis().label() {
      Some(value) =>
        append_text(
          writer,
          left + plot_width / 2.0,
          top + plot_height + 38.0,
          value,
          "middle",
          13,
        )
      None => ()
    }
    match panel.y_axis().label() {
      Some(value) =>
        append_text(
          writer,
          left - 40.0,
          top + plot_height / 2.0,
          value,
          "middle",
          13,
        )
      None => ()
    }
  }
}

///|
/// Encode a scene figure as a self-contained SVG document.
pub fn render(figure : @render.Figure) -> String {
  render_with_positions(figure).0
}

///|
/// Encode SVG and return the active display rectangles used to draw it.
/// Rectangles are (left, top, width, height) in pixels, in panel order.
/// Scene handles use these results to retain their last drawn positions.
///
/// ```mbt check
/// test {
///   let panel = @render.panel(
///     None,
///     [],
///     None,
///     [],
///     None,
///     @axis.axis(),
///     @axis.axis(),
///     false,
///     [],
///     [],
///   )
///   let figure = @render.figure(400, 200, 50, [panel], [], None)
///   let (svg, positions) = @svg.render_with_positions(figure)
///   assert_eq(svg, @svg.render(figure))
///   assert_eq(positions, [(50.0, 50.0, 300.0, 100.0)])
///   assert_eq(@svg.panel_position(figure, 0), Some(positions[0]))
/// }
/// ```
pub fn render_with_positions(
  figure : @render.Figure,
) -> (String, Array[(Double, Double, Double, Double)]) {
  try! render_with_positions_checked(figure)
}

///|
/// Render while preserving checked locator and range errors.
pub fn render_with_positions_checked(
  figure : @render.Figure,
) -> (String, Array[(Double, Double, Double, Double)]) raise @core.DataError {
  begin_tick_layout(figure)
  defer end_tick_layout(figure)
  let writer = @xml.Writer::new()
  let scales = compute_scales(figure)
  let positions = Array(capacity=figure.panels().length())
  for index, panel in figure.panels() {
    let position = positioned_panel_rect(figure, panel, scales[index])
    positions.push(position)
    panel
    .x_axis()
    .set_tick_layout(position.2, true, active=true, origin=position.0)
    panel
    .y_axis()
    .set_tick_layout(
      position.3,
      false,
      active=true,
      origin=figure.height().to_double() - position.1 - position.3,
    )
    panel.x_axis().set_tick_view(scales[index].xmin, scales[index].xmax)
    panel.y_axis().set_tick_view(scales[index].ymin, scales[index].ymax)
  }
  for index, panel in figure.panels() {
    let (left, top, width, height) = positions[index]
    for (_, _, axis, _) in ordered_secondary_axes(panel) {
      if !axis.positioned_aspect(left, top, width, height) {
        ignore(axis.synchronize_view())
      }
    }
  }
  try! writer.start_element("svg", [
    ("xmlns", "http://www.w3.org/2000/svg"),
    ("width", figure.width().to_string()),
    ("height", figure.height().to_string()),
    ("viewBox", "0 0 \{figure.width()} \{figure.height()}"),
  ])
  try! writer.empty_element("rect", [
    ("width", "100%"),
    ("height", "100%"),
    ("fill", "white"),
  ])
  for index, panel in figure.panels() {
    render_panel(writer, figure, panel, scales[index], index, positions[index])
  }
  for index, bar in figure.colorbars() {
    append_colorbar(writer, figure, bar, index)
  }
  for subfigure in figure.subfigures() {
    let rect = subfigure.rect()
    match subfigure.title() {
      Some(value) =>
        append_text(
          writer,
          rect.x() + rect.width() / 2.0,
          rect.y() + 18.0,
          value,
          "middle",
          16,
        )
      None => ()
    }
  }
  match figure.title() {
    Some(value) =>
      append_text(
        writer,
        Double::from_int(figure.width()) / 2.0,
        28.0,
        value,
        "middle",
        18,
      )
    None => ()
  }
  try! writer.end_element("svg")
  (try! writer.to_string(), positions)
}

///|
// Axis._update_ticks uses transformed view coordinates with interval_contains_close.
// Keep locator neighbors for formatting, but draw only the visible tick components.
fn tick_in_view(
  value : Double,
  axis_scale : @ticker_scale.Scale,
  lower : Double,
  upper : Double,
) -> Bool {
  if !axis_scale.is_valid(value) {
    return false
  }
  let first = axis_scale.transform(lower)
  let last = axis_scale.transform(upper)
  let position = axis_scale.transform(value)
  let low = Double::min(first, last)
  let high = Double::max(first, last)
  let tolerance = (high - low) * 1.0e-10
  low - tolerance <= position && position <= high + tolerance
}
