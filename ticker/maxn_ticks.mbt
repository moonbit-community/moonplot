///|
fn maxn_symmetric_bounds(lower : Double, upper : Double) -> (Double, Double) {
  let first = Double::abs(lower)
  let last = Double::abs(upper)
  // Python max preserves the first NaN but ignores a later NaN.
  let maximum = if last > first { last } else { first }
  (-maximum, maximum)
}

///|
pub fn MaxNLocator::tick_values(
  self : MaxNLocator,
  lower : Double,
  upper : Double,
) -> Array[Double] raise @core.DataError {
  let (lower, upper) = if self.symmetric {
    maxn_symmetric_bounds(lower, upper)
  } else {
    (lower, upper)
  }
  let (lower, upper) = locator_nonsingular(lower, upper, 1.0e-13, tiny=1.0e-14)
  let grid = self.grid(lower, upper)
  let first = if self.prune == Some("lower") || self.prune == Some("both") {
    1L
  } else {
    0L
  }
  let last = if self.prune == Some("upper") || self.prune == Some("both") {
    grid.length - 1L
  } else {
    grid.length
  }
  let length = Int64::max(0L, last - first)
  let length = Int64::min(length, 100000L).to_int()
  Array::makei(length, index => grid.value(first + Int64::from_int(index)))
}

///|
pub fn MaxNLocator::view_limits(
  self : MaxNLocator,
  lower : Double,
  upper : Double,
) -> (Double, Double) raise @core.DataError {
  let (lower, upper) = if self.symmetric {
    maxn_symmetric_bounds(lower, upper)
  } else {
    (lower, upper)
  }
  let (lower, upper) = locator_nonsingular(lower, upper, 1.0e-12, tiny=1.0e-13)
  if @config.axes_autolimit_mode() == "round_numbers" {
    let grid = self.grid(lower, upper)
    if grid.length == 0L {
      raise @core.DataError::InvalidTicks(
        message="MaxN grid has no range endpoints",
      )
    }
    (grid.value(0L), grid.value(grid.length - 1L))
  } else {
    (lower, upper)
  }
}

///|
pub fn MaxNLocator::nonsingular(
  _self : MaxNLocator,
  lower : Double,
  upper : Double,
) -> (Double, Double) {
  locator_nonsingular(lower, upper, 0.05)
}

///|
pub fn MaxNLocator::call(
  self : MaxNLocator,
) -> Array[Double] raise @core.DataError {
  match self.view_interval_provider {
    None =>
      raise @core.DataError::InvalidTicks(
        message="MaxN locator is not bound to a view interval",
      )
    Some(provider) => {
      let (lower, upper) = provider()
      self.tick_values(lower, upper)
    }
  }
}
