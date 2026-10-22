///|
test "pyplot exposes log scale helpers" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=220))
  try! @pyplot.loglog([1.0, 10.0, 100.0], [1.0, 10.0, 100.0], label="log")
  assert_true(@pyplot.gca().x_scale().is_log())
  assert_true(@pyplot.gca().y_scale().is_log())
  assert_true(@pyplot.render_svg().contains("log"))
  @pyplot.close()
}

///|
test "pyplot exposes date plotting helpers" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  let dates = [try! @date.datetime(2024, 1, 1), try! @date.datetime(2024, 1, 2)]
  try! @pyplot.plot_date(dates, [1.0, 2.0])
  assert_true(@pyplot.render_svg().contains("01-01 00"))
  @pyplot.close()
}

///|
test "pyplot accepts a symmetric logarithmic scale object" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  let symlog = try! @scale.symlog_scale(linthresh=1.0)
  try! @pyplot.xscale(symlog)
  try! @pyplot.yscale(symlog)
  @pyplot.plot([-10.0, -1.0, 0.0, 1.0, 10.0], [-10.0, -1.0, 0.0, 1.0, 10.0])
  assert_true(@pyplot.gca().x_scale().is_nonlinear())
  assert_true(!@pyplot.render_svg().contains("NaN"))
  @pyplot.close()
}

///|
test "pyplot exposes explicit date locators" {
  @pyplot.close()
  ignore(@pyplot.figure(width=420, height=220))
  let dates = [
    try! @date.datetime(2024, 1, 1),
    try! @date.datetime(2024, 1, 15),
  ]
  try! @pyplot.plot_date(dates, [1.0, 2.0])
  let locator = try! @date.weekday_locator(weekday=0)
  try! @pyplot.xaxis_date_locator(locator)
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("2024-01-01"))
  assert_true(svg.contains("2024-01-08"))
  @pyplot.close()
}
