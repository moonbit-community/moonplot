///|
test "date axis captures locator timezone while its automatic labels read current rc" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("XST-5:45")
  let axis = @axis.axis()
  axis.set_date()
  let ticks = axis.tick_values(@core.limits(0.0, 2.0))
  assert_eq(
    axis
    .auto_date_locator()
    .unwrap()
    .as_locator()
    .timezone()
    .unwrap()
    .initial_offset_seconds(),
    20700,
  )
  @config.set_timezone("UTC")
  assert_eq(axis.tick_values(@core.limits(0.0, 2.0)), ticks)
  assert_eq(axis.tick_labels([0.0]), ["01-01 00"])
  axis.set_date_timezone(@date.fixed_timezone(345))
  @config.set_timezone("invalid/D12-zone")
  assert_eq(axis.tick_labels([0.0]), ["01-01 05"])
  axis.set_date_converter(@date.ConciseDateConverter::new().as_converter())
  assert_eq(axis.date_timezone().unwrap().initial_offset_seconds(), 20700)
}

///|
test "invalid date defaults raise DataError atomically and explicit axis units bypass them" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("invalid/D12-zone")
  let axis = @axis.axis()
  axis.set_ticks([0.0, 1.0])
  try axis.set_date() catch {
    @core.DataError::InvalidTicks(_) => ()
    _ => fail("expected invalid date timezone to map to ticks error")
  } noraise {
    _ => fail("expected invalid timezone")
  }
  assert_true(axis.date_format() is None)
  assert_true(axis.date_converter() is None)
  assert_true(axis.auto_date_locator() is None)
  assert_eq(axis.tick_values(@core.limits(5.0, 6.0)), [0.0, 1.0])
  axis.set_date_timezone(@date.fixed_timezone(0))
  axis.set_date_format("%H:%M")
  assert_eq(axis.tick_labels([0.0]), ["00:00"])
  let other = @axis.axis()
  other.set_date_offset(345)
  other.set_date_format("%H:%M")
  assert_eq(other.tick_labels([0.0]), ["05:45"])
}

///|
test "plain date format keeps its captured default after configuration changes" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("XST-5:45")
  let axis = @axis.axis()
  axis.set_date_format("%H:%M %Z")
  @config.set_timezone("UTC")
  assert_eq(axis.tick_labels([0.0]), ["05:45 XST"])
}
