///|
test "minor wrapper locator remains live through copied axis configuration" {
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.datetime(2024, 1, 1)),
  )
  let axis = @axis.axis()
  axis.set_date_locator(@date.hour_locator())
  axis.set_minor_date_locator(@date.RRuleLocator::new(wrapper).as_locator())
  axis.set_minor_date_formatter(@date.AutoDateFormatter::new().as_formatter())
  let first = @date.datetime(2024, 1, 1).to_ordinal()
  let view = @core.limits(first, first + 2.0 / 24.0)
  assert_eq(axis.minor_tick_values(view), [])
  wrapper.set(frequency=@date.Minutely, interval=30)
  let ticks = axis.minor_tick_values(view)
  assert_eq(@date.format_date_ticks(ticks, format="%H:%M"), ["00:30", "01:30"])
  assert_eq(axis.minor_tick_labels(ticks, view~), ["01 00:30", "01 01:30"])
  assert_eq(axis.minor_date_locator().unwrap().unit_scale(), 1.0 / 1440.0)
  axis.set_date_offset(180)
  assert_eq(axis.minor_date_locator().unwrap().offset_minutes(), 180)
  assert_eq(wrapper.base_timezone() is None, true)
}
