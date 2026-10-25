///|
fn area_target(
  index : Int32,
  shape : @drawing.HitShape,
  band~ : @drawing.BandInfo = @drawing.band_info(1.0, 4.0),
) -> @drawing.HitTarget {
  let point = @drawing.hit_point(0, 0, index, 2.0, 4.0, 50.0, 50.0)
  @drawing.hit_target(
    @drawing.hit_info(point, Area, value=4.0, band=Some(band)),
    shape,
    (0.0, 0.0, 100.0, 100.0),
  )
}

///|
test "quadrilateral area hits its real sloped edges and interior rather than its bounding box" {
  let target = area_target(
    0,
    Quadrilateral(10.0, 60.0, 90.0, 20.0, 90.0, 40.0, 10.0, 80.0),
  )
  let frame = @drawing.drawing(100, 100, "", [], targets=[target])
  for (x, y) in [(10.0, 60.0), (90.0, 40.0), (50.0, 50.0), (50.0, 40.0)] {
    assert_eq(frame.hit_test(x, y, radius=0.0), Some(target.info.point))
  }
  for (x, y) in [(20.0, 25.0), (80.0, 70.0), (9.0, 60.0), (50.0, 39.0)] {
    assert_eq(frame.hit_test(x, y, radius=1000.0, mode=XNearest), None)
  }
  let reverse = area_target(
    0,
    Quadrilateral(10.0, 80.0, 90.0, 40.0, 90.0, 20.0, 10.0, 60.0),
  )
  assert_eq(
    @drawing.drawing(100, 100, "", [], targets=[reverse]).hit_test(50.0, 50.0),
    Some(target.info.point),
  )
}

///|
test "quadrilateral concavity and crossed bounds preserve real visible lobes" {
  let concave = area_target(
    0,
    Quadrilateral(10.0, 10.0, 90.0, 10.0, 30.0, 30.0, 10.0, 90.0),
  )
  let frame = @drawing.drawing(100, 100, "", [], targets=[concave])
  assert_eq(frame.hit_test(20.0, 20.0, radius=0.0), Some(concave.info.point))
  assert_eq(frame.hit_test(60.0, 60.0, radius=0.0), None)
  let crossed = area_target(
    1,
    Quadrilateral(10.0, 10.0, 90.0, 90.0, 90.0, 10.0, 10.0, 90.0),
  )
  let frame = @drawing.drawing(100, 100, "", [], targets=[crossed])
  assert_eq(frame.hit_test(20.0, 50.0, radius=0.0), Some(crossed.info.point))
  assert_eq(frame.hit_test(80.0, 50.0, radius=0.0), Some(crossed.info.point))
  assert_eq(frame.hit_test(50.0, 20.0, radius=0.0), None)
  assert_eq(frame.hit_test(50.0, 50.0, radius=0.0), Some(crossed.info.point))
}

///|
test "degenerate nonfinite quadrilaterals and nonfinite band bounds do not hit" {
  let nan = 0.0 / 0.0
  let inf = 1.0 / 0.0
  for
    shape in [
      @drawing.HitShape::Quadrilateral(
        10.0, 10.0, 20.0, 20.0, 30.0, 30.0, 40.0, 40.0,
      ),
      Quadrilateral(20.0, 20.0, 20.0, 20.0, 20.0, 20.0, 20.0, 20.0),
      Quadrilateral(nan, 10.0, 90.0, 10.0, 90.0, 90.0, 10.0, 90.0),
      Quadrilateral(10.0, 10.0, 90.0, inf, 90.0, 90.0, 10.0, 90.0),
    ] {
    assert_eq(
      @drawing.drawing(100, 100, "", [], targets=[area_target(0, shape)]).hit_test(
        20.0, 20.0,
      ),
      None,
    )
  }
  for band in [@drawing.band_info(nan, 2.0), @drawing.band_info(1.0, inf)] {
    assert_eq(
      @drawing.drawing(100, 100, "", [], targets=[
        area_target(0, Rectangle(0.0, 0.0, 100.0, 100.0), band~),
      ]).hit_test(50.0, 50.0),
      None,
    )
  }
}

///|
test "area shapes retain reverse paint priority clips exclusions CSS and immutable metadata" {
  let lower = area_target(
    0,
    Quadrilateral(-20.0, 20.0, 120.0, 20.0, 120.0, 80.0, -20.0, 80.0),
  )
  let band = @drawing.band_info(8.0, 2.0, horizontal=true, stacked=true)
  let upper = area_target(
    1,
    Quadrilateral(20.0, 20.0, 80.0, 20.0, 80.0, 80.0, 20.0, 80.0),
    band~,
  )
  let incoming = [lower, upper]
  let frame = @drawing.drawing(100, 100, "", [], targets=incoming, exclusions=[
    (0, (60.0, 20.0, 20.0, 20.0)),
  ])
  incoming.clear()
  frame.targets().clear()
  assert_eq(frame.targets().length(), 2)
  assert_eq(frame.hit_info(upper.info.point).unwrap().band, Some(band))
  assert_eq(frame.hit_test(50.0, 50.0, radius=0.0), Some(upper.info.point))
  assert_eq(frame.hit_test(10.0, 50.0, radius=0.0), Some(lower.info.point))
  assert_eq(frame.hit_test(70.0, 30.0, radius=0.0), None)
  assert_eq(frame.hit_test(-1.0, 50.0, radius=0.0), None)
  assert_eq(
    frame.hit_test_client(35.0, 70.0, 10.0, 20.0, 50.0, 100.0, radius=0.0),
    Some(upper.info.point),
  )
  assert_eq(
    frame.hit_test_client(35.0, 25.0, 10.0, 20.0, 50.0, 100.0, radius=0.0),
    None,
  )
}
