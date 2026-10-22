///|
test "invalid default fails at the original consumer boundary and callbacks stay raw" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("UTC")
  let fixed = @date.date_formatter("%H:%M")
  let automatic = @date.AutoDateFormatter::new()
  let locator = @date.AutoDateLocator::new()
  @config.set_timezone("invalid/D12-zone")
  assert_eq(fixed.format_value(0.0), "00:00")
  assert_true(
    try {
      ignore(@date.num2date(0.0))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.date_formatter("%Y"))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.AutoDateFormatter::new())
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.day_locator())
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(automatic.format_value(0.0))
      false
    } catch {
      _ => true
    },
  )
  let concise = @date.concise_date_formatter()
  assert_true(
    try {
      ignore(concise.format_ticks([0.0]))
      false
    } catch {
      _ => true
    },
  )
  assert_eq(
    automatic
    .with_scaled([(1.0, @date.Func(fn(_, _) { "raw" }))])
    .format_value(0.0),
    "raw",
  )
  assert_true(!locator.tick_values(0.0, 2.0).is_empty())
  assert_eq(@date.date_formatter("%H:%M", tz="UTC").format_value(0.0), "00:00")
  assert_eq(
    @date.AutoDateFormatter::new(tz="UTC").format_value(0.0),
    "1970-01-01",
  )
  assert_eq(
    @date.concise_date_formatter(tz="UTC").format_data_short(0.0),
    "1970-01-01 00:00:00",
  )
  assert_eq(@date.day_locator(tz="UTC").tick_values(0.0, 2.0), [0.0, 1.0, 2.0])
  assert_eq(@date.num2date(0.0, offset_minutes=0).hour(), 0)
  assert_eq(
    @date.DateConverter::new()
    .axisinfo(unit=@date.fixed_timezone(0))
    .major_formatter()
    .format_value(0.0),
    "1970",
  )
}

///|
test "explicit named and typed timezone arguments conflict before numeric conversion" {
  let zone = @date.fixed_timezone(0)
  assert_true(
    try {
      ignore(@date.num2date(0.0, tz="UTC", timezone=zone))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.num2date(0.0, tz="UTC", offset_minutes=0))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.date_formatter("%Y", tz="UTC", timezone=zone))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.AutoDateFormatter::new(tz="UTC", timezone=zone))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.concise_date_formatter(tz="UTC", timezone=zone))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.hour_locator(tz="UTC", timezone=zone))
      false
    } catch {
      _ => true
    },
  )
}

///|
test "TZif registrations validate atomically and captured zones survive replacement" {
  let name = "D12/registered-zone"
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  defer @date.unregister_timezone(name)
  @date.register_timezone(name, tzif_fixed)
  @config.set_timezone(name)
  let captured = @date.date_formatter("%H:%M:%S %Z")
  assert_eq(captured.format_value(0.0), "00:09:21 LMT")
  assert_true(
    try {
      @date.register_timezone(name, b"invalid")
      false
    } catch {
      _ => true
    },
  )
  assert_eq(@date.get_timezone().initial_offset_seconds(), 561)
  @date.register_timezone(name, tzif_paris)
  assert_eq(captured.format_value(0.0), "00:09:21 LMT")
  assert_eq(
    @date.date_formatter("%H:%M:%S %Z").format_value(0.0),
    "01:00:00 CET",
  )
  @date.unregister_timezone(name)
  assert_true(
    try {
      ignore(@date.get_timezone())
      false
    } catch {
      _ => true
    },
  )
}

///|
test "legacy UTC helpers and typed dates stay independent of timezone rc" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("XST-5:45")
  assert_eq(@date.num2date(0.0).hour(), 5)
  assert_eq(@date.num2date(0.0).minute(), 45)
  assert_eq(@date.num2date(0.0, offset_seconds=0).hour(), 0)
  assert_eq(@date.from_ordinal(0.0).hour(), 0)
  assert_eq(@date.format_date_ticks([0.0], format="%H:%M"), ["00:00"])
  assert_eq(@date.auto_date_formatter(0.0, 0.1).format_value(0.0), "00:00")
  assert_eq(@date.datetime(1970, 1, 1).to_ordinal(), 0.0)
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock=fn() { 0L }),
  )
  assert_eq(parser.to_number("1970-01-01"), 0.0)
}
