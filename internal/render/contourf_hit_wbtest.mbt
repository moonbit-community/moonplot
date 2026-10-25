///|
test "contourf immutable band snapshot guards outer inner and content identity once without field copies" {
  let ring = [
    @core.point(0.0, 0.0),
    @core.point(2.0, 0.0),
    @core.point(0.0, 2.0),
  ]
  let rings = [ring]
  let data = contourf_hit_data(rings, 3, -0.5, 1.5, "Band")
  assert_true(data.matches_rings(rings))
  assert_true(data.matches_polygon(ring))
  assert_true(!data.matches_rings(rings.copy()))
  assert_true(!data.matches_polygon(ring.copy()))
  assert_true(!physical_equal(data.expected[0], ring))
  rings[0] = ring.copy()
  assert_true(!data.matches_rings(rings))
  rings[0] = ring
  ring[0] = @core.point(0.0, 1.0)
  assert_true(!data.matches_rings(rings))
  assert_eq(
    (data.slot(), data.interval(), data.value(), data.series()),
    (3, (-0.5, 1.5), 0.5, "Band"),
  )
  let disabled = data.invalidated()
  assert_true(!disabled.enabled())
  assert_true(physical_equal(data.expected, disabled.expected))
  assert_true(!disabled.matches_polygon(ring))
}

///|
test "contourf scalar representative preserves finite legacy values and safely handles overflowing finite endpoint addition" {
  let ring = [
    @core.point(0.0, 0.0),
    @core.point(2.0, 0.0),
    @core.point(0.0, 2.0),
  ]
  for (lower, upper) in [(-0.25, 0.5), (0.5, 1.5), (-1.0e308, 1.0e308)] {
    let data = contourf_hit_data([ring], 0, lower, upper, "Band")
    assert_eq(data.value(), (lower + upper) / 2.0)
  }
  let large = contourf_hit_data([ring], 4, 1.0e308, 1.2e308, "Large")
  assert_eq(large.interval(), (1.0e308, 1.2e308))
  assert_eq(large.value(), 1.1e308)
  assert_true(!large.value().is_inf())
}
