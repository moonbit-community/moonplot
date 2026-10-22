// Generated six original named locators with custom epoch.

///|
fn verify_named_locator_epoch_reference() -> Unit raise {
  let context = @date.DateParserContext::utc(clock=fn() { 1781524800123L })
  let month = @date.MonthLocator::new(tz="UTC", context~)
  assert_eq(
    month.tick_values(
      @date.RRuleDateTime::naive(
        @date.datetime(
          2400,
          1,
          1,
          hour=0,
          minute=0,
          second=0,
          microsecond=123456,
        ),
      ),
      @date.RRuleDateTime::naive(
        @date.datetime(
          2400,
          4,
          10,
          hour=0,
          minute=0,
          second=0,
          microsecond=123456,
        ),
      ),
    ),
    [31.0, 60.0, 91.0],
  )
  assert_eq(month.as_locator().tick_values(100.0, 0.0), [91.0, 60.0, 31.0, 0.0])
  let weekday = @date.WeekdayLocator::new(tz="UTC", context~)
  assert_eq(
    weekday.tick_values(
      @date.RRuleDateTime::naive(
        @date.datetime(
          2400,
          1,
          1,
          hour=0,
          minute=0,
          second=0,
          microsecond=123456,
        ),
      ),
      @date.RRuleDateTime::naive(
        @date.datetime(
          2400,
          1,
          22,
          hour=0,
          minute=0,
          second=0,
          microsecond=123456,
        ),
      ),
    ),
    [3.0, 10.0, 17.0],
  )
  assert_eq(weekday.as_locator().tick_values(21.0, 0.0), [17.0, 10.0, 3.0])
  let day = @date.DayLocator::new(tz="UTC", context~)
  assert_eq(
    day.tick_values(
      @date.RRuleDateTime::naive(
        @date.datetime(
          2400,
          1,
          1,
          hour=0,
          minute=0,
          second=0,
          microsecond=123456,
        ),
      ),
      @date.RRuleDateTime::naive(
        @date.datetime(
          2400,
          1,
          11,
          hour=0,
          minute=0,
          second=0,
          microsecond=123456,
        ),
      ),
    ),
    [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0],
  )
  assert_eq(day.as_locator().tick_values(10.0, 0.0), [
    10.0, 9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0, 0.0,
  ])
  let hour = @date.HourLocator::new(tz="UTC", context~)
  assert_eq(
    hour.tick_values(
      @date.RRuleDateTime::naive(
        @date.datetime(
          2400,
          1,
          1,
          hour=0,
          minute=0,
          second=0,
          microsecond=123456,
        ),
      ),
      @date.RRuleDateTime::naive(
        @date.datetime(
          2400,
          1,
          1,
          hour=5,
          minute=0,
          second=0,
          microsecond=123456,
        ),
      ),
    ),
    [
      0.041666666666666664, 0.08333333333333333, 0.125, 0.16666666666666666, 0.20833333333333334,
    ],
  )
  assert_eq(hour.as_locator().tick_values(0.20833333333333334, 0.0), [
    0.20833333333333334, 0.16666666666666666, 0.125, 0.08333333333333333, 0.041666666666666664,
    0.0,
  ])
  let minute = @date.MinuteLocator::new(tz="UTC", context~)
  assert_eq(
    minute.tick_values(
      @date.RRuleDateTime::naive(
        @date.datetime(
          2400,
          1,
          1,
          hour=0,
          minute=0,
          second=0,
          microsecond=123456,
        ),
      ),
      @date.RRuleDateTime::naive(
        @date.datetime(
          2400,
          1,
          1,
          hour=0,
          minute=5,
          second=0,
          microsecond=123456,
        ),
      ),
    ),
    [
      0.0006944444444444445, 0.001388888888888889, 0.0020833333333333333, 0.002777777777777778,
      0.003472222222222222,
    ],
  )
  assert_eq(minute.as_locator().tick_values(0.003472222222222222, 0.0), [
    0.003472222222222222, 0.002777777777777778, 0.0020833333333333333, 0.001388888888888889,
    0.0006944444444444445, 0.0,
  ])
  let second = @date.SecondLocator::new(tz="UTC", context~)
  assert_eq(
    second.tick_values(
      @date.RRuleDateTime::naive(
        @date.datetime(
          2400,
          1,
          1,
          hour=0,
          minute=0,
          second=0,
          microsecond=123456,
        ),
      ),
      @date.RRuleDateTime::naive(
        @date.datetime(
          2400,
          1,
          1,
          hour=0,
          minute=0,
          second=5,
          microsecond=123456,
        ),
      ),
    ),
    [
      1.1574074074074073e-05, 2.3148148148148147e-05, 3.472222222222222e-05, 4.6296296296296294e-05,
      5.787037037037037e-05,
    ],
  )
  assert_eq(second.as_locator().tick_values(5.787037037037037e-05, 0.0), [
    5.787037037037037e-05, 4.6296296296296294e-05, 3.472222222222222e-05, 2.3148148148148147e-05,
    1.1574074074074073e-05, 0.0,
  ])
}
