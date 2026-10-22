///|
test "date autoformatter defaults and RcParams snapshots are copied and invalid units fail atomically" {
  @config.reset()
  let original = @config.rc_params()
  let defaults = @config.date_autoformats()
  assert_eq(defaults, [
    "%Y", "%Y-%m", "%Y-%m-%d", "%m-%d %H", "%d %H:%M", "%H:%M:%S", "%M:%S.%f",
  ])
  defaults[4] = "not live"
  original.date_autoformats()[4] = "not snapshot"
  @config.set_date_autoformatter("minute", "custom")
  assert_eq(original.date_autoformatter("minute"), "%d %H:%M")
  assert_eq(@config.date_autoformatter("minute"), "custom")
  assert_true(
    try {
      @config.set_date_autoformatter("Minute", "invalid")
      false
    } catch {
      _ => true
    },
  )
  assert_eq(@config.date_autoformatter("minute"), "custom")
  @config.reset()
  assert_eq(@config.date_autoformatter("minute"), "%d %H:%M")
}
