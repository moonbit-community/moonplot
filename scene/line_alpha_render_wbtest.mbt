///|
fn line_alpha_render_fixture() -> (Figure, Axes) raise {
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
fn line_alpha_render_strokes(svg : String) -> Array[(String, String?, String)] {
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
      let opacity = match attributes.split_once("stroke-opacity=\"") {
        Some((_, remaining)) =>
          Some(remaining.split_once("\"").unwrap().0.to_owned())
        None => None
      }
      values.push((color.to_owned(), opacity, width.to_owned()))
    }
  }
  values
}

///|
test "source alpha overrides embedded color and transient Style does not multiply it again" {
  let (fig, axes) = line_alpha_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#123456",
  )
  let retained = fig.to_render_figure()
  let before = axes.artists()[0]
  line.set_color("#11223344")
  line.set_alpha(Some(0.25))
  line.set_linewidth(4.0)
  guard axes.artists()[0] is Artist::Line(_, raw) else {
    fail("expected raw Line Style")
  }
  assert_eq(raw.color(), "#11223344")
  assert_eq(raw.line_alpha(), Some(0.25))
  guard before is Artist::Line(_, initial) else {
    fail("expected immutable earlier snapshot")
  }
  assert_eq(initial.line_alpha(), None)
  let svg = @svg.render_with_positions_checked(retained).0
  assert_eq(line_alpha_render_strokes(svg), [("rgba(17,34,51,0.25)", None, "4")])
  assert_eq(line.get_alpha(), Some(0.25))
  assert_true(!line.stale())
  line.set_alpha(None)
  let reset = @svg.render_with_positions_checked(retained).0
  assert_eq(line_alpha_render_strokes(reset), [
    ("rgba(17,34,51,0.26666666666666666)", None, "4"),
  ])
  assert_eq(line.get_color(), "#11223344")
}

///|
test "none and cycle-selected none ignore alpha while transparent hex accepts the override" {
  let saved = @config.color_cycle()
  defer @config.set_color_cycle(saved)
  @config.set_color_cycle(["none", "#0000"])
  let (fig, axes) = line_alpha_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="black",
  )
  line.set_alpha(Some(0.25))
  line.set_color("none")
  let retained = fig.to_render_figure()
  assert_eq(
    line_alpha_render_strokes(@svg.render_with_positions_checked(retained).0),
    [("rgba(0,0,0,0)", None, "2")],
  )
  line.set_color("C0")
  assert_eq(
    line_alpha_render_strokes(@svg.render_with_positions_checked(retained).0),
    [("rgba(0,0,0,0)", None, "2")],
  )
  line.set_color("C1")
  assert_eq(
    line_alpha_render_strokes(@svg.render_with_positions_checked(retained).0),
    [("rgba(0,0,0,0.25)", None, "2")],
  )
  assert_eq(line.get_alpha(), Some(0.25))
  line.set_alpha(None)
  assert_eq(
    line_alpha_render_strokes(@svg.render_with_positions_checked(retained).0),
    [("rgba(0,0,0,0)", None, "2")],
  )
}

///|
test "earlier child changes legacy alpha in the retained frame and linewidth preserves raw alpha" {
  let (fig, axes) = line_alpha_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="red",
  )
  line.set_alpha(Some(0.5))
  line.set_linewidth(3.0)
  let child = axes.secondary_xaxis(value => value, value => value)
  child.set_ticks([0.5])
  let changed = [false]
  child.set_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      line.set_alpha(Some(0.75))
      changed[0] = true
      "alpha-child"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let svg = @svg.render_with_positions_checked(retained).0
  assert_true(changed[0])
  assert_eq(line_alpha_render_strokes(svg), [("red", Some("0.75"), "3")])
  assert_true(!line.source_color)
  assert_eq(line.get_alpha(), Some(0.75))
  assert_true(!line.stale())
}

///|
test "alpha zero keeps hidden empty data and deferred color stages distinct" {
  let (fig, axes) = line_alpha_render_fixture()
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  let token = StringBuilder()
  token.write_char('C')
  for _ in 0..<4301 {
    token.write_char('1')
  }
  line.set_color(token.to_string())
  line.set_alpha(Some(0.0))
  line.set_xdata(Numeric([0.0, 0.5, 1.0]))
  line.set_visible(false)
  let retained = fig.to_render_figure()
  assert_eq(
    line_alpha_render_strokes(@svg.render_with_positions_checked(retained).0),
    [],
  )
  assert_true(line.stale() && line.invalid_x)
  line.set_visible(true)
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("alpha zero must not skip data preparation")
  } noraise {
    _ => fail("expected pending data error at alpha zero")
  }
  line.set_xdata(Numeric([0.0, 1.0]))
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("value has 4301 digits"))
    _ => fail("alpha zero must not skip nonempty color resolution")
  } noraise {
    _ => fail("expected late source color error at alpha zero")
  }
  assert_true(line.stale() && !line.invalid_x)
  line.set_color("red")
  assert_eq(
    line_alpha_render_strokes(@svg.render_with_positions_checked(retained).0),
    [("rgba(255,0,0,0)", None, "2")],
  )
  assert_true(!line.stale())
  line.set_data(Numeric([]), Numeric([]))
  line.set_color(token.to_string())
  assert_eq(
    line_alpha_render_strokes(@svg.render_with_positions_checked(retained).0),
    [],
  )
  assert_true(!line.stale())
}

///|
test "old retained alpha and replacement alpha complete only their own detached or attached Line" {
  let (fig, axes) = line_alpha_render_fixture()
  let old = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="red",
  )
  let retained = fig.to_render_figure()
  old.remove()
  axes.clear_checked()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  let current = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([1.0, 0.0]),
    color="blue",
  )
  old.set_alpha(Some(0.25))
  current.set_alpha(Some(0.75))
  assert_eq(
    line_alpha_render_strokes(@svg.render_with_positions_checked(retained).0),
    [("red", Some("0.25"), "2")],
  )
  assert_true(!old.stale() && current.stale())
  assert_eq(line_alpha_render_strokes(fig.to_svg_checked()), [
    ("blue", Some("0.75"), "2"),
  ])
  assert_true(!current.stale())
  assert_eq(old.get_alpha(), Some(0.25))
  assert_eq(current.get_alpha(), Some(0.75))
}
