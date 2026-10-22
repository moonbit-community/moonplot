///|
/// Install a minor locator in the secondary axis' own coordinates.
pub fn SecondaryAxis::set_minor_locator(
  self : SecondaryAxis,
  locator : @ticker.MinorLocator,
) -> Unit {
  self.minor_locator = Some(locator.copy())
  match locator {
    @ticker.MinorLocator::NamedAsinh(value) =>
      value.bind_view_interval(() => self.numeric_view_interval())
    @ticker.MinorLocator::NamedSymLog(value) =>
      value.bind_view_interval(() => self.numeric_view_interval())
    @ticker.MinorLocator::NamedLog(value) => self.bind_log_context(value)
    @ticker.MinorLocator::NamedAutoMinor(value) => {
      value.bind_scale(() => self.numeric_scale_name())
      value.bind_axis_name(() => {
        if self.location is (Top | Bottom) {
          "x"
        } else {
          "y"
        }
      })
      value.bind_major_ticks(() => self.major_tick_view_checked())
      value.bind_view_interval(() => self.numeric_view_interval())
    }
    @ticker.MinorLocator::Index(value) =>
      value.bind_data_interval(fn() { (1.0 / 0.0, -1.0 / 0.0) })
    @ticker.MinorLocator::NamedMaxN(value) =>
      self.bind_minor_maxn_context(value)
    @ticker.MinorLocator::NamedAuto(value) =>
      self.bind_minor_maxn_context(value.as_maxn_locator())
    _ => ()
  }
}

///|
fn SecondaryAxis::bind_minor_maxn_context(
  self : SecondaryAxis,
  value : @ticker.MaxNLocator,
) -> Unit {
  value.bind_tick_space(() => self.get_tick_space())
  value.bind_view_interval(() => self.numeric_view_interval())
}

///|
pub fn SecondaryAxis::minor_locator(
  self : SecondaryAxis,
) -> @ticker.MinorLocator? {
  self.minor_locator.map(value => value.copy())
}

///|
pub fn SecondaryAxis::clear_minor_locator(self : SecondaryAxis) -> Unit {
  self.minor_locator = None
}

///|
pub fn SecondaryAxis::set_minor_overlap_removal(
  self : SecondaryAxis,
  enabled : Bool,
) -> Unit {
  self.remove_minor_overlap = enabled
}

///|
pub fn SecondaryAxis::minor_overlap_removal(self : SecondaryAxis) -> Bool {
  self.remove_minor_overlap
}

///|
fn SecondaryAxis::numeric_scale_name(self : SecondaryAxis) -> String {
  if self.parent_axis is Some(parent) && parent.scale().is_log() {
    "functionlog"
  } else {
    "function"
  }
}

///|
fn SecondaryAxis::numeric_transform(
  self : SecondaryAxis,
  value : Double,
) -> Double {
  let primary = (self.inverse)(value)
  if self.parent_axis is Some(parent) && parent.scale().is_log() {
    if primary <= 0.0 {
      -1000.0
    } else {
      @scale.Scale::Log.transform(primary)
    }
  } else {
    primary
  }
}

///|
fn SecondaryAxis::major_tick_view_checked(
  self : SecondaryAxis,
) -> @ticker.TickValues raise @core.DataError {
  if self.fixed_ticks is Some(values) {
    return @ticker.TickValues::from_array(values.copy())
  }
  match self.locator {
    Some(@ticker.Locator::Null(_)) => return @ticker.TickValues::from_array([])
    Some(@ticker.Locator::NamedFixed(value)) =>
      return value.tick_values(0.0, 0.0)
    Some(locator) if locator
      is (@ticker.Locator::NamedAsinh(_)
      | @ticker.Locator::NamedSymLog(_)
      | @ticker.Locator::NamedLog(_)
      | @ticker.Locator::Index(_)
      | @ticker.Locator::NamedMaxN(_)
      | @ticker.Locator::NamedAuto(_)) =>
      return locator.tick_view_for_axis(0.0, 0.0)
    _ => ()
  }
  let (lower, upper) = self.numeric_view_interval()
  if self.locator is Some(locator) {
    return locator.tick_view_for_axis(lower, upper)
  }
  // Preserve the established tick-count fallback until default locator lifecycle migration.
  let values = if self.parent_axis is Some(parent) {
    let (lo, hi) = parent.view_interval_checked()
    parent.tick_values_checked(@core.limits(lo, hi))
  } else {
    [0.0, 1.0]
  }
  let ticks = if values.length() < 2 || self.tick_count < 2 {
    values
  } else {
    let first = values[0]
    let last = values[values.length() - 1]
    Array::makei(self.tick_count, index => {
      first +
      (last - first) *
      Double::from_int(index) /
      Double::from_int(self.tick_count - 1)
    })
  }
  @ticker.TickValues::from_array(ticks.map(self.forward))
}

///|
pub fn SecondaryAxis::tick_values_checked(
  self : SecondaryAxis,
) -> Array[Double] raise @core.DataError {
  let view = self.major_tick_view_checked()
  view.view(0, 1, Int32::min(100000, view.length())).to_array()
}

///|
pub fn SecondaryAxis::minor_tick_values_checked(
  self : SecondaryAxis,
) -> Array[Double] raise @core.DataError {
  let locator = match self.minor_locator {
    None => return []
    Some(value) => value
  }
  if locator is @ticker.MinorLocator::Null(value) {
    let ticks = value.call()
    if self.remove_minor_overlap {
      ignore(self.major_tick_view_checked())
      ignore(self.numeric_view_interval())
    }
    return ticks
  }
  if locator
    is (@ticker.MinorLocator::NamedAutoMinor(_)
    | @ticker.MinorLocator::NamedLog(_)
    | @ticker.MinorLocator::NamedAsinh(_)
    | @ticker.MinorLocator::NamedSymLog(_)) {
    let ticks = match locator {
      @ticker.MinorLocator::NamedAutoMinor(value) => value.call()
      @ticker.MinorLocator::NamedLog(value) => value.call()
      @ticker.MinorLocator::NamedAsinh(value) => value.call()
      @ticker.MinorLocator::NamedSymLog(value) => value.call()
      _ => []
    }
    if !self.remove_minor_overlap {
      return ticks
    }
    let major = self.tick_values_checked()
    let (lower, upper) = self.numeric_view_interval()
    let tolerance = Double::abs(
        self.numeric_transform(upper) - self.numeric_transform(lower),
      ) *
      1.0e-5
    let transformed_major = major.map(value => self.numeric_transform(value))
    return ticks.filter(value => {
      let value = self.numeric_transform(value)
      !transformed_major.any(other => {
        value == other ||
        (
          !other.is_nan() &&
          !other.is_inf() &&
          Double::abs(value - other) <= tolerance
        )
      })
    })
  }
  let (lower, upper) = self.numeric_view_interval()
  locator.tick_values_for_axis(self.tick_values_checked(), lower, upper)
}
