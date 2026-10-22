///|
fn scene_concise_ticks() -> Array[Double] {
  [
    try! @date.datetime(2024, 1, 30).to_ordinal(),
    try! @date.datetime(2024, 2, 2).to_ordinal(),
  ]
}

///|
test "concise labels and shared date text render on both SVG axes" {
  let ticks = scene_concise_ticks()
  let figure = @scene.figure(width=520, height=320)
  figure.plot(ticks, ticks)
  let formatter = @date.concise_date_formatter().as_formatter()
  figure.set_x_date_formatter(formatter)
  figure.set_y_date_formatter(formatter)
  figure.set_x_ticks(ticks)
  figure.set_y_ticks(ticks)
  let svg = figure.to_svg()
  assert_true(svg.contains(">30</text>"))
  assert_true(svg.contains(">02</text>"))
  assert_eq(svg.split(">2024-Feb</text>").to_array().length() - 1, 2)
  assert_true(!svg.contains(">2024-01-30</text>"))
  figure.axes().set_x_tick_labels(["manual-left", "manual-right"])
  let manual = figure.to_svg()
  assert_eq(manual.split(">2024-Feb</text>").to_array().length() - 1, 1)
  figure.axes().set_y_tick_labels_visible(false)
  assert_true(!figure.to_svg().contains(">2024-Feb</text>"))
}

///|
test "SVG date offset recomputes for zoom inversion and explicit format replacement" {
  let ticks = scene_concise_ticks()
  let figure = @scene.figure(width=520, height=280)
  figure.plot(ticks, [0.0, 1.0])
  figure.set_x_date_formatter(@date.concise_date_formatter().as_formatter())
  figure.set_x_limits(ticks[0], ticks[1])
  assert_true(figure.to_svg().contains(">2024-Feb-02</text>"))
  figure.set_x_limits(ticks[1], ticks[0])
  assert_true(figure.to_svg().contains(">2024-Jan-30</text>"))
  figure.axes().set_x_date_format("%Y-%m-%d")
  let explicit = figure.to_svg()
  assert_true(explicit.contains(">2024-01-30</text>"))
  assert_true(!explicit.contains(">2024-Jan-30</text>"))
}

///|
test "shared axes broadcast date formatter configuration and retain it for later series" {
  let figure = @scene.figure(width=520, height=420)
  let axes = figure.subplots(2, 1, share_x=true)
  let ticks = scene_concise_ticks()
  axes[0].set_x_date_formatter(@date.concise_date_formatter().as_formatter())
  for axis in axes {
    assert_true(axis.x_axis().date_formatter() is Some(_))
    axis.plot(ticks, [0.0, 1.0])
  }
  axes[0].set_x_ticks(ticks)
  assert_eq(
    figure.to_svg().split(">2024-Feb</text>").to_array().length() - 1,
    1,
  )
  axes[1].plot_date([@date.datetime(2024, 1, 31)], [0.5])
  assert_true(axes[1].x_axis().date_formatter() is Some(_))
  assert_true(figure.to_svg().contains(">2024-Feb</text>"))
  axes[1].set_x_date_formatter(
    @date.concise_date_formatter(show_offset=false).as_formatter(),
  )
  assert_true(!figure.to_svg().contains(">2024-Feb</text>"))
}

///|
test "shared date formatter fails atomically when a member has category data" {
  let figure = @scene.figure()
  let axes = figure.subplots(1, 2, share_x=true)
  axes[1].x_axis().set_categories(["a", "b"])
  assert_true(
    try {
      axes[0].set_x_date_formatter(@date.date_formatter("%Y"))
      false
    } catch {
      _ => true
    },
  )
  assert_true(axes[0].x_axis().date_format() is None)
  assert_true(axes[0].x_axis().date_formatter() is None)
  assert_eq(axes[1].x_axis().categories(), Some(["a", "b"]))
}

///|
test "concise date labels use transition-aware timezones through SVG" {
  let figure = @scene.figure(width=620, height=280)
  let zone = @tzdb.timezone("America/New_York")
  let dates = [
    @date.datetime(2024, 11, 3, hour=5),
    @date.datetime(2024, 11, 3, hour=6, minute=30),
  ]
  figure.plot_date(dates, [0.0, 1.0])
  figure.set_x_date_locator(@date.minute_locator(byminute=[0, 30]))
  figure.set_x_date_formatter(
    @date.concise_date_formatter(formats=[
      "%Y", "%b", "%d", "%H:%M %Z", "%H:%M %Z", "%S.%f %Z",
    ])
    .with_timezone(zone)
    .as_formatter(),
  )
  let svg = figure.to_svg()
  assert_true(svg.contains(">01:00 EDT</text>"))
  assert_true(svg.contains(">01:00 EST</text>"))
  assert_true(svg.contains(">01:30 EDT</text>"))
  assert_true(svg.contains(">01:30 EST</text>"))
  assert_true(svg.contains(">2024-Nov-03</text>"))
}
