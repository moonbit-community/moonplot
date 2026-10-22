///|
test "default date selector uses source maxima and captures alignment on first enable" {
  @config.reset()
  @config.set_date_interval_multiples(false)
  let axis = @axis.axis()
  axis.set_date()
  @config.reset()
  assert_true(!axis.auto_date_locator().unwrap().interval_multiples())
  assert_eq(axis.auto_date_locator().unwrap().max_ticks(@date.Month), 12)
  axis.set_tick_count(3)
  assert_eq(axis.auto_date_locator().unwrap().max_ticks(@date.Month), 3)
  axis.clear_date()
  axis.set_date()
  assert_true(axis.auto_date_locator().unwrap().interval_multiples())
  let preset = @axis.axis()
  preset.set_tick_count(4)
  preset.set_date()
  assert_eq(preset.auto_date_locator().unwrap().max_ticks(@date.Hour), 4)
}

///|
test "automatic locator installation isolates two axes and getter selection state" {
  let original = @date.AutoDateLocator::new()
  let first = @axis.axis()
  let second = @axis.axis()
  first.set_date_locator(original.as_locator())
  second.set_date_locator(original.as_locator())
  ignore(first.tick_values(@core.limits(0.0, 40.0 / 24.0)))
  assert_eq(first.date_locator().unwrap().unit_scale(), 1.0 / 24.0)
  assert_eq(second.date_locator().unwrap().unit_scale(), 365.0)
  assert_eq(original.unit_scale(), 365.0)
  let retrieved = first.date_locator().unwrap()
  ignore(retrieved.tick_values(0.0, 200.0))
  assert_eq(retrieved.unit_scale(), 30.0)
  assert_eq(first.date_locator().unwrap().unit_scale(), 1.0 / 24.0)
}

///|
test "automatic date nonsingular bounds preserve direction and numeric axes retain old behavior" {
  let axis = @axis.axis()
  assert_eq(axis.date_nonsingular_bounds(1.0, 1.0).lower(), 1.0)
  axis.set_date()
  let same = axis.date_nonsingular_bounds(1.0, 1.0)
  assert_eq((same.lower(), same.upper()), (-729.0, 731.0))
  let reverse = axis.date_nonsingular_bounds(2.0, 0.0)
  assert_eq((reverse.lower(), reverse.upper()), (2.0, 0.0))
  let empty = axis.date_nonsingular_bounds(1.0 / 0.0, -1.0 / 0.0)
  assert_eq((empty.lower(), empty.upper()), (0.0, 1.0))
  axis.set_ticks([1.0])
  assert_eq(axis.date_nonsingular_bounds(1.0, 1.0).lower(), 1.0)
}

///|
test "automatic minor locator updates its own formatter without changing major unit" {
  let axis = @axis.axis()
  axis.set_date_locator(@date.year_locator())
  axis.set_minor_date_locator(@date.AutoDateLocator::new().as_locator())
  axis.set_minor_date_formatter(@date.AutoDateFormatter::new().as_formatter())
  let view = @core.limits(0.0, 20.0 / 1440.0)
  let ticks = axis.minor_tick_values(view)
  assert_true(!ticks.is_empty())
  assert_eq(axis.minor_date_locator().unwrap().unit_scale(), 1.0 / 1440.0)
  assert_eq(axis.date_locator().unwrap().unit_scale(), 365.0)
  assert_true(axis.minor_tick_labels(ticks, view~)[0].contains(":"))
}

///|
test "automatic date major and minor keep source spring gap coordinates" {
  let zone = @date.timezone(-300, transitions=[
    @date.timezone_transition(@date.datetime(2024, 3, 10, hour=7), -240),
  ])
  let first = @date.datetime(2024, 3, 10, hour=6).to_ordinal()
  let last = @date.datetime(2024, 3, 10, hour=9).to_ordinal()
  let axis = @axis.axis()
  let auto = @date.AutoDateLocator::new(timezone=zone, minticks=2)
  axis.set_date_locator(auto.as_locator())
  let view = @core.limits(first, last)
  let ticks = axis.tick_values(view)
  assert_eq(ticks, [
    first,
    first,
    @date.datetime(2024, 3, 10, hour=7).to_ordinal(),
    @date.datetime(2024, 3, 10, hour=8).to_ordinal(),
    last,
  ])
  axis.set_minor_date_locator(auto.as_locator())
  axis.set_ticks([])
  axis.set_minor_overlap_removal(false)
  assert_eq(axis.minor_tick_values(view), ticks)
  assert_eq(axis.minor_tick_values(@core.limits(last, first)), ticks.rev())
}
