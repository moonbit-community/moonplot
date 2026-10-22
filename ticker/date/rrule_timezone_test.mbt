///|
test "recurrence until and inactive transitions preserve inferred phase" {
  let first = @date.datetime(2024, 1, 2, hour=5).to_ordinal()
  let last = @date.datetime(2024, 1, 2, hour=7).to_ordinal()
  let until = @date.datetime(2024, 1, 2, hour=6, minute=5)
  let rule = @date.rrule_locator(@date.Minutely, interval=7, bysecond=[0])
  let expected = rule.with_offset(-300).tick_values(first, last)
  let limited = @date.rrule_locator(
    @date.Minutely,
    interval=7,
    bysecond=[0],
    until~,
  )
  assert_eq(
    limited.with_offset(-300).tick_values(first, last),
    expected.filter(value => value <= until.to_ordinal()),
  )
  let zone = locator_eastern_zone()
  assert_eq(rule.with_timezone(zone).tick_values(first, last), expected)
  assert_eq(
    limited.with_timezone(zone).tick_values(first, last),
    expected.filter(value => value <= until.to_ordinal()),
  )
}

///|
test "transition recurrence inherits local DTSTART and skips gaps before count" {
  let start = @date.datetime(2024, 3, 9, hour=7)
  let until = @date.datetime(2024, 3, 12, hour=6)
  let rule = @date.rrule(@date.Daily, start, count=3, until~).with_timezone(
    locator_eastern_zone(),
  )
  assert_eq(rrule_object_dates(rule.all()), [
    "2024-03-09 02:00:00 -0500", "2024-03-11 02:00:00 -0400", "2024-03-12 02:00:00 -0400",
  ])
  assert_eq(
    rrule_object_dates(
      rule.between(@date.datetime(2024, 3, 10), until, inc=true),
    ),
    ["2024-03-11 02:00:00 -0400", "2024-03-12 02:00:00 -0400"],
  )
  let fixed = rule.with_offset(0)
  assert_true(fixed.locator().timezone() is None)
  assert_eq(fixed.dtstart().to_ordinal(), start.to_ordinal())
  assert_eq(
    fixed.until().map(value => value.to_ordinal()),
    Some(until.to_ordinal()),
  )
  assert_eq(rrule_object_dates(fixed.all()), [
    "2024-03-09 07:00:00 +0000", "2024-03-10 07:00:00 +0000", "2024-03-11 07:00:00 +0000",
  ])
}

///|
test "transition recurrence queries follow UTC through a repeated hour" {
  let rule = @date.rrule(
    @date.Minutely,
    @date.datetime(2024, 11, 3, hour=5),
    interval=30,
    until=@date.datetime(2024, 11, 3, hour=6, minute=30),
  ).with_timezone(locator_eastern_zone())
  let first_half = @date.datetime(2024, 11, 3, hour=5, minute=30)
  let second_hour = @date.datetime(2024, 11, 3, hour=6)
  assert_eq(rrule_object_dates(rule.all()), [
    "2024-11-03 01:00:00 -0400", "2024-11-03 01:30:00 -0400", "2024-11-03 01:00:00 -0500",
    "2024-11-03 01:30:00 -0500",
  ])
  assert_eq(
    rrule_object_one_text(rule.before(second_hour)),
    "2024-11-03 01:30:00 -0400",
  )
  assert_eq(
    rrule_object_one_text(rule.before(second_hour, inc=true)),
    "2024-11-03 01:00:00 -0500",
  )
  assert_eq(
    rrule_object_one_text(rule.after(first_half)),
    "2024-11-03 01:00:00 -0500",
  )
  assert_eq(
    rrule_object_one_text(rule.after(first_half, inc=true)),
    "2024-11-03 01:30:00 -0400",
  )
  assert_eq(rrule_object_dates(rule.xafter(first_half, count=2)), [
    "2024-11-03 01:00:00 -0500", "2024-11-03 01:30:00 -0500",
  ])
  assert_eq(
    rrule_object_dates(rule.between(first_half, second_hour, inc=true)),
    ["2024-11-03 01:30:00 -0400", "2024-11-03 01:00:00 -0500"],
  )
  assert_true(rule.between(second_hour, first_half).is_empty())
  assert_true(rule.after(@date.datetime(2024, 11, 3, hour=7)) is None)
}

///|
test "transition recurrence includes a fold across midnight" {
  let zone = @date.timezone(120, transitions=[
    @date.timezone_transition(@date.datetime(2024, 1, 2), -120),
  ])
  let rule = @date.rrule(
    @date.Minutely,
    @date.datetime(2024, 1, 1),
    interval=30,
  ).with_timezone(zone)
  let first = @date.datetime(2024, 1, 1, hour=23, minute=30)
  let last = @date.datetime(2024, 1, 2, minute=30)
  let values = rule.between(first, last, inc=true)
  assert_eq(rrule_object_dates(values), [
    "2024-01-02 01:30:00 +0200", "2024-01-01 22:00:00 -0200", "2024-01-01 22:30:00 -0200",
  ])
  let ordinals = values.map(value => value.to_ordinal())
  assert_eq(
    rule.locator().tick_values(last.to_ordinal(), first.to_ordinal()),
    ordinals.rev(),
  )
}

///|
test "transition recurrence selects BYSETPOS in local periods before expansion" {
  let zone = locator_eastern_zone()
  let gap = @date.rrule(
    @date.Daily,
    @date.datetime(2024, 3, 9, hour=5),
    byhour=[1, 2, 3],
    bysetpos=[2],
    count=2,
  ).with_timezone(zone)
  assert_eq(rrule_object_dates(gap.all()), [
    "2024-03-09 02:00:00 -0500", "2024-03-11 02:00:00 -0400",
  ])
  let fold = @date.rrule(
    @date.Daily,
    @date.datetime(2024, 11, 3, hour=4),
    byhour=[1],
    byminute=[0, 30],
    bysetpos=[-1],
    count=2,
  ).with_timezone(zone)
  assert_eq(rrule_object_dates(fold.all()), [
    "2024-11-03 01:30:00 -0400", "2024-11-03 01:30:00 -0500",
  ])
}
