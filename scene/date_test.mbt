///|
test "date axes format ordinal ticks in SVG" {
  let figure = @scene.figure(width=360, height=240)
  let dates = [
    try! @date.datetime(2024, 1, 1),
    try! @date.datetime(2024, 1, 2),
    try! @date.datetime(2024, 1, 3),
  ]
  try! figure.plot_date(dates, [1.0, 2.0, 1.5])
  let svg = figure.to_svg()
  assert_true(svg.contains("01-01 00"))
  assert_true(svg.contains("01-02 00"))
  assert_true(!svg.contains("NaN"))
}

///|
test "date axes use month starts across a calendar boundary" {
  let figure = @scene.figure(width=420, height=240)
  let dates = [
    try! @date.datetime(2024, 1, 15),
    try! @date.datetime(2024, 7, 15),
  ]
  try! figure.plot_date(dates, [1.0, 2.0])
  let svg = figure.to_svg()
  assert_true(svg.contains("2024-02"))
  assert_true(svg.contains("2024-06"))
}

///|
test "date mode conflicts with logarithmic and category axes" {
  let axis = @axis.axis()
  try! axis.set_date()
  try axis.set_scale(@scale.log_scale()) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("date"))
    _ => fail("expected date/log conflict")
  } noraise {
    _ => fail("expected date/log conflict")
  }
  try axis.set_categories(["a"]) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("date"))
    _ => fail("expected date/category conflict")
  } noraise {
    _ => fail("expected date/category conflict")
  }
}

///|
test "explicit month locator controls date labels in SVG" {
  let figure = @scene.figure(width=420, height=240)
  let dates = [
    try! @date.datetime(2024, 1, 15),
    try! @date.datetime(2024, 7, 15),
  ]
  try! figure.plot_date(dates, [1.0, 2.0])
  let locator = try! @date.month_locator_on(3)
  try! figure.set_x_date_locator(locator)
  let svg = figure.to_svg()
  assert_true(svg.contains("2024-03"))
  assert_true(!svg.contains("2024-06"))
}

///|
test "explicit weekday locator controls date labels in SVG" {
  let figure = @scene.figure(width=420, height=240)
  let dates = [
    try! @date.datetime(2024, 1, 1),
    try! @date.datetime(2024, 1, 15),
  ]
  try! figure.plot_date(dates, [1.0, 2.0])
  let locator = try! @date.weekday_locator(weekday=0)
  try! figure.set_x_date_locator(locator)
  let svg = figure.to_svg()
  assert_true(svg.contains("2024-01-01"))
  assert_true(svg.contains("2024-01-08"))
}

///|
test "multiple date selectors and month ends reach SVG labels" {
  let figure = @scene.figure(width=420, height=240)
  figure.plot_date([@date.datetime(2024, 1, 1), @date.datetime(2024, 5, 1)], [
    1.0, 2.0,
  ])
  figure.set_x_date_locator(@date.month_locator(bymonth=[2, 4], bymonthday=-1))
  figure.axes().set_x_date_format("%Y-%m-%d")
  let svg = figure.to_svg()
  assert_true(svg.contains("2024-02-29"))
  assert_true(svg.contains("2024-04-30"))
  assert_true(!svg.contains("2024-03-31"))
}

///|
test "microsecond date labels reach SVG" {
  let figure = @scene.figure(width=420, height=240)
  figure.plot_date(
    [
      @date.datetime(1970, 1, 1, microsecond=100),
      @date.datetime(1970, 1, 1, microsecond=1000),
    ],
    [1.0, 2.0],
  )
  figure.set_x_date_locator(@date.microsecond_locator(interval=250))
  figure.axes().set_x_date_format("%H:%M:%S.%f")
  let svg = figure.to_svg()
  assert_true(svg.contains("00:00:00.000250"))
  assert_true(svg.contains("00:00:00.000750"))
  assert_true(!svg.contains("NaN"))
}

///|
test "nth weekday date labels reach SVG" {
  let figure = @scene.figure(width=420, height=240)
  figure.plot_date([@date.datetime(2024, 1, 1), @date.datetime(2024, 4, 30)], [
    1.0, 2.0,
  ])
  figure.set_x_date_locator(@date.nth_weekday_locator(weekday=0, ordinal=2))
  figure.axes().set_x_date_format("%Y-%m-%d")
  let svg = figure.to_svg()
  assert_true(svg.contains("2024-01-08"))
  assert_true(svg.contains("2024-02-12"))
  assert_true(svg.contains("2024-03-11"))
  assert_true(svg.contains("2024-04-08"))
  assert_true(!svg.contains("NaN"))
}

///|
test "fixed date label offsets reach SVG" {
  let figure = @scene.figure(width=420, height=240)
  figure.plot_date(
    [@date.datetime(1970, 1, 1), @date.datetime(1970, 1, 1, hour=1)],
    [1.0, 2.0],
  )
  figure.set_x_date_locator(@date.hour_locator())
  figure.axes().set_x_date_format("%H:%M %z")
  try! figure.set_x_date_offset(120)
  let svg = figure.to_svg()
  assert_true(svg.contains("02:00 +0200"))
  assert_true(svg.contains("03:00 +0200"))
  assert_true(!svg.contains("NaN"))

  try figure.set_x_date_offset(1440) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("offset"))
    _ => fail("expected date offset error")
  } noraise {
    _ => fail("expected date offset error")
  }
}

///|
test "business day locator filters holidays in SVG date labels" {
  let figure = @scene.figure(width=420, height=240)
  figure.plot_date([@date.datetime(2024, 1, 1), @date.datetime(2024, 1, 8)], [
    1.0, 2.0,
  ])
  figure.set_x_date_locator(
    try! @date.business_day_locator(holidays=[
      @date.datetime(2024, 1, 1),
      @date.datetime(2024, 1, 5),
    ]),
  )
  figure.axes().set_x_date_format("%Y-%m-%d")
  let svg = figure.to_svg()
  assert_true(svg.contains("2024-01-02"))
  assert_true(svg.contains("2024-01-03"))
  assert_true(svg.contains("2024-01-04"))
  assert_true(svg.contains("2024-01-08"))
  assert_true(!svg.contains("2024-01-01"))
  assert_true(!svg.contains("2024-01-05"))
  assert_true(!svg.contains("2024-01-06"))
  assert_true(!svg.contains("2024-01-07"))
}

///|
test "transition-aware timezone labels reach SVG" {
  let zone = try! @date.timezone(-300, transitions=[
    try! @date.timezone_transition(@date.datetime(2024, 3, 10, hour=7), -240),
  ])
  let before = try! @date.datetime(2024, 3, 10, hour=6, minute=59)
  let after = try! @date.datetime(2024, 3, 10, hour=7)
  let figure = @scene.figure(width=420, height=240)
  try! figure.plot_date([before, after], [1.0, 2.0])
  try! figure.set_x_date_timezone(zone)
  try! figure.axes().set_x_date_format("%H:%M %z")
  try! figure.set_x_ticks([before.to_ordinal(), after.to_ordinal()])
  let svg = figure.to_svg()
  assert_true(svg.contains("01:59 -0500"))
  assert_true(svg.contains("03:00 -0400"))
}

///|
test "transition-aware recurrence labels reach SVG" {
  let zone = try! @date.timezone(-300, transitions=[
    try! @date.timezone_transition(@date.datetime(2024, 3, 10, hour=7), -240),
  ])
  let start = try! @date.datetime(2024, 3, 9, hour=0)
  let finish = try! @date.datetime(2024, 3, 13, hour=0)
  let figure = @scene.figure(width=520, height=240)
  try! figure.plot_date([start, finish], [1.0, 2.0])
  try! figure.set_x_date_timezone(zone)
  try! figure.set_x_date_locator(
    @date.rrule_locator(
      @date.RRuleFrequency::Daily,
      byhour=[2],
      byminute=[0],
      bysecond=[0],
      dtstart=@date.datetime(2024, 3, 9, hour=2, offset_minutes=-300),
    ),
  )
  try! figure.axes().set_x_date_format("%Y-%m-%d %H:%M %z")
  let svg = figure.to_svg()
  assert_true(svg.contains("2024-03-09 02:00 -0500"))
  assert_true(!svg.contains("2024-03-10 02:00"))
  assert_true(svg.contains("2024-03-11 02:00 -0400"))
  assert_true(!svg.contains("NaN"))
}

///|
test "plot_date preserves existing date configuration across series" {
  let figure = @scene.figure(width=420, height=240)
  let first = [
    try! @date.datetime(1970, 1, 1, offset_minutes=120),
    try! @date.datetime(1970, 1, 1, hour=1, offset_minutes=120),
  ]
  let second = [
    try! @date.datetime(1970, 1, 2, offset_minutes=-480),
    try! @date.datetime(1970, 1, 2, hour=1, offset_minutes=-480),
  ]
  try! figure.plot_date(first, [1.0, 2.0])
  assert_eq(figure.x_axis().date_offset_minutes(), 120)
  try! figure.plot_date(second, [2.0, 1.0])
  assert_eq(figure.x_axis().date_offset_minutes(), 120)
  assert_eq(figure.x_axis().date_format(), Some(""))
  let svg = figure.to_svg()
  assert_true(svg.contains("01-01 00"))
  assert_true(svg.contains("01-02 00"))
  assert_true(!svg.contains("01-01 14"))
}

///|
test "plot_date keeps an explicit locator offset" {
  let figure = @scene.figure(width=420, height=240)
  let locator = try! @date.hour_locator().with_offset(90)
  try! figure.set_x_date_locator(locator)
  try! figure.axes().set_x_date_format("%H:%M %z")
  try! figure.plot_date(
    [
      @date.datetime(1970, 1, 1, offset_minutes=120),
      @date.datetime(1970, 1, 1, hour=1, offset_minutes=120),
    ],
    [1.0, 2.0],
  )
  assert_eq(figure.x_axis().date_offset_minutes(), 90)
  match figure.x_axis().date_locator() {
    Some(value) => assert_eq(value.offset_minutes(), 90)
    None => fail("explicit date locator was lost")
  }
}

///|
test "plot_date preserves fixed labels when enabling date mode" {
  let figure = @scene.figure(width=420, height=240)
  try! figure.axes().set_x_ticks([0.0, 1.0 / 24.0])
  try! figure.axes().set_x_tick_labels(["manual-a", "manual-b"])
  try! figure.plot_date(
    [@date.datetime(1970, 1, 1), @date.datetime(1970, 1, 1, hour=1)],
    [1.0, 2.0],
  )
  let svg = figure.to_svg()
  assert_true(svg.contains("manual-a"))
  assert_true(svg.contains("manual-b"))
}

///|
test "shared date axes receive an explicit offset" {
  let figure = @scene.figure(width=420, height=240)
  let axes = try! figure.subplots(1, 2, share_x=true)
  try! axes[0].set_x_date_offset(210)
  assert_eq(axes[0].x_date_offset(), 210)
  assert_eq(axes[1].x_date_offset(), 210)
  assert_eq(axes[1].x_date_format(), Some(""))
}
