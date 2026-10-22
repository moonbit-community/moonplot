///|
test "date epoch fallback validates atomically and snapshots copy configuration" {
  @config.reset()
  assert_eq(@config.date_epoch(), "1970-01-01T00:00:00")
  let original = @config.rc_params()
  @config.set_date_epoch("0000-12-31")
  assert_eq(original.date_epoch(), "1970-01-01T00:00:00")
  assert_eq(@config.rc_params().date_epoch(), "0000-12-31")
  for value in ["NaT", "2000-02-30", "2000-01-01Z", "2147483648"] {
    assert_true(
      try {
        @config.set_date_epoch(value)
        false
      } catch {
        _ => true
      },
    )
    assert_eq(@config.date_epoch(), "0000-12-31")
  }
  @config.reset()
  assert_eq(@config.date_epoch(), "1970-01-01T00:00:00")
}
