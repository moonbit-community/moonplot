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
/// Share numeric ticker slots without changing geometry or object ownership.
pub fn Axis::share_numeric_tickers(self : Axis, source : Axis) -> Unit {
  self.tickers = source.tickers
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
  let lower = -1.0 / 0.0
  let upper = 1.0 / 0.0
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
