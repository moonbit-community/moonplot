///|
test "wrapper queries raw iterators copies and early locator errors leave epoch selectable" {
  @config.set_timezone("invalid/D14-zone")
  defer @config.set_timezone("UTC")
  let zone = @date.fixed_timezone(60)
  let start = @date.RRuleDateTime::from_local(@date.datetime(2024, 1, 1), zone)
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=start,
    byweekdays=[@date.mo.with_nth(2)],
    count=6,
    cache=true,
  )
  let query = @date.RRuleDateTime::naive(@date.datetime(2024, 3, 1))
  assert_eq(wrapper.after(query).unwrap().date().day(), 11)
  assert_eq(wrapper.before(query).unwrap().date().day(), 12)
  assert_eq(wrapper.xafter(query, count=2).length(), 2)
  assert_eq(
    wrapper
    .between(query, @date.RRuleDateTime::naive(@date.datetime(2025, 1, 1)))
    .length(),
    4,
  )
  assert_eq(wrapper.raw_iter().take(2).to_array().length(), 2)
  assert_eq(wrapper.occurrence_count(), 6L)
  ignore(wrapper.raw_rule())
  let copy = wrapper.copy()
  copy.set(interval=2)
  assert_eq(copy.occurrence_count(), 6L)
  let clock = Ref(0)
  let implicit = @date.RRuleWrapper::new(
    @date.Daily,
    count=2,
    context=@date.DateParserContext::utc(clock=fn() {
      clock.val += 1
      1781524800123L
    }),
  )
  implicit.set(count=3)
  assert_eq(clock.val, 2)
  assert_eq(implicit.occurrence_count(), 3L)
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone)
  assert_eq(locator.as_locator().copy().unit_scale(), 30.0)
  assert_true(
    try {
      ignore(@date.RRuleLocator::new(wrapper))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(start, query))
      false
    } catch {
      _ => true
    },
  )
  let outside = @date.RRuleDateTime::aware(
    @date.datetime(1, 1, 1, offset_minutes=1380),
  )
  assert_true(
    try {
      ignore(outside.to_ordinal())
      false
    } catch {
      _ => true
    },
  )
  let automatic = @date.AutoDateLocator::new(timezone=zone)
  let chosen = automatic.get_locator(
    @date.datetime(2024, 1, 1),
    @date.datetime(2024, 1, 3),
  )
  assert_true(chosen.rrule_locator() is Some(_))
  let leap = @date.YearLocator::new(
    month=2,
    day=29,
    timezone=zone,
    context=@date.DateParserContext::utc(clock=fn() { 1781524800123L }),
  )
  assert_true(
    try {
      ignore(
        leap.tick_values(
          @date.RRuleDateTime::naive(@date.datetime(2023, 1, 1)),
          @date.RRuleDateTime::naive(@date.datetime(2024, 1, 1)),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  let portable = @date.DateParserContext::utc(clock=fn() { 1781524800123L })
  let month = @date.MonthLocator::new(timezone=zone, context=portable)
  let weekday = @date.WeekdayLocator::new(timezone=zone, context=portable)
  let day = @date.DayLocator::new(timezone=zone, context=portable)
  let hour = @date.HourLocator::new(timezone=zone, context=portable)
  let minute = @date.MinuteLocator::new(timezone=zone, context=portable)
  let second = @date.SecondLocator::new(timezone=zone, context=portable)
  for
    locator in [
      month.as_locator(),
      weekday.as_locator(),
      day.as_locator(),
      hour.as_locator(),
      minute.as_locator(),
      second.as_locator(),
    ] {
    ignore(locator.rrule_locator().unwrap().rule().raw_iter().next())
  }
  @date.set_epoch("2000-01-01T00:00:00")
  @config.set_timezone("UTC")
  let daily = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.datetime(2000, 1, 1)),
  )
  let ticks = @date.RRuleLocator::new(daily).tick_values(
    @date.RRuleDateTime::naive(@date.datetime(2000, 1, 1)),
    @date.RRuleDateTime::naive(@date.datetime(2000, 1, 3)),
  )
  assert_eq(ticks, [0.0, 1.0, 2.0])
}
