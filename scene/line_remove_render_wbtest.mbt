///|
fn line_remove_render_fixture() -> (Figure, Axes) raise {
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
fn line_remove_render_polyline_count(svg : String, color : String) -> Int32 {
  let mut count = 0
  for index, element in svg.split("<polyline ").to_array() {
    if index == 0 {
      continue
    }
    if element.split_once("/>") is Some((attributes, _)) &&
      attributes.contains("stroke=\"" + color + "\"") {
      count += 1
    }
  }
  count
}

///|
test "removed Line disappears from fresh IR while retained IR keeps its own lazy handle" {
  let (fig, axes) = line_remove_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#102938",
  )
  let retained = fig.to_render_figure()
  line.remove()
  assert_eq(axes.artists().length(), 0)
  assert_eq(axes.state.val.line_originals.length(), 0)
  line.set_ydata(Numeric([0.5, 0.5]))
  let fresh = fig.to_svg_checked()
  assert_eq(line_remove_render_polyline_count(fresh, "#102938"), 0)
  assert_true(line.stale())
  let (old_frame, _) = @svg.render_with_positions_checked(retained)
  assert_eq(line_remove_render_polyline_count(old_frame, "#102938"), 1)
  assert_true(old_frame.contains("points=\"0,100 400,100\""))
  assert_true(!line.stale())
  assert_true(line.owner is None)
  assert_eq(axes.artists().length(), 0)
}

///|
test "remove then clear cannot redirect an old retained completion to a replacement Line" {
  let (fig, axes) = line_remove_render_fixture()
  let old = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#203948",
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
    color="#304958",
  )
  old.set_ydata(Numeric([0.25, 0.25]))
  let (old_frame, _) = @svg.render_with_positions_checked(retained)
  assert_true(old_frame.contains("points=\"0,150 400,150\""))
  assert_eq(line_remove_render_polyline_count(old_frame, "#203948"), 1)
  assert_eq(line_remove_render_polyline_count(old_frame, "#304958"), 0)
  assert_true(!old.stale())
  assert_true(current.stale())
  assert_true(physical_equal(axes.state.val.line_originals[0], current))
  let fresh = fig.to_svg_checked()
  assert_eq(line_remove_render_polyline_count(fresh, "#203948"), 0)
  assert_eq(line_remove_render_polyline_count(fresh, "#304958"), 1)
  assert_true(!current.stale())
}

///|
test "same-geometry middle removal preserves sibling identity and static legend and container snapshots" {
  let (fig, axes) = line_remove_render_fixture()
  let first = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#405968",
    label="shared",
  )
  let middle = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#506978",
    label="removed-entry",
  )
  let last = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#607988",
    label="shared",
  )
  axes.errorbar([0.5], [0.5], yerr=[0.1], color="#708998", label="container")
  let entries = axes
    .legend_entries()
    .map(entry => (entry.label(), entry.color()))
  let container = axes.containers()[0]
  let container_length = container.artists().length()
  middle.remove()
  assert_eq(axes.artists().length(), 3)
  assert_eq(axes.state.val.line_originals.length(), 2)
  assert_true(physical_equal(axes.state.val.line_originals[0], first))
  assert_true(physical_equal(axes.state.val.line_originals[1], last))
  assert_eq(
    first.xy_values_checked().to_array(),
    middle.xy_values_checked().to_array(),
  )
  assert_eq(
    last.xy_values_checked().to_array(),
    middle.xy_values_checked().to_array(),
  )
  assert_eq(
    axes.legend_entries().map(entry => (entry.label(), entry.color())),
    entries,
  )
  assert_true(physical_equal(axes.containers()[0], container))
  assert_true(container.kind() is ContainerKind::ErrorBar)
  assert_eq(container.label(), "container")
  assert_eq(container.artists().length(), container_length)
  let svg = fig.to_svg_checked()
  assert_eq(line_remove_render_polyline_count(svg, "#405968"), 1)
  assert_eq(line_remove_render_polyline_count(svg, "#506978"), 0)
  assert_eq(line_remove_render_polyline_count(svg, "#607988"), 1)
  assert_true(svg.contains("removed-entry"))
}

///|
test "category units events do not force a removed Line's invalid originals" {
  let (fig, axes) = line_remove_render_fixture()
  let live = axes.plot_line(
    Category(["b", "a"]),
    Numeric([0.0, 1.0]),
    color="#8099a8",
  )
  let removed = axes.plot_line(
    Category(["ghost", "other"]),
    Numeric([0.0, 1.0]),
    color="#90a9b8",
  )
  let previous = removed.x_values_checked()
  removed.remove()
  removed.set_xdata(Category(["bad", "extra", "shape"]))
  let replacement = @axis.CategoryUnits::new(["a", "b"])
  axes.set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
  assert_eq(replacement.labels(), ["a", "b"])
  assert_eq(live.x_values_checked().to_array(), [1.0, 0.0])
  assert_eq(previous.to_array(), [2.0, 3.0])
  assert_true(physical_equal(removed.cache.xs, previous))
  assert_true(removed.invalid_x && !removed.invalid_y)
  assert_true(removed.stale())
  assert_true(removed.owner is None)
  let svg = fig.to_svg_checked()
  assert_eq(line_remove_render_polyline_count(svg, "#90a9b8"), 0)
  assert_eq(line_remove_render_polyline_count(svg, "#8099a8"), 1)
  assert_true(removed.invalid_x)
}

///|
test "date y units events leave a removed Line's pending cache generation untouched" {
  let (fig, axes) = line_remove_render_fixture()
  let first = @date.RRuleDateTime::naive(@date.datetime(2024, 1, 1))
  let second = @date.RRuleDateTime::naive(@date.datetime(2024, 1, 2))
  let live = axes.plot_line(
    Numeric([0.0, 1.0]),
    Date([first, second]),
    color="#a0b9c8",
  )
  let removed = axes.plot_line(
    Numeric([0.0, 1.0]),
    Date([second, first]),
    color="#b0c9d8",
  )
  let previous = removed.y_values_checked()
  let live_before = live.y_values_checked().to_array()
  axes.set_y_limits(live_before[0], live_before[1])
  removed.remove()
  removed.set_ydata(Date([first, second, first]))
  axes.set_y_units(Some(@axis.AxisUnitTag::Date(@date.fixed_timezone(300))))
  assert_eq(live.y_values_checked().to_array(), live_before)
  assert_eq(previous.to_array(), [live_before[1], live_before[0]])
  assert_true(physical_equal(removed.cache.ys, previous))
  assert_true(!removed.invalid_x && removed.invalid_y)
  assert_true(removed.stale())
  assert_true(removed.owner is None)
  let svg = fig.to_svg_checked()
  assert_eq(line_remove_render_polyline_count(svg, "#b0c9d8"), 0)
  assert_eq(line_remove_render_polyline_count(svg, "#a0b9c8"), 1)
  assert_true(removed.invalid_y)
}
