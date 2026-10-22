///|
test "linear ticks preserve direction" {
  let ascending = @ticker.linear_ticks(@core.limits(0.0, 10.0), count=3)
  assert_eq(ascending.length(), 3)
  assert_true(ascending[0] == 0.0)
  assert_true(ascending[1] == 5.0)
  assert_true(ascending[2] == 10.0)
  let descending = @ticker.linear_ticks(@core.limits(10.0, 0.0), count=3)
  assert_true(descending[0] == 10.0)
  assert_true(descending[1] == 5.0)
  assert_true(descending[2] == 0.0)
}

///|
test "linear ticks handle degenerate and invalid limits" {
  assert_eq(@ticker.linear_ticks(@core.limits(2.0, 2.0)).length(), 1)
  assert_eq(@ticker.linear_ticks(@core.limits(0.0 / 0.0, 1.0)).length(), 0)
  assert_eq(@ticker.linear_ticks(@core.limits(0.0, 1.0), count=1).length(), 2)
}
