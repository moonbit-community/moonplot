///|
test "wrapper raw rule replacement remaps ordinal weekdays to the new frequency" {
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.datetime(2024, 1, 1)),
    count=4,
    byweekdays=[@date.mo.with_nth(2)],
  )
  let raw = wrapper.raw_rule()
  assert_eq(raw.all().map(value => value.day()), [8, 12, 11, 8])
  assert_eq(
    raw.replace(frequency=@date.Daily).all().map(value => value.day()),
    [1, 8, 15, 22],
  )
  assert_eq(
    raw.replace(frequency=@date.Yearly).all().map(value => value.day()),
    [8, 13, 12, 11],
  )
  let empty = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.datetime(2024, 1, 1)),
    count=0,
  )
  assert_eq(empty.raw_rule().replace().all().length(), 0)
}

///|
test "explicit wrapper copy isolates construction arrays and cache while set consumes live inputs" {
  let hours = [0]
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.datetime(2024, 1, 1)),
    count=2,
    byhour=hours,
    cache=true,
  )
  let copy = wrapper.copy()
  let reader = wrapper.raw_iter()
  assert_eq(reader.next().unwrap().date().hour(), 0)
  hours[0] = 12
  wrapper.set(count=3)
  copy.set(count=3)
  assert_eq(wrapper.raw_iter().next().unwrap().date().hour(), 12)
  assert_eq(copy.raw_iter().next().unwrap().date().hour(), 0)
  assert_eq(reader.next().unwrap().date().hour(), 0)
  assert_eq(wrapper.occurrence_count(), 3L)
  assert_eq(copy.occurrence_count(), 3L)
}

///|
test "scalar monthday copies remain independent and duplicate keyword forms fail before mutation" {
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    calls.val += 1
    1781524800123L
  })
  assert_true(
    try {
      ignore(
        @date.RRuleWrapper::new(
          @date.Monthly,
          context~,
          bymonth=[1],
          bymonth_value=2,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_eq(calls.val, 0)
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.datetime(2024, 1, 1)),
    bymonthday_value=-1,
    count=3,
  )
  let copy = wrapper.copy()
  assert_true(
    try {
      wrapper.set(bymonthday=[15], bymonthday_value=1)
      false
    } catch {
      _ => true
    },
  )
  assert_eq(wrapper.raw_iter().to_array().map(value => value.date().day()), [
    31, 29, 31,
  ])
  wrapper.set(bymonthday_value=15)
  assert_eq(copy.raw_iter().to_array().map(value => value.date().day()), [
    31, 29, 31,
  ])
}
