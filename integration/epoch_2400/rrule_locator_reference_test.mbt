// Generated original RRuleLocator with custom epoch.

///|
fn verify_rrule_locator_epoch_reference() -> Unit raise {
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.datetime(2400, 1, 1)),
  )
  let locator = @date.RRuleLocator::new(wrapper, tz="UTC")
  assert_eq(
    locator.tick_values(
      @date.RRuleDateTime::naive(@date.datetime(2400, 1, 1)),
      @date.RRuleDateTime::naive(@date.datetime(2400, 1, 1, hour=2)),
    ),
    [0.0, 0.041666666666666664, 0.08333333333333333],
  )
  assert_eq(locator.as_locator().tick_values(0.0, 2.0 / 24.0), [
    0.0, 0.041666666666666664, 0.08333333333333333,
  ])
}
