///|
// The subsecond interval table used by Matplotlib's AutoDateLocator.
fn microsecond_interval(target : Double) -> Int32 {
  for
    interval in [
      1, 2, 5, 10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000,
      100000, 200000, 500000, 1000000,
    ] {
    if Double::from_int(interval) >= target {
      return interval
    }
  }
  1000000
}

///|
// Source: Matplotlib v3.11.2 dates.MicrosecondLocator and ticker.MultipleLocator.
// The locator first floors the UTC ordinal and scales the fractional day to
// integer microseconds. The requested fixed offset affects date formatting,
// but does not move this UTC grid's phase.
fn microsecond_ticks(
  first : Double,
  last : Double,
  interval : Int32,
) -> Array[Double] {
  microsecond_ticks_unclipped(first, last, Double::from_int(interval)).filter(
    supported_ordinal,
  ) catch {
    _ => []
  }
}

///|
// Python/NumPy divmod snaps its approximate quotient to an integer and gives
// the remainder the positive denominator's sign. floor(value / step) differs.
fn microsecond_divmod(value : Double, step : Double) -> (Double, Double) {
  let mut remainder = value % step
  let mut quotient = (value - remainder) / step
  if remainder != 0.0 {
    if remainder < 0.0 {
      remainder += step
      quotient -= 1.0
    }
  } else {
    remainder = 0.0
  }
  let floor = if quotient != 0.0 {
    let floor = quotient.floor()
    if quotient - floor > 0.5 {
      floor + 1.0
    } else {
      floor
    }
  } else if value.reinterpret_as_uint64() >> 63 != 0UL {
    -0.0
  } else {
    0.0
  }
  (floor, remainder)
}

///|
fn microsecond_multiple_ticks(
  lower : Double,
  upper : Double,
  step : Double,
) -> Array[Double] raise DateError {
  let first = Double::min(lower, upper)
  let last = Double::max(lower, upper)
  let (quotient, remainder) = microsecond_divmod(first, step)
  let aligned = (if Double::abs(remainder / step) < 1.0e-10 {
      quotient
    } else {
      quotient + 1.0
    }) *
    step
  if aligned.is_nan() || aligned.is_inf() {
    raise DateError::InvalidDate(
      message="microsecond grid alignment is not finite",
    )
  }
  let (count, _) = microsecond_divmod(last - aligned + 0.001 * step, step)
  let count = count + 3.0
  if count.is_nan() || count.is_inf() {
    raise DateError::InvalidDate(message="microsecond tick count is not finite")
  }
  let length = Double::max(0.0, Double::min(100000.0, count)).to_int()
  let base = aligned - step
  Array::makei(length, index => base + Double::from_int(index) * step)
}

///|
// Keep origin from the original first endpoint. MultipleLocator sorts only
// after origin subtraction; reversed direct bounds can round differently.
fn microsecond_ticks_unclipped(
  first : Double,
  last : Double,
  interval : Double,
) -> Array[Double] raise DateError {
  let origin = first.floor()
  let lower = (first - origin) * 86_400_000_000.0
  let upper = (last - origin) * 86_400_000_000.0
  microsecond_multiple_ticks(lower, upper, interval).map(value => {
    value / 86_400_000_000.0 + origin
  })
}
