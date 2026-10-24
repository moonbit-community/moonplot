///|
test "microsecond numeric nonfinite inverse selects epoch before returning empty ticks" {
  let locator = @date.MicrosecondLocator::new(tz="UTC").as_locator()
  assert_eq(locator.tick_values(0.0 / 0.0, 0.0), [])
  assert_true(
    try {
      @date.set_epoch("2000-01-01T00:00:00")
      false
    } catch {
      _ => true
    },
  )
  assert_eq(@date.get_epoch(), "1970-01-01T00:00:00")
}
