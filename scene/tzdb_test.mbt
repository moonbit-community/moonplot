///|
test "bundled named IANA zones reach SVG auto ticks with historical seconds" {
  let zone = @tzdb.timezone("Europe/Paris")
  let start = @date.datetime(1900, 1, 1)
  let finish = @date.datetime(1900, 1, 1, hour=2)
  let figure = @scene.figure(width=520, height=240)
  figure.plot_date([start, finish], [1.0, 2.0])
  figure.set_x_date_timezone(zone)
  figure.set_x_limits(start.to_ordinal(), finish.to_ordinal())
  figure.axes().set_x_date_format("%H:%M:%S %z %Z")
  let ticks = figure
    .x_axis()
    .tick_values(@core.limits(start.to_ordinal(), finish.to_ordinal()))
  assert_true(!ticks.is_empty())
  for tick in ticks {
    assert_eq(zone.to_datetime(tick).second(), 0)
  }
  let svg = figure.to_svg()
  assert_true(svg.contains("+000921 PMT"))
  assert_true(!svg.contains("NaN"))
}

///|
test "bundled IANA alias drives future fold recurrence in SVG" {
  let zone = @tzdb.timezone("US/Eastern")
  let start = @date.datetime(2400, 11, 5, hour=5)
  let finish = @date.datetime(2400, 11, 5, hour=7)
  let figure = @scene.figure(width=520, height=240)
  figure.plot_date([start, finish], [1.0, 2.0])
  figure.set_x_date_timezone(zone)
  figure.set_x_limits(start.to_ordinal(), finish.to_ordinal())
  figure.set_x_date_locator(
    @date.rrule_locator(@date.Minutely, interval=30, dtstart=start),
  )
  figure.axes().set_x_date_format("%H:%M %Z")
  let svg = figure.to_svg()
  assert_true(svg.contains("01:00 EDT"))
  assert_true(svg.contains("01:00 EST"))
  assert_true(svg.contains("02:00 EST"))
}
