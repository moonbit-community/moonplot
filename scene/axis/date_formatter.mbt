///|
/// Set a copied date formatter while preserving locators and fixed ticks/labels.
/// The formatter's timezone affects labels independently of the tick locator.
/// Use Axis::set_date_timezone/offset to update both labels and tick positions.
pub fn Axis::set_date_formatter(
  self : Axis,
  formatter : @date.DateFormatter,
) -> Unit raise @core.DataError {
  self.set_date_format(formatter.format())
  self.date_formatter = Some(formatter.copy())
  self.date_formatter_default = false
}

///|
/// Return a copy of the configured date formatter, if any.
pub fn Axis::date_formatter(self : Axis) -> @date.DateFormatter? {
  self.date_formatter.map(formatter => {
    formatter.with_locator_unit(self.date_formatter_unit([], None, false))
  })
}

///|
fn Axis::sync_default_date_formatter(self : Axis) -> Unit {
  if !self.date_formatter_default || self.date_timezone_is_default {
    return
  }
  self.date_formatter = self.date_formatter.map(formatter => {
    match self.date_timezone {
      Some(timezone) => formatter.with_timezone(timezone)
      None => try! formatter.with_offset(self.date_offset_minutes)
    }
  })
}

///|
fn Axis::date_formatter_unit(
  self : Axis,
  values : Array[Double],
  view : @core.Limits?,
  minor : Bool,
) -> Double {
  let limits = match view {
    Some(_) => view
    None => self.current_view_limits()
  }
  let limits = limits.map(bounds => {
    self.date_nonsingular_bounds(bounds.lower(), bounds.upper())
  })
  let concrete = if minor { self.minor_date_locator } else { self.date_locator }
  if minor || (self.fixed_ticks is None && self.locator is None) {
    if concrete is Some(locator) {
      if locator.automatic_locator() is Some(auto) {
        match limits {
          Some(bounds) =>
            ignore(auto.get_locator_for_range(bounds.lower(), bounds.upper())) catch {
              _ => ()
            }
          None => ()
        }
      }
      return locator.unit_scale()
    }
  }
  if minor || self.fixed_ticks is Some(_) || self.locator is Some(_) {
    return 1.0
  }
  if self.automatic_date_locator is Some(auto) {
    match limits {
      Some(bounds) =>
        ignore(auto.get_locator_for_range(bounds.lower(), bounds.upper())) catch {
          _ => ()
        }
      None =>
        if values.length() >= 2 {
          ignore(
            auto.get_locator_for_range(values[0], values[values.length() - 1]),
          ) catch {
            _ => ()
          }
        }
    }
    return auto.unit_scale()
  }
  1.0
}

///|
// Matplotlib's date locators supply ascending ticks even on an inverted axis.
// This port returns reversed generated ticks, so normalize just that path for
// the batch formatter and restore label order afterwards. Fixed ticks retain
// their explicit caller order, as with upstream FixedLocator.
fn Axis::date_formatter_values(
  self : Axis,
  values : Array[Double],
  view : @core.Limits?,
) -> (Array[Double], Bool, Bool) {
  let effective_view = match view {
    Some(_) => view
    None => self.limits
  }
  let inverted = match effective_view {
    Some(limits) => limits.lower() > limits.upper()
    None => self.inverted
  }
  let reversed = self.fixed_ticks is None &&
    values.length() > 1 &&
    values[0] > values[values.length() - 1]
  (if reversed { values.rev() } else { values }, inverted, reversed)
}
