///|
test "date axis info copy rebinds live formatter to independent selection" {
  let info = @date.DateConverter::new().axisinfo()
  let copy = info.copy()
  let formatter = info.major_formatter()
  let copied_formatter = copy.major_formatter()
  ignore(info.major_locator().tick_values(0.0, 40.0 / 24.0))
  assert_eq(formatter.format_value(0.0), "01-01 00")
  assert_eq(copied_formatter.format_value(0.0), "1970")
  ignore(copy.major_locator().tick_values(0.0, 3652.0))
  assert_eq(copied_formatter.format_value(0.0), "1970")
  assert_eq(formatter.format_value(0.0), "01-01 00")
  assert_eq(info.major_locator().unit_scale(), 1.0 / 24.0)
  assert_eq(copy.major_locator().unit_scale(), 365.0)
}

///|
test "concise converter copies constructor arrays and validates during axis info" {
  let formats = ["%Y", "%m", "%d", "%H:%M", "%H:%M", "%S.%f"]
  let converter = @date.ConciseDateConverter::new(
    formats~,
    interval_multiples=false,
  )
  formats[2] = "%Y"
  let info = converter.as_converter().axisinfo()
  assert_eq(
    info
    .major_formatter()
    .format_values([
      @date.datetime(2024, 1, 30).to_ordinal(),
      @date.datetime(2024, 1, 31).to_ordinal(),
    ]),
    ["30", "31"],
  )
  assert_true(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
  )
  let invalid = @date.ConciseDateConverter::new(formats=["%Y"])
  assert_true(
    try {
      ignore(invalid.axisinfo())
      false
    } catch {
      _ => true
    },
  )
}

///|
test "converter inferred unit retains first rule zone and exact fixed seconds" {
  let converter = @date.DateConverter::new()
  let zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.datetime(2024, 1, 1).with_timezone(zone)
  let fixed = @date.datetime(1900, 1, 1, offset_seconds=561)
  let rule = converter.default_units([first, fixed]).unwrap()
  assert_eq(
    rule.offset_seconds_at(@date.datetime(2024, 7, 1).to_ordinal()),
    -14400,
  )
  assert_eq(converter.default_unit(fixed).offset_seconds_at(0.0), 561)
  assert_eq(
    converter.default_units([fixed, first]).unwrap().offset_seconds_at(0.0),
    561,
  )
  assert_true(converter.default_units([]) is None)
}

///|
test "default converter reads rc per dispatch and constructed values retain snapshot" {
  @config.reset()
  @config.set_date_interval_multiples(false)
  let auto = @date.default_date_converter()
  @config.set_date_converter("concise")
  let concise = @date.default_date_converter()
  @config.reset()
  assert_true(!auto.interval_multiples())
  assert_true(concise.interval_multiples())
  let ticks = [
    @date.datetime(2024, 1, 30).to_ordinal(),
    @date.datetime(2024, 1, 31).to_ordinal(),
  ]
  assert_eq(concise.axisinfo().major_formatter().format_values(ticks), [
    "30", "31",
  ])
  assert_eq(auto.axisinfo().major_formatter().format_values(ticks), [
    "2024", "2024",
  ])
}
