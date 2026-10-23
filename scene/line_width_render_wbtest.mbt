///|
fn line_width_render_fixture() -> (Figure, Axes) raise {
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
fn line_width_render_widths(svg : String, color : String) -> Array[String] {
  let values = []
  for index, element in svg.split("<polyline ").to_array() {
    if index == 0 {
      continue
    }
    if element.split_once("/>") is Some((attributes, _)) &&
      attributes.contains("stroke=\"" + color + "\"") {
      let (_, remaining) = attributes.split_once("stroke-width=\"").unwrap()
      let (value, _) = remaining.split_once("\"").unwrap()
      values.push(value.to_owned())
    }
  }
  values
}

///|
test "retained IR draws the Line's current width rather than the exported immutable style" {
  let (fig, axes) = line_width_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#12365a",
  )
  let original = line.xy_values_checked()
  let retained = fig.to_render_figure()
  guard retained.panels()[0].artists()[0]
    is @render.Artist::Line(_, initial_style) else {
    fail("expected initial static Line transport")
  }
  assert_eq(initial_style.width(), 2.0)
  line.set_linewidth(3.25)
  assert_eq(line.get_linewidth(), 3.25)
  assert_true(line.stale())
  let svg = @svg.render_with_positions_checked(retained).0
  assert_eq(line_width_render_widths(svg, "#12365a"), ["3.25"])
  assert_eq(initial_style.width(), 2.0)
  assert_eq(original.to_array(), [0.0, 0.0, 1.0, 1.0])
  assert_true(!line.stale())
  line.set_linewidth(4.5)
  let next = @svg.render_with_positions_checked(retained).0
  assert_eq(line_width_render_widths(next, "#12365a"), ["4.5"])
  assert_true(!line.stale())
}

///|
test "an earlier child callback changes retained IR stroke width in the same frame" {
  let (fig, axes) = line_width_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#23476b",
  )
  let child = axes.secondary_xaxis(value => value, value => value)
  child.set_ticks([0.5])
  let changed = [false]
  child.set_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      line.set_linewidth(7.5)
      changed[0] = true
      "width-child"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let svg = @svg.render_with_positions_checked(retained).0
  assert_true(changed[0])
  assert_eq(line_width_render_widths(svg, "#23476b"), ["7.5"])
  assert_true(svg.contains("points=\"0,200 400,0\""))
  assert_true(!line.stale())
}

///|
test "hidden changed width does not recache invalid data or complete until visible repair" {
  let (fig, axes) = line_width_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#34587c",
  )
  let previous = line.xy_values_checked()
  line.set_xdata(Numeric([0.0, 0.5, 1.0]))
  line.set_visible(false)
  line.set_linewidth(6.5)
  let retained = fig.to_render_figure()
  let hidden = @svg.render_with_positions_checked(retained).0
  assert_eq(line_width_render_widths(hidden, "#34587c"), [])
  assert_true(line.invalid_x && line.stale())
  assert_eq(previous.to_array(), [0.0, 0.0, 1.0, 1.0])
  line.set_visible(true)
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ =>
      fail(
        "expected deferred data error before returning a visible prepared style",
      )
  } noraise {
    _ => fail("expected shown Line data error")
  }
  assert_true(line.stale())
  line.set_xdata(Numeric([0.0, 1.0]))
  let repaired = @svg.render_with_positions_checked(retained).0
  assert_eq(line_width_render_widths(repaired, "#34587c"), ["6.5"])
  assert_true(!line.stale())
}

///|
test "removed and cleared Line width remains attached to the old retained draw handle" {
  let (fig, axes) = line_width_render_fixture()
  let old = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#45698d",
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
    color="#567a9e",
  )
  old.set_linewidth(9.0)
  current.set_linewidth(5.0)
  let old_frame = @svg.render_with_positions_checked(retained).0
  assert_eq(line_width_render_widths(old_frame, "#45698d"), ["9"])
  assert_eq(line_width_render_widths(old_frame, "#567a9e"), [])
  assert_true(!old.stale() && current.stale())
  let fresh = fig.to_svg_checked()
  assert_eq(line_width_render_widths(fresh, "#45698d"), [])
  assert_eq(line_width_render_widths(fresh, "#567a9e"), ["5"])
  assert_true(!current.stale())
}
