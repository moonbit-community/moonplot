///|
test "automatic locator defaults and per-frequency maxima follow source tables" {
  let locator = @date.AutoDateLocator::new()
  assert_eq(locator.maxticks(), [
    (@date.Year, 11),
    (@date.Month, 12),
    (@date.Day, 11),
    (@date.Hour, 12),
    (@date.Minute, 11),
    (@date.Second, 11),
    (@date.Microsecond, 8),
  ])
  assert_eq(locator.intervals(@date.Day), [1, 2, 4, 7, 14])
  let unaligned = @date.AutoDateLocator::new(interval_multiples=false)
  assert_eq(unaligned.intervals(@date.Day), [1, 2, 3, 7, 14, 21])
  assert_eq(unaligned.with_interval_multiples(true).intervals(@date.Day), [
    1, 2, 3, 7, 14, 21,
  ])
  let partial = locator.with_maxticks(@date.ByFrequency([(@date.Month, 5)]))
  assert_eq(partial.max_ticks(@date.Month), 5)
  assert_eq(partial.max_ticks(@date.Hour), 12)
  assert_eq(locator.max_ticks(@date.Month), 12)
  assert_eq(locator.with_maxticks(@date.All(1)).max_ticks(@date.Second), 1)
}

///|
test "automatic locator validation and copies isolate interval and selection state" {
  let locator = @date.AutoDateLocator::new()
  assert_true(
    try {
      ignore(@date.AutoDateLocator::new(minticks=0))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(locator.with_maxticks(@date.All(0)))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(locator.with_minticks(-1))
      false
    } catch {
      _ => true
    },
  )
  for values in [[], [0], [-1]] {
    assert_true(
      try {
        ignore(locator.with_intervals(@date.Hour, values))
        false
      } catch {
        _ => true
      },
    )
  }
  let table = [6, 3]
  let customized = locator.with_intervals(@date.Hour, table)
  table[0] = 99
  customized.intervals(@date.Hour)[0] = 98
  assert_eq(customized.intervals(@date.Hour), [6, 3])
  assert_eq(locator.intervals(@date.Hour), [1, 2, 3, 4, 6, 12])
  let copy = customized.copy()
  ignore(copy.tick_values(0.0, 40.0 / 24.0))
  assert_eq(copy.frequency(), @date.Hour)
  assert_eq(customized.frequency(), @date.Year)
}

///|
test "automatic adapter and standalone formatter share live frequency across views" {
  let locator = @date.AutoDateLocator::new()
  let adapter = locator.as_locator()
  let formatter = @date.AutoDateFormatter::new(locator=adapter)
  assert_eq(formatter.unit_scale(), 365.0)
  ignore(locator.tick_values(0.0, 20.0 / 1440.0))
  assert_eq(formatter.unit_scale(), 1.0 / 1440.0)
  assert_eq(formatter.format_value(0.0), "01 00:00")
  ignore(adapter.tick_values(0.0, 40.0 / 24.0))
  assert_eq(formatter.unit_scale(), 1.0 / 24.0)
  let copy = adapter.copy()
  ignore(copy.tick_values(0.0, 200.0))
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(adapter.unit_scale(), 1.0 / 24.0)
  assert_eq(adapter.interval(), 1)
}

///|
test "automatic warnings replace previous diagnostics and are returned as copies" {
  let locator = @date.AutoDateLocator::new(interval_multiples=false).with_intervals(
    @date.Day,
    [2],
  )
  ignore(locator.tick_values(0.0, 50.0))
  assert_eq(locator.warnings(), [@date.IntervalFallback(@date.Day, 2)])
  locator.warnings().clear()
  assert_eq(locator.warnings().length(), 1)
  ignore(locator.tick_values(0.0, 20.0 / 1440.0))
  assert_eq(locator.warnings(), [])
  let far = @date.datetime(2400, 1, 1).to_ordinal()
  ignore(locator.tick_values(far, far + 100.0 / 86_400_000_000.0))
  assert_true(locator.warnings().contains(@date.DistantMicroseconds))
}

///|
test "automatic numeric ranges retain direction and checked invalid bounds report errors" {
  let locator = @date.AutoDateLocator::new()
  let first = @date.datetime(2024, 1, 1).to_ordinal()
  let last = @date.datetime(2024, 6, 1).to_ordinal()
  assert_eq(
    locator.tick_values(last, first),
    locator.tick_values(first, last).rev(),
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, last))
      false
    } catch {
      _ => true
    },
  )
  assert_eq(locator.as_locator().tick_values(0.0 / 0.0, last), [])
}
