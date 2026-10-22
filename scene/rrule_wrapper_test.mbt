///|
test "live wrapper locator changes automatic labels on shared inverted SVG axes" {
  let first = @date.datetime(2024, 1, 1)
  let last = @date.datetime(2024, 1, 3)
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(first),
  )
  let locator = @date.RRuleLocator::new(wrapper, tz="UTC")
  let figure = @scene.figure(width=650, height=440)
  let axes = figure.subplots(2, 1, share_x=true)
  for axis in axes {
    axis.plot_date([first, last], [0.0, 1.0])
  }
  axes[0].set_x_date_locator(locator.as_locator())
  axes[1].set_x_limits(last.to_ordinal(), first.to_ordinal())
  wrapper.set(frequency=@date.Hourly, interval=12)
  let svg = figure.to_svg()
  assert_eq(svg.split(">01-01 12</text>").to_array().length() - 1, 1)
  for axis in axes {
    let installed = axis.x_axis().date_locator().unwrap()
    assert_eq(installed.unit_scale(), 1.0 / 24.0)
    assert_eq(installed.interval(), 12)
  }
  axes[0]
  .x_axis()
  .date_locator()
  .unwrap()
  .rrule_locator()
  .unwrap()
  .rule()
  .set(interval=6)
  assert_true(figure.to_svg().contains(">01-01 06</text>"))
  assert_eq(wrapper.interval(), 6)
}
