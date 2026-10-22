///|
test "ambiguous named locator keyword forms fail before reading the clock" {
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    calls.val += 1
    1781524800123L
  })
  assert_true(
    try {
      ignore(@date.MonthLocator::new(bymonth=[1], bymonth_value=2, context~))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.WeekdayLocator::new(
          on_weekday=@date.mo,
          byweekday_value=1,
          context~,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.DayLocator::new(bymonthday=[1], bymonthday_value=2, context~),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.HourLocator::new(byhour=[1], byhour_value=2, context~))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.MinuteLocator::new(byminute=[1], byminute_value=2, context~))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.SecondLocator::new(bysecond=[1], bysecond_value=2, context~))
      false
    } catch {
      _ => true
    },
  )
  assert_eq(calls.val, 0)
}
