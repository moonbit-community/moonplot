///|
test "major automatic formatter binds the actual locator instead of its initial decoy" {
  let axis = @axis.axis()
  let first = @date.datetime(2018, 9, 30, hour=8).to_ordinal()
  let last = @date.datetime(2018, 9, 30, hour=10, minute=30).to_ordinal()
  axis.set_date_formatter(
    @date.AutoDateFormatter::new(locator=@date.day_locator()).as_formatter(),
  )
  axis.set_date_locator(@date.minute_locator(byminute=[0, 30]))
  let ticks = axis.tick_values(@core.limits(first, last))
  assert_eq(axis.tick_labels(ticks), [
    "30 08:00", "30 08:30", "30 09:00", "30 09:30", "30 10:00", "30 10:30",
  ])
  axis.set_date_locator(@date.hour_locator())
  assert_eq(axis.tick_labels([first]), ["09-30 08"])
  assert_eq(axis.date_formatter().unwrap().format_values([first]), ["09-30 08"])
}

///|
test "minor automatic formatter rebinds after minor locator replacement and preserves major state" {
  let axis = @axis.axis()
  let first = @date.datetime(2018, 9, 30, hour=8).to_ordinal()
  let last = @date.datetime(2018, 9, 30, hour=10, minute=30).to_ordinal()
  axis.set_date_locator(@date.hour_locator())
  axis.set_ticks([])
  axis.set_minor_date_locator(@date.minute_locator(byminute=[5, 55]))
  axis.set_minor_date_formatter(
    @date.AutoDateFormatter::new(locator=@date.year_locator()).as_formatter(),
  )
  axis.set_minor_date_locator(@date.minute_locator(byminute=[15, 45]))
  let view = @core.limits(first, last)
  let ticks = axis.minor_tick_values(view)
  assert_eq(axis.minor_tick_labels(ticks, view~), [
    "30 08:15", "30 08:45", "30 09:15", "30 09:45", "30 10:15",
  ])
  assert_eq(axis.tick_values(view), [])
  axis.clear_minor_date_formatter()
  assert_eq(axis.minor_tick_labels(ticks), ["", "", "", "", ""])
  axis.clear_date()
  assert_true(axis.minor_date_locator() is None)
  assert_true(axis.minor_date_formatter() is None)
}

///|
test "automatic default date formats follow actual generator frequency across zoom" {
  let axis = @axis.axis()
  axis.set_date()
  let first = @date.datetime(2024, 1, 1).to_ordinal()
  let minute_view = @core.limits(first, first + 10.0 / 1440.0)
  let minute_ticks = axis.tick_values(minute_view)
  assert_eq(
    axis.tick_labels_with_view(minute_ticks, Some(minute_view))[0],
    "01 00:00",
  )
  let year_view = @core.limits(first, @date.datetime(2030, 1, 1).to_ordinal())
  let years = axis.tick_values(year_view)
  assert_eq(axis.tick_labels_with_view(years, Some(year_view))[0], "2024")
  axis.set_date_format("%H:%M")
  assert_eq(
    axis.tick_labels_with_view(minute_ticks, Some(year_view))[0],
    "00:00",
  )
}

///|
test "minor date overlap removal and timezone broadcast follow axis configuration" {
  let axis = @axis.axis()
  let first = @date.datetime(2024, 1, 1).to_ordinal()
  let view = @core.limits(first, first + 2.0 / 24.0)
  axis.set_date_locator(@date.hour_locator())
  axis.set_minor_date_locator(@date.minute_locator(byminute=[0, 30]))
  let ticks = axis.minor_tick_values(view)
  assert_eq(@date.format_date_ticks(ticks, format="%H:%M"), ["00:30", "01:30"])
  axis.set_minor_overlap_removal(false)
  assert_eq(axis.minor_tick_values(view).length(), 5)
  axis.set_minor_date_formatter(@date.date_formatter("%H:%M %z"))
  axis.set_date_offset(180)
  assert_eq(axis.minor_date_locator().unwrap().offset_minutes(), 180)
  assert_eq(axis.minor_tick_labels([first]), ["03:00 +0300"])
  axis.clear_minor_locator()
  assert_true(axis.minor_date_locator() is None)
  axis.clear()
  assert_true(axis.minor_overlap_removal())
}

///|
test "default axis formatter captures config when date mode is enabled" {
  @config.reset()
  @config.set_date_autoformatter("minute", "first %H:%M")
  let axis = @axis.axis()
  axis.set_date()
  @config.set_date_autoformatter("minute", "second %H:%M")
  let view = @core.limits(0.0, 10.0 / 1440.0)
  let ticks = axis.tick_values(view)
  assert_eq(axis.tick_labels_with_view(ticks, Some(view))[0], "first 00:00")
  axis.set_date()
  assert_eq(axis.tick_labels_with_view(ticks, Some(view))[0], "second 00:00")
  @config.reset()
}

///|
test "numeric locator replacements bind automatic dates to the missing-unit fallback" {
  let axis = @axis.axis()
  axis.set_date_locator(@date.minute_locator())
  axis.set_date_formatter(
    @date.AutoDateFormatter::new(locator=@date.year_locator()).as_formatter(),
  )
  axis.set_locator(@ticker.Locator::Fixed([0.0]))
  assert_eq(axis.tick_values(@core.limits(0.0, 1.0)), [0.0])
  assert_true(axis.date_locator() is None)
  assert_eq(axis.tick_labels([0.0]), ["1970-01-01"])
  axis.set_minor_date_locator(@date.hour_locator())
  axis.set_minor_date_formatter(
    @date.AutoDateFormatter::new(locator=@date.hour_locator()).as_formatter(),
  )
  axis.set_minor_locator(@ticker.MinorLocator::Fixed([0.0, 0.5, 1.0]))
  assert_true(axis.minor_date_locator() is None)
  assert_eq(axis.minor_tick_values(@core.limits(0.0, 1.0)), [0.5, 1.0])
  assert_eq(axis.minor_tick_labels([0.5]), ["1970-01-01"])
  axis.set_minor_overlap_removal(false)
  assert_eq(axis.minor_tick_values(@core.limits(0.0, 1.0)), [0.0, 0.5, 1.0])
}
