///|
/// Stable typed identity used by explicitly installed named formatters.
pub fn Axis::formatter_axis_binding(
  self : Axis,
) -> @ticker.FormatterAxisBinding {
  self.formatter_axis_binding
}

///|
pub fn Axis::formatter_warnings(self : Axis) -> Array[String] {
  self.formatter_messages.copy()
}

///|
fn Axis::check_named_formatter_install(
  self : Axis,
  formatter : @ticker.BaseFormatter,
  minor : Bool,
) -> Unit raise @core.DataError {
  self.formatter_messages.clear()
  if self.date_format is Some(_) || self.category is Some(_) {
    raise @core.DataError::InvalidTicks(
      message="numeric formatter cannot be combined with date or category data",
    )
  }
  let fixed_locator = if minor {
    self.minor_locator
    is Some(
      @ticker.MinorLocator::NamedFixed(_)
      | @ticker.MinorLocator::Fixed(_)
    )
  } else {
    self.fixed_ticks is Some(_) ||
    self.locator
    is Some(@ticker.Locator::NamedFixed(_) | @ticker.Locator::Fixed(_))
  }
  if formatter.fixed_formatter() is Some(fixed) &&
    fixed.seq().length() > 0 &&
    !fixed_locator {
    self.formatter_messages.push(
      "FixedFormatter should only be used together with FixedLocator",
    )
  }
}

///|
/// Install a live checked formatter independently of the legacy pure helpers.
pub fn Axis::set_named_formatter(
  self : Axis,
  formatter : @ticker.BaseFormatter,
) -> Unit raise @core.DataError {
  self.check_named_formatter_install(formatter, false)
  self.named_formatter = Some(formatter)
  self.formatter = None
  self.fixed_labels = None
  self.bind_formatter_axis()
}

///|
pub fn Axis::named_formatter(self : Axis) -> @ticker.BaseFormatter? {
  self.named_formatter
}

///|
pub fn Axis::set_minor_named_formatter(
  self : Axis,
  formatter : @ticker.BaseFormatter,
) -> Unit raise @core.DataError {
  self.check_named_formatter_install(formatter, true)
  self.minor_named_formatter = Some(formatter)
  self.bind_formatter_axis(minor=true)
}

///|
pub fn Axis::minor_named_formatter(self : Axis) -> @ticker.BaseFormatter? {
  self.minor_named_formatter
}

///|
pub fn Axis::clear_named_formatter(self : Axis) -> Unit {
  self.named_formatter = None
}

///|
pub fn Axis::clear_minor_named_formatter(self : Axis) -> Unit {
  self.minor_named_formatter = None
}

///|
/// Rebind installed handles after shared-axis installation or removal.
pub fn Axis::bind_formatter_axis(self : Axis, minor~ : Bool = false) -> Unit {
  let formatter = if minor {
    self.minor_named_formatter
  } else {
    self.named_formatter
  }
  if formatter is Some(formatter) {
    formatter.set_axis(Some(self.formatter_axis_binding))
  }
}

///|
/// Keep a locator's borrowed numeric view until the corresponding batch ends.
pub fn Axis::formatter_tick_locations_checked(
  self : Axis,
  automatic : @core.Limits,
  minor~ : Bool = false,
) -> @ticker.FormatterLocations raise @core.DataError {
  let active = if minor {
    self.minor_named_formatter
  } else {
    self.named_formatter
  }
  if active is None || self.date_format is Some(_) || self.category is Some(_) {
    return @ticker.FormatterLocations::Sequence(
      if minor {
        self.minor_tick_values_checked(automatic)
      } else {
        self.tick_values_checked(automatic)
      },
    )
  }
  let limits = self.limits.unwrap_or(automatic)
  let previous = self.tick_layout_view
  if previous is None && self.numeric_view_provider is None {
    self.tick_layout_view = Some((limits.lower(), limits.upper()))
  }
  defer {
    self.tick_layout_view = previous
  }
  let view = if minor {
    self.raw_formatter_minor_view_checked(limits)
  } else if self.fixed_ticks is Some(values) {
    @ticker.TickValues::from_array(values)
  } else if self.locator is Some(@ticker.Locator::Fixed(values)) {
    @ticker.TickValues::from_array(values)
  } else if self.locator is Some(@ticker.Locator::Multiple(locator)) {
    let (lower, upper) = self.view_interval_checked()
    @ticker.TickValues::from_array(locator.tick_values(lower, upper))
  } else {
    self.major_tick_view_checked()
  }
  if minor && self.remove_minor_overlap {
    let major = self.major_tick_view_checked().to_array()
    let (lower, upper) = self.view_interval_checked()
    let filtered = self.filter_numeric_minor_ticks(
      view.to_array(),
      major,
      lower,
      upper,
    )
    return @ticker.FormatterLocations::NdArray(
      @ticker.TickValues::from_array(filtered),
    )
  }
  @ticker.FormatterLocations::NdArray(view)
}

///|
fn Axis::raw_formatter_minor_view_checked(
  self : Axis,
  limits : @core.Limits,
) -> @ticker.TickValues raise @core.DataError {
  let values = match self.minor_locator {
    None => return @ticker.TickValues::from_array([])
    Some(@ticker.MinorLocator::NamedFixed(locator)) =>
      return locator.tick_values(0.0, 0.0)
    Some(@ticker.MinorLocator::Fixed(values)) =>
      return @ticker.TickValues::from_array(values)
    Some(@ticker.MinorLocator::NamedLinear(locator)) =>
      return locator.tick_values(limits.lower(), limits.upper())
    Some(@ticker.MinorLocator::Multiple(locator)) => {
      let (lower, upper) = self.view_interval_checked()
      locator.tick_values(lower, upper)
    }
    Some(@ticker.MinorLocator::NamedLogit(locator)) => locator.call()
    Some(@ticker.MinorLocator::NamedAsinh(locator)) => locator.call()
    Some(@ticker.MinorLocator::NamedSymLog(locator)) => locator.call()
    Some(@ticker.MinorLocator::NamedLog(locator)) => locator.call()
    Some(@ticker.MinorLocator::NamedAutoMinor(locator)) => locator.call()
    Some(@ticker.MinorLocator::Null(locator)) => locator.call()
    Some(@ticker.MinorLocator::Index(locator)) => locator.call()
    Some(@ticker.MinorLocator::NamedMaxN(locator)) => locator.call()
    Some(@ticker.MinorLocator::NamedAuto(locator)) => locator.call()
    Some(_) => self.minor_tick_values_checked(limits)
  }
  @ticker.TickValues::from_array(values)
}

///|
pub fn Axis::tick_labels_checked(
  self : Axis,
  values : Array[Double],
  view? : @core.Limits,
) -> Array[String] raise @core.DataError {
  if self.date_format is None &&
    self.category is None &&
    self.named_formatter is Some(formatter) {
    return formatter.format_ticks(values)
  }
  self.tick_labels_with_view(values, view)
}

///|
pub fn Axis::minor_tick_labels_checked(
  self : Axis,
  values : Array[Double],
  view? : @core.Limits,
) -> Array[String] raise @core.DataError {
  if self.date_format is None &&
    self.category is None &&
    self.minor_named_formatter is Some(formatter) {
    return formatter.format_ticks(values)
  }
  match view {
    Some(view) => self.minor_tick_labels(values, view~)
    None => self.minor_tick_labels(values)
  }
}

///|
/// Read the live major offset after its batch, without formatting a second time.
pub fn Axis::formatter_offset_label_checked(
  self : Axis,
  values : Array[Double],
  view? : @core.Limits,
) -> String {
  if self.date_format is None &&
    self.category is None &&
    self.named_formatter is Some(formatter) {
    return formatter.get_offset()
  }
  self.formatter_offset_label_with_view(values, view)
}
