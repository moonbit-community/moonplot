///|
test "named hourly and minute locators retain independent major and minor binding" {
  let context = @date.DateParserContext::utc(clock=fn() { 1781524800123L })
  let major = @date.HourLocator::new(tz="UTC", context~)
  let minor = @date.MinuteLocator::new(byminute=[15, 45], tz="UTC", context~)
  let axis = @axis.axis()
  axis.set_date_locator(major.as_locator())
  axis.set_minor_date_locator(minor.as_locator())
  axis.set_minor_date_formatter(@date.AutoDateFormatter::new().as_formatter())
  let first = @date.datetime(2024, 1, 1).to_ordinal()
  let view = @core.limits(first, first + 2.0 / 24.0)
  let ticks = axis.minor_tick_values(view)
  assert_eq(axis.minor_tick_labels(ticks, view~), [
    "01 00:15", "01 00:45", "01 01:15", "01 01:45",
  ])
  minor.rule().set(byminute=[30])
  assert_eq(
    @date.format_date_ticks(axis.minor_tick_values(view), format="%H:%M"),
    ["00:30", "01:30"],
  )
  assert_eq(axis.date_locator().unwrap().unit_scale(), 1.0 / 24.0)
}
