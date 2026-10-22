///|
test "business day locator skips weekends and explicit holidays" {
  let locator = try! @date.business_day_locator(holidays=[
    @date.datetime(2024, 1, 1, hour=12),
    @date.datetime(2024, 1, 1, offset_minutes=480),
    @date.datetime(2024, 1, 5),
  ])
  let ticks = locator.tick_values(
    try! @date.datetime(2023, 12, 29).to_ordinal(),
    try! @date.datetime(2024, 1, 8).to_ordinal(),
  )
  assert_eq(@date.format_date_ticks(ticks, format="%Y-%m-%d"), [
    "2023-12-29", "2024-01-02", "2024-01-03", "2024-01-04", "2024-01-08",
  ])
}

///|
test "business day locator accepts a custom weekday mask" {
  let locator = try! @date.business_day_locator(weekdays=[5, 6])
  let ticks = locator.tick_values(
    try! @date.datetime(2024, 1, 1).to_ordinal(),
    try! @date.datetime(2024, 1, 15).to_ordinal(),
  )
  assert_eq(@date.format_date_ticks(ticks, format="%Y-%m-%d"), [
    "2024-01-06", "2024-01-07", "2024-01-13", "2024-01-14",
  ])
}

///|
test "business day locator copies holiday inputs and preserves calendar labels" {
  let holidays = [@date.datetime(2024, 1, 2)]
  let locator = try! @date.business_day_locator(holidays~)
  holidays[0] = @date.datetime(2024, 1, 3)
  let shifted = try! locator.with_offset(480)
  let ticks = shifted.tick_values(
    try! @date.datetime(2024, 1, 1, offset_minutes=480).to_ordinal(),
    try! @date.datetime(2024, 1, 5, offset_minutes=480).to_ordinal(),
  )
  assert_eq(
    @date.format_date_ticks(ticks, format="%Y-%m-%d", offset_minutes=480),
    ["2024-01-01", "2024-01-03", "2024-01-04", "2024-01-05"],
  )
}

///|
test "business day locator validates mask and interval" {
  try @date.business_day_locator(weekdays=[]) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("must not be empty"))
    _ => fail("expected empty weekday mask error")
  } noraise {
    _ => fail("expected empty weekday mask error")
  }
  try @date.business_day_locator(weekdays=[7]) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("Monday=0"))
    _ => fail("expected weekday range error")
  } noraise {
    _ => fail("expected weekday range error")
  }
  try @date.business_day_locator(interval=0) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("interval"))
    _ => fail("expected interval error")
  } noraise {
    _ => fail("expected interval error")
  }
}
