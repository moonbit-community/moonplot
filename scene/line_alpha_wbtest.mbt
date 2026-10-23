///|
test "Line alpha equality is a complete no-op and retains the first zero sign" {
  assert_true(@core.style("red").line_alpha() is None)
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  assert_true(line.get_alpha() is None)
  let original = line.style
  line.mark_drawn()
  line.set_alpha(None)
  assert_true(physical_equal(line.style, original) && !line.stale())
  line.set_alpha(Some(0.5))
  assert_eq(line.get_alpha(), Some(0.5))
  assert_true(line.stale())
  let half = line.style
  line.mark_drawn()
  line.set_alpha(Some(0.5))
  assert_true(physical_equal(line.style, half) && !line.stale())
  line.set_alpha(Some(0.0))
  let positive = line.style
  line.mark_drawn()
  line.set_alpha(Some(-0.0))
  assert_true(physical_equal(line.style, positive) && !line.stale())
  assert_eq(line.get_alpha().unwrap().reinterpret_as_uint64(), 0UL)
  line.set_alpha(None)
  assert_true(line.get_alpha() is None && line.stale())
  line.set_alpha(Some(-0.0))
  let negative = line.style
  line.mark_drawn()
  line.set_alpha(Some(0.0))
  assert_true(physical_equal(line.style, negative) && !line.stale())
  assert_eq(
    line.get_alpha().unwrap().reinterpret_as_uint64(),
    0x8000000000000000UL,
  )
  line.set_visible(false)
  line.set_alpha(Some(0.0))
  assert_true(physical_equal(line.style, negative) && line.stale())
  line.set_alpha(Some(1UL.reinterpret_as_double()))
  assert_eq(line.get_alpha().unwrap().reinterpret_as_uint64(), 1UL)
  line.set_alpha(Some(0x3fefffffffffffffUL.reinterpret_as_double()))
  assert_eq(
    line.get_alpha().unwrap().reinterpret_as_uint64(),
    0x3fefffffffffffffUL,
  )
}

///|
test "Line alpha rejects the full invalid Double domain before any state change" {
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  line.set_color("#1234")
  line.set_alpha(Some(0.25))
  line.mark_drawn()
  let style = line.style
  let cache = line.cache
  let invalid = [
    (0.0 / 0.0, "nan"),
    (1.0 / 0.0, "inf"),
    (-1.0 / 0.0, "-inf"),
    (0x8000000000000001UL.reinterpret_as_double(), "-5e-324"),
    (0x3ff0000000000001UL.reinterpret_as_double(), "1.0000000000000002"),
  ]
  for (value, text) in invalid {
    assert_true(
      try {
        line.set_alpha(Some(value))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "ValueError: alpha (" + text + ") is outside 0-1 range"
        _ => false
      },
    )
    assert_true(physical_equal(line.style, style) && !line.stale())
    assert_true(physical_equal(line.cache, cache))
    assert_true(line.source_color && !line.invalid_x && !line.invalid_y)
    assert_eq(line.get_alpha(), Some(0.25))
  }
  line.set_visible(false)
  assert_true(
    try {
      line.set_alpha(Some(1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(line.stale() && !line.get_visible())
  assert_true(physical_equal(line.style, style))
}

///|
test "Line alpha preserves all appearance fields and color-width edits retain it" {
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  line.set_color("C0")
  // Only whitebox appearance setup, not an additional public Artist style API.
  line.style = @core.style(
    "C0",
    width=-0.0,
    radius=7.0,
    fill="gold",
    font_size=19.0,
    marker="x",
    line_alpha=Some(0.25),
  )
  line.set_alpha(Some(0.75))
  assert_eq(line.get_color(), "C0")
  assert_true(line.source_color)
  assert_eq(line.get_linewidth().reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_eq(line.style.radius(), 7.0)
  assert_eq(line.style.fill(), "gold")
  assert_eq(line.style.font_size(), 19.0)
  assert_eq(line.style.marker(), "x")
  line.set_color("RED")
  assert_eq(line.get_alpha(), Some(0.75))
  line.set_linewidth(-1.0 / 0.0)
  assert_eq(line.get_alpha(), Some(0.75))
  assert_eq(line.get_color(), "RED")
  line.set_alpha(None)
  assert_true(line.get_alpha() is None && line.source_color)
  assert_eq(line.get_linewidth(), -1.0 / 0.0)
}

///|
test "Line RGBA alpha overrides embedded values and distinguishes none from zero hex" {
  let previous = @config.color_cycle()
  defer @config.set_color_cycle(previous)
  @config.set_color_cycle(["#11223344", "none"])
  let embedded = line_color_rgba("#11223344")
  assert_eq(embedded.alpha(), 68.0 / 255.0)
  let overridden = line_color_rgba("#11223344", alpha=Some(0.25))
  assert_eq(
    (
      overridden.red(),
      overridden.green(),
      overridden.blue(),
      overridden.alpha(),
    ),
    (17.0 / 255.0, 34.0 / 255.0, 51.0 / 255.0, 0.25),
  )
  assert_eq(line_color_rgba("#1234", alpha=Some(0.25)).alpha(), 0.25)
  assert_eq(line_color_rgba("#0000", alpha=Some(0.25)).alpha(), 0.25)
  assert_eq(line_color_rgba("none", alpha=Some(0.25)).alpha(), 0.0)
  assert_eq(line_color_rgba("C1", alpha=Some(0.25)).alpha(), 0.0)
  assert_eq(line_color_rgba("C0", alpha=Some(0.25)).alpha(), 0.25)
  assert_eq(line_color_rgba("0.5", alpha=Some(0.25)).alpha(), 0.25)
  // Portable current-override sign, not a claim about native private cache order.
  ignore(line_color_rgba("red", alpha=Some(0.0)))
  assert_eq(
    line_color_rgba("red", alpha=Some(-0.0)).alpha().reinterpret_as_uint64(),
    0x8000000000000000UL,
  )
  assert_eq(
    line_color_rgba("red", alpha=Some(0.0)).alpha().reinterpret_as_uint64(),
    0UL,
  )
}

///|
test "Line RGBA alpha range checks follow cycle selection and precede none" {
  let previous = @config.color_cycle()
  defer @config.set_color_cycle(previous)
  @config.set_color_cycle(["none"])
  let inner = "ValueError: 'alpha' must be between 0 and 1, inclusive"
  for color in ["none", "bad", "C0"] {
    assert_true(
      try {
        ignore(line_color_rgba(color, alpha=Some(0.0 / 0.0)))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) => message == inner
        _ => false
      },
    )
  }
  assert_true(
    try {
      ignore(line_color_rgba("C" + "9".repeat(4301), alpha=Some(0.0 / 0.0)))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: Exceeds the limit (4300 digits) for integer string conversion: value has 4301 digits; use sys.set_int_max_str_digits() to increase the limit"
      _ => false
    },
  )
}

///|
test "Line alpha does not process hidden pending data or change axes ownership and requests" {
  let axes = figure().axes()
  let line = axes.plot_line(Numeric([1.0, 2.0]), Numeric([10.0, 20.0]))
  axes.unstale_view()
  axes.set_xlim(0.5, 3.0)
  axes.set_ylim(5.0, 25.0)
  axes.x_axis().request_autoscale()
  line.set_visible(false)
  line.set_xdata(Numeric([3.0, 4.0, 5.0]))
  let cache = line.cache
  guard line.get_xdata() is Numeric(raw_x) else { fail("numeric originals") }
  let view = axes.x_axis().stored_view_limits()
  let data = (axes.data_limits().lower(), axes.data_limits().upper())
  let requests = [
    axes.x_axis().autoscale_stale(),
    axes.y_axis().autoscale_stale(),
  ]
  let automatic = [axes.x_axis().autoscale_on(), axes.y_axis().autoscale_on()]
  line.set_alpha(Some(0.0))
  assert_true(line.invalid_x && !line.invalid_y && !line.get_visible())
  assert_true(physical_equal(line.cache, cache))
  guard line.get_xdata() is Numeric(after_x) else { fail("numeric originals") }
  assert_true(physical_equal(raw_x, after_x))
  assert_true(physical_equal(line.owner.unwrap().state, axes.state))
  assert_true(physical_equal(line.removal_parent.unwrap().state, axes.state))
  let current = axes.x_axis().stored_view_limits()
  assert_eq((current.lower(), current.upper()), (view.lower(), view.upper()))
  assert_eq((axes.data_limits().lower(), axes.data_limits().upper()), data)
  assert_eq(
    [axes.x_axis().autoscale_stale(), axes.y_axis().autoscale_stale()],
    requests,
  )
  assert_eq(
    [axes.x_axis().autoscale_on(), axes.y_axis().autoscale_on()],
    automatic,
  )
  let cleared = axes.plot_line(Numeric([7.0]), Numeric([8.0]))
  line.remove()
  axes.clear()
  line.set_alpha(None)
  line.set_alpha(Some(0.25))
  assert_true(line.owner is None && line.removal_parent is Some(_))
  assert_true(line.invalid_x && physical_equal(line.cache, cache))
  assert_eq(line.get_alpha(), Some(0.25))
  cleared.set_alpha(Some(0.5))
  assert_true(cleared.owner is None && cleared.removal_parent is None)
  assert_eq(cleared.get_alpha(), Some(0.5))
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
