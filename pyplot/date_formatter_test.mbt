///|
test "pyplot attaches concise and scalar date formatters to both axes" {
  @pyplot.close()
  ignore(@pyplot.figure(width=520, height=300))
  let ticks = [
    @date.datetime(2024, 1, 5).to_ordinal(),
    @date.datetime(2024, 1, 6).to_ordinal(),
  ]
  @pyplot.plot(ticks, ticks)
  @pyplot.xaxis_date_formatter(@date.concise_date_formatter().as_formatter())
  @pyplot.yaxis_date_formatter(@date.date_formatter("%m/%d"))
  @pyplot.gca().set_x_ticks(ticks)
  @pyplot.gca().set_y_ticks(ticks)
  let svg = @pyplot.render_svg()
  assert_true(svg.contains(">05</text>"))
  assert_true(svg.contains(">06</text>"))
  assert_true(svg.contains(">01/05</text>"))
  assert_true(svg.contains(">2024-Jan</text>"))
  @pyplot.close()
}
