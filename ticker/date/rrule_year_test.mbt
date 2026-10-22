///|
// Reference: python-dateutil rrule._iterinfo masks and Gregorian Easter.
// These assertions use calendar dates, not snapshots of the MoonBit output.
test "rrule year days distinguish leap years and deduplicate signed aliases" {
  let locator = @date.rrule_locator(
    @date.Yearly,
    byyearday=[-366, 1, 60, -1, 366],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(locator, "2023-01-01", "2024-12-31"), [
    "2023-01-01 00:00:00", "2023-03-01 00:00:00", "2023-12-31 00:00:00", "2024-01-01 00:00:00",
    "2024-02-29 00:00:00", "2024-12-31 00:00:00",
  ])
  let february = @date.rrule_locator(
    @date.Yearly,
    byyearday=[60],
    bymonth=[2],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(february, "2023-01-01", "2025-12-31"), [
    "2024-02-29 00:00:00",
  ])
}

///|
test "rrule year days work in cross-year weeks and hourly rules" {
  let weekly = @date.rrule_locator(
    @date.Weekly,
    byyearday=[1, -1],
    bysetpos=[-1],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(weekly, "2020-12-28", "2021-01-10"), [
    "2021-01-01 00:00:00",
  ])
  let hourly = @date.rrule_locator(@date.Hourly, byyearday=[1], byminute=[0], bysecond=[
    0,
  ])
  assert_eq(recurrence_dates(hourly, "2023-12-31T22:00", "2024-01-01T02:00"), [
    "2024-01-01 00:00:00", "2024-01-01 01:00:00", "2024-01-01 02:00:00",
  ])
}

///|
test "rrule week one follows all seven possible week starts" {
  let cases : Array[(Int32, Array[String])] = [
    (0, ["2024-01-01 00:00:00", "2024-12-30 00:00:00"]),
    (1, ["2024-01-08 00:00:00"]),
    (2, ["2024-01-08 00:00:00"]),
    (3, ["2024-01-08 00:00:00"]),
    (4, ["2024-01-01 00:00:00"]),
    (5, ["2024-01-01 00:00:00"]),
    (6, ["2024-01-01 00:00:00", "2024-12-30 00:00:00"]),
  ]
  for (wkst, expected) in cases {
    let locator = @date.rrule_locator(
      @date.Yearly,
      wkst~,
      byweekno=[1],
      byweekday=[0],
      byhour=[0],
      byminute=[0],
      bysecond=[0],
    )
    assert_eq(recurrence_dates(locator, "2024-01-01", "2024-12-31"), expected)
  }
}

///|
test "rrule negative week numbers use each year's week count" {
  let last_week = @date.rrule_locator(
    @date.Yearly,
    byweekno=[-1],
    byweekday=[0],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(last_week, "2019-12-01", "2021-01-10"), [
    "2019-12-23 00:00:00", "2020-12-28 00:00:00",
  ])
  let first_of_53 = @date.rrule_locator(
    @date.Yearly,
    byweekno=[-53],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(first_of_53, "2019-12-01", "2020-12-31"), [
    "2020-01-01 00:00:00", "2020-01-02 00:00:00", "2020-01-03 00:00:00", "2020-01-04 00:00:00",
    "2020-01-05 00:00:00",
  ])
  let impossible_monday = @date.rrule_locator(
    @date.Yearly,
    byweekno=[-53],
    byweekday=[0],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  let first = @date.datetime(2019, 12, 1).to_ordinal()
  let last = @date.datetime(2020, 12, 31).to_ordinal()
  // No Monday is in that partial first week: these are fallback endpoints.
  assert_eq(impossible_monday.tick_values(first, last), [first, last])
  assert_eq(impossible_monday.tick_values(last, first), [last, first])
}

///|
test "rrule weekly year masks stay fixed until the next recurrence period" {
  let cross_year = @date.rrule_locator(
    @date.Weekly,
    byweekno=[53],
    bysetpos=[-1],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(cross_year, "2020-12-31", "2021-01-05"), [
    "2021-01-03 00:00:00",
  ])
  let first_period = @date.rrule_locator(
    @date.Weekly,
    byweekno=[1],
    bysetpos=[2],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  // DTSTART is January 1, inside the week starting December 30.
  assert_eq(recurrence_dates(first_period, "2025-01-02", "2025-01-03"), [
    "2025-01-02 00:00:00",
  ])
}

///|
test "rrule Easter uses the Gregorian computation across supported years" {
  let locator = @date.rrule_locator(
    @date.Yearly,
    byeaster=[0],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  let cases = [
    ("0001-01-01", "0001-12-31", "0001-04-01 00:00:00"),
    ("0100-01-01", "0100-12-31", "0100-04-18 00:00:00"),
    ("1900-01-01", "1900-12-31", "1900-04-15 00:00:00"),
    ("2000-01-01", "2000-12-31", "2000-04-23 00:00:00"),
    ("2024-01-01", "2024-12-31", "2024-03-31 00:00:00"),
    ("9999-01-01", "9999-12-31", "9999-03-28 00:00:00"),
  ]
  for (first, last, expected) in cases {
    assert_eq(recurrence_dates(locator, first, last), [expected])
  }
}

///|
test "rrule extended selectors are copied before caller mutation" {
  let yeardays = [60, 1, 60]
  let weeks = [1, 1]
  let easter_offsets = [2, -2, 0, 2]
  let year_locator = @date.rrule_locator(@date.Yearly, byyearday=yeardays)
  let week_locator = @date.rrule_locator(@date.Yearly, byweekno=weeks)
  let easter_locator = @date.rrule_locator(
    @date.Yearly,
    byeaster=easter_offsets,
  )
  let locators = [year_locator, week_locator, easter_locator]
  let first = @date.datetime(2024, 1, 1).to_ordinal()
  let last = @date.datetime(2024, 12, 31).to_ordinal()
  let expected = locators.map(locator => locator.tick_values(first, last))
  assert_eq(yeardays, [60, 1, 60])
  assert_eq(weeks, [1, 1])
  assert_eq(easter_offsets, [2, -2, 0, 2])
  yeardays.fill(200)
  weeks.fill(20)
  easter_offsets.fill(10)
  for index, locator in locators {
    assert_eq(locator.tick_values(first, last), expected[index])
  }
}
