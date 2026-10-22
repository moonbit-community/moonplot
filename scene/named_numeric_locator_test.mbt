///|
test "shared inverted named presets and fixed minors render visible ticks after live writes" {
  let figure = @scene.figure(width=480, height=360)
  let axes = figure.subplots(2, 1, share_x=true)
  let values = [-1.0, 0.0, 1.0, 2.0, 3.0]
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(0.0, 2.0, values)
  let major = @ticker.LinearLocator::new(numticks=-1, presets~)
  let minor = @ticker.FixedLocator::new([3.0, 1.5, 0.5, -1.0])
  axes[0].set_x_locator(major.as_locator())
  axes[0].set_x_minor_locator(minor.as_minor_locator())
  axes[0].set_x_formatter(@ticker.format_str_formatter("named-major=%.1f"))
  axes[1].set_x_limits(2.0, 0.0)
  for axis in axes {
    axis.plot([0.0, 2.0], [0.0, 1.0])
    assert_eq(axis.x_axis().minor_tick_values_checked(@core.limits(0.0, 2.0)), [
      1.5, 0.5,
    ])
  }
  let first = figure.to_svg_checked()
  for label in ["0.0", "1.0", "2.0"] {
    assert_eq(first.split(">named-major=" + label + "<").count() - 1, 1)
  }
  assert_true(!first.contains(">named-major=-1.0<"))
  assert_true(!first.contains(">named-major=3.0<"))
  major.tick_values(0.0, 2.0).set(2, 1.5)
  assert_eq(values[2], 1.5)
  assert_eq(
    axes[1].x_axis().locator().unwrap().linear_locator().unwrap().numticks(),
    -1,
  )
  let updated = figure.to_svg_checked()
  assert_true(updated.contains(">named-major=1.5<"))
  assert_true(!updated.contains(">named-major=1.0<"))
  assert_true(!updated.contains("NaN"))
  assert_true(!updated.contains("Infinity"))
}

///|
test "secondary named Linear and Fixed locators observe shared borrowed tick buffers" {
  let figure = @scene.figure(width=420, height=280)
  figure.set_bounds(@core.bounds(0.0, 2.0, 0.0, 2.0))
  let values = [0.0, 2.0, 4.0]
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(0.0, 4.0, values)
  let linear = @ticker.LinearLocator::new(numticks=-1, presets~)
  let fixed = @ticker.FixedLocator::new(values)
  let secondary_x = figure.secondary_xaxis(x => x * 2.0, x => x / 2.0)
  let secondary_y = figure.secondary_yaxis(y => y * 2.0, y => y / 2.0)
  secondary_x.set_locator(linear.as_locator())
  secondary_y.set_locator(fixed.as_locator())
  secondary_x.set_formatter(
    @ticker.format_str_formatter("named-secondary-x=%.1f"),
  )
  secondary_y.set_formatter(
    @ticker.format_str_formatter("named-secondary-y=%.1f"),
  )
  let first = figure.to_svg_checked()
  for prefix in ["named-secondary-x=", "named-secondary-y="] {
    assert_true(first.contains(">" + prefix + "2.0<"))
  }
  fixed.tick_values(0.0, 0.0).set(1, 1.5)
  let updated = figure.to_svg_checked()
  for prefix in ["named-secondary-x=", "named-secondary-y="] {
    assert_true(updated.contains(">" + prefix + "1.5<"))
    assert_true(!updated.contains(">" + prefix + "2.0<"))
  }
  secondary_x
  .locator()
  .unwrap()
  .linear_locator()
  .unwrap()
  .presets()
  .set(0.0, 4.0, [1.0, 3.0])
  let replaced = figure.to_svg_checked()
  assert_true(replaced.contains(">named-secondary-x=1.0<"))
  assert_true(replaced.contains(">named-secondary-x=3.0<"))
  assert_true(replaced.contains(">named-secondary-y=1.5<"))
}

///|
test "contour named locators materialize live aliased buffers without changing older levels" {
  let figure = @scene.figure(width=360, height=240)
  let data = [[0.0, 1.0], [2.0, 3.0]]
  let values = [0.5, 1.5, 2.5]
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(0.0, 3.0, values)
  let linear = @ticker.LinearLocator::new(numticks=-1, presets~)
  let fixed = @ticker.FixedLocator::new(values)
  let first = figure.contour(data, locator=linear.as_locator())
  assert_eq(first.levels(), [0.5, 1.5, 2.5])
  fixed.tick_values(0.0, 0.0).set(0, 0.25)
  let second = figure.contour(data, locator=linear.as_locator())
  let filled = figure.contourf(data, locator=fixed.as_locator())
  assert_eq(second.levels(), [0.25, 1.5, 2.5])
  assert_eq(filled.levels(), [0.25, 1.5, 2.5])
  assert_eq(first.levels(), [0.5, 1.5, 2.5])
  assert_true(figure.to_svg_checked().contains("<polygon"))
}

///|
test "checked SVG preserves Linear delayed tick and round numbers view errors" {
  let previous = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous))
  @config.set_axes_autolimit_mode("data")
  let figure = @scene.figure(width=360, height=240)
  figure.plot([1.0, 2.0], [0.0, 1.0])
  let locator = @ticker.LinearLocator::new(numticks=-1)
  figure.set_x_locator(locator.as_locator())
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  locator.set_params(numticks=3)
  assert_true(figure.to_svg_checked().contains("<polyline"))
  @config.set_axes_autolimit_mode("round_numbers")
  let rounded_figure = @scene.figure(width=360, height=240)
  rounded_figure.plot([1.0, 2.0], [0.0, 1.0])
  let rounded_locator = @ticker.LinearLocator::new(numticks=2)
  rounded_figure.set_x_locator(rounded_locator.as_locator())
  assert_true(
    try {
      ignore(rounded_figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  rounded_locator.set_params(numticks=3)
  assert_true(rounded_figure.to_svg_checked().contains("<polyline"))
}

///|
test "checked SVG preserves named Fixed minor delayed errors and recovers after updates" {
  let figure = @scene.figure(width=360, height=240)
  figure.set_bounds(@core.bounds(0.0, 2.0, 0.0, 1.0))
  figure.plot([0.0, 2.0], [0.0, 1.0])
  let locator = @ticker.FixedLocator::new([0.5, 1.5])
  locator.set_params(nbins=0.0)
  figure.set_x_minor_locator(locator.as_minor_locator())
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  locator.set_params(nbins=2.0)
  assert_true(figure.to_svg_checked().contains("<polyline"))
}
