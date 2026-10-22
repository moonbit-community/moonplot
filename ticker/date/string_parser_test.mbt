///|
test "string parser snapshots reference year and copies diagnostics independently" {
  let clock = Ref(1781524800000L)
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock=fn() { clock.val }),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.parse("01-01-76").year(), 1976)
  ignore(parser.parse("2024-01-01 10:00 BRST"))
  let copy = parser.copy()
  let warnings = parser.warnings()
  warnings.clear()
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
  ignore(parser.parse("2024-01-01 10:00 UTC"))
  assert_eq(parser.warnings(), [])
  assert_eq(copy.warnings(), [@date.UnknownTimezone("BRST")])
  clock.val = 2524608000000L
  assert_eq(parser.parse("01-01-76").year(), 1976)
  let later = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock=fn() { clock.val }),
  )
  assert_eq(later.parse("01-01-76").year(), 2076)
  let names = parser.local_names()
  names[0] = "changed"
  assert_eq(parser.local_names(), ["UTC", "UTC"])
}

///|
test "explicit parser defaults preserve components and rule timezone for unknown names" {
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock=fn() { 1781524800000L }),
  )
  let fallback = @date.datetime(
    2024,
    1,
    31,
    hour=23,
    minute=58,
    second=57,
    microsecond=123456,
  )
  let leap = parser.parse("Feb", default_date=fallback)
  assert_eq(
    @date.format_date(leap, "%Y-%m-%d %H:%M:%S.%f"),
    "2024-02-29 23:58:57.123456",
  )
  assert_true(
    try {
      ignore(parser.parse("Feb 31", default_date=fallback))
      false
    } catch {
      _ => true
    },
  )
  let rule = @date.tzif_timezone(tzif_new_york)
  let zoned = @date.datetime(2024, 1, 1, hour=12).with_timezone(rule)
  let unknown = parser.parse("2024-07-01 10:00 XYZ", default_date=zoned)
  assert_true(unknown.timezone() is Some(_))
  assert_eq(unknown.offset_seconds(), -14400)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("XYZ")])
  assert_true(
    try {
      ignore(parser.parse("Today is 2024-01-01"))
      false
    } catch {
      @date.DateError::InvalidDate(message~) =>
        message.contains("Today is 2024-01-01")
      _ => false
    },
  )
}

///|
test "clock is lazy for explicit defaults and empty operations and parser inputs are validated" {
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    calls.val += 1
    1781524800000L
  })
  assert_eq(calls.val, 0)
  let parser = @date.DateStringParser::new(context~)
  assert_eq(calls.val, 1)
  ignore(
    parser.to_number("2024-01-01", default_date=@date.datetime(2000, 1, 1)),
  )
  assert_eq(calls.val, 1)
  assert_eq(parser.to_numbers([]), [])
  assert_true(parser.parse_many([]).is_empty())
  assert_eq(calls.val, 1)
  ignore(parser.to_numbers(["10:00", "11:00"]))
  assert_eq(calls.val, 4)
  assert_true(
    try {
      ignore(@date.DateStringParser::new(context~, reference_year=0))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.DateParserContext::from_posix("not a zone"))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.DateParserContext::from_tzif(b"bad"))
      false
    } catch {
      _ => true
    },
  )
}

///|
test "local civil current date supplies a naive midnight rather than the clock offset" {
  let context = @date.DateParserContext::from_posix("XST-14", clock=fn() {
    1798718400000L
  })
  let parser = @date.DateStringParser::new(context~)
  assert_eq(parser.reference_year(), 2027)
  let value = parser.parse("10 am")
  assert_eq(
    @date.format_date(value, "%Y-%m-%d %H:%M %z"),
    "2027-01-01 10:00 +0000",
  )
  assert_eq(
    parser.to_number("10 am"),
    @date.datetime(2027, 1, 1, hour=10).to_ordinal(),
  )
}

///|
test "explicit local descriptors copy names validate offsets and defer the clock" {
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix(
    "IST-1GMT0,M10.5.0,M3.5.0",
    clock=fn() {
      calls.val += 1
      1781524800000L
    },
  )
  let names = ["IST", "GMT"]
  let configured = context.with_local_info(3600, 0, names)
  names[0] = "changed"
  assert_eq(calls.val, 0)
  let parser = @date.DateStringParser::new(context=configured)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  assert_true(
    try {
      ignore(context.with_local_info(86400, 0, ["a", "b"]))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(context.with_local_info(0, 0, ["a"]))
      false
    } catch {
      _ => true
    },
  )
}
