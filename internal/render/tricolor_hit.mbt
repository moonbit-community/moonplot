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
// A binary scale avoids introducing division-rounding into a collinearity
// decision. Subnormal inputs use the smallest normal power of two.
fn tripcolor_binary_scale(magnitude : Double) -> Double {
  let exponent = magnitude.reinterpret_as_int64() & 0x7FF0000000000000L
  if exponent == 0L {
    0x0010000000000000L.reinterpret_as_double()
  } else {
    exponent.reinterpret_as_double()
  }
}

///|
// A collinear source must not become an interactive sliver just because the
// three screen transforms round independently. No screen tolerance is used.
fn tripcolor_source_area(points : Array[@core.Point]) -> Bool {
  let a = points[0]
  let b = points[1]
  let c = points[2]
  let raw = (b.x() - a.x(), b.y() - a.y(), c.x() - a.x(), c.y() - a.y())
  let (dx, dy, qx, qy) = if raw.0.is_inf() ||
    raw.1.is_inf() ||
    raw.2.is_inf() ||
    raw.3.is_inf() {
    // Finite opposite extremes may overflow subtraction. Scale coordinates
    // first in that case; unprovable or collapsed geometry stays static.
    let scale = a
      .x()
      .abs()
      .max(a.y().abs())
      .max(b.x().abs())
      .max(b.y().abs())
      .max(c.x().abs())
      .max(c.y().abs())
    if scale == 0.0 || scale.is_nan() || scale.is_inf() {
      return false
    }
    let scale = tripcolor_binary_scale(scale)
    (
      b.x() / scale - a.x() / scale,
      b.y() / scale - a.y() / scale,
      c.x() / scale - a.x() / scale,
      c.y() / scale - a.y() / scale,
    )
  } else {
    raw
  }
  let scale = dx.abs().max(dy.abs()).max(qx.abs()).max(qy.abs())
  if scale == 0.0 || scale.is_nan() || scale.is_inf() {
    return false
  }
  let scale = tripcolor_binary_scale(scale)
  let cross = dx / scale * (qy / scale) - dy / scale * (qx / scale)
  !cross.is_nan() && !cross.is_inf() && cross != 0.0
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
  tripcolor_source_area(points)
}
