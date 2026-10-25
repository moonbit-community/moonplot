///|
fn polar_test_target(panel : Int32, kind : HitKind) -> HitTarget {
  let point = hit_point(panel, 0, 0, 7.0, 2.0, 50.0, 50.0)
  hit_target(hit_info(point, kind, value=2.0), Point, (0.0, 0.0, 100.0, 100.0))
}

///|
test "polar circles admit each panel independently in both modes and cannot become a selectable disk" {
  let target = polar_test_target(0, Polar)
  let normal = polar_test_target(1, Scatter)
  let circles = [(0, (50.0, 50.0, 20.0))]
  let frame = drawing(
    100,
    100,
    "",
    [target.info.point],
    targets=[target],
    polar_circles=circles,
  )
  circles[0] = (0, (0.0, 0.0, 1.0))
  assert_eq(frame.polar_circle(0), Some((50.0, 50.0, 20.0)))
  for mode in [Nearest, XNearest] {
    assert_eq(
      frame.hit_test(50.0, 50.0, radius=0.0, mode~),
      Some(target.info.point),
    )
    assert_eq(frame.hit_test(30.0, 30.0, radius=1.0e9, mode~), None)
    assert_eq(
      frame.hit_test(70.0, 50.0, radius=20.0, mode~),
      Some(target.info.point),
    )
    assert_eq(frame.hit_test(70.0001, 50.0, radius=1.0e9, mode~), None)
    let mixed = drawing(100, 100, "", [], targets=[target, normal], polar_circles=[
      (0, (50.0, 50.0, 20.0)),
    ])
    assert_eq(
      mixed.hit_test(30.0, 30.0, radius=1.0e9, mode~),
      Some(normal.info.point),
    )
  }
  let empty = drawing(100, 100, "", [], polar_circles=[(0, (50.0, 50.0, 20.0))])
  assert_eq(empty.hit_test(50.0, 50.0, radius=1.0e9), None)
}

///|
test "invalid conflicting or absent required circles fail closed while old and clipped legacy points retain their policy" {
  let target = polar_test_target(0, Polar)
  for
    records in [
      [],
      [(0, (50.0, 50.0, 0.0))],
      [(0, (0.0 / 0.0, 50.0, 20.0))],
      [(0, (50.0, 50.0, 20.0)), (0, (51.0, 50.0, 20.0))],
      [
        (0, (50.0, 50.0, 20.0)),
        (0, (50.0, 50.0, -1.0)),
        (0, (50.0, 50.0, 20.0)),
      ],
    ] {
    let frame = drawing(
      100,
      100,
      "",
      [target.info.point],
      targets=[target],
      polar_circles=records,
    )
    assert_eq(frame.polar_circle(0), None)
    for mode in [Nearest, XNearest] {
      assert_eq(frame.hit_test(50.0, 50.0, radius=1.0e9, mode~), None)
    }
  }
  let repeated = drawing(100, 100, "", [], targets=[target], polar_circles=[
    (0, (50.0, 50.0, 20.0)),
    (0, (50.0, 50.0, 20.0)),
  ])
  assert_true(repeated.hit_test(50.0, 50.0) is Some(_))
  let legacy = drawing(100, 100, "", [target.info.point], polar_circles=[
    (0, (50.0, 50.0, 20.0)),
  ])
  assert_eq(legacy.hit_test(30.0, 30.0, radius=1.0e9), None)
  assert_eq(legacy.hit_test(50.0, 50.0, radius=0.0), Some(target.info.point))
  let old = drawing(100, 100, "", [target.info.point])
  assert_eq(old.hit_test(30.0, 30.0, radius=1.0e9), Some(target.info.point))
}
