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
/// Synchronize the secondary's own interval at its aspect/draw boundary.
pub fn SecondaryAxis::apply_aspect(
  self : SecondaryAxis,
) -> Unit raise @core.DataError {
  let (lower, upper) = self.numeric_view_interval()
  self.store_formatter_view(lower, upper)
  self.formatter_geometry = self.formatter_original_geometry
}

///|
// Locator-driven layout passes a physical position, unlike direct apply_aspect.
fn SecondaryAxis::synchronize_formatter_frame(
  self : SecondaryAxis,
) -> Unit raise @core.DataError {
  let (lower, upper) = self.numeric_view_interval()
  self.store_formatter_view(lower, upper)
  self.formatter_geometry = match self.parent_axis {
    Some(parent) =>
      parent
      .formatter_display_geometry()
      .unwrap_or(self.formatter_original_geometry)
    None => self.formatter_original_geometry
  }
}

///|
fn SecondaryAxis::numeric_inverse(
  self : SecondaryAxis,
  value : Double,
) -> Double {
  let primary = if self.parent_axis is Some(parent) && parent.scale().is_log() {
    @scale.Scale::Log.inverse(value)
  } else {
    value
  }
  (self.forward)(primary)
}

///|
fn SecondaryAxis::store_formatter_view(
  self : SecondaryAxis,
  lower : Double,
  upper : Double,
) -> Unit raise @core.DataError {
  // Axis._set_lim validates the supplied endpoints before its locator expands
  // a singular range. It does not validate an infinity produced by expansion.
  if lower.is_nan() || lower.is_inf() || upper.is_nan() || upper.is_inf() {
    raise @core.DataError::InvalidTicks(
      message="ValueError: Axis limits cannot be NaN or Inf",
    )
  }
  let (first, last) = match self.locator {
    Some(@ticker.Locator::NamedLog(value)) => value.nonsingular(lower, upper)
    Some(@ticker.Locator::NamedLogit(value)) => value.nonsingular(lower, upper)
    None if self.parent_axis is Some(parent) && parent.scale().is_log() =>
      secondary_default_log_nonsingular.nonsingular(lower, upper)
    _ => secondary_default_nonsingular.nonsingular(lower, upper)
  }
  let (first, last) = if self.parent_axis is Some(parent) &&
    parent.scale().is_log() {
    (
      if first <= 0.0 {
        1.0e-300
      } else {
        first
      },
      if last <= 0.0 {
        1.0e-300
      } else {
        last
      },
    )
  } else {
    (first, last)
  }
  self.formatter_view = if upper < lower {
    (last, first)
  } else {
    (first, last)
  }
}

///|
// These classes inherit Locator's .05 nonsingular implementation.
let secondary_default_nonsingular : @ticker.FixedLocator = @ticker.FixedLocator::new([],
)

///|
let secondary_default_log_nonsingular : @ticker.LogLocator = {
  let locator = try! @ticker.LogLocator::new()
  locator.bind_shared_minpos(() => [1.0 / 0.0])
  locator
}

///|
// Changing from the initial linear scale to functionlog triggers the source's
// empty-data autoscale during construction, before any parent limit sync.
fn SecondaryAxis::initialize_formatter_view(
  self : SecondaryAxis,
) -> Unit raise @core.DataError {
  if !(self.parent_axis is Some(parent) && parent.scale().is_log()) {
    return
  }
  let (lower, upper) = secondary_default_log_nonsingular.nonsingular(
    -1.0 / 0.0,
    1.0 / 0.0,
  )
  let first = self.numeric_transform(lower)
  let last = self.numeric_transform(upper)
  let margin = match self.location {
    SecondaryAxisLocation::Top | SecondaryAxisLocation::Bottom =>
      @config.x_margin()
    _ => @config.y_margin()
  }
  let delta = (last - first) * margin
  let delta = if delta.is_nan() || delta.is_inf() { 0.0 } else { delta }
  let lower = (self.forward)(@scale.Scale::Log.inverse(first - delta))
  let upper = (self.forward)(@scale.Scale::Log.inverse(last + delta))
  let (lower, upper) = secondary_default_log_nonsingular.view_limits(
    lower, upper,
  )
  self.store_formatter_view(lower, upper)
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
  if locator is @ticker.Locator::NamedLogit(value) {
    self.bind_logit_context(value)
    return
  }
  if locator is @ticker.Locator::NamedAsinh(value) {
    value.bind_view_interval(() => self.numeric_view_interval())
    return
  }
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

///|
fn SecondaryAxis::bind_logit_context(
  self : SecondaryAxis,
  value : @ticker.LogitLocator,
) -> Unit {
  value.bind_tick_space(() => self.get_tick_space())
  value.bind_view_interval(() => self.numeric_view_interval())
  value.bind_minpos(() => 1.0 / 0.0)
  value.bind_projection(() => "rectilinear")
}
