// Generated from pinned v3.11.2 converter classes.

///|
test "date converter reference 0: auto/False/none/141 days, 0:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=false)
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19873.129989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    false,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19873.129989854813)
  assert_eq(ticks, [
    19737.0, 19758.0, 19779.0, 19800.0, 19821.0, 19842.0, 19863.0,
  ])
  assert_eq(formatter.format_values(ticks), [
    "2024-01-15", "2024-02-05", "2024-02-26", "2024-03-18", "2024-04-08", "2024-04-29",
    "2024-05-20",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 1: auto/False/none/1 day, 16:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=false)
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19733.79665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    false,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19733.79665652148)
  assert_eq(ticks, [
    19732.291666666668, 19732.458333333332, 19732.625, 19732.791666666668, 19732.958333333332,
    19733.125, 19733.291666666668, 19733.458333333332, 19733.625, 19733.791666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "01-10 07", "01-10 11", "01-10 15", "01-10 19", "01-10 23", "01-11 03", "01-11 07",
    "01-11 11", "01-11 15", "01-11 19",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 2: auto/False/UTC/141 days, 0:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=false)
  let zone = @date.fixed_timezone_seconds(0)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19873.129989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    false,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19873.129989854813)
  assert_eq(ticks, [
    19737.0, 19758.0, 19779.0, 19800.0, 19821.0, 19842.0, 19863.0,
  ])
  assert_eq(formatter.format_values(ticks), [
    "2024-01-15", "2024-02-05", "2024-02-26", "2024-03-18", "2024-04-08", "2024-04-29",
    "2024-05-20",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 3: auto/False/UTC/1 day, 16:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=false)
  let zone = @date.fixed_timezone_seconds(0)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19733.79665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    false,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19733.79665652148)
  assert_eq(ticks, [
    19732.291666666668, 19732.458333333332, 19732.625, 19732.791666666668, 19732.958333333332,
    19733.125, 19733.291666666668, 19733.458333333332, 19733.625, 19733.791666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "01-10 07", "01-10 11", "01-10 15", "01-10 19", "01-10 23", "01-11 03", "01-11 07",
    "01-11 11", "01-11 15", "01-11 19",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 4: auto/False/seconds/141 days, 0:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=false)
  let zone = @date.fixed_timezone_seconds(561)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:09:21"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:09:21"),
  ]
  assert_eq(converter.convert(dates), [19732.12349679926, 19873.12349679926])
  assert_eq(converter.convert_value(dates[0]), 19732.12349679926)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.12349679926),
    561,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    false,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.12349679926, 19873.12349679926)
  assert_eq(ticks, [
    19736.993506944444, 19757.993506944444, 19778.993506944444, 19799.993506944444,
    19820.993506944444, 19841.993506944444, 19862.993506944444,
  ])
  assert_eq(formatter.format_values(ticks), [
    "2024-01-15", "2024-02-05", "2024-02-26", "2024-03-18", "2024-04-08", "2024-04-29",
    "2024-05-20",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 5: auto/False/seconds/1 day, 16:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=false)
  let zone = @date.fixed_timezone_seconds(561)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:09:21"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:09:21"),
  ]
  assert_eq(converter.convert(dates), [19732.12349679926, 19733.790163465925])
  assert_eq(converter.convert_value(dates[0]), 19732.12349679926)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.12349679926),
    561,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    false,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.12349679926, 19733.790163465925)
  assert_eq(ticks, [
    19732.28517361111, 19732.45184027778, 19732.618506944444, 19732.78517361111,
    19732.95184027778, 19733.118506944444, 19733.28517361111, 19733.45184027778,
    19733.618506944444, 19733.78517361111,
  ])
  assert_eq(formatter.format_values(ticks), [
    "01-10 07", "01-10 11", "01-10 15", "01-10 19", "01-10 23", "01-11 03", "01-11 07",
    "01-11 11", "01-11 15", "01-11 19",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 6: auto/False/NY/141 days, 0:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=false)
  let zone = @date.tzif_timezone(tzif_new_york)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456-05:00").with_timezone(zone),
    @date.parse_iso("2024-05-30T03:07:11.123456-04:00").with_timezone(zone),
  ]
  assert_eq(converter.convert(dates), [19732.33832318815, 19873.29665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.33832318815)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.33832318815),
    -18000,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    false,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.33832318815, 19873.29665652148)
  assert_eq(ticks, [
    19737.208333333332, 19758.208333333332, 19779.208333333332, 19800.166666666668,
    19821.166666666668, 19842.166666666668, 19863.166666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "2024-01-15", "2024-02-05", "2024-02-26", "2024-03-18", "2024-04-08", "2024-04-29",
    "2024-05-20",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 7: auto/False/NY/1 day, 16:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=false)
  let zone = @date.tzif_timezone(tzif_new_york)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456-05:00").with_timezone(zone),
    @date.parse_iso("2024-01-11T19:07:11.123456-05:00").with_timezone(zone),
  ]
  assert_eq(converter.convert(dates), [19732.33832318815, 19734.004989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.33832318815)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.33832318815),
    -18000,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    false,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.33832318815, 19734.004989854813)
  assert_eq(ticks, [
    19732.5, 19732.666666666668, 19732.833333333332, 19733.0, 19733.166666666668,
    19733.333333333332, 19733.5, 19733.666666666668, 19733.833333333332, 19734.0,
  ])
  assert_eq(formatter.format_values(ticks), [
    "01-10 07", "01-10 11", "01-10 15", "01-10 19", "01-10 23", "01-11 03", "01-11 07",
    "01-11 11", "01-11 15", "01-11 19",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 8: auto/True/none/141 days, 0:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=true)
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19873.129989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19873.129989854813)
  assert_eq(ticks, [
    19737.0, 19754.0, 19768.0, 19783.0, 19797.0, 19814.0, 19828.0, 19844.0, 19858.0,
  ])
  assert_eq(formatter.format_values(ticks), [
    "2024-01-15", "2024-02-01", "2024-02-15", "2024-03-01", "2024-03-15", "2024-04-01",
    "2024-04-15", "2024-05-01", "2024-05-15",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 9: auto/True/none/1 day, 16:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=true)
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19733.79665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19733.79665652148)
  assert_eq(ticks, [
    19732.166666666668, 19732.333333333332, 19732.5, 19732.666666666668, 19732.833333333332,
    19733.0, 19733.166666666668, 19733.333333333332, 19733.5, 19733.666666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "01-10 04", "01-10 08", "01-10 12", "01-10 16", "01-10 20", "01-11 00", "01-11 04",
    "01-11 08", "01-11 12", "01-11 16",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 10: auto/True/UTC/141 days, 0:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=true)
  let zone = @date.fixed_timezone_seconds(0)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19873.129989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19873.129989854813)
  assert_eq(ticks, [
    19737.0, 19754.0, 19768.0, 19783.0, 19797.0, 19814.0, 19828.0, 19844.0, 19858.0,
  ])
  assert_eq(formatter.format_values(ticks), [
    "2024-01-15", "2024-02-01", "2024-02-15", "2024-03-01", "2024-03-15", "2024-04-01",
    "2024-04-15", "2024-05-01", "2024-05-15",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 11: auto/True/UTC/1 day, 16:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=true)
  let zone = @date.fixed_timezone_seconds(0)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19733.79665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19733.79665652148)
  assert_eq(ticks, [
    19732.166666666668, 19732.333333333332, 19732.5, 19732.666666666668, 19732.833333333332,
    19733.0, 19733.166666666668, 19733.333333333332, 19733.5, 19733.666666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "01-10 04", "01-10 08", "01-10 12", "01-10 16", "01-10 20", "01-11 00", "01-11 04",
    "01-11 08", "01-11 12", "01-11 16",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 12: auto/True/seconds/141 days, 0:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=true)
  let zone = @date.fixed_timezone_seconds(561)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:09:21"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:09:21"),
  ]
  assert_eq(converter.convert(dates), [19732.12349679926, 19873.12349679926])
  assert_eq(converter.convert_value(dates[0]), 19732.12349679926)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.12349679926),
    561,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.12349679926, 19873.12349679926)
  assert_eq(ticks, [
    19736.993506944444, 19753.993506944444, 19767.993506944444, 19782.993506944444,
    19796.993506944444, 19813.993506944444, 19827.993506944444, 19843.993506944444,
    19857.993506944444,
  ])
  assert_eq(formatter.format_values(ticks), [
    "2024-01-15", "2024-02-01", "2024-02-15", "2024-03-01", "2024-03-15", "2024-04-01",
    "2024-04-15", "2024-05-01", "2024-05-15",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 13: auto/True/seconds/1 day, 16:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=true)
  let zone = @date.fixed_timezone_seconds(561)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:09:21"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:09:21"),
  ]
  assert_eq(converter.convert(dates), [19732.12349679926, 19733.790163465925])
  assert_eq(converter.convert_value(dates[0]), 19732.12349679926)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.12349679926),
    561,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.12349679926, 19733.790163465925)
  assert_eq(ticks, [
    19732.16017361111, 19732.32684027778, 19732.493506944444, 19732.66017361111,
    19732.82684027778, 19732.993506944444, 19733.16017361111, 19733.32684027778,
    19733.493506944444, 19733.66017361111,
  ])
  assert_eq(formatter.format_values(ticks), [
    "01-10 04", "01-10 08", "01-10 12", "01-10 16", "01-10 20", "01-11 00", "01-11 04",
    "01-11 08", "01-11 12", "01-11 16",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 14: auto/True/NY/141 days, 0:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=true)
  let zone = @date.tzif_timezone(tzif_new_york)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456-05:00").with_timezone(zone),
    @date.parse_iso("2024-05-30T03:07:11.123456-04:00").with_timezone(zone),
  ]
  assert_eq(converter.convert(dates), [19732.33832318815, 19873.29665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.33832318815)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.33832318815),
    -18000,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.33832318815, 19873.29665652148)
  assert_eq(ticks, [
    19737.208333333332, 19754.208333333332, 19768.208333333332, 19783.208333333332,
    19797.166666666668, 19814.166666666668, 19828.166666666668, 19844.166666666668,
    19858.166666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "2024-01-15", "2024-02-01", "2024-02-15", "2024-03-01", "2024-03-15", "2024-04-01",
    "2024-04-15", "2024-05-01", "2024-05-15",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 15: auto/True/NY/1 day, 16:00:00" {
  let converter = @date.DateConverter::new(interval_multiples=true)
  let zone = @date.tzif_timezone(tzif_new_york)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456-05:00").with_timezone(zone),
    @date.parse_iso("2024-01-11T19:07:11.123456-05:00").with_timezone(zone),
  ]
  assert_eq(converter.convert(dates), [19732.33832318815, 19734.004989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.33832318815)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.33832318815),
    -18000,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.33832318815, 19734.004989854813)
  assert_eq(ticks, [
    19732.375, 19732.541666666668, 19732.708333333332, 19732.875, 19733.041666666668,
    19733.208333333332, 19733.375, 19733.541666666668, 19733.708333333332, 19733.875,
  ])
  assert_eq(formatter.format_values(ticks), [
    "01-10 04", "01-10 08", "01-10 12", "01-10 16", "01-10 20", "01-11 00", "01-11 04",
    "01-11 08", "01-11 12", "01-11 16",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 16: concise/False/none/141 days, 0:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=false)
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19873.129989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19873.129989854813)
  assert_eq(ticks, [
    19737.0, 19754.0, 19768.0, 19783.0, 19797.0, 19814.0, 19828.0, 19844.0, 19858.0,
  ])
  assert_eq(formatter.format_values(ticks), [
    "15", "Feb", "15", "Mar", "15", "Apr", "15", "May", "15",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-May")
}

///|
test "date converter reference 17: concise/False/none/1 day, 16:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=false)
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19733.79665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19733.79665652148)
  assert_eq(ticks, [
    19732.166666666668, 19732.333333333332, 19732.5, 19732.666666666668, 19732.833333333332,
    19733.0, 19733.166666666668, 19733.333333333332, 19733.5, 19733.666666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "04:00", "08:00", "12:00", "16:00", "20:00", "Jan-11", "04:00", "08:00", "12:00",
    "16:00",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-Jan-11")
}

///|
test "date converter reference 18: concise/False/UTC/141 days, 0:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=false)
  let zone = @date.fixed_timezone_seconds(0)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19873.129989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19873.129989854813)
  assert_eq(ticks, [
    19737.0, 19754.0, 19768.0, 19783.0, 19797.0, 19814.0, 19828.0, 19844.0, 19858.0,
  ])
  assert_eq(formatter.format_values(ticks), [
    "15", "Feb", "15", "Mar", "15", "Apr", "15", "May", "15",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-May")
}

///|
test "date converter reference 19: concise/False/UTC/1 day, 16:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=false)
  let zone = @date.fixed_timezone_seconds(0)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19733.79665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19733.79665652148)
  assert_eq(ticks, [
    19732.166666666668, 19732.333333333332, 19732.5, 19732.666666666668, 19732.833333333332,
    19733.0, 19733.166666666668, 19733.333333333332, 19733.5, 19733.666666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "04:00", "08:00", "12:00", "16:00", "20:00", "Jan-11", "04:00", "08:00", "12:00",
    "16:00",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-Jan-11")
}

///|
test "date converter reference 20: concise/False/seconds/141 days, 0:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=false)
  let zone = @date.fixed_timezone_seconds(561)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:09:21"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:09:21"),
  ]
  assert_eq(converter.convert(dates), [19732.12349679926, 19873.12349679926])
  assert_eq(converter.convert_value(dates[0]), 19732.12349679926)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.12349679926),
    561,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.12349679926, 19873.12349679926)
  assert_eq(ticks, [
    19736.993506944444, 19753.993506944444, 19767.993506944444, 19782.993506944444,
    19796.993506944444, 19813.993506944444, 19827.993506944444, 19843.993506944444,
    19857.993506944444,
  ])
  assert_eq(formatter.format_values(ticks), [
    "15", "Feb", "15", "Mar", "15", "Apr", "15", "May", "15",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-May")
}

///|
test "date converter reference 21: concise/False/seconds/1 day, 16:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=false)
  let zone = @date.fixed_timezone_seconds(561)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:09:21"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:09:21"),
  ]
  assert_eq(converter.convert(dates), [19732.12349679926, 19733.790163465925])
  assert_eq(converter.convert_value(dates[0]), 19732.12349679926)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.12349679926),
    561,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.12349679926, 19733.790163465925)
  assert_eq(ticks, [
    19732.16017361111, 19732.32684027778, 19732.493506944444, 19732.66017361111,
    19732.82684027778, 19732.993506944444, 19733.16017361111, 19733.32684027778,
    19733.493506944444, 19733.66017361111,
  ])
  assert_eq(formatter.format_values(ticks), [
    "04:00", "08:00", "12:00", "16:00", "20:00", "Jan-11", "04:00", "08:00", "12:00",
    "16:00",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-Jan-11")
}

///|
test "date converter reference 22: concise/False/NY/141 days, 0:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=false)
  let zone = @date.tzif_timezone(tzif_new_york)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456-05:00").with_timezone(zone),
    @date.parse_iso("2024-05-30T03:07:11.123456-04:00").with_timezone(zone),
  ]
  assert_eq(converter.convert(dates), [19732.33832318815, 19873.29665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.33832318815)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.33832318815),
    -18000,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.33832318815, 19873.29665652148)
  assert_eq(ticks, [
    19737.208333333332, 19754.208333333332, 19768.208333333332, 19783.208333333332,
    19797.166666666668, 19814.166666666668, 19828.166666666668, 19844.166666666668,
    19858.166666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "15", "Feb", "15", "Mar", "15", "Apr", "15", "May", "15",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-May")
}

///|
test "date converter reference 23: concise/False/NY/1 day, 16:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=false)
  let zone = @date.tzif_timezone(tzif_new_york)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456-05:00").with_timezone(zone),
    @date.parse_iso("2024-01-11T19:07:11.123456-05:00").with_timezone(zone),
  ]
  assert_eq(converter.convert(dates), [19732.33832318815, 19734.004989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.33832318815)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.33832318815),
    -18000,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.33832318815, 19734.004989854813)
  assert_eq(ticks, [
    19732.375, 19732.541666666668, 19732.708333333332, 19732.875, 19733.041666666668,
    19733.208333333332, 19733.375, 19733.541666666668, 19733.708333333332, 19733.875,
  ])
  assert_eq(formatter.format_values(ticks), [
    "04:00", "08:00", "12:00", "16:00", "20:00", "Jan-11", "04:00", "08:00", "12:00",
    "16:00",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-Jan-11")
}

///|
test "date converter reference 24: concise/True/none/141 days, 0:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=true)
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19873.129989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19873.129989854813)
  assert_eq(ticks, [
    19737.0, 19754.0, 19768.0, 19783.0, 19797.0, 19814.0, 19828.0, 19844.0, 19858.0,
  ])
  assert_eq(formatter.format_values(ticks), [
    "15", "Feb", "15", "Mar", "15", "Apr", "15", "May", "15",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-May")
}

///|
test "date converter reference 25: concise/True/none/1 day, 16:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=true)
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19733.79665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19733.79665652148)
  assert_eq(ticks, [
    19732.166666666668, 19732.333333333332, 19732.5, 19732.666666666668, 19732.833333333332,
    19733.0, 19733.166666666668, 19733.333333333332, 19733.5, 19733.666666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "04:00", "08:00", "12:00", "16:00", "20:00", "Jan-11", "04:00", "08:00", "12:00",
    "16:00",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-Jan-11")
}

///|
test "date converter reference 26: concise/True/UTC/141 days, 0:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=true)
  let zone = @date.fixed_timezone_seconds(0)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19873.129989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19873.129989854813)
  assert_eq(ticks, [
    19737.0, 19754.0, 19768.0, 19783.0, 19797.0, 19814.0, 19828.0, 19844.0, 19858.0,
  ])
  assert_eq(formatter.format_values(ticks), [
    "15", "Feb", "15", "Mar", "15", "Apr", "15", "May", "15",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-May")
}

///|
test "date converter reference 27: concise/True/UTC/1 day, 16:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=true)
  let zone = @date.fixed_timezone_seconds(0)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19733.79665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19733.79665652148)
  assert_eq(ticks, [
    19732.166666666668, 19732.333333333332, 19732.5, 19732.666666666668, 19732.833333333332,
    19733.0, 19733.166666666668, 19733.333333333332, 19733.5, 19733.666666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "04:00", "08:00", "12:00", "16:00", "20:00", "Jan-11", "04:00", "08:00", "12:00",
    "16:00",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-Jan-11")
}

///|
test "date converter reference 28: concise/True/seconds/141 days, 0:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=true)
  let zone = @date.fixed_timezone_seconds(561)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:09:21"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:09:21"),
  ]
  assert_eq(converter.convert(dates), [19732.12349679926, 19873.12349679926])
  assert_eq(converter.convert_value(dates[0]), 19732.12349679926)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.12349679926),
    561,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.12349679926, 19873.12349679926)
  assert_eq(ticks, [
    19736.993506944444, 19753.993506944444, 19767.993506944444, 19782.993506944444,
    19796.993506944444, 19813.993506944444, 19827.993506944444, 19843.993506944444,
    19857.993506944444,
  ])
  assert_eq(formatter.format_values(ticks), [
    "15", "Feb", "15", "Mar", "15", "Apr", "15", "May", "15",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-May")
}

///|
test "date converter reference 29: concise/True/seconds/1 day, 16:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=true)
  let zone = @date.fixed_timezone_seconds(561)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:09:21"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:09:21"),
  ]
  assert_eq(converter.convert(dates), [19732.12349679926, 19733.790163465925])
  assert_eq(converter.convert_value(dates[0]), 19732.12349679926)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.12349679926),
    561,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.12349679926, 19733.790163465925)
  assert_eq(ticks, [
    19732.16017361111, 19732.32684027778, 19732.493506944444, 19732.66017361111,
    19732.82684027778, 19732.993506944444, 19733.16017361111, 19733.32684027778,
    19733.493506944444, 19733.66017361111,
  ])
  assert_eq(formatter.format_values(ticks), [
    "04:00", "08:00", "12:00", "16:00", "20:00", "Jan-11", "04:00", "08:00", "12:00",
    "16:00",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-Jan-11")
}

///|
test "date converter reference 30: concise/True/NY/141 days, 0:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=true)
  let zone = @date.tzif_timezone(tzif_new_york)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456-05:00").with_timezone(zone),
    @date.parse_iso("2024-05-30T03:07:11.123456-04:00").with_timezone(zone),
  ]
  assert_eq(converter.convert(dates), [19732.33832318815, 19873.29665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.33832318815)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.33832318815),
    -18000,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.33832318815, 19873.29665652148)
  assert_eq(ticks, [
    19737.208333333332, 19754.208333333332, 19768.208333333332, 19783.208333333332,
    19797.166666666668, 19814.166666666668, 19828.166666666668, 19844.166666666668,
    19858.166666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "15", "Feb", "15", "Mar", "15", "Apr", "15", "May", "15",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-May")
}

///|
test "date converter reference 31: concise/True/NY/1 day, 16:00:00" {
  let converter = @date.ConciseDateConverter::new(interval_multiples=true)
  let zone = @date.tzif_timezone(tzif_new_york)
  let info = converter.axisinfo(unit=zone)
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456-05:00").with_timezone(zone),
    @date.parse_iso("2024-01-11T19:07:11.123456-05:00").with_timezone(zone),
  ]
  assert_eq(converter.convert(dates), [19732.33832318815, 19734.004989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.33832318815)
  assert_eq(
    converter.default_units(dates).unwrap().offset_seconds_at(19732.33832318815),
    -18000,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.33832318815, 19734.004989854813)
  assert_eq(ticks, [
    19732.375, 19732.541666666668, 19732.708333333332, 19732.875, 19733.041666666668,
    19733.208333333332, 19733.375, 19733.541666666668, 19733.708333333332, 19733.875,
  ])
  assert_eq(formatter.format_values(ticks), [
    "04:00", "08:00", "12:00", "16:00", "20:00", "Jan-11", "04:00", "08:00", "12:00",
    "16:00",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-Jan-11")
}

///|
test "date converter reference 32: concise/False/custom/141 days, 0:00:00" {
  let converter = @date.ConciseDateConverter::new(
    interval_multiples=false,
    formats=["%Y", "%m", "%d", "%H:%M", "%H:%M", "%S.%f"],
    zero_formats=["", "%Y", "%m", "%d", "%H", "%M"],
    offset_formats=["", "%Y", "%Y-%m", "%Y-%m-%d", "%Y-%m-%d", "%Y-%m-%d %H:%M"],
    show_offset=false,
  )
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19873.129989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19873.129989854813)
  assert_eq(ticks, [
    19737.0, 19754.0, 19768.0, 19783.0, 19797.0, 19814.0, 19828.0, 19844.0, 19858.0,
  ])
  assert_eq(formatter.format_values(ticks), [
    "15", "02", "15", "03", "15", "04", "15", "05", "15",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 33: concise/False/custom/1 day, 16:00:00" {
  let converter = @date.ConciseDateConverter::new(
    interval_multiples=false,
    formats=["%Y", "%m", "%d", "%H:%M", "%H:%M", "%S.%f"],
    zero_formats=["", "%Y", "%m", "%d", "%H", "%M"],
    offset_formats=["", "%Y", "%Y-%m", "%Y-%m-%d", "%Y-%m-%d", "%Y-%m-%d %H:%M"],
    show_offset=false,
  )
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19733.79665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19733.79665652148)
  assert_eq(ticks, [
    19732.166666666668, 19732.333333333332, 19732.5, 19732.666666666668, 19732.833333333332,
    19733.0, 19733.166666666668, 19733.333333333332, 19733.5, 19733.666666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "04:00", "08:00", "12:00", "16:00", "20:00", "11", "04:00", "08:00", "12:00",
    "16:00",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 34: concise/False/custom/141 days, 0:00:00" {
  let converter = @date.ConciseDateConverter::new(
    interval_multiples=false,
    formats=["%Y", "%m", "%d", "%H:%M", "%H:%M", "%S.%f"],
    zero_formats=["", "%Y", "%m", "%d", "%H", "%M"],
    offset_formats=["", "%Y", "%Y-%m", "%Y-%m-%d", "%Y-%m-%d", "%Y-%m-%d %H:%M"],
    show_offset=true,
  )
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19873.129989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19873.129989854813)
  assert_eq(ticks, [
    19737.0, 19754.0, 19768.0, 19783.0, 19797.0, 19814.0, 19828.0, 19844.0, 19858.0,
  ])
  assert_eq(formatter.format_values(ticks), [
    "15", "02", "15", "03", "15", "04", "15", "05", "15",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-05")
}

///|
test "date converter reference 35: concise/False/custom/1 day, 16:00:00" {
  let converter = @date.ConciseDateConverter::new(
    interval_multiples=false,
    formats=["%Y", "%m", "%d", "%H:%M", "%H:%M", "%S.%f"],
    zero_formats=["", "%Y", "%m", "%d", "%H", "%M"],
    offset_formats=["", "%Y", "%Y-%m", "%Y-%m-%d", "%Y-%m-%d", "%Y-%m-%d %H:%M"],
    show_offset=true,
  )
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19733.79665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19733.79665652148)
  assert_eq(ticks, [
    19732.166666666668, 19732.333333333332, 19732.5, 19732.666666666668, 19732.833333333332,
    19733.0, 19733.166666666668, 19733.333333333332, 19733.5, 19733.666666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "04:00", "08:00", "12:00", "16:00", "20:00", "11", "04:00", "08:00", "12:00",
    "16:00",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-01-11")
}

///|
test "date converter reference 36: concise/True/custom/141 days, 0:00:00" {
  let converter = @date.ConciseDateConverter::new(
    interval_multiples=true,
    formats=["%Y", "%m", "%d", "%H:%M", "%H:%M", "%S.%f"],
    zero_formats=["", "%Y", "%m", "%d", "%H", "%M"],
    offset_formats=["", "%Y", "%Y-%m", "%Y-%m-%d", "%Y-%m-%d", "%Y-%m-%d %H:%M"],
    show_offset=false,
  )
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19873.129989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19873.129989854813)
  assert_eq(ticks, [
    19737.0, 19754.0, 19768.0, 19783.0, 19797.0, 19814.0, 19828.0, 19844.0, 19858.0,
  ])
  assert_eq(formatter.format_values(ticks), [
    "15", "02", "15", "03", "15", "04", "15", "05", "15",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 37: concise/True/custom/1 day, 16:00:00" {
  let converter = @date.ConciseDateConverter::new(
    interval_multiples=true,
    formats=["%Y", "%m", "%d", "%H:%M", "%H:%M", "%S.%f"],
    zero_formats=["", "%Y", "%m", "%d", "%H", "%M"],
    offset_formats=["", "%Y", "%Y-%m", "%Y-%m-%d", "%Y-%m-%d", "%Y-%m-%d %H:%M"],
    show_offset=false,
  )
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19733.79665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19733.79665652148)
  assert_eq(ticks, [
    19732.166666666668, 19732.333333333332, 19732.5, 19732.666666666668, 19732.833333333332,
    19733.0, 19733.166666666668, 19733.333333333332, 19733.5, 19733.666666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "04:00", "08:00", "12:00", "16:00", "20:00", "11", "04:00", "08:00", "12:00",
    "16:00",
  ])
  assert_eq(formatter.offset_label(ticks), "")
}

///|
test "date converter reference 38: concise/True/custom/141 days, 0:00:00" {
  let converter = @date.ConciseDateConverter::new(
    interval_multiples=true,
    formats=["%Y", "%m", "%d", "%H:%M", "%H:%M", "%S.%f"],
    zero_formats=["", "%Y", "%m", "%d", "%H", "%M"],
    offset_formats=["", "%Y", "%Y-%m", "%Y-%m-%d", "%Y-%m-%d", "%Y-%m-%d %H:%M"],
    show_offset=true,
  )
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-05-30T03:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19873.129989854813])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19873.129989854813)
  assert_eq(ticks, [
    19737.0, 19754.0, 19768.0, 19783.0, 19797.0, 19814.0, 19828.0, 19844.0, 19858.0,
  ])
  assert_eq(formatter.format_values(ticks), [
    "15", "02", "15", "03", "15", "04", "15", "05", "15",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-05")
}

///|
test "date converter reference 39: concise/True/custom/1 day, 16:00:00" {
  let converter = @date.ConciseDateConverter::new(
    interval_multiples=true,
    formats=["%Y", "%m", "%d", "%H:%M", "%H:%M", "%S.%f"],
    zero_formats=["", "%Y", "%m", "%d", "%H", "%M"],
    offset_formats=["", "%Y", "%Y-%m", "%Y-%m-%d", "%Y-%m-%d", "%Y-%m-%d %H:%M"],
    show_offset=true,
  )
  let info = converter.axisinfo()
  let dates = [
    @date.parse_iso("2024-01-10T03:07:11.123456+00:00"),
    @date.parse_iso("2024-01-11T19:07:11.123456+00:00"),
  ]
  assert_eq(converter.convert(dates), [19732.129989854813, 19733.79665652148])
  assert_eq(converter.convert_value(dates[0]), 19732.129989854813)
  assert_eq(
    converter
    .default_units(dates)
    .unwrap()
    .offset_seconds_at(19732.129989854813),
    0,
  )
  assert_true(converter.default_units([]) is None)
  assert_eq(info.label(), "")
  assert_eq(
    @date.format_date(info.default_limits().0, "%Y-%m-%d"),
    "1970-01-01",
  )
  assert_eq(
    @date.format_date(info.default_limits().1, "%Y-%m-%d"),
    "1970-01-02",
  )
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let formatter = info.major_formatter()
  let ticks = info
    .major_locator()
    .tick_values(19732.129989854813, 19733.79665652148)
  assert_eq(ticks, [
    19732.166666666668, 19732.333333333332, 19732.5, 19732.666666666668, 19732.833333333332,
    19733.0, 19733.166666666668, 19733.333333333332, 19733.5, 19733.666666666668,
  ])
  assert_eq(formatter.format_values(ticks), [
    "04:00", "08:00", "12:00", "16:00", "20:00", "11", "04:00", "08:00", "12:00",
    "16:00",
  ])
  assert_eq(formatter.offset_label(ticks), "2024-01-11")
}

///|
test "switchable date converter reference: auto/False" {
  @config.reset()
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(false)
  let info = @date.default_date_converter().axisinfo()
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    false,
  )
  let ticks = info.major_locator().tick_values(0.0, 1.6666666666666667)
  assert_eq(info.major_formatter().format_values(ticks), [
    "01-01 00", "01-01 04", "01-01 08", "01-01 12", "01-01 16", "01-01 20", "01-02 00",
    "01-02 04", "01-02 08", "01-02 12", "01-02 16",
  ])
  @config.reset()
}

///|
test "switchable date converter reference: auto/True" {
  @config.reset()
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let info = @date.default_date_converter().axisinfo()
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let ticks = info.major_locator().tick_values(0.0, 1.6666666666666667)
  assert_eq(info.major_formatter().format_values(ticks), [
    "01-01 00", "01-01 04", "01-01 08", "01-01 12", "01-01 16", "01-01 20", "01-02 00",
    "01-02 04", "01-02 08", "01-02 12", "01-02 16",
  ])
  @config.reset()
}

///|
test "switchable date converter reference: concise/False" {
  @config.reset()
  @config.set_date_converter("concise")
  @config.set_date_interval_multiples(false)
  let info = @date.default_date_converter().axisinfo()
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let ticks = info.major_locator().tick_values(0.0, 1.6666666666666667)
  assert_eq(info.major_formatter().format_values(ticks), [
    "Jan-01", "04:00", "08:00", "12:00", "16:00", "20:00", "Jan-02", "04:00", "08:00",
    "12:00", "16:00",
  ])
  @config.reset()
}

///|
test "switchable date converter reference: concise/True" {
  @config.reset()
  @config.set_date_converter("concise")
  @config.set_date_interval_multiples(true)
  let info = @date.default_date_converter().axisinfo()
  assert_eq(
    info.major_locator().automatic_locator().unwrap().interval_multiples(),
    true,
  )
  let ticks = info.major_locator().tick_values(0.0, 1.6666666666666667)
  assert_eq(info.major_formatter().format_values(ticks), [
    "Jan-01", "04:00", "08:00", "12:00", "16:00", "20:00", "Jan-02", "04:00", "08:00",
    "12:00", "16:00",
  ])
  @config.reset()
}
