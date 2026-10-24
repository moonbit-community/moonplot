///|
test "microsecond construction metadata and aware UTC preflight preserve unselected epoch" {
  @config.set_timezone("invalid/D19-zone")
  defer @config.set_timezone("UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    timezone=@date.fixed_timezone(0),
    context~,
  )
  assert_eq(locator.as_locator().copy().with_offset(345).interval_value(), 0.5)
  assert_true(
    try {
      ignore(@date.MicrosecondLocator::new(interval=0.0))
      false
    } catch {
      @date.DateError::InvalidDate(message~) => message.contains("timezone")
      _ => false
    },
  )
  let overflow = @date.RRuleDateTime::aware(
    @date.datetime(1, 1, 1, offset_minutes=1380),
  )
  let valid = @date.RRuleDateTime::naive(@date.datetime(2024, 1, 1))
  assert_true(
    try {
      ignore(locator.tick_values(overflow, valid))
      false
    } catch {
      _ => true
    },
  )
  assert_eq(calls.val, 0)
  @date.set_epoch("2000-01-01T00:00:00.123456")
  assert_eq(@date.get_epoch(), "2000-01-01T00:00:00.123456")
}
