///|
test "2400 epoch matches independent pinned reference" {
  assert_eq(@date.datestrs2num([]), [])
  let string_parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock=fn() { 13569465600000L }),
  )
  assert_eq(
    @date.format_date(@date.datetime(2021, 1, 1), "%G-W%V-%u"),
    "2020-W53-5",
  )
  let calendar_formatter = @date.date_formatter(
    "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%f",
  )
  assert_eq(@date.DateConverter::new().convert([]), [])
  let converter_auto = @date.DateConverter::new().axisinfo()
  let converter_concise = @date.ConciseDateConverter::new().axisinfo()
  let automatic = @date.AutoDateLocator::new()
  let auto = @date.AutoDateFormatter::new(locator=@date.microsecond_locator())
  // Loading raw rules, exact conversions and constructing rules stay pure.
  let zone = @tzdb.timezone("America/New_York")
  let exact = @date.datetime(2400, 3, 12, hour=7, microsecond=123457).with_timezone(
    zone,
  )
  assert_eq(exact.microsecond(), 123457)
  let event = @date.timezone_transition_seconds(
    @date.datetime(2400, 1, 1),
    3600,
  )
  let manual = @date.timezone_seconds(0, transitions=[event])
  let unused_rule = @date.rrule(@date.Daily, exact, count=3, cache=true)
  assert_true(unused_rule.cache_enabled())
  @date.set_epoch("2400-01-01T00:00:00")
  assert_eq(@date.get_epoch(), "2400-01-01T00:00:00")
  verify_reference()
  verify_string_parser_epoch_reference(string_parser)
  verify_format_epoch_reference(calendar_formatter)
  verify_concise_epoch_reference()
  verify_auto_epoch_reference(auto)
  verify_automatic_epoch_reference(automatic)
  verify_converter_epoch_reference(converter_auto, converter_concise)
  verify_rrule_locator_epoch_reference()
  verify_year_locator_epoch_reference()
  verify_named_locator_epoch_reference()
  verify_microsecond_locator_epoch_reference()
  assert_eq(event.at(), 0.0)
  assert_eq(manual.offset_seconds_at(0.0), 3600)
  let first = @date.datetime(2400, 1, 1, microsecond=100)
  let last = @date.datetime(2400, 1, 1, microsecond=1000)
  assert_eq(@date.num2date(first.to_ordinal()).microsecond(), 100)
  let microseconds = @date.microsecond_locator(interval=250).tick_values(
    first.to_ordinal(),
    last.to_ordinal(),
  )
  assert_eq(@date.format_date_ticks(microseconds, format="%H:%M:%S.%f"), [
    "00:00:00.000000", "00:00:00.000250", "00:00:00.000500", "00:00:00.000750", "00:00:00.001000",
    "00:00:00.001250",
  ])
  let start = @date.datetime(2400, 11, 5, hour=5).to_ordinal()
  let end = @date.datetime(2400, 11, 5, hour=7).to_ordinal()
  let fold = @date.date_tick_values(start, end, count=3, timezone=zone)
  assert_eq(@date.format_date_ticks(fold, format="%H:%M %Z", timezone=zone), [
    "01:00 EDT", "01:00 EST", "02:00 EST",
  ])
  let figure = @scene.figure(width=520, height=240)
  figure.plot_date([first, last], [1.0, 2.0])
  figure.set_x_date_locator(@date.microsecond_locator(interval=250))
  figure.axes().set_x_date_format("%H:%M:%S.%f")
  let svg = figure.to_svg()
  assert_true(svg.contains("00:00:00.000250"))
  assert_true(svg.contains("00:00:00.000750"))
  assert_true(!svg.contains("NaN"))
  figure.set_x_date_formatter(@date.concise_date_formatter().as_formatter())
  let concise_svg = figure.to_svg()
  assert_true(concise_svg.contains(">00.00025</text>"))
  assert_true(concise_svg.contains(">2400-Jan-01 00:00</text>"))
}
