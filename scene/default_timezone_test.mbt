///|
test "default timezone date labels reach shared inverted SVG axes" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("XST-5:45")
  let figure = @scene.figure(width=650, height=440)
  let axes = figure.subplots(2, 1, share_x=true)
  let ticks = [0.0, 1.0 / 24.0]
  for axis in axes {
    axis.plot(ticks, [0.0, 1.0])
  }
  axes[0].set_x_date_format("%H:%M %Z")
  axes[0].set_x_ticks(ticks)
  axes[1].set_x_limits(ticks[1], ticks[0])
  @config.set_timezone("UTC")
  let svg = figure.to_svg()
  assert_eq(svg.split(">05:45 XST</text>").to_array().length() - 1, 1)
  assert_eq(svg.split(">06:45 XST</text>").to_array().length() - 1, 1)
}

///|
test "shared converter preflight follows each axis unit and prevents partial updates" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("UTC")
  let axes = @scene.figure().subplots(2, 1, share_x=true)
  axes[0].set_x_date_offset(345)
  @config.set_timezone("invalid/D12-zone")
  let concise = @date.DateConverter::new(interval_multiples=false)
  axes[0].set_x_date_converter(concise)
  for axis in axes {
    assert_eq(axis.x_axis().date_offset_minutes(), 345)
    assert_true(!axis.x_axis().date_converter().unwrap().interval_multiples())
  }
  // Direct Axis access permits heterogeneous defaults within a shared group.
  @config.set_timezone("UTC")
  axes[0].x_axis().set_date_converter(@date.DateConverter::new())
  axes[1].x_axis().clear_date()
  axes[1].x_axis().set_date()
  @config.set_timezone("invalid/D12-zone")
  assert_true(
    try {
      axes[0].set_x_date_converter(concise)
      false
    } catch {
      _ => true
    },
  )
  assert_true(axes[0].x_axis().date_converter().unwrap().interval_multiples())
  assert_true(axes[1].x_axis().date_converter().unwrap().interval_multiples())
  // Typed date plotting infers an explicit aware UTC unit before date setup.
  let plot = @scene.figure()
  plot.plot_date([@date.datetime(1970, 1, 1)], [1.0])
  assert_eq(plot.x_axis().date_offset_minutes(), 0)
}
