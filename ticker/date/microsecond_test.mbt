///|
test "date values preserve microseconds through ISO and ordinal conversion" {
  let value = try! @date.datetime(
    2024,
    2,
    29,
    hour=3,
    minute=4,
    second=5,
    microsecond=123456,
  )
  assert_eq(value.microsecond(), 123456)
  let round_trip = try! @date.from_ordinal(value.to_ordinal())
  assert_eq(round_trip.year(), 2024)
  assert_eq(round_trip.month(), 2)
  assert_eq(round_trip.day(), 29)
  assert_eq(round_trip.hour(), 3)
  assert_eq(round_trip.minute(), 4)
  assert_eq(round_trip.second(), 5)
  assert_eq(round_trip.microsecond(), 123456)

  let tenth = try! @date.parse_iso("2024-02-29T03:04:05.1")
  assert_eq(tenth.microsecond(), 100000)
  let exact = try! @date.parse_iso("2024-02-29T03:04:05.123456")
  assert_eq(exact.microsecond(), 123456)
  assert_eq(
    @date.format_date(tenth, "%Y-%m-%d %H:%M:%S.%f"),
    "2024-02-29 03:04:05.100000",
  )
  assert_eq(@date.format_date(exact, "%f"), "123456")
}

///|
test "microsecond locator matches midnight-relative multiple ticks" {
  let start = try! @date.datetime(1970, 1, 1, microsecond=100).to_ordinal()
  let finish = try! @date.datetime(1970, 1, 1, microsecond=1_000).to_ordinal()
  let locator = try! @date.microsecond_locator(interval=250)
  let ticks = locator.tick_values(start, finish)
  assert_eq(
    ticks.map(value => (try! @date.from_ordinal(value)).microsecond()),
    [0, 250, 500, 750, 1000, 1250],
  )

  assert_eq(
    locator
    .tick_values(start, start)
    .map(value => (try! @date.from_ordinal(value)).microsecond()),
    [0, 250],
  )

  let before_epoch = try! @date.datetime(
    1969,
    12,
    31,
    hour=23,
    minute=59,
    second=59,
    microsecond=999500,
  ).to_ordinal()
  let after_epoch = try! @date.datetime(1970, 1, 1, microsecond=500).to_ordinal()
  let reverse = locator.tick_values(after_epoch, before_epoch)
  assert_eq(
    reverse.map(value => {
      @date.format_date(@date.from_ordinal(value), "%Y-%m-%d %S.%f")
    }),
    [
      "1970-01-01 00.000750", "1970-01-01 00.000500", "1970-01-01 00.000250", "1970-01-01 00.000000",
      "1969-12-31 59.999750", "1969-12-31 59.999500", "1969-12-31 59.999250",
    ],
  )
}

///|
test "automatic date ticks select microsecond intervals" {
  let start = try! @date.datetime(1970, 1, 1, microsecond=100).to_ordinal()
  let finish = try! @date.datetime(1970, 1, 1, microsecond=1_000).to_ordinal()
  let ticks = @date.date_tick_values(start, finish, count=4)
  assert_eq(
    ticks.map(value => (try! @date.from_ordinal(value)).microsecond()),
    [0, 500, 1000, 1500],
  )
  assert_eq(@date.auto_date_formatter(start, finish).format(), "%H:%M:%S.%f")
}

///|
test "microsecond locators preserve midnight phase for indivisible intervals" {
  let start = try! @date.datetime(1970, 1, 2, microsecond=1).to_ordinal()
  let finish = try! @date.datetime(1970, 1, 2, microsecond=20).to_ordinal()
  let locator = try! @date.microsecond_locator(interval=7)
  let ticks = locator.tick_values(start, finish)
  assert_eq(
    ticks.map(value => (try! @date.from_ordinal(value)).microsecond()),
    [0, 7, 14, 21],
  )
}

///|
test "microsecond locators retain upstream float phases away from epoch" {
  let modern_start = try! @date.datetime(2024, 1, 2, microsecond=1).to_ordinal()
  let modern_finish = try! @date.datetime(2024, 1, 2, microsecond=20).to_ordinal()
  let locator = try! @date.microsecond_locator(interval=7)
  assert_eq(
    locator
    .tick_values(modern_start, modern_finish)
    .map(value => (try! @date.from_ordinal(value)).microsecond()),
    [0, 7, 14, 21],
  )

  let distant_start = try! @date.datetime(2243, 10, 17, microsecond=1).to_ordinal()
  let distant_finish = try! @date.datetime(2243, 10, 17, microsecond=20).to_ordinal()
  assert_eq(
    locator
    .tick_values(distant_start, distant_finish)
    .map(value => (try! @date.from_ordinal(value)).microsecond()),
    [0, 0, 20, 20],
  )
}

///|
test "ordinal conversion uses ties to even and distant 20 microsecond steps" {
  let half = 0.5 / 86_400_000_000.0
  assert_eq((try! @date.from_ordinal(half)).microsecond(), 0)
  assert_eq((try! @date.from_ordinal(1.5 / 86_400_000_000.0)).microsecond(), 2)

  let lower = try! @date.from_ordinal(100000.0000578702)
  assert_eq(lower.year(), 2243)
  assert_eq(lower.month(), 10)
  assert_eq(lower.day(), 17)
  assert_eq(lower.second(), 4)
  assert_eq(lower.microsecond(), 999980)
  let upper = try! @date.from_ordinal(100000.0000578703)
  assert_eq(upper.second(), 5)
  assert_eq(upper.microsecond(), 0)
}

///|
test "date microsecond validation rejects invalid precision" {
  try @date.datetime(2024, 1, 1, microsecond=-1) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("microsecond"))
    _ => fail("expected invalid microsecond")
  } noraise {
    _ => fail("expected invalid microsecond")
  }
  try @date.datetime(2024, 1, 1, microsecond=1_000_000) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("microsecond"))
    _ => fail("expected invalid microsecond")
  } noraise {
    _ => fail("expected invalid microsecond")
  }
  try @date.parse_iso("2024-01-01T00:00:00.1234567") catch {
    @date.DateError::InvalidFormat(message~) =>
      assert_true(message.contains("1..6"))
    _ => fail("expected fractional precision error")
  } noraise {
    _ => fail("expected fractional precision error")
  }
}
