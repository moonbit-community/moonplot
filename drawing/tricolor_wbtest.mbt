///|
test "TriColorInfo is optional immutable source identity with distinct nonnegative vertex indices" {
  let p = hit_point(0, 0, 7, 0.0, 0.0, 25.0, 25.0)
  let region = filled_region([[(10.0, 10.0), (90.0, 10.0), (10.0, 90.0)]])
  for vertices in [(0, 2, 1), (2, 2, 1), (-1, 2, 1), (0, 1, -1)] {
    let face = tricolor_info(vertices, vertex_mean=true)
    let info = hit_info(p, Tripcolor, value=5.0, tricolor=Some(face))
    let frame = drawing(100, 100, "", [], targets=[
      hit_target(info, FilledRegion(region), (0.0, 0.0, 100.0, 100.0)),
    ])
    assert_eq(
      frame.hit_test(25.0, 25.0, radius=0.0) is Some(_),
      vertices == (0, 2, 1),
    )
  }
  let plain = hit_info(p, Tripcolor, value=5.0)
  assert_eq(plain.tricolor, None)
  let frame = drawing(100, 100, "", [], targets=[
    hit_target(plain, FilledRegion(region), (0.0, 0.0, 100.0, 100.0)),
  ])
  assert_eq(frame.hit_test(25.0, 25.0, radius=0.0), Some(p))
  assert_eq(tricolor_info((2, 0, 1)).vertex_mean, false)
}
