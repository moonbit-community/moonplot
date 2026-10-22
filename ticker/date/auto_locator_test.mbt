///|
test "date ticks preserve direction" {
  let ascending = @date.date_tick_values(0.0, 2.0, count=4)
  let descending = @date.date_tick_values(2.0, 0.0, count=4)
  assert_true(ascending.length() > 0)
  assert_eq(descending[0], ascending[ascending.length() - 1])
  assert_eq(descending[descending.length() - 1], ascending[0])
}

///|
test "date ticks align month and year boundaries" {
  let start = try! @date.datetime(2024, 1, 15).to_ordinal()
  let finish = try! @date.datetime(2024, 7, 15).to_ordinal()
  let monthly = @date.date_tick_values(start, finish, count=8)
  assert_true(monthly.length() >= 5)
  let first = try! @date.from_ordinal(monthly[0])
  assert_eq(first.day(), 1)
  assert_eq(first.month(), 2)
  let leap_start = try! @date.datetime(2019, 10, 10).to_ordinal()
  let leap_finish = try! @date.datetime(2021, 4, 10).to_ordinal()
  let yearly = @date.date_tick_values(leap_start, leap_finish, count=2)
  assert_true(yearly.length() >= 2)
  for value in yearly {
    let date = try! @date.from_ordinal(value)
    assert_eq(date.month(), 1)
    assert_eq(date.day(), 1)
  }
}

///|
test "date ticks align calendar boundaries in reverse ranges" {
  let lower = try! @date.datetime(2024, 1, 15).to_ordinal()
  let upper = try! @date.datetime(2024, 7, 15).to_ordinal()
  let ascending = @date.date_tick_values(lower, upper, count=8)
  let descending = @date.date_tick_values(upper, lower, count=8)
  assert_eq(descending[0], ascending[ascending.length() - 1])
  assert_eq(descending[descending.length() - 1], ascending[0])
}
