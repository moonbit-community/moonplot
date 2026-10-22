///|
// Source: Matplotlib v3.11.2 dates.py, RRuleLocator._create_rrule and the
// explicit locator constructors. Expected dates are calendar calculations,
// not snapshots regenerated from this implementation.
fn dates_in_range(
  locator : @date.DateLocator,
  start : String,
  finish : String,
) -> Array[String] raise {
  let first = @date.parse_iso(start).to_ordinal()
  let last = @date.parse_iso(finish).to_ordinal()
  locator
  .tick_values(first, last)
  .map(value => {
    @date.format_date(@date.from_ordinal(value), "%Y-%m-%d %H:%M:%S")
  })
}

///|
test "recurrence anchor uses calendar months and remaining days" {
  // relativedelta is one month plus two days; Feb 29 minus it is Jan 27.
  assert_eq(
    dates_in_range(@date.day_locator(interval=3), "2024-02-29", "2024-03-31"),
    [
      "2024-02-29 00:00:00", "2024-03-03 00:00:00", "2024-03-06 00:00:00", "2024-03-09 00:00:00",
      "2024-03-12 00:00:00", "2024-03-15 00:00:00", "2024-03-18 00:00:00", "2024-03-21 00:00:00",
      "2024-03-24 00:00:00", "2024-03-27 00:00:00", "2024-03-30 00:00:00",
    ],
  )
  // The calendar subtraction clamps March 31 to February 29. A 30-day
  // subtraction would anchor March 1 and place ticks on the opposite days.
  assert_eq(
    dates_in_range(
      @date.day_locator(day=1, interval=2),
      "2024-03-31",
      "2024-04-30",
    ),
    ["2024-04-01 00:00:00"],
  )
  // Overshooting the last day requires removing a whole month from the delta.
  assert_eq(
    dates_in_range(
      @date.day_locator(bymonthday=[1, -1], interval=2),
      "2024-01-31",
      "2024-03-01",
    ),
    ["2024-01-31 00:00:00", "2024-03-01 00:00:00"],
  )
}

///|
test "month selectors filter calendar steps and skip impossible dates" {
  assert_eq(
    dates_in_range(
      @date.month_locator(bymonth=[2, 3, 5, 6, 7], interval=2),
      "2024-01-15",
      "2024-07-15",
    ),
    ["2024-03-01 00:00:00", "2024-05-01 00:00:00", "2024-07-01 00:00:00"],
  )
  assert_eq(
    dates_in_range(
      @date.month_locator(bymonthday=31),
      "2024-01-15",
      "2024-05-31",
    ),
    ["2024-01-31 00:00:00", "2024-03-31 00:00:00", "2024-05-31 00:00:00"],
  )
  assert_eq(
    dates_in_range(
      @date.month_locator_on(2, bymonthday=-1),
      "2023-01-01",
      "2024-03-01",
    ),
    ["2023-02-28 00:00:00", "2024-02-29 00:00:00"],
  )
}

///|
test "day and weekday selections filter interval steps rather than occurrences" {
  assert_eq(
    dates_in_range(
      @date.day_locator(bymonthday=[15, 16, 17, 20, 25], interval=2),
      "2024-01-15",
      "2024-01-25",
    ),
    ["2024-01-15 00:00:00", "2024-01-17 00:00:00", "2024-01-25 00:00:00"],
  )
  assert_eq(
    dates_in_range(
      @date.weekday_locator(byweekday=[0, 2], interval=2),
      "2024-01-01",
      "2024-02-01",
    ),
    [
      "2024-01-08 00:00:00", "2024-01-10 00:00:00", "2024-01-22 00:00:00", "2024-01-24 00:00:00",
    ],
  )
  // Positive and negative selectors can name the same day: output is unique.
  assert_eq(
    dates_in_range(
      @date.day_locator(bymonthday=[29, -1, -1, 29]),
      "2024-02-01",
      "2024-02-29",
    ),
    ["2024-02-29 00:00:00"],
  )
}

///|
test "time selector sets retain interval phase and field zero" {
  assert_eq(
    dates_in_range(
      @date.hour_locator(byhour=[5, 6, 9], interval=2),
      "2024-01-01T03:30",
      "2024-01-01T09:30",
    ),
    ["2024-01-01 05:00:00", "2024-01-01 09:00:00"],
  )
  assert_eq(
    dates_in_range(
      @date.minute_locator(byminute=[5, 6, 9], interval=2),
      "2024-01-01T00:03:30",
      "2024-01-01T00:09:30",
    ),
    ["2024-01-01 00:05:00", "2024-01-01 00:09:00"],
  )
  assert_eq(
    dates_in_range(
      @date.second_locator(bysecond=[3, 4, 9], interval=2),
      "2024-01-01T00:00:03",
      "2024-01-01T00:00:09",
    ),
    ["2024-01-01 00:00:03", "2024-01-01 00:00:09"],
  )
  assert_eq(
    dates_in_range(
      @date.hour_locator(byhour=[0, 23]),
      "1969-12-31T22:30",
      "1970-01-01T01:30",
    ),
    ["1969-12-31 23:00:00", "1970-01-01 00:00:00"],
  )
  assert_eq(
    dates_in_range(
      @date.minute_locator(byminute=[0, 59]),
      "1969-12-31T23:58:30",
      "1970-01-01T00:01:30",
    ),
    ["1969-12-31 23:59:00", "1970-01-01 00:00:00"],
  )
  assert_eq(
    dates_in_range(
      @date.second_locator(bysecond=[0, 59]),
      "1969-12-31T23:59:58",
      "1970-01-01T00:00:01",
    ),
    ["1969-12-31 23:59:59", "1970-01-01 00:00:00"],
  )
}

///|
test "locators clamp recurrence anchors to the minimum supported date" {
  assert_eq(
    dates_in_range(@date.day_locator(interval=2), "0001-01-01", "0001-01-04"),
    ["0001-01-01 00:00:00", "0001-01-03 00:00:00"],
  )
  assert_eq(
    dates_in_range(
      @date.hour_locator(byhour=[0, 2]),
      "0001-01-01T00:00",
      "0001-01-01T04:00",
    ),
    ["0001-01-01 00:00:00", "0001-01-01 02:00:00"],
  )
  assert_eq(
    dates_in_range(
      @date.month_locator(bymonthday=-1),
      "0001-01-01",
      "0001-03-01",
    ),
    ["0001-01-31 00:00:00", "0001-02-28 00:00:00"],
  )
}

///|
test "sparse locators count emitted ticks and preserve reversed ranges" {
  let locator = @date.second_locator(bysecond=[0])
  let values = locator.tick_values(0.0, 2.0)
  // 172801 candidate seconds, 2881 minute boundaries (both ends included).
  assert_eq(values.length(), 2881)
  assert_eq(values[0], 0.0)
  assert_eq(values[2880], 2.0)
  assert_eq(locator.tick_values(2.0, 0.0), values.rev())
  let empty_rule = @date.hour_locator(byhour=[1], interval=24)
  assert_eq(empty_rule.tick_values(0.0, 365000.0), [0.0, 365000.0])
  assert_eq(empty_rule.tick_values(365000.0, 0.0), [365000.0, 0.0])
}

///|
test "date locator output is bounded and large intervals do not overflow" {
  let values = @date.second_locator().tick_values(0.0, 2.0)
  assert_eq(values.length(), 100000)
  assert_eq(values[0], 0.0)
  assert_eq(
    @date.format_date(@date.from_ordinal(values[99999]), "%Y-%m-%d %H:%M:%S"),
    "1970-01-02 03:46:39",
  )
  let locators = [
    @date.month_locator(interval=2147483647),
    @date.day_locator(interval=2147483647),
    @date.weekday_locator(interval=2147483647),
    @date.hour_locator(interval=2147483647),
    @date.minute_locator(interval=2147483647),
    @date.second_locator(interval=2147483647),
  ]
  for locator in locators {
    assert_eq(locator.tick_values(0.0, 1.0), [0.0, 1.0])
  }
}

///|
test "invalid ordinals and singleton ranges have deterministic results" {
  let locator = @date.day_locator(bymonthday=[1, -1])
  for invalid in [1.0e100, -1.0e100, -719163.0, 2932897.0, 1.0 / 0.0, 0.0 / 0.0] {
    assert_eq(locator.tick_values(invalid, 0.0), [])
    assert_eq(locator.tick_values(0.0, invalid), [])
    assert_eq(locator.tick_values(invalid, invalid), [])
  }
  assert_eq(locator.tick_values(0.0, 0.0), [0.0])
}
