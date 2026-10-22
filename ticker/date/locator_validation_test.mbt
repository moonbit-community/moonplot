///|
fn expect_invalid_locator(
  make : () -> @date.DateLocator raise @date.DateError,
) -> Unit raise {
  try make() catch {
    @date.DateError::InvalidDate(_) => ()
    _ => fail("expected InvalidDate")
  } noraise {
    _ => fail("expected invalid locator to be rejected")
  }
}

///|
test "selector arrays reject empty invalid and ambiguous inputs" {
  let invalid : Array[() -> @date.DateLocator raise @date.DateError] = [
    () => @date.month_locator(bymonth=[]),
    () => @date.weekday_locator(byweekday=[]),
    () => @date.day_locator(bymonthday=[]),
    () => @date.hour_locator(byhour=[]),
    () => @date.minute_locator(byminute=[]),
    () => @date.second_locator(bysecond=[]),
    () => @date.month_locator(bymonth=[0, 1]),
    () => @date.month_locator(bymonth=[1, 13]),
    () => @date.month_locator(bymonthday=0),
    () => @date.month_locator(bymonthday=-32),
    () => @date.weekday_locator(byweekday=[-1, 1]),
    () => @date.weekday_locator(byweekday=[1, 7]),
    () => @date.day_locator(bymonthday=[0, 1]),
    () => @date.day_locator(bymonthday=[-32, 1]),
    () => @date.day_locator(bymonthday=[1, 32]),
    () => @date.hour_locator(byhour=[-1, 0]),
    () => @date.hour_locator(byhour=[0, 24]),
    () => @date.minute_locator(byminute=[-1, 0]),
    () => @date.minute_locator(byminute=[0, 60]),
    () => @date.second_locator(bysecond=[-1, 0]),
    () => @date.second_locator(bysecond=[0, 60]),
    () => @date.weekday_locator(weekday=0, byweekday=[1]),
    () => @date.day_locator(day=0, bymonthday=[1]),
    () => @date.hour_locator(hour=-1, byhour=[0]),
    () => @date.minute_locator(minute=-1, byminute=[0]),
    () => @date.second_locator(second=-1, bysecond=[0]),
    () => @date.hour_locator_at(-1),
    () => @date.minute_locator_at(-1),
    () => @date.second_locator_at(-1),
  ]
  for make in invalid {
    expect_invalid_locator(make)
  }
}

///|
test "selection arrays are immutable from the caller for every locator kind" {
  let input = [3, 1, 3]
  let locators = [
    @date.month_locator(bymonth=input),
    @date.weekday_locator(byweekday=input),
    @date.day_locator(bymonthday=input),
    @date.hour_locator(byhour=input),
    @date.minute_locator(byminute=input),
    @date.second_locator(bysecond=input),
  ]
  assert_eq(input, [3, 1, 3])
  let expected = locators.map(locator => locator.tick_values(0.0, 35.0))
  input[0] = 2
  input[1] = 2
  input[2] = 2
  for index, locator in locators {
    assert_eq(locator.tick_values(0.0, 35.0), expected[index])
    assert_eq(locator.selector(), 1)
    assert_eq(locator.selector, 1)
    assert_true(locator.selector_enabled)
  }
}

///|
test "legacy scalar wildcard and explicit zero APIs preserve their meaning" {
  assert_eq(
    @date.day_locator(day=0).tick_values(0.0, 2.0),
    @date.date_locator().tick_values(0.0, 2.0),
  )
  assert_eq(
    @date.hour_locator(hour=-1).tick_values(0.0, 1.0),
    @date.hour_locator().tick_values(0.0, 1.0),
  )
  assert_eq(
    @date.minute_locator(minute=-1).tick_values(0.0, 0.01),
    @date.minute_locator().tick_values(0.0, 0.01),
  )
  assert_eq(
    @date.second_locator(second=-1).tick_values(0.0, 0.001),
    @date.second_locator().tick_values(0.0, 0.001),
  )
  assert_eq(@date.hour_locator_at(0).tick_values(0.0, 1.0), [0.0, 1.0])
  assert_eq(@date.minute_locator_at(0).tick_values(0.0, 1.0 / 24.0), [
    0.0,
    1.0 / 24.0,
  ])
  assert_eq(@date.second_locator_at(0).tick_values(0.0, 1.0 / 1440.0), [
    0.0,
    1.0 / 1440.0,
  ])
  let locator = @date.year_locator(base=5, month=7, day=4)
  assert_eq(locator.interval, 5)
  assert_eq(locator.selector, 7)
  assert_eq(locator.secondary, 4)
}
