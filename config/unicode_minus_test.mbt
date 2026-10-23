///|
test "Unicode minus rc snapshots retain their value across later updates" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  let snapshot = @config.rc_params()
  @config.set_unicode_minus(!previous)
  assert_eq(@config.unicode_minus(), !previous)
  assert_eq(snapshot.unicode_minus(), previous)
}
