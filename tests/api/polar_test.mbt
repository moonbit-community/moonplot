///|
test "facade polar and radar typed APIs keep source arrays unclosed and return polar observations" {
  let figure = @mathplotlib.figure(width=400, height=300)
  let panel : @mathplotlib.PolarAxes = figure.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  let direction : @mathplotlib.PolarDirection = Clockwise
  panel.set_direction(direction)
  panel.set_theta_offset(1.5707963267948966)
  panel.set_radius_max(10.0)
  panel.radar([3.0, 8.0, 5.0], ["One", "Two", "Three"])
  panel.scatter([0.0], [5.0], size=4.0)
  panel.legend([])
  guard figure.axes_list()[0].artists()[0] is Line(points, _) else {
    fail("Line")
  }
  assert_eq(points.length(), 3)
  let frame = figure.to_drawing()
  assert_eq(frame.svg(), figure.to_svg_checked())
  assert_eq(frame.targets().length(), 4)
  let point = frame.hit_test(200.0, 150.0, radius=1.0e6).unwrap()
  assert_eq(frame.hit_info(point).unwrap().kind, Polar)
  assert_true(frame.polar_circle(0) is Some(_))
  figure.clear_checked()
  panel.plot([0.0, 1.0], [1.0, 2.0])
  assert_true(figure.to_svg_checked().contains("clipPath"))
}
