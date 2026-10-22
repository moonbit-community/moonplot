///|
test "pyplot uses bundled IANA names for automatic date labels" {
  @pyplot.close()
  ignore(@pyplot.figure(width=520, height=240))
  let start = @date.datetime(2024, 1, 1)
  let finish = @date.datetime(2024, 1, 1, hour=2)
  @pyplot.plot_date([start, finish], [1.0, 2.0])
  @pyplot.xaxis_date_timezone(@tzdb.timezone("Asia/Kathmandu"))
  @pyplot.gca().set_x_date_format("%H:%M %z")
  @pyplot.gca().set_x_limits(start.to_ordinal(), finish.to_ordinal())
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("+0545"))
  assert_true(!svg.contains("NaN"))
  @pyplot.close()
}
