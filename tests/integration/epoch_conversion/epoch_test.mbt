///|
test "invalid selection is atomic and first conversion locks fallback" {
  for value in ["", "NaT", "2024-02-30", "2000-01-01Z"] {
    assert_true(
      try {
        @date.set_epoch(value)
        false
      } catch {
        _ => true
      },
    )
  }
  @config.set_date_epoch("2000-01-01")
  assert_eq(@date.date2num(@date.datetime(1970, 1, 1)), -10957.0)
  assert_true(
    try {
      @date.set_epoch("2400-01-01")
      false
    } catch {
      _ => true
    },
  )
  assert_eq(@date.get_epoch(), "2000-01-01")
}
