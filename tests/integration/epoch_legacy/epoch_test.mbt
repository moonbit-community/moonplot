///|
test "legacy epoch matches independent pinned reference" {
  @date.set_epoch("0000-12-31")
  assert_eq(@date.get_epoch(), "0000-12-31")
  verify_reference()
  assert_eq(@date.datetime(1, 1, 1).to_ordinal(), 1.0)
  assert_eq(@date.datetime(1970, 1, 1).to_ordinal(), 719163.0)
  let first = @date.num2date(1.0)
  assert_eq((first.year(), first.month(), first.day()), (1, 1, 1))
  assert_true(
    try {
      ignore(@date.num2date(0.0))
      false
    } catch {
      _ => true
    },
  )
  let values = @date.rrule(@date.Daily, first, count=3).all()
  assert_eq(values.map(value => value.day()), [1, 2, 3])
  let ticks = @date.year_locator(base=1000).tick_values(
    @date.datetime(1, 1, 1).to_ordinal(),
    @date.datetime(3000, 1, 1).to_ordinal(),
  )
  // Upstream clamps the starting year to 1 before stepping by base.
  assert_eq(@date.format_date_ticks(ticks, format="%Y"), [
    "0001", "1001", "2001",
  ])
}
