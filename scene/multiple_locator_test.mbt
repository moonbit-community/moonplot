///|
test "shared inverted axes render live multiple ticks and hide outer neighbors" {
  let figure = @scene.figure(width=480, height=360)
  let axes = figure.subplots(2, 1, share_x=true)
  let locator = @ticker.MultipleLocator::new(base=2.0, offset=1.0)
  axes[0].set_x_locator(locator.as_locator())
  axes[0].set_x_formatter(@ticker.format_str_formatter("multiple=%.1f"))
  axes[1].set_x_limits(4.0, 0.0)
  for axis in axes {
    axis.plot([0.0, 4.0], [0.0, 1.0])
    assert_eq(axis.x_axis().tick_values(@core.limits(0.0, 4.0)), [
      5.0, 3.0, 1.0, -1.0,
    ])
  }
  let first = figure.to_svg()
  assert_eq(first.split(">multiple=1.0<").count() - 1, 1)
  assert_eq(first.split(">multiple=3.0<").count() - 1, 1)
  assert_true(!first.contains(">multiple=-1.0<"))
  assert_true(!first.contains(">multiple=5.0<"))
  locator.set_params(base=1.0, offset=0.5)
  assert_eq(
    axes[1].x_axis().locator().unwrap().multiple_locator().unwrap().base(),
    1.0,
  )
  let second = figure.to_svg()
  for label in ["0.5", "1.5", "2.5", "3.5"] {
    assert_true(second.contains(">multiple=" + label + "<"))
  }
  assert_true(!second.contains(">multiple=-0.5<"))
  assert_true(!second.contains(">multiple=4.5<"))
  assert_true(!second.contains("NaN"))
  assert_true(!second.contains("Infinity"))
}

///|
test "secondary multiple locators remain live through scene and render copies" {
  let figure = @scene.figure(width=420, height=280)
  figure.set_bounds(@core.bounds(2.0, 0.0, 2.0, 0.0))
  let locator = @ticker.MultipleLocator::new(base=2.0, offset=1.0)
  let secondary_x = figure.secondary_xaxis(x => x * 2.0, x => x / 2.0)
  let secondary_y = figure.secondary_yaxis(y => y * 2.0, y => y / 2.0)
  secondary_x.set_locator(locator.as_locator())
  secondary_y.set_locator(locator.as_locator().copy())
  secondary_x.set_formatter(@ticker.format_str_formatter("secondary-x=%.1f"))
  secondary_y.set_formatter(@ticker.format_str_formatter("secondary-y=%.1f"))
  let first = figure.to_svg()
  for prefix in ["secondary-x=", "secondary-y="] {
    assert_true(first.contains(">" + prefix + "1.0<"))
    assert_true(first.contains(">" + prefix + "3.0<"))
    assert_true(!first.contains(">" + prefix + "-1.0<"))
    assert_true(!first.contains(">" + prefix + "5.0<"))
  }
  secondary_x
  .locator()
  .unwrap()
  .multiple_locator()
  .unwrap()
  .set_params(base=1.0, offset=0.5)
  assert_eq(locator.base(), 1.0)
  assert_eq(
    secondary_y.locator().unwrap().multiple_locator().unwrap().offset(),
    0.5,
  )
  let second = figure.to_svg()
  for prefix in ["secondary-x=", "secondary-y="] {
    for label in ["0.5", "1.5", "2.5", "3.5"] {
      assert_true(second.contains(">" + prefix + label + "<"))
    }
    assert_true(!second.contains(">" + prefix + "-0.5<"))
    assert_true(!second.contains(">" + prefix + "4.5<"))
  }
}

///|
test "contour multiple levels retain source neighbors and subsequent updates" {
  let locator = @ticker.MultipleLocator::new(base=2.0, offset=1.0)
  let adapter = locator.as_locator().copy()
  let data = [[0.0, 1.0], [2.0, 3.0]]
  let figure = @scene.figure(width=360, height=240)
  let first = figure.contour(data, locator=adapter)
  assert_eq(first.levels(), [-1.0, 1.0, 3.0, 5.0])
  locator.set_params(base=1.0, offset=0.5)
  let second = figure.contourf(data, locator=adapter)
  assert_eq(second.levels(), [-0.5, 0.5, 1.5, 2.5, 3.5])
  assert_true(second.filled())
  assert_eq(first.levels(), [-1.0, 1.0, 3.0, 5.0])
  let svg = figure.to_svg()
  assert_true(svg.contains("<polygon"))
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
}
