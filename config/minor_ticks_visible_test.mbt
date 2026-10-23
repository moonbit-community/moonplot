///|
test "minor visibility defaults preserve independent axes and snapshots" {
  let old_x = @config.minor_ticks_visible()
  let old_y = @config.minor_ticks_visible(horizontal=false)
  defer {
    @config.set_minor_ticks_visible(old_x)
    @config.set_minor_ticks_visible(old_y, horizontal=false)
  }
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  let snapshot = @config.rc_params()
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  assert_true(!@config.minor_ticks_visible())
  assert_true(@config.minor_ticks_visible(horizontal=false))
  assert_true(snapshot.minor_ticks_visible())
  assert_true(!snapshot.minor_ticks_visible(horizontal=false))
  @config.reset()
  assert_true(!@config.minor_ticks_visible())
  assert_true(!@config.minor_ticks_visible(horizontal=false))
}
