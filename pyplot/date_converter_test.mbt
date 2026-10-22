///|
test "pyplot date converter configures x and y labels with copied defaults" {
  @pyplot.close()
  ignore(@pyplot.figure(width=620, height=340))
  let ticks = [
    @date.datetime(2024, 1, 30).to_ordinal(),
    @date.datetime(2024, 1, 31).to_ordinal(),
  ]
  @pyplot.plot(ticks, ticks)
  let converter = @date.ConciseDateConverter::new(show_offset=false).as_converter()
  @pyplot.xaxis_date_converter(converter)
  @pyplot.yaxis_date_converter(converter)
  @pyplot.gca().set_x_ticks(ticks)
  @pyplot.gca().set_y_ticks(ticks)
  let svg = @pyplot.render_svg()
  assert_eq(svg.split(">30</text>").to_array().length() - 1, 2)
  assert_eq(svg.split(">31</text>").to_array().length() - 1, 2)
  assert_true(!svg.contains(">2024-Jan</text>"))
  @pyplot.close()
}
