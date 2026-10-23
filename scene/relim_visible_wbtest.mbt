///|
test "visible-only relim skips a hidden pending failure before the first visible Line" {
  let axes = figure().axes()
  let hidden = axes.plot_line(Numeric([100.0, 200.0]), Numeric([300.0, 400.0]))
  let visible = axes.plot_line(Numeric([1.0, 2.0]), Numeric([3.0, 4.0]))
  axes.unstale_view()
  hidden.set_xdata(Numeric([5.0, 6.0, 7.0]))
  hidden.set_visible(false)
  let cache = hidden.cache
  // Exercise the old pure convenience signature with its new optional label.
  axes.relim(visible_only=true)
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (1.0, 2.0),
  )
  assert_eq(
    (
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits(horizontal=false).upper(),
    ),
    (3.0, 4.0),
  )
  assert_true(physical_equal(hidden.cache, cache) && hidden.invalid_x)
  assert_eq(visible.x_values_checked().to_array(), [1.0, 2.0])
  assert_true(!axes.ignore_existing_data_limits())
  assert_true(
    !axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
  // Omission still means false: the first hidden Line now reaches its old error.
  assert_true(
    try {
      axes.relim_checked()
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.contains("shape mismatch")
      _ => false
    },
  )
  assert_true(axes.ignore_existing_data_limits())
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (1.0 / 0.0, -1.0 / 0.0),
  )
}

///|
test "all hidden relim resets points but preserves old minpos and unconsumed ignore" {
  let axes = figure().axes()
  let line = axes.plot_line(Numeric([10.0, 20.0]), Numeric([30.0, 40.0]))
  axes.unstale_view()
  axes.set_xlim(1.0, 25.0)
  let view = axes.x_axis().stored_view_limits()
  let cache = line.cache
  line.set_visible(false)
  axes.relim_checked(visible_only=true)
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (1.0 / 0.0, -1.0 / 0.0),
  )
  assert_eq(
    (
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits(horizontal=false).upper(),
    ),
    (1.0 / 0.0, -1.0 / 0.0),
  )
  assert_eq(axes.data_minpos(), 10.0)
  assert_eq(axes.data_minpos(horizontal=false), 30.0)
  assert_true(axes.ignore_existing_data_limits())
  assert_true(physical_equal(line.cache, cache))
  let after = axes.x_axis().stored_view_limits()
  assert_eq((after.lower(), after.upper()), (view.lower(), view.upper()))
  assert_true(
    !axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
}

///|
test "visible empty and nonfinite Lines retain distinct ignore and minpos behavior" {
  let axes = figure().axes()
  let line = axes.plot_line(Numeric([10.0, 20.0]), Numeric([30.0, 40.0]))
  axes.unstale_view()
  line.set_data(Numeric([]), Numeric([]))
  axes.relim_checked(visible_only=true)
  assert_eq(line.xy_values_checked().length(), 0)
  assert_true(axes.ignore_existing_data_limits())
  assert_eq(axes.data_minpos(), 10.0)
  assert_eq(axes.data_minpos(horizontal=false), 30.0)
  line.set_data(
    Numeric([0.0 / 0.0, 1.0 / 0.0]),
    Numeric([0.0 / 0.0, 1.0 / 0.0]),
  )
  axes.relim_checked(visible_only=true)
  assert_true(!axes.ignore_existing_data_limits())
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (1.0 / 0.0, -1.0 / 0.0),
  )
  assert_eq(axes.data_minpos(), 1.0 / 0.0)
  assert_eq(axes.data_minpos(horizontal=false), 1.0 / 0.0)
  assert_true(!line.invalid_x && !line.invalid_y && line.stale())
  assert_true(
    !axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
}

///|
test "same-geometry unregistered display Line remains visible for relim filtering" {
  let axes = figure().axes()
  let hidden = axes.plot_line(Numeric([10.0, 20.0]), Numeric([30.0, 40.0]))
  let display = [@core.point(10.0, 30.0), @core.point(20.0, 40.0)]
  axes.state.val.artists.push(Artist::Line(display, @core.style("red")))
  axes.unstale_view()
  hidden.set_visible(false)
  hidden.set_xdata(Numeric([1.0, 2.0, 3.0]))
  let cache = hidden.cache
  axes.relim_checked(visible_only=true)
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (10.0, 20.0),
  )
  assert_eq(
    (
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits(horizontal=false).upper(),
    ),
    (30.0, 40.0),
  )
  assert_true(!axes.ignore_existing_data_limits())
  assert_true(physical_equal(hidden.cache, cache) && hidden.invalid_x)
  assert_eq(axes.state.val.line_originals.length(), 1)
}

///|
test "visible-only relim preserves its merged prefix before a late visible failure" {
  let axes = figure().axes()
  ignore(axes.plot_line(Numeric([1.0, 2.0]), Numeric([3.0, 4.0])))
  let hidden = axes.plot_line(Numeric([10.0, 20.0]), Numeric([30.0, 40.0]))
  let bad = axes.plot_line(Numeric([50.0, 60.0]), Numeric([70.0, 80.0]))
  let last = axes.plot_line(Numeric([90.0, 100.0]), Numeric([110.0, 120.0]))
  axes.unstale_view()
  hidden.set_visible(false)
  hidden.set_xdata(Numeric([5.0, 6.0, 7.0]))
  bad.set_ydata(Numeric([1.0, 2.0, 3.0]))
  last.set_xdata(Numeric([900.0, 901.0]))
  let bad_cache = bad.cache
  let last_cache = last.cache
  assert_true(
    try {
      axes.relim_checked(visible_only=true)
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.contains("shape mismatch")
      _ => false
    },
  )
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (1.0, 2.0),
  )
  assert_eq(
    (
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits(horizontal=false).upper(),
    ),
    (3.0, 4.0),
  )
  assert_eq(axes.data_minpos(), 1.0)
  assert_eq(axes.data_minpos(horizontal=false), 3.0)
  assert_true(!axes.ignore_existing_data_limits())
  assert_true(hidden.invalid_x && bad.invalid_y && last.invalid_x)
  assert_true(
    physical_equal(bad.cache, bad_cache) &&
    physical_equal(last.cache, last_cache),
  )
  assert_true(
    !axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
}
