///|
test "original collinear tripcolor is static even when screen rounding creates a tiny false triangle" {
  let fig = figure(width=413, height=307)
  fig.axes().set_axis_off()
  fig.set_x_limits(-0.25, 2.25)
  fig.set_y_limits(-0.25, 2.25)
  fig.tripcolor([0.0, 1.0, 2.0], [0.0, 1.0, 2.0], [[0, 1, 2]], [8.0])
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  println("COLLINEAR-SVG:\{frame.svg()}")
  assert_true(frame.svg().contains("<polygon"))
  assert_eq(frame.targets().length(), 0)
}
