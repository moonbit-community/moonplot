///|
/// One constant-size face snapshot; no mesh or scalar array per face.
pub struct TripcolorHitData {
  priv original : Array[@core.Point]
  priv expected : Array[@core.Point]
  priv slot : Int32
  priv value : Double
  priv info : @drawing.TriColorInfo
  priv series : String
  priv enabled : Bool
}

///|
pub fn tripcolor_hit_data(
  points : Array[@core.Point],
  slot : Int32,
  value : Double,
  vertices : (Int32, Int32, Int32),
  vertex_mean : Bool,
  series : String,
) -> TripcolorHitData {
  {
    original: points,
    expected: points.copy(),
    slot,
    value,
    info: @drawing.tricolor_info(vertices, vertex_mean~),
    series,
    enabled: true,
  }
}

///|
pub fn TripcolorHitData::invalidated(
  self : TripcolorHitData,
) -> TripcolorHitData {
  { ..self, enabled: false, }
}

///|
pub fn TripcolorHitData::enabled(self : TripcolorHitData) -> Bool {
  self.enabled
}

///|
pub fn TripcolorHitData::slot(self : TripcolorHitData) -> Int32 {
  self.slot
}

///|
pub fn TripcolorHitData::value(self : TripcolorHitData) -> Double {
  self.value
}

///|
pub fn TripcolorHitData::info(self : TripcolorHitData) -> @drawing.TriColorInfo {
  self.info
}

///|
pub fn TripcolorHitData::series(self : TripcolorHitData) -> String {
  self.series
}

///|
/// Guard the actual original array once before its successful-write callback.
pub fn TripcolorHitData::matches_points(
  self : TripcolorHitData,
  points : Array[@core.Point],
) -> Bool {
  if !self.enabled ||
    points.length() != 3 ||
    self.expected.length() != 3 ||
    !physical_equal(self.original, points) {
    return false
  }
  for i, point in points {
    if !stem_point_equal(point, self.expected[i]) {
      return false
    }
  }
  true
}
