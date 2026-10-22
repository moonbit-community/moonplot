///|
test "cached object locator keeps timezone recurrence SVG labels" {
  let zone = @tzdb.timezone("America/New_York")
  for cache in [false, true] {
    let start = @date.datetime(2024, 3, 9, hour=7)
    let finish = @date.datetime(2024, 3, 12, hour=7)
    let rule = @date.rrule(@date.Daily, start, count=3, cache~).with_timezone(
      zone,
    )
    ignore(rule.iter().take(2).to_array())
    let figure = @scene.figure(width=520, height=240)
    figure.plot_date([start, finish], [1.0, 2.0])
    figure.set_x_date_timezone(zone)
    figure.set_x_date_locator(rule.locator())
    figure.axes().set_x_date_format("%Y-%m-%d %H:%M %Z")
    figure.set_x_limits(start.to_ordinal(), finish.to_ordinal())
    let svg = figure.to_svg()
    assert_true(svg.contains("2024-03-09 02:00 EST"))
    assert_true(svg.contains("2024-03-11 02:00 EDT"))
    assert_true(svg.contains("2024-03-12 02:00 EDT"))
    assert_true(!svg.contains("2024-03-10 02:00"))
  }
}
