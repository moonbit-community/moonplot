///|
test "pyplot inherits retained timezone with timedelta drange ticks" {
  @pyplot.close()
  ignore(@pyplot.figure(width=520, height=240))
  let zone = @tzdb.timezone("America/New_York")
  let first = @date.datetime(2024, 3, 10, hour=6).with_timezone(zone)
  let last = @date.datetime(2024, 3, 10, hour=9).with_timezone(zone)
  @pyplot.plot_date([first, last], [1.0, 2.0])
  @pyplot.gca().set_x_ticks(
    @date.drange(
      first.with_offset(0),
      last.with_offset(0),
      @date.timedelta(hours=1),
    ),
  )
  @pyplot.gca().set_x_date_format("%H:%M %Z")
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("01:00 EST"))
  assert_true(svg.contains("03:00 EDT"))
  @pyplot.close()
}
