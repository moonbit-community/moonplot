///|
fn locator_eastern_zone() -> @date.DateTimeZone {
  try! @date.timezone(-300, transitions=[
    try! @date.timezone_transition(@date.datetime(2024, 3, 10, hour=7), -240),
    try! @date.timezone_transition(@date.datetime(2024, 11, 3, hour=6), -300),
  ])
}

///|
test "transition-aware hour locator skips spring gap" {
  let zone = locator_eastern_zone()
  let gap = try! @date.datetime(2024, 3, 10, hour=2, offset_minutes=-300)
  assert_eq(
    zone.transitions()[0].at(),
    try! @date.datetime(2024, 3, 10, hour=7).to_ordinal(),
  )
  assert_eq(
    gap.to_ordinal(),
    try! @date.datetime(2024, 3, 10, hour=7).to_ordinal(),
  )
  try zone.to_ordinal(gap) catch {
    _ => ()
  } noraise {
    _ => fail("expected spring gap to be invalid")
  }
  let first = try! @date.datetime(2024, 3, 10, hour=6).to_ordinal()
  let last = try! @date.datetime(2024, 3, 10, hour=9).to_ordinal()
  let locator = try! @date.hour_locator().with_timezone(zone)
  let ticks = locator.tick_values(first, last)
  assert_eq(@date.format_date_ticks(ticks, format="%H:%M %z", timezone=zone), [
    "01:00 -0500", "03:00 -0400", "04:00 -0400", "05:00 -0400",
  ])
  assert_eq(ticks[1], try! @date.datetime(2024, 3, 10, hour=7).to_ordinal())
}

///|
test "transition-aware locators preserve reverse range order" {
  let zone = locator_eastern_zone()
  let first = try! @date.datetime(2024, 3, 10, hour=6).to_ordinal()
  let last = try! @date.datetime(2024, 3, 10, hour=9).to_ordinal()
  let locator = try! @date.hour_locator().with_timezone(zone)
  assert_eq(
    locator.tick_values(last, first),
    locator.tick_values(first, last).rev(),
  )
}

///|
test "transition-aware day locators keep local calendar dates" {
  let zone = locator_eastern_zone()
  let first = try! @date.datetime(2024, 3, 9, hour=5).to_ordinal()
  let last = try! @date.datetime(2024, 3, 11, hour=5).to_ordinal()
  let days = try! @date.day_locator().with_timezone(zone)
  let business = try! @date.business_day_locator().with_timezone(zone)
  let day_ticks = days.tick_values(first, last)
  let business_ticks = business.tick_values(first, last)
  assert_eq(
    @date.format_date_ticks(day_ticks, format="%Y-%m-%d", timezone=zone),
    ["2024-03-09", "2024-03-10", "2024-03-11"],
  )
  assert_eq(
    @date.format_date_ticks(business_ticks, format="%Y-%m-%d", timezone=zone),
    ["2024-03-11"],
  )
  assert_eq(day_ticks, [
    try! @date.datetime(2024, 3, 9, hour=5).to_ordinal(),
    try! @date.datetime(2024, 3, 10, hour=5).to_ordinal(),
    try! @date.datetime(2024, 3, 11, hour=4).to_ordinal(),
  ])
}

///|
test "transition-aware hour locator keeps both fall-back instants" {
  let zone = locator_eastern_zone()
  let first = try! @date.datetime(2024, 11, 3, hour=4).to_ordinal()
  let last = try! @date.datetime(2024, 11, 3, hour=8).to_ordinal()
  let locator = try! @date.hour_locator().with_timezone(zone)
  let ticks = locator.tick_values(first, last)
  assert_eq(@date.format_date_ticks(ticks, format="%H:%M %z", timezone=zone), [
    "00:00 -0400", "01:00 -0400", "01:00 -0500", "02:00 -0500", "03:00 -0500",
  ])
  assert_eq(ticks[1], try! @date.datetime(2024, 11, 3, hour=5).to_ordinal())
  assert_eq(ticks[2], try! @date.datetime(2024, 11, 3, hour=6).to_ordinal())
}

///|
test "transition-aware recurrence skips a spring-forward local hour" {
  let zone = locator_eastern_zone()
  let locator = try! @date.rrule_locator(
    @date.RRuleFrequency::Daily,
    byhour=[2],
    byminute=[0],
    bysecond=[0],
    dtstart=@date.datetime(2024, 3, 9, hour=2, offset_minutes=-300),
  ).with_timezone(zone)
  let first = try! @date.datetime(2024, 3, 9, hour=5).to_ordinal()
  let last = try! @date.datetime(2024, 3, 12, hour=8).to_ordinal()
  let ticks = locator.tick_values(first, last)
  assert_eq(
    @date.format_date_ticks(ticks, format="%Y-%m-%d %H:%M %z", timezone=zone),
    [
      "2024-03-09 02:00 -0500", "2024-03-11 02:00 -0400", "2024-03-12 02:00 -0400",
    ],
  )
}

///|
test "transition-aware recurrence preserves a fall-back fold" {
  let zone = locator_eastern_zone()
  let locator = try! @date.rrule_locator(
    @date.RRuleFrequency::Daily,
    byhour=[1],
    byminute=[0],
    bysecond=[0],
    dtstart=@date.datetime(2024, 11, 2, hour=1, offset_minutes=-240),
  ).with_timezone(zone)
  let first = try! @date.datetime(2024, 11, 2, hour=4).to_ordinal()
  let last = try! @date.datetime(2024, 11, 4, hour=8).to_ordinal()
  let ticks = locator.tick_values(first, last)
  assert_eq(
    @date.format_date_ticks(ticks, format="%Y-%m-%d %H:%M %z", timezone=zone),
    [
      "2024-11-02 01:00 -0400", "2024-11-03 01:00 -0400", "2024-11-03 01:00 -0500",
      "2024-11-04 01:00 -0500",
    ],
  )
  let sorted = ticks.copy()
  sorted.sort()
  assert_eq(ticks, sorted)
}

///|
test "transition-aware recurrence handles a reversed UTC fold window" {
  let zone = locator_eastern_zone()
  let locator = try! @date.rrule_locator(
    @date.RRuleFrequency::Daily,
    byhour=[1],
    byminute=[0],
    bysecond=[0],
  ).with_timezone(zone)
  let first = try! @date.datetime(2024, 11, 3, hour=5, minute=45).to_ordinal()
  let last = try! @date.datetime(2024, 11, 3, hour=6, minute=15).to_ordinal()
  let ticks = locator.tick_values(first, last)
  assert_eq(
    @date.format_date_ticks(ticks, format="%Y-%m-%d %H:%M %z", timezone=zone),
    ["2024-11-03 01:00 -0500"],
  )
}
