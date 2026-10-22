///|
test "pyplot renders general date strings after their shared epoch conversion" {
  @pyplot.close()
  ignore(@pyplot.figure(width=600, height=300))
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock=fn() { 1781524800000L }),
  )
  let ticks = @date.datestrs2num(
    ["January 1, 2024 12 am", "2 Jan 2024 1 pm"],
    parser~,
  )
  @pyplot.plot(ticks, [0.0, 1.0])
  @pyplot.xaxis_date(format="%Y-%m-%d %I %p")
  @pyplot.gca().set_x_ticks(ticks)
  let svg = @pyplot.render_svg()
  assert_true(svg.contains(">2024-01-01 12 AM</text>"))
  assert_true(svg.contains(">2024-01-02 01 PM</text>"))
  @pyplot.close()
}
