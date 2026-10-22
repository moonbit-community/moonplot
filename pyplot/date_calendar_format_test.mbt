///|
test "pyplot formats calendar week and twelve hour directives on both coordinates" {
  @pyplot.close()
  ignore(@pyplot.figure(width=650, height=330))
  let ticks = [
    @date.datetime(2021, 1, 1).to_ordinal(),
    @date.datetime(2021, 1, 1, hour=13).to_ordinal(),
  ]
  @pyplot.plot(ticks, ticks)
  @pyplot.xaxis_date(format="%G-W%V-%u %I %p")
  @pyplot.yaxis_date(format="%j %U %W")
  @pyplot.gca().set_x_ticks(ticks)
  @pyplot.gca().set_y_ticks(ticks)
  let svg = @pyplot.render_svg()
  assert_true(svg.contains(">2020-W53-5 12 AM</text>"))
  assert_true(svg.contains(">2020-W53-5 01 PM</text>"))
  assert_eq(svg.split(">001 00 00</text>").to_array().length() - 1, 2)
  @pyplot.close()
}
