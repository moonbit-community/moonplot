///|
/// Bind local artist data without changing the locator's owning axis.
pub fn Axis::bind_data_interval(
  self : Axis,
  provider : () -> (Double, Double),
) -> Unit {
  self.data_interval_provider = Some(provider)
}

///|
pub fn Axis::data_interval(self : Axis) -> @core.Limits {
  match self.data_interval_provider {
    Some(provider) => {
      let (lower, upper) = provider()
      @core.limits(lower, upper)
    }
    None => @core.limits(1.0 / 0.0, -1.0 / 0.0)
  }
}

///|
/// Rebind after setting a shared locator so its last explicit owner supplies data.
pub fn Axis::bind_locator_data(self : Axis, minor~ : Bool = false) -> Unit {
  let provider = fn() {
    let values = self.data_interval()
    (values.lower(), values.upper())
  }
  if minor {
    match self.minor_locator {
      Some(@ticker.MinorLocator::NamedLogit(value)) =>
        self.bind_logit_context(value)
      Some(@ticker.MinorLocator::NamedAsinh(value)) =>
        value.bind_view_interval(() => self.view_interval_checked())
      Some(@ticker.MinorLocator::NamedSymLog(value)) =>
        value.bind_view_interval(() => self.view_interval_checked())
      Some(@ticker.MinorLocator::NamedLog(value)) =>
        self.bind_log_context(value)
      Some(@ticker.MinorLocator::NamedAutoMinor(value)) =>
        self.bind_auto_minor_context(value)
      Some(@ticker.MinorLocator::Index(value)) =>
        value.bind_data_interval(provider)
      Some(@ticker.MinorLocator::NamedMaxN(value)) =>
        self.bind_maxn_context(value)
      Some(@ticker.MinorLocator::NamedAuto(value)) =>
        self.bind_maxn_context(value.as_maxn_locator())
      _ => ()
    }
  } else {
    match self.locator {
      Some(@ticker.Locator::NamedLogit(value)) => self.bind_logit_context(value)
      Some(@ticker.Locator::NamedAsinh(value)) =>
        value.bind_view_interval(() => self.view_interval_checked())
      Some(@ticker.Locator::NamedSymLog(value)) =>
        value.bind_view_interval(() => self.view_interval_checked())
      Some(@ticker.Locator::NamedLog(value)) => self.bind_log_context(value)
      Some(@ticker.Locator::Index(value)) => value.bind_data_interval(provider)
      Some(@ticker.Locator::NamedMaxN(value)) => self.bind_maxn_context(value)
      Some(@ticker.Locator::NamedAuto(value)) =>
        self.bind_maxn_context(value.as_maxn_locator())
      _ => ()
    }
  }
}

///|
/// New named numeric locators preserve their direct errors in checked rendering.
pub fn Axis::tick_values_checked(
  self : Axis,
  automatic : @core.Limits,
) -> Array[Double] raise @core.DataError {
  if (self.named_formatter is Some(_) || self.minor_named_formatter is Some(_)) &&
    self.fixed_ticks is None &&
    self.category is None &&
    self.date_format is None &&
    self.locator is Some(@ticker.Locator::Fixed(values)) {
    return values.copy()
  }
  if self.fixed_ticks is None && self.category is None {
    if self.locator
      is Some(
        @ticker.Locator::NamedLogit(_)
        | @ticker.Locator::NamedAsinh(_)
        | @ticker.Locator::NamedSymLog(_)
        | @ticker.Locator::NamedLog(_)
        | @ticker.Locator::Null(_)
        | @ticker.Locator::NamedLinear(_)
        | @ticker.Locator::Index(_)
        | @ticker.Locator::NamedFixed(_)
        | @ticker.Locator::NamedMaxN(_)
        | @ticker.Locator::NamedAuto(_)
      ) {
      let limits = self.limits.unwrap_or(automatic)
      let previous = self.tick_layout_view
      if previous is None && self.numeric_view_provider is None {
        self.tick_layout_view = Some((limits.lower(), limits.upper()))
      }
      defer {
        self.tick_layout_view = previous
      }
      return self.locator
        .unwrap()
        .tick_values_for_axis(limits.lower(), limits.upper())
    }
  }
  self.tick_values(automatic)
}

///|
pub fn Axis::minor_tick_values_checked(
  self : Axis,
  automatic : @core.Limits,
) -> Array[Double] raise @core.DataError {
  if self.minor_date_locator is None && self.category is None {
    if self.minor_locator is Some(@ticker.MinorLocator::Null(value)) {
      let ticks = value.call()
      if self.remove_minor_overlap {
        // Direct Axis getters still read majors/view; rendering skips Null earlier.
        ignore(self.major_tick_view_checked())
        ignore(self.view_interval_checked())
      }
      return ticks
    }
    let raw_named_fixed = (
        self.scale.is_logit() || self.minor_named_formatter is Some(_)
      ) &&
      self.minor_locator is Some(@ticker.MinorLocator::NamedFixed(_))
    let raw_legacy_fixed = self.minor_named_formatter is Some(_) &&
      self.minor_locator is Some(@ticker.MinorLocator::Fixed(_))
    if self.minor_locator
      is Some(
        @ticker.MinorLocator::NamedAutoMinor(_)
        | @ticker.MinorLocator::NamedLog(_)
        | @ticker.MinorLocator::NamedLogit(_)
        | @ticker.MinorLocator::NamedAsinh(_)
        | @ticker.MinorLocator::NamedSymLog(_)
      ) ||
      raw_named_fixed ||
      raw_legacy_fixed {
      let limits = self.limits.unwrap_or(automatic)
      let previous = self.tick_layout_view
      if previous is None && self.numeric_view_provider is None {
        self.tick_layout_view = Some((limits.lower(), limits.upper()))
      }
      defer {
        self.tick_layout_view = previous
      }
      // Source minor.call reads its own owner first. Axis overlap reads major again.
      let ticks = match self.minor_locator.unwrap() {
        @ticker.MinorLocator::Fixed(values) => values.copy()
        @ticker.MinorLocator::NamedFixed(value) => {
          let locations = value.tick_values(0.0, 0.0)
          locations
          .view(0, 1, Int32::min(100000, locations.length()))
          .to_array()
        }
        @ticker.MinorLocator::NamedAutoMinor(value) => value.call()
        @ticker.MinorLocator::NamedLog(value) => value.call()
        @ticker.MinorLocator::NamedLogit(value) => value.call()
        @ticker.MinorLocator::NamedAsinh(value) => value.call()
        @ticker.MinorLocator::NamedSymLog(value) => value.call()
        _ => []
      }
      if !self.remove_minor_overlap {
        return ticks
      }
      let major = self.major_tick_view_checked().to_array()
      let (lower, upper) = self.view_interval_checked()
      return self.filter_numeric_minor_ticks(ticks, major, lower, upper)
    }
    if self.minor_locator
      is Some(
        @ticker.MinorLocator::NamedLinear(_)
        | @ticker.MinorLocator::Index(_)
        | @ticker.MinorLocator::NamedFixed(_)
        | @ticker.MinorLocator::NamedMaxN(_)
        | @ticker.MinorLocator::NamedAuto(_)
      ) {
      let limits = self.limits.unwrap_or(automatic)
      let previous = self.tick_layout_view
      if previous is None && self.numeric_view_provider is None {
        self.tick_layout_view = Some((limits.lower(), limits.upper()))
      }
      defer {
        self.tick_layout_view = previous
      }
      let major = self.tick_values_checked(automatic)
      let ticks = self.minor_locator
        .unwrap()
        .tick_values_for_axis(major, limits.lower(), limits.upper())
      return if self.date_format is Some(_) {
        self.filter_date_minor_ticks(ticks, major, limits)
      } else {
        ticks
      }
    }
  }
  self.minor_tick_values(automatic)
}

///|
fn Axis::bind_auto_minor_context(
  self : Axis,
  value : @ticker.AutoMinorLocator,
) -> Unit {
  value.bind_scale(() => self.numeric_scale_name())
  value.bind_axis_name(() => if self.tick_horizontal { "x" } else { "y" })
  value.bind_major_ticks(() => self.major_tick_view_checked())
  value.bind_view_interval(() => self.view_interval_checked())
}

///|
fn Axis::numeric_scale_name(self : Axis) -> String {
  match self.scale {
    @scale.Linear => "linear"
    @scale.Log => "log"
    @scale.SymLog(..) => "symlog"
    @scale.Asinh(..) => "asinh"
    @scale.Logit(..) => "logit"
  }
}

///|
/// Obtain majors in source order while preserving borrowed integer storage.
fn Axis::major_tick_view_checked(
  self : Axis,
) -> @ticker.TickValues raise @core.DataError {
  if self.fixed_ticks is Some(values) {
    return @ticker.TickValues::from_array(values.copy())
  }
  if self.category is None && self.date_locator is None {
    match self.locator {
      Some(@ticker.Locator::Fixed(values)) if self.named_formatter is Some(_) ||
        self.minor_named_formatter is Some(_) =>
        return @ticker.TickValues::from_array(values.copy())
      Some(@ticker.Locator::NamedFixed(value)) =>
        return value.tick_values(0.0, 0.0)
      Some(@ticker.Locator::Null(_)) =>
        return @ticker.TickValues::from_array([])
      Some(locator) if locator
        is (@ticker.Locator::NamedLogit(_)
        | @ticker.Locator::NamedAsinh(_)
        | @ticker.Locator::NamedSymLog(_)
        | @ticker.Locator::NamedLog(_)
        | @ticker.Locator::Index(_)
        | @ticker.Locator::NamedMaxN(_)
        | @ticker.Locator::NamedAuto(_)) =>
        return locator.tick_view_for_axis(0.0, 0.0)
      Some(@ticker.Locator::NamedLinear(value)) => {
        let (lower, upper) = self.view_interval_checked()
        return value.tick_values(lower, upper)
      }
      _ => ()
    }
  }
  let (lower, upper) = self.view_interval_checked()
  @ticker.TickValues::from_array(
    self.tick_values_checked(@core.limits(lower, upper)),
  )
}

///|
fn Axis::filter_numeric_minor_ticks(
  self : Axis,
  ticks : Array[Double],
  major : Array[Double],
  lower : Double,
  upper : Double,
) -> Array[Double] {
  let mask = self.numeric_minor_selection_mask(ticks, major, lower, upper)
  let selected : Array[Double] = []
  for index, tick in ticks {
    if mask[index] {
      selected.push(tick)
    }
  }
  selected
}

///|
fn Axis::numeric_minor_selection_mask(
  self : Axis,
  ticks : Array[Double],
  major : Array[Double],
  lower : Double,
  upper : Double,
) -> Array[Bool] {
  let lo = self.minor_overlap_transform(lower)
  let hi = self.minor_overlap_transform(upper)
  let tolerance = Double::abs(hi - lo) * 1.0e-5
  let transformed_major = major.map(value => self.minor_overlap_transform(value))
  ticks.map(value => {
    let transformed = self.minor_overlap_transform(value)
    !transformed_major.any(other => {
      transformed == other ||
      (
        !other.is_nan() &&
        !other.is_inf() &&
        Double::abs(transformed - other) <= tolerance
      )
    })
  })
}

///|
/// Rendering skips each NullLocator tick group before asking for labels or offsets.
pub fn Axis::tick_group_is_null(self : Axis, minor~ : Bool = false) -> Bool {
  if minor {
    self.minor_locator is Some(@ticker.MinorLocator::Null(_))
  } else {
    self.locator is Some(@ticker.Locator::Null(_))
  }
}

///|
// Source LogTransform uses nonpositive="clip" for tick overlap coordinates.
fn Axis::minor_overlap_transform(self : Axis, value : Double) -> Double {
  if self.scale.is_log() && value <= 0.0 {
    -1000.0
  } else {
    self.scale.transform(value)
  }
}
