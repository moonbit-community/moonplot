///|
fn line_drawstyle_render_fixture() -> (Figure, Axes) raise {
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
fn line_drawstyle_render_points(svg : String) -> Array[String] {
  let points = []
  for index, element in svg.split("<polyline ").to_array() {
    if index > 0 && element.split_once("/>") is Some((attributes, _)) {
      let (_, after) = attributes.split_once("points=\"").unwrap()
      points.push(after.split_once("\"").unwrap().0.to_owned())
    }
  }
  points
}

///|
test "five String drawstyles render expanded paths while queries retain the original sample count" {
  let (fig, axes) = line_drawstyle_render_fixture()
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  line.set_color("red")
  line.set_alpha(Some(0.5))
  line.set_linewidth(3.0)
  let retained = fig.to_render_figure()
  for
    (name, expected) in [
      ("default", "0,200 400,0"),
      ("steps-pre", "0,200 0,0 400,0"),
      ("steps-post", "0,200 400,200 400,0"),
      ("steps-mid", "0,200 200,200 200,0 400,0"),
      ("steps", "0,200 0,0 400,0"),
    ] {
    line.set_drawstyle(name)
    let svg = @svg.render_with_positions_checked(retained).0
    assert_eq(line_drawstyle_render_points(svg), [expected])
    assert_eq(line.get_drawstyle(), name)
    assert_eq(line.xy_values_checked().to_array(), [0.0, 0.0, 1.0, 1.0])
    assert_true(svg.contains("stroke=\"rgba(255,0,0,0.5)\""))
    assert_true(svg.contains("stroke-width=\"3\""))
    assert_true(!line.stale())
  }
  line.set_data(Numeric([0.25]), Numeric([0.75]))
  line.set_drawstyle("steps-mid")
  assert_eq(
    line_drawstyle_render_points(@svg.render_with_positions_checked(retained).0),
    ["100,50 100,50"],
  )
  assert_eq(line.xy_values_checked().length(), 2)
  assert_eq(line.path_values_checked().length(), 4)
}

///|
test "step midpoints expand in data coordinates before a nonlinear log transform" {
  let (fig, axes) = line_drawstyle_render_fixture()
  axes.set_x_limits(1.0, 100.0)
  axes.set_x_scale(@scale.log_scale())
  axes.x_axis().set_locator(@ticker.NullLocator::new().as_locator())
  axes.x_axis().set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let line = axes.plot_line(Numeric([1.0, 100.0]), Numeric([0.0, 1.0]))
  line.set_drawstyle("steps-mid")
  let svg = fig.to_svg_checked()
  assert_eq(line.path_values_checked().to_array(), [
    1.0, 0.0, 50.5, 0.0, 50.5, 1.0, 100.0, 1.0,
  ])
  let vertices = line_drawstyle_render_points(svg)[0].split(" ").to_array()
  assert_eq(vertices.length(), 4)
  assert_eq(vertices[0].to_owned(), "0,200")
  assert_eq(vertices[3].to_owned(), "400,0")
  let (middle, _) = vertices[1].split_once(",").unwrap()
  let x = @ticker.parse_float_text(middle.to_owned())
  // log10(50.5)/log10(100) is about .852, not screen-space midpoint .5.
  assert_true(x > 340.0 && x < 341.0)
}

///|
test "borrowed processed and path views retain different cached geometry until a lazy style recache" {
  let (fig, axes) = line_drawstyle_render_fixture()
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  let retained = fig.to_render_figure()
  ignore(@svg.render_with_positions_checked(retained))
  let default_xy = line.xy_values_checked()
  let default_path = line.path_values_checked()
  assert_true(physical_equal(default_xy, default_path))
  default_xy.set(2, 0.5)
  assert_eq(
    line_drawstyle_render_points(@svg.render_with_positions_checked(retained).0),
    ["0,200 200,0"],
  )
  assert_true(!line.stale())
  line.set_drawstyle("steps-mid")
  assert_true(line.invalid_x && !line.invalid_y && line.stale())
  ignore(@svg.render_with_positions_checked(retained))
  let xy = line.xy_values_checked()
  let path = line.path_values_checked()
  assert_true(!physical_equal(xy, path))
  xy.set(2, 0.25)
  assert_eq(
    line_drawstyle_render_points(@svg.render_with_positions_checked(retained).0),
    ["0,200 200,200 200,0 400,0"],
  )
  path.set(2, 0.75)
  line.set_drawstyle("steps-mid")
  assert_true(!line.stale() && !line.invalid_x && !line.invalid_y)
  assert_eq(
    line_drawstyle_render_points(@svg.render_with_positions_checked(retained).0),
    ["0,200 300,200 200,0 400,0"],
  )
  assert_eq(xy.get(2), 0.25)
  line.set_drawstyle("steps-post")
  assert_true(line.invalid_x && !line.invalid_y)
  assert_eq(
    line_drawstyle_render_points(@svg.render_with_positions_checked(retained).0),
    ["0,200 400,200 400,0"],
  )
  assert_eq(default_xy.to_array(), [0.0, 0.0, 0.5, 1.0])
  assert_eq(xy.get(2), 0.25)
  assert_eq(path.get(2), 0.75)
}

///|
test "hidden and None stroke preserve path data color and GC error stages" {
  let saved_scale = @config.lines_scale_dashes()
  let saved_pattern = @config.lines_dashed_pattern()
  defer @config.set_lines_scale_dashes(saved_scale)
  defer @config.set_lines_dashed_pattern(saved_pattern)
  @config.set_lines_scale_dashes(false)
  @config.set_lines_dashed_pattern([-1.0, 2.0])
  let (fig, axes) = line_drawstyle_render_fixture()
  let line = axes.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  let token = StringBuilder()
  token.write_char('C')
  for _ in 0..<4301 {
    token.write_char('1')
  }
  line.set_color(token.to_string())
  line.set_linestyle("None")
  line.set_drawstyle("steps-mid")
  line.set_xdata(Numeric([0.0, 0.5, 1.0]))
  line.set_visible(false)
  let retained = fig.to_render_figure()
  assert_eq(
    line_drawstyle_render_points(@svg.render_with_positions_checked(retained).0),
    [],
  )
  assert_true(line.invalid_x && line.stale())
  line.set_visible(true)
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("None stroke must still construct its pending step path")
  } noraise {
    _ => fail("expected pending data failure before no-stroke completion")
  }
  line.set_xdata(Numeric([0.0, 1.0]))
  assert_eq(
    line_drawstyle_render_points(@svg.render_with_positions_checked(retained).0),
    [],
  )
  assert_eq(line.path_values_checked().length(), 8)
  assert_true(!line.stale() && !line.invalid_x)
  line.set_linestyle("--")
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("value has 4301 digits"))
    _ => fail("path must be prepared before the color stage")
  } noraise {
    _ => fail("expected source color error")
  }
  line.set_color("red")
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(
        message, "ValueError: All values in the dash list must be non-negative",
      )
    _ => fail("expected GC validation only after step path and color")
  } noraise {
    _ => fail("expected late dash failure")
  }
  assert_true(line.stale() && !line.invalid_x && !line.invalid_y)
}

///|
test "category remap rebuilds the step path used by both relim and retained SVG" {
  let (fig, axes) = line_drawstyle_render_fixture()
  let line = axes.plot_line(
    Category(["a", "b", "a"]),
    Numeric([0.0, 0.5, 1.0]),
    color="red",
  )
  line.set_drawstyle("steps-mid")
  let retained = fig.to_render_figure()
  ignore(@svg.render_with_positions_checked(retained))
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  axes.set_x_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["b", "a"]))),
  )
  assert_eq(line.x_values_checked().to_array(), [1.0, 0.0, 1.0])
  assert_eq(line.path_values_checked().to_array(), [
    1.0, 0.0, 0.5, 0.0, 0.5, 0.5, 0.5, 0.5, 0.5, 1.0, 1.0, 1.0,
  ])
  // Complete original unit callback + relim observes [.5,1], not raw xy [0,1].
  assert_eq(
    (axes.data_limits().lower(), axes.data_limits().upper()),
    (0.5, 1.0),
  )
  assert_true(axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
  assert_eq(
    line_drawstyle_render_points(@svg.render_with_positions_checked(retained).0),
    ["400,200 200,200 200,100 200,100 200,0 400,0"],
  )
}

///|
test "forced Date units refresh rebuilds a borrowed stepped path without changing Date originals" {
  let (fig, axes) = line_drawstyle_render_fixture()
  let first = @date.RRuleDateTime::naive(@date.datetime(2024, 1, 1))
  let second = @date.RRuleDateTime::aware(
    @date.datetime(2024, 1, 2, offset_minutes=120),
  )
  let line = axes.plot_line(Date([first, second]), Numeric([0.0, 1.0]))
  let xs = line.x_values_checked().to_array()
  axes.set_x_limits(xs[0], xs[1])
  axes.x_axis().set_locator(@ticker.NullLocator::new().as_locator())
  axes.x_axis().set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  line.set_drawstyle("steps-mid")
  let retained = fig.to_render_figure()
  let initial = line_drawstyle_render_points(
    @svg.render_with_positions_checked(retained).0,
  )
  let old_path = line.path_values_checked()
  old_path.set(3, -1.0)
  assert_true(
    line_drawstyle_render_points(@svg.render_with_positions_checked(retained).0) !=
    initial,
  )
  axes.set_x_units(Some(@axis.AxisUnitTag::Date(@date.fixed_timezone(300))))
  assert_true(!physical_equal(old_path, line.path_values_checked()))
  assert_eq(line.x_values_checked().to_array(), xs)
  assert_eq(old_path.get(3), -1.0)
  assert_eq(
    line_drawstyle_render_points(@svg.render_with_positions_checked(retained).0),
    initial,
  )
  guard line.get_xdata() is Date(originals) else {
    fail("expected Date originals")
  }
  assert_true(originals[0].is_naive())
  assert_true(!originals[1].is_naive())
}

///|
test "earlier child changes retained drawstyle and a removed handle cannot complete the clear replacement" {
  let (fig, axes) = line_drawstyle_render_fixture()
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
        old.set_drawstyle("steps-post")
      }
      "drawstyle-child"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  assert_eq(
    line_drawstyle_render_points(@svg.render_with_positions_checked(retained).0),
    ["0,200 400,200 400,0"],
  )
  let old_path = old.path_values_checked()
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
  old.set_drawstyle("steps-pre")
  assert_eq(
    line_drawstyle_render_points(@svg.render_with_positions_checked(retained).0),
    ["0,200 0,0 400,0"],
  )
  assert_eq(old_path.to_array(), [0.0, 0.0, 1.0, 0.0, 1.0, 1.0])
  assert_true(!old.stale() && current.stale())
  assert_eq(line_drawstyle_render_points(fig.to_svg_checked()), ["0,0 400,200"])
  assert_true(!current.stale())
}
