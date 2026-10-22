///|
fn rruleset_text(values : Array[@date.DateTime]) -> Array[String] {
  values.map(value => @date.format_date(value, "%Y-%m-%d %H:%M:%S %z"))
}

///|
test "rruleset merges rules and applies date and rule exclusions" {
  let first = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 1, 1),
    byhour=[0],
    count=4,
  )
  let second = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 1, 3),
    byhour=[0],
    count=3,
  )
  let excluded = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 1, 4),
    byhour=[0],
    count=1,
  )
  let set = @date.rruleset()
  set.rrule(first)
  set.rrule(second)
  set.rdate(@date.datetime(2024, 1, 7))
  set.exdate(@date.datetime(2024, 1, 2))
  set.exrule(excluded)
  assert_eq(
    rruleset_text(
      try! set.between(
        @date.datetime(2024, 1, 1),
        @date.datetime(2024, 1, 10),
        inc=true,
      ),
    ),
    [
      "2024-01-01 00:00:00 +0000", "2024-01-03 00:00:00 +0000", "2024-01-05 00:00:00 +0000",
      "2024-01-07 00:00:00 +0000",
    ],
  )
}

///|
test "rruleset after before and xafter skip excluded candidates" {
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 1, 1),
    byhour=[0],
    count=5,
  )
  let set = @date.rruleset()
  set.rrule(rule)
  set.exdate(@date.datetime(2024, 1, 2))
  set.exdate(@date.datetime(2024, 1, 4))
  let middle = @date.datetime(2024, 1, 1)
  assert_eq(rruleset_text([try! set.after(middle, inc=true).unwrap()]), [
    "2024-01-01 00:00:00 +0000",
  ])
  assert_eq(
    rruleset_text([
      try! set.before(@date.datetime(2024, 1, 5), inc=true).unwrap(),
    ]),
    ["2024-01-05 00:00:00 +0000"],
  )
  assert_eq(rruleset_text(try! set.xafter(middle, count=4, inc=true)), [
    "2024-01-01 00:00:00 +0000", "2024-01-03 00:00:00 +0000", "2024-01-05 00:00:00 +0000",
  ])
}

///|
test "rruleset deduplicates equal UTC instants with different offsets" {
  let set = @date.rruleset()
  set.rdate(@date.datetime(2024, 1, 1, hour=0))
  set.rdate(@date.datetime(2024, 1, 1, hour=1, offset_minutes=60))
  set.exdate(@date.datetime(2024, 1, 1, hour=0))
  assert_eq(
    rruleset_text(
      try! set.between(
        @date.datetime(2023, 12, 31),
        @date.datetime(2024, 1, 2),
        inc=true,
      ),
    ),
    [],
  )
}

///|
test "rruleset keeps the two instants in a daylight-saving fold distinct" {
  let zone = locator_eastern_zone()
  let rule = try! @date.rrule(
    @date.RRuleFrequency::Daily,
    @date.datetime(2024, 11, 2, hour=1, minute=30, offset_minutes=-240),
    byhour=[1],
    byminute=[30],
    bysecond=[0],
    count=4,
  ).with_timezone(zone)
  let set = @date.rruleset()
  set.rrule(rule)
  set.exdate(
    @date.datetime(2024, 11, 3, hour=1, minute=30, offset_minutes=-300),
  )
  assert_eq(rruleset_text(try! set.all()), [
    "2024-11-02 01:30:00 -0400", "2024-11-03 01:30:00 -0400", "2024-11-04 01:30:00 -0500",
  ])
}

///|
test "rruleset preserves explicit microseconds at distant dates" {
  let set = @date.rruleset()
  set.rdate(@date.datetime(9000, 1, 1, microsecond=1))
  set.rdate(@date.datetime(9000, 1, 1, microsecond=2))
  let values = try! set.xafter(@date.datetime(9000, 1, 1), count=2, inc=true)
  assert_eq(values.map(value => value.microsecond()), [1, 2])
}

///|
test "rruleset all handles explicit dates without an inclusive rule" {
  let set = @date.rruleset()
  set.rdate(@date.datetime(2024, 2, 1))
  set.rdate(@date.datetime(2024, 1, 1))
  set.exdate(@date.datetime(2024, 2, 1))
  assert_eq(rruleset_text(try! set.all()), ["2024-01-01 00:00:00 +0000"])
}
