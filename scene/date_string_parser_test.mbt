///|
test "parsed string instants reach shared inverted SVG date axes across a DST fold" {
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock=fn() {
      1781524800000L
    }),
  )
  let ticks = @date.datestrs2num(
    ["2024-11-03 01:30 EDT", "2024-11-03 01:30 EST"],
    parser~,
  )
  assert_true(Double::abs((ticks[1] - ticks[0]) * 24.0 - 1.0) < 1.0e-9)
  let figure = @scene.figure(width=650, height=440)
  let axes = figure.subplots(2, 1, share_x=true)
  for axis in axes {
    axis.plot(ticks, [0.0, 1.0])
  }
  axes[0].set_x_date_format("%I:%M %p %Z")
  axes[0].set_x_date_timezone(@tzdb.timezone("America/New_York"))
  axes[0].set_x_ticks(ticks)
  axes[1].set_x_limits(ticks[1], ticks[0])
  let svg = figure.to_svg()
  assert_eq(svg.split(">01:30 AM EDT</text>").to_array().length() - 1, 1)
  assert_eq(svg.split(">01:30 AM EST</text>").to_array().length() - 1, 1)
}
