///|
fn line_remove_hand_error(line : Line2D, expected : String) -> Unit raise {
  try line.remove() catch {
    @core.DataError::InvalidTicks(message~) => assert_eq(message, expected)
    _ => fail("expected original Line removal error")
  } noraise {
    _ => fail("expected Line removal failure")
  }
}

///|
test "Line remove uses exact identity and preserves first middle last ordering" {
  let axes = figure().axes()
  let first = axes.plot_line(Numeric([0.0, 1.0]), Numeric([2.0, 3.0]))
  let middle = axes.plot_line(Numeric([0.0, 1.0]), Numeric([2.0, 3.0]))
  let last = axes.plot_line(Numeric([0.0, 1.0]), Numeric([2.0, 3.0]))
  let display = [@core.point(0.0, 2.0), @core.point(1.0, 3.0)]
  axes.state.val.artists.push(Artist::Line(display, @core.style("red")))
  axes.scatter([@core.point(0.0, 2.0), @core.point(1.0, 3.0)])
  middle.remove()
  assert_eq(axes.state.val.line_originals.length(), 2)
  assert_true(physical_equal(axes.state.val.line_originals[0], first))
  assert_true(physical_equal(axes.state.val.line_originals[1], last))
  assert_true(middle.owner is None && middle.removal_parent is Some(_))
  guard axes.state.val.artists[0] is Artist::Line(first_points, _) else {
    fail("first Line")
  }
  guard axes.state.val.artists[1] is Artist::Line(last_points, _) else {
    fail("last Line")
  }
  assert_true(physical_equal(first_points, first.points))
  assert_true(physical_equal(last_points, last.points))
  first.remove()
  assert_true(physical_equal(axes.state.val.line_originals[0], last))
  last.remove()
  assert_eq(axes.state.val.line_originals.length(), 0)
  assert_eq(axes.state.val.artists.length(), 2)
  guard axes.state.val.artists[0] is Artist::Line(display_after, _) else {
    fail("static display Line")
  }
  assert_true(physical_equal(display_after, display))
  assert_true(axes.state.val.artists[1] is Artist::Scatter(_, _))
}

///|
test "Line remove preserves cached data limits pending requests manual views and Line state" {
  let axes = figure().axes()
  let first = axes.plot_line(Numeric([1.0, 2.0]), Numeric([10.0, 20.0]))
  let removed = axes.plot_line(Numeric([100.0, 200.0]), Numeric([300.0, 400.0]))
  axes.unstale_view()
  axes.set_xlim(0.5, 250.0)
  axes.set_ylim(5.0, 450.0)
  axes.x_axis().request_autoscale()
  let x_view = axes.x_axis().stored_view_limits()
  let y_view = axes.y_axis().stored_view_limits()
  let data = [
    axes.data_limits().lower(),
    axes.data_limits().upper(),
    axes.data_limits(horizontal=false).lower(),
    axes.data_limits(horizontal=false).upper(),
    axes.data_minpos(),
    axes.data_minpos(horizontal=false),
  ]
  let automatic = [axes.x_axis().autoscale_on(), axes.y_axis().autoscale_on()]
  let requests = [
    axes.x_axis().autoscale_stale(),
    axes.y_axis().autoscale_stale(),
  ]
  removed.mark_drawn()
  removed.set_xdata(Numeric([7.0, 8.0, 9.0]))
  let raw = removed.get_xdata()
  let cache = removed.cache
  removed.remove()
  assert_true(removed.owner is None && removed.removal_parent is Some(_))
  assert_true(removed.invalid_x && !removed.invalid_y && removed.stale())
  assert_true(physical_equal(removed.cache, cache))
  guard raw is Numeric(raw_before) else { fail("numeric input") }
  guard removed.get_xdata() is Numeric(raw_after) else { fail("numeric input") }
  assert_true(physical_equal(raw_before, raw_after))
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
  assert_eq(
    [axes.x_axis().autoscale_on(), axes.y_axis().autoscale_on()],
    automatic,
  )
  assert_eq(
    [axes.x_axis().autoscale_stale(), axes.y_axis().autoscale_stale()],
    requests,
  )
  let x_after = axes.x_axis().stored_view_limits()
  let y_after = axes.y_axis().stored_view_limits()
  assert_eq(
    (x_after.lower(), x_after.upper(), y_after.lower(), y_after.upper()),
    (x_view.lower(), x_view.upper(), y_view.lower(), y_view.upper()),
  )
  // Removal itself did not convert these incompatible pending originals.
  assert_true(
    try {
      ignore(removed.xy_values_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (3,) and arg 1 with shape (2,)."
      _ => false
    },
  )
  assert_true(physical_equal(removed.cache, cache))
  assert_true(removed.invalid_x && !removed.invalid_y)
  // Explicit relim ignores the removed pending-shape Line and keeps requests.
  axes.relim_checked()
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (1.0, 2.0),
  )
  assert_eq(
    (
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits(horizontal=false).upper(),
    ),
    (10.0, 20.0),
  )
  assert_eq(
    [axes.x_axis().autoscale_stale(), axes.y_axis().autoscale_stale()],
    requests,
  )
  assert_true(physical_equal(axes.state.val.line_originals[0], first))
}

///|
test "missing Line removal fails before any owner registry or data mutation" {
  let axes = figure().axes()
  let line = axes.plot_line(Numeric([1.0, 2.0]), Numeric([3.0, 4.0]))
  let cache = line.cache
  axes.state.val.artists.retain(artist => {
    match artist {
      Artist::Line(points, _) => !physical_equal(points, line.points)
      _ => true
    }
  })
  line_remove_hand_error(line, "ValueError: list.remove(x): x not in list")
  assert_true(line.owner is Some(_) && line.removal_parent is Some(_))
  assert_true(physical_equal(axes.state.val.line_originals[0], line))
  assert_true(physical_equal(line.cache, cache))
  axes.prune_line_originals()
  assert_true(line.owner is None && line.removal_parent is Some(_))
  assert_eq(axes.state.val.line_originals.length(), 0)
  line_remove_hand_error(line, "ValueError: list.remove(x): x not in list")
}

///|
test "ordinary removed binding survives later clear while attached clear disables removal" {
  let axes = figure().axes()
  let removed = axes.plot_line(Numeric([1.0]), Numeric([2.0]))
  let cleared = axes.plot_line(Numeric([3.0]), Numeric([4.0]))
  removed.mark_drawn()
  removed.remove()
  assert_true(!removed.stale())
  line_remove_hand_error(removed, "ValueError: list.remove(x): x not in list")
  axes.clear()
  assert_true(removed.removal_parent is Some(_))
  assert_true(cleared.removal_parent is None)
  assert_true(removed.owner is None && cleared.owner is None)
  line_remove_hand_error(removed, "ValueError: list.remove(x): x not in list")
  line_remove_hand_error(cleared, "NotImplementedError: cannot remove artist")
  let replacement = axes.plot_line(Numeric([1.0]), Numeric([2.0]))
  line_remove_hand_error(removed, "ValueError: list.remove(x): x not in list")
  line_remove_hand_error(cleared, "NotImplementedError: cannot remove artist")
  assert_true(physical_equal(axes.state.val.line_originals[0], replacement))
  assert_eq(axes.state.val.artists.length(), 1)
}

///|
test "Line removal stays legal after delaxes and detached data keeps working" {
  let fig = figure()
  let axes = fig.axes()
  let line = axes.plot_line(Numeric([1.0, 2.0]), Numeric([10.0, 20.0]))
  let old_view = line.x_values_checked()
  fig.delaxes(axes)
  assert_true(line.owner is Some(_) && line.removal_parent is Some(_))
  line.remove()
  assert_eq(axes.state.val.artists.length(), 0)
  assert_eq(axes.state.val.line_originals.length(), 0)
  assert_eq(old_view.to_array(), [1.0, 2.0])
  line.set_data(Numeric([7.0]), Numeric([8.0]))
  assert_eq(line.xy_values_checked().to_array(), [7.0, 8.0])
  assert_eq(old_view.to_array(), [1.0, 2.0])
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (1.0, 2.0),
  )
  line_remove_hand_error(line, "ValueError: list.remove(x): x not in list")
}
