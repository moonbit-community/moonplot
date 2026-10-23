///|
test "Line visibility changes mark stale while same Bool is a complete no-op" {
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  assert_true(line.get_visible())
  line.mark_drawn()
  line.set_visible(true)
  assert_true(line.get_visible() && !line.stale())
  line.set_visible(false)
  assert_true(!line.get_visible() && line.stale())
  // Controlled clean state, not a claim that a hidden draw completes the Line.
  line.mark_drawn()
  line.set_visible(false)
  assert_true(!line.get_visible() && !line.stale())
  line.set_visible(true)
  assert_true(line.get_visible() && line.stale())
  line.set_visible(true)
  assert_true(line.stale())
}

///|
test "Line visibility leaves pending data cache ownership views and range state unchanged" {
  let axes = figure().axes()
  let line = axes.plot_line(Numeric([1.0, 2.0]), Numeric([10.0, 20.0]))
  axes.unstale_view()
  axes.set_xlim(0.5, 3.0)
  axes.set_ylim(5.0, 25.0)
  axes.x_axis().request_autoscale()
  line.set_xdata(Numeric([4.0, 5.0, 6.0]))
  let cache = line.cache
  let old_x = cache.xs
  let old_y = cache.ys
  guard line.get_xdata() is Numeric(raw_x) else { fail("numeric originals") }
  guard line.get_ydata() is Numeric(raw_y) else { fail("numeric originals") }
  let x_view = axes.x_axis().stored_view_limits()
  let y_view = axes.y_axis().stored_view_limits()
  let requests = [
    axes.x_axis().autoscale_stale(),
    axes.y_axis().autoscale_stale(),
  ]
  let automatic = [axes.x_axis().autoscale_on(), axes.y_axis().autoscale_on()]
  let data = [
    axes.data_limits().lower(),
    axes.data_limits().upper(),
    axes.data_limits(horizontal=false).lower(),
    axes.data_limits(horizontal=false).upper(),
    axes.data_minpos(),
    axes.data_minpos(horizontal=false),
  ]
  line.mark_drawn()
  for visible in [false, false, true, true] {
    line.set_visible(visible)
    assert_eq(line.get_visible(), visible)
    assert_true(physical_equal(line.cache, cache))
    assert_true(
      physical_equal(line.cache.xs, old_x) &&
      physical_equal(line.cache.ys, old_y),
    )
    assert_true(line.invalid_x && !line.invalid_y)
    guard line.get_xdata() is Numeric(current_x) else {
      fail("numeric originals")
    }
    guard line.get_ydata() is Numeric(current_y) else {
      fail("numeric originals")
    }
    assert_true(
      physical_equal(current_x, raw_x) && physical_equal(current_y, raw_y),
    )
    assert_true(physical_equal(line.owner.unwrap().state, axes.state))
    assert_true(physical_equal(line.removal_parent.unwrap().state, axes.state))
    let current_x_view = axes.x_axis().stored_view_limits()
    let current_y_view = axes.y_axis().stored_view_limits()
    assert_eq(
      (
        current_x_view.lower(),
        current_x_view.upper(),
        current_y_view.lower(),
        current_y_view.upper(),
      ),
      (x_view.lower(), x_view.upper(), y_view.lower(), y_view.upper()),
    )
    assert_eq(
      [axes.x_axis().autoscale_stale(), axes.y_axis().autoscale_stale()],
      requests,
    )
    assert_eq(
      [axes.x_axis().autoscale_on(), axes.y_axis().autoscale_on()],
      automatic,
    )
    assert_eq(
      [
        axes.data_limits().lower(),
        axes.data_limits().upper(),
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(),
        axes.data_minpos(horizontal=false),
      ],
      data,
    )
  }
}

///|
test "hidden Line explicit getters and default relim still process pending data" {
  let axes = figure().axes()
  let first = axes.plot_line(Numeric([1.0, 2.0]), Numeric([10.0, 20.0]))
  let hidden = axes.plot_line(Numeric([50.0, 60.0]), Numeric([70.0, 80.0]))
  axes.unstale_view()
  hidden.set_xdata(Numeric([5.0, 6.0, 7.0]))
  hidden.set_visible(false)
  let cache = hidden.cache
  assert_true(
    try {
      ignore(hidden.xy_values_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.contains("shape mismatch")
      _ => false
    },
  )
  assert_true(physical_equal(hidden.cache, cache) && hidden.invalid_x)
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
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (1.0, 2.0),
  )
  assert_eq(first.x_values_checked().to_array(), [1.0, 2.0])
  hidden.set_xdata(Numeric([100.0, 200.0]))
  assert_eq(hidden.x_values_checked().to_array(), [100.0, 200.0])
  assert_true(!hidden.get_visible() && hidden.stale())
  axes.relim_checked()
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (1.0, 200.0),
  )
  assert_true(
    !axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
}

///|
test "hidden Line unit callback still forces recache before relim and request" {
  let axes = figure().axes()
  let line = axes.plot_line(Category(["a", "b"]), Numeric([10.0, 20.0]))
  axes.unstale_view()
  let previous_x = line.x_values_checked()
  line.set_visible(false)
  assert_true(!axes.x_axis().autoscale_stale())
  axes.set_x_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["b", "a"]))),
  )
  assert_true(!line.get_visible() && line.stale())
  assert_eq(line.x_values_checked().to_array(), [1.0, 0.0])
  assert_eq(previous_x.to_array(), [0.0, 1.0])
  assert_true(
    axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
}

///|
test "detached removed and cleared Line visibility remains independent of data and removal state" {
  let axes = figure().axes()
  let removed = axes.plot_line(Numeric([1.0]), Numeric([2.0]))
  let cleared = axes.plot_line(Numeric([3.0]), Numeric([4.0]))
  removed.remove()
  axes.clear()
  for line in [removed, cleared] {
    let cache = line.cache
    line.mark_drawn()
    line.set_visible(false)
    assert_true(!line.get_visible() && line.stale())
    line.mark_drawn()
    line.set_visible(false)
    assert_true(!line.stale())
    line.set_visible(true)
    assert_true(line.get_visible() && line.stale())
    assert_true(line.owner is None)
    assert_true(physical_equal(line.cache, cache))
    assert_true(!line.invalid_x && !line.invalid_y)
  }
  assert_true(removed.removal_parent is Some(_))
  assert_true(cleared.removal_parent is None)
  assert_eq(removed.xy_values_checked().to_array(), [1.0, 2.0])
  assert_eq(cleared.xy_values_checked().to_array(), [3.0, 4.0])
  assert_eq(axes.state.val.artists.length(), 0)
}
