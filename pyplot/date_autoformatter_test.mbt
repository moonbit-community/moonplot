///|
test "pyplot exposes both minor date locator and formatter paths" {
  @pyplot.close()
  ignore(@pyplot.figure(width=560, height=320))
  let first = @date.datetime(2018, 9, 30, hour=8).to_ordinal()
  let last = @date.datetime(2018, 9, 30, hour=9).to_ordinal()
  @pyplot.plot([first, last], [first, last])
  @pyplot.xaxis_date()
  @pyplot.yaxis_date()
  @pyplot.gca().set_x_ticks([])
  @pyplot.gca().set_y_ticks([])
  @pyplot.xaxis_minor_date_locator(@date.minute_locator(byminute=[15, 45]))
  @pyplot.yaxis_minor_date_locator(@date.minute_locator(byminute=[15, 45]))
  @pyplot.xaxis_minor_date_formatter(
    @date.AutoDateFormatter::new().as_formatter(),
  )
  @pyplot.yaxis_minor_date_formatter(@date.date_formatter("%H:%M"))
  let svg = @pyplot.render_svg()
  assert_true(svg.contains(">30 08:15</text>"))
  assert_true(svg.contains(">08:45</text>"))
  @pyplot.close()
}
