///|
/// Source labels and optional histogram edges for one stable artist identity.
/// Coordinates and current category units are resolved by the actual renderer.
pub struct HitMetadata {
  priv series : String
  priv edges : Array[Double]?
}

///|
pub fn hit_metadata(
  series : String,
  edges~ : Array[Double]? = None,
) -> HitMetadata {
  { series, edges: edges.map(values => values.copy()), }
}

///|
pub fn HitMetadata::series(self : HitMetadata) -> String {
  self.series
}

///|
pub fn HitMetadata::interval(
  self : HitMetadata,
  index : Int32,
) -> (Double, Double)? {
  match self.edges {
    Some(edges) =>
      if index >= 0 && index + 1 < edges.length() {
        Some((edges[index], edges[index + 1]))
      } else {
        None
      }
    None => None
  }
}

///|
pub fn Panel::hit_metadata(self : Panel, index : Int32) -> HitMetadata {
  if index >= 0 && index < self.hit_metadata.length() {
    self.hit_metadata[index]
  } else {
    hit_metadata("")
  }
}
