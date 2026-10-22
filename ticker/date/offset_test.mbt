///|
test "fixed UTC offsets preserve instants through ISO and ordinal conversion" {
  let zoned = try! @date.parse_iso("1970-01-01T02:00:00.123456+02:00")
  assert_eq(zoned.offset_minutes(), 120)
  assert_eq(zoned.to_ordinal(), 0.0000014288888888888888)
  assert_eq(
    @date.format_date(zoned, "%Y-%m-%dT%H:%M:%S.%f %z %Z"),
    "1970-01-01T02:00:00.123456 +0200 UTC+02:00",
  )

  let from_utc = try! @date.num2date(0.0, offset_minutes=120)
  assert_eq(from_utc.year(), 1970)
  assert_eq(from_utc.day(), 1)
  assert_eq(from_utc.hour(), 2)
  assert_eq(from_utc.offset_minutes(), 120)
  assert_eq(from_utc.to_ordinal(), 0.0)

  let converted = try! zoned.with_offset(-480)
  assert_eq(converted.year(), 1969)
  assert_eq(converted.month(), 12)
  assert_eq(converted.day(), 31)
  assert_eq(converted.hour(), 16)
  assert_eq(converted.minute(), 0)
  assert_eq(converted.offset_minutes(), -480)
  assert_eq(converted.to_ordinal(), zoned.to_ordinal())

  assert_eq(
    @date.date_formatter("%H:%M %z").with_offset(120).format_value(0.0),
    "02:00 +0200",
  )
  let no_seconds = try! @date.parse_iso("1970-01-01T02:00+02:00")
  assert_eq(no_seconds.to_ordinal(), 0.0)
  let zulu = try! @date.parse_iso("1970-01-01T00:00:00Z")
  assert_eq(zulu.offset_minutes(), 0)
}

///|
test "fixed UTC offset parsing validates suffixes and bounds" {
  try @date.parse_iso("1970-01-01T00:00:00+24:00") catch {
    @date.DateError::InvalidFormat(message~) =>
      assert_true(message.contains("range"))
    _ => fail("expected offset range error")
  } noraise {
    _ => fail("expected offset range error")
  }
  try @date.parse_iso("1970-01-01T00:00:00+02:99") catch {
    @date.DateError::InvalidFormat(message~) =>
      assert_true(message.contains("range"))
    _ => fail("expected offset minute error")
  } noraise {
    _ => fail("expected offset minute error")
  }
  try @date.parse_iso("1970-01-01T00:00:00+2:00") catch {
    @date.DateError::InvalidFormat(message~) =>
      assert_true(message.contains("offset"))
    _ => fail("expected offset syntax error")
  } noraise {
    _ => fail("expected offset syntax error")
  }
  try @date.datetime(1970, 1, 1, offset_minutes=1440) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("offset_minutes"))
    _ => fail("expected datetime offset error")
  } noraise {
    _ => fail("expected datetime offset error")
  }
}

///|
test "with_offset preserves distant exact microseconds" {
  let value = try! @date.datetime(
    2243,
    10,
    17,
    hour=4,
    second=5,
    microsecond=123456,
    offset_minutes=120,
  )
  let converted = try! value.with_offset(-480)
  assert_eq(converted.year(), 2243)
  assert_eq(converted.month(), 10)
  assert_eq(converted.day(), 16)
  assert_eq(converted.hour(), 18)
  assert_eq(converted.second(), 5)
  assert_eq(converted.microsecond(), 123456)
  assert_eq(converted.to_ordinal(), value.to_ordinal())
}

///|
test "automatic ticks align fixed offset local midnights" {
  let start = try! @date.datetime(1970, 1, 1, offset_minutes=120).to_ordinal()
  let finish = try! @date.datetime(1970, 1, 3, offset_minutes=120).to_ordinal()
  let ticks = @date.date_tick_values(start, finish, count=4, offset_minutes=120)
  assert_eq(
    ticks.map(value => {
      let date = try! @date.num2date(value, offset_minutes=120)
      @date.format_date(date, "%Y-%m-%d %H:%M %z")
    }),
    [
      "1970-01-01 00:00 +0200", "1970-01-02 00:00 +0200", "1970-01-03 00:00 +0200",
    ],
  )
}

///|
test "microsecond locator keeps UTC phase under a fixed offset" {
  let start = try! @date.datetime(1970, 1, 1, microsecond=1, offset_minutes=120).to_ordinal()
  let finish = try! @date.datetime(
    1970,
    1,
    1,
    microsecond=30,
    offset_minutes=120,
  ).to_ordinal()
  let utc = try! @date.microsecond_locator(interval=7)
  let zoned = try! utc.with_offset(120)
  assert_eq(zoned.tick_values(start, finish), utc.tick_values(start, finish))
}

///|
test "date locators expand calendar boundaries in a fixed UTC offset" {
  let start = try! @date.datetime(1970, 1, 1, offset_minutes=120).to_ordinal()
  let finish = try! @date.datetime(1970, 3, 1, offset_minutes=120).to_ordinal()
  let locator = try! @date.month_locator().with_offset(120)
  let ticks = locator.tick_values(start, finish)
  assert_eq(
    ticks.map(value => {
      let date = try! @date.num2date(value, offset_minutes=120)
      @date.format_date(date, "%Y-%m-%d %H:%M %z")
    }),
    [
      "1970-01-01 00:00 +0200", "1970-02-01 00:00 +0200", "1970-03-01 00:00 +0200",
    ],
  )

  let micro_start = try! @date.datetime(
    1970,
    1,
    1,
    microsecond=100,
    offset_minutes=120,
  ).to_ordinal()
  let micro_finish = try! @date.datetime(
    1970,
    1,
    1,
    microsecond=1000,
    offset_minutes=120,
  ).to_ordinal()
  let micro_locator = try! @date.microsecond_locator(interval=250).with_offset(
    120,
  )
  assert_eq(
    micro_locator
    .tick_values(micro_start, micro_finish)
    .map(value => (try! @date.num2date(value, offset_minutes=120)).microsecond()),
    [0, 250, 500, 750, 1000, 1250],
  )
}
