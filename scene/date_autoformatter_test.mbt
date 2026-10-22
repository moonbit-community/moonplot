///|
test "SVG major and minor automatic date formatters rebind on both coordinates" {
  let figure = @scene.figure(width=620, height=340)
  let first = @date.datetime(2018, 9, 30, hour=8).to_ordinal()
  let last = @date.datetime(2018, 9, 30, hour=10, minute=30).to_ordinal()
  figure.plot([first, last], [first, last])
  figure.set_x_date_locator(@date.minute_locator(byminute=[0, 30]))
  figure.set_y_date_locator(@date.hour_locator())
  figure.set_x_limits(first, last)
  figure.set_y_limits(first, last)
  assert_true(figure.to_svg().contains(">30 08:30</text>"))
  figure.set_x_ticks([])
  figure.set_y_ticks([])
  let decoy = @date.AutoDateFormatter::new(locator=@date.year_locator()).as_formatter()
  figure.set_x_minor_date_locator(@date.minute_locator(byminute=[5, 55]))
  figure.set_x_minor_date_formatter(decoy)
  figure.set_x_minor_date_locator(@date.minute_locator(byminute=[15, 45]))
  figure.set_y_minor_date_locator(@date.minute_locator(byminute=[15, 45]))
  figure.set_y_minor_date_formatter(decoy)
  let svg = figure.to_svg()
  for label in ["30 08:15", "30 08:45", "30 09:15", "30 09:45", "30 10:15"] {
    assert_eq(svg.split(">" + label + "</text>").to_array().length() - 1, 2)
  }
  assert_true(!svg.contains(">30 08:05</text>"))
}

///|
test "shared minor date callbacks retain positions visibility and XML escaping" {
  let figure = @scene.figure(width=620, height=440)
  let axes = figure.subplots(2, 1, share_x=true)
  let first = @date.datetime(2024, 1, 1).to_ordinal()
  for axis in axes {
    axis.plot([first, first + 2.0 / 24.0], [0.0, 1.0])
  }
  axes[0].set_x_date()
  axes[0].set_x_ticks([])
  axes[1].set_x_minor_date_locator(@date.minute_locator(byminute=[15, 45]))
  axes[1].set_x_minor_date_formatter(
    @date.AutoDateFormatter::new()
    .with_scale(
      1.0 / 1440.0,
      @date.Func(fn(_, pos) { "minor<&>" + pos.unwrap_or(-1).to_string() }),
    )
    .as_formatter(),
  )
  assert_true(axes[0].x_axis().minor_date_locator() is Some(_))
  assert_true(axes[0].x_axis().minor_date_formatter() is Some(_))
  let svg = figure.to_svg()
  assert_eq(svg.split(">minor&lt;&amp;&gt;0</text>").to_array().length() - 1, 1)
  axes[1].set_x_tick_labels_visible(false)
  assert_true(!figure.to_svg().contains("minor&lt;&amp;&gt;"))
}

///|
test "minor automatic dates retain DST fold labels on inverted axes" {
  let figure = @scene.figure(width=620, height=280)
  let zone = @tzdb.timezone("America/New_York")
  let first = @date.datetime(2024, 11, 3, hour=5).to_ordinal()
  let last = @date.datetime(2024, 11, 3, hour=6, minute=30).to_ordinal()
  figure.plot([first, last], [0.0, 1.0])
  figure.set_x_date_locator(@date.hour_locator())
  figure.set_x_minor_date_locator(@date.minute_locator(byminute=[0, 30]))
  figure.set_x_minor_date_formatter(
    @date.AutoDateFormatter::new()
    .with_scale(1.0 / 1440.0, @date.Text("%H:%M %Z"))
    .as_formatter(),
  )
  figure.set_x_date_timezone(zone)
  figure.set_x_limits(last, first)
  let svg = figure.to_svg()
  assert_true(svg.contains(">01:30 EDT</text>"))
  assert_true(svg.contains(">01:30 EST</text>"))
  assert_true(!svg.contains(">01:00 EDT</text>"))
}
