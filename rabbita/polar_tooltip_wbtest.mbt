///|
test "polar tooltip uses original radian and radius semantics with optional original radar category" {
  let point = @drawing.hit_point(0, 1, 2, 7.0, 0.0, 30.0, 40.0)
  let plain = @drawing.hit_info(point, Polar, value=0.0, series="Original")
  assert_eq(tooltip_kind(Polar), "polar")
  assert_eq(tooltip_rows(plain), [("Theta (rad)", "7"), ("Radius", "0")])
  let radar = @drawing.hit_info(
    point,
    Polar,
    value=0.0,
    series="Radar",
    category=Some("耐力"),
  )
  assert_eq(tooltip_rows(radar), [
    ("Category", "耐力"),
    ("Theta (rad)", "7"),
    ("Radius", "0"),
  ])
}
