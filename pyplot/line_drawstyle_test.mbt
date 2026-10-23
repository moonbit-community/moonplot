///|
test "pyplot drawstyle preserves steps spelling and clean same-style cached path" {
  @pyplot.close()
  defer @pyplot.close()
  let fig = @pyplot.figure(width=400, height=200)
  let axes = @pyplot.axes(left=0.0, bottom=0.0, width=1.0, height=1.0)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  let line = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([0.0, 1.0]),
    color="red",
  )
  assert_eq(line.get_drawstyle(), "default")
  line.set_drawstyle("steps")
  assert_true(fig.to_svg_checked().contains("points=\"0,200 0,0 400,0\""))
  assert_eq(line.get_drawstyle(), "steps")
  assert_eq(line.xy_values_checked().length(), 4)
  assert_eq(line.path_values_checked().length(), 6)
  assert_true(!line.stale())
  let path = line.path_values_checked()
  line.set_drawstyle("steps")
  assert_true(!line.stale())
  assert_true(physical_equal(path, line.path_values_checked()))
  try line.set_drawstyle("Default") catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(
        message, "ValueError: 'Default' is not a valid value for drawstyle. Supported values are 'default', 'steps-mid', 'steps-pre', 'steps-post', 'steps'",
      )
    _ => fail("expected supported-values error before state changes")
  } noraise {
    _ => fail("expected invalid drawstyle String")
  }
  assert_eq(line.get_drawstyle(), "steps")
  assert_true(!line.stale())
  assert_true(physical_equal(path, line.path_values_checked()))
  line.set_drawstyle("steps-pre")
  assert_true(line.stale())
  ignore(fig.to_svg_checked())
  assert_eq(line.get_drawstyle(), "steps-pre")
  assert_true(!physical_equal(path, line.path_values_checked()))
}
