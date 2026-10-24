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
  line_alpha~ : Double? = None,
  line_dashes~ : (Double, Array[Double])? = None,
) -> Unit {
  if points.length() == 0 {
    return
  }
  let attributes = [
    ("fill", "none"),
    ("stroke", style.color()),
    ("stroke-width", float_text(style.width())),
    ("points", points_text(scale, left, top, plot_width, plot_height, points)),
  ]
  if line_alpha is Some(alpha) {
    attributes.push(("stroke-opacity", float_text(alpha)))
  }
  if line_dashes is Some((offset, sequence)) {
    let text = StringBuilder()
    for index, value in sequence {
      if index > 0 {
        text.write_string(",")
      }
      text.write_string(float_text(value))
    }
    attributes.push(("stroke-dasharray", text.to_string()))
    attributes.push(("stroke-dashoffset", float_text(offset)))
  }
  try! writer.empty_element("polyline", attributes)
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
  line_alpha~ : Double? = None,
  line_dashes~ : (Double, Array[Double])? = None,
) -> Unit {
  let mut segment : Array[@core.Point] = []
  for p in points {
    if valid_point(scale, p) {
      segment.push(p)
    } else if segment.length() > 0 {
      append_line_segment(
        writer,
        scale,
        left,
        top,
        plot_width,
        plot_height,
        segment,
        style,
        line_alpha~,
        line_dashes~,
      )
      segment = []
    }
  }
  if segment.length() > 0 {
    append_line_segment(
      writer,
      scale,
      left,
      top,
      plot_width,
      plot_height,
      segment,
      style,
      line_alpha~,
      line_dashes~,
    )
  }
}

///|
// Only true Line artists consume this carrier. Errorbar's center polyline
// keeps append_line's default solid behavior.
fn append_line_artist(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  points : Array[@core.Point],
  style : @core.Style,
) -> Unit raise @core.DataError {
  let stroke = style.line_stroke()
  if stroke.linestyle() == "None" || points.is_empty() {
    return
  }
  let line_dashes = if style.width() > 0.0 {
    match stroke.dash_sequence() {
      Some(sequence) => {
        // Original GC checks all negative entries before testing positivity.
        // This happens for nonempty paths even when every point is nonfinite.
        for value in sequence {
          if value < 0.0 {
            raise @core.DataError::InvalidTicks(
              message="ValueError: All values in the dash list must be non-negative",
            )
          }
        }
        let mut positive = false
        for value in sequence {
          if value > 0.0 {
            positive = true
          }
        }
        if !sequence.is_empty() && !positive {
          raise @core.DataError::InvalidTicks(
            message="ValueError: At least one value in the dash list must be positive",
          )
        }
        Some((stroke.dash_offset(), sequence))
      }
      None => None
    }
  } else {
    None
  }
  append_line(
    writer,
    scale,
    left,
    top,
    plot_width,
    plot_height,
    points,
    style,
    line_alpha=style.line_alpha(),
    line_dashes~,
  )
}

///|
fn append_line_context(
  writer : @xml.Writer,
  scale : Scale,
  left : Double,
  top : Double,
  plot_width : Double,
  plot_height : Double,
  context : @render.LineDrawingContext,
) -> Unit raise @core.DataError {
  let current = context.points()
  append_line_artist(
    writer,
    scale,
    left,
    top,
    plot_width,
    plot_height,
    current,
    context.first_style(),
  )
  if context.resolve_foreground_style() is Some(foreground) {
    append_line_artist(
      writer, scale, left, top, plot_width, plot_height, current, foreground,
    )
  }
  context.complete()
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
