///|
fn rrule_object_dates(values : Array[@date.DateTime]) -> Array[String] {
  values.map(value => @date.format_date(value, "%Y-%m-%d %H:%M:%S %z"))
}

///|
fn rrule_object_one_text(value : @date.DateTime?) -> String {
  match value {
    Some(result) => @date.format_date(result, "%Y-%m-%d %H:%M:%S %z")
    None => ""
  }
}

///|
test "rrule object between returns only matching occurrences" {
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Monthly,
    @date.datetime(2024, 1, 1),
    byweekday=[0, 1, 2, 3, 4],
    bysetpos=[-1],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  let values = try! rule.between(
    @date.datetime(2024, 1, 1),
    @date.datetime(2024, 4, 30),
  )
  assert_eq(rrule_object_dates(values), [
    "2024-01-31 00:00:00 +0000", "2024-02-29 00:00:00 +0000", "2024-03-29 00:00:00 +0000",
  ])
}

///|
test "rrule object count is consumed outside between bounds" {
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 1, 1),
    byhour=[0],
    byminute=[0],
    bysecond=[0],
    count=3,
  )
  let values = try! rule.between(
    @date.datetime(2024, 1, 2),
    @date.datetime(2024, 1, 10),
  )
  assert_eq(rrule_object_dates(values), ["2024-01-03 00:00:00 +0000"])
  assert_eq(rule.count(), Some(3))
}

///|
test "rrule object until includes the exact boundary" {
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 1, 1),
    byhour=[0],
    until=@date.datetime(2024, 1, 3),
  )
  let values = try! rule.all()
  assert_eq(rrule_object_dates(values), [
    "2024-01-01 00:00:00 +0000", "2024-01-02 00:00:00 +0000", "2024-01-03 00:00:00 +0000",
  ])
  assert_eq(rule.until().map(value => value.day()), Some(3))
}

///|
test "rrule object bysetpos is applied inside each period" {
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Monthly,
    @date.datetime(2024, 1, 1),
    byweekday=[0, 1, 2, 3, 4, 5, 6],
    bysetpos=[2],
    byhour=[0],
    byminute=[0],
    bysecond=[0],
  )
  let values = try! rule.between(
    @date.datetime(2024, 1, 1),
    @date.datetime(2024, 3, 31),
    inc=true,
  )
  assert_eq(rrule_object_dates(values), [
    "2024-01-02 00:00:00 +0000", "2024-02-02 00:00:00 +0000", "2024-03-02 00:00:00 +0000",
  ])
}

///|
test "rrule object after and before honor inclusive boundaries" {
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 1, 1),
    byhour=[0],
  )
  let middle = @date.datetime(2024, 1, 2)
  assert_eq([rrule_object_one_text(try! rule.after(middle))], [
    "2024-01-03 00:00:00 +0000",
  ])
  assert_eq([rrule_object_one_text(try! rule.after(middle, inc=true))], [
    "2024-01-02 00:00:00 +0000",
  ])
  assert_eq([rrule_object_one_text(try! rule.before(middle))], [
    "2024-01-01 00:00:00 +0000",
  ])
  assert_eq([rrule_object_one_text(try! rule.before(middle, inc=true))], [
    "2024-01-02 00:00:00 +0000",
  ])
}

///|
test "rrule object xafter returns a bounded eager sequence" {
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 1, 1),
    byhour=[0],
  )
  let values = try! rule.xafter(@date.datetime(2024, 1, 2), count=2, inc=true)
  assert_eq(rrule_object_dates(values), [
    "2024-01-02 00:00:00 +0000", "2024-01-03 00:00:00 +0000",
  ])
}

///|
test "rrule object preserves fixed offsets" {
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 1, 1, offset_minutes=120),
    byhour=[0],
    count=2,
  )
  let values = try! rule.all()
  assert_eq(rrule_object_dates(values), [
    "2024-01-01 00:00:00 +0200", "2024-01-02 00:00:00 +0200",
  ])
  assert_eq(rule.locator().offset_minutes(), 120)
}

///|
test "rrule object preserves an explicit transition timezone" {
  let zone = locator_eastern_zone()
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 11, 2, hour=1, offset_minutes=-240),
    byhour=[1],
    byminute=[0],
    bysecond=[0],
    count=4,
  ).with_timezone(zone)
  assert_eq(rrule_object_dates(try! rule.all()), [
    "2024-11-02 01:00:00 -0400", "2024-11-03 01:00:00 -0400", "2024-11-03 01:00:00 -0500",
    "2024-11-04 01:00:00 -0500",
  ])
}

///|
test "rrule transition fold orders minute candidates before count" {
  let zone = locator_eastern_zone()
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 11, 2, hour=1, offset_minutes=-240),
    byhour=[1],
    byminute=[0, 30],
    bysecond=[0],
    count=4,
  ).with_timezone(zone)
  assert_eq(rrule_object_dates(try! rule.all()), [
    "2024-11-02 01:00:00 -0400", "2024-11-02 01:30:00 -0400", "2024-11-03 01:00:00 -0400",
    "2024-11-03 01:30:00 -0400",
  ])
}

///|
test "rrule transition fold applies until in UTC order" {
  let zone = locator_eastern_zone()
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 11, 2, hour=1, offset_minutes=-240),
    byhour=[1],
    byminute=[0, 30],
    bysecond=[0],
    until=@date.datetime(2024, 11, 3, hour=5, minute=45),
  ).with_timezone(zone)
  assert_eq(rrule_object_dates(try! rule.all()), [
    "2024-11-02 01:00:00 -0400", "2024-11-02 01:30:00 -0400", "2024-11-03 01:00:00 -0400",
    "2024-11-03 01:30:00 -0400",
  ])
}

///|
test "rrule transition query keeps UTC DateTime instants" {
  let zone = locator_eastern_zone()
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 11, 3, hour=5, minute=30),
    byhour=[1],
    byminute=[30],
    bysecond=[0],
    count=1,
  ).with_timezone(zone)
  let values = try! rule.between(
    @date.datetime(2024, 11, 3, hour=5, minute=29),
    @date.datetime(2024, 11, 3, hour=5, minute=31),
    inc=true,
  )
  assert_eq(rrule_object_dates(values), ["2024-11-03 01:30:00 -0400"])
}

///|
test "rrule transition query covers a reversed local fold window" {
  let zone = locator_eastern_zone()
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Minutely,
    @date.datetime(2024, 11, 2, hour=1, offset_minutes=-240),
    byhour=[1],
    byminute=[0],
    bysecond=[0],
  ).with_timezone(zone)
  let values = try! rule.between(
    @date.datetime(2024, 11, 3, hour=5, minute=45),
    @date.datetime(2024, 11, 3, hour=6, minute=15),
    inc=true,
  )
  assert_eq(rrule_object_dates(values), ["2024-11-03 01:00:00 -0500"])
}

///|
test "rrule replace keeps transition timezone and with_offset clears it" {
  let zone = locator_eastern_zone()
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 11, 2, hour=1, offset_minutes=-240),
    byhour=[1],
    byminute=[0],
    bysecond=[0],
    count=3,
  ).with_timezone(zone)
  let replaced = try! rule.replace(interval=2)
  assert_eq(rrule_object_dates(try! replaced.all()), [
    "2024-11-02 01:00:00 -0400", "2024-11-04 01:00:00 -0500", "2024-11-06 01:00:00 -0500",
  ])
  let fixed = try! rule.with_offset(0)
  assert_eq(fixed.locator().offset_minutes(), 0)
}

///|
test "rrule replace rebuilds a rule while preserving omitted fields" {
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 1, 1),
    count=3,
  )
  let replaced = try! rule.replace(interval=2, count=3)
  match replaced.frequency() {
    @date.RRuleFrequency::Daily => ()
    _ => fail("expected daily replacement frequency")
  }
  assert_eq(replaced.interval(), 2)
  assert_eq(replaced.dtstart().day(), 1)
  assert_eq(rrule_object_dates(try! rule.all()), [
    "2024-01-01 00:00:00 +0000", "2024-01-02 00:00:00 +0000", "2024-01-03 00:00:00 +0000",
  ])
  assert_eq(rrule_object_dates(try! replaced.all()), [
    "2024-01-01 00:00:00 +0000", "2024-01-03 00:00:00 +0000", "2024-01-05 00:00:00 +0000",
  ])
}

///|
test "rrule replace copies selector arrays and validates replacements" {
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Monthly,
    @date.datetime(2024, 1, 1),
    bymonth=[1, 3],
    bymonthday=[1],
  )
  let months = [2]
  let replaced = try! rule.replace(bymonth=months)
  months[0] = 4
  assert_eq(
    rrule_object_dates(
      try! replaced.between(
        @date.datetime(2024, 1, 1),
        @date.datetime(2024, 5, 1),
        inc=true,
      ),
    ),
    ["2024-02-01 00:00:00 +0000"],
  )
  try rule.replace(interval=0) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("interval"))
    _ => fail("expected an invalid replacement interval")
  } noraise {
    _ => fail("expected an invalid replacement interval")
  }
}

///|
test "rrule replace can clear selectors explicitly" {
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Monthly,
    @date.datetime(2024, 1, 1),
    bymonth=[1, 3],
    bymonthday=[1],
  )
  let cleared = try! rule.replace(clear=["bymonth"])
  assert_eq(
    rrule_object_dates(
      try! cleared.between(
        @date.datetime(2024, 1, 1),
        @date.datetime(2024, 5, 1),
        inc=true,
      ),
    ),
    [
      "2024-01-01 00:00:00 +0000", "2024-02-01 00:00:00 +0000", "2024-03-01 00:00:00 +0000",
      "2024-04-01 00:00:00 +0000", "2024-05-01 00:00:00 +0000",
    ],
  )
  let replaced = try! rule.replace(clear=["bymonth"], bymonth=[2])
  assert_eq(
    rrule_object_dates(
      try! replaced.between(
        @date.datetime(2024, 1, 1),
        @date.datetime(2024, 5, 1),
        inc=true,
      ),
    ),
    ["2024-02-01 00:00:00 +0000"],
  )
  try rule.replace(clear=["missing"]) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("unknown"))
    _ => fail("expected an unknown selector error")
  } noraise {
    _ => fail("expected an unknown selector error")
  }
}

///|
test "rrule object empty between does not return query endpoints" {
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Monthly,
    @date.datetime(2024, 1, 1),
    bymonth=[2],
    bymonthday=[29],
    byhour=[0],
  )
  let values = try! rule.between(
    @date.datetime(2023, 1, 1),
    @date.datetime(2023, 12, 31),
    inc=true,
  )
  assert_eq(values.length(), 0)
}
