///|
test "fill, broken_barh, and hist2d render additional axes plots" {
  let fig = @scene.figure(width=360, height=260)
  try! fig.fill([0.0, 1.0, 0.5], [0.0, 0.0, 1.0], color="#123456", label="area")
  try! fig.broken_barh([(0.0, 0.5), (1.0, 0.25)], (0.2, 0.3), color="#abcdef")
  try! fig.hist2d(
    [0.0, 0.1, 0.9, 1.0],
    [0.0, 0.2, 0.8, 1.0],
    bins_x=2,
    bins_y=2,
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("<polygon"))
}

///|
test "quiverkey adds an arrow and label and legend handles are exposed" {
  let fig = @scene.figure(width=320, height=220)
  try! fig.plot([0.0, 1.0], [0.0, 1.0], label="line")
  try! fig.quiverkey(0.0, 0.0, 0.5, "0.5 m/s", color="#fedcba")
  assert_eq(fig.get_legend_handles_labels().length(), 1)
  let svg = fig.to_svg()
  assert_true(svg.contains("0.5 m/s"))
  assert_true(svg.contains("#fedcba"))
}

///|
test "additional axes plots validate input" {
  let fig = @scene.figure()
  try fig.fill([0.0, 1.0], [0.0, 1.0]) catch {
    @core.DataError::InvalidReference(message~) =>
      assert_true(message.contains("three"))
    _ => fail("expected fill validation")
  } noraise {
    _ => fail("expected fill validation")
  }
  try fig.hist2d([0.0], [0.0], bins_x=0) catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("positive"))
    _ => fail("expected hist2d bin validation")
  } noraise {
    _ => fail("expected hist2d bin validation")
  }
}
