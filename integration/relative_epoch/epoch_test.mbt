///|
test "all relative operations remain independent of rc and epoch selection" {
  @config.set_timezone("invalid/D13-zone")
  defer @config.set_timezone("UTC")
  let delta = @date.RelativeDelta::new(months=1L, days=0.5, on_weekday=@date.mo)
  let normal = delta.normalized()
  assert_eq(normal.hours(), 12.0)
  ignore(delta.add(normal).subtract(delta).scaled(2.0).divided(2.0))
  ignore(delta.negated().abs().with_weeks(2.0).is_zero())
  ignore(delta.add_timedelta(@date.timedelta(microseconds=1L)))
  let base = @date.datetime(2024, 1, 31)
  let result = base.add_relative_delta(delta)
  ignore(result.sub_relative_delta(delta))
  ignore(@date.RelativeDelta::between(result, base))
  let zone = @date.timezone(-300, transitions=[
    @date.timezone_transition(@date.datetime(2024, 3, 10, hour=7), -240),
  ])
  let before = @date.datetime(2024, 3, 9, hour=7, minute=30).with_timezone(zone)
  let after = before.add_relative_delta(@date.RelativeDelta::new(days=1.0))
  assert_eq(
    (after.hour(), after.minute(), after.offset_minutes()),
    (2, 30, -240),
  )
  assert_eq(@date.RelativeDelta::between(after, before).days(), 1.0)
  @date.set_epoch("2000-01-01T00:00:00")
  assert_eq(
    @date.datetime(2000, 1, 1)
    .add_relative_delta(@date.RelativeDelta::new(days=1.0))
    .to_ordinal(),
    1.0,
  )
}
