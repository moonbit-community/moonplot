// Generated fixed YearLocator and automatic year branch with custom epoch.

///|
fn verify_year_locator_epoch_reference() -> Unit raise {
  let context = @date.DateParserContext::utc(clock=fn() { 1781524800123L })
  let locator = @date.YearLocator::new(base=5, tz="UTC", context~)
  assert_eq(
    locator.tick_values(
      @date.RRuleDateTime::naive(@date.datetime(2400, 1, 1, microsecond=123456)),
      @date.RRuleDateTime::naive(@date.datetime(2412, 1, 10)),
    ),
    [1827.0, 3653.0, 5479.0],
  )
  let auto = @date.AutoDateLocator::new(tz="UTC", context~)
  let values = auto.tick_values(0.0, 4392.0)
  assert_eq(values, [0.0, 731.0, 1461.0, 2192.0, 2922.0, 3653.0, 4383.0])
  assert_eq(auto.frequency(), @date.Year)
  assert_eq(auto.as_locator().tick_values(4392.0, 0.0), values.rev())
}
