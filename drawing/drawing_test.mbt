///|
test "drawing snapshots own hit-target arrays and expose frame metadata" {
  let point = @drawing.hit_point(2, 3, 4, 1.25, -2.5, 80.25, 40.5)
  let incoming = [point]
  let frame = @drawing.drawing(320, 160, "<svg/>", incoming)
  incoming.clear()
  assert_eq(frame.width(), 320)
  assert_eq(frame.height(), 160)
  assert_eq(frame.svg(), "<svg/>")
  assert_eq(frame.points(), [point])
  let borrowed = frame.points()
  borrowed[0] = @drawing.hit_point(9, 9, 9, 0.0, 0.0, 0.0, 0.0)
  borrowed.clear()
  assert_eq(frame.points(), [point])
  assert_eq(point.panel_index, 2)
  assert_eq(point.artist_index, 3)
  assert_eq(point.point_index, 4)
  assert_eq(point.data_x, 1.25)
  assert_eq(point.data_y, -2.5)
  assert_eq(point.screen_x, 80.25)
  assert_eq(point.screen_y, 40.5)
}

///|
test "nearest hits preserve original order for ties and include the radius boundary" {
  let first = @drawing.hit_point(0, 1, 2, 3.0, 4.0, 3.0, 4.0)
  let tied = @drawing.hit_point(1, 2, 3, 4.0, 3.0, 4.0, 3.0)
  let closer = @drawing.hit_point(2, 3, 4, 0.0, 2.0, 0.0, 2.0)
  let frame = @drawing.drawing(100, 100, "", [first, tied])
  assert_eq(frame.hit_test(0.0, 0.0, radius=5.0), Some(first))
  assert_eq(frame.hit_test(0.0, 0.0, radius=4.99), None)
  let frame = @drawing.drawing(100, 100, "", [first, tied, closer])
  assert_eq(frame.hit_test(0.0, 0.0), Some(closer))
  assert_eq(frame.hit_test(0.0, 2.0, radius=0.0), Some(closer))
  assert_eq(frame.hit_test(0.0, 2.1, radius=0.0), None)
}

///|
test "hit testing skips nonfinite samples and rejects invalid queries and radii" {
  let good = @drawing.hit_point(0, 0, 4, 1.0, 2.0, 10.0, 20.0)
  let nan = 0.0 / 0.0
  let inf = 1.0 / 0.0
  let frame = @drawing.drawing(100, 100, "", [
    @drawing.hit_point(0, 0, 0, nan, 0.0, 10.0, 20.0),
    @drawing.hit_point(0, 0, 1, 0.0, inf, 10.0, 20.0),
    @drawing.hit_point(0, 0, 2, 0.0, 0.0, nan, 20.0),
    @drawing.hit_point(0, 0, 3, 0.0, 0.0, 10.0, inf),
    good,
  ])
  assert_eq(frame.hit_test(10.0, 20.0), Some(good))
  for invalid in [nan, inf, -inf] {
    assert_eq(frame.hit_test(invalid, 20.0), None)
    assert_eq(frame.hit_test(10.0, invalid), None)
    assert_eq(frame.hit_test(10.0, 20.0, radius=invalid), None)
  }
  assert_eq(frame.hit_test(10.0, 20.0, radius=-1.0), None)
  assert_eq(@drawing.drawing(100, 100, "", []).hit_test(0.0, 0.0), None)
  assert_eq(@drawing.drawing(0, 100, "", [good]).hit_test(10.0, 20.0), None)
}

///|
test "large and small distances do not overflow or underflow when squared" {
  let farther = @drawing.hit_point(0, 0, 0, 0.0, 0.0, 3.0e200, 4.0e200)
  let nearer = @drawing.hit_point(0, 0, 1, 0.0, 0.0, 3.0e199, 4.0e199)
  let frame = @drawing.drawing(100, 100, "", [farther, nearer])
  assert_eq(frame.hit_test(0.0, 0.0, radius=1.0e201), Some(nearer))
  let tiny = @drawing.hit_point(0, 0, 2, 0.0, 0.0, 3.0e-200, 4.0e-200)
  let frame = @drawing.drawing(100, 100, "", [tiny])
  assert_eq(frame.hit_test(0.0, 0.0, radius=4.0e-200), None)
  assert_eq(frame.hit_test(0.0, 0.0, radius=6.0e-200), Some(tiny))
}

///|
test "viewport mapping handles translation scrolling and proportional scaling" {
  let frame = @drawing.drawing(200, 100, "", [])
  assert_eq(
    frame.viewport_point(110.0, 70.0, 10.0, 20.0, 200.0, 100.0),
    Some((100.0, 50.0)),
  )
  assert_eq(
    frame.viewport_point(210.0, 120.0, 10.0, 20.0, 400.0, 200.0),
    Some((100.0, 50.0)),
  )
  assert_eq(
    frame.viewport_point(210.0, 20.0, 10.0, -80.0, 400.0, 200.0),
    Some((100.0, 50.0)),
  )
  assert_eq(
    frame.viewport_point(60.0, 45.0, 10.0, 20.0, 100.0, 50.0),
    Some((100.0, 50.0)),
  )
}

///|
test "meet mapping excludes horizontal and vertical letterboxes and accepts content edges" {
  let frame = @drawing.drawing(200, 100, "", [])
  assert_eq(frame.viewport_point(0.0, 49.0, 0.0, 0.0, 200.0, 200.0), None)
  assert_eq(
    frame.viewport_point(0.0, 50.0, 0.0, 0.0, 200.0, 200.0),
    Some((0.0, 0.0)),
  )
  assert_eq(
    frame.viewport_point(200.0, 150.0, 0.0, 0.0, 200.0, 200.0),
    Some((200.0, 100.0)),
  )
  assert_eq(frame.viewport_point(0.0, 151.0, 0.0, 0.0, 200.0, 200.0), None)
  assert_eq(frame.viewport_point(99.0, 0.0, 0.0, 0.0, 400.0, 100.0), None)
  assert_eq(
    frame.viewport_point(100.0, 0.0, 0.0, 0.0, 400.0, 100.0),
    Some((0.0, 0.0)),
  )
  assert_eq(
    frame.viewport_point(300.0, 100.0, 0.0, 0.0, 400.0, 100.0),
    Some((200.0, 100.0)),
  )
  assert_eq(frame.viewport_point(301.0, 0.0, 0.0, 0.0, 400.0, 100.0), None)
}

///|
test "viewport mapping rejects outside nonfinite and zero-sized rectangles" {
  let frame = @drawing.drawing(200, 100, "", [])
  assert_eq(frame.viewport_point(-1.0, 50.0, 0.0, 0.0, 200.0, 100.0), None)
  assert_eq(frame.viewport_point(100.0, 101.0, 0.0, 0.0, 200.0, 100.0), None)
  for invalid in [0.0, -1.0, 0.0 / 0.0, 1.0 / 0.0] {
    assert_eq(frame.viewport_point(0.0, 0.0, 0.0, 0.0, invalid, 100.0), None)
    assert_eq(frame.viewport_point(0.0, 0.0, 0.0, 0.0, 200.0, invalid), None)
  }
  for invalid in [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0] {
    assert_eq(frame.viewport_point(invalid, 0.0, 0.0, 0.0, 200.0, 100.0), None)
    assert_eq(frame.viewport_point(0.0, invalid, 0.0, 0.0, 200.0, 100.0), None)
    assert_eq(frame.viewport_point(0.0, 0.0, invalid, 0.0, 200.0, 100.0), None)
    assert_eq(frame.viewport_point(0.0, 0.0, 0.0, invalid, 200.0, 100.0), None)
  }
  assert_eq(
    @drawing.drawing(-1, 100, "", []).viewport_point(
      0.0, 0.0, 0.0, 0.0, 200.0, 100.0,
    ),
    None,
  )
  assert_eq(
    @drawing.drawing(200, 0, "", []).viewport_point(
      0.0, 0.0, 0.0, 0.0, 200.0, 100.0,
    ),
    None,
  )
}

///|
test "client hit radii stay in CSS pixels at different viewport scales" {
  let point = @drawing.hit_point(0, 0, 0, 1.0, 2.0, 100.0, 50.0)
  let frame = @drawing.drawing(200, 100, "", [point])
  assert_eq(
    frame.hit_test_client(209.0, 100.0, 0.0, 0.0, 400.0, 200.0),
    Some(point),
  )
  assert_eq(frame.hit_test_client(211.0, 100.0, 0.0, 0.0, 400.0, 200.0), None)
  assert_eq(
    frame.hit_test_client(59.0, 25.0, 0.0, 0.0, 100.0, 50.0),
    Some(point),
  )
  assert_eq(frame.hit_test_client(61.0, 25.0, 0.0, 0.0, 100.0, 50.0), None)
  assert_eq(
    frame.hit_test_client(110.0, 70.0, 10.0, 20.0, 200.0, 100.0, radius=0.0),
    Some(point),
  )
  assert_eq(
    frame.hit_test_client(110.0, 170.0, 10.0, 120.0, 200.0, 100.0, radius=0.0),
    Some(point),
  )
  assert_eq(
    frame.hit_test_client(100.0, 20.0, 0.0, 0.0, 200.0, 200.0, radius=1000.0),
    None,
  )
  assert_eq(
    frame.hit_test_client(100.0, 50.0, 0.0, 0.0, 200.0, 100.0, radius=-1.0),
    None,
  )
}
