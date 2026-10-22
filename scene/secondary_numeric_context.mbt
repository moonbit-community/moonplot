///|
pub fn SecondaryAxis::set_tick_label_size(
  self : SecondaryAxis,
  size : Double,
) -> Unit {
  self.tick_label_size = if size < 1.0 { 1.0 } else { size }
}

///|
pub fn SecondaryAxis::tick_label_size(self : SecondaryAxis) -> Double {
  self.tick_label_size
}

///|
pub fn SecondaryAxis::get_tick_space(self : SecondaryAxis) -> Double {
  let horizontal = self.location
    is (SecondaryAxisLocation::Top | SecondaryAxisLocation::Bottom)
  match self.parent_axis {
    Some(parent) =>
      match parent.tick_space_length() {
        Some(length) =>
          @axis.tick_space_from_length(length, self.tick_label_size, horizontal)
        None => 9.0
      }
    None => 9.0
  }
}

///|
fn SecondaryAxis::numeric_view_interval(
  self : SecondaryAxis,
) -> (Double, Double) raise @core.DataError {
  let (lower, upper) = match self.parent_axis {
    Some(parent) => parent.view_interval_checked()
    None => (0.0, 1.0)
  }
  let first = (self.forward)(lower)
  let last = (self.forward)(upper)
  if (first < last) != (lower < upper) {
    (last, first)
  } else {
    (first, last)
  }
}

///|
fn SecondaryAxis::bind_numeric_locator_context(
  self : SecondaryAxis,
  locator : @ticker.Locator,
) -> Unit {
  if locator is @ticker.Locator::NamedSymLog(value) {
    value.bind_view_interval(() => self.numeric_view_interval())
    return
  }
  if locator is @ticker.Locator::NamedLog(value) {
    self.bind_log_context(value)
    return
  }
  let value = match locator {
    @ticker.Locator::NamedMaxN(value) => value
    @ticker.Locator::NamedAuto(value) => value.as_maxn_locator()
    _ => return
  }
  value.bind_tick_space(() => self.get_tick_space())
  value.bind_view_interval(() => self.numeric_view_interval())
}

///|
fn SecondaryAxis::bind_log_context(
  self : SecondaryAxis,
  value : @ticker.LogLocator,
) -> Unit {
  value.bind_tick_space(() => {
    @ticker.LogTickSpace::from_integer(self.get_tick_space())
  })
  value.bind_view_interval(() => self.numeric_view_interval())
  // A secondary axis transforms a view, but owns an empty dataLim.
  value.bind_minpos(() => 1.0 / 0.0)
  value.bind_shared_minpos(() => [1.0 / 0.0])
}
