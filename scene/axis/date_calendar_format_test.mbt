///|
test "major and minor calendar directives use local dates across UTC ISO week boundary" {
  let axis = @axis.axis()
  axis.set_date_format("%G-W%V-%u %I:%M %p")
  axis.set_minor_date_locator(@date.minute_locator())
  axis.set_minor_date_formatter(@date.date_formatter("%j %U %W %I:%M %p"))
  axis.set_date_timezone(@date.fixed_timezone_seconds(561))
  let value = @date.datetime(2021, 1, 3, hour=23, minute=55).to_ordinal()
  assert_eq(axis.tick_labels([value]), ["2021-W01-1 12:04 AM"])
  assert_eq(
    axis.minor_tick_labels([value], view=@core.limits(value + 1.0, value - 1.0)),
    ["004 01 01 12:04 AM"],
  )
}
