///|
test "fraction epoch matches independent pinned reference" {
  assert_eq(@date.datestrs2num([]), [])
  let string_parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock=fn() { 946684800000L }),
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
  let zone = @tzdb.timezone("America/New_York")
  let before = @date.datetime(
    2024,
    3,
    10,
    hour=6,
    minute=59,
    second=59,
    microsecond=999999,
  )
  let exact = before.with_timezone(zone)
  assert_eq(exact.microsecond(), 999999)
  assert_eq(exact.offset_seconds(), -18000)
  @date.set_epoch("2000-01-01T00:00:00.123456")
  assert_eq(@date.get_epoch(), "2000-01-01T00:00:00.123456")
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
  let original = @date.datetime(2000, 1, 1)
  assert_eq(original.to_ordinal(), 0.0)
  assert_eq(@date.num2date(0.0).microsecond(), 123456)
  assert_eq(before.with_timezone(zone).microsecond(), 999999)
  // Calendar objects do not pass through the public asymmetric num2date API.
  for cache in [false, true] {
    let rule = @date.rrule(@date.Hourly, original, count=3, cache~)
    assert_eq(rule.all().map(value => value.microsecond()), [0, 0, 0])
    assert_eq(
      rule
      .between(original, @date.datetime(2000, 1, 1, hour=2), inc=true)
      .map(value => value.hour()),
      [0, 1, 2],
    )
    assert_eq(
      rule.before(@date.datetime(2000, 1, 1, hour=1), inc=true).unwrap().hour(),
      1,
    )
  }
}
