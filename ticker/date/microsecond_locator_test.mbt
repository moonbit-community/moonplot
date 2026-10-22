///|
test "fractional interval metadata and immutable zone adapters retain exact precision" {
  let locator = @date.MicrosecondLocator::new(interval=0.25, tz="UTC")
  let adapter = locator.as_locator().copy().with_offset(345)
  assert_eq(adapter.interval(), 0)
  assert_eq(adapter.interval_value(), 0.25)
  assert_eq(
    adapter.microsecond_locator().unwrap().timezone().initial_offset_seconds(),
    20700,
  )
  assert_eq(locator.timezone().initial_offset_seconds(), 0)
  let restored = adapter.with_timezone(@date.fixed_timezone_seconds(-561))
  assert_eq(restored.interval_value(), 0.25)
  assert_eq(
    restored.microsecond_locator().unwrap().timezone().initial_offset_seconds(),
    -561,
  )
  let large = @date.MicrosecondLocator::new(interval=3.0e9, tz="UTC").as_locator()
  assert_eq(large.interval(), 2147483647)
  assert_eq(large.interval_value(), 3.0e9)
  for invalid in [0.0, -0.0, -1.0, 0.0 / 0.0, 1.0 / 0.0] {
    assert_true(
      try {
        ignore(@date.MicrosecondLocator::new(interval=invalid, tz="UTC"))
        false
      } catch {
        _ => true
      },
    )
  }
}

///|
test "microsecond eager grids retain their bounded prefix and legacy year clipping" {
  let value = @date.RRuleDateTime::naive(
    @date.datetime(1970, 1, 1, microsecond=1),
  )
  let tiny = @date.MicrosecondLocator::new(interval=1.0e-300, tz="UTC")
  assert_eq(tiny.tick_values(value, value).length(), 100000)
  let boundary = @date.RRuleDateTime::naive(@date.datetime(1, 1, 1))
  let named = @date.MicrosecondLocator::new(interval=1.0e10, tz="UTC")
  let ticks = named.tick_values(boundary, boundary)
  assert_true(ticks[0] < boundary.date().to_ordinal())
  let legacy = @date.microsecond_locator(interval=1000000000)
  assert_true(
    legacy
    .tick_values(boundary.date().to_ordinal(), boundary.date().to_ordinal())
    .all(value => value >= boundary.date().to_ordinal()),
  )
}
