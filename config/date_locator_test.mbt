///|
test "date interval alignment config resets and snapshots remain independent" {
  @config.reset()
  let snapshot = @config.rc_params()
  assert_true(@config.date_interval_multiples())
  @config.set_date_interval_multiples(false)
  assert_true(!@config.date_interval_multiples())
  assert_true(snapshot.date_interval_multiples())
  @config.reset()
  assert_true(@config.date_interval_multiples())
}
