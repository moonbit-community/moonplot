///|
test "Line linewidth preserves IEEE assignment and comparison-based stale behavior" {
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  assert_eq(line.get_linewidth(), 2.0)
  line.mark_drawn()
  line.set_linewidth(2.0)
  assert_true(!line.stale())
  line.set_linewidth(0.0)
  assert_true(line.stale())
  line.mark_drawn()
  line.set_linewidth(-0.0)
  assert_eq(line.get_linewidth().reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_true(!line.stale())
  line.set_linewidth(0.0)
  assert_eq(line.get_linewidth().reinterpret_as_uint64(), 0UL)
  assert_true(!line.stale())
  line.set_linewidth(-2.5)
  assert_eq(line.get_linewidth(), -2.5)
  assert_true(line.stale())
  line.mark_drawn()
  line.set_linewidth(0.0 / 0.0)
  assert_true(line.get_linewidth().is_nan() && line.stale())
  line.mark_drawn()
  line.set_linewidth(0.0 / 0.0)
  assert_true(line.get_linewidth().is_nan() && line.stale())
  line.set_linewidth(1.0 / 0.0)
  line.mark_drawn()
  line.set_linewidth(1.0 / 0.0)
  assert_eq(line.get_linewidth(), 1.0 / 0.0)
  assert_true(!line.stale())
  line.set_linewidth(-1.0 / 0.0)
  assert_eq(line.get_linewidth(), -1.0 / 0.0)
  assert_true(line.stale())
  line.mark_drawn()
  line.set_linewidth(-1.0 / 0.0)
  assert_true(!line.stale())
  line.set_linewidth(1UL.reinterpret_as_double())
  assert_eq(line.get_linewidth().reinterpret_as_uint64(), 1UL)
}

///|
test "Line shared initial Style and linewidth replacement preserve every other field" {
  let axes = figure().axes()
  let line = axes.plot_line(Numeric([1.0]), Numeric([2.0]), color="#123456")
  guard axes.state.val.artists[0] is Artist::Line(_, initial_style) else {
    fail("Line artist")
  }
  assert_true(physical_equal(line.style, initial_style))
  assert_eq(initial_style.width(), 2.0)
  // Controlled nondefault appearance: no additional public style setter is implied.
  line.style = @core.style(
    "#abcdef",
    width=3.0,
    radius=-0.0,
    fill="gold",
    font_size=21.0,
    marker="x",
  )
  line.mark_drawn()
  line.set_linewidth(3.0)
  assert_true(!line.stale())
  for width in [-1.0, 0.0, 5.0] {
    line.set_linewidth(width)
    assert_eq(line.get_linewidth(), width)
    assert_eq(line.style.color(), "#abcdef")
    assert_eq(line.style.radius().reinterpret_as_uint64(), 0x8000000000000000UL)
    assert_eq(line.style.fill(), "gold")
    assert_eq(line.style.font_size(), 21.0)
    assert_eq(line.style.marker(), "x")
  }
}

///|
test "Line linewidth leaves pending data cache visibility ownership and axis state alone" {
  let axes = figure().axes()
  let line = axes.plot_line(Numeric([1.0, 2.0]), Numeric([10.0, 20.0]))
  axes.unstale_view()
  axes.set_xlim(0.5, 3.0)
  axes.set_ylim(5.0, 25.0)
  axes.x_axis().request_autoscale()
  line.set_visible(false)
  line.set_xdata(Numeric([3.0, 4.0, 5.0]))
  let cache = line.cache
  guard line.get_xdata() is Numeric(raw_x) else { fail("numeric x") }
  guard line.get_ydata() is Numeric(raw_y) else { fail("numeric y") }
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
  for width in [5.0, 5.0, -0.0, 0.0 / 0.0, 1.0 / 0.0] {
    line.set_linewidth(width)
    assert_true(!line.get_visible())
    assert_true(line.invalid_x && !line.invalid_y)
    assert_true(physical_equal(line.cache, cache))
    guard line.get_xdata() is Numeric(x) else { fail("numeric x") }
    guard line.get_ydata() is Numeric(y) else { fail("numeric y") }
    assert_true(physical_equal(x, raw_x) && physical_equal(y, raw_y))
    assert_true(physical_equal(line.owner.unwrap().state, axes.state))
    assert_true(physical_equal(line.removal_parent.unwrap().state, axes.state))
    let after_x = axes.x_axis().stored_view_limits()
    let after_y = axes.y_axis().stored_view_limits()
    assert_eq(
      (after_x.lower(), after_x.upper(), after_y.lower(), after_y.upper()),
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
  // Only the subsequent explicit processed query, not width editing, converts.
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
  assert_true(physical_equal(line.cache, cache))
}

///|
test "removed and cleared Line linewidth setters retain detached data state" {
  let axes = figure().axes()
  let removed = axes.plot_line(Numeric([1.0]), Numeric([2.0]))
  let cleared = axes.plot_line(Numeric([3.0]), Numeric([4.0]))
  removed.remove()
  axes.clear()
  for line in [removed, cleared] {
    let cache = line.cache
    line.set_visible(false)
    line.mark_drawn()
    line.set_linewidth(-3.0)
    assert_eq(line.get_linewidth(), -3.0)
    assert_true(line.stale() && !line.get_visible())
    assert_true(line.owner is None)
    assert_true(!line.invalid_x && !line.invalid_y)
    assert_true(physical_equal(line.cache, cache))
    line.mark_drawn()
    line.set_linewidth(-3.0)
    assert_true(!line.stale())
  }
  assert_true(removed.removal_parent is Some(_))
  assert_true(cleared.removal_parent is None)
  assert_eq(removed.xy_values_checked().to_array(), [1.0, 2.0])
  assert_eq(cleared.xy_values_checked().to_array(), [3.0, 4.0])
  assert_eq(axes.state.val.artists.length(), 0)
}
