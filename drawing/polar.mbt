///|
fn valid_polar_circle(circle : (Double, Double, Double)) -> Bool {
  finite(circle.0) && finite(circle.1) && finite(circle.2) && circle.2 > 0.0
}

///|
fn copy_polar_circles(
  records : Array[(Int32, (Double, Double, Double))],
) -> Map[Int32, (Double, Double, Double)?] {
  let result : Map[Int32, (Double, Double, Double)?] = Map([])
  for (panel, circle) in records {
    let value = if panel >= 0 && valid_polar_circle(circle) {
      Some(circle)
    } else {
      None
    }
    match result.get(panel) {
      None => result[panel] = value
      Some(previous) => if previous != value { result[panel] = None }
    }
  }
  result
}

///|
/// The exact immutable data-clip circle for this prepared polar panel.
/// Invalid or conflicting records return None and keep their panel unselectable.
pub fn Drawing::polar_circle(
  self : Drawing,
  panel_index : Int32,
) -> (Double, Double, Double)? {
  self.polar_circles.get(panel_index).flatten()
}

///|
fn Drawing::polar_admits(
  self : Drawing,
  panel_index : Int32,
  x : Double,
  y : Double,
  required : Bool,
) -> Bool {
  match self.polar_circles.get(panel_index) {
    None => !required
    Some(None) => false
    Some(Some((cx, cy, radius))) => {
      let dx = x - cx
      let dy = y - cy
      finite(dx) && finite(dy) && hit_distance(dx, dy) <= radius
    }
  }
}
