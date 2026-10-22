///|
test "rc params expose tab10 and automatic margins" {
  @config.reset()
  let value = @config.rc_params()
  assert_eq(value.color_cycle()[0], "#1f77b4")
  assert_eq(value.color_cycle().length(), 10)
  assert_true(value.x_margin() == 0.05)
  assert_true(value.y_margin() == 0.05)
  assert_true(!value.grid_visible())
  assert_eq(value.grid_color(), "#e5e7eb")
  assert_true(value.grid_linewidth() == 1.0)
}

///|
test "rc params validate and copy mutable defaults" {
  @config.reset()
  let colors = ["#abcdef", "#fedcba"]
  try! @config.set_color_cycle(colors)
  colors[0] = "#000000"
  assert_eq(@config.color_cycle(), ["#abcdef", "#fedcba"])
  try! @config.set_x_margin(0.1)
  try! @config.set_y_margin(-0.25)
  try! @config.set_grid(true, "#123456", 0.75)
  assert_true(@config.x_margin() == 0.1)
  assert_true(@config.y_margin() == -0.25)
  assert_true(@config.grid_visible())
  assert_eq(@config.grid_color(), "#123456")
  assert_true(@config.grid_linewidth() == 0.75)
  try @config.set_color_cycle([]) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("at least one"))
    _ => fail("expected empty cycle error")
  } noraise {
    _ => fail("expected empty cycle error")
  }
  try @config.set_y_margin(-0.5) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("greater than -0.5"))
    _ => fail("expected invalid margin error")
  } noraise {
    _ => fail("expected invalid margin error")
  }
  try @config.set_grid(true, "", 1.0) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("grid color"))
    _ => fail("expected empty grid color error")
  } noraise {
    _ => fail("expected empty grid color error")
  }
  @config.reset()
}
