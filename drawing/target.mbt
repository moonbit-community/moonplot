///|
/// The plotted primitive described by a hit target.
pub(all) enum HitKind {
  Line
  Scatter
  Bar
  BarH
  Histogram
  Pie
} derive(Eq, Debug)

///|
pub extend HitKind with Eq::{equal, not_equal}

///|
pub extend HitKind with @debug.Debug::{to_repr}

///|
/// XNearest falls back to a real line sample nearest in screen X inside a panel.
pub(all) enum HitMode {
  Nearest
  XNearest
} derive(Eq, Debug)

///|
pub extend HitMode with Eq::{equal, not_equal}

///|
pub extend HitMode with @debug.Debug::{to_repr}

///|
/// Intrinsic drawing geometry. Rectangles use left, top, width, height.
/// Sectors use center X/Y, radius, start degrees and positive CCW sweep degrees;
/// angles follow mathematical coordinates, with the screen Y direction reversed.
/// Nonpositive sizes/sweeps and nonfinite geometry do not hit; rectangle and
/// sector edges are included, and sweeps of at least 360 degrees are full circles.
pub(all) enum HitShape {
  Point
  Rectangle(Double, Double, Double, Double)
  Sector(Double, Double, Double, Double, Double)
} derive(Eq, Debug)

///|
pub extend HitShape with Eq::{equal, not_equal}

///|
pub extend HitShape with @debug.Debug::{to_repr}

///|
/// Semantic values captured with the same immutable frame as its hit point.
pub struct HitInfo {
  point : HitPoint
  kind : HitKind
  series : String
  category : String?
  value : Double
  interval : (Double, Double)?
  fraction : Double?
} derive(Eq, Debug)

///|
pub extend HitInfo with Eq::{equal, not_equal}

///|
pub extend HitInfo with @debug.Debug::{to_repr}

///|
pub fn hit_info(
  point : HitPoint,
  kind : HitKind,
  value~ : Double,
  series~ : String = "",
  category~ : String? = None,
  interval~ : (Double, Double)? = None,
  fraction~ : Double? = None,
) -> HitInfo {
  { point, kind, series, category, value, interval, fraction, }
}

///|
/// A hit geometry and the displayed panel rectangle that clips it.
pub struct HitTarget {
  info : HitInfo
  shape : HitShape
  bounds : (Double, Double, Double, Double)
} derive(Eq, Debug)

///|
pub extend HitTarget with Eq::{equal, not_equal}

///|
pub extend HitTarget with @debug.Debug::{to_repr}

///|
pub fn hit_target(
  info : HitInfo,
  shape : HitShape,
  bounds : (Double, Double, Double, Double),
) -> HitTarget {
  { info, shape, bounds, }
}
