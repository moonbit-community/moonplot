///|
/// Use the ordinary SVG draw once, retaining its exact document and point geometry.
pub fn render_drawing_with_positions_checked(
  figure : @render.Figure,
) -> (@drawing.Drawing, Array[(Double, Double, Double, Double)]) raise @core.DataError {
  let hits : Array[@drawing.HitPoint] = []
  let (document, positions) = render_with_hits_checked(figure, Some(hits))
  (@drawing.drawing(figure.width(), figure.height(), document, hits), positions)
}

///|
// Collect at the actual data draw stage, using its captured scale and panel.
// Filtering keeps original point indices; it does not compact the identity space.
fn collect_drawing_points(
  output : Array[@drawing.HitPoint],
  panel_index : Int32,
  artist_index : Int32,
  points : Array[@core.Point],
  scale : Scale,
  position : (Double, Double, Double, Double),
  count? : Int32,
) -> Unit {
  let (left, top, width, height) = position
  let length = count.unwrap_or(points.length())
  for index in 0..<length {
    let point = points[index]
    if !valid_point(scale, point) {
      continue
    }
    let x = map_x(scale, left, width, point.x())
    let y = map_y(scale, top, height, point.y())
    if x.is_nan() ||
      x.is_inf() ||
      y.is_nan() ||
      y.is_inf() ||
      x < left ||
      x > left + width ||
      y < top ||
      y > top + height {
      continue
    }
    output.push(
      @drawing.hit_point(
        panel_index,
        artist_index,
        index,
        point.x(),
        point.y(),
        x,
        y,
      ),
    )
  }
}
