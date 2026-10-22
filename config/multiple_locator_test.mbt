///|
test "axes autolimit mode defaults snapshots dynamic changes validation and reset" {
  @config.reset()
  defer @config.reset()
  let data = @config.rc_params()
  assert_eq(@config.axes_autolimit_mode(), "data")
  assert_eq(data.axes_autolimit_mode(), "data")
  @config.set_axes_autolimit_mode("round_numbers")
  let rounded = @config.rc_params()
  assert_eq(@config.axes_autolimit_mode(), "round_numbers")
  assert_eq(data.axes_autolimit_mode(), "data")
  assert_eq(rounded.axes_autolimit_mode(), "round_numbers")
  for invalid in ["", "DATA", "round", "round_numbers ", "tight"] {
    try @config.set_axes_autolimit_mode(invalid) catch {
      @core.DataError::InvalidTicks(message~) =>
        assert_true(message.contains("axes.autolimit_mode"))
      _ => fail("expected an autolimit mode validation error")
    } noraise {
      _ => fail("invalid autolimit mode must be rejected")
    }
    assert_eq(@config.axes_autolimit_mode(), "round_numbers")
  }
  @config.reset()
  assert_eq(@config.axes_autolimit_mode(), "data")
  assert_eq(rounded.axes_autolimit_mode(), "round_numbers")
}
