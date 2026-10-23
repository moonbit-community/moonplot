///|
fn line_color_render_fixture() -> (Figure, Axes) raise {
  let fig = figure(width=400, height=200)
  let axes = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (fig, axes)
}

///|
fn line_color_render_strokes(svg : String) -> Array[(String, String)] {
  let values = []
  for index, element in svg.split("<polyline ").to_array() {
    if index == 0 {
      continue
    }
    if element.split_once("/>") is Some((attributes, _)) {
      let (_, after_color) = attributes.split_once("stroke=\"").unwrap()
      let (color, _) = after_color.split_once("\"").unwrap()
      let (_, after_width) = attributes.split_once("stroke-width=\"").unwrap()
      let (width, _) = after_width.split_once("\"").unwrap()
      values.push((color.to_owned(), width.to_owned()))
    }
  }
  values
}

///|
test "legacy CSS remains raw until an explicit valid source color changes retained drawing" {
  let (fig, axes) = line_color_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="transparent",
  )
  let retained = fig.to_render_figure()
  let initial = axes.artists()[0]
  assert_eq(
    line_color_render_strokes(@svg.render_with_positions_checked(retained).0),
    [("transparent", "2")],
  )
  assert_true(!line.stale() && !line.source_color)
  try line.set_color("transparent") catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(
        message.contains("'transparent' is not a valid value for color"),
      )
    _ =>
      fail(
        "expected explicit native String validation to reject legacy transparent",
      )
  } noraise {
    _ => fail("expected source color validation error")
  }
  assert_eq(line.get_color(), "transparent")
  assert_true(!line.stale() && !line.source_color)
  line.set_linewidth(5.5)
  line.set_color("red")
  assert_eq(line.get_color(), "red")
  guard axes.artists()[0] is Artist::Line(_, raw_style) else {
    fail("expected raw current snapshot")
  }
  assert_eq(raw_style.color(), "red")
  guard initial is Artist::Line(_, old_style) else {
    fail("expected old snapshot")
  }
  assert_eq(old_style.color(), "transparent")
  assert_eq(
    line_color_render_strokes(@svg.render_with_positions_checked(retained).0),
    [("#ff0000", "5.5")],
  )
  assert_eq(line.get_color(), "red")
  assert_true(!line.stale())
}

///|
test "retained C color reads live global rc without consuming the independent local axes cycle" {
  let saved = @config.color_cycle()
  defer @config.set_color_cycle(saved)
  @config.set_color_cycle(["#112233", "#445566"])
  let (fig, axes) = line_color_render_fixture()
  axes.set_color_cycle(["#abc123", "#def456"])
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  assert_eq(line.get_color(), "#abc123")
  assert_eq(axes.state.val.color_cycle_index, 1)
  line.set_color("C0")
  let retained = fig.to_render_figure()
  assert_eq(
    line_color_render_strokes(@svg.render_with_positions_checked(retained).0),
    [("#112233", "2")],
  )
  @config.set_color_cycle(["#00ff00", "#ff0000"])
  assert_eq(
    line_color_render_strokes(@svg.render_with_positions_checked(retained).0),
    [("#00ff00", "2")],
  )
  assert_eq(line.get_color(), "C0")
  assert_eq(axes.state.val.color_cycle_index, 1)
  let next = axes.plot_line(Numeric([0.0, 1.0]), Numeric([1.0, 0.0]))
  assert_eq(next.get_color(), "#def456")
  assert_eq(axes.state.val.color_cycle_index, 2)
}

///|
test "earlier child callback changes same-frame source color while preserving current width" {
  let (fig, axes) = line_color_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#123456",
  )
  line.set_linewidth(4.25)
  let child = axes.secondary_xaxis(value => value, value => value)
  child.set_ticks([0.5])
  let changed = [false]
  child.set_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      line.set_color("tab:blue")
      changed[0] = true
      "source-color-child"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let svg = @svg.render_with_positions_checked(retained).0
  assert_true(changed[0])
  assert_eq(line_color_render_strokes(svg), [("#1f77b4", "4.25")])
  assert_eq(line.get_color(), "tab:blue")
  assert_true(!line.stale())
}

///|
test "hidden long C token resolves only after visible data preparation and failed color does not complete" {
  let (fig, axes) = line_color_render_fixture()
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  let token = StringBuilder()
  token.write_char('C')
  for _ in 0..<4301 {
    token.write_char('1')
  }
  line.set_color(token.to_string())
  line.set_xdata(Numeric([0.0, 0.5, 1.0]))
  line.set_visible(false)
  let retained = fig.to_render_figure()
  assert_eq(
    line_color_render_strokes(@svg.render_with_positions_checked(retained).0),
    [],
  )
  assert_true(line.invalid_x && line.stale())
  line.set_visible(true)
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("expected data preparation to precede drawing color resolution")
  } noraise {
    _ => fail("expected pending shape error first")
  }
  line.set_xdata(Numeric([0.0, 1.0]))
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(
        message, "ValueError: Exceeds the limit (4300 digits) for integer string conversion: value has 4301 digits; use sys.set_int_max_str_digits() to increase the limit",
      )
    _ => fail("expected original delayed C-index digit-limit error")
  } noraise {
    _ => fail("expected late source color error")
  }
  assert_true(!line.invalid_x && !line.invalid_y)
  assert_true(line.stale())
  line.set_color("0.5")
  assert_eq(
    line_color_render_strokes(@svg.render_with_positions_checked(retained).0),
    [("#808080", "2")],
  )
  assert_eq(line.get_color(), "0.5")
  assert_true(!line.stale())
}

///|
test "removed source-color handle remains independent from clear replacement colors and completion" {
  let (fig, axes) = line_color_render_fixture()
  let old = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  let retained = fig.to_render_figure()
  old.remove()
  axes.clear_checked()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  let current = axes.plot_line(Numeric([0.0, 1.0]), Numeric([1.0, 0.0]))
  old.set_color("red")
  current.set_color("blue")
  assert_eq(
    line_color_render_strokes(@svg.render_with_positions_checked(retained).0),
    [("#ff0000", "2")],
  )
  assert_true(!old.stale() && current.stale())
  assert_eq(line_color_render_strokes(fig.to_svg_checked()), [("#0000ff", "2")])
  assert_true(!current.stale())
  assert_eq(old.get_color(), "red")
  assert_eq(current.get_color(), "blue")
}

///|
test "empty visible source color completes without resolution but nonempty nonfinite data still resolves" {
  let (fig, axes) = line_color_render_fixture()
  let line = axes.plot_line(Numeric([]), Numeric([]))
  let token = StringBuilder()
  token.write_char('C')
  for _ in 0..<4301 {
    token.write_char('1')
  }
  line.set_color(token.to_string())
  let retained = fig.to_render_figure()
  assert_eq(
    line_color_render_strokes(@svg.render_with_positions_checked(retained).0),
    [],
  )
  assert_true(!line.stale())
  line.set_data(Numeric([0.0 / 0.0]), Numeric([0.0]))
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("value has 4301 digits"))
    _ => fail("nonempty nonfinite path still reaches source color resolution")
  } noraise {
    _ => fail("expected nonempty source color failure")
  }
  assert_true(!line.invalid_x && !line.invalid_y && line.stale())
  line.set_data(Numeric([]), Numeric([]))
  assert_eq(
    line_color_render_strokes(@svg.render_with_positions_checked(retained).0),
    [],
  )
  assert_true(!line.stale())
}
