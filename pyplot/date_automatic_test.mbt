///|
test "pyplot installs automatic calendar locators on both axes with live formatter binding" {
  @pyplot.close()
  ignore(@pyplot.figure(width=620, height=340))
  let first = @date.datetime(2024, 1, 1).to_ordinal()
  @pyplot.plot([first, first + 40.0 / 24.0], [first, first + 182.0])
  let locator = @date.AutoDateLocator::new().with_intervals(@date.Hour, [3])
  @pyplot.xaxis_date_locator(locator.as_locator())
  @pyplot.yaxis_date_locator(locator.as_locator())
  @pyplot.xaxis_date_formatter(
    @date.AutoDateFormatter::new(locator=locator.as_locator()).as_formatter(),
  )
  @pyplot.gca().set_x_limits(first + 40.0 / 24.0, first)
  @pyplot.gca().set_y_limits(first, first + 182.0)
  let svg = @pyplot.render_svg()
  assert_true(svg.contains(">01-01 03</text>"))
  assert_true(svg.contains(">2024-02</text>"))
  assert_eq(
    @pyplot.gcf().x_axis().date_locator().unwrap().unit_scale(),
    1.0 / 24.0,
  )
  assert_eq(@pyplot.gcf().y_axis().date_locator().unwrap().unit_scale(), 30.0)
  assert_eq(locator.frequency(), @date.Year)
  @pyplot.close()
}
