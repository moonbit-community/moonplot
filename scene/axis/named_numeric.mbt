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
    if self.minor_locator is Some(@ticker.MinorLocator::Index(value)) {
      value.bind_data_interval(provider)
    }
  } else if self.locator is Some(@ticker.Locator::Index(value)) {
    value.bind_data_interval(provider)
  }
}

///|
/// New named numeric locators preserve their direct errors in checked rendering.
pub fn Axis::tick_values_checked(
  self : Axis,
  automatic : @core.Limits,
) -> Array[Double] raise @core.DataError {
  if self.fixed_ticks is None && self.category is None {
    if self.locator
      is Some(
        @ticker.Locator::NamedLinear(_)
        | @ticker.Locator::Index(_)
        | @ticker.Locator::NamedFixed(_)
      ) {
      let limits = self.limits.unwrap_or(automatic)
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
    if self.minor_locator
      is Some(
        @ticker.MinorLocator::NamedLinear(_)
        | @ticker.MinorLocator::Index(_)
        | @ticker.MinorLocator::NamedFixed(_)
      ) {
      let limits = self.limits.unwrap_or(automatic)
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
