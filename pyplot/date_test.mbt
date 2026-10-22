///|
test "pyplot date facade propagates fixed offsets" {
  @pyplot.close()
  ignore(@pyplot.figure(width=360, height=220))
  let dates = [
    try! @date.datetime(1970, 1, 1),
    try! @date.datetime(1970, 1, 1, hour=1),
  ]
  try! @pyplot.plot_date(dates, [1.0, 2.0])
  try! @pyplot.xaxis_date_offset(120)
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("02:00"))
  assert_true(svg.contains("03:00"))
  @pyplot.close()
}

///|
test "pyplot date facade infers the input fixed offset" {
  @pyplot.close()
  ignore(@pyplot.figure(width=360, height=220))
  let dates = [
    try! @date.datetime(1970, 1, 1, offset_minutes=120),
    try! @date.datetime(1970, 1, 1, hour=1, offset_minutes=120),
  ]
  try! @pyplot.plot_date(dates, [1.0, 2.0])
  let svg = @pyplot.render_svg()
  assert_eq(@pyplot.gcf().x_axis().date_offset_minutes(), 120)
  assert_true(svg.contains("00:00"))
  assert_true(svg.contains("01:00"))
  @pyplot.close()
}

///|
test "pyplot date facade forwards business day locators" {
  @pyplot.close()
  ignore(@pyplot.figure(width=360, height=220))
  let dates = [try! @date.datetime(2024, 1, 1), try! @date.datetime(2024, 1, 8)]
  try! @pyplot.plot_date(dates, [1.0, 2.0])
  try! @pyplot.xaxis_date_locator(
    @date.business_day_locator(holidays=[@date.datetime(2024, 1, 1)]),
  )
  try! @pyplot.gca().set_x_date_format("%Y-%m-%d")
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("2024-01-02"))
  assert_true(svg.contains("2024-01-05"))
  assert_true(svg.contains("2024-01-08"))
  assert_true(!svg.contains("2024-01-01"))
  assert_true(!svg.contains("2024-01-06"))
  assert_true(!svg.contains("2024-01-07"))
  @pyplot.close()
}

///|
test "pyplot date facade forwards transition-aware timezones" {
  @pyplot.close()
  ignore(@pyplot.figure(width=360, height=220))
  let zone = try! @date.timezone(-300, transitions=[
    try! @date.timezone_transition(@date.datetime(2024, 3, 10, hour=7), -240),
  ])
  let before = try! @date.datetime(2024, 3, 10, hour=6, minute=59)
  let after = try! @date.datetime(2024, 3, 10, hour=7)
  try! @pyplot.plot_date([before, after], [1.0, 2.0])
  try! @pyplot.xaxis_date_timezone(zone)
  try! @pyplot.gca().set_x_date_format("%H:%M %z")
  try! @pyplot.gca().set_x_ticks([before.to_ordinal(), after.to_ordinal()])
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("01:59 -0500"))
  assert_true(svg.contains("03:00 -0400"))
  @pyplot.close()
}

///|
test "pyplot date facade forwards transition-aware recurrence locators" {
  @pyplot.close()
  ignore(@pyplot.figure(width=520, height=240))
  let zone = try! @date.timezone(-300, transitions=[
    try! @date.timezone_transition(@date.datetime(2024, 3, 10, hour=7), -240),
  ])
  let start = try! @date.datetime(2024, 3, 9, hour=0)
  let finish = try! @date.datetime(2024, 3, 13, hour=0)
  try! @pyplot.plot_date([start, finish], [1.0, 2.0])
  try! @pyplot.xaxis_date_timezone(zone)
  try! @pyplot.xaxis_date_locator(
    @date.rrule_locator(
      @date.RRuleFrequency::Daily,
      byhour=[2],
      byminute=[0],
      bysecond=[0],
      dtstart=@date.datetime(2024, 3, 9, hour=2, offset_minutes=-300),
    ),
  )
  try! @pyplot.gca().set_x_date_format("%Y-%m-%d %H:%M %z")
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("2024-03-09 02:00 -0500"))
  assert_true(!svg.contains("2024-03-10 02:00"))
  assert_true(svg.contains("2024-03-11 02:00 -0400"))
  @pyplot.close()
}
