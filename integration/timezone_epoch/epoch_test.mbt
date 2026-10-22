///|
test "timezone lookups constructors and early errors do not lock the date epoch" {
  @config.set_timezone("XST-5:45")
  defer @config.set_timezone("UTC")
  let zone = @date.get_timezone()
  let fixed = @date.date_formatter("%H:%M")
  let auto = @date.AutoDateFormatter::new()
  let concise = @date.concise_date_formatter()
  let locator = @date.day_locator()
  ignore(@date.DateConverter::new().axisinfo())
  @config.set_timezone("invalid/D12-zone")
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
      ignore(@date.num2date(0.0, tz="UTC", timezone=zone))
      false
    } catch {
      _ => true
    },
  )
  @date.set_epoch("2000-01-01T00:00:00")
  @config.set_timezone("UTC")
  assert_eq(@date.num2date(0.0).year(), 2000)
  assert_eq(zone.to_datetime(0.0).hour(), 5)
  assert_eq(fixed.format_value(0.0), "05:45")
  assert_eq(auto.format_value(0.0), "2000-01-01")
  assert_eq(concise.format_data_short(0.0), "2000-01-01 00:00:00")
  assert_true(!locator.tick_values(0.0, 2.0).is_empty())
}
