///|
fn sample(
  index : Int32,
  x : Double,
  y : Double,
  panel~ : Int32 = 0,
) -> @drawing.HitPoint {
  @drawing.hit_point(panel, 0, index, x, y, x, y)
}

///|
fn target(
  point : @drawing.HitPoint,
  shape : @drawing.HitShape,
  kind~ : @drawing.HitKind = Bar,
  bounds~ : (Double, Double, Double, Double) = (10.0, 10.0, 80.0, 80.0),
) -> @drawing.HitTarget {
  @drawing.hit_target(
    @drawing.hit_info(point, kind, value=point.data_y),
    shape,
    bounds,
  )
}

///|
test "semantic targets are immutable frame snapshots and metadata lookup uses exact points" {
  let point = sample(4, 20.0, 30.0)
  let info = @drawing.hit_info(
    point,
    Histogram,
    series="observations",
    category=Some("bin 4"),
    value=8.0,
    interval=Some((1.0, 2.0)),
    fraction=Some(0.25),
  )
  let hit = @drawing.hit_target(
    info,
    Rectangle(15.0, 20.0, 10.0, 30.0),
    (10.0, 10.0, 80.0, 80.0),
  )
  let points = [point]
  let incoming = [hit]
  let frame = @drawing.drawing(100, 100, "unchanged", points, targets=incoming)
  points.clear()
  incoming.clear()
  let returned = frame.targets()
  returned.clear()
  assert_eq(frame.targets(), [hit])
  assert_eq(frame.points(), [point])
  assert_eq(frame.svg(), "unchanged")
  assert_eq(frame.hit_info(point), Some(info))
  assert_eq(frame.hit_info(sample(4, 20.0, 30.1)), None)
  assert_eq(@drawing.drawing(100, 100, "", [point]).hit_info(point), None)
  assert_eq(info.series, "observations")
  assert_eq(info.category, Some("bin 4"))
  assert_eq(info.interval, Some((1.0, 2.0)))
  assert_eq(info.fraction, Some(0.25))
  let updated = @drawing.drawing(100, 100, "", [], targets=[
    target(sample(4, 20.0, 40.0), Rectangle(15.0, 20.0, 10.0, 40.0)),
  ])
  assert_eq(updated.hit_info(point), None)
  assert_eq(frame.hit_info(point), Some(info))
}

///|
test "rectangle hits cover positive and negative-valued bars and clip to displayed panel" {
  let positive = sample(0, 30.0, 20.0)
  let negative = @drawing.hit_point(0, 1, 0, -8.0, 40.0, 60.0, 70.0)
  let frame = @drawing.drawing(100, 100, "", [positive, negative], targets=[
    target(positive, Rectangle(20.0, 20.0, 20.0, 40.0)),
    target(negative, Rectangle(50.0, 40.0, 60.0, 30.0), kind=BarH),
  ])
  assert_eq(frame.hit_test(25.0, 55.0, radius=0.0), Some(positive))
  assert_eq(frame.hit_test(20.0, 20.0, radius=0.0), Some(positive))
  assert_eq(frame.hit_test(40.0, 60.0, radius=0.0), Some(positive))
  assert_eq(frame.hit_test(80.0, 50.0, radius=0.0), Some(negative))
  assert_eq(frame.hit_test(90.0, 70.0, radius=0.0), Some(negative))
  assert_eq(frame.hit_test(90.1, 60.0, radius=1000.0), None)
  assert_eq(frame.hit_test(19.9, 50.0, radius=1000.0), None)
  assert_eq(frame.hit_test(30.0, 70.0, radius=1000.0), None)
}

///|
test "overlapping areas pick the last painted target before nearer point anchors" {
  let bottom = sample(0, 30.0, 20.0)
  let top = sample(1, 40.0, 20.0)
  let marker = sample(2, 35.0, 40.0)
  let lower = target(bottom, Rectangle(20.0, 20.0, 30.0, 50.0))
  let upper = target(top, Rectangle(30.0, 20.0, 30.0, 50.0))
  let dot = target(marker, Point, kind=Scatter)
  let frame = @drawing.drawing(100, 100, "", [bottom, top, marker], targets=[
    lower, upper, dot,
  ])
  assert_eq(frame.hit_test(35.0, 40.0), Some(top))
  assert_eq(frame.hit_test(25.0, 40.0), Some(bottom))
  let reordered = @drawing.drawing(100, 100, "", [bottom, top, marker], targets=[
    upper, lower, dot,
  ])
  assert_eq(reordered.hit_test(35.0, 40.0, mode=XNearest), Some(bottom))
}

///|
test "pie sectors wrap through zero use mathematical CCW screen coordinates and include edges" {
  let crossing = sample(0, 50.0, 50.0)
  let upper_left = sample(1, 49.0, 49.0)
  let frame = @drawing.drawing(100, 100, "", [], targets=[
    target(crossing, Sector(50.0, 50.0, 30.0, 315.0, 90.0), kind=Pie),
    target(upper_left, Sector(50.0, 50.0, 30.0, 90.0, 90.0), kind=Pie),
  ])
  assert_eq(frame.hit_test(75.0, 50.0, radius=0.0), Some(crossing))
  assert_eq(frame.hit_test(70.0, 30.0, radius=0.0), Some(crossing))
  assert_eq(frame.hit_test(70.0, 70.0, radius=0.0), Some(crossing))
  assert_eq(frame.hit_test(30.0, 30.0, radius=0.0), Some(upper_left))
  assert_eq(frame.hit_test(50.0, 20.0, radius=0.0), Some(upper_left))
  assert_eq(frame.hit_test(20.0, 50.0, radius=0.0), Some(upper_left))
  assert_eq(frame.hit_test(50.0, 50.0, radius=0.0), Some(upper_left))
  assert_eq(frame.hit_test(50.0, 80.0, radius=100.0), None)
  assert_eq(frame.hit_test(81.0, 50.0, radius=100.0), None)
  let full = @drawing.drawing(100, 100, "", [], targets=[
    target(crossing, Sector(50.0, 50.0, 30.0, -720.0, 360.0), kind=Pie),
  ])
  assert_eq(full.hit_test(50.0, 80.0), Some(crossing))
  let negative_start = @drawing.drawing(100, 100, "", [], targets=[
    target(crossing, Sector(50.0, 50.0, 30.0, -45.0, 90.0), kind=Pie),
  ])
  assert_eq(negative_start.hit_test(75.0, 50.0), Some(crossing))
  assert_eq(negative_start.hit_test(25.0, 50.0), None)
}

///|
test "XNearest snaps only line samples by X then Y and stays inside their current panel" {
  let early = sample(0, 20.0, 20.0)
  let middle_far = sample(1, 50.0, 20.0)
  let middle_near = sample(2, 50.0, 70.0)
  let late = sample(3, 80.0, 50.0)
  let frame = @drawing.drawing(
    200,
    100,
    "",
    [early, middle_far, middle_near, late],
    targets=[
      target(early, Point, kind=Line),
      target(middle_far, Point, kind=Line),
      target(middle_near, Point, kind=Line),
      target(late, Point, kind=Line),
    ],
  )
  assert_eq(frame.hit_test(48.0, 85.0, radius=0.0), None)
  assert_eq(
    frame.hit_test(48.0, 85.0, radius=0.0, mode=XNearest),
    Some(middle_near),
  )
  assert_eq(
    frame.hit_test(48.0, 15.0, radius=0.0, mode=XNearest),
    Some(middle_far),
  )
  assert_eq(frame.hit_test(10.0, 90.0, radius=0.0, mode=XNearest), Some(early))
  assert_eq(frame.hit_test(9.9, 50.0, mode=XNearest), None)
  assert_eq(frame.hit_test(50.0, 9.9, mode=XNearest), None)
  assert_eq(frame.hit_test(100.0, 50.0, mode=XNearest), None)
  let other = sample(4, 130.0, 50.0, panel=1)
  let two_panels = @drawing.drawing(200, 100, "", [], targets=[
    target(early, Point, kind=Line),
    target(other, Point, kind=Line, bounds=(110.0, 10.0, 80.0, 80.0)),
  ])
  assert_eq(
    two_panels.hit_test(120.0, 80.0, radius=0.0, mode=XNearest),
    Some(other),
  )
  assert_eq(two_panels.hit_test(100.0, 50.0, radius=100.0, mode=XNearest), None)
  let tied = @drawing.drawing(100, 100, "", [], targets=[
    target(middle_far, Point, kind=Line),
    target(middle_near, Point, kind=Line),
  ])
  assert_eq(
    tied.hit_test(45.0, 45.0, radius=0.0, mode=XNearest),
    Some(middle_far),
  )
}

///|
test "point radius hits precede XNearest and scatter never gets distant X snapping" {
  let line = sample(0, 50.0, 20.0)
  let scatter = sample(1, 56.0, 80.0)
  let frame = @drawing.drawing(100, 100, "", [], targets=[
    target(line, Point, kind=Line),
    target(scatter, Point, kind=Scatter),
  ])
  assert_eq(frame.hit_test(50.0, 80.0, mode=XNearest), Some(scatter))
  assert_eq(frame.hit_test(50.0, 80.0, radius=0.0, mode=XNearest), Some(line))
  let scatter_only = @drawing.drawing(100, 100, "", [], targets=[
    target(scatter, Point, kind=Scatter),
  ])
  assert_eq(scatter_only.hit_test(50.0, 20.0, mode=XNearest), None)
  assert_eq(scatter_only.hit_test(50.0, 80.0, mode=XNearest), Some(scatter))
  let clipped = @drawing.drawing(100, 100, "", [], targets=[
    target(sample(2, 100.0, 50.0), Point, kind=Line),
  ])
  assert_eq(clipped.hit_test(80.0, 50.0, radius=100.0, mode=XNearest), None)
}

///|
test "shape queries and geometry reject nonfinite or invalid values without losing valid targets" {
  let good = sample(0, 20.0, 30.0)
  let nan = 0.0 / 0.0
  let inf = 1.0 / 0.0
  let valid = target(good, Rectangle(10.0, 10.0, 30.0, 30.0))
  let invalid_shapes : Array[@drawing.HitShape] = [
    Rectangle(10.0, 10.0, -10.0, 30.0),
    Rectangle(10.0, 10.0, 0.0, 30.0),
    Rectangle(nan, 10.0, 30.0, 30.0),
    Rectangle(10.0, inf, 30.0, 30.0),
    Rectangle(1.0e308, 10.0, 1.0e308, 30.0),
    Sector(20.0, 30.0, inf, 0.0, 45.0),
    Sector(20.0, nan, 10.0, 0.0, 45.0),
    Sector(20.0, 30.0, 0.0, 0.0, 45.0),
    Sector(20.0, 30.0, 10.0, nan, 45.0),
    Sector(20.0, 30.0, 10.0, 0.0, inf),
    Sector(20.0, 30.0, 10.0, 0.0, 0.0),
    Sector(20.0, 30.0, -10.0, 0.0, 45.0),
    Sector(inf, 30.0, 10.0, 0.0, 45.0),
    Sector(20.0, 30.0, 10.0, 0.0, -45.0),
  ]
  for shape in invalid_shapes {
    let frame = @drawing.drawing(100, 100, "", [], targets=[
      target(sample(1, 20.0, 30.0), shape),
    ])
    assert_eq(frame.hit_test(20.0, 30.0, mode=XNearest), None)
    let frame = @drawing.drawing(100, 100, "", [], targets=[
      valid,
      target(sample(1, 20.0, 30.0), shape),
    ])
    assert_eq(frame.hit_test(20.0, 30.0), Some(good))
  }
  for
    bounds in [
      (10.0, 10.0, 0.0, 30.0),
      (10.0, 10.0, -10.0, 30.0),
      (nan, 10.0, 30.0, 30.0),
      (10.0, 10.0, inf, 30.0),
    ] {
    assert_eq(
      @drawing.drawing(100, 100, "", [], targets=[
        target(good, Rectangle(10.0, 10.0, 30.0, 30.0), bounds~),
      ]).hit_test(20.0, 30.0, mode=XNearest),
      None,
    )
  }
  let frame = @drawing.drawing(100, 100, "", [], targets=[valid])
  for invalid in [nan, inf, -inf] {
    assert_eq(frame.hit_test(invalid, 30.0, mode=XNearest), None)
    assert_eq(frame.hit_test(20.0, invalid, mode=XNearest), None)
    assert_eq(frame.hit_test(20.0, 30.0, radius=invalid, mode=XNearest), None)
  }
  assert_eq(frame.hit_test(20.0, 30.0, radius=-1.0, mode=XNearest), None)
  let invalid_info = @drawing.hit_info(good, Bar, value=nan)
  let invalid_metadata = @drawing.drawing(100, 100, "", [], targets=[
    @drawing.hit_target(
      invalid_info,
      Rectangle(10.0, 10.0, 30.0, 30.0),
      (10.0, 10.0, 80.0, 80.0),
    ),
  ])
  assert_eq(invalid_metadata.hit_test(20.0, 30.0), None)
}

///|
test "semantic client hit radius stays in CSS pixels and XNearest never enters letterboxes" {
  let point = sample(0, 50.0, 50.0)
  let frame = @drawing.drawing(100, 100, "", [], targets=[
    target(point, Point, kind=Line),
  ])
  assert_eq(
    frame.hit_test_client(109.0, 100.0, 0.0, 0.0, 200.0, 200.0),
    Some(point),
  )
  assert_eq(frame.hit_test_client(111.0, 100.0, 0.0, 0.0, 200.0, 200.0), None)
  assert_eq(
    frame.hit_test_client(34.0, 25.0, 0.0, 0.0, 50.0, 50.0),
    Some(point),
  )
  assert_eq(frame.hit_test_client(36.0, 25.0, 0.0, 0.0, 50.0, 50.0), None)
  assert_eq(
    frame.hit_test_client(
      109.0,
      100.0,
      0.0,
      0.0,
      200.0,
      200.0,
      radius=0.0,
      mode=XNearest,
    ),
    Some(point),
  )
  let wide = @drawing.drawing(200, 100, "", [], targets=[
    target(point, Point, kind=Line, bounds=(10.0, 10.0, 180.0, 80.0)),
  ])
  assert_eq(
    wide.hit_test_client(50.0, 49.0, 0.0, 0.0, 200.0, 200.0, mode=XNearest),
    None,
  )
  assert_eq(
    wide.hit_test_client(
      50.0,
      75.0,
      0.0,
      0.0,
      200.0,
      200.0,
      radius=0.0,
      mode=XNearest,
    ),
    Some(point),
  )
  assert_eq(
    wide.hit_test_client(50.0, 141.0, 0.0, 0.0, 200.0, 200.0, mode=XNearest),
    None,
  )
  let area = @drawing.drawing(100, 100, "", [], targets=[
    target(point, Rectangle(10.0, 20.0, 70.0, 30.0)),
  ])
  assert_eq(
    area.hit_test_client(120.0, 80.0, 0.0, 0.0, 200.0, 200.0, radius=0.0),
    Some(point),
  )
}

///|
test "legacy point-only drawings keep existing hit behavior with either mode" {
  let point = sample(0, 0.0, 0.0)
  let frame = @drawing.drawing(100, 100, "", [point])
  assert_eq(frame.targets(), [])
  assert_eq(frame.hit_test(-3.0, -4.0, radius=5.0), Some(point))
  assert_eq(frame.hit_test(-3.0, -4.0, radius=5.0, mode=XNearest), Some(point))
  assert_eq(frame.hit_test(50.0, 80.0, mode=XNearest), None)
  assert_eq(frame.hit_test(0.0, 0.0, radius=0.0, mode=Nearest), Some(point))
}

///|
test "rich point ties remain stable and nonfinite target metadata never becomes interactive" {
  let first = sample(0, 40.0, 50.0)
  let second = sample(1, 60.0, 50.0)
  let frame = @drawing.drawing(100, 100, "", [], targets=[
    target(first, Point, kind=Line),
    target(second, Point, kind=Scatter),
  ])
  assert_eq(frame.hit_test(50.0, 50.0, radius=10.0), Some(first))
  assert_eq(frame.hit_test(50.0, 50.0, radius=9.99), None)
  assert_eq(
    frame.hit_test(50.0, 50.0, radius=10.0, mode=XNearest),
    Some(second),
  )
  let nan = 0.0 / 0.0
  let inf = 1.0 / 0.0
  let invalid = [
    @drawing.hit_info(first, Line, value=1.0, interval=Some((nan, 2.0))),
    @drawing.hit_info(first, Line, value=1.0, fraction=Some(inf)),
    @drawing.hit_info(
      @drawing.hit_point(0, 0, 0, inf, 0.0, 40.0, 50.0),
      Line,
      value=1.0,
    ),
    @drawing.hit_info(
      @drawing.hit_point(0, 0, 0, 0.0, 0.0, nan, 50.0),
      Line,
      value=1.0,
    ),
  ]
  for info in invalid {
    let frame = @drawing.drawing(100, 100, "", [], targets=[
      @drawing.hit_target(info, Point, (10.0, 10.0, 80.0, 80.0)),
    ])
    assert_eq(frame.hit_test(40.0, 50.0, radius=100.0, mode=XNearest), None)
  }
  // Invalid constructed bounds cannot make margin/outside drawing queries hit.
  let outside = @drawing.drawing(100, 100, "", [], targets=[
    target(
      first,
      Rectangle(-50.0, -50.0, 200.0, 200.0),
      bounds=(-50.0, -50.0, 200.0, 200.0),
    ),
  ])
  assert_eq(outside.hit_test(-1.0, 50.0), None)
  assert_eq(outside.hit_test(101.0, 50.0), None)
}

///|
test "XNearest compares every line sample by X instead of taking a nearer Euclidean anchor first" {
  let close_by_distance = sample(0, 59.0, 50.0)
  let close_by_x = sample(1, 50.0, 15.0)
  let frame = @drawing.drawing(100, 100, "", [], targets=[
    target(close_by_distance, Point, kind=Line),
    target(close_by_x, Point, kind=Line),
  ])
  assert_eq(frame.hit_test(50.0, 50.0), Some(close_by_distance))
  assert_eq(frame.hit_test(50.0, 50.0, mode=XNearest), Some(close_by_x))
  assert_eq(
    frame.hit_test(50.0, 50.0, radius=0.0, mode=XNearest),
    Some(close_by_x),
  )
  assert_eq(
    frame.hit_test_client(
      100.0,
      100.0,
      0.0,
      0.0,
      200.0,
      200.0,
      radius=20.0,
      mode=XNearest,
    ),
    Some(close_by_x),
  )
  let nearby_scatter = sample(2, 58.0, 50.0)
  let mixed = @drawing.drawing(100, 100, "", [], targets=[
    target(close_by_distance, Point, kind=Line),
    target(close_by_x, Point, kind=Line),
    target(nearby_scatter, Point, kind=Scatter),
  ])
  assert_eq(mixed.hit_test(50.0, 50.0, mode=XNearest), Some(nearby_scatter))
  assert_eq(
    mixed.hit_test(50.0, 50.0, radius=7.0, mode=XNearest),
    Some(close_by_x),
  )
}
