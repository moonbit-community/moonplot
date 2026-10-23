///|
test "Line originals copy in and borrow out without automatic invalidation" {
  let axes = figure().axes()
  let incoming = [1.0, 2.0]
  let line = axes.plot_line(Numeric(incoming), Numeric([10.0, 20.0]))
  axes.unstale_view()
  line.mark_drawn()
  incoming[0] = 99.0
  guard line.get_xdata() is Numeric(raw) else { fail("numeric originals") }
  assert_eq(raw, [1.0, 2.0])
  raw[0] = 7.0
  assert_true(!line.invalid_x && !line.stale())
  assert_eq(line.x_values_checked().to_array(), [1.0, 2.0])
  line.recache_checked(always=true)
  assert_eq(line.x_values_checked().to_array(), [7.0, 2.0])
  assert_true(!line.stale())
  let replacement = [4.0, 5.0]
  line.set_xdata(Numeric(replacement))
  replacement[0] = 88.0
  assert_true(line.invalid_x && !line.invalid_y && line.stale())
  assert_eq(line.x_values_checked().to_array(), [4.0, 5.0])
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (1.0, 2.0),
  )
  assert_true(
    !axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
}

///|
test "Line processed data pair preserves an old x view and a new y generation" {
  let line = figure().plot_line(Numeric([1.0, 2.0]), Numeric([10.0, 20.0]))
  let old_x = line.x_values_checked()
  let old_y = line.y_values_checked()
  let old_xy = line.xy_values_checked()
  line.set_ydata(Numeric([30.0, 40.0]))
  let (xs, ys) = line.data_values_checked()
  assert_true(physical_equal(xs, old_x))
  assert_true(!physical_equal(ys, old_y))
  assert_true(physical_equal(ys, line.y_values_checked()))
  assert_true(!physical_equal(xs, line.x_values_checked()))
  xs.set(0, 99.0)
  ys.set(0, 77.0)
  assert_eq(old_xy.to_array(), [99.0, 10.0, 2.0, 20.0])
  assert_eq(line.xy_values_checked().to_array(), [1.0, 77.0, 2.0, 40.0])
  assert_eq(old_y.to_array(), [10.0, 20.0])
}

///|
test "Line current processed views drive snapshots without invalidating raw data or limits" {
  let axes = figure().axes()
  let line = axes.plot_line(Numeric([1.0, 2.0]), Numeric([10.0, 20.0]))
  axes.unstale_view()
  let xs = line.x_values_checked()
  let ys = line.y_values_checked()
  xs.set(1, 70.0)
  ys.set(0, -5.0)
  let points = line.points_snapshot_checked()
  assert_eq(points.map(point => (point.x(), point.y())), [
    (1.0, -5.0),
    (70.0, 20.0),
  ])
  guard line.get_xdata() is Numeric(raw) else { fail("numeric originals") }
  assert_eq(raw, [1.0, 2.0])
  assert_true(!line.invalid_x && !line.invalid_y)
  line.recache_checked()
  assert_true(!physical_equal(xs, line.x_values_checked()))
  assert_eq(line.xy_values_checked().to_array(), [1.0, -5.0, 70.0, 20.0])
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (1.0, 2.0),
  )
  assert_true(
    !axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
  line.recache_checked(always=true)
  assert_eq(line.xy_values_checked().to_array(), [1.0, 10.0, 2.0, 20.0])
  assert_eq(points.map(point => point.x()), [1.0, 70.0])
}

///|
test "Line shape errors stay lazy and leave the old generation and invalid flags" {
  let line = figure().plot_line(Numeric([1.0, 2.0]), Numeric([10.0, 20.0]))
  let old = line.xy_values_checked()
  let old_y = line.y_values_checked()
  line.set_xdata(Numeric([4.0, 5.0, 6.0]))
  assert_true(physical_equal(line.y_values_checked(), old_y))
  assert_true(line.invalid_x && !line.invalid_y)
  for _ in 0..<2 {
    assert_true(
      try {
        ignore(line.x_values_checked())
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message.contains("shape mismatch")
        _ => false
      },
    )
    assert_true(physical_equal(line.cache.flat, old))
    assert_eq(old.to_array(), [1.0, 10.0, 2.0, 20.0])
    assert_true(line.invalid_x && !line.invalid_y)
  }
  line.set_xdata(Numeric([7.0]))
  assert_eq(line.xy_values_checked().to_array(), [7.0, 10.0, 7.0, 20.0])
  guard line.get_xdata() is Numeric(raw) else { fail("numeric originals") }
  assert_eq(raw, [7.0])
  let broadcast = line.xy_values_checked()
  line.set_ydata(Numeric([]))
  // x is valid and already broadcast to length two. An ordinary refresh uses
  // that converted view; only a forced refresh reads the singleton raw x again.
  assert_true(
    try {
      ignore(line.xy_values_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (2,) and arg 1 with shape (0,)."
      _ => false
    },
  )
  assert_true(!line.invalid_x && line.invalid_y)
  assert_true(physical_equal(line.cache.flat, broadcast))
  assert_eq(broadcast.to_array(), [7.0, 10.0, 7.0, 20.0])
  line.recache_checked(always=true)
  assert_eq(line.xy_values_checked().length(), 0)
  assert_true(!line.invalid_x && !line.invalid_y)
}

///|
test "Line x category conversion appends before a later broadcast failure" {
  let axes = figure().axes()
  let line = axes.plot_line(Category(["a", "b"]), Numeric([10.0, 20.0]))
  axes.unstale_view()
  let old = line.xy_values_checked()
  line.set_data(Category(["fresh", "b"]), Numeric([1.0, 2.0, 3.0]))
  assert_true(
    try {
      ignore(line.xy_values_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.contains("shape mismatch")
      _ => false
    },
  )
  assert_eq(axes.x_axis().get_category_units().unwrap().labels(), [
    "a", "b", "fresh",
  ])
  assert_true(physical_equal(line.cache.flat, old))
  assert_true(line.invalid_x && line.invalid_y)
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (0.0, 1.0),
  )
  assert_true(
    !axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
}

///|
test "Line detached conversion uses float text while valid Date caches stay readable" {
  let axes = figure().axes()
  let date = @date.RRuleDateTime::aware(
    @date.datetime(2024, 1, 1, offset_seconds=0),
  )
  let line = axes.plot_line(Date([date, date]), Numeric([10.0, 20.0]))
  let current = line.x_values_checked()
  line.detach()
  assert_true(physical_equal(line.x_values_checked(), current))
  line.set_xdata(Category(["1_0", "١٢.٥"]))
  assert_eq(line.x_values_checked().to_array(), [10.0, 12.5])
  line.set_xdata(Date([date, date]))
  assert_true(
    try {
      ignore(line.x_values_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: float() argument must be a string or a real number, not 'datetime.datetime'"
      _ => false
    },
  )
  assert_true(line.invalid_x)
  line.set_data(Date([]), Numeric([]))
  assert_eq(line.xy_values_checked().length(), 0)
  line.set_data(Numeric([3.0]), Numeric([4.0]))
  assert_eq(line.xy_values_checked().to_array(), [3.0, 4.0])
}

///|
test "Line initial shape validation precedes unit discovery while per-coordinate inputs remain typed" {
  let axes = figure().axes()
  assert_true(
    try {
      ignore(axes.plot_line(Category(["a"]), Numeric([10.0, 20.0])))
      false
    } catch {
      @core.DataError::LengthMismatch(expected~, actual~) =>
        expected == 1 && actual == 2
      _ => false
    },
  )
  assert_true(!axes.x_axis().have_units())
  assert_eq(axes.artists().length(), 0)
  let date = @date.RRuleDateTime::naive(@date.datetime(2024, 1, 1))
  let line = axes.plot_line(Category(["a", "b"]), Date([date, date]))
  guard line.get_xdata() is Category(xs) else { fail("category originals") }
  guard line.get_ydata() is Date(ys) else { fail("date originals") }
  assert_eq(xs, ["a", "b"])
  assert_true(ys[0].is_naive())
  assert_eq(line.x_values_checked().to_array(), [0.0, 1.0])
  assert_eq(line.y_values_checked().get(0), date.to_ordinal())
}

///|
test "Line pruning detaches erased identity without adopting generated display Lines" {
  let axes = figure().axes()
  let erased = axes.plot_line(Numeric([1.0, 2.0]), Numeric([10.0, 20.0]))
  let retained = axes.plot_line(Numeric([3.0, 4.0]), Numeric([30.0, 40.0]))
  axes.state.val.artists.retain(artist => {
    match artist {
      Artist::Line(points, _) => !physical_equal(points, erased.points)
      _ => true
    }
  })
  axes.state.val.artists.push(
    Artist::Line(
      [@core.point(1.0, 10.0), @core.point(2.0, 20.0)],
      @core.style("black"),
    ),
  )
  axes.prune_line_originals()
  assert_true(erased.owner is None)
  assert_true(retained.owner is Some(_))
  assert_eq(axes.state.val.line_originals.length(), 1)
  assert_true(physical_equal(axes.state.val.line_originals[0], retained))
  erased.set_data(Numeric([7.0]), Numeric([8.0]))
  assert_eq(erased.xy_values_checked().to_array(), [7.0, 8.0])
  assert_eq(retained.xy_values_checked().to_array(), [3.0, 30.0, 4.0, 40.0])
}

///|
test "Line flat cache addressability check precedes allocation without a logical point cap" {
  assert_eq(line2d_flat_length(1073741823), 2147483646)
  assert_true(
    try {
      ignore(line2d_flat_length(1073741824))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ResourceError: Line Float64 cache exceeds Array addressability"
      _ => false
    },
  )
}
