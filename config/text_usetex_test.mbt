///|
test "text.usetex snapshots are independent and reset restores false" {
  let original = @config.text_usetex()
  defer @config.set_text_usetex(original)
  @config.set_text_usetex(false)
  let snapshot = @config.rc_params()
  @config.set_text_usetex(true)
  assert_true(@config.text_usetex())
  assert_true(!snapshot.text_usetex())
  assert_true(@config.rc_params().text_usetex())
  @config.reset()
  assert_true(!@config.text_usetex())
}
