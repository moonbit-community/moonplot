///|
fn line_style_render_fixture() -> (Figure, Axes) raise {
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
fn line_style_render_elements(svg : String) -> Array[String] {
  let elements = []
  for index, element in svg.split("<polyline ").to_array() {
    if index > 0 && element.split_once("/>") is Some((attributes, _)) {
      elements.push(attributes.to_owned())
    }
  }
  elements
}

///|
test "canonical String styles draw actual dash attributes and preserve color alpha and width" {
  let old_scale = @config.lines_scale_dashes()
  let old_dashed = @config.lines_dashed_pattern()
  let old_dashdot = @config.lines_dashdot_pattern()
  let old_dotted = @config.lines_dotted_pattern()
  defer @config.set_lines_scale_dashes(old_scale)
  defer @config.set_lines_dashed_pattern(old_dashed)
  defer @config.set_lines_dashdot_pattern(old_dashdot)
  defer @config.set_lines_dotted_pattern(old_dotted)
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let (fig, axes) = line_style_render_fixture()
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  line.set_linewidth(1.0)
  line.set_alpha(Some(0.25))
  line.set_color("#11223344")
  let retained = fig.to_render_figure()
  for
    (name, canonical, dashes) in [
      ("solid", "-", None),
      ("dashed", "--", Some("3.7,1.6")),
      ("dashdot", "-.", Some("6.4,1.6,1,1.6")),
      ("dotted", ":", Some("1,1.65")),
    ] {
    line.set_linestyle(name)
    let elements = line_style_render_elements(
      @svg.render_with_positions_checked(retained).0,
    )
    assert_eq(elements.length(), 1)
    assert_true(elements[0].contains("stroke=\"rgba(17,34,51,0.25)\""))
    assert_true(elements[0].contains("stroke-width=\"1\""))
    assert_true(!elements[0].contains("stroke-opacity="))
    match dashes {
      Some(value) => {
        assert_true(elements[0].contains("stroke-dasharray=\"" + value + "\""))
        assert_true(elements[0].contains("stroke-dashoffset=\"0\""))
      }
      None => assert_true(!elements[0].contains("stroke-dash"))
    }
    assert_eq(line.get_linestyle(), canonical)
    assert_eq(line.get_color(), "#11223344")
    assert_eq(line.get_alpha(), Some(0.25))
    assert_true(!line.stale())
  }
  line.set_linestyle("none")
  assert_eq(line.get_linestyle(), "None")
  assert_eq(
    line_style_render_elements(@svg.render_with_positions_checked(retained).0),
    [],
  )
  assert_true(!line.stale())
}

///|
test "no-style still recaches and participates in relim but skips late color and completes" {
  let (fig, axes) = line_style_render_fixture()
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  let token = StringBuilder()
  token.write_char('C')
  for _ in 0..<4301 {
    token.write_char('1')
  }
  line.set_color(token.to_string())
  line.set_linestyle("None")
  line.set_xdata(Numeric([0.0, 0.5, 1.0]))
  let retained = fig.to_render_figure()
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("no-style must prepare pending data before skipping the stroke")
  } noraise {
    _ => fail("expected no-style shape failure")
  }
  assert_true(line.invalid_x && line.stale())
  line.set_data(Numeric([2.0, 4.0]), Numeric([3.0, 5.0]))
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  axes.relim_checked(visible_only=true)
  assert_eq(axes.data_limits().lower(), 2.0)
  assert_eq(axes.data_limits().upper(), 4.0)
  assert_eq(axes.data_limits(horizontal=false).lower(), 3.0)
  assert_eq(axes.data_limits(horizontal=false).upper(), 5.0)
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
  assert_eq(
    line_style_render_elements(@svg.render_with_positions_checked(retained).0),
    [],
  )
  assert_true(!line.invalid_x && !line.invalid_y && !line.stale())
  line.set_linestyle("-")
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("value has 4301 digits"))
    _ => fail("restoring a stroke must restore deferred color resolution")
  } noraise {
    _ => fail("expected restored-stroke color error")
  }
  assert_true(line.stale())
}

///|
test "no-style category conversion discovers the missing converter before failing and later repairs" {
  let (fig, axes) = line_style_render_fixture()
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  line.set_linestyle("")
  line.set_ydata(Category(["b", "a"]))
  let retained = fig.to_render_figure()
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("Missing category information"))
    _ => fail("no-style must not skip category recache")
  } noraise {
    _ => fail("expected conversion-only missing-category error")
  }
  assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
  assert_true(axes.y_units() is None)
  assert_true(line.invalid_y && line.stale())
  axes.set_y_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["a", "b"]))),
  )
  assert_eq(line.y_values_checked().to_array(), [1.0, 0.0])
  assert_eq(
    line_style_render_elements(@svg.render_with_positions_checked(retained).0),
    [],
  )
  assert_true(!line.stale())
}

///|
test "same-width refresh updates retained dash appearance without stale or live pattern recapture" {
  let old_scale = @config.lines_scale_dashes()
  let old_pattern = @config.lines_dashed_pattern()
  defer @config.set_lines_scale_dashes(old_scale)
  defer @config.set_lines_dashed_pattern(old_pattern)
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.0, 1.0])
  let (fig, axes) = line_style_render_fixture()
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  line.set_linewidth(2.0)
  line.set_linestyle("--")
  let retained = fig.to_render_figure()
  guard axes.artists()[0] is Artist::Line(_, initial) else {
    fail("expected raw immutable Style")
  }
  assert_true(
    line_style_render_elements(@svg.render_with_positions_checked(retained).0)[0].contains(
      "stroke-dasharray=\"6,2\"",
    ),
  )
  @config.set_lines_dashed_pattern([9.0, 4.0])
  @config.set_lines_scale_dashes(false)
  assert_true(!line.stale())
  line.set_linewidth(2.0)
  assert_true(!line.stale())
  assert_true(
    line_style_render_elements(@svg.render_with_positions_checked(retained).0)[0].contains(
      "stroke-dasharray=\"3,1\"",
    ),
  )
  assert_eq(initial.line_stroke().dash_sequence(), Some([6.0, 2.0]))
  line.set_linestyle("--")
  assert_true(
    line_style_render_elements(@svg.render_with_positions_checked(retained).0)[0].contains(
      "stroke-dasharray=\"9,4\"",
    ),
  )
}

///|
test "source color errors precede late dash validation and nonpositive width bypasses only dashes" {
  let old_scale = @config.lines_scale_dashes()
  let old_pattern = @config.lines_dashed_pattern()
  defer @config.set_lines_scale_dashes(old_scale)
  defer @config.set_lines_dashed_pattern(old_pattern)
  @config.set_lines_scale_dashes(false)
  @config.set_lines_dashed_pattern([-1.0, 2.0])
  let (fig, axes) = line_style_render_fixture()
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  line.set_linestyle("--")
  let token = StringBuilder()
  token.write_char('C')
  for _ in 0..<4301 {
    token.write_char('1')
  }
  line.set_color(token.to_string())
  let retained = fig.to_render_figure()
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("value has 4301 digits"))
    _ => fail("nonempty source color resolves before GC dash validation")
  } noraise {
    _ => fail("expected source color failure before negative dash failure")
  }
  assert_true(line.stale())
  line.set_color("red")
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(
        message, "ValueError: All values in the dash list must be non-negative",
      )
    _ => fail("expected late native GC validation")
  } noraise {
    _ => fail("expected negative dash failure after color repair")
  }
  assert_true(line.stale())
  line.set_linewidth(0.0)
  let elements = line_style_render_elements(
    @svg.render_with_positions_checked(retained).0,
  )
  assert_eq(elements.length(), 1)
  assert_true(!elements[0].contains("stroke-dash"))
  assert_true(!line.stale())
}

///|
test "earlier child changes retained Line style and clear replacement keeps a separate stroke" {
  let old_scale = @config.lines_scale_dashes()
  let old_pattern = @config.lines_dashed_pattern()
  defer @config.set_lines_scale_dashes(old_scale)
  defer @config.set_lines_dashed_pattern(old_pattern)
  @config.set_lines_scale_dashes(false)
  @config.set_lines_dashed_pattern([4.0, 2.0])
  let (fig, axes) = line_style_render_fixture()
  let old = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="red",
  )
  let child = axes.secondary_xaxis(value => value, value => value)
  child.set_ticks([0.5])
  let change = [true]
  child.set_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      if change[0] {
        old.set_linestyle("dashed")
      }
      "style-child"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let first = line_style_render_elements(
    @svg.render_with_positions_checked(retained).0,
  )
  assert_true(first[0].contains("stroke-dasharray=\"4,2\""))
  change[0] = false
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
  old.set_linestyle("None")
  assert_eq(
    line_style_render_elements(@svg.render_with_positions_checked(retained).0),
    [],
  )
  assert_true(!old.stale() && current.stale())
  let fresh = line_style_render_elements(fig.to_svg_checked())
  assert_eq(fresh.length(), 1)
  assert_true(fresh[0].contains("stroke=\"blue\""))
  assert_true(!fresh[0].contains("stroke-dash"))
  assert_true(!current.stale())
}
