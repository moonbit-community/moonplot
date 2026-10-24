///|
test "Line numeric dashes snapshot input and keep old effective Style generations" {
  let previous_scale = @config.lines_scale_dashes()
  defer @config.set_lines_scale_dashes(previous_scale)
  @config.set_lines_scale_dashes(false)
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  let incoming = [2.0, 3.0, 4.0]
  line.mark_drawn()
  line.set_dashes(incoming)
  assert_eq(line.get_linestyle(), "--")
  assert_true(line.is_dashed() && line.stale() && !line.scaled_dashes_as_list)
  let old_style = line.style
  let captured = line.unscaled_dash_pattern
  incoming[0] = 99.0
  incoming.clear()
  assert_eq(captured.dashes, Some([2.0, 3.0, 4.0]))
  assert_eq(old_style.line_stroke().dash_sequence(), Some([2.0, 3.0, 4.0]))
  let inspected = old_style.line_stroke().dash_sequence().unwrap()
  inspected[0] = 88.0
  assert_eq(line.style.line_stroke().dash_sequence(), Some([2.0, 3.0, 4.0]))
  line.mark_drawn()
  line.set_dashes([2.0, 3.0, 4.0])
  assert_true(line.stale() && !physical_equal(line.style, old_style))
  assert_true(!physical_equal(line.unscaled_dash_pattern, captured))
  line.set_dashes([7.0, 8.0])
  assert_eq(old_style.line_stroke().dash_sequence(), Some([2.0, 3.0, 4.0]))
  assert_eq(captured.dashes, Some([2.0, 3.0, 4.0]))
}

///|
test "Line custom dashes rescale old tuple history while String linestyle recaptures rc" {
  let previous_pattern = @config.lines_dashed_pattern()
  let previous_scale = @config.lines_scale_dashes()
  defer {
    @config.set_lines_dashed_pattern(previous_pattern)
    @config.set_lines_scale_dashes(previous_scale)
  }
  @config.set_lines_dashed_pattern([9.0, 7.0])
  @config.set_lines_scale_dashes(false)
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  line.set_dashes([2.0, 3.0])
  let captured = line.unscaled_dash_pattern
  let first = line.style
  assert_eq(captured.dashes, Some([2.0, 3.0]))
  assert_eq(first.line_stroke().dash_sequence(), Some([2.0, 3.0]))
  @config.set_lines_dashed_pattern([11.0, 13.0])
  @config.set_lines_scale_dashes(true)
  line.mark_drawn()
  line.set_linewidth(line.get_linewidth())
  assert_true(!line.stale() && line.scaled_dashes_as_list)
  assert_true(physical_equal(line.unscaled_dash_pattern, captured))
  assert_eq(line.style.line_stroke().dash_sequence(), Some([4.0, 6.0]))
  assert_eq(first.line_stroke().dash_sequence(), Some([2.0, 3.0]))
  @config.set_lines_scale_dashes(false)
  line.set_linewidth(line.get_linewidth())
  assert_true(!line.stale() && !line.scaled_dashes_as_list)
  assert_true(physical_equal(line.unscaled_dash_pattern, captured))
  assert_eq(line.style.line_stroke().dash_sequence(), Some([2.0, 3.0]))
  line.set_linestyle("--")
  assert_true(line.stale())
  assert_eq(line.unscaled_dash_pattern.dashes, Some([11.0, 13.0]))
  assert_eq(line.style.line_stroke().dash_sequence(), Some([11.0, 13.0]))
  line.set_dashes([5.0])
  assert_eq(line.unscaled_dash_pattern.dashes, Some([5.0]))
  assert_eq(line.style.line_stroke().dash_sequence(), Some([5.0]))
}

///|
test "Line empty numeric dashes delegate to complete solid scaling even at NaN width" {
  let previous_pattern = @config.lines_dashed_pattern()
  let previous_scale = @config.lines_scale_dashes()
  defer {
    @config.set_lines_dashed_pattern(previous_pattern)
    @config.set_lines_scale_dashes(previous_scale)
  }
  @config.set_lines_dashed_pattern([])
  @config.set_lines_scale_dashes(true)
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  line.set_gapcolor(Some("red"))
  line.set_linestyle("--")
  assert_true(line.is_dashed())
  assert_eq(line.style.line_stroke().dash_sequence(), Some([]))
  line.set_dashes([])
  assert_eq(line.get_linestyle(), "-")
  assert_true(!line.is_dashed() && line.stale())
  assert_true(line.style.line_stroke().dash_sequence() is None)
  assert_true(line.unscaled_dash_pattern.dashes is None)
  assert_eq(line.get_gapcolor(), Some("red"))
  line.mark_drawn()
  line.set_dashes([])
  assert_true(line.stale())
  line.set_linewidth(0.0 / 0.0)
  line.set_dashes([])
  assert_true(line.style.line_stroke().dash_offset().is_nan())
  assert_true(line.style.line_stroke().dash_sequence() is None)
  assert_eq(line.unscaled_dash_pattern.offset.reinterpret_as_uint64(), 0UL)
  assert_true(line.scaled_dashes_as_list)
  @config.set_lines_scale_dashes(false)
  line.set_dashes([])
  assert_eq(line.style.line_stroke().dash_offset().reinterpret_as_uint64(), 0UL)
  assert_true(!line.scaled_dashes_as_list && line.stale())
}

///|
test "Line numeric dash normalization shares compensated sum and accepts the full Double domain" {
  let previous_scale = @config.lines_scale_dashes()
  defer @config.set_lines_scale_dashes(previous_scale)
  @config.set_lines_scale_dashes(false)
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  for
    (pattern, negative) in [
      ([1.0e16, -1.0, -1.0e16], true),
      ([1.0e16, 1.0, -1.0e16], false),
      ([0.0, 0.0], false),
      ([-0.0, -0.0], false),
      ([-1.0, 1.0], false),
      ([1.0, 2.0, 3.0], false),
      ([-1.0 / 0.0, 1.0], true),
      ([1.0, 1.0 / 0.0], false),
    ] {
    line.mark_drawn()
    line.set_dashes(pattern)
    assert_true(line.stale() && line.is_dashed())
    let expected = if negative { 0x8000000000000000UL } else { 0UL }
    assert_eq(
      line.unscaled_dash_pattern.offset.reinterpret_as_uint64(),
      expected,
    )
    assert_eq(
      line.style.line_stroke().dash_offset().reinterpret_as_uint64(),
      expected,
    )
    assert_eq(line.unscaled_dash_pattern.dashes, Some(pattern))
    assert_eq(line.style.line_stroke().dash_sequence(), Some(pattern))
  }
  for pattern in [[0.0 / 0.0, 1.0], [1.0 / 0.0, -1.0 / 0.0]] {
    line.set_dashes(pattern)
    assert_true(line.unscaled_dash_pattern.offset.is_nan())
    assert_true(line.style.line_stroke().dash_offset().is_nan())
    assert_true(line.is_dashed() && line.stale())
  }
  line.set_dashes([-1.0, -2.0])
  let offset = line.unscaled_dash_pattern.offset
  @config.set_lines_scale_dashes(true)
  line.set_linewidth(-0.0)
  assert_eq(
    line.unscaled_dash_pattern.offset.reinterpret_as_uint64(),
    offset.reinterpret_as_uint64(),
  )
  assert_eq(line.style.line_stroke().dash_offset().reinterpret_as_uint64(), 0UL)
  assert_eq(
    line.style.line_stroke().dash_sequence().unwrap()[0].reinterpret_as_uint64(),
    0UL,
  )
}

///|
test "Line custom dashes preserve appearance pending caches axes and detached ownership" {
  let axes = figure().axes()
  let line = axes.plot_line(Numeric([1.0, 2.0]), Numeric([3.0, 4.0]))
  line.set_drawstyle("steps-mid")
  ignore(line.path_values_checked())
  axes.unstale_view()
  line.set_color("C0")
  line.set_gapcolor(Some("#1234"))
  // Controlled nondefault appearance, not an arbitrary public Style setter.
  line.style = @core.style(
    line.get_color(),
    width=2.0,
    radius=7.0,
    fill="gold",
    font_size=19.0,
    marker="x",
    line_alpha=Some(0.25),
    line_gapcolor=line.get_gapcolor(),
  )
  let previous_style = line.style
  line.set_visible(false)
  line.set_xdata(Numeric([1.0, 2.0, 3.0]))
  axes.set_xlim(0.5, 3.0)
  axes.set_ylim(2.0, 5.0)
  axes.x_axis().request_autoscale()
  let cache = line.cache
  let path = line.path_values
  let points = line.points
  let xy = cache.flat.to_array()
  let path_numbers = path.to_array()
  guard line.get_xdata() is Numeric(raw_x) else { fail("numeric originals") }
  guard line.get_ydata() is Numeric(raw_y) else { fail("numeric originals") }
  let view_x = axes.x_axis().stored_view_limits()
  let view_y = axes.y_axis().stored_view_limits()
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
  line.set_dashes([2.0, 3.0, 4.0])
  assert_true(
    line.stale() && line.invalid_x && !line.invalid_y && !line.get_visible(),
  )
  assert_eq(line.get_drawstyle(), "steps-mid")
  assert_true(
    physical_equal(line.cache, cache) && physical_equal(line.path_values, path),
  )
  assert_true(physical_equal(line.points, points))
  assert_eq(cache.flat.to_array(), xy)
  assert_eq(path.to_array(), path_numbers)
  guard line.get_xdata() is Numeric(current_x) else {
    fail("numeric originals")
  }
  guard line.get_ydata() is Numeric(current_y) else {
    fail("numeric originals")
  }
  assert_true(
    physical_equal(raw_x, current_x) && physical_equal(raw_y, current_y),
  )
  assert_eq(line.get_color(), "C0")
  assert_eq(line.get_gapcolor(), Some("#1234"))
  assert_eq(line.get_alpha(), Some(0.25))
  assert_eq(line.get_linewidth(), 2.0)
  assert_eq(line.style.radius(), 7.0)
  assert_eq(line.style.fill(), "gold")
  assert_eq(line.style.font_size(), 19.0)
  assert_eq(line.style.marker(), "x")
  assert_true(line.source_color)
  assert_eq(previous_style.line_stroke().linestyle(), "-")
  assert_true(previous_style.line_stroke().dash_sequence() is None)
  assert_true(physical_equal(line.owner.unwrap().state, axes.state))
  assert_true(physical_equal(line.removal_parent.unwrap().state, axes.state))
  assert_eq(
    [axes.x_axis().autoscale_stale(), axes.y_axis().autoscale_stale()],
    requests,
  )
  assert_eq(
    [axes.x_axis().autoscale_on(), axes.y_axis().autoscale_on()],
    automatic,
  )
  let after_x = axes.x_axis().stored_view_limits()
  let after_y = axes.y_axis().stored_view_limits()
  assert_eq(
    (after_x.lower(), after_x.upper(), after_y.lower(), after_y.upper()),
    (view_x.lower(), view_x.upper(), view_y.lower(), view_y.upper()),
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
  line.remove()
  line.set_dashes([7.0, 8.0])
  assert_true(line.owner is None && line.removal_parent is Some(_))
  assert_true(
    physical_equal(line.cache, cache) && physical_equal(line.path_values, path),
  )
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
  let cleared = axes.plot_line(Numeric([7.0]), Numeric([8.0]))
  axes.clear()
  cleared.mark_drawn()
  cleared.set_dashes([])
  assert_true(
    cleared.owner is None && cleared.removal_parent is None && cleared.stale(),
  )
}

///|
test "Line custom numeric dashes accept bad patterns now and retain real late GC errors" {
  let previous_scale = @config.lines_scale_dashes()
  defer @config.set_lines_scale_dashes(previous_scale)
  @config.set_lines_scale_dashes(true)
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="blue",
  )
  let retained = fig.to_render_figure()
  line.set_dashes([-1.0, 1.0])
  assert_true(line.is_dashed() && line.stale())
  assert_true(
    try {
      ignore(@svg.render_with_positions_checked(retained))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: All values in the dash list must be non-negative"
      _ => false
    },
  )
  assert_true(line.stale())
  line.set_dashes([0.0, 0.0])
  assert_true(
    try {
      ignore(@svg.render_with_positions_checked(retained))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: At least one value in the dash list must be positive"
      _ => false
    },
  )
  assert_true(line.stale())
  line.set_dashes([1.0, 2.0, 3.0])
  ignore(@svg.render_with_positions_checked(retained))
  assert_true(!line.stale())
}
