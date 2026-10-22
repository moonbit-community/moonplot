///|
test "axis date offsets update calendar locator and labels together" {
  let axis = @axis.axis()
  axis.set_date_locator(@date.hour_locator().with_offset(345))
  assert_eq(axis.date_offset_minutes(), 345)
  // HourLocator uses the hour rc format even for a one-value label request.
  assert_eq(axis.tick_labels([0.0]), ["01-01 05"])
  axis.set_date_format("%H:%M %z")
  axis.set_date_offset(-210)
  assert_eq(axis.date_locator().unwrap().offset_minutes(), -210)
  assert_eq(axis.tick_labels([0.0]), ["20:30 -0330"])
  let ticks = axis.tick_values(@core.limits(0.0, 2.0 / 24.0))
  assert_eq(axis.tick_labels(ticks), ["21:00 -0330", "22:00 -0330"])
  try axis.set_date_offset(1440) catch {
    @core.DataError::InvalidTicks(_) => ()
    _ => fail("expected date offset validation")
  } noraise {
    _ => fail("expected date offset validation")
  }
  assert_eq(axis.date_offset_minutes(), -210)
  assert_eq(axis.date_locator().unwrap().offset_minutes(), -210)
  axis.clear_date()
  assert_eq(axis.date_format(), None)
  match axis.date_locator() {
    None => ()
    Some(_) => fail("date locator should be cleared")
  }
  assert_eq(axis.date_offset_minutes(), 0)
}

///|
test "enabling date formatting preserves fixed ticks and labels" {
  let axis = @axis.axis()
  axis.set_ticks([0.0, 1.0])
  axis.set_tick_labels(["first", "last"])
  axis.set_date_offset(345)
  axis.set_date_format("%H:%M %z")
  assert_eq(axis.tick_values(@core.limits(10.0, 20.0)), [0.0, 1.0])
  assert_eq(axis.tick_labels([0.0, 1.0]), ["first", "last"])
}

///|
test "axis date labels follow explicit timezone transitions" {
  let zone = try! @date.timezone(-300, transitions=[
    try! @date.timezone_transition(@date.datetime(2024, 3, 10, hour=7), -240),
  ])
  let axis = @axis.axis()
  try! axis.set_date_timezone(zone)
  axis.set_date_format("%H:%M %z")
  let before = try! @date.datetime(2024, 3, 10, hour=6, minute=59).to_ordinal()
  let after = try! @date.datetime(2024, 3, 10, hour=7).to_ordinal()
  assert_eq(axis.tick_labels([before, after]), ["01:59 -0500", "03:00 -0400"])
  match axis.date_timezone() {
    Some(value) => assert_eq(value.initial_offset_minutes(), -300)
    None => fail("expected transition-aware timezone")
  }
  try! axis.set_date_offset(-300)
  match axis.date_timezone() {
    None => ()
    Some(_) => fail("fixed offset should clear transition-aware timezone")
  }
  assert_eq(axis.tick_labels([after]), ["02:00 -0500"])
}
