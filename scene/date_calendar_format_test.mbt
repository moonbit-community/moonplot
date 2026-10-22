///|
test "SVG calendar and C locale directives retain local dates inversion and XML escaping" {
  let figure = @scene.figure(width=700, height=340)
  let ticks = [
    @date.datetime(2021, 1, 3, hour=23, minute=55).to_ordinal(),
    @date.datetime(2021, 1, 4, minute=5).to_ordinal(),
  ]
  figure.plot(ticks, ticks)
  figure.set_x_date_formatter(@date.date_formatter("%G-W%V-%u<&>%I:%M %p"))
  figure.set_y_date_formatter(@date.date_formatter("%c | %x | %X"))
  let zone = @date.fixed_timezone_seconds(561)
  figure.set_x_date_timezone(zone)
  figure.set_y_date_timezone(zone)
  figure.set_x_ticks(ticks)
  figure.set_y_ticks(ticks)
  figure.set_x_limits(ticks[1], ticks[0])
  let svg = figure.to_svg()
  assert_true(svg.contains(">2021-W01-1&lt;&amp;&gt;12:04 AM</text>"))
  assert_true(
    svg.contains(">Mon Jan  4 00:04:21 2021 | 01/04/21 | 00:04:21</text>"),
  )
  assert_true(!svg.contains("%G"))
}

///|
test "shared default automatic date formatter captures new calendar directives from rc" {
  @config.reset()
  @config.set_date_autoformatter("hour", "%G-W%V %I:%M %p")
  let figure = @scene.figure(width=700, height=420)
  let axes = figure.subplots(2, 1, share_x=true)
  axes[0].set_x_date()
  @config.reset()
  let dates = [@date.datetime(2021, 1, 1), @date.datetime(2021, 1, 2, hour=16)]
  for axis in axes {
    axis.plot_date(dates, [0.0, 1.0])
  }
  let svg = figure.to_svg()
  assert_eq(svg.split(">2020-W53 12:00 AM</text>").to_array().length() - 1, 2)
  assert_true(svg.contains(">2020-W53 12:00 PM</text>"))
}
