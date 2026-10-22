///|
test "pyplot TZif future automatic ticks retain source fold0" {
  @pyplot.close()
  ignore(@pyplot.figure(width=520, height=240))
  let zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.datetime(2400, 11, 5, hour=5)
  let last = @date.datetime(2400, 11, 5, hour=7)
  @pyplot.plot_date([first, last], [1.0, 2.0])
  @pyplot.xaxis_date_timezone(zone)
  @pyplot.gca().set_x_date_format("%H:%M %Z")
  @pyplot.gca().set_x_limits(first.to_ordinal(), last.to_ordinal())
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("01:00 EDT"))
  assert_true(!svg.contains("01:00 EST"))
  assert_true(svg.contains("02:00 EST"))
  @pyplot.close()
}
