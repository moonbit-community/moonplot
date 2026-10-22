///|
fn recurrence_dates(
  locator : @date.DateLocator,
  start : String,
  finish : String,
) -> Array[String] raise {
  locator
  .tick_values(
    @date.parse_iso(start).to_ordinal(),
    @date.parse_iso(finish).to_ordinal(),
  )
  .map(value => {
    @date.format_date(@date.from_ordinal(value), "%Y-%m-%d %H:%M:%S")
  })
}

///|
test "rrule locator expands calendar fields by frequency" {
  let yearly = try! @date.rrule_locator(
    @date.RRuleFrequency::Yearly,
    bymonth=[1, 7],
    bymonthday=[1],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(yearly, "2023-01-01", "2024-12-31"), [
    "2023-01-01 00:00:00", "2023-07-01 00:00:00", "2024-01-01 00:00:00", "2024-07-01 00:00:00",
  ])
  let monthly = try! @date.rrule_locator(
    @date.RRuleFrequency::Monthly,
    byweekday=[0],
    byhour=[9],
  )
  assert_eq(recurrence_dates(monthly, "2024-01-01", "2024-01-15"), [
    "2024-01-01 09:00:00", "2024-01-08 09:00:00",
  ])
  let weekly = try! @date.rrule_locator(
    @date.RRuleFrequency::Weekly,
    byweekday=[0, 2],
    byhour=[9],
    byminute=[30],
  )
  assert_eq(recurrence_dates(weekly, "2024-01-01", "2024-01-10"), [
    "2024-01-01 09:30:00", "2024-01-03 09:30:00", "2024-01-08 09:30:00",
  ])
}

///|
test "rrule locator expands clock selectors and intervals" {
  let daily = try! @date.rrule_locator(
    @date.RRuleFrequency::Daily,
    byhour=[0, 12],
    byminute=[0, 30],
  )
  assert_eq(recurrence_dates(daily, "2024-01-01", "2024-01-02"), [
    "2024-01-01 00:00:00", "2024-01-01 00:30:00", "2024-01-01 12:00:00", "2024-01-01 12:30:00",
    "2024-01-02 00:00:00",
  ])
  let hourly = try! @date.rrule_locator(
    @date.RRuleFrequency::Hourly,
    byminute=[0, 30],
    interval=2,
  )
  assert_eq(recurrence_dates(hourly, "2024-01-01T00:00", "2024-01-01T05:30"), [
    "2024-01-01 00:00:00", "2024-01-01 00:30:00", "2024-01-01 02:00:00", "2024-01-01 02:30:00",
    "2024-01-01 04:00:00", "2024-01-01 04:30:00",
  ])
  let minutely = try! @date.rrule_locator(@date.RRuleFrequency::Minutely, bysecond=[
    0, 30,
  ])
  assert_eq(
    recurrence_dates(minutely, "2024-01-01T00:00:00", "2024-01-01T00:02:00"),
    [
      "2024-01-01 00:00:00", "2024-01-01 00:00:30", "2024-01-01 00:01:00", "2024-01-01 00:01:30",
      "2024-01-01 00:02:00",
    ],
  )
  let secondly = try! @date.rrule_locator(
    @date.RRuleFrequency::Secondly,
    interval=2,
  )
  assert_eq(
    recurrence_dates(secondly, "2024-01-01T00:00:00", "2024-01-01T00:00:06"),
    [
      "2024-01-01 00:00:00", "2024-01-01 00:00:02", "2024-01-01 00:00:04", "2024-01-01 00:00:06",
    ],
  )
}

///|
test "rrule locator copies selectors, handles negative month days, and uses offsets" {
  let months = [2, 1, 2]
  let locator = try! @date.rrule_locator(
    @date.RRuleFrequency::Monthly,
    bymonth=months,
    bymonthday=[-1, 1, -1],
  )
  months[0] = 12
  assert_eq(recurrence_dates(locator, "2024-01-01", "2024-03-31"), [
    "2024-01-01 00:00:00", "2024-01-31 00:00:00", "2024-02-01 00:00:00", "2024-02-29 00:00:00",
  ])
  let offset_locator = try! @date.rrule_locator(@date.RRuleFrequency::Daily, byhour=[
    0,
  ]).with_offset(120)
  let ticks = offset_locator.tick_values(
    @date.datetime(2024, 1, 1, offset_minutes=120).to_ordinal(),
    @date.datetime(2024, 1, 2, offset_minutes=120).to_ordinal(),
  )
  assert_eq(
    ticks.map(value => {
      @date.format_date(
        @date.from_ordinal(value, offset_minutes=120),
        "%Y-%m-%d %H:%M:%S",
      )
    }),
    ["2024-01-01 00:00:00", "2024-01-02 00:00:00"],
  )
}

///|
test "rrule locator validates selectors and intervals" {
  try @date.rrule_locator(@date.RRuleFrequency::Daily, interval=0) catch {
    @date.DateError::InvalidDate(_) => ()
    _ => fail("expected invalid interval")
  } noraise {
    _ => fail("expected invalid interval")
  }
  try @date.rrule_locator(@date.RRuleFrequency::Daily, byhour=[24]) catch {
    @date.DateError::InvalidDate(_) => ()
    _ => fail("expected invalid hour")
  } noraise {
    _ => fail("expected invalid hour")
  }
  try @date.rrule_locator(@date.RRuleFrequency::Daily, bymonthday=[0]) catch {
    @date.DateError::InvalidDate(_) => ()
    _ => fail("expected invalid month day")
  } noraise {
    _ => fail("expected invalid month day")
  }
}

///|
test "rrule locator supports year days week numbers and Easter offsets" {
  let year_days = try! @date.rrule_locator(
    @date.RRuleFrequency::Yearly,
    byyearday=[1, -1],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(year_days, "2023-01-01", "2024-12-31"), [
    "2023-01-01 00:00:00", "2023-12-31 00:00:00", "2024-01-01 00:00:00", "2024-12-31 00:00:00",
  ])
  let easter = try! @date.rrule_locator(
    @date.RRuleFrequency::Yearly,
    byeaster=[-2, 0, 2],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(easter, "2024-01-01", "2024-12-31"), [
    "2024-03-29 00:00:00", "2024-03-31 00:00:00", "2024-04-02 00:00:00",
  ])
  let week_one = try! @date.rrule_locator(
    @date.RRuleFrequency::Yearly,
    byweekno=[1],
    byweekday=[0],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(week_one, "2019-01-01", "2025-01-01"), [
    "2019-12-30 00:00:00", "2021-01-04 00:00:00", "2022-01-03 00:00:00", "2023-01-02 00:00:00",
    "2024-01-01 00:00:00", "2024-12-30 00:00:00",
  ])
}

///|
test "rrule locator validates extended calendar selectors" {
  try @date.rrule_locator(@date.RRuleFrequency::Yearly, byyearday=[0]) catch {
    @date.DateError::InvalidDate(_) => ()
    _ => fail("expected invalid year day")
  } noraise {
    _ => fail("expected invalid year day")
  }
  try @date.rrule_locator(@date.RRuleFrequency::Yearly, byweekno=[54]) catch {
    @date.DateError::InvalidDate(_) => ()
    _ => fail("expected invalid week number")
  } noraise {
    _ => fail("expected invalid week number")
  }
  try @date.rrule_locator(@date.RRuleFrequency::Yearly, byeaster=[367]) catch {
    @date.DateError::InvalidDate(_) => ()
    _ => fail("expected invalid Easter offset")
  } noraise {
    _ => fail("expected invalid Easter offset")
  }
}

///|
test "rrule locator applies bysetpos after calendar filters" {
  let weekdays = try! @date.rrule_locator(
    @date.RRuleFrequency::Monthly,
    byweekday=[0, 1, 2, 3, 4],
    bysetpos=[-1],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(weekdays, "2024-01-01", "2024-04-30"), [
    "2024-01-31 00:00:00", "2024-02-29 00:00:00", "2024-03-29 00:00:00", "2024-04-30 00:00:00",
  ])
  let weekly = try! @date.rrule_locator(
    @date.RRuleFrequency::Weekly,
    byweekday=[0, 1, 2, 3, 4, 5, 6],
    bysetpos=[2],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(weekly, "2024-01-04", "2024-01-15"), [
    "2024-01-09 00:00:00",
  ])
}

///|
test "rrule locator honors week start for cross-year week numbers" {
  let tuesday = try! @date.rrule_locator(
    @date.RRuleFrequency::Yearly,
    wkst=1,
    byweekno=[53],
    byweekday=[0],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(tuesday, "2018-01-01", "2025-01-01"), [
    "2022-01-03 00:00:00", "2023-01-02 00:00:00",
  ])
  let friday = try! @date.rrule_locator(
    @date.RRuleFrequency::Yearly,
    wkst=4,
    byweekno=[-53],
    byweekday=[0],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(friday, "2018-01-01", "2025-01-01"), [
    "2018-01-01 00:00:00", "2024-01-01 00:00:00",
  ])
}
