///|
test "retained date zones and numeric drange ticks reach SVG" {
  let zone = @tzdb.timezone("America/New_York")
  let first = @date.datetime(2024, 3, 10, hour=6).with_timezone(zone)
  let last = @date.datetime(2024, 3, 10, hour=9).with_timezone(zone)
  let ticks = @date.drange(
    first.with_offset(0),
    last.with_offset(0),
    @date.timedelta(hours=1),
  )
  let figure = @scene.figure(width=520, height=240)
  figure.plot_date([first, last], [1.0, 2.0])
  assert_true(figure.x_axis().date_timezone() is Some(_))
  figure.set_x_ticks(ticks)
  figure.axes().set_x_date_format("%H:%M %Z")
  let svg = figure.to_svg()
  assert_true(svg.contains("01:00 EST"))
  assert_true(svg.contains("03:00 EDT"))
  assert_true(svg.contains("04:00 EDT"))
  let later = @date.datetime(2024, 3, 10, hour=10)
  figure.plot_date([later], [3.0])
  assert_eq(
    figure
    .x_axis()
    .date_timezone()
    .unwrap()
    .offset_seconds_at(first.to_ordinal()),
    -18000,
  )
  assert_true(figure.to_svg().contains("03:00 EDT"))
}
