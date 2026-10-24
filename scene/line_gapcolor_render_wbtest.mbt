///|
fn line_gapcolor_render_fixture() -> (Figure, Axes) raise {
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
fn line_gapcolor_render_elements(svg : String) -> Array[String] {
  let values = []
  for index, element in svg.split("<polyline ").to_array() {
    if index > 0 && element.split_once("/>") is Some((attributes, _)) {
      values.push(attributes.to_owned())
    }
  }
  values
}

///|
fn line_gapcolor_render_attribute(element : String, name : String) -> String {
  let (_, remaining) = element.split_once(name + "=\"").unwrap()
  remaining.split_once("\"").unwrap().0.to_owned()
}

///|
test "gap and foreground draw the same stepped path with inverse scaled dashes and alpha override" {
  let saved_scale = @config.lines_scale_dashes()
  let saved_pattern = @config.lines_dashed_pattern()
  defer @config.set_lines_scale_dashes(saved_scale)
  defer @config.set_lines_dashed_pattern(saved_pattern)
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([1.0, 2.0, 3.0])
  let (fig, axes) = line_gapcolor_render_fixture()
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  line.set_drawstyle("steps-mid")
  line.set_linestyle("--")
  line.set_linewidth(2.0)
  line.set_color("#11223344")
  line.set_gapcolor(Some("#0000"))
  line.set_alpha(Some(0.25))
  let retained = fig.to_render_figure()
  let elements = line_gapcolor_render_elements(
    @svg.render_with_positions_checked(retained).0,
  )
  assert_eq(elements.length(), 2)
  assert_eq(
    line_gapcolor_render_attribute(elements[0], "stroke"),
    "rgba(0,0,0,0.25)",
  )
  assert_eq(
    line_gapcolor_render_attribute(elements[1], "stroke"),
    "rgba(17,34,51,0.25)",
  )
  assert_eq(
    line_gapcolor_render_attribute(elements[0], "stroke-dasharray"),
    "6,2,4",
  )
  assert_eq(
    line_gapcolor_render_attribute(elements[0], "stroke-dashoffset"),
    "6",
  )
  assert_eq(
    line_gapcolor_render_attribute(elements[1], "stroke-dasharray"),
    "2,4,6",
  )
  assert_eq(
    line_gapcolor_render_attribute(elements[1], "stroke-dashoffset"),
    "0",
  )
  for element in elements {
    assert_eq(
      line_gapcolor_render_attribute(element, "points"),
      "0,200 200,200 200,0 400,0",
    )
    assert_true(!element.contains("stroke-opacity="))
  }
  assert_eq(line.get_color(), "#11223344")
  assert_eq(line.get_gapcolor(), Some("#0000"))
  assert_eq(line.get_alpha(), Some(0.25))
  assert_true(!line.stale())
  line.set_linewidth(3.0)
  let wider = line_gapcolor_render_elements(
    @svg.render_with_positions_checked(retained).0,
  )
  assert_eq(
    line_gapcolor_render_attribute(wider[0], "stroke-dasharray"),
    "9,3,6",
  )
  assert_eq(line_gapcolor_render_attribute(wider[0], "stroke-dashoffset"), "9")
  assert_eq(
    line_gapcolor_render_attribute(wider[1], "stroke-dasharray"),
    "3,6,9",
  )
  assert_eq(line_gapcolor_render_attribute(wider[0], "stroke-width"), "3")
}

///|
test "gap and foreground cycle tokens resolve current global colors without consuming the local cursor" {
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["red", "blue"])
  let (fig, axes) = line_gapcolor_render_fixture()
  axes.set_color_cycle(["purple", "gold"])
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="black",
  )
  line.set_linestyle("--")
  line.set_color("C1")
  line.set_gapcolor(Some("C0"))
  let retained = fig.to_render_figure()
  let first = line_gapcolor_render_elements(
    @svg.render_with_positions_checked(retained).0,
  )
  assert_eq(line_gapcolor_render_attribute(first[0], "stroke"), "#ff0000")
  assert_eq(line_gapcolor_render_attribute(first[1], "stroke"), "#0000ff")
  @config.set_color_cycle(["none", "lime"])
  line.set_alpha(Some(0.5))
  let changed = line_gapcolor_render_elements(
    @svg.render_with_positions_checked(retained).0,
  )
  assert_eq(
    line_gapcolor_render_attribute(changed[0], "stroke"),
    "rgba(0,0,0,0)",
  )
  assert_eq(
    line_gapcolor_render_attribute(changed[1], "stroke"),
    "rgba(0,255,0,0.5)",
  )
  assert_eq(line.get_color(), "C1")
  assert_eq(line.get_gapcolor(), Some("C0"))
  let next = axes.plot_line(Numeric([0.0, 1.0]), Numeric([1.0, 0.0]))
  assert_eq(next.get_color(), "purple")
}

///|
test "empty inverse error keeps last scaling provenance and gap color errors happen even earlier" {
  let saved_scale = @config.lines_scale_dashes()
  let saved_pattern = @config.lines_dashed_pattern()
  defer @config.set_lines_scale_dashes(saved_scale)
  defer @config.set_lines_dashed_pattern(saved_pattern)
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([])
  let (fig, axes) = line_gapcolor_render_fixture()
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  line.set_linestyle("--")
  line.set_gapcolor(Some("red"))
  let retained = fig.to_render_figure()
  @config.set_lines_scale_dashes(false)
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "IndexError: list index out of range")
    _ =>
      fail("draw-live rc must not replace captured effective list provenance")
  } noraise {
    _ => fail("expected empty effective list inverse error")
  }
  line.set_linewidth(line.get_linewidth())
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "IndexError: tuple index out of range")
    _ => fail("same-width setter must refresh effective tuple provenance")
  } noraise {
    _ => fail("expected refreshed effective tuple inverse error")
  }
  let token = StringBuilder()
  token.write_char('C')
  for _ in 0..<4301 {
    token.write_char('1')
  }
  line.set_gapcolor(Some(token.to_string()))
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("value has 4301 digits"))
    _ => fail("gap RGBA must precede empty inverse indexing")
  } noraise {
    _ => fail("expected gap color error before tuple IndexError")
  }
  assert_true(line.stale())
}

///|
test "nonpositive width bypasses gap while hidden None and empty keep their separate data stages" {
  let (fig, axes) = line_gapcolor_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="red",
  )
  line.set_linestyle("--")
  let token = StringBuilder()
  token.write_char('C')
  for _ in 0..<4301 {
    token.write_char('1')
  }
  line.set_gapcolor(Some(token.to_string()))
  let retained = fig.to_render_figure()
  for width in [0.0, -2.0, 0.0 / 0.0] {
    line.set_linewidth(width)
    let elements = line_gapcolor_render_elements(
      @svg.render_with_positions_checked(retained).0,
    )
    assert_eq(elements.length(), 1)
    assert_eq(line_gapcolor_render_attribute(elements[0], "stroke"), "red")
    assert_true(!elements[0].contains("stroke-dash"))
    assert_true(!line.stale())
  }
  line.set_linewidth(2.0)
  line.set_linestyle("None")
  line.set_drawstyle("steps-mid")
  line.set_xdata(Numeric([0.0, 0.5, 1.0]))
  line.set_visible(false)
  assert_eq(
    line_gapcolor_render_elements(
      @svg.render_with_positions_checked(retained).0,
    ),
    [],
  )
  assert_true(line.invalid_x && line.stale())
  line.set_visible(true)
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("None stroke still prepares its pending data before skipping gap")
  } noraise {
    _ => fail("expected deferred data error")
  }
  line.set_data(Numeric([]), Numeric([]))
  line.set_linestyle("--")
  assert_eq(
    line_gapcolor_render_elements(
      @svg.render_with_positions_checked(retained).0,
    ),
    [],
  )
  assert_true(!line.stale())
  line.set_data(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  line.set_linestyle("None")
  assert_eq(
    line_gapcolor_render_elements(
      @svg.render_with_positions_checked(retained).0,
    ),
    [],
  )
  assert_eq(line.path_values_checked().length(), 8)
  assert_true(!line.stale())
}

///|
test "earlier child changes retained gap state and removed clear handles keep independent completion" {
  let (fig, axes) = line_gapcolor_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="red",
  )
  line.set_linestyle("--")
  guard axes.artists()[0] is Artist::Line(_, initial) else {
    fail("expected immutable Style")
  }
  let child = axes.secondary_xaxis(value => value, value => value)
  child.set_ticks([0.5])
  let change = [true]
  child.set_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      if change[0] {
        line.set_gapcolor(Some("blue"))
      }
      "gap-child"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let current = line_gapcolor_render_elements(
    @svg.render_with_positions_checked(retained).0,
  )
  assert_eq(current.length(), 2)
  assert_eq(line_gapcolor_render_attribute(current[0], "stroke"), "#0000ff")
  assert_eq(line_gapcolor_render_attribute(current[1], "stroke"), "red")
  assert_eq(initial.line_gapcolor(), None)
  change[0] = false
  line.remove()
  axes.clear_checked()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  let replacement = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([1.0, 0.0]),
    color="purple",
  )
  line.set_gapcolor(Some("lime"))
  let old = line_gapcolor_render_elements(
    @svg.render_with_positions_checked(retained).0,
  )
  assert_eq(old.length(), 2)
  assert_eq(line_gapcolor_render_attribute(old[0], "stroke"), "#00ff00")
  assert_true(!line.stale() && replacement.stale())
  let fresh = line_gapcolor_render_elements(fig.to_svg_checked())
  assert_eq(fresh.length(), 1)
  assert_eq(line_gapcolor_render_attribute(fresh[0], "stroke"), "purple")
  assert_true(!replacement.stale())
}
