///|
test "checked named recurrence errors map to empty axis ticks and recover after set" {
  let locator = @date.MinuteLocator::new(
    byminute=[0],
    tz="UTC",
    context=@date.DateParserContext::utc(clock=fn() { 1781524800123L }),
  )
  let axis = @axis.axis()
  axis.set_date_locator(locator.as_locator())
  let first = @date.datetime(2024, 1, 1, hour=12)
  let last = @date.datetime(2024, 1, 1, hour=13)
  let view = @core.limits(first.to_ordinal(), last.to_ordinal())
  assert_eq(axis.tick_values(view).length(), 2)
  locator.rule().set(interval=1440, byhour=[13], count=2)
  assert_true(
    try {
      ignore(
        locator.tick_values(
          @date.RRuleDateTime::naive(first),
          @date.RRuleDateTime::naive(last),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_eq(axis.tick_values(view), [])
  locator.rule().set(byhour=[11])
  assert_eq(axis.tick_values(view), [first.to_ordinal(), last.to_ordinal()])
}
