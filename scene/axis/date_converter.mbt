///|
/// Return the copied converter captured when this axis entered date mode.
pub fn Axis::date_converter(self : Axis) -> @date.DateConverter? {
  self.date_converter.map(converter => converter.copy())
}

///|
/// Check converter defaults against this axis' explicit unit without changing
/// the axis. Shared-axis callers use this to validate the entire group first.
pub fn Axis::validate_date_converter(
  self : Axis,
  converter? : @date.DateConverter,
) -> Unit raise @core.DataError {
  if self.scale.is_nonlinear() || self.category is Some(_) {
    raise @core.DataError::InvalidTicks(
      message="date converter requires a linear non-category axis",
    )
  }
  ignore(
    self.date_converter_info(
      converter.unwrap_or(
        self.date_converter.unwrap_or(@date.default_date_converter()),
      ),
    ),
  )
}

///|
/// Replace the default date conversion/formatting configuration. Explicit
/// locators and fixed ticks/labels remain installed. Validation is atomic.
pub fn Axis::set_date_converter(
  self : Axis,
  converter : @date.DateConverter,
) -> Unit raise @core.DataError {
  // Prepare the complete configuration before changing the axis.
  let info = self.date_converter_info(converter)
  self.set_date_format("")
  self.date_converter = Some(converter.copy())
  self.automatic_date_locator = Some(self.make_default_date_locator(info))
  if self.date_timezone_is_default {
    self.date_timezone = info.major_locator().timezone()
    self.date_offset_minutes = info.major_locator().offset_minutes()
  }
  self.date_formatter = Some(info.major_formatter())
  self.date_formatter_default = true
  self.sync_default_date_formatter()
}

///|
fn Axis::explicit_date_timezone(self : Axis) -> @date.DateTimeZone {
  self.date_timezone.unwrap_or(
    try! @date.fixed_timezone(self.date_offset_minutes),
  )
}

///|
fn Axis::date_converter_info(
  self : Axis,
  converter : @date.DateConverter,
) -> @date.DateAxisInfo raise @core.DataError {
  let unit = if self.date_timezone_is_default {
    None
  } else {
    Some(self.explicit_date_timezone())
  }
  self.checked_date_axisinfo(converter, unit?)
}

///|
fn Axis::checked_date_axisinfo(
  _self : Axis,
  converter : @date.DateConverter,
  unit? : @date.DateTimeZone,
) -> @date.DateAxisInfo raise @core.DataError {
  converter.axisinfo(unit?) catch {
    @date.DateError::InvalidDate(message~)
    | @date.DateError::InvalidFormat(message~) =>
      raise @core.DataError::InvalidTicks(message~)
  }
}
