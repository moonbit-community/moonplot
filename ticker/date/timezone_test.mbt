///|
fn eastern_zone() -> @date.DateTimeZone {
  try! @date.timezone(-300, transitions=[
    try! @date.timezone_transition(@date.datetime(2024, 3, 10, hour=7), -240),
    try! @date.timezone_transition(@date.datetime(2024, 11, 3, hour=6), -300),
  ])
}

///|
test "transition timezone resolves both sides of DST changes" {
  let zone = eastern_zone()
  let before_spring = try! @date.datetime(2024, 3, 10, hour=6, minute=59).to_ordinal()
  let spring = try! @date.datetime(2024, 3, 10, hour=7).to_ordinal()
  let before = try! zone.to_datetime(before_spring)
  let after = try! zone.to_datetime(spring)
  assert_eq(
    (before.hour(), before.minute(), before.offset_minutes()),
    (1, 59, -300),
  )
  assert_eq(
    (after.hour(), after.minute(), after.offset_minutes()),
    (3, 0, -240),
  )
  assert_eq(try! zone.offset_at(before_spring), -300)
  assert_eq(try! zone.offset_at(spring), -240)

  let before_fall = try! @date.datetime(2024, 11, 3, hour=5, minute=59).to_ordinal()
  let fall = try! @date.datetime(2024, 11, 3, hour=6).to_ordinal()
  let fall_before = try! zone.to_datetime(before_fall)
  let fall_after = try! zone.to_datetime(fall)
  assert_eq((fall_before.hour(), fall_before.offset_minutes()), (1, -240))
  assert_eq((fall_after.hour(), fall_after.offset_minutes()), (1, -300))
}

///|
test "timezone formatter and datetime conversion use transition offsets" {
  let zone = eastern_zone()
  let instant = try! @date.datetime(2024, 3, 10, hour=7)
  let converted = try! instant.with_timezone(zone)
  assert_eq(converted.hour(), 3)
  assert_eq(converted.offset_minutes(), -240)
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M %z").with_timezone(zone)
  assert_eq(
    formatter.format_value(instant.to_ordinal()),
    "2024-03-10 03:00 -0400",
  )
  assert_eq(
    @date.format_date_ticks(
      [instant.to_ordinal()],
      format="%H:%M %z",
      timezone=zone,
    ),
    ["03:00 -0400"],
  )
}

///|
test "timezone transition arrays are copied and validated" {
  let transition = try! @date.timezone_transition(
    @date.datetime(2024, 3, 10, hour=7),
    -240,
  )
  let transitions = [transition]
  let zone = try! @date.timezone(-300, transitions~)
  transitions[0] = try! @date.timezone_transition(
    @date.datetime(2024, 3, 10, hour=8),
    -180,
  )
  assert_eq(
    try! zone.offset_at(try! @date.datetime(2024, 3, 10, hour=7).to_ordinal()),
    -240,
  )

  try
    @date.timezone(0, transitions=[
      transition,
      try! @date.timezone_transition(@date.datetime(2024, 3, 10, hour=6), -240),
    ])
  catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("strictly increasing"))
    _ => fail("expected transition ordering error")
  } noraise {
    _ => fail("expected transition ordering error")
  }

  try @date.timezone_transition(@date.datetime(2024, 1, 1), 1440) catch {
    @date.DateError::InvalidDate(message~) =>
      assert_true(message.contains("offset_minutes"))
    _ => fail("expected transition offset error")
  } noraise {
    _ => fail("expected transition offset error")
  }
}
