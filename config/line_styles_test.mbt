///|
test "dash configuration captures independent input output and RcParams snapshots" {
  @config.reset()
  assert_true(@config.lines_scale_dashes())
  assert_eq(@config.lines_dashed_pattern(), [3.7, 1.6])
  assert_eq(@config.lines_dashdot_pattern(), [6.4, 1.6, 1.0, 1.6])
  assert_eq(@config.lines_dotted_pattern(), [1.0, 1.65])
  let input = [2.0, 3.0, 4.0]
  @config.set_lines_dashed_pattern(input)
  @config.set_lines_dashdot_pattern(input)
  @config.set_lines_dotted_pattern(input)
  @config.set_lines_scale_dashes(false)
  input[0] = 99.0
  let snapshot = @config.rc_params()
  let returned = @config.lines_dashed_pattern()
  returned[0] = 77.0
  let snap_returned = snapshot.lines_dashdot_pattern()
  snap_returned[0] = 88.0
  assert_eq(@config.lines_dashed_pattern(), [2.0, 3.0, 4.0])
  assert_eq(snapshot.lines_dashdot_pattern(), [2.0, 3.0, 4.0])
  @config.reset()
  assert_eq(snapshot.lines_dashed_pattern(), [2.0, 3.0, 4.0])
  assert_eq(snapshot.lines_dotted_pattern(), [2.0, 3.0, 4.0])
  assert_true(!snapshot.lines_scale_dashes() && @config.lines_scale_dashes())
}

///|
test "dash configuration accepts empty odd negative zero and nonfinite Double sequences" {
  @config.reset()
  @config.set_lines_dashed_pattern([])
  assert_eq(@config.lines_dashed_pattern(), [])
  @config.set_lines_dashdot_pattern([-2.0, -0.0, 1.0 / 0.0])
  let pattern = @config.lines_dashdot_pattern()
  assert_eq(pattern.length(), 3)
  assert_eq(pattern[0], -2.0)
  assert_eq(pattern[1].reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_true(pattern[2].is_inf() && pattern[2] > 0.0)
  @config.set_lines_dotted_pattern([0.0 / 0.0, -1.0 / 0.0])
  assert_true(@config.lines_dotted_pattern()[0].is_nan())
  assert_true(@config.lines_dotted_pattern()[1].is_inf())
  assert_true(@config.lines_dotted_pattern()[1] < 0.0)
  @config.reset()
}
