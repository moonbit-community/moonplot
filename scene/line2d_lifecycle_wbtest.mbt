///|
fn line2d_lifecycle_limits(value : @core.Limits) -> (Double, Double) {
  (value.lower(), value.upper())
}

///|
test "clear detaches the old Line state without reconnecting a reused artist slot" {
  let axes = figure().axes()
  let old = axes.plot_line(Numeric([1.0, 2.0]), Numeric([3.0, 4.0]))
  let previous = old.x_values_checked()
  axes.clear_checked()
  assert_true(old.owner is None)
  assert_eq(axes.state.val.line_originals.length(), 0)
  let current = axes.plot_line(Numeric([100.0, 200.0]), Numeric([300.0, 400.0]))
  axes.unstale_view()
  old.set_data(Numeric([7.0, 8.0]), Numeric([9.0, 10.0]))
  assert_eq(old.xy_values_checked().to_array(), [7.0, 9.0, 8.0, 10.0])
  assert_eq(previous.to_array(), [1.0, 2.0])
  assert_eq(current.x_values_checked().to_array(), [100.0, 200.0])
  assert_eq(current.y_values_checked().to_array(), [300.0, 400.0])
  assert_true(physical_equal(axes.state.val.line_originals[0], current))
  assert_eq(line2d_lifecycle_limits(axes.data_limits()), (100.0, 200.0))
  assert_eq(
    line2d_lifecycle_limits(axes.data_limits(horizontal=false)),
    (300.0, 400.0),
  )
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
}

///|
test "checked relim resets bounds then retains the merged Line prefix on a later failure" {
  let axes = figure().axes()
  let first = axes.plot_line(Numeric([0.0, 1.0]), Numeric([2.0, 3.0]))
  let second = axes.plot_line(Numeric([2.0, 3.0]), Numeric([4.0, 5.0]))
  axes.unstale_view()
  let xview = line2d_lifecycle_limits(axes.get_xlim_checked())
  let yview = line2d_lifecycle_limits(axes.get_ylim_checked())
  first.set_data(Numeric([10.0, 20.0]), Numeric([30.0, 40.0]))
  second.set_xdata(Numeric([1.0, 2.0, 3.0]))
  try axes.relim_checked() catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("expected the second Line's deferred shape error")
  } noraise {
    _ => fail("expected the second Line's deferred shape error")
  }
  assert_eq(line2d_lifecycle_limits(axes.data_limits()), (10.0, 20.0))
  assert_eq(
    line2d_lifecycle_limits(axes.data_limits(horizontal=false)),
    (30.0, 40.0),
  )
  assert_eq(axes.data_minpos(), 10.0)
  assert_eq(axes.data_minpos(horizontal=false), 30.0)
  assert_true(!axes.ignore_existing_data_limits())
  assert_true(!first.invalid_x && !first.invalid_y)
  assert_true(second.invalid_x && !second.invalid_y)
  assert_eq(second.y_values_checked().to_array(), [4.0, 5.0])
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
  assert_eq(line2d_lifecycle_limits(axes.get_xlim_checked()), xview)
  assert_eq(line2d_lifecycle_limits(axes.get_ylim_checked()), yview)
  second.set_xdata(Numeric([1.0, 2.0]))
  axes.relim_checked()
  assert_eq(line2d_lifecycle_limits(axes.data_limits()), (1.0, 20.0))
  assert_eq(
    line2d_lifecycle_limits(axes.data_limits(horizontal=false)),
    (4.0, 40.0),
  )
  assert_eq(line2d_lifecycle_limits(axes.get_xlim_checked()), xview)
}

///|
test "current processed view edits reach explicit relim without requesting a new view" {
  let axes = figure().axes()
  let line = axes.plot_line(Numeric([1.0, 2.0]), Numeric([3.0, 4.0]))
  axes.unstale_view()
  line.mark_drawn()
  let xview = line.x_values_checked()
  xview.set(1, 20.0)
  assert_eq(line.xy_values_checked().to_array(), [1.0, 3.0, 20.0, 4.0])
  assert_true(!line.stale())
  assert_true(!line.invalid_x && !line.invalid_y)
  assert_eq(line2d_lifecycle_limits(axes.data_limits()), (1.0, 2.0))
  axes.relim_checked()
  assert_eq(line2d_lifecycle_limits(axes.data_limits()), (1.0, 20.0))
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
  guard line.get_xdata() is LineData::Numeric(original) else {
    fail("expected numeric originals")
  }
  assert_eq(original, [1.0, 2.0])
  original[1] = 50.0
  assert_eq(line.x_values_checked().to_array(), [1.0, 20.0])
  assert_true(!line.stale())
  line.recache_checked(always=true)
  assert_eq(line.x_values_checked().to_array(), [1.0, 50.0])
  assert_eq(xview.to_array(), [1.0, 20.0])
  assert_eq(line2d_lifecycle_limits(axes.data_limits()), (1.0, 20.0))
}

///|
test "detached valid date cache remains readable until actual conversion is needed" {
  let axes = figure().axes()
  let dates = [
    @date.RRuleDateTime::naive(@date.datetime(2024, 1, 1)),
    @date.RRuleDateTime::aware(@date.datetime(2024, 1, 2, offset_minutes=120)),
  ]
  let line = axes.plot_line(Date(dates), Numeric([1.0, 2.0]))
  let cached = line.x_values_checked().to_array()
  axes.clear_checked()
  assert_true(line.owner is None)
  assert_eq(line.x_values_checked().to_array(), cached)
  // Only y is invalid, so x uses its already converted cache without an owner.
  line.set_ydata(Numeric([4.0, 5.0]))
  assert_eq(line.y_values_checked().to_array(), [4.0, 5.0])
  assert_eq(line.x_values_checked().to_array(), cached)
  try line.recache_checked(always=true) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(
        message, "TypeError: float() argument must be a string or a real number, not 'datetime.datetime'",
      )
    _ => fail("expected detached datetime numeric conversion error")
  } noraise {
    _ => fail("expected detached datetime numeric conversion error")
  }
  assert_true(!line.invalid_x && !line.invalid_y)
  assert_eq(line.x_values_checked().to_array(), cached)
  line.set_xdata(Numeric([10.0, 11.0]))
  assert_eq(line.x_values_checked().to_array(), [10.0, 11.0])
  assert_eq(axes.state.val.line_originals.length(), 0)
}
