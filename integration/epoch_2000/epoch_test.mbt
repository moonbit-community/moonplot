///|
test "2000 epoch matches independent pinned reference" {
  @date.set_epoch("2000-01-01T00:00:00")
  assert_eq(@date.get_epoch(), "2000-01-01T00:00:00")
  verify_reference()
  verify_units_lifecycle_epoch_reference()
  assert_eq(@date.datetime(1970, 1, 1).to_ordinal(), -10957.0)
  assert_true(
    try {
      @date.set_epoch("2000-01-01T00:00:00")
      false
    } catch {
      _ => true
    },
  )
  let zone = @tzdb.timezone("America/New_York")
  let first = @date.datetime(2024, 3, 10, hour=6).with_timezone(zone)
  let last = @date.datetime(2024, 3, 10, hour=9).with_timezone(zone)
  let ticks = @date.hour_locator()
    .with_timezone(zone)
    .tick_values(first.to_ordinal(), last.to_ordinal())
  assert_eq(@date.format_date_ticks(ticks, format="%H:%M %Z", timezone=zone), [
    "01:00 EST", "03:00 EDT", "04:00 EDT", "05:00 EDT",
  ])
  let start = @date.datetime(2024, 11, 3, hour=1, offset_minutes=-240)
  let rule = @date.rrule(
    @date.Minutely,
    start,
    interval=30,
    count=4,
    cache=true,
  ).with_timezone(zone)
  let expected = ["01:00 EDT", "01:30 EDT", "01:00 EST", "01:30 EST"]
  assert_eq(
    rule.all().map(value => @date.format_date(value, "%H:%M %Z")),
    expected,
  )
  assert_eq(
    rule.iter().to_array().map(value => @date.format_date(value, "%H:%M %Z")),
    expected,
  )
  let set = @date.rruleset(cache=true)
  set.rrule(rule)
  set.exdate(start)
  assert_eq(set.all().length(), 3)
  assert_eq(set.all()[0].minute(), 30)
  let months = @date.date_tick_values(
    @date.datetime(2024, 1, 15).to_ordinal(),
    @date.datetime(2024, 7, 15).to_ordinal(),
    count=6,
  )
  assert_eq(@date.format_date_ticks(months, format="%Y-%m-%d"), [
    "2024-02-01", "2024-03-01", "2024-04-01", "2024-05-01", "2024-06-01", "2024-07-01",
  ])
  @pyplot.close()
  ignore(@pyplot.figure(width=520, height=240))
  @pyplot.plot_date([first, last], [1.0, 2.0])
  @pyplot.xaxis_date_locator(@date.hour_locator())
  @pyplot.gca().set_x_date_format("%H:%M %Z")
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("01:00 EST"))
  assert_true(svg.contains("03:00 EDT"))
  assert_true(!svg.contains("NaN"))
  @pyplot.close()
}
