///|
test "TZif seconds and designations reach automatic date SVG ticks" {
  let zone = @date.tzif_timezone(tzif_paris)
  let start = @date.datetime(1900, 1, 1)
  let finish = @date.datetime(1900, 1, 1, hour=2)
  let figure = @scene.figure(width=520, height=240)
  figure.plot_date([start, finish], [1.0, 2.0])
  figure.set_x_date_timezone(zone)
  figure.axes().set_x_date_format("%H:%M:%S %z %Z")
  figure.set_x_limits(start.to_ordinal(), finish.to_ordinal())
  let axis = figure.x_axis()
  let ticks = axis.tick_values(
    @core.limits(start.to_ordinal(), finish.to_ordinal()),
  )
  for tick in ticks {
    assert_eq(zone.to_datetime(tick).second(), 0)
  }
  let svg = figure.to_svg()
  assert_true(svg.contains("+000921 PMT"))
  assert_true(!svg.contains("NaN"))
}

///|
test "plot_date infers exact seconds offset for initial automatic configuration" {
  let start = @date.datetime(1900, 1, 1, offset_seconds=561)
  let finish = @date.datetime(1900, 1, 1, hour=2, offset_seconds=561)
  let figure = @scene.figure(width=520, height=240)
  figure.plot_date([start, finish], [1.0, 2.0])
  let zone = figure.x_axis().date_timezone().unwrap()
  assert_eq(zone.initial_offset_seconds(), 561)
  figure.axes().set_x_date_format("%H:%M:%S %z")
  figure.set_x_ticks([start.to_ordinal(), finish.to_ordinal()])
  let svg = figure.to_svg()
  assert_true(svg.contains("00:00:00 +000921"))
  assert_true(svg.contains("02:00:00 +000921"))
}

///|
test "TZif future recurrence labels reach scene SVG" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let start = @date.datetime(2400, 11, 5, hour=5)
  let finish = @date.datetime(2400, 11, 5, hour=7)
  let figure = @scene.figure(width=520, height=240)
  figure.plot_date([start, finish], [1.0, 2.0])
  figure.set_x_date_timezone(zone)
  figure.set_x_date_locator(
    @date.rrule_locator(@date.Minutely, interval=30, dtstart=start),
  )
  figure.axes().set_x_date_format("%H:%M %Z")
  figure.set_x_limits(start.to_ordinal(), finish.to_ordinal())
  let svg = figure.to_svg()
  assert_true(svg.contains("01:00 EDT"))
  assert_true(svg.contains("01:00 EST"))
}
