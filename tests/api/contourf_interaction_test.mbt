///|
test "facade filled-region factory exposes immutable copied rings without mutable fields" {
  let rings = [[(10.0, 10.0), (90.0, 10.0), (90.0, 90.0), (10.0, 90.0)]]
  let region : @mathplotlib.FilledRegion = @mathplotlib.filled_region(
    rings,
    even_odd=true,
  )
  rings[0].clear()
  region.rings()[0].clear()
  assert_eq(region.rings()[0].length(), 4)
  assert_true(region.even_odd())
}

///|
test "facade contourf typed region returns scalar band rather than sampled grid metadata" {
  let fig = @mathplotlib.figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 1.0)
  ax.set_y_limits(0.0, 1.0)
  let result = ax.contourf(
    [[0.0, 0.0], [2.0, 2.0]],
    levels=[0.0, 2.0],
    label="Band",
  )
  assert_eq(result.layers(), [1.0])
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), 1)
  let p = frame.hit_test(200.0, 150.0, radius=0.0).unwrap()
  let info : @mathplotlib.HitInfo = frame.hit_info(p).unwrap()
  assert_eq(
    (info.kind, info.series, info.interval, info.value, p.point_index),
    (@mathplotlib.HitKind::ContourF, "Band", Some((0.0, 2.0)), 1.0, 0),
  )
}
