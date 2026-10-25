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

///|
test "tripcolor valid extreme anisotropic face retains real area instead of underflowing a different coordinate axis" {
  let fig = figure(width=413, height=307)
  fig.axes().set_axis_off()
  fig.legend([])
  fig.set_x_ticks([])
  fig.set_y_ticks([])
  fig.set_x_limits(-1.0e200, 3.0e200)
  fig.set_y_limits(-1.0e-200, 4.0e-200)
  fig.tripcolor([0.0, 2.0e200, 0.0], [0.0, 0.0, 3.0e-200], [[0, 1, 2]], [37.0])
  let frame = fig.to_drawing()
  println("ANISOTROPIC-SVG:\{frame.svg()}")
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(frame.targets().length(), 1)
  let p = frame.hit_test(160.0, 180.0, radius=0.0).unwrap()
  assert_eq((frame.hit_info(p).unwrap().value, p.point_index), (37.0, 0))
}
