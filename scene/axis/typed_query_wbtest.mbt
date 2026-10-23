///|
test "checked calendar queries preserve errors while the legacy convenience result stays empty" {
  let locator = @date.day_locator(tz="UTC")
  let nan = 0.0 / 0.0
  assert_eq(locator.tick_values(nan, 1.0), [])
  assert_true(
    try {
      ignore(locator.tick_values_checked(nan, 1.0))
      false
    } catch {
      @date.DateError::InvalidDate(_) => true
      _ => false
    },
  )
  let value = axis()
  value.set_date_locator(locator)
  value.bind_view_interval(() => (nan, 1.0))
  assert_true(
    try {
      ignore(value.tick_values_checked(@core.limits(0.0, 1.0)))
      false
    } catch {
      @core.DataError::InvalidTicks(_) => true
      _ => false
    },
  )
}

///|
test "shared calendar tick queries use the last installed owner's view for majors and minors" {
  let first = axis()
  let owner = axis()
  first.set_date_locator(@date.day_locator(tz="UTC"))
  first.set_minor_date_locator(@date.day_locator(tz="UTC"))
  owner.share_numeric_tickers(first)
  first.set_limits(0.0, 2.0)
  owner.set_limits(10.0, 12.0)
  owner.bind_locator_data()
  owner.bind_locator_data(minor=true)
  first.set_minor_overlap_removal(false)
  assert_eq(first.tick_values_checked(@core.limits(-100.0, -90.0)), [
    10.0, 11.0, 12.0,
  ])
  assert_eq(first.minor_tick_values_checked(@core.limits(-100.0, -90.0)), [
    10.0, 11.0, 12.0,
  ])
  first.bind_locator_data()
  assert_eq(first.tick_values_checked(@core.limits(0.0, 2.0)), [0.0, 1.0, 2.0])
  assert_eq(first.minor_tick_values_checked(@core.limits(0.0, 2.0)), [
    10.0, 11.0, 12.0,
  ])
}

///|
test "category checked formatting propagates native rounding errors independently of its locator" {
  let value = axis()
  value.set_categories(["zero", "one"])
  assert_eq(value.tick_values_checked(@core.limits(100.0, 200.0)), [0.0, 1.0])
  assert_eq(value.tick_labels_checked([0.5, 1.5, -0.5]), ["zero", "", "zero"])
  assert_true(
    try {
      ignore(value.tick_labels_checked([0.0 / 0.0]))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "cannot convert float NaN to integer"
      _ => false
    },
  )
  assert_true(
    try {
      ignore(value.tick_labels_checked([1.0 / 0.0]))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "cannot convert float infinity to integer"
      _ => false
    },
  )
}

///|
test "explicit date formatter and minor calendar locator do not install a major date locator" {
  let value = axis()
  value.set_locator(@ticker.FixedLocator::new([0.0, 1.0]).as_locator())
  value.set_date_formatter(@date.date_formatter("%Y-%m-%d", tz="UTC"))
  assert_eq(value.tick_values_checked(@core.limits(0.0, 1.0)), [0.0, 1.0])
  assert_eq(value.tick_labels_checked([0.0, 1.0]), ["1970-01-01", "1970-01-02"])
  value.set_minor_date_locator(@date.day_locator(tz="UTC"))
  assert_eq(value.tick_values_checked(@core.limits(0.0, 1.0)), [0.0, 1.0])
  assert_true(value.auto_date_locator() is None)
  assert_true(value.date_formatter() is Some(_))
  value.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  assert_eq(value.tick_labels_checked([0.0]), ["1970-01-01"])
  assert_true(value.date_formatter() is Some(_))
}
