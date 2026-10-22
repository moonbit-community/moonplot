///|
test "date converter rc validates atomically and snapshots survive reset" {
  @config.reset()
  assert_eq(@config.date_converter(), "auto")
  @config.set_date_converter("concise")
  let snapshot = @config.rc_params()
  assert_true(
    try {
      @config.set_date_converter("unknown")
      false
    } catch {
      _ => true
    },
  )
  assert_eq(@config.date_converter(), "concise")
  @config.reset()
  assert_eq(snapshot.date_converter(), "concise")
  assert_eq(@config.date_converter(), "auto")
}
