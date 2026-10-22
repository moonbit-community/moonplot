///|
test "fractional microsecond axis binding preserves precise nonsingular span and formatter" {
  let locator = @date.MicrosecondLocator::new(interval=0.25, tz="UTC")
  let axis = @axis.axis()
  axis.set_date_locator(locator.as_locator())
  assert_eq(axis.date_locator().unwrap().interval_value(), 0.25)
  let bounds = axis.date_nonsingular_bounds(0.0, 0.0)
  assert_eq(bounds.lower(), -0.5 / 86400000000.0)
  assert_eq(bounds.upper(), 0.5 / 86400000000.0)
  let view = @core.limits(0.0, 3.0 / 86400000000.0)
  let ticks = axis.tick_values(view)
  assert_true(ticks.length() > 4)
  axis.set_date_offset(345)
  assert_eq(
    axis
    .date_locator()
    .unwrap()
    .microsecond_locator()
    .unwrap()
    .timezone()
    .initial_offset_seconds(),
    20700,
  )
  assert_eq(axis.tick_values(view), ticks)
  axis.set_date_format("%H:%M:%S.%f %z")
  assert_eq(axis.tick_labels([0.0]), ["05:45:00.000000 +0545"])
}
