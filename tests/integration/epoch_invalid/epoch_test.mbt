///|
test "reverse conversion selects the default even when numeric input is invalid" {
  assert_true(
    try {
      ignore(@date.num2date(0.0 / 0.0))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      @date.set_epoch("2000-01-01")
      false
    } catch {
      _ => true
    },
  )
  assert_eq(@date.get_epoch(), "1970-01-01T00:00:00")
}
