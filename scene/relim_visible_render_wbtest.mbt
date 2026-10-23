///|
fn relim_visible_render_fixture() -> (Figure, Axes) raise {
  let fig = figure(width=400, height=200)
  let axes = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(0.0, 100.0)
  axes.set_y_limits(0.0, 100.0)
  axes.set_margins(0.0, 0.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (fig, axes)
}

///|
fn relim_visible_render_clear_requests(axes : Axes) -> Unit {
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
}

///|
fn relim_visible_render_bounds(axes : Axes) -> (Double, Double, Double, Double) {
  let x = axes.data_limits()
  let y = axes.data_limits(horizontal=false)
  (x.lower(), x.upper(), y.lower(), y.upper())
}

///|
fn relim_visible_render_view(axes : Axes) -> (Double, Double, Double, Double) {
  let x = axes.x_axis().stored_view_limits()
  let y = axes.y_axis().stored_view_limits()
  (x.lower(), x.upper(), y.lower(), y.upper())
}

///|
test "visible-only relim changes data bounds before explicit autoscale fits retained IR geometry" {
  let (fig, axes) = relim_visible_render_fixture()
  let live = axes.plot_line(
    Numeric([10.0, 20.0]),
    Numeric([30.0, 40.0]),
    color="#17395b",
  )
  let hidden = axes.plot_line(
    Numeric([1000.0, 2000.0]),
    Numeric([3000.0, 4000.0]),
    color="#284a6c",
  )
  hidden.set_visible(false)
  relim_visible_render_clear_requests(axes)
  let retained = fig.to_render_figure()
  axes.relim_checked(visible_only=true)
  assert_eq(relim_visible_render_bounds(axes), (10.0, 20.0, 30.0, 40.0))
  assert_eq(relim_visible_render_view(axes), (0.0, 100.0, 0.0, 100.0))
  assert_true(!axes.get_autoscale_on())
  assert_true(
    !axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
  let old_view = @svg.render_with_positions_checked(retained).0
  assert_true(old_view.contains("points=\"40,140 80,120\""))
  assert_true(!old_view.contains("#284a6c"))
  axes.set_autoscale_on(true)
  assert_true(
    !axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
  axes.autoscale_view(tight=true)
  assert_eq(relim_visible_render_view(axes), (10.0, 20.0, 30.0, 40.0))
  let fitted = @svg.render_with_positions_checked(retained).0
  assert_true(fitted.contains("points=\"0,200 400,0\""))
  assert_true(fitted.contains("#17395b") && !fitted.contains("#284a6c"))
  assert_true(!live.stale() && hidden.stale())
}

///|
test "earlier child visible-only relim and autoscale update retained frame primary geometry" {
  let (fig, axes) = relim_visible_render_fixture()
  ignore(
    axes.plot_line(
      Numeric([10.0, 20.0]),
      Numeric([30.0, 40.0]),
      color="#395b7d",
    ),
  )
  let outlier = axes.plot_line(
    Numeric([1000.0, 2000.0]),
    Numeric([3000.0, 4000.0]),
    color="#4a6c8e",
  )
  let changed = [false]
  let child = axes.secondary_xaxis(value => value, value => value)
  child.set_ticks([50.0])
  child.set_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      if !changed[0] {
        outlier.set_visible(false)
        axes.relim_checked(visible_only=true)
        axes.autoscale_view(tight=true)
        changed[0] = true
      }
      "visible-relim-child"
    }).as_base_formatter(),
  )
  axes.set_autoscale_on(true)
  relim_visible_render_clear_requests(axes)
  let retained = fig.to_render_figure()
  let svg = @svg.render_with_positions_checked(retained).0
  assert_true(changed[0])
  assert_eq(relim_visible_render_bounds(axes), (10.0, 20.0, 30.0, 40.0))
  assert_eq(relim_visible_render_view(axes), (10.0, 20.0, 30.0, 40.0))
  assert_true(svg.contains("points=\"0,200 400,0\""))
  assert_true(svg.contains("#395b7d") && !svg.contains("#4a6c8e"))
  assert_true(outlier.stale())
  assert_true(
    !axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
}

///|
test "visible-only relim and draw skip hidden invalid data but units event keeps force-all behavior" {
  let (fig, axes) = relim_visible_render_fixture()
  ignore(
    axes.plot_line(
      Numeric([10.0, 20.0]),
      Numeric([30.0, 40.0]),
      color="#5b7d9f",
    ),
  )
  let hidden = axes.plot_line(
    Numeric([50.0, 60.0]),
    Numeric([70.0, 80.0]),
    color="#6c8eb0",
  )
  let previous = hidden.x_values_checked()
  hidden.set_xdata(Numeric([1.0, 2.0, 3.0]))
  hidden.set_visible(false)
  relim_visible_render_clear_requests(axes)
  axes.relim_checked(visible_only=true)
  let before = relim_visible_render_bounds(axes)
  assert_eq(before, (10.0, 20.0, 30.0, 40.0))
  let retained = fig.to_render_figure()
  assert_true(
    !@svg.render_with_positions_checked(retained).0.contains("#6c8eb0"),
  )
  assert_true(hidden.invalid_x && hidden.stale())
  assert_eq(previous.to_array(), [50.0, 60.0])
  let replacement = @axis.CategoryUnits::new(["a", "b"])
  try axes.set_x_units(Some(@axis.AxisUnitTag::Category(replacement))) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("the units callback must still force recache of hidden Lines")
  } noraise {
    _ => fail("expected force-all units callback error")
  }
  assert_true(
    physical_equal(axes.x_axis().get_category_units().unwrap(), replacement),
  )
  assert_eq(relim_visible_render_bounds(axes), before)
  assert_true(
    !axes.x_axis().autoscale_stale() && !axes.y_axis().autoscale_stale(),
  )
  assert_true(hidden.invalid_x && hidden.stale())
  try axes.relim_checked() catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("omitted visible_only must retain default-false processing")
  } noraise {
    _ => fail("expected default relim to process hidden bad data")
  }
  hidden.set_xdata(Numeric([50.0, 60.0]))
  axes.relim_checked(visible_only=true)
  assert_eq(relim_visible_render_bounds(axes), before)
  assert_true(!fig.to_svg_checked().contains("#6c8eb0"))
  assert_true(hidden.invalid_x && hidden.stale())
}
