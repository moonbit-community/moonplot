///|
test "root drawstyle borrows path geometry while data queries retain unexpanded generations" {
  let axes = @mathplotlib.figure().axes()
  let line = axes.plot_line(
    @mathplotlib.LineData::Numeric([0.0, 1.0]),
    @mathplotlib.LineData::Numeric([2.0, 3.0]),
  )
  line.set_color("tab:blue")
  line.set_alpha(Some(0.5))
  line.set_linestyle("dashed")
  assert_eq(line.get_drawstyle(), "default")
  let old_path = line.path_values_checked()
  let old_xy = line.xy_values_checked()
  assert_true(physical_equal(old_path, old_xy))
  old_path.set(1, -9.0)
  assert_eq(line.y_values_checked().to_array(), [-9.0, 3.0])
  line.set_drawstyle("steps-mid")
  // Changed drawstyle invalidates x only; the valid processed y is retained.
  assert_eq(line.y_values_checked().to_array(), [-9.0, 3.0])
  assert_eq(line.x_values_checked().to_array(), [0.0, 1.0])
  assert_eq(line.xy_values_checked().to_array(), [0.0, -9.0, 1.0, 3.0])
  assert_eq(line.path_values_checked().to_array(), [
    0.0, -9.0, 0.5, -9.0, 0.5, 3.0, 1.0, 3.0,
  ])
  let stepped = line.path_values_checked()
  stepped.set(1, -50.0)
  assert_eq(line.y_values_checked().to_array(), [-9.0, 3.0])
  line.set_drawstyle("steps-mid")
  assert_true(physical_equal(line.path_values_checked(), stepped))
  assert_eq(line.path_values_checked().get(1), -50.0)
  try line.set_drawstyle("Steps") catch {
    @mathplotlib.DataError::InvalidTicks(message~) =>
      assert_eq(
        message, "ValueError: 'Steps' is not a valid value for drawstyle. Supported values are 'default', 'steps-mid', 'steps-pre', 'steps-post', 'steps'",
      )
    _ => fail("expected exact String drawstyle validation")
  } noraise {
    _ => fail("capitalized drawstyle must fail")
  }
  assert_eq(line.get_drawstyle(), "steps-mid")
  line.recache_checked(always=true)
  assert_eq(line.xy_values_checked().to_array(), [0.0, 2.0, 1.0, 3.0])
  assert_eq(line.path_values_checked().to_array(), [
    0.0, 2.0, 0.5, 2.0, 0.5, 3.0, 1.0, 3.0,
  ])
  assert_eq(old_xy.to_array(), [0.0, -9.0, 1.0, 3.0])
  assert_eq(stepped.get(1), -50.0)
  line.set_drawstyle("steps")
  assert_eq(line.get_drawstyle(), "steps")
  assert_eq(line.path_values_checked().to_array(), [
    0.0, 2.0, 0.0, 3.0, 1.0, 3.0,
  ])
  assert_eq(line.get_linestyle(), "--")
  assert_eq(line.get_color(), "tab:blue")
  assert_eq(line.get_alpha(), Some(0.5))
  assert_eq(line.get_linewidth(), 2.0)
}
