///|
fn polar_bar_test_target(index : Int32, shape : HitShape) -> HitTarget {
  let point = hit_point(0, index, 0, 7.0, 2.0, 220.0, 129.0)
  hit_target(
    hit_info(point, PolarBar, value=2.0, series="Rose"),
    shape,
    (100.0, 50.0, 200.0, 160.0),
  )
}

///|
test "polar bar sector radial arithmetic keeps the painted fractional boundary" {
  let cx = 200.0
  let cy = 129.0
  let r = 43.8
  let target = polar_bar_test_target(0, Sector(cx, cy, r, 120.0, 120.0))
  let frame = drawing(400, 240, "", [], targets=[target], polar_circles=[
    (0, (cx, cy, r)),
  ])
  for mode in [Nearest, XNearest] {
    assert_eq(
      frame.hit_test(cx - r, cy, radius=0.0, mode~),
      Some(target.info.point),
    )
    assert_eq(frame.hit_test(cx - r - 1.0e-8, cy, radius=1.0e9, mode~), None)
  }
}

///|
test "polar bar requires its own valid circle for areas and nearest candidates" {
  for shape in [Sector(200.0, 129.0, 40.0, -20.0, 40.0), Point] {
    let target = polar_bar_test_target(0, shape)
    for
      records in [
        [],
        [(0, (200.0, 129.0, 0.0))],
        [(0, (200.0, 129.0, 45.0)), (0, (201.0, 129.0, 45.0))],
      ] {
      let frame = drawing(
        400,
        240,
        "",
        [target.info.point],
        targets=[target],
        polar_circles=records,
      )
      for mode in [Nearest, XNearest] {
        assert_eq(frame.hit_test(220.0, 129.0, radius=1.0e9, mode~), None)
      }
    }
  }
}

///|
test "polar bar area only admits later physically nearby polar point overlays" {
  let area = polar_bar_test_target(0, Sector(200.0, 129.0, 40.0, 0.0, 360.0))
  let point = hit_point(0, 1, 2, 0.0, 0.4, 220.0, 129.0)
  let overlay = hit_target(
    hit_info(point, Polar, value=0.4),
    Point,
    area.bounds,
  )
  for mode in [Nearest, XNearest] {
    let front = drawing(400, 240, "", [], targets=[area, overlay], polar_circles=[
      (0, (200.0, 129.0, 43.8)),
    ])
    assert_eq(front.hit_test(220.0, 129.0, radius=0.0, mode~), Some(point))
    assert_eq(
      front.hit_test(210.0, 129.0, radius=1.0, mode~),
      Some(area.info.point),
    )
    let behind = drawing(400, 240, "", [], targets=[overlay, area], polar_circles=[
      (0, (200.0, 129.0, 43.8)),
    ])
    assert_eq(
      behind.hit_test(220.0, 129.0, radius=0.0, mode~),
      Some(area.info.point),
    )
    let old_area = { ..area, info: hit_info(area.info.point, Pie, value=2.0), }
    let pie = drawing(400, 240, "", [], targets=[old_area, overlay], polar_circles=[
      (0, (200.0, 129.0, 43.8)),
    ])
    assert_eq(
      pie.hit_test(220.0, 129.0, radius=0.0, mode~),
      Some(old_area.info.point),
    )
  }
}

///|
test "polar bar angular edges and full disk keep a fixed intrinsic boundary" {
  let cx = 200.0
  let cy = 129.0
  let r = 43.8
  let pi = @math.PI
  for
    (start, sweep) in [
      (-30.0, 60.0),
      (330.0, 60.0),
      (120.0, 120.0),
      (89.0, 0.5),
    ] {
    let target = polar_bar_test_target(0, Sector(cx, cy, r, start, sweep))
    let frame = drawing(400, 240, "", [], targets=[target], polar_circles=[
      (0, (cx, cy, r)),
    ])
    for mode in [Nearest, XNearest] {
      for degrees in [start, start + sweep] {
        let angle = degrees * pi / 180.0
        assert_eq(
          frame.hit_test(
            cx + r * 0.8 * @math.cos(angle),
            cy - r * 0.8 * @math.sin(angle),
            radius=0.0,
            mode~,
          ),
          Some(target.info.point),
        )
      }
      let outside = (start + sweep + 1.0e-6) * pi / 180.0
      assert_eq(
        frame.hit_test(
          cx + r * 0.8 * @math.cos(outside),
          cy - r * 0.8 * @math.sin(outside),
          radius=1.0e9,
          mode~,
        ),
        None,
      )
    }
  }
  let a = polar_bar_test_target(0, Sector(cx, cy, r, 0.0, 360.0))
  let b = polar_bar_test_target(1, Sector(cx, cy, r, 0.0, 360.0))
  let full = drawing(400, 240, "", [], targets=[a, b], polar_circles=[
    (0, (cx, cy, r)),
  ])
  for mode in [Nearest, XNearest] {
    for (x, y) in [(cx - r, cy), (cx + r, cy), (cx, cy - r), (cx, cy + r)] {
      assert_eq(full.hit_test(x, y, radius=0.0, mode~), Some(b.info.point))
    }
  }
  // Identical legacy geometry retains its strict radial behavior.
  let old = { ..a, info: hit_info(a.info.point, Pie, value=2.0), }
  let pie = drawing(400, 240, "", [], targets=[old], polar_circles=[
    (0, (cx, cy, r)),
  ])
  assert_eq(pie.hit_test(cx - r, cy, radius=1.0e9), None)
}

///|
test "polar bar actual circle edge survives independently rounded rectangular bounds" {
  let cx = 200.0
  let cy = 129.0
  let radius = 43.8
  let point = hit_point(0, 0, 0, 0.0, 1.0, cx + radius / 2.0, cy)
  let target = hit_target(
    hit_info(point, PolarBar, value=1.0),
    Sector(cx, cy, radius, 0.0, 360.0),
    (156.2, 85.2, 87.6, 87.6),
  )
  assert_true(target.bounds.0 + target.bounds.2 < cx + radius)
  let frame = drawing(400, 240, "", [], targets=[target], polar_circles=[
    (0, (cx, cy, radius)),
  ])
  for mode in [Nearest, XNearest] {
    for
      (x, y) in [
        (cx + radius, cy),
        (cx - radius, cy),
        (cx, cy + radius),
        (cx, cy - radius),
      ] {
      assert_eq(frame.hit_test(x, y, radius=0.0, mode~), Some(point))
    }
    assert_eq(
      frame.hit_test(cx + radius + 1.0e-8, cy, radius=1.0e9, mode~),
      None,
    )
  }
}
