///|
test "named monthly locator live monthday reaches shared inverted SVG axes" {
  let first = @date.datetime(2024, 1, 1)
  let last = @date.datetime(2024, 5, 1)
  let locator = @date.MonthLocator::new(
    bymonthday_value=15,
    tz="UTC",
    context=@date.DateParserContext::utc(clock=fn() { 1781524800123L }),
  )
  let figure = @scene.figure(width=650, height=440)
  let axes = figure.subplots(2, 1, share_x=true)
  for axis in axes {
    axis.plot_date([first, last], [0.0, 1.0])
  }
  axes[0].set_x_date_locator(locator.as_locator())
  axes[1].set_x_limits(last.to_ordinal(), first.to_ordinal())
  axes[0].set_x_date_format("%m-%d")
  assert_true(figure.to_svg().contains(">02-15</text>"))
  locator.rule().set(bymonthday_value=-1)
  let svg = figure.to_svg()
  assert_eq(svg.split(">02-29</text>").to_array().length() - 1, 1)
  assert_eq(axes[1].x_axis().date_locator().unwrap().unit_scale(), 30.0)
}
