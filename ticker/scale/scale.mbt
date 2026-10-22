///|
/// Coordinate scale used by an axis.
pub(all) enum Scale {
  Linear
  Log
  SymLog(linthresh~ : Double, linscale~ : Double, base~ : Double)
}

///|
/// Return the ordinary linear scale.
pub fn linear_scale() -> Scale {
  Scale::Linear
}

///|
/// Return a base-ten logarithmic scale.
pub fn log_scale() -> Scale {
  Scale::Log
}

///|
/// Construct a symmetric logarithmic scale around zero.
pub fn symlog_scale(
  linthresh~ : Double = 1.0,
  linscale~ : Double = 1.0,
  base~ : Double = 10.0,
) -> Scale raise @core.DataError {
  if linthresh <= 0.0 || linthresh.is_nan() || linthresh.is_inf() {
    raise @core.DataError::InvalidTicks(
      message="symlog linthresh must be positive and finite",
    )
  }
  if linscale <= 0.0 || linscale.is_nan() || linscale.is_inf() {
    raise @core.DataError::InvalidTicks(
      message="symlog linscale must be positive and finite",
    )
  }
  if base <= 1.0 || base.is_nan() || base.is_inf() {
    raise @core.DataError::InvalidTicks(
      message="symlog base must be finite and greater than one",
    )
  }
  Scale::SymLog(linthresh~, linscale~, base~)
}

///|
/// Whether this scale uses base-ten logarithmic coordinates.
pub fn Scale::is_log(self : Scale) -> Bool {
  self is Log
}

///|
/// Whether this scale applies a non-linear coordinate transform.
pub fn Scale::is_nonlinear(self : Scale) -> Bool {
  match self {
    Linear => false
    Log | SymLog(..) => true
  }
}

///|
/// Whether this scale is symmetric logarithmic.
pub fn Scale::is_symlog(self : Scale) -> Bool {
  self is SymLog(..)
}

///|
/// Return the symmetric-log linear threshold, if configured.
pub fn Scale::symlog_linthresh(self : Scale) -> Double? {
  match self {
    SymLog(linthresh~, ..) => Some(linthresh)
    _ => None
  }
}

///|
/// Return the symmetric-log base, if configured.
pub fn Scale::symlog_base(self : Scale) -> Double? {
  match self {
    SymLog(base~, ..) => Some(base)
    _ => None
  }
}

///|
fn symlog_linscale_adjusted(linscale : Double, base : Double) -> Double {
  linscale / (1.0 - 1.0 / base)
}

///|
fn symlog_transform_value(
  value : Double,
  linthresh : Double,
  linscale : Double,
  base : Double,
) -> Double {
  let adjusted = symlog_linscale_adjusted(linscale, base)
  let magnitude = Double::abs(value)
  if magnitude <= linthresh {
    value * adjusted
  } else {
    let sign = if value == 0.0 { 0.0 } else if value < 0.0 { -1.0 } else { 1.0 }
    let log_base = @math.ln(base)
    sign *
    linthresh *
    (adjusted - @math.ln(linthresh) / log_base + @math.ln(magnitude) / log_base)
  }
}

///|
fn symlog_inverse_value(
  value : Double,
  linthresh : Double,
  linscale : Double,
  base : Double,
) -> Double {
  let adjusted = symlog_linscale_adjusted(linscale, base)
  let linear_limit = symlog_transform_value(
    linthresh, linthresh, linscale, base,
  )
  let magnitude = Double::abs(value)
  if magnitude <= linear_limit {
    value / adjusted
  } else {
    let sign = if value == 0.0 { 0.0 } else if value < 0.0 { -1.0 } else { 1.0 }
    sign *
    linthresh *
    @math.exp((magnitude / linthresh - adjusted) * @math.ln(base))
  }
}

///|
/// Check whether a data value can be represented on this scale.
pub fn Scale::is_valid(self : Scale, value : Double) -> Bool {
  match self {
    Linear => !value.is_nan() && !value.is_inf()
    Log => value > 0.0 && !value.is_nan() && !value.is_inf()
    SymLog(..) => !value.is_nan() && !value.is_inf()
  }
}

///|
/// Transform one data value into display-space scale coordinates.
pub fn Scale::transform(self : Scale, value : Double) -> Double {
  match self {
    Linear => value
    Log => @math.log10(value)
    SymLog(linthresh~, linscale~, base~) =>
      symlog_transform_value(value, linthresh, linscale, base)
  }
}

///|
/// Convert display-space scale coordinates back to data values.
pub fn Scale::inverse(self : Scale, value : Double) -> Double {
  match self {
    Linear => value
    Log => @math.pow(10.0, value)
    SymLog(linthresh~, linscale~, base~) =>
      symlog_inverse_value(value, linthresh, linscale, base)
  }
}

///|
fn symlog_ticks(
  limits : @core.Limits,
  linthresh : Double,
  base : Double,
) -> Array[Double] {
  let lower = Double::min(limits.lower(), limits.upper())
  let upper = Double::max(limits.lower(), limits.upper())
  let values : Array[Double] = []
  if lower <= 0.0 && upper >= 0.0 {
    values.push(0.0)
  }
  if lower <= linthresh && upper >= linthresh {
    values.push(linthresh)
  }
  if lower <= -linthresh && upper >= -linthresh {
    values.push(-linthresh)
  }
  let positive_upper = Double::max(upper, linthresh)
  let positive_lower = Double::max(linthresh, 0.0)
  if positive_upper > positive_lower {
    let first = (@math.log10(positive_lower) / @math.log10(base))
      .floor()
      .to_int()
    let last = (@math.log10(positive_upper) / @math.log10(base)).ceil().to_int()
    for exponent in first..<=last {
      let value = @math.pow(base, Double::from_int(exponent))
      if value >= lower && value <= upper {
        values.push(value)
      }
      if -value >= lower && -value <= upper {
        values.push(-value)
      }
    }
  }
  values.sort()
  if limits.lower() <= limits.upper() {
    values
  } else {
    values.rev()
  }
}

///|
fn linear_ticks(limits : @core.Limits, count : Int32) -> Array[Double] {
  if limits.lower() == limits.upper() {
    return [limits.lower()]
  }
  let actual = if count < 2 { 2 } else { count }
  let step = (limits.upper() - limits.lower()) / Double::from_int(actual - 1)
  let values = Array(capacity=actual)
  for i in 0..<actual {
    values.push(limits.lower() + Double::from_int(i) * step)
  }
  values
}

///|
fn log_ticks(limits : @core.Limits, count : Int32) -> Array[Double] {
  ignore(count)
  let lower = Double::min(limits.lower(), limits.upper())
  let upper = Double::max(limits.lower(), limits.upper())
  if lower <= 0.0 ||
    upper <= 0.0 ||
    lower.is_nan() ||
    upper.is_nan() ||
    lower.is_inf() ||
    upper.is_inf() {
    return []
  }
  if lower == upper {
    return [lower]
  }
  let first = @math.log10(lower).floor().to_int()
  let last = @math.log10(upper).ceil().to_int()
  let decades = last - first
  let values = Array(
    capacity=if decades <= 2 { (decades + 1) * 9 } else { decades + 1 },
  )
  if decades <= 2 {
    for exponent in first..<=last {
      let base = @math.pow(10.0, Double::from_int(exponent))
      for mantissa in 1..<=9 {
        let value = base * Double::from_int(mantissa)
        if value >= lower && value <= upper {
          values.push(value)
        }
      }
    }
  } else {
    for exponent in first..<=last {
      let value = @math.pow(10.0, Double::from_int(exponent))
      if value >= lower && value <= upper {
        values.push(value)
      }
    }
  }
  if limits.lower() <= limits.upper() {
    values
  } else {
    values.rev()
  }
}

///|
/// Generate deterministic major ticks for this scale.
pub fn Scale::tick_values(
  self : Scale,
  limits : @core.Limits,
  count~ : Int32 = 6,
) -> Array[Double] {
  match self {
    Linear => linear_ticks(limits, count)
    Log => log_ticks(limits, count)
    SymLog(linthresh~, linscale~, base~) => {
      ignore(linscale)
      symlog_ticks(limits, linthresh, base)
    }
  }
}

///|
/// Format one scale tick using a stable decimal representation.
pub fn Scale::format_tick(self : Scale, value : Double) -> String {
  ignore(self)
  Double::to_string(value)
}
