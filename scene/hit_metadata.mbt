///|
priv struct ArtistHitData {
  artist : Artist
  mut series : String
  mut histogram_edges : Array[Double]?
  mut band_horizontal : Bool?
  mut band_values : Array[Double]?
  mut mesh : @render.MeshHitData?
  mut hexbin : @render.HexbinHitData?
  mut discrete : DiscreteLineSource?
}

///|
fn same_hit_artist(first : Artist, second : Artist) -> Bool {
  match (first, second) {
    (Line(a, _), Line(b, _))
    | (Scatter(a, _), Scatter(b, _))
    | (Bar(a, _), Bar(b, _))
    | (BarH(a, _), BarH(b, _)) => physical_equal(a, b)
    (Polygon(a, _), Polygon(b, _)) => physical_equal(a, b)
    (FillBetween(a, _, _), FillBetween(b, _, _)) => physical_equal(a, b)
    (BarSegments(a, _, _), BarSegments(b, _, _)) => physical_equal(a, b)
    (ErrorBar(a, _, _, _), ErrorBar(b, _, _, _)) => physical_equal(a, b)
    (BoxPlot(a, _, _), BoxPlot(b, _, _)) => physical_equal(a, b)
    (
      Violin(a, _, _, _, _, _, _, _, _, _, _),
      Violin(b, _, _, _, _, _, _, _, _, _, _),
    ) => physical_equal(a, b)
    (PathCollection(a), PathCollection(b)) => physical_equal(a, b)
    (Pie(a, _, _, _), Pie(b, _, _, _))
    | (Donut(a, _, _, _, _), Donut(b, _, _, _, _)) => physical_equal(a, b)
    _ => false
  }
}

///|
fn ArtistHitData::render_metadata(self : ArtistHitData) -> @render.HitMetadata {
  @render.hit_metadata(
    self.series,
    edges=self.histogram_edges,
    band_horizontal=self.band_horizontal,
    band_values=self.band_values,
    mesh=self.mesh,
    hexbin=self.hexbin,
    discrete=self.discrete.map(source => source.data),
  )
}

///|
// Most records retain the artist's index. Images and inline contour expansion
// can shift that relation: retain the last matched record cursor, so a whole
// following mesh block does not restart a linear identity scan for every face.
fn AxesData::hit_metadata(
  self : AxesData,
  artist : Artist,
  index : Int32,
  cursor : @ref.Ref[Int32],
) -> @render.HitMetadata {
  if !same_hit_artist(artist, artist) {
    return @render.hit_metadata("")
  }
  if index >= 0 && index < self.artist_hits.length() {
    let record = self.artist_hits[index]
    if same_hit_artist(record.artist, artist) {
      cursor.val = index + 1
      return record.render_metadata()
    }
  }
  let next = cursor.val
  if next >= 0 && next < self.artist_hits.length() {
    let record = self.artist_hits[next]
    if same_hit_artist(record.artist, artist) {
      cursor.val = next + 1
      return record.render_metadata()
    }
  }
  // Rare identity rewrites retain the previous safe lookup behavior. Public
  // copied artist arrays or equal colors never stand in for physical identity.
  for record_index, record in self.artist_hits {
    if same_hit_artist(record.artist, artist) {
      cursor.val = record_index + 1
      return record.render_metadata()
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

///|
fn Axes::record_mesh_cell(self : Axes, mesh : @render.MeshHitData) -> Unit {
  let records = self.state.val.artist_hits
  if records.length() > 0 {
    records[records.length() - 1].mesh = Some(mesh)
  }
}

///|
fn Axes::record_hexbin(self : Axes, bin : @render.HexbinHitData) -> Unit {
  let records = self.state.val.artist_hits
  if records.length() > 0 {
    records[records.length() - 1].hexbin = Some(bin)
  }
}
