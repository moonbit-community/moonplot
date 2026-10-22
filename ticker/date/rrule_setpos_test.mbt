///|
test "rrule bysetpos uses complete months before clipping to the view" {
  let locator = @date.rrule_locator(
    @date.Monthly,
    byweekday=[0, 1, 2, 3, 4],
    bysetpos=[-1],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  assert_eq(recurrence_dates(locator, "2024-01-15", "2024-03-15"), [
    "2024-01-31 00:00:00", "2024-02-29 00:00:00",
  ])
}

///|
test "rrule first weekly bysetpos starts at DTSTART rather than WKST" {
  let locator = @date.rrule_locator(
    @date.Weekly,
    byweekday=[0, 1, 2, 3, 4, 5, 6],
    bysetpos=[2],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  // DTSTART is Wednesday January 3; its second candidate is Thursday.
  assert_eq(recurrence_dates(locator, "2024-01-04", "2024-01-05"), [
    "2024-01-04 00:00:00",
  ])
}

///|
test "rrule bysetpos selects the date and clock Cartesian product" {
  let locator = @date.rrule_locator(
    @date.Monthly,
    bymonthday=[1, -1],
    byhour=[9, 17],
    byminute=[0, 30],
    bysecond=[0],
    bysetpos=[-1, 1, 2, -2, 2, 366, -366],
  )
  assert_eq(recurrence_dates(locator, "2024-01-01T09:15", "2024-02-29T17:15"), [
    "2024-01-01 09:30:00", "2024-01-31 17:00:00", "2024-01-31 17:30:00", "2024-02-01 09:00:00",
    "2024-02-01 09:30:00", "2024-02-29 17:00:00",
  ])
}

///|
test "rrule hourly bysetpos precedes clipping and deduplicates positions" {
  let locator = @date.rrule_locator(
    @date.Hourly,
    byminute=[0, 30],
    bysecond=[0, 30],
    bysetpos=[-1, 1, 1],
  )
  assert_eq(recurrence_dates(locator, "2024-01-01T00:15", "2024-01-01T02:15"), [
    "2024-01-01 00:30:30", "2024-01-01 01:00:00", "2024-01-01 01:30:30", "2024-01-01 02:00:00",
  ])
}
