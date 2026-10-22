///|
test "pyplot captures a plain date format timezone from current config" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @pyplot.close()
  defer @pyplot.close()
  @config.set_timezone("XST-5:45")
  ignore(@pyplot.figure(width=600, height=300))
  @pyplot.plot([0.0, 1.0 / 24.0], [0.0, 1.0])
  @pyplot.xaxis_date(format="%H:%M %Z")
  @pyplot.gca().set_x_ticks([0.0, 1.0 / 24.0])
  @config.set_timezone("UTC")
  let svg = @pyplot.render_svg()
  assert_true(svg.contains(">05:45 XST</text>"))
  assert_true(svg.contains(">06:45 XST</text>"))
}
