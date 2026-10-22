///|
test "nth weekday handles Gregorian dates before the epoch" {
  let start = try! @date.datetime(1, 1, 1).to_ordinal()
  let finish = try! @date.datetime(1, 2, 1).to_ordinal()
  let locator = try! @date.nth_weekday_locator(weekday=0, ordinal=1)
  let ticks = locator.tick_values(start, finish)
  assert_true(ticks.length() > 0)
  let first = try! @date.from_ordinal(ticks[0])
  assert_eq(first.year(), 1)
  assert_eq(first.month(), 1)
  assert_eq(first.day(), 1)
  assert_eq(first.weekday(), 0)
}

///|
test "nth weekday locators select positive and negative monthly occurrences" {
  let start = try! @date.datetime(2024, 1, 1).to_ordinal()
  let finish = try! @date.datetime(2024, 4, 30).to_ordinal()
  let second_monday = try! @date.nth_weekday_locator(weekday=0, ordinal=2)
  assert_eq(
    second_monday
    .tick_values(start, finish)
    .map(value => @date.format_date(@date.from_ordinal(value), "%Y-%m-%d")),
    ["2024-01-08", "2024-02-12", "2024-03-11", "2024-04-08"],
  )

  let last_friday = try! @date.nth_weekday_locator(weekday=4, ordinal=-1, bymonth=[
    1, 2, 3,
  ])
  assert_eq(
    last_friday
    .tick_values(start, finish)
    .map(value => @date.format_date(@date.from_ordinal(value), "%Y-%m-%d")),
    ["2024-01-26", "2024-02-23", "2024-03-29"],
  )

  let first_monday_or_wednesday = try! @date.nth_weekday_locator(
    ordinal=1,
    bymonth=[1],
    byweekday=[0, 2],
  )
  assert_eq(
    first_monday_or_wednesday
    .tick_values(start, finish)
    .map(value => @date.format_date(@date.from_ordinal(value), "%Y-%m-%d")),
    ["2024-01-01", "2024-01-03"],
  )
}

///|
test "nth weekday locator intervals preserve month phase and direction" {
  let start = try! @date.datetime(2024, 1, 1).to_ordinal()
  let finish = try! @date.datetime(2024, 7, 31).to_ordinal()
  let locator = try! @date.nth_weekday_locator(weekday=2, ordinal=1, interval=2)
  let ascending = locator.tick_values(start, finish)
  assert_eq(
    ascending.map(value => {
      @date.format_date(@date.from_ordinal(value), "%Y-%m-%d")
    }),
    ["2024-02-07", "2024-04-03", "2024-06-05"],
  )
  assert_eq(locator.tick_values(finish, start), ascending.rev())
}

///|
test "nth weekday locator validates ordinals" {
  try @date.nth_weekday_locator(weekday=0, ordinal=0) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("ordinal"))
    _ => fail("expected zero ordinal error")
  } noraise {
    _ => fail("expected zero ordinal error")
  }
  try @date.nth_weekday_locator(weekday=0, ordinal=6) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("-5..-1"))
    _ => fail("expected ordinal range error")
  } noraise {
    _ => fail("expected ordinal range error")
  }
}
