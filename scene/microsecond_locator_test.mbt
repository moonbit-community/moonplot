///|
test "fractional microsecond locator propagates through shared inverted SVG axes" {
  let first = @date.datetime(1970, 1, 1)
  let last = @date.datetime(1970, 1, 1, microsecond=3)
  let locator = @date.MicrosecondLocator::new(interval=0.5, tz="UTC")
  let figure = @scene.figure(width=650, height=440)
  let axes = figure.subplots(2, 1, share_x=true)
  for axis in axes {
    axis.plot_date([first, last], [0.0, 1.0])
  }
  axes[0].set_x_date_locator(locator.as_locator())
  axes[0].set_x_date_format("%H:%M:%S.%f")
  axes[1].set_x_limits(last.to_ordinal(), first.to_ordinal())
  assert_eq(axes[1].x_axis().date_locator().unwrap().interval_value(), 0.5)
  let svg = figure.to_svg()
  assert_true(svg.contains(">00:00:00.000001</text>"))
  assert_true(svg.contains(">00:00:00.000002</text>"))
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
}
