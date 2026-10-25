///|
fn barb_source(
  xs : Array[Double],
  ys : Array[Double],
  us : Array[Double],
  vs : Array[Double],
  label : String,
) -> @render.BarbHitData {
  let points = Array(capacity=xs.length())
  let vectors = Array(capacity=xs.length())
  for i, x in xs {
    points.push(@core.point(x, ys[i]))
    vectors.push(@core.point(us[i], vs[i]))
  }
  @render.barb_hit_data(points, vectors, label).unwrap()
}

///|
fn Axes::push_barb_component(
  self : Axes,
  artist : Artist,
  source : @render.BarbHitData,
  index : Int32,
) -> Unit {
  let (component, points) = match artist {
    Line(points, _) => (@render.BarbComponent::Stroke, points)
    Polygon(points, _) => (@render.BarbComponent::Flag, points)
    Scatter(points, _) => (@render.BarbComponent::Calm, points)
    _ => return
  }
  let view = source.view(index, component, points).unwrap()
  self.push_artist(artist)
  let records = self.state.val.artist_hits
  let record = records[records.length() - 1]
  record.barb = Some(view)
  record.series = view.series()
}
