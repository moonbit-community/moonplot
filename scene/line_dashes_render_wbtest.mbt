///|
fn line_dashes_render_fixture() -> (Figure, Axes) raise {
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
fn line_dashes_render_elements(svg : String) -> Array[String] {
  let elements = []
  for index, element in svg.split("<polyline ").to_array() {
    if index > 0 && element.split_once("/>") is Some((attributes, _)) {
      elements.push(attributes.to_owned())
    }
  }
  elements
}

///|
fn line_dashes_render_attribute(element : String, name : String) -> String {
  let (_, after) = element.split_once(name + "=\"").unwrap()
  after.split_once("\"").unwrap().0.to_owned()
}

///|
test "custom tuple-profile dashes snapshot input and scale both strokes without recapturing rc templates" {
  let saved_scale = @config.lines_scale_dashes()
  let saved_pattern = @config.lines_dashed_pattern()
  defer @config.set_lines_scale_dashes(saved_scale)
  defer @config.set_lines_dashed_pattern(saved_pattern)
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([20.0, 10.0])
  let (fig, axes) = line_dashes_render_fixture()
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  line.set_drawstyle("steps-mid")
  line.set_color("red")
  line.set_gapcolor(Some("blue"))
  line.set_alpha(Some(0.5))
  line.set_linewidth(2.0)
  let incoming = [3.0, 1.0, 2.0]
  line.set_dashes(incoming)
  incoming[0] = 99.0
  incoming.push(7.0)
  guard axes.artists()[0] is Artist::Line(_, snapshot) else {
    fail("expected immutable appearance snapshot")
  }
  let retained = fig.to_render_figure()
  let initial = line_dashes_render_elements(
    @svg.render_with_positions_checked(retained).0,
  )
  assert_eq(initial.length(), 2)
  assert_eq(
    line_dashes_render_attribute(initial[0], "stroke-dasharray"),
    "4,6,2",
  )
  assert_eq(line_dashes_render_attribute(initial[0], "stroke-dashoffset"), "4")
  assert_eq(
    line_dashes_render_attribute(initial[1], "stroke-dasharray"),
    "6,2,4",
  )
  assert_eq(
    line_dashes_render_attribute(initial[0], "stroke"),
    "rgba(0,0,255,0.5)",
  )
  assert_eq(
    line_dashes_render_attribute(initial[1], "stroke"),
    "rgba(255,0,0,0.5)",
  )
  for element in initial {
    assert_eq(
      line_dashes_render_attribute(element, "points"),
      "0,200 200,200 200,0 400,0",
    )
  }
  assert_eq(line.xy_values_checked().length(), 4)
  assert_eq(line.get_linestyle(), "--")
  @config.set_lines_dashed_pattern([])
  line.set_linewidth(3.0)
  let wider = line_dashes_render_elements(
    @svg.render_with_positions_checked(retained).0,
  )
  assert_eq(line_dashes_render_attribute(wider[0], "stroke-dasharray"), "6,9,3")
  assert_eq(line_dashes_render_attribute(wider[0], "stroke-dashoffset"), "6")
  assert_eq(line_dashes_render_attribute(wider[1], "stroke-dasharray"), "9,3,6")
  @config.set_lines_scale_dashes(false)
  line.set_linewidth(3.0)
  assert_true(!line.stale())
  let unscaled = line_dashes_render_elements(
    @svg.render_with_positions_checked(retained).0,
  )
  assert_eq(
    line_dashes_render_attribute(unscaled[0], "stroke-dasharray"),
    "2,3,1",
  )
  assert_eq(line_dashes_render_attribute(unscaled[0], "stroke-dashoffset"), "2")
  assert_eq(
    line_dashes_render_attribute(unscaled[1], "stroke-dasharray"),
    "3,1,2",
  )
  assert_eq(snapshot.line_stroke().dash_sequence(), Some([6.0, 2.0, 4.0]))
  assert_eq(line.get_gapcolor(), Some("blue"))
  assert_eq(line.get_alpha(), Some(0.5))
}

///|
test "empty custom dash input restores a visible solid stroke and suppresses bad gap color" {
  let (fig, axes) = line_dashes_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="red",
  )
  line.set_drawstyle("steps-post")
  line.set_linestyle("None")
  let token = StringBuilder()
  token.write_char('C')
  for _ in 0..<4301 {
    token.write_char('1')
  }
  line.set_gapcolor(Some(token.to_string()))
  let path = line.path_values_checked()
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  line.set_dashes([])
  assert_eq(line.get_linestyle(), "-")
  assert_true(!line.is_dashed())
  assert_true(physical_equal(path, line.path_values_checked()))
  assert_true(
    !axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
  let elements = line_dashes_render_elements(fig.to_svg_checked())
  assert_eq(elements.length(), 1)
  assert_eq(line_dashes_render_attribute(elements[0], "stroke"), "red")
  assert_eq(
    line_dashes_render_attribute(elements[0], "points"),
    "0,200 400,200 400,0",
  )
  assert_true(!elements[0].contains("stroke-dash"))
  assert_true(!line.stale())
}

///|
test "custom negative dashes keep gap GC before foreground color and width zero bypasses dash validation" {
  let saved_scale = @config.lines_scale_dashes()
  defer @config.set_lines_scale_dashes(saved_scale)
  @config.set_lines_scale_dashes(false)
  let (fig, axes) = line_dashes_render_fixture()
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  let token = StringBuilder()
  token.write_char('C')
  for _ in 0..<4301 {
    token.write_char('1')
  }
  line.set_color(token.to_string())
  line.set_gapcolor(Some("blue"))
  line.set_dashes([-1.0, 2.0])
  let retained = fig.to_render_figure()
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(
        message, "ValueError: All values in the dash list must be non-negative",
      )
    _ => fail("custom inverse GC must precede delayed foreground resolution")
  } noraise {
    _ => fail("expected late custom gap GC error")
  }
  assert_true(line.stale())
  line.set_gapcolor(None)
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("value has 4301 digits"))
    _ => fail("without gap the existing color-before-GC stage remains")
  } noraise {
    _ => fail("expected foreground color error before custom GC")
  }
  line.set_color("red")
  line.set_linewidth(0.0)
  let elements = line_dashes_render_elements(
    @svg.render_with_positions_checked(retained).0,
  )
  assert_eq(elements.length(), 1)
  assert_true(!elements[0].contains("stroke-dash"))
  assert_true(!line.stale())
}

///|
test "earlier callback custom dashes reach retained IR while removed and clear handles preserve old snapshots" {
  let saved_scale = @config.lines_scale_dashes()
  defer @config.set_lines_scale_dashes(saved_scale)
  @config.set_lines_scale_dashes(false)
  let (fig, axes) = line_dashes_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="red",
  )
  line.set_gapcolor(Some("blue"))
  guard axes.artists()[0] is Artist::Line(_, before) else {
    fail("expected old solid snapshot")
  }
  let child = axes.secondary_xaxis(value => value, value => value)
  child.set_ticks([0.5])
  let change = [true]
  child.set_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      if change[0] {
        line.set_dashes([5.0, 1.0])
      }
      "custom-dash-child"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let frame = line_dashes_render_elements(
    @svg.render_with_positions_checked(retained).0,
  )
  assert_eq(frame.length(), 2)
  assert_eq(line_dashes_render_attribute(frame[0], "stroke-dasharray"), "1,5")
  assert_eq(line_dashes_render_attribute(frame[1], "stroke-dasharray"), "5,1")
  assert_eq(before.line_stroke().linestyle(), "-")
  assert_eq(before.line_stroke().dash_sequence(), None)
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
  line.set_dashes([])
  let old = line_dashes_render_elements(
    @svg.render_with_positions_checked(retained).0,
  )
  assert_eq(old.length(), 1)
  assert_eq(line_dashes_render_attribute(old[0], "stroke"), "red")
  assert_true(!old[0].contains("stroke-dash"))
  assert_true(!line.stale() && replacement.stale())
  let fresh = line_dashes_render_elements(fig.to_svg_checked())
  assert_eq(fresh.length(), 1)
  assert_eq(line_dashes_render_attribute(fresh[0], "stroke"), "purple")
  assert_true(!replacement.stale())
}
