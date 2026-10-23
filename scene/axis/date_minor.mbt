///|
/// Set a calendar minor locator, preserving the independent major formatter.
pub fn Axis::set_minor_date_locator(
  self : Axis,
  locator : @date.DateLocator,
) -> Unit raise @core.DataError {
  if self.date_format is None {
    self.set_date()
  }
  self.minor_date_locator = Some(
    match self.date_timezone {
      Some(zone) if !self.date_timezone_is_default =>
        locator.with_timezone(zone)
      _ => locator.copy()
    },
  )
  self.tickers.minor_locator = None
}

///|
pub fn Axis::minor_date_locator(self : Axis) -> @date.DateLocator? {
  self.minor_date_locator.map(value => value.copy())
}

///|
/// Install a copied formatter for minor dates. Its initial locator is replaced
/// by the actual minor unit whenever labels are requested.
pub fn Axis::set_minor_date_formatter(
  self : Axis,
  formatter : @date.DateFormatter,
) -> Unit raise @core.DataError {
  if self.date_format is None {
    self.set_date()
  }
  self.minor_date_formatter = Some(formatter.copy())
}

///|
pub fn Axis::minor_date_formatter(self : Axis) -> @date.DateFormatter? {
  self.minor_date_formatter.map(formatter => {
    formatter.with_locator_unit(self.date_formatter_unit([], None, true))
  })
}

///|
pub fn Axis::clear_minor_date_formatter(self : Axis) -> Unit {
  self.minor_date_formatter = None
}

///|
/// Control removal of minor locations close to major ticks. The default
/// tolerance is 1e-5 of the date view span, matching upstream linear date axes.
pub fn Axis::set_minor_overlap_removal(self : Axis, enabled : Bool) -> Unit {
  self.remove_minor_overlap = enabled
}

///|
pub fn Axis::minor_overlap_removal(self : Axis) -> Bool {
  self.remove_minor_overlap
}

///|
/// Format minor dates for a viewport. Without an explicit minor formatter,
/// labels remain empty, matching the default NullFormatter behavior.
pub fn Axis::minor_tick_labels(
  self : Axis,
  values : Array[Double],
  view? : @core.Limits,
) -> Array[String] {
  match self.minor_date_formatter {
    None => Array::make(values.length(), "")
    Some(formatter) => {
      let effective_view = match view {
        Some(_) => view
        None => self.current_view_limits()
      }
      let inverted = effective_view
        .map(limits => limits.lower() > limits.upper())
        .unwrap_or(self.inverted)
      let reversed = values.length() > 1 &&
        values[0] > values[values.length() - 1]
      let ticks = if reversed { values.rev() } else { values }
      let labels = formatter
        .with_locator_unit(
          self.date_formatter_unit(values, effective_view, true),
        )
        .format_values(ticks, inverted~)
      if reversed {
        labels.rev()
      } else {
        labels
      }
    }
  }
}

///|
fn Axis::filter_date_minor_ticks(
  self : Axis,
  ticks : Array[Double],
  major : Array[Double],
  limits : @core.Limits,
) -> Array[Double] {
  if !self.remove_minor_overlap {
    return ticks
  }
  let tolerance = Double::abs(limits.upper() - limits.lower()) * 1.0e-5
  ticks.filter(value => {
    !major.any(other => Double::abs(value - other) <= tolerance)
  })
}
