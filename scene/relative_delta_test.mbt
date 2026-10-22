///|
test "calendar-relative month ends reach shared inverted SVG date axes" {
  let start = @date.datetime(2024, 1, 31)
  let dates = [0L, 1L, 2L, 3L].map(months => {
    start.add_relative_delta(@date.RelativeDelta::new(months~))
  })
  let figure = @scene.figure(width=650, height=440)
  let axes = figure.subplots(2, 1, share_x=true)
  for axis in axes {
    axis.plot_date(dates, [0.0, 1.0, 2.0, 3.0])
  }
  axes[0].set_x_date_format("%Y-%m-%d")
  axes[0].set_x_ticks(dates.map(value => value.to_ordinal()))
  axes[1].set_x_limits(dates[3].to_ordinal(), dates[0].to_ordinal())
  let svg = figure.to_svg()
  for date in ["2024-01-31", "2024-02-29", "2024-03-31", "2024-04-30"] {
    assert_eq(svg.split(">" + date + "</text>").to_array().length() - 1, 1)
  }
}
