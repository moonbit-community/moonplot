///|
fn overlay_point(
  panel : Int32,
  index : Int32,
  x : Double,
  y : Double,
) -> @drawing.HitPoint {
  @drawing.hit_point(panel, 0, index, x, y, x, y)
}

///|
fn overlay_target(
  point : @drawing.HitPoint,
  shape~ : @drawing.HitShape = Point,
  kind~ : @drawing.HitKind = Line,
) -> @drawing.HitTarget {
  @drawing.hit_target(
    @drawing.hit_info(point, kind, value=point.data_y),
    shape,
    (0.0, 0.0, 400.0, 200.0),
  )
}

///|
test "panel overlays exclude covered point region and XNearest candidates including their edges" {
  let point = overlay_point(0, 0, 300.0, 40.0)
  let overlay = [(0, (240.0, 8.0, 152.0, 32.0))]
  let frame = @drawing.drawing(
    400,
    200,
    "",
    [point],
    targets=[overlay_target(point)],
    exclusions=overlay,
  )
  assert_eq(frame.hit_test(300.0, 24.0, radius=0.0, mode=XNearest), None)
  assert_eq(frame.hit_test(300.0, 40.0, radius=0.0), None)
  assert_eq(frame.hit_test(300.0, 40.0, radius=0.0, mode=XNearest), None)
  assert_eq(frame.hit_test(240.0, 8.0, mode=XNearest), None)
  assert_eq(frame.hit_test(392.0, 40.0, mode=XNearest), None)
  assert_eq(frame.hit_test(239.9, 24.0, radius=0.0, mode=XNearest), Some(point))
  assert_eq(frame.hit_test(300.0, 40.1, radius=0.0, mode=XNearest), Some(point))
  let scatter = @drawing.drawing(
    400,
    200,
    "",
    [],
    targets=[overlay_target(point, kind=Scatter)],
    exclusions=overlay,
  )
  assert_eq(scatter.hit_test(300.0, 40.0), None)
  let region = @drawing.drawing(
    400,
    200,
    "",
    [],
    targets=[
      overlay_target(point, shape=Rectangle(200.0, 0.0, 200.0, 100.0), kind=Bar),
    ],
    exclusions=overlay,
  )
  assert_eq(region.hit_test(300.0, 24.0, radius=0.0), None)
  assert_eq(region.hit_test(300.0, 24.0, radius=0.0, mode=XNearest), None)
  assert_eq(region.hit_test(300.0, 60.0, radius=0.0), Some(point))
}

///|
test "an overlay never blocks another panel at the same screen coordinates" {
  let covered = overlay_point(0, 0, 300.0, 24.0)
  let other = overlay_point(1, 1, 300.0, 24.0)
  let overlay = [(0, (240.0, 8.0, 152.0, 32.0))]
  let targets = [overlay_target(other), overlay_target(covered)]
  let frame = @drawing.drawing(
    400,
    200,
    "",
    [covered, other],
    targets~,
    exclusions=overlay,
  )
  assert_eq(frame.hit_test(300.0, 24.0, radius=0.0), Some(other))
  assert_eq(frame.hit_test(300.0, 24.0, radius=0.0, mode=XNearest), Some(other))
  assert_eq(frame.hit_test(310.0, 25.0, radius=0.0, mode=XNearest), Some(other))
  let regions = @drawing.drawing(
    400,
    200,
    "",
    [],
    targets=[
      overlay_target(other, shape=Rectangle(200.0, 0.0, 200.0, 100.0), kind=Bar),
      overlay_target(
        covered,
        shape=Rectangle(200.0, 0.0, 200.0, 100.0),
        kind=Bar,
      ),
    ],
    exclusions=overlay,
  )
  assert_eq(regions.hit_test(300.0, 24.0, radius=0.0), Some(other))
  let legacy = @drawing.drawing(
    400,
    200,
    "",
    [covered, other],
    exclusions=overlay,
  )
  assert_eq(legacy.hit_test(300.0, 24.0, radius=0.0), Some(other))
  assert_eq(
    legacy.hit_test(300.0, 24.0, radius=0.0, mode=XNearest),
    Some(other),
  )
}

///|
test "exclusion snapshots copy the input array and client mapping keeps overlays aligned" {
  let point = overlay_point(0, 0, 300.0, 24.0)
  let overlays = [(0, (240.0, 8.0, 152.0, 32.0))]
  let frame = @drawing.drawing(
    400,
    200,
    "",
    [point],
    targets=[overlay_target(point)],
    exclusions=overlays,
  )
  overlays[0] = (1, (0.0, 0.0, 400.0, 200.0))
  overlays.clear()
  assert_eq(frame.hit_test(300.0, 24.0, radius=0.0), None)
  assert_eq(frame.hit_test(300.0, 24.0, radius=0.0, mode=XNearest), None)
  assert_eq(
    frame.hit_test_client(
      610.0,
      68.0,
      10.0,
      20.0,
      800.0,
      400.0,
      radius=0.0,
      mode=XNearest,
    ),
    None,
  )
  assert_eq(
    frame.hit_test_client(160.0, 32.0, 10.0, 20.0, 200.0, 100.0, radius=0.0),
    None,
  )
  assert_eq(
    frame.hit_test_client(
      300.0,
      124.0,
      0.0,
      0.0,
      400.0,
      400.0,
      radius=0.0,
      mode=XNearest,
    ),
    None,
  )
  assert_eq(
    frame.hit_test_client(300.0, 99.0, 0.0, 0.0, 400.0, 400.0, mode=XNearest),
    None,
  )
  assert_eq(
    frame.hit_test_client(
      300.0,
      160.0,
      0.0,
      0.0,
      400.0,
      400.0,
      radius=0.0,
      mode=XNearest,
    ),
    Some(point),
  )
  let no_overlay = @drawing.drawing(400, 200, "", [point], targets=[
    overlay_target(point),
  ])
  assert_eq(no_overlay.hit_test(300.0, 24.0, radius=0.0), Some(point))
}

///|
test "legacy point-only drawings also honor panel overlays while invalid exclusions are ignored" {
  let point = overlay_point(0, 0, 300.0, 24.0)
  let frame = @drawing.drawing(400, 200, "", [point], exclusions=[
    (0, (240.0, 8.0, 152.0, 32.0)),
  ])
  assert_eq(frame.hit_test(300.0, 24.0), None)
  assert_eq(frame.hit_test(300.0, 24.0, mode=XNearest), None)
  assert_eq(frame.hit_test_client(600.0, 48.0, 0.0, 0.0, 800.0, 400.0), None)
  for
    rect in [
      (240.0, 8.0, 0.0, 32.0),
      (240.0, 8.0, -152.0, 32.0),
      (0.0 / 0.0, 8.0, 152.0, 32.0),
      (240.0, 8.0, 1.0 / 0.0, 32.0),
    ] {
    let legacy = @drawing.drawing(400, 200, "", [point], exclusions=[(0, rect)])
    assert_eq(legacy.hit_test(300.0, 24.0, radius=0.0), Some(point))
    let rich = @drawing.drawing(
      400,
      200,
      "",
      [point],
      targets=[overlay_target(point)],
      exclusions=[(0, rect)],
    )
    assert_eq(
      rich.hit_test(300.0, 24.0, radius=0.0, mode=XNearest),
      Some(point),
    )
  }
}
