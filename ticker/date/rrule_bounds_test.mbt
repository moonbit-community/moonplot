///|
test "rrule count starts at DTSTART and counts occurrences outside the view" {
  let locator = try! @date.rrule_locator(
    @date.RRuleFrequency::Daily,
    byhour=[0],
    byminute=[0],
    bysecond=[0],
    dtstart=@date.datetime(2024, 1, 1),
    count=3,
  )
  assert_eq(recurrence_dates(locator, "2024-01-02", "2024-01-10"), [
    "2024-01-02 00:00:00", "2024-01-03 00:00:00",
  ])
  assert_eq(recurrence_dates(locator, "2023-12-01", "2024-01-01"), [
    "2024-01-01 00:00:00",
  ])
}

///|
test "rrule until is inclusive and filters candidates after DTSTART" {
  let locator = try! @date.rrule_locator(
    @date.RRuleFrequency::Monthly,
    bymonthday=[1],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
    dtstart=@date.datetime(2024, 1, 15),
    until=@date.datetime(2024, 3, 1),
  )
  assert_eq(recurrence_dates(locator, "2024-01-01", "2024-04-01"), [
    "2024-02-01 00:00:00", "2024-03-01 00:00:00",
  ])
}

///|
test "rrule bounds work for dense clock frequencies" {
  let locator = try! @date.rrule_locator(
    @date.RRuleFrequency::Secondly,
    interval=2,
    dtstart=@date.datetime(2024, 1, 1, second=1),
    count=3,
  )
  assert_eq(
    recurrence_dates(locator, "2024-01-01T00:00:00", "2024-01-01T00:00:10"),
    ["2024-01-01 00:00:01", "2024-01-01 00:00:03", "2024-01-01 00:00:05"],
  )
}

///|
test "rrule bounds survive a copied fixed offset" {
  let locator = try! @date.rrule_locator(
    @date.RRuleFrequency::Daily,
    byhour=[0],
    dtstart=@date.datetime(2024, 1, 1, offset_minutes=120),
    count=2,
  ).with_offset(-480)
  let first = @date.datetime(2023, 12, 31, offset_minutes=-480).to_ordinal()
  let last = @date.datetime(2024, 1, 3, offset_minutes=-480).to_ordinal()
  let ticks = locator.tick_values(first, last)
  assert_eq(
    ticks.map(value => {
      @date.format_date(
        @date.from_ordinal(value, offset_minutes=-480),
        "%Y-%m-%d %H:%M:%S",
      )
    }),
    ["2024-01-01 00:00:00", "2024-01-02 00:00:00"],
  )
}

///|
test "rrule count rejects nonpositive values" {
  try @date.rrule_locator(@date.RRuleFrequency::Daily, count=0) catch {
    @date.DateError::InvalidDate(_) => ()
    _ => fail("expected invalid count")
  } noraise {
    _ => fail("expected invalid count")
  }
}
