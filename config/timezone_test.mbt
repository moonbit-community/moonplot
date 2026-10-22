///|
test "timezone rc stores strings lazily and snapshots reset independently" {
  @config.reset()
  defer @config.reset()
  let before = @config.rc_params()
  assert_eq(before.timezone(), "UTC")
  @config.set_timezone("invalid/timezone")
  assert_eq(@config.timezone(), "invalid/timezone")
  assert_eq(before.timezone(), "UTC")
  let after = @config.rc_params()
  @config.reset()
  assert_eq(@config.timezone(), "UTC")
  assert_eq(after.timezone(), "invalid/timezone")
}
