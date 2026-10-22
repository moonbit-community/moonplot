///|
test "get_epoch selects configured fallback and configuration reset retains the lock" {
  @config.set_date_epoch("2000-01-01")
  assert_eq(@date.get_epoch(), "2000-01-01")
  assert_eq(@date.datetime(2000, 1, 1).to_ordinal(), 0.0)
  @config.set_date_epoch("2400-01-01")
  @config.reset()
  assert_eq(@date.get_epoch(), "2000-01-01")
  assert_true(
    try {
      @date.set_epoch("2000-01-01")
      false
    } catch {
      _ => true
    },
  )
}
