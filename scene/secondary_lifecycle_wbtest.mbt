///|
test "secondary owns real function defaults and waits for parent view synchronization" {
  let axes = figure().axes()
  axes.set_x_limits(10.0, 20.0)
  let child = axes.secondary_xaxis(value => value, value => value)
  assert_true(child.locator() is Some(@ticker.Locator::NamedAuto(_)))
  assert_true(child.named_formatter().unwrap().scalar_formatter() is Some(_))
  assert_true(child.numeric_axis.is_default_locator())
  assert_true(child.numeric_axis.is_default_formatter())
  assert_true(child.numeric_axis.is_default_locator(minor=true))
  assert_true(child.numeric_axis.is_default_formatter(minor=true))
  let view = child.numeric_axis.stored_view_limits()
  assert_eq((view.lower(), view.upper()), (0.0, 1.0))
  axes.set_x_limits(20.0, 30.0)
  let unchanged = child.numeric_axis.stored_view_limits()
  assert_eq((unchanged.lower(), unchanged.upper()), (0.0, 1.0))
  child.apply_aspect()
  let synchronized = child.numeric_axis.stored_view_limits()
  assert_eq((synchronized.lower(), synchronized.upper()), (20.0, 30.0))
}

///|
test "secondary constructor geometry preserves source affine reciprocal stages" {
  let axes = figure(width=320, height=240).axes()
  let x = axes.secondary_xaxis(value => value, value => value)
  let y = axes.secondary_yaxis(value => value, value => value)
  assert_eq(x.get_tick_space(), 10.0)
  assert_eq(y.get_tick_space(), 11.0)
  x.apply_aspect()
  y.apply_aspect()
  assert_eq(x.get_tick_space(), 10.0)
  assert_eq(y.get_tick_space(), 11.0)
}

///|
test "secondary draw finalizes singular mapped limits with the old locator before reset" {
  let axes = figure().axes()
  axes.set_x_limits(1.0, 2.0)
  let child = axes.secondary_xaxis(_ => 4.0, _ => 1.0)
  child.set_locator(@ticker.FixedLocator::new([2.0, 3.0]).as_locator())
  axes.set_x_scale(@scale.log_scale())
  child.prepare_draw()
  let view = child.numeric_axis.stored_view_limits()
  assert_eq((view.lower(), view.upper()), (3.8, 4.2))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
  assert_eq(child.parent_scale_name, Some("log"))
  assert_true(child.locator() is Some(@ticker.Locator::NamedLog(_)))
}

///|
test "secondary ticks latch survives a direct locator and restores its current ticks" {
  let axes = figure().axes()
  axes.set_x_limits(1.0, 4.0)
  let child = axes.secondary_xaxis(value => value, value => value)
  child.set_ticks([0.0, 1.0])
  child.set_locator(@ticker.FixedLocator::new([2.0, 3.0]).as_locator())
  assert_true(child.ticks_set)
  assert_true(!child.source_ticks_current)
  axes.set_x_scale(@scale.log_scale())
  child.prepare_draw()
  assert_eq(child.tick_values_checked(), [2.0, 3.0])
  assert_true(child.locator() is Some(@ticker.Locator::NamedFixed(_)))
  assert_true(!child.numeric_axis.is_default_locator())
  assert_true(child.numeric_axis.is_default_locator(minor=true))
  assert_true(child.numeric_axis.is_default_formatter())
  assert_true(child.numeric_axis.is_default_formatter(minor=true))
}

///|
test "secondary keeps one actual owner for old locator and formatter handles" {
  let axes = figure().axes()
  axes.set_x_limits(10.0, 20.0)
  let child = axes.secondary_xaxis(value => value, value => value)
  let locator = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Count(3))
  child.set_locator(locator.as_locator())
  let old_formatter = child.named_formatter().unwrap()
  let binding = child.formatter_axis_binding()
  child.apply_aspect()
  assert_eq(locator.call(), [8.0, 12.0, 16.0, 20.0])
  axes.set_x_scale(@scale.log_scale())
  child.prepare_draw()
  assert_eq(locator.call(), [8.0, 12.0, 16.0, 20.0])
  assert_eq(old_formatter.axis(), Some(binding))
  assert_eq(child.formatter_axis_binding(), binding)
  assert_eq(child.named_formatter().unwrap().axis(), Some(binding))
}

///|
test "secondary explicit sampling extension yields to a direct locator and new defaults" {
  let axes = figure().axes()
  axes.set_x_limits(1.0, 9.0)
  let child = axes.secondary_xaxis(value => value * 2.0, value => value / 2.0)
  assert_true(!child.legacy_sampling)
  child.set_tick_count(4)
  assert_true(child.legacy_sampling)
  assert_eq(child.tick_values_checked().length(), 4)
  child.set_locator(@ticker.FixedLocator::new([2.0, 4.0]).as_locator())
  assert_true(!child.legacy_sampling)
  child.set_tick_count(9)
  assert_true(!child.legacy_sampling)
  assert_eq(child.tick_values_checked(), [2.0, 4.0])
  child.clear_locator()
  assert_true(child.legacy_sampling)
  axes.set_x_scale(@scale.log_scale())
  child.prepare_draw()
  assert_true(!child.legacy_sampling)
  assert_true(child.locator() is Some(@ticker.Locator::NamedLog(_)))
}

///|
test "secondary batches prepare each child's current parent scale independently" {
  let fig = figure(width=400, height=240)
  let axes = fig.axes()
  axes.set_x_limits(1.0, 100.0)
  let first = axes.secondary_xaxis(value => value, value => value)
  let second = axes.secondary_xaxis(value => value, value => value)
  first.set_named_formatter(
    @ticker.FuncFormatter::new((_, position) => {
      if position == Some(0) {
        axes.set_x_scale(@scale.log_scale())
      }
      "first"
    }).as_base_formatter(),
  )
  ignore(fig.to_svg())
  assert_eq(first.parent_scale_name, Some("linear"))
  assert_eq(second.parent_scale_name, Some("log"))
  assert_eq(first.numeric_axis.coordinate_scale_name(), "function")
  assert_eq(second.numeric_axis.coordinate_scale_name(), "functionlog")
}

///|
test "secondary child draw order follows creation across coordinate directions" {
  let fig = figure(width=400, height=240)
  let axes = fig.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 10.0)
  let first_y = axes.secondary_yaxis(value => value, value => value)
  let second_x = axes.secondary_xaxis(value => value, value => value)
  assert_eq((first_y.draw_order, second_x.draw_order), (0, 1))
  first_y.set_named_formatter(
    @ticker.FuncFormatter::new((_, position) => {
      if position == Some(0) {
        axes.set_x_scale(@scale.log_scale())
      }
      "first-y"
    }).as_base_formatter(),
  )
  ignore(fig.to_svg())
  assert_eq(first_y.parent_scale_name, Some("linear"))
  assert_eq(second_x.parent_scale_name, Some("log"))
}
