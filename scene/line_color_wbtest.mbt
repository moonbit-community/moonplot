///|
test "Line color stores raw source spelling and marks even equal assignments stale" {
  let line = figure().plot_line(
    Numeric([1.0]),
    Numeric([2.0]),
    color="transparent",
  )
  assert_eq(line.get_color(), "transparent")
  assert_true(!line.source_color)
  // Controlled nondefault Style tests independent appearance preservation.
  line.style = @core.style(
    "transparent",
    width=-0.0,
    radius=7.0,
    fill="gold",
    font_size=19.0,
    marker="x",
  )
  line.set_color("RED")
  assert_eq(line.get_color(), "RED")
  assert_true(line.source_color && line.stale())
  line.mark_drawn()
  line.set_color("RED")
  assert_true(line.stale())
  line.set_color(" 0.5 ")
  assert_eq(line.get_color(), " 0.5 ")
  assert_eq(line.style.width().reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_eq(line.style.radius(), 7.0)
  assert_eq(line.style.fill(), "gold")
  assert_eq(line.style.font_size(), 19.0)
  assert_eq(line.style.marker(), "x")
  line.set_linewidth(4.0)
  assert_eq(line.get_color(), " 0.5 ")
  assert_true(line.source_color)
}

///|
test "Line color validation failure preserves exact Style mode and stale state" {
  let line = figure().plot_line(
    Numeric([1.0]),
    Numeric([2.0]),
    color="transparent",
  )
  let old_style = line.style
  line.mark_drawn()
  let expected = "ValueError: 'R' is not a valid value for color: supported inputs are " +
    "(r, g, b) and (r, g, b, a) 0-1 float tuples; " +
    "'#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; " +
    "string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings " +
    "for colors of the color cycle; and pairs combining one of the above with an alpha value"
  assert_true(
    try {
      line.set_color("R")
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == expected
      _ => false
    },
  )
  assert_true(physical_equal(line.style, old_style))
  assert_true(!line.source_color && !line.stale())
  line.set_color("blue")
  line.mark_drawn()
  let source_style = line.style
  for
    invalid in [
      "", "transparent", " red ", "#12", "#ggg", "C٠", "C0\n", "nan", "inf",
    ] {
    assert_true(
      try {
        line.set_color(invalid)
        false
      } catch {
        @core.DataError::InvalidTicks(..) => true
        _ => false
      },
    )
    assert_true(physical_equal(line.style, source_style))
    assert_true(line.source_color && !line.stale())
  }
  line.set_visible(false)
  assert_true(
    try {
      line.set_color("R")
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(line.stale() && line.source_color && !line.get_visible())
}

///|
test "Line color source grammar retains native channels and Unicode name behavior" {
  let short_green = line_color_rgba("g")
  let css_green = line_color_rgba("green")
  assert_eq(short_green.green(), 0.5)
  assert_eq(css_green.green(), 128.0 / 255.0)
  let rgba = line_color_rgba("#F0A8")
  assert_eq(
    (rgba.red(), rgba.green(), rgba.blue(), rgba.alpha()),
    (1.0, 0.0, 10.0 / 15.0, 8.0 / 15.0),
  )
  let gray = line_color_rgba("\u{2003}０_０.５\u{a0}")
  assert_eq(
    (gray.red(), gray.green(), gray.blue(), gray.alpha()),
    (0.5, 0.5, 0.5, 1.0),
  )
  let zero = line_color_rgba("-0.0")
  assert_eq(zero.red().reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_eq(zero.green().reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_eq(zero.blue().reinterpret_as_uint64(), 0x8000000000000000UL)
  let none = line_color_rgba("NoNe")
  assert_eq(
    (none.red(), none.green(), none.blue(), none.alpha()),
    (0.0, 0.0, 0.0, 0.0),
  )
  // Native lower()'s only non-ASCII-to-ASCII character matters in full names;
  // single-character lookup does not retry lower(), even for Kelvin sign.
  let pink = line_color_rgba("PINK")
  assert_eq(
    (pink.red(), pink.green(), pink.blue()),
    (1.0, 192.0 / 255.0, 203.0 / 255.0),
  )
  assert_true(
    try {
      line_color_validate("K")
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Line color cycle lookup is live modulo parsing without consuming an axes cycle" {
  let previous = @config.color_cycle()
  defer @config.set_color_cycle(previous)
  @config.set_color_cycle(["#112233", "#abcdef", "red"])
  let axes = figure().axes()
  let line = axes.plot_line(Numeric([1.0]), Numeric([2.0]))
  let cursor = axes.state.val.color_cycle_index
  line.set_color("C0002")
  assert_eq(line.get_color(), "C0002")
  let first = line_color_rgba(line.get_color())
  assert_eq((first.red(), first.green(), first.blue()), (1.0, 0.0, 0.0))
  @config.set_color_cycle(["#00ff00", "blue", "#ffffff"])
  let second = line_color_rgba(line.get_color())
  assert_eq((second.red(), second.green(), second.blue()), (1.0, 1.0, 1.0))
  line.set_color("C" + "9".repeat(4300))
  let large = line_color_rgba(line.get_color())
  assert_eq((large.red(), large.green(), large.blue()), (0.0, 1.0, 0.0))
  assert_eq(axes.state.val.color_cycle_index, cursor)
  // A selected entry is converted by _to_rgba_no_colorcycle, not recursively.
  @config.set_color_cycle(["C1", "red"])
  line.set_color("C0")
  assert_true(
    try {
      ignore(line_color_rgba(line.get_color()))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: Invalid RGBA argument: 'C1'"
      _ => false
    },
  )
  assert_eq(axes.state.val.color_cycle_index, cursor)
}

///|
test "Line color long cycle index commits before its delayed native digit-limit error" {
  let line = figure().plot_line(Numeric([1.0]), Numeric([2.0]))
  let expected = "ValueError: Exceeds the limit (4300 digits) for integer string conversion: value has 4301 digits; use sys.set_int_max_str_digits() to increase the limit"
  for digit in ["9", "0"] {
    let raw = "C" + digit.repeat(4301)
    line.mark_drawn()
    line.set_color(raw)
    assert_true(line.stale() && line.source_color)
    assert_eq(line.get_color(), raw)
    let style = line.style
    assert_true(
      try {
        ignore(line_color_rgba(raw))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) => message == expected
        _ => false
      },
    )
    assert_true(physical_equal(line.style, style))
  }
}

///|
test "Line color editing leaves pending data hidden ownership and limits untouched" {
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
  line.set_color("C0")
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
  let cleared_cache = cleared.cache
  line.remove()
  axes.clear()
  line.set_color("#1234")
  assert_eq(line.get_color(), "#1234")
  assert_true(line.owner is None)
  assert_true(line.removal_parent is Some(_))
  assert_true(line.source_color && line.invalid_x)
  assert_true(physical_equal(line.cache, cache))
  cleared.set_color("C0001")
  assert_eq(cleared.get_color(), "C0001")
  assert_true(cleared.owner is None)
  assert_true(cleared.removal_parent is None)
  assert_true(cleared.source_color && cleared.stale())
  assert_true(physical_equal(cleared.cache, cleared_cache))
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
