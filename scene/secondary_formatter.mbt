///|
pub fn SecondaryAxis::formatter_axis_binding(
  self : SecondaryAxis,
) -> @ticker.FormatterAxisBinding {
  self.formatter_axis_binding
}

///|
pub fn SecondaryAxis::formatter_warnings(self : SecondaryAxis) -> Array[String] {
  self.formatter_messages.copy()
}

///|
pub fn SecondaryAxis::tick_group_is_null(
  self : SecondaryAxis,
  minor~ : Bool = false,
) -> Bool {
  if minor {
    self.minor_locator is Some(@ticker.MinorLocator::Null(_))
  } else {
    self.locator is Some(@ticker.Locator::Null(_))
  }
}

///|
fn SecondaryAxis::check_named_formatter_install(
  self : SecondaryAxis,
  formatter : @ticker.BaseFormatter,
  minor : Bool,
) -> Unit {
  self.formatter_messages.clear()
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
pub fn SecondaryAxis::set_named_formatter(
  self : SecondaryAxis,
  formatter : @ticker.BaseFormatter,
) -> Unit {
  self.check_named_formatter_install(formatter, false)
  self.named_formatter = Some(formatter)
  self.formatter = None
  formatter.set_axis(Some(self.formatter_axis_binding))
}

///|
pub fn SecondaryAxis::named_formatter(
  self : SecondaryAxis,
) -> @ticker.BaseFormatter? {
  self.named_formatter
}

///|
pub fn SecondaryAxis::set_minor_named_formatter(
  self : SecondaryAxis,
  formatter : @ticker.BaseFormatter,
) -> Unit {
  self.check_named_formatter_install(formatter, true)
  self.minor_named_formatter = Some(formatter)
  formatter.set_axis(Some(self.formatter_axis_binding))
}

///|
pub fn SecondaryAxis::minor_named_formatter(
  self : SecondaryAxis,
) -> @ticker.BaseFormatter? {
  self.minor_named_formatter
}

///|
pub fn SecondaryAxis::clear_named_formatter(self : SecondaryAxis) -> Unit {
  self.named_formatter = None
}

///|
pub fn SecondaryAxis::clear_minor_named_formatter(self : SecondaryAxis) -> Unit {
  self.minor_named_formatter = None
}

///|
pub fn SecondaryAxis::formatter_tick_locations_checked(
  self : SecondaryAxis,
  minor~ : Bool = false,
) -> @ticker.FormatterLocations raise @core.DataError {
  let active = if minor {
    self.minor_named_formatter
  } else {
    self.named_formatter
  }
  if active is None {
    return @ticker.FormatterLocations::Sequence(
      if minor {
        self.minor_tick_values_checked()
      } else {
        self.tick_values_checked()
      },
    )
  }
  let view = if minor {
    self.raw_formatter_minor_view_checked()
  } else if self.fixed_ticks is Some(values) {
    @ticker.TickValues::from_array(values)
  } else if self.locator is Some(@ticker.Locator::Fixed(values)) {
    @ticker.TickValues::from_array(values)
  } else if self.locator is Some(@ticker.Locator::Multiple(locator)) {
    let (lower, upper) = self.numeric_view_interval()
    @ticker.TickValues::from_array(locator.tick_values(lower, upper))
  } else {
    self.major_tick_view_checked()
  }
  if minor && self.remove_minor_overlap {
    // A NumPy boolean selection owns a fresh array of the ORIGINAL dtype.
    // Converting to Double before constructing that array loses Int64 bits and
    // changes the scalar __format__/repr used by the named string classes.
    let major = self.major_tick_view_checked().to_array()
    let (lower, upper) = self.numeric_view_interval()
    let tolerance = Double::abs(
        self.numeric_transform(upper) - self.numeric_transform(lower),
      ) *
      1.0e-5
    let transformed_major = major.map(value => self.numeric_transform(value))
    let mask = view
      .to_array()
      .map(value => {
        let transformed = self.numeric_transform(value)
        !transformed_major.any(other => {
          transformed == other ||
          (
            !other.is_nan() &&
            !other.is_inf() &&
            Double::abs(transformed - other) <= tolerance
          )
        })
      })
    return @ticker.FormatterLocations::NdArray(view.select_mask(mask))
  }
  @ticker.FormatterLocations::NdArray(view)
}

///|
fn SecondaryAxis::raw_formatter_minor_view_checked(
  self : SecondaryAxis,
) -> @ticker.TickValues raise @core.DataError {
  let values = match self.minor_locator {
    None => return @ticker.TickValues::from_array([])
    Some(@ticker.MinorLocator::NamedFixed(locator)) =>
      return locator.tick_values(0.0, 0.0)
    Some(@ticker.MinorLocator::Fixed(values)) =>
      return @ticker.TickValues::from_array(values)
    Some(@ticker.MinorLocator::NamedLinear(locator)) => {
      let (lower, upper) = self.numeric_view_interval()
      return locator.tick_values(lower, upper)
    }
    Some(@ticker.MinorLocator::Multiple(locator)) => {
      let (lower, upper) = self.numeric_view_interval()
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
    Some(_) => self.minor_tick_values_checked()
  }
  @ticker.TickValues::from_array(values)
}

///|
pub fn SecondaryAxis::tick_labels_checked(
  self : SecondaryAxis,
  values : Array[Double],
  view? : @core.Limits,
) -> Array[String] raise @core.DataError {
  match self.named_formatter {
    Some(formatter) => formatter.format_ticks(values)
    None =>
      match self.formatter {
        Some(formatter) => formatter.format_values_with_view(values, view)
        None => values.map(value => value.to_string())
      }
  }
}

///|
pub fn SecondaryAxis::minor_tick_labels_checked(
  self : SecondaryAxis,
  values : Array[Double],
  view? : @core.Limits,
) -> Array[String] raise @core.DataError {
  ignore(view)
  match self.minor_named_formatter {
    Some(formatter) => formatter.format_ticks(values)
    None => Array::make(values.length(), "")
  }
}

///|
pub fn SecondaryAxis::formatter_offset_label_checked(
  self : SecondaryAxis,
  values : Array[Double],
  view? : @core.Limits,
) -> String raise @core.DataError {
  match self.named_formatter {
    Some(formatter) => formatter.get_offset_checked()
    None =>
      match self.formatter {
        Some(formatter) => formatter.offset_label_with_view(values, view)
        None => ""
      }
  }
}
