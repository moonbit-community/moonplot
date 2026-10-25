///|
priv struct ArtistHitData {
  artist : Artist
  mut series : String
  mut histogram_edges : Array[Double]?
  mut band_horizontal : Bool?
  mut band_values : Array[Double]?
}

///|
fn same_hit_artist(first : Artist, second : Artist) -> Bool {
  match (first, second) {
    (Line(a, _), Line(b, _))
    | (Scatter(a, _), Scatter(b, _))
    | (Bar(a, _), Bar(b, _))
    | (BarH(a, _), BarH(b, _)) => physical_equal(a, b)
    (FillBetween(a, _, _), FillBetween(b, _, _)) => physical_equal(a, b)
    (BarSegments(a, _, _), BarSegments(b, _, _)) => physical_equal(a, b)
    (ErrorBar(a, _, _, _), ErrorBar(b, _, _, _)) => physical_equal(a, b)
    (BoxPlot(a, _, _), BoxPlot(b, _, _)) => physical_equal(a, b)
    (PathCollection(a), PathCollection(b)) => physical_equal(a, b)
    (Pie(a, _, _, _), Pie(b, _, _, _))
    | (Donut(a, _, _, _, _), Donut(b, _, _, _, _)) => physical_equal(a, b)
    _ => false
  }
}

///|
fn AxesData::hit_metadata(
  self : AxesData,
  artist : Artist,
) -> @render.HitMetadata {
  for record in self.artist_hits {
    if same_hit_artist(record.artist, artist) {
      return @render.hit_metadata(
        record.series,
        edges=record.histogram_edges,
        band_horizontal=record.band_horizontal,
        band_values=record.band_values,
      )
    }
  }
  @render.hit_metadata("")
}

///|
fn Axes::record_hit_series(self : Axes, series : String) -> Unit {
  let records = self.state.val.artist_hits
  if records.length() > 0 {
    records[records.length() - 1].series = series
  }
}

///|
fn Axes::record_histogram_edges(self : Axes, edges : Array[Double]) -> Unit {
  let records = self.state.val.artist_hits
  if records.length() > 0 {
    records[records.length() - 1].histogram_edges = Some(edges.copy())
  }
}

///|
fn Axes::record_band(
  self : Axes,
  horizontal : Bool,
  values~ : Array[Double]? = None,
) -> Unit {
  let records = self.state.val.artist_hits
  if records.length() > 0 {
    let record = records[records.length() - 1]
    record.band_horizontal = Some(horizontal)
    record.band_values = values.map(source => source.copy())
  }
}
