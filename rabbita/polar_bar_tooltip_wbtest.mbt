///|
test "polar bars default to original radians and radius without Cartesian or pie rows" {
  let point = @drawing.hit_point(0, 0, 2, 7.0, 2.0, 50.0, 50.0)
  let info = @drawing.hit_info(point, PolarBar, value=2.0, series="Rose")
  assert_eq(tooltip_kind(info.kind), "polar-bar")
  assert_eq(tooltip_rows(info), [("Theta (rad)", "7"), ("Radius", "2")])
}
