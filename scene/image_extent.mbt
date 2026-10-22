///|
fn Axes::fit_image_extent(
  self : Axes,
  data : Array[Array[Double]],
  origin : ImageOrigin,
  extent : (Double, Double, Double, Double)?,
) -> Unit {
  self.fit_image_dimensions(data.length(), data[0].length(), origin, extent)
}

///|
/// Apply image bounds to every axes in the corresponding shared-axis groups.
/// The helper is dimension based so scalar and already-colored images share
/// exactly the same half-pixel and origin semantics.
fn Axes::fit_image_dimensions(
  self : Axes,
  rows : Int32,
  columns : Int32,
  origin : ImageOrigin,
  extent : (Double, Double, Double, Double)?,
) -> Unit {
  let (left, right, bottom, top) = match extent {
    Some(bounds) => bounds
    None => {
      let right = Double::from_int(columns) - 0.5
      let last_row = Double::from_int(rows) - 0.5
      match origin {
        Upper => (-0.5, right, last_row, -0.5)
        Lower => (-0.5, right, -0.5, last_row)
      }
    }
  }
  for state in self.x_group_states() {
    state.val.x_axis.set_auto_limits(left, right)
  }
  for state in self.y_group_states() {
    state.val.y_axis.set_auto_limits(bottom, top)
  }
}
