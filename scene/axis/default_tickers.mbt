///|
// Numeric ticker state is shared independently from an Axis's geometry/context.
priv struct AxisNumericTickers {
  mut locator : @ticker.Locator?
  mut minor_locator : @ticker.MinorLocator?
  mut named_formatter : @ticker.BaseFormatter?
  mut minor_named_formatter : @ticker.BaseFormatter?
  mut formatter : @ticker.Formatter?
  mut fixed_ticks : Array[Double]?
  mut fixed_labels : Array[String]?
  mut major_locator_default : Bool
  mut minor_locator_default : Bool
  mut major_formatter_default : Bool
  mut minor_formatter_default : Bool
}

///|
fn AxisNumericTickers::new() -> AxisNumericTickers {
  {
    locator: None,
    minor_locator: None,
    named_formatter: None,
    minor_named_formatter: None,
    formatter: None,
    fixed_ticks: None,
    fixed_labels: None,
    major_locator_default: true,
    minor_locator_default: true,
    major_formatter_default: true,
    minor_formatter_default: true,
  }
}

///|
// Converter metadata can outlive a later numeric default installation. Source
// Axis queries use the installed ticker objects, independently from that metadata.
fn Axis::numeric_tickers_active(self : Axis) -> Bool {
  (self.date_format is None && self.category is None) ||
  self.tickers.named_formatter is Some(_) ||
  self.tickers.minor_named_formatter is Some(_)
}

///|
fn Axis::category_for_ticks(self : Axis) -> @category.CategoryAxis? {
  if self.numeric_tickers_active() {
    None
  } else {
    self.category
  }
}

///|
fn Axis::date_format_for_ticks(self : Axis) -> String? {
  if self.numeric_tickers_active() {
    None
  } else {
    self.date_format
  }
}

///|
/// Share numeric ticker slots without changing geometry or object ownership.
pub fn Axis::share_numeric_tickers(self : Axis, source : Axis) -> Unit {
  self.tickers = source.tickers
}

///|
/// Inherit geometry without reinstalling tickers, as shared-axis linking does.
pub fn Axis::inherit_scale_from(self : Axis, source : Axis) -> Unit {
  self.scale = source.scale
}

///|
pub fn Axis::is_default_locator(self : Axis, minor~ : Bool = false) -> Bool {
  if minor {
    self.tickers.minor_locator_default
  } else {
    self.tickers.major_locator_default
  }
}

///|
pub fn Axis::is_default_formatter(self : Axis, minor~ : Bool = false) -> Bool {
  if minor {
    self.tickers.minor_formatter_default
  } else {
    self.tickers.major_formatter_default
  }
}

///|
// Called only after the complete per-scale installation succeeds.
fn Axis::mark_scale_defaults(self : Axis) -> Unit {
  self.tickers.major_locator_default = true
  self.tickers.minor_locator_default = true
  self.tickers.major_formatter_default = true
  self.tickers.minor_formatter_default = true
}

///|
/// Query the current major locator's nonsingular range for empty data.
pub fn Axis::locator_default_limits(
  self : Axis,
) -> (Double, Double) raise @core.DataError {
  self.locator_nonsingular(-1.0 / 0.0, 1.0 / 0.0)
}

///|
fn Axis::locator_nonsingular(
  self : Axis,
  lower : Double,
  upper : Double,
) -> (Double, Double) raise @core.DataError {
  match self.tickers.locator {
    Some(@ticker.Locator::NamedLogit(value)) => value.nonsingular(lower, upper)
    Some(@ticker.Locator::NamedAsinh(value)) => value.nonsingular(lower, upper)
    Some(@ticker.Locator::NamedSymLog(value)) => value.nonsingular(lower, upper)
    Some(@ticker.Locator::NamedLog(value)) => value.nonsingular(lower, upper)
    Some(@ticker.Locator::NamedMaxN(value)) => value.nonsingular(lower, upper)
    Some(@ticker.Locator::NamedAuto(value)) => value.nonsingular(lower, upper)
    Some(@ticker.Locator::NamedLinear(value)) => value.nonsingular(lower, upper)
    Some(@ticker.Locator::Index(value)) => value.nonsingular(lower, upper)
    Some(@ticker.Locator::NamedFixed(value)) => value.nonsingular(lower, upper)
    Some(@ticker.Locator::Multiple(value)) => value.nonsingular(lower, upper)
    Some(@ticker.Locator::Null(value)) => value.nonsingular(lower, upper)
    _ => @ticker.NullLocator::new().nonsingular(lower, upper)
  }
}

///|
/// Finalize a numeric view after a linear lifecycle reset.
/// The outer Scene operation controls sibling propagation and target inheritance.
pub fn Axis::set_cleared_view_limits(
  self : Axis,
  lower : Double,
  upper : Double,
  automatic~ : Bool,
) -> Unit raise @core.DataError {
  if self.scale.is_nonlinear() {
    raise @core.DataError::InvalidTicks(
      message="clear view finalization requires linear geometry",
    )
  }
  if !@core.limits(lower, upper).is_finite() {
    raise @core.DataError::NonFiniteLimit(axis="axis")
  }
  let reversed = lower > upper
  let (first, last) = self.locator_nonsingular(lower, upper)
  // Source Axis.limit_range_for_scale reads own minpos even for LinearScale.
  let (first, last) = self.scale.limit_range_for_scale(
    first,
    last,
    self.get_minpos(),
  )
  let low = Double::min(first, last)
  let high = Double::max(first, last)
  let view = if reversed {
    @core.limits(high, low)
  } else {
    @core.limits(low, high)
  }
  if automatic {
    self.limits = None
    self.auto_view = Some(view)
  } else {
    self.limits = Some(view)
    self.auto_view = None
  }
  self.inverted = reversed
  self.stored_view = view
  self.autoscale_enabled = automatic
  self.autoscale_pending = false
  if self.tick_layout_view is Some(_) {
    self.tick_layout_view = Some((view.lower(), view.upper()))
  }
}
