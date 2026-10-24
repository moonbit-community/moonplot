///|
test "clock epoch matches independent pinned reference" {
  @date.set_epoch("1970-01-01T01:02:03")
  assert_eq(@date.get_epoch(), "1970-01-01T01:02:03")
  verify_reference()
  let first = @date.datetime(1970, 1, 1, minute=30).to_ordinal()
  let last = @date.datetime(1970, 1, 1, hour=4, minute=30).to_ordinal()
  let ticks = @date.date_tick_values(first, last, count=5)
  assert_eq(@date.format_date_ticks(ticks, format="%H:%M:%S"), [
    "01:00:00", "02:00:00", "03:00:00", "04:00:00",
  ])
  assert_eq(
    @date.format_date_ticks(
      @date.date_tick_values(first, last, count=5, offset_minutes=330),
      format="%H:%M",
      offset_minutes=330,
    ),
    ["06:00", "07:00", "08:00", "09:00", "10:00"],
  )
  let days = @date.date_tick_values(
    @date.datetime(1970, 1, 1, hour=12).to_ordinal(),
    @date.datetime(1970, 1, 9, hour=12).to_ordinal(),
    count=5,
  )
  assert_eq(@date.format_date_ticks(days, format="%Y-%m-%d %H:%M"), [
    "1970-01-03 00:00", "1970-01-05 00:00", "1970-01-07 00:00", "1970-01-09 00:00",
  ])
}
