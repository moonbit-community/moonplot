///|
test "rc concise converter renders default date plot and empty plots enable date mode" {
  @config.reset()
  @config.set_date_converter("concise")
  let figure = @scene.figure(width=620, height=300)
  figure.plot_date([], [])
  @config.reset()
  assert_true(figure.x_axis().date_converter() is Some(_))
  let empty = figure.to_svg()
  assert_true(empty.contains(">Jan-01</text>"))
  assert_true(empty.contains(">1970-Jan-02</text>"))
  figure.plot_date([@date.datetime(2024, 1, 30), @date.datetime(2024, 2, 2)], [
    0.0, 1.0,
  ])
  let svg = figure.to_svg()
  assert_true(svg.contains(">Jan-30</text>"))
  assert_true(svg.contains(">2024-Feb-02</text>"))
  assert_true(!svg.contains(">2024-01-30</text>"))
}

///|
test "explicit concise converter config crosses shared axes and retains later series" {
  let figure = @scene.figure(width=620, height=440)
  let axes = figure.subplots(2, 1, share_x=true)
  let converter = @date.ConciseDateConverter::new(offset_formats=[
    "", "%Y", "%Y-%m", "shared<&>", "shared<&>", "shared<&>",
  ]).as_converter()
  axes[1].set_x_date_converter(converter)
  axes[0].set_x_limits(
    @date.datetime(2024, 1, 30).to_ordinal(),
    @date.datetime(2024, 2, 2).to_ordinal(),
  )
  for axis in axes {
    axis.plot_date([@date.datetime(2024, 1, 31)], [0.5])
  }
  let svg = figure.to_svg()
  assert_eq(svg.split(">shared&lt;&amp;&gt;</text>").to_array().length() - 1, 1)
  axes[1].set_x_date_format("%Y-%m-%d")
  assert_true(!figure.to_svg().contains("shared&lt;&amp;&gt;"))
}

///|
test "shared converter rejects invalid formats and category conflicts before changing members" {
  let figure = @scene.figure()
  let axes = figure.subplots(1, 2, share_y=true)
  assert_true(
    try {
      axes[0].set_y_date_converter(
        @date.ConciseDateConverter::new(formats=["bad"]).as_converter(),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(axes[0].y_axis().date_converter() is None)
  assert_true(axes[1].y_axis().date_converter() is None)
  axes[1].y_axis().set_categories(["a"])
  assert_true(
    try {
      axes[0].set_y_date_converter(@date.DateConverter::new())
      false
    } catch {
      _ => true
    },
  )
  assert_true(axes[0].y_axis().date_converter() is None)
  assert_eq(axes[1].y_axis().categories(), Some(["a"]))
}
