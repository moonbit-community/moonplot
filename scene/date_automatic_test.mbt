///|
test "single date SVG uses calendar nonsingular range before margins" {
  let figure = @scene.figure(width=620, height=300)
  figure.plot_date([@date.datetime(1997, 1, 1)], [1.0])
  let svg = figure.to_svg()
  assert_true(svg.contains(">1995-01</text>"))
  assert_true(svg.contains(">1999-01</text>"))
  assert_true(!svg.contains("NaN"))
  assert_eq(
    figure.x_axis().auto_date_locator().unwrap().frequency(),
    @date.Month,
  )
  figure.set_x_limits(
    @date.datetime(1997, 1, 1).to_ordinal(),
    @date.datetime(1997, 1, 1).to_ordinal(),
  )
  assert_true(figure.to_svg().contains(">1998-07</text>"))
}

///|
test "empty date SVG has deterministic epoch range and automatic hourly labels" {
  let figure = @scene.figure(width=620, height=300)
  figure.axes().set_x_date()
  figure.axes().set_y_date()
  let svg = figure.to_svg()
  assert_eq(svg.split(">01-01 00</text>").to_array().length() - 1, 2)
  assert_eq(svg.split(">01-02 00</text>").to_array().length() - 1, 2)
  assert_eq(
    figure.x_axis().auto_date_locator().unwrap().frequency(),
    @date.Hour,
  )
  assert_eq(
    figure.y_axis().auto_date_locator().unwrap().frequency(),
    @date.Hour,
  )
  assert_true(!svg.contains("NaN"))
}

///|
test "shared automatic calendar locator follows inversion and later zoom independently" {
  let figure = @scene.figure(width=620, height=440)
  let axes = figure.subplots(2, 1, share_x=true)
  let first = @date.datetime(2024, 1, 1).to_ordinal()
  let locator = @date.AutoDateLocator::new().with_intervals(@date.Hour, [3])
  axes[0].set_x_date_locator(locator.as_locator())
  axes[0].set_x_date_formatter(
    @date.AutoDateFormatter::new(locator=@date.year_locator()).as_formatter(),
  )
  for axis in axes {
    axis.plot([first, first + 40.0 / 24.0], [0.0, 1.0])
  }
  axes[1].set_x_limits(first + 40.0 / 24.0, first)
  let svg = figure.to_svg()
  assert_true(svg.contains(">01-01 03</text>"))
  assert_true(!svg.contains(">01-01 02</text>"))
  for axis in axes {
    assert_eq(
      axis
      .x_axis()
      .date_locator()
      .unwrap()
      .automatic_locator()
      .unwrap()
      .frequency(),
      @date.Hour,
    )
  }
  assert_eq(locator.frequency(), @date.Year)
  axes[0].set_x_limits(first, first + 182.0)
  assert_true(figure.to_svg().contains(">2024-02</text>"))
  for axis in axes {
    assert_eq(axis.x_axis().date_locator().unwrap().unit_scale(), 30.0)
  }
  assert_eq(locator.frequency(), @date.Year)
}
