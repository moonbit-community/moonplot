///|
test "explicit calendar locators select years months and weekdays" {
  let start = try! @date.datetime(2024, 1, 1).to_ordinal()
  let finish = try! @date.datetime(2025, 1, 1).to_ordinal()
  let years = try! @date.year_locator()
  let year_ticks = years.tick_values(start, finish)
  assert_eq(year_ticks.length(), 2)
  assert_eq((try! @date.from_ordinal(year_ticks[0])).year(), 2024)
  assert_eq((try! @date.from_ordinal(year_ticks[1])).year(), 2025)

  let month_start = try! @date.datetime(2024, 1, 15).to_ordinal()
  let month_finish = try! @date.datetime(2024, 7, 15).to_ordinal()
  let months = try! @date.month_locator()
  let month_ticks = months.tick_values(month_start, month_finish)
  assert_eq(month_ticks.length(), 6)
  assert_eq((try! @date.from_ordinal(month_ticks[0])).month(), 2)
  assert_eq((try! @date.from_ordinal(month_ticks[5])).month(), 7)

  let monday = try! @date.weekday_locator(weekday=0)
  let monday_ticks = monday.tick_values(start, month_finish)
  assert_true(monday_ticks.length() >= 3)
  for value in monday_ticks {
    assert_eq((try! @date.from_ordinal(value)).weekday(), 0)
  }
}

///|
test "weekday locator defaults to Tuesday like Matplotlib" {
  let start = try! @date.datetime(2024, 1, 1).to_ordinal()
  let finish = try! @date.datetime(2024, 1, 10).to_ordinal()
  let locator = try! @date.weekday_locator()
  let ticks = locator.tick_values(start, finish)
  assert_eq(ticks.length(), 2)
  assert_eq((try! @date.from_ordinal(ticks[0])).weekday(), 1)
  assert_eq((try! @date.from_ordinal(ticks[1])).weekday(), 1)
}

///|
test "year locator includes the aligned boundary outside the data range" {
  let start = try! @date.datetime(2024, 6, 1).to_ordinal()
  let finish = try! @date.datetime(2026, 6, 1).to_ordinal()
  let locator = try! @date.year_locator()
  let ticks = locator.tick_values(start, finish)
  assert_eq(ticks.length(), 3)
  assert_eq((try! @date.from_ordinal(ticks[0])).year(), 2024)
  assert_eq((try! @date.from_ordinal(ticks[1])).year(), 2025)
  assert_eq((try! @date.from_ordinal(ticks[2])).year(), 2026)

  let five_years = try! @date.year_locator(base=5)
  let five_year_ticks = five_years.tick_values(start, finish)
  assert_eq(five_year_ticks.length(), 3)
  assert_eq((try! @date.from_ordinal(five_year_ticks[0])).year(), 2020)
  assert_eq((try! @date.from_ordinal(five_year_ticks[2])).year(), 2030)
}

///|
test "time locator handles dates around the 2038 boundary" {
  let start = try! @date.datetime(2038, 1, 19, hour=3).to_ordinal()
  let finish = try! @date.datetime(2038, 1, 19, hour=5).to_ordinal()
  let locator = try! @date.hour_locator(interval=1)
  let ticks = locator.tick_values(start, finish)
  assert_eq(ticks.length(), 3)
  assert_eq((try! @date.from_ordinal(ticks[0])).hour(), 3)
  assert_eq((try! @date.from_ordinal(ticks[2])).hour(), 5)

  let far_start = try! @date.datetime(9999, 12, 31, hour=22).to_ordinal()
  let far_finish = try! @date.datetime(9999, 12, 31, hour=23).to_ordinal()
  let far_ticks = locator.tick_values(far_start, far_finish)
  assert_eq(far_ticks.length(), 2)
  assert_eq((try! @date.from_ordinal(far_ticks[1])).hour(), 23)
}

///|
test "explicit time locators distinguish midnight and zero fields" {
  let start = try! @date.datetime(2024, 1, 1).to_ordinal()
  let three_hours = try! @date.datetime(2024, 1, 1, hour=3).to_ordinal()
  let hour_zero = try! @date.hour_locator(hour=0)
  let hour_ticks = hour_zero.tick_values(start, three_hours)
  assert_eq(hour_ticks.length(), 1)
  assert_eq((try! @date.from_ordinal(hour_ticks[0])).hour(), 0)

  let minute_finish = try! @date.datetime(2024, 1, 1, minute=3).to_ordinal()
  let minute_zero = try! @date.minute_locator(minute=0)
  let minute_ticks = minute_zero.tick_values(start, minute_finish)
  assert_eq(minute_ticks.length(), 1)
  assert_eq((try! @date.from_ordinal(minute_ticks[0])).minute(), 0)

  let second_finish = try! @date.datetime(2024, 1, 1, second=3).to_ordinal()
  let second_zero = try! @date.second_locator(second=0)
  let second_ticks = second_zero.tick_values(start, second_finish)
  assert_eq(second_ticks.length(), 1)
  assert_eq((try! @date.from_ordinal(second_ticks[0])).second(), 0)
}

///|
test "explicit locator ranges preserve reverse direction" {
  let start = try! @date.datetime(2024, 1, 1).to_ordinal()
  let finish = try! @date.datetime(2024, 1, 10).to_ordinal()
  let locator = try! @date.date_locator(interval=2)
  let ascending = locator.tick_values(start, finish)
  let descending = locator.tick_values(finish, start)
  assert_true(ascending.length() > 1)
  assert_eq(descending[0], ascending[ascending.length() - 1])
  assert_eq(descending[descending.length() - 1], ascending[0])
}

///|
test "date locator fallback preserves reverse endpoint order" {
  let lower = try! @date.datetime(2023, 1, 1).to_ordinal()
  let upper = try! @date.datetime(2023, 12, 31).to_ordinal()
  let locator = try! @date.year_locator(month=2, day=29)
  let ticks = locator.tick_values(upper, lower)
  assert_eq(ticks, [upper, lower])
}

///|
test "calendar locator intervals use the expanded recurrence anchor" {
  let month_start = try! @date.datetime(2024, 1, 15).to_ordinal()
  let month_finish = try! @date.datetime(2024, 7, 15).to_ordinal()
  let month_ticks = try! @date.month_locator(interval=2).tick_values(
    month_start, month_finish,
  )
  assert_eq(month_ticks.length(), 3)
  assert_eq((try! @date.from_ordinal(month_ticks[0])).month(), 3)
  assert_eq((try! @date.from_ordinal(month_ticks[2])).month(), 7)

  let day_start = try! @date.datetime(2024, 1, 15).to_ordinal()
  let day_finish = try! @date.datetime(2024, 1, 25).to_ordinal()
  let day_ticks = try! @date.day_locator(interval=2).tick_values(
    day_start, day_finish,
  )
  assert_eq(day_ticks.length(), 6)
  assert_eq((try! @date.from_ordinal(day_ticks[0])).day(), 15)
  assert_eq((try! @date.from_ordinal(day_ticks[5])).day(), 25)

  let hour_start = try! @date.datetime(2024, 1, 1, hour=3, minute=30).to_ordinal()
  let hour_finish = try! @date.datetime(2024, 1, 1, hour=9, minute=30).to_ordinal()
  let hour_ticks = try! @date.hour_locator(interval=2).tick_values(
    hour_start, hour_finish,
  )
  assert_eq(hour_ticks.length(), 3)
  assert_eq((try! @date.from_ordinal(hour_ticks[0])).hour(), 5)
  assert_eq((try! @date.from_ordinal(hour_ticks[2])).hour(), 9)

  let minute_start = try! @date.datetime(
    2024,
    1,
    1,
    hour=0,
    minute=3,
    second=30,
  ).to_ordinal()
  let minute_finish = try! @date.datetime(
    2024,
    1,
    1,
    hour=0,
    minute=9,
    second=30,
  ).to_ordinal()
  let minute_ticks = try! @date.minute_locator(interval=2).tick_values(
    minute_start, minute_finish,
  )
  assert_eq(minute_ticks.length(), 3)
  assert_eq((try! @date.from_ordinal(minute_ticks[0])).minute(), 5)
  assert_eq((try! @date.from_ordinal(minute_ticks[2])).minute(), 9)

  let second_start = try! @date.datetime(2024, 1, 1, hour=0, minute=0, second=3).to_ordinal()
  let second_finish = try! @date.datetime(
    2024,
    1,
    1,
    hour=0,
    minute=0,
    second=9,
  ).to_ordinal()
  let second_ticks = try! @date.second_locator(interval=2).tick_values(
    second_start, second_finish,
  )
  assert_eq(second_ticks.length(), 4)
  assert_eq((try! @date.from_ordinal(second_ticks[0])).second(), 3)
  assert_eq((try! @date.from_ordinal(second_ticks[3])).second(), 9)

  let weekday_start = try! @date.datetime(2024, 1, 1).to_ordinal()
  let weekday_finish = try! @date.datetime(2024, 2, 1).to_ordinal()
  let alternate_mondays = try! @date.weekday_locator(weekday=0, interval=2).tick_values(
    weekday_start, weekday_finish,
  )
  assert_eq(alternate_mondays.length(), 2)
  assert_eq((try! @date.from_ordinal(alternate_mondays[0])).day(), 8)
  assert_eq((try! @date.from_ordinal(alternate_mondays[1])).day(), 22)
}

///|
test "date locators support multi-value and signed selectors" {
  let year_start = try! @date.datetime(2024, 1, 1).to_ordinal()
  let year_finish = try! @date.datetime(2024, 12, 31).to_ordinal()
  let month_locator = try! @date.month_locator(bymonth=[2, 4, 6], bymonthday=-1)
  let month_ticks = month_locator.tick_values(year_start, year_finish)
  assert_eq(month_ticks.length(), 3)
  assert_eq((try! @date.from_ordinal(month_ticks[0])).day(), 29)
  assert_eq((try! @date.from_ordinal(month_ticks[1])).day(), 30)
  assert_eq((try! @date.from_ordinal(month_ticks[2])).month(), 6)

  let days = try! @date.day_locator(bymonthday=[1, -1])
  let day_ticks = days.tick_values(year_start, year_finish)
  assert_eq(day_ticks.length(), 24)
  assert_eq((try! @date.from_ordinal(day_ticks[0])).day(), 1)
  assert_eq((try! @date.from_ordinal(day_ticks[1])).day(), 31)
  assert_eq((try! @date.from_ordinal(day_ticks[2])).month(), 2)

  let weekdays = try! @date.weekday_locator(byweekday=[0, 2])
  let weekday_ticks = weekdays.tick_values(year_start, year_start + 7.0)
  assert_eq(weekday_ticks.length(), 3)
  assert_eq((try! @date.from_ordinal(weekday_ticks[0])).day(), 1)
  assert_eq((try! @date.from_ordinal(weekday_ticks[1])).day(), 3)
  assert_eq((try! @date.from_ordinal(weekday_ticks[2])).day(), 8)

  let hours = try! @date.hour_locator(byhour=[1, 5, 9])
  let hour_start = try! @date.datetime(2024, 1, 1).to_ordinal()
  let hour_finish = try! @date.datetime(2024, 1, 1, hour=10).to_ordinal()
  let hour_ticks = hours.tick_values(hour_start, hour_finish)
  assert_eq(hour_ticks.length(), 3)
  assert_eq((try! @date.from_ordinal(hour_ticks[1])).hour(), 5)

  let minutes = try! @date.minute_locator(byminute=[5, 7, 9])
  let minute_finish = try! @date.datetime(2024, 1, 1, minute=10).to_ordinal()
  let minute_ticks = minutes.tick_values(hour_start, minute_finish)
  assert_eq(minute_ticks.length(), 3)
  assert_eq((try! @date.from_ordinal(minute_ticks[2])).minute(), 9)

  let seconds = try! @date.second_locator(bysecond=[3, 5, 9])
  let second_finish = try! @date.datetime(2024, 1, 1, second=10).to_ordinal()
  let second_ticks = seconds.tick_values(hour_start, second_finish)
  assert_eq(second_ticks.length(), 3)
  assert_eq((try! @date.from_ordinal(second_ticks[0])).second(), 3)
}

///|
test "date locator selector arrays are copied and validated" {
  let selectors = [3, 1, 3]
  let locator = try! @date.month_locator(bymonth=selectors)
  selectors[0] = 12
  assert_eq(locator.selector(), 1)
  let start = try! @date.datetime(2024, 1, 1).to_ordinal()
  let finish = try! @date.datetime(2024, 4, 1).to_ordinal()
  let ticks = locator.tick_values(start, finish)
  assert_eq(ticks.length(), 2)
  assert_eq((try! @date.from_ordinal(ticks[0])).month(), 1)
  assert_eq((try! @date.from_ordinal(ticks[1])).month(), 3)

  try @date.month_locator(bymonth=[]) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("must not be empty"))
    _ => fail("expected empty selector error")
  } noraise {
    _ => fail("expected empty selector error")
  }
  try @date.weekday_locator(weekday=1, byweekday=[1, 2]) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("either"))
    _ => fail("expected conflicting selector error")
  } noraise {
    _ => fail("expected conflicting selector error")
  }
}

///|
test "invalid date locator parameters raise DateError" {
  try @date.date_locator(interval=0) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("positive"))
    _ => fail("expected positive interval error")
  } noraise {
    _ => fail("expected positive interval error")
  }
  try @date.month_locator_on(13) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("1..12"))
    _ => fail("expected month selector error")
  } noraise {
    _ => fail("expected month selector error")
  }
  try @date.weekday_locator(weekday=7) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("Monday"))
    _ => fail("expected weekday selector error")
  } noraise {
    _ => fail("expected weekday selector error")
  }
}
