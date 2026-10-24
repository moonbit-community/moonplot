///|
test "default grid selection accepts a single axis through axes and figure" {
  let fig = @scene.figure(width=240, height=180)
  let ax = fig.axes()
  try! ax.grid(visible=false)
  try! ax.grid(axis="y", color="#123456", linewidth=0.7)
  assert_true(!ax.x_axis().grid_visible())
  assert_true(ax.y_axis().grid_visible())
  try! fig.grid(visible=false, axis="y")
  assert_true(!ax.y_axis().grid_visible())
  try! fig.grid(axis="x", color="#abcdef")
  assert_true(ax.x_axis().grid_visible())
  assert_true(!ax.y_axis().grid_visible())
  assert_true(fig.to_svg().contains("#abcdef"))
}

///|
test "single axis grid selection propagates only through its shared group" {
  let fig = @scene.figure(width=400, height=220)
  let panels = try! fig.subplots(1, 2, share_y=true)
  try! panels[0].grid(visible=false)
  try! panels[1].grid(visible=false)
  try! panels[0].grid(axis="y")
  for panel in panels {
    assert_true(!panel.x_axis().grid_visible())
    assert_true(panel.y_axis().grid_visible())
  }
}

///|
test "everyday line scatter and category bar panels render together" {
  let fig = @scene.figure(width=1080, height=360)
  let panels = try! fig.subplots(1, 3)
  try! fig.subplots_adjust(
    left=0.065,
    right=0.97,
    bottom=0.19,
    top=0.80,
    wspace=0.38,
  )
  fig.suptitle("mathplotlib | everyday charts")
  let line = panels[0]
  line.set_title("Line")
  line.set_x_label("time")
  line.set_y_label("value")
  try! line.grid(visible=true, color="#e2e8f0", linewidth=0.7)
  line.plot(
    [0.0, 1.0, 2.0, 3.0, 4.0],
    [1.0, 2.4, 1.8, 3.2, 4.0],
    color="#2563eb",
  )
  line.plot(
    [0.0, 1.0, 2.0, 3.0, 4.0],
    [0.7, 1.3, 2.1, 2.0, 2.8],
    color="#f97316",
  )
  let scatter = panels[1]
  scatter.set_title("Scatter")
  scatter.set_x_label("x")
  scatter.set_y_label("y")
  try! scatter.grid(visible=true, color="#e2e8f0", linewidth=0.7)
  scatter.scatter(
    [
      @core.point(1.0, 1.2),
      @core.point(1.5, 2.0),
      @core.point(2.0, 1.7),
      @core.point(2.5, 3.1),
      @core.point(3.0, 2.6),
      @core.point(3.5, 3.8),
      @core.point(4.0, 3.4),
    ],
    color="#16a34a",
  )
  let bar = panels[2]
  bar.set_title("Bar")
  bar.set_x_label("category")
  bar.set_y_label("count")
  try! bar.grid(visible=true, axis="y", color="#e2e8f0", linewidth=0.7)
  try! bar.bar_category(
    ["A", "B", "C", "D"],
    [3.0, 5.0, 4.0, 7.0],
    color="#f97316",
  )
  let svg = try! fig.to_svg_checked()
  assert_true(svg.contains("<svg"))
  assert_true(svg.contains("</svg>"))
  for title in ["Line", "Scatter", "Bar", "A", "B", "C", "D"] {
    assert_true(svg.contains(">" + title + "<"))
  }
  assert_eq(svg.split("<polyline").count() - 1, 2)
  assert_eq(svg.split("<circle").count() - 1, 7)
  assert_true(!bar.x_axis().grid_visible())
  assert_true(bar.y_axis().grid_visible())
}
