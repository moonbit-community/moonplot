///|
test "date formatter offset copies retain the original configuration" {
  let utc = @date.date_formatter("%Y-%m-%d %H:%M %z %Z")
  let east = utc.with_offset(345)
  let west = east.with_offset(-210)
  assert_eq(utc.offset_minutes(), 0)
  assert_eq(east.offset_minutes(), 345)
  assert_eq(west.offset_minutes(), -210)
  assert_eq(utc.format(), east.format())
  assert_eq(utc.format_value(0.0), "1970-01-01 00:00 +0000 UTC")
  assert_eq(east.format_value(0.0), "1970-01-01 05:45 +0545 UTC+05:45")
  assert_eq(west.format_value(0.0), "1969-12-31 20:30 -0330 UTC-03:30")
  assert_eq(
    @date.auto_date_formatter(0.0, 1.0).with_offset(345).offset_minutes(),
    345,
  )
}

///|
test "date offset entry points reject offsets of a day or more" {
  let formatter = @date.date_formatter("%z")
  let locator = @date.day_locator()
  for offset in [-2147483647 - 1, -1440, 1440, 2147483647] {
    try formatter.with_offset(offset) catch {
      @date.DateError::InvalidDate(_) => ()
      _ => fail("expected formatter offset validation")
    } noraise {
      _ => fail("expected formatter offset validation")
    }
    try locator.with_offset(offset) catch {
      @date.DateError::InvalidDate(_) => ()
      _ => fail("expected locator offset validation")
    } noraise {
      _ => fail("expected locator offset validation")
    }
    assert_eq(@date.format_date_ticks([0.0], offset_minutes=offset), [])
    assert_eq(@date.date_tick_values(0.0, 1.0, offset_minutes=offset), [])
  }
  assert_eq(formatter.with_offset(1439).format_value(0.0), "+2359")
  assert_eq(formatter.with_offset(-1439).format_value(0.0), "-2359")
}
