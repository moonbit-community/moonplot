///|
test "LineStroke copies effective sequences and defaults to solid appearance" {
  let solid = @core.style("red").line_stroke()
  assert_eq(solid.linestyle(), "-")
  assert_eq(solid.dash_offset(), 0.0)
  assert_true(solid.dash_sequence() is None)
  let incoming = [2.0, 3.0]
  let stroke = @core.line_stroke("--", offset=-0.0, dashes=Some(incoming))
  let style = @core.style("red", line_stroke=stroke)
  incoming[0] = 99.0
  assert_eq(style.line_stroke().dash_sequence(), Some([2.0, 3.0]))
  let borrowed = style.line_stroke().dash_sequence().unwrap()
  borrowed[1] = 88.0
  assert_eq(stroke.dash_sequence(), Some([2.0, 3.0]))
  assert_eq(stroke.dash_offset().reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_eq(@core.line_stroke("--", dashes=Some([])).dash_sequence(), Some([]))
}

///|
test "Line linestyle canonicalizes exact aliases and rejects before any mutation" {
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  assert_eq(line.get_linestyle(), "-")
  for
    (input, expected) in [
      ("-", "-"),
      ("solid", "-"),
      ("--", "--"),
      ("dashed", "--"),
      ("-.", "-."),
      ("dashdot", "-."),
      (":", ":"),
      ("dotted", ":"),
      ("", "None"),
      (" ", "None"),
      ("none", "None"),
      ("None", "None"),
    ] {
    line.mark_drawn()
    line.set_linestyle(input)
    assert_eq(line.get_linestyle(), expected)
    assert_true(line.stale())
  }
  line.mark_drawn()
  let style = line.style
  let metadata = line.unscaled_dash_pattern
  assert_true(
    try {
      line.set_linestyle("NONE")
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: 'NONE' is not a valid value for ls."
      _ => false
    },
  )
  assert_true(physical_equal(line.style, style) && !line.stale())
  assert_true(physical_equal(line.unscaled_dash_pattern, metadata))
  line.set_visible(false)
  assert_true(
    try {
      line.set_linestyle("NONE")
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(line.stale() && !line.get_visible())
}

///|
test "Line pattern capture and equal-width rescaling use different live rc stages" {
  let previous_pattern = @config.lines_dashed_pattern()
  let previous_scale = @config.lines_scale_dashes()
  defer {
    @config.set_lines_dashed_pattern(previous_pattern)
    @config.set_lines_scale_dashes(previous_scale)
  }
  @config.set_lines_dashed_pattern([2.0, 3.0])
  @config.set_lines_scale_dashes(true)
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  line.set_linestyle("--")
  let first = line.style
  assert_eq(first.line_stroke().dash_sequence(), Some([4.0, 6.0]))
  @config.set_lines_dashed_pattern([9.0, 7.0])
  assert_eq(line.style.line_stroke().dash_sequence(), Some([4.0, 6.0]))
  line.set_linewidth(3.0)
  assert_eq(line.style.line_stroke().dash_sequence(), Some([6.0, 9.0]))
  assert_eq(line.unscaled_dash_pattern.dashes, Some([2.0, 3.0]))
  @config.set_lines_scale_dashes(false)
  line.mark_drawn()
  line.set_linewidth(3.0)
  assert_true(!line.stale())
  assert_eq(line.style.line_stroke().dash_sequence(), Some([2.0, 3.0]))
  line.set_linestyle("--")
  assert_true(line.stale())
  assert_eq(line.unscaled_dash_pattern.dashes, Some([9.0, 7.0]))
  assert_eq(line.style.line_stroke().dash_sequence(), Some([9.0, 7.0]))
  @config.set_lines_scale_dashes(true)
  line.mark_drawn()
  line.set_linewidth(3.0)
  assert_true(!line.stale())
  assert_eq(line.style.line_stroke().dash_sequence(), Some([27.0, 21.0]))
  assert_eq(first.line_stroke().dash_sequence(), Some([4.0, 6.0]))
}

///|
test "Line unscaled offset uses compensated source sum and keeps None versus empty" {
  let previous_pattern = @config.lines_dashed_pattern()
  let previous_scale = @config.lines_scale_dashes()
  defer {
    @config.set_lines_dashed_pattern(previous_pattern)
    @config.set_lines_scale_dashes(previous_scale)
  }
  @config.set_lines_scale_dashes(false)
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  @config.set_lines_dashed_pattern([1.0e16, -1.0, -1.0e16])
  line.set_linestyle("--")
  assert_eq(
    line.style.line_stroke().dash_offset().reinterpret_as_uint64(),
    0x8000000000000000UL,
  )
  assert_eq(
    line.unscaled_dash_pattern.offset.reinterpret_as_uint64(),
    0x8000000000000000UL,
  )
  @config.set_lines_dashed_pattern([1.0e16, 1.0, -1.0e16])
  line.set_linestyle("--")
  assert_eq(line.style.line_stroke().dash_offset().reinterpret_as_uint64(), 0UL)
  @config.set_lines_dashed_pattern([])
  line.set_linestyle("--")
  assert_eq(line.style.line_stroke().dash_sequence(), Some([]))
  line.set_linestyle("None")
  assert_true(line.style.line_stroke().dash_sequence() is None)
  @config.set_lines_dashed_pattern([0.0 / 0.0, 1.0])
  line.set_linestyle("--")
  assert_true(line.style.line_stroke().dash_offset().is_nan())
  @config.set_lines_dashed_pattern([-1.0 / 0.0, 1.0])
  line.set_linestyle("--")
  assert_eq(
    line.style.line_stroke().dash_offset().reinterpret_as_uint64(),
    0x8000000000000000UL,
  )
}

///|
test "Line linewidth IEEE values are multiplied into stored dash appearance without guards" {
  let previous_pattern = @config.lines_dashed_pattern()
  let previous_scale = @config.lines_scale_dashes()
  defer {
    @config.set_lines_dashed_pattern(previous_pattern)
    @config.set_lines_scale_dashes(previous_scale)
  }
  @config.set_lines_dashed_pattern([1.0, 0.0])
  @config.set_lines_scale_dashes(true)
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  line.set_linestyle("--")
  line.set_linewidth(-0.0)
  let negative = line.style.line_stroke().dash_sequence().unwrap()
  assert_eq(negative[0].reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_eq(negative[1].reinterpret_as_uint64(), 0x8000000000000000UL)
  line.mark_drawn()
  line.set_linewidth(0.0)
  assert_true(!line.stale())
  let positive = line.style.line_stroke().dash_sequence().unwrap()
  assert_eq(positive[0].reinterpret_as_uint64(), 0UL)
  assert_eq(positive[1].reinterpret_as_uint64(), 0UL)
  line.set_linewidth(1.0 / 0.0)
  let infinite = line.style.line_stroke().dash_sequence().unwrap()
  assert_eq(infinite[0], 1.0 / 0.0)
  assert_true(infinite[1].is_nan())
  assert_true(line.style.line_stroke().dash_offset().is_nan())
  line.set_linestyle("None")
  assert_true(line.style.line_stroke().dash_sequence() is None)
  assert_true(line.style.line_stroke().dash_offset().is_nan())
}

///|
test "Line stroke preserves appearance data and lifecycle state through other setters" {
  let axes = figure().axes()
  let line = axes.plot_line(Numeric([1.0, 2.0]), Numeric([10.0, 20.0]))
  axes.unstale_view()
  axes.set_xlim(0.5, 3.0)
  axes.set_ylim(5.0, 25.0)
  axes.x_axis().request_autoscale()
  line.set_color("C0")
  line.set_alpha(Some(0.25))
  line.set_visible(false)
  line.set_xdata(Numeric([3.0, 4.0, 5.0]))
  let cache = line.cache
  guard line.get_xdata() is Numeric(raw) else { fail("numeric originals") }
  let requests = [
    axes.x_axis().autoscale_stale(),
    axes.y_axis().autoscale_stale(),
  ]
  let automatic = [axes.x_axis().autoscale_on(), axes.y_axis().autoscale_on()]
  let view = axes.x_axis().stored_view_limits()
  let data = (axes.data_limits().lower(), axes.data_limits().upper())
  line.set_linestyle(":")
  let effective = line.style.line_stroke()
  line.set_color("red")
  assert_true(physical_equal(line.style.line_stroke(), effective))
  line.set_alpha(Some(0.5))
  assert_true(physical_equal(line.style.line_stroke(), effective))
  assert_eq(line.get_color(), "red")
  assert_eq(line.get_alpha(), Some(0.5))
  assert_true(line.source_color && !line.get_visible())
  assert_true(
    line.invalid_x && !line.invalid_y && physical_equal(line.cache, cache),
  )
  guard line.get_xdata() is Numeric(after) else { fail("numeric originals") }
  assert_true(physical_equal(raw, after))
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
  let current = axes.x_axis().stored_view_limits()
  assert_eq((current.lower(), current.upper()), (view.lower(), view.upper()))
  assert_eq((axes.data_limits().lower(), axes.data_limits().upper()), data)
  let cleared = axes.plot_line(Numeric([7.0]), Numeric([8.0]))
  line.remove()
  axes.clear()
  line.set_linestyle("None")
  cleared.set_linestyle("dashdot")
  assert_eq(line.get_linestyle(), "None")
  assert_eq(cleared.get_linestyle(), "-.")
  assert_true(line.owner is None && line.removal_parent is Some(_))
  assert_true(cleared.owner is None && cleared.removal_parent is None)
  assert_true(physical_equal(line.cache, cache) && line.invalid_x)
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
}
