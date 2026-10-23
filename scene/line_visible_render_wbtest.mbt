///|
fn line_visible_render_fixture() -> (Figure, Axes) raise {
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
test "hidden pending shape is skipped before recache and shown data retries then repairs" {
  let (fig, axes) = line_visible_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#112a43",
  )
  let previous = line.xy_values_checked()
  line.set_xdata(Numeric([0.0, 0.5, 1.0]))
  line.set_visible(false)
  let retained = fig.to_render_figure()
  let hidden = @svg.render_with_positions_checked(retained).0
  assert_true(!hidden.contains("#112a43"))
  assert_true(line.stale())
  assert_true(line.invalid_x && !line.invalid_y)
  assert_eq(previous.to_array(), [0.0, 0.0, 1.0, 1.0])
  line.set_visible(true)
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("expected the shown Line's deferred shape error")
  } noraise {
    _ => fail("expected shown shape error")
  }
  assert_true(line.stale() && line.invalid_x)
  line.set_xdata(Numeric([0.0, 1.0]))
  let repaired = @svg.render_with_positions_checked(retained).0
  assert_true(repaired.contains("#112a43"))
  assert_true(!line.stale())
  assert_true(!line.invalid_x && !line.invalid_y)
  assert_eq(previous.to_array(), [0.0, 0.0, 1.0, 1.0])
}

///|
test "hidden category conversion has no discovery until shown and units repair still visits hidden Line" {
  let (fig, axes) = line_visible_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#213a53",
  )
  let previous = line.y_values_checked()
  line.set_ydata(Category(["bad", "data"]))
  line.set_visible(false)
  assert_true(axes.y_axis().unit_converter_kind() is None)
  assert_true(!fig.to_svg_checked().contains("#213a53"))
  assert_true(axes.y_axis().unit_converter_kind() is None)
  assert_true(axes.y_units() is None)
  assert_true(line.invalid_y && line.stale())
  line.set_visible(true)
  try fig.to_svg_checked() catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("Missing category information"))
    _ => fail("expected the source conversion-only category error")
  } noraise {
    _ => fail("expected missing category units")
  }
  assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
  assert_true(axes.y_units() is None)
  assert_eq(previous.to_array(), [0.0, 1.0])
  line.set_visible(false)
  axes.set_y_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["data", "bad"]))),
  )
  assert_true(!line.invalid_y)
  assert_eq(line.y_values_checked().to_array(), [1.0, 0.0])
  assert_true(!fig.to_svg_checked().contains("#213a53"))
  assert_true(line.stale())
  line.set_visible(true)
  assert_true(fig.to_svg_checked().contains("#213a53"))
  assert_true(!line.stale())
}

///|
test "hidden x labels are not appended by drawing before the Line is shown" {
  let (fig, axes) = line_visible_render_fixture()
  let line = axes.plot_line(
    Category(["a", "b"]),
    Numeric([0.0, 1.0]),
    color="#314a63",
  )
  let units = axes.x_axis().get_category_units().unwrap()
  let previous = line.x_values_checked()
  line.set_xdata(Category(["new", "a"]))
  line.set_visible(false)
  ignore(fig.to_svg_checked())
  assert_eq(units.labels(), ["a", "b"])
  assert_eq(previous.to_array(), [0.0, 1.0])
  assert_true(line.invalid_x && line.stale())
  line.set_visible(true)
  assert_true(fig.to_svg_checked().contains("#314a63"))
  assert_eq(units.labels(), ["a", "b", "new"])
  assert_eq(line.x_values_checked().to_array(), [2.0, 0.0])
  assert_true(!line.invalid_x && !line.stale())
}

///|
test "visible empty and nonfinite Lines complete while hidden Lines retain stale" {
  let (fig, axes) = line_visible_render_fixture()
  let empty = axes.plot_line(Numeric([]), Numeric([]), color="#415a73")
  let nonfinite = axes.plot_line(
    Numeric([0.0 / 0.0, 1.0]),
    Numeric([0.0, 1.0 / 0.0]),
    color="#516a83",
  )
  empty.set_visible(false)
  nonfinite.set_visible(false)
  let hidden = fig.to_svg_checked()
  assert_true(!hidden.contains("<polyline "))
  assert_true(empty.stale() && nonfinite.stale())
  empty.set_visible(true)
  nonfinite.set_visible(true)
  let visible = fig.to_svg_checked()
  assert_true(!visible.contains("<polyline "))
  assert_true(!empty.stale() && !nonfinite.stale())
}

///|
test "earlier secondary callback changes retained IR Line visibility in the same frame" {
  let (fig, axes) = line_visible_render_fixture()
  let line = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#617a93",
  )
  let show = [false]
  let child = axes.secondary_xaxis(value => value, value => value)
  child.set_ticks([0.5])
  child.set_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      line.set_visible(show[0])
      "visibility-child"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let hidden = @svg.render_with_positions_checked(retained).0
  assert_true(!hidden.contains("#617a93"))
  assert_true(!line.get_visible() && line.stale())
  show[0] = true
  let visible = @svg.render_with_positions_checked(retained).0
  assert_true(visible.contains("#617a93"))
  assert_true(line.get_visible() && !line.stale())
}

///|
test "removed hidden old IR remains separate from clear replacement visibility and completion" {
  let (fig, axes) = line_visible_render_fixture()
  let old = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#718aa3",
  )
  let retained = fig.to_render_figure()
  old.set_visible(false)
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
    color="#819ab3",
  )
  let hidden = @svg.render_with_positions_checked(retained).0
  assert_true(!hidden.contains("#718aa3") && !hidden.contains("#819ab3"))
  assert_true(old.stale() && current.stale())
  old.set_visible(true)
  let old_frame = @svg.render_with_positions_checked(retained).0
  assert_true(old_frame.contains("#718aa3") && !old_frame.contains("#819ab3"))
  assert_true(!old.stale() && current.stale())
  let fresh = fig.to_svg_checked()
  assert_true(!fresh.contains("#718aa3") && fresh.contains("#819ab3"))
  assert_true(!current.stale())
}

///|
test "independent static IR Line does not inherit a same-buffer handle's visibility" {
  let (_, axes) = line_visible_render_fixture()
  let owned = axes.plot_line(
    Numeric([0.0, 1.0]),
    Numeric([0.0, 1.0]),
    color="#91aac3",
  )
  owned.set_visible(false)
  let standalone = @render.figure(
    400,
    200,
    0,
    [
      @render.panel(
        None,
        [@render.Artist::Line(owned.points, @core.style("#91aac3"))],
        None,
        [],
        None,
        axes.x_axis(),
        axes.y_axis(),
        false,
        [],
        [],
      ),
    ],
    [],
    None,
  )
  let svg = @svg.render_with_positions_checked(standalone).0
  assert_true(svg.contains("#91aac3"))
  assert_true(!owned.get_visible() && owned.stale())
}
