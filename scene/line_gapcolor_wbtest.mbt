///|
test "Line gapcolor retains optional spelling and every successful setter marks stale" {
  assert_true(@core.style("red").line_gapcolor() is None)
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  let foreground = line.get_color()
  assert_true(line.get_gapcolor() is None)
  assert_true(line.scaled_dashes_as_list)
  line.mark_drawn()
  let first = line.style
  line.set_gapcolor(None)
  assert_true(line.get_gapcolor() is None && line.stale())
  assert_true(!physical_equal(line.style, first))
  for gapcolor in ["RED", "#1234", "none", "None", "C0", "C" + "0".repeat(4301)] {
    line.mark_drawn()
    line.set_gapcolor(Some(gapcolor))
    assert_eq(line.get_gapcolor(), Some(gapcolor))
    assert_true(line.stale())
    let previous = line.style
    line.mark_drawn()
    line.set_gapcolor(Some(gapcolor))
    assert_true(line.stale())
    assert_true(!physical_equal(line.style, previous))
  }
  line.mark_drawn()
  line.set_gapcolor(None)
  assert_true(line.get_gapcolor() is None && line.stale())
  assert_eq(line.get_color(), foreground)
  assert_true(!line.source_color)
}

///|
test "Line invalid gapcolor preserves exact appearance and all pending state" {
  let line = figure().plot_line(Numeric([1.0, 2.0]), Numeric([3.0, 4.0]))
  line.set_linestyle("--")
  line.set_gapcolor(Some("red"))
  line.set_visible(false)
  line.set_ydata(Numeric([10.0, 20.0, 30.0]))
  line.mark_drawn()
  let style = line.style
  let cache = line.cache
  let path = line.path_values
  let metadata = line.unscaled_dash_pattern
  let scaled_as_list = line.scaled_dashes_as_list
  assert_true(
    try {
      line.set_gapcolor(Some("not-a-color"))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: 'not-a-color' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
      _ => false
    },
  )
  assert_eq(line.get_gapcolor(), Some("red"))
  assert_true(physical_equal(line.style, style) && !line.stale())
  assert_true(
    physical_equal(line.cache, cache) && physical_equal(line.path_values, path),
  )
  assert_true(physical_equal(line.unscaled_dash_pattern, metadata))
  assert_eq(line.scaled_dashes_as_list, scaled_as_list)
  assert_true(!line.invalid_x && line.invalid_y && !line.get_visible())
  assert_true(line.owner is Some(_) && line.removal_parent is Some(_))
}

///|
test "Line gapcolor survives every appearance rebuild without rescaling on gap edits" {
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  // Controlled nondefault appearance, not a public arbitrary-Style Line setter.
  line.style = @core.style(
    "red",
    width=-0.0,
    radius=7.0,
    fill="gold",
    font_size=19.0,
    marker="x",
    line_alpha=Some(0.25),
  )
  let stroke = line.style.line_stroke()
  let metadata = line.unscaled_dash_pattern
  line.set_gapcolor(Some("#1234"))
  assert_true(physical_equal(line.style.line_stroke(), stroke))
  assert_true(physical_equal(line.unscaled_dash_pattern, metadata))
  assert_eq(line.get_linewidth().reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_eq(line.get_color(), "red")
  assert_eq(line.get_alpha(), Some(0.25))
  assert_eq(line.style.radius(), 7.0)
  assert_eq(line.style.fill(), "gold")
  assert_eq(line.style.font_size(), 19.0)
  assert_eq(line.style.marker(), "x")
  line.set_color("C0")
  assert_eq(line.get_gapcolor(), Some("#1234"))
  line.set_alpha(Some(0.75))
  assert_eq(line.get_gapcolor(), Some("#1234"))
  line.set_linewidth(3.0)
  assert_eq(line.get_gapcolor(), Some("#1234"))
  line.set_linestyle("--")
  assert_eq(line.get_gapcolor(), Some("#1234"))
  let scaled = line.style.line_stroke()
  let captured = line.unscaled_dash_pattern
  line.set_gapcolor(Some("none"))
  assert_true(physical_equal(line.style.line_stroke(), scaled))
  assert_true(physical_equal(line.unscaled_dash_pattern, captured))
  line.set_linewidth(3.0)
  line.set_linestyle("None")
  assert_eq(line.get_gapcolor(), Some("none"))
  assert_eq(line.get_color(), "C0")
  assert_eq(line.get_alpha(), Some(0.75))
  assert_eq(line.style.radius(), 7.0)
  assert_eq(line.style.fill(), "gold")
  assert_eq(line.style.font_size(), 19.0)
  assert_eq(line.style.marker(), "x")
}

///|
test "Line gapcolor leaves caches axis state and detached pending data untouched" {
  let axes = figure().axes()
  let line = axes.plot_line(Numeric([1.0, 2.0]), Numeric([3.0, 4.0]))
  line.set_drawstyle("steps-mid")
  ignore(line.path_values_checked())
  axes.unstale_view()
  axes.set_xlim(0.5, 3.0)
  axes.set_ylim(2.0, 5.0)
  axes.x_axis().request_autoscale()
  line.set_xdata(Numeric([1.0, 2.0, 3.0]))
  let cache = line.cache
  let path = line.path_values
  let points = line.points
  let before_points = points.map(point => (point.x(), point.y()))
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
  line.set_visible(false)
  for gapcolor in [Some("blue"), None, Some("none")] {
    line.set_gapcolor(gapcolor)
    assert_true(
      physical_equal(line.cache, cache) &&
      physical_equal(line.path_values, path),
    )
    assert_true(physical_equal(line.points, points))
    assert_eq(points.map(point => (point.x(), point.y())), before_points)
    assert_true(line.invalid_x && !line.invalid_y && !line.get_visible())
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
  }
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
  line.mark_drawn()
  line.set_gapcolor(Some("green"))
  assert_true(line.owner is None && line.removal_parent is Some(_))
  assert_true(line.stale() && line.invalid_x && !line.invalid_y)
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
  cleared.set_gapcolor(Some("red"))
  assert_true(
    cleared.owner is None && cleared.removal_parent is None && cleared.stale(),
  )
  assert_eq(cleared.get_gapcolor(), Some("red"))
}

///|
test "Line dash container provenance is captured with scaling not read from current rc" {
  let previous_pattern = @config.lines_dashed_pattern()
  let previous_scale = @config.lines_scale_dashes()
  defer {
    @config.set_lines_dashed_pattern(previous_pattern)
    @config.set_lines_scale_dashes(previous_scale)
  }
  @config.set_lines_dashed_pattern([])
  @config.set_lines_scale_dashes(true)
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  line.set_linestyle("--")
  assert_true(line.scaled_dashes_as_list)
  @config.set_lines_scale_dashes(false)
  line.set_gapcolor(Some("red"))
  assert_true(line.scaled_dashes_as_list)
  assert_true(
    try {
      ignore(
        line_gapcolor_inverse(
          0.0,
          [],
          scaled_as_list=line.scaled_dashes_as_list,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: list index out of range"
      _ => false
    },
  )
  line.mark_drawn()
  line.set_linewidth(line.get_linewidth())
  assert_true(!line.stale() && !line.scaled_dashes_as_list)
  assert_eq(line.get_gapcolor(), Some("red"))
  assert_eq(line.style.line_stroke().dash_sequence(), Some([]))
  @config.set_lines_scale_dashes(true)
  line.set_gapcolor(None)
  assert_true(!line.scaled_dashes_as_list)
  assert_true(
    try {
      ignore(
        line_gapcolor_inverse(
          0.0,
          [],
          scaled_as_list=line.scaled_dashes_as_list,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: tuple index out of range"
      _ => false
    },
  )
  line.mark_drawn()
  let before = line.style
  assert_true(
    try {
      line.set_linestyle("NONE")
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(!line.scaled_dashes_as_list && !line.stale())
  assert_true(physical_equal(line.style, before))
  line.set_linestyle("--")
  assert_true(line.scaled_dashes_as_list && line.stale())
}

///|
test "Line is_dashed depends only on canonical linestyle" {
  let previous_pattern = @config.lines_dashed_pattern()
  defer @config.set_lines_dashed_pattern(previous_pattern)
  @config.set_lines_dashed_pattern([])
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  line.set_visible(false)
  line.set_gapcolor(Some("none"))
  line.set_linewidth(0.0 / 0.0)
  for
    (style, dashed) in [
      ("solid", false),
      ("dashed", true),
      ("dashdot", true),
      ("dotted", true),
      ("None", false),
      ("-", false),
    ] {
    line.set_linestyle(style)
    line.mark_drawn()
    let cache = line.cache
    let path = line.path_values
    assert_eq(line.is_dashed(), dashed)
    assert_true(!line.stale() && !line.invalid_x && !line.invalid_y)
    assert_true(
      physical_equal(line.cache, cache) &&
      physical_equal(line.path_values, path),
    )
    assert_true(!line.get_visible() && line.get_gapcolor() == Some("none"))
  }
}
