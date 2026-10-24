///|
test "basic single charts accept constant data with default ticks" {
  let line = @mathplotlib.figure(width=360, height=240)
  line.plot([0.0, 1.0, 2.0], [2.0, 2.0, 2.0], label="constant")
  line.set_legend_position(@mathplotlib.LegendPosition::LowerRight)
  assert_eq(line.legend_position(), @mathplotlib.LegendPosition::LowerRight)
  let scatter = @mathplotlib.figure(width=360, height=240)
  scatter.scatter([@mathplotlib.point(1.0, 2.0)])
  let bar = @mathplotlib.figure(width=360, height=240)
  bar.grid(axis="y")
  bar.bar_category(["A", "B"], [3.0, 3.0])
  for fig in [line, scatter, bar] {
    let svg = fig.to_svg_checked()
    assert_true(svg.contains("<svg"))
    assert_true(svg.contains("</svg>"))
    assert_true(!svg.contains("NaN"))
    assert_true(!svg.contains("Infinity"))
  }
}
