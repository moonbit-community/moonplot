///|
/// A data-point anchor and its intrinsic drawing coordinates.
/// Indices identify a point within this frame's panel and artist ordering.
pub struct HitPoint {
  panel_index : Int32
  artist_index : Int32
  point_index : Int32
  data_x : Double
  data_y : Double
  screen_x : Double
  screen_y : Double
} derive(Eq, Debug)

///|
pub extend HitPoint with Eq::{equal, not_equal}

///|
pub extend HitPoint with @debug.Debug::{to_repr}

///|
pub fn hit_point(
  panel_index : Int32,
  artist_index : Int32,
  point_index : Int32,
  data_x : Double,
  data_y : Double,
  screen_x : Double,
  screen_y : Double,
) -> HitPoint {
  {
    panel_index,
    artist_index,
    point_index,
    data_x,
    data_y,
    screen_x,
    screen_y,
  }
}

///|
/// A prepared SVG snapshot with immutable semantic hit targets and no UI types.
pub struct Drawing {
  priv width : Int32
  priv height : Int32
  priv svg : String
  priv points : Array[HitPoint]
  priv targets : Array[HitTarget]
}

///|
/// Capture the drawing and an independent copy of its hit-target array.
pub fn drawing(
  width : Int32,
  height : Int32,
  svg : String,
  points : Array[HitPoint],
  targets~ : Array[HitTarget] = [],
) -> Drawing {
  { width, height, svg, points: points.copy(), targets: targets.copy(), }
}

///|
pub fn Drawing::width(self : Drawing) -> Int32 {
  self.width
}

///|
pub fn Drawing::height(self : Drawing) -> Int32 {
  self.height
}

///|
pub fn Drawing::svg(self : Drawing) -> String {
  self.svg
}

///|
/// Return a copy; mutating it cannot change this drawing's hit targets.
pub fn Drawing::points(self : Drawing) -> Array[HitPoint] {
  self.points.copy()
}

///|
/// Return an independent array; target values contain no mutable collections.
pub fn Drawing::targets(self : Drawing) -> Array[HitTarget] {
  self.targets.copy()
}

///|
/// Look up metadata by exact point equality within this prepared frame.
pub fn Drawing::hit_info(self : Drawing, point : HitPoint) -> HitInfo? {
  for target in self.targets {
    if target.info.point == point {
      return Some(target.info)
    }
  }
  None
}
