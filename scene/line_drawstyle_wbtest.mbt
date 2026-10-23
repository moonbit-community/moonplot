///|
test "Line drawstyle validates before writes and equal String preserves pending state" {
  let axes = figure().axes()
  let line = axes.plot_line(Numeric([0.0, 2.0]), Numeric([1.0, 4.0]))
  axes.unstale_view()
  line.mark_drawn()
  let cache = line.cache
  let path = line.path_values
  let points = line.points
  let style = line.style
  let requests = [
    axes.x_axis().autoscale_stale(),
    axes.y_axis().autoscale_stale(),
  ]
  let limits = (axes.data_limits().lower(), axes.data_limits().upper())
  assert_eq(line.get_drawstyle(), "default")
  line.set_drawstyle("default")
  assert_true(!line.stale() && !line.invalid_x && !line.invalid_y)
  line.set_ydata(Numeric([1.0, 2.0, 3.0]))
  line.mark_drawn()
  line.set_drawstyle("default")
  assert_true(!line.stale() && !line.invalid_x && line.invalid_y)
  assert_true(
    try {
      line.set_drawstyle("Default")
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: 'Default' is not a valid value for drawstyle. Supported values are 'default', 'steps-mid', 'steps-pre', 'steps-post', 'steps'"
      _ => false
    },
  )
  assert_eq(line.get_drawstyle(), "default")
  assert_true(!line.stale() && !line.invalid_x && line.invalid_y)
  line.set_drawstyle("steps")
  assert_eq(line.get_drawstyle(), "steps")
  assert_true(line.stale() && line.invalid_x && line.invalid_y)
  line.mark_drawn()
  line.set_drawstyle("steps")
  assert_true(!line.stale() && line.invalid_x && line.invalid_y)
  line.set_drawstyle("steps-pre")
  assert_eq(line.get_drawstyle(), "steps-pre")
  assert_true(line.stale())
  assert_true(physical_equal(line.cache, cache))
  assert_true(physical_equal(line.path_values, path))
  assert_true(physical_equal(line.points, points))
  assert_true(physical_equal(line.style, style))
  assert_eq(
    [axes.x_axis().autoscale_stale(), axes.y_axis().autoscale_stale()],
    requests,
  )
  assert_eq((axes.data_limits().lower(), axes.data_limits().upper()), limits)
}

///|
test "Line step paths preserve source order and empty singleton shape" {
  let line = figure().plot_line(
    Numeric([0.0, 2.0, 1.0]),
    Numeric([1.0, 4.0, -3.0]),
  )
  let processed = [0.0, 1.0, 2.0, 4.0, 1.0, -3.0]
  for
    (style, expected) in [
      ("default", processed),
      ("steps", [0.0, 1.0, 0.0, 4.0, 2.0, 4.0, 2.0, -3.0, 1.0, -3.0]),
      ("steps-pre", [0.0, 1.0, 0.0, 4.0, 2.0, 4.0, 2.0, -3.0, 1.0, -3.0]),
      ("steps-post", [0.0, 1.0, 2.0, 1.0, 2.0, 4.0, 1.0, 4.0, 1.0, -3.0]),
      (
        "steps-mid",
        [0.0, 1.0, 1.0, 1.0, 1.0, 4.0, 1.5, 4.0, 1.5, -3.0, 1.0, -3.0],
      ),
    ] {
    line.set_drawstyle(style)
    assert_eq(line.path_values_checked().to_array(), expected)
    assert_eq(line.xy_values_checked().to_array(), processed)
    assert_eq(line.x_values_checked().to_array(), [0.0, 2.0, 1.0])
  }
  for style in ["default", "steps", "steps-pre", "steps-post", "steps-mid"] {
    let empty = figure().plot_line(Numeric([]), Numeric([]))
    empty.set_drawstyle(style)
    let path = empty.path_values_checked()
    assert_eq(path.length(), 0)
    assert_eq(
      physical_equal(path, empty.xy_values_checked()),
      style == "default",
    )
    let singleton = figure().plot_line(Numeric([7.0]), Numeric([9.0]))
    singleton.set_drawstyle(style)
    assert_eq(
      singleton.path_values_checked().to_array(),
      if style == "steps-mid" {
        [7.0, 9.0, 7.0, 9.0]
      } else {
        [7.0, 9.0]
      },
    )
    assert_eq(singleton.xy_values_checked().to_array(), [7.0, 9.0])
  }
}

///|
test "Line default path shares XY while step paths retain independent generations" {
  let line = figure().plot_line(Numeric([0.0, 2.0]), Numeric([1.0, 4.0]))
  let original = line.path_values_checked()
  assert_true(physical_equal(original, line.xy_values_checked()))
  original.set(0, 3.0)
  assert_eq(line.x_values_checked().get(0), 3.0)
  line.set_drawstyle("steps-mid")
  let mid = line.path_values_checked()
  assert_eq(mid.to_array(), [0.0, 1.0, 1.0, 1.0, 1.0, 4.0, 2.0, 4.0])
  let current = line.xy_values_checked()
  current.set(0, 8.0)
  current.set(1, -7.0)
  mid.set(1, -50.0)
  assert_eq(mid.get(0), 0.0)
  assert_eq(current.get(1), -7.0)
  line.mark_drawn()
  line.set_drawstyle("steps-mid")
  assert_true(!line.stale())
  assert_true(physical_equal(mid, line.path_values_checked()))
  line.set_drawstyle("steps-pre")
  assert_true(physical_equal(line.path_values, mid))
  let pre = line.path_values_checked()
  // Only x is invalid; valid processed y, including its borrowed edit, survives.
  assert_eq(pre.to_array(), [0.0, -7.0, 0.0, 4.0, 2.0, 4.0])
  assert_eq(original.to_array(), [3.0, 1.0, 2.0, 4.0])
  assert_eq(mid.get(1), -50.0)
  assert_eq(current.to_array(), [8.0, -7.0, 2.0, 4.0])
  line.recache_checked(always=true)
  assert_eq(line.path_values_checked().to_array(), [
    0.0, 1.0, 0.0, 4.0, 2.0, 4.0,
  ])
  assert_eq(pre.get(1), -7.0)
}

///|
test "Line drawstyle invalidates x only and preserves single-coordinate getter timing" {
  let line = figure().plot_line(Numeric([0.0, 2.0]), Numeric([1.0, 4.0]))
  let old_y = line.y_values_checked()
  let old_path = line.path_values_checked()
  line.set_drawstyle("steps-post")
  assert_true(line.invalid_x && !line.invalid_y)
  assert_true(physical_equal(line.y_values_checked(), old_y))
  assert_true(line.invalid_x && !line.invalid_y)
  assert_true(physical_equal(line.path_values, old_path))
  let xs = line.x_values_checked()
  assert_eq(xs.to_array(), [0.0, 2.0])
  assert_true(!line.invalid_x && !line.invalid_y)
  assert_true(!physical_equal(line.y_values_checked(), old_y))
  assert_eq(line.path_values_checked().to_array(), [
    0.0, 1.0, 2.0, 1.0, 2.0, 4.0,
  ])
  let before_y = line.y_values_checked()
  line.set_ydata(Numeric([10.0, 20.0]))
  let (mixed_x, fresh_y) = line.data_values_checked()
  assert_true(physical_equal(mixed_x, xs))
  assert_true(!physical_equal(mixed_x, line.x_values_checked()))
  assert_eq(before_y.to_array(), [1.0, 4.0])
  assert_eq(fresh_y.to_array(), [10.0, 20.0])
  assert_eq(line.path_values_checked().to_array(), [
    0.0, 10.0, 2.0, 10.0, 2.0, 20.0,
  ])
}

///|
test "Line unit force-recache and relim consume the same cached midpoint path" {
  let axes = figure().axes()
  let line = axes.plot_line(
    Category(["a", "b", "a"]),
    Numeric([1.0, 4.0, -3.0]),
  )
  line.set_drawstyle("steps-mid")
  let old_xy = line.xy_values_checked()
  let old_path = line.path_values_checked()
  let attached = line.points
  let style = line.style
  axes.unstale_view()
  axes.set_x_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["b", "a"]))),
  )
  assert_eq(line.x_values_checked().to_array(), [1.0, 0.0, 1.0])
  assert_eq(line.path_values_checked().to_array(), [
    1.0, 1.0, 0.5, 1.0, 0.5, 4.0, 0.5, 4.0, 0.5, -3.0, 1.0, -3.0,
  ])
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (0.5, 1.0),
  )
  assert_true(physical_equal(line.points, attached))
  assert_true(physical_equal(line.style, style))
  assert_eq(attached.map(point => point.x()), [1.0, 0.5, 0.5, 0.5, 0.5, 1.0])
  assert_eq(old_xy.to_array(), [0.0, 1.0, 1.0, 4.0, 0.0, -3.0])
  assert_eq(old_path.length(), 12)
  assert_true(
    axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
  // Edits to processed XY do not regenerate an already valid stepped path.
  line.xy_values_checked().set(0, 100.0)
  axes.relim_checked()
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (0.5, 1.0),
  )
}

///|
test "Line late path shape failure retains cache and path through detach and repair" {
  let axes = figure().axes()
  let line = axes.plot_line(Category(["a", "b"]), Numeric([1.0, 4.0]))
  line.set_drawstyle("steps-post")
  let path = line.path_values_checked()
  let cache = line.cache
  let points = line.points
  let before = points.map(point => (point.x(), point.y()))
  line.set_data(Category(["new", "b"]), Numeric([1.0, 2.0, 3.0]))
  assert_true(
    try {
      ignore(line.path_values_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.contains("shape mismatch")
      _ => false
    },
  )
  assert_eq(axes.x_axis().get_category_units().unwrap().labels(), [
    "a", "b", "new",
  ])
  assert_true(line.invalid_x && line.invalid_y)
  assert_true(
    physical_equal(line.cache, cache) && physical_equal(line.path_values, path),
  )
  assert_eq(points.map(point => (point.x(), point.y())), before)
  line.remove()
  assert_eq(line.get_drawstyle(), "steps-post")
  assert_true(line.owner is None)
  assert_true(physical_equal(line.path_values, path))
  line.set_data(Numeric([7.0]), Numeric([9.0]))
  assert_eq(line.path_values_checked().to_array(), [7.0, 9.0])
  assert_true(physical_equal(line.points, points))
  assert_eq(path.to_array(), [0.0, 1.0, 1.0, 1.0, 1.0, 4.0])
}

///|
test "Line midpoint uses add then divide and preserves copied IEEE values" {
  let line = figure().plot_line(
    Numeric([1.7e308, 1.7e308]),
    Numeric([-0.0, 0.0]),
  )
  line.set_drawstyle("steps-mid")
  let path = line.path_values_checked()
  assert_eq(path.length(), 8)
  assert_eq(path.get(2), 1.0 / 0.0)
  assert_eq(path.get(4), 1.0 / 0.0)
  assert_eq(path.get(1).reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_eq(path.get(3).reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_eq(path.get(5).reinterpret_as_uint64(), 0UL)
  assert_eq(line.x_values_checked().to_array(), [1.7e308, 1.7e308])
  let zeros = line_drawstyle_path(
    "steps-mid",
    line2d_cache_from_flat([-0.0, -0.0, -0.0, 0.0]),
  )
  assert_eq(zeros.get(2).reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_eq(zeros.get(4).reinterpret_as_uint64(), 0x8000000000000000UL)
  let nonfinite = line_drawstyle_path(
    "steps-mid",
    line2d_cache_from_flat([1.0 / 0.0, 1.0, -1.0 / 0.0, 2.0]),
  )
  assert_true(nonfinite.get(2).is_nan() && nonfinite.get(4).is_nan())
  assert_eq(nonfinite.get(0), 1.0 / 0.0)
  assert_eq(nonfinite.get(6), -1.0 / 0.0)
}

///|
test "Line path allocation uses exact flat addressability without allocating a giant path" {
  assert_eq(line_drawstyle_path_cells(0, "steps-mid"), 0)
  assert_eq(line_drawstyle_path_cells(1, "steps-pre"), 2)
  assert_eq(line_drawstyle_path_cells(1, "steps-mid"), 4)
  assert_eq(line_drawstyle_path_cells(1073741823, "default"), 2147483646)
  assert_eq(line_drawstyle_path_cells(536870912, "steps-pre"), 2147483646)
  assert_eq(line_drawstyle_path_cells(536870911, "steps-mid"), 2147483644)
  for
    (length, style) in [
      (1073741824, "default"),
      (536870913, "steps-post"),
      (536870912, "steps-mid"),
      (2147483647, "steps-mid"),
    ] {
    assert_true(
      try {
        ignore(line_drawstyle_path_cells(length, style))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ResourceError: Line path Float64 cache exceeds Array addressability"
        _ => false
      },
    )
  }
  // A zero-stride view proves the builder rejects its actual path shape before
  // allocation or element traversal, without inventing a logical point budget.
  let repeated = @ticker.TickValues::from_array([1.0]).view(0, 0, 536870912)
  let virtual_cache : Line2DCache = {
    flat: @ticker.TickValues::from_array([]),
    xs: repeated,
    ys: repeated,
  }
  assert_true(
    try {
      ignore(line_drawstyle_path("steps-mid", virtual_cache))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ResourceError: Line path Float64 cache exceeds Array addressability"
      _ => false
    },
  )
}
