///|
fn error_target(
  point : @drawing.HitPoint,
  shape : @drawing.HitShape,
  bounds~ : (Double, Double, Double, Double) = (0.0, 0.0, 100.0, 100.0),
  error~ : @drawing.ErrorInfo = @drawing.error_info((1.0, 3.0), (2.0, 6.0)),
) -> @drawing.HitTarget {
  @drawing.hit_target(
    @drawing.hit_info(
      point,
      ErrorBar,
      value=point.data_y,
      series="Measured",
      error=Some(error),
    ),
    shape,
    bounds,
  )
}

///|
test "error metadata is immutable supports zero intervals and rejects invalid ranges" {
  let point = @drawing.hit_point(0, 0, 2, 2.0, 4.0, 50.0, 50.0)
  let zero = @drawing.error_info((2.0, 2.0), (4.0, 4.0))
  let targets = [error_target(point, Point, error=zero)]
  let frame = @drawing.drawing(100, 100, "", [point], targets~)
  targets.clear()
  frame.targets().clear()
  assert_eq(frame.hit_info(point).unwrap().error, Some(zero))
  assert_eq(frame.hit_test(50.0, 50.0, radius=0.0), Some(point))
  let ordinary = @drawing.hit_info(point, Line, value=4.0)
  assert_eq(ordinary.error, None)
  for
    invalid in [
      @drawing.error_info((3.0, 1.0), (2.0, 6.0)),
      @drawing.error_info((1.0, 3.0), (6.0, 2.0)),
      @drawing.error_info((0.0 / 0.0, 3.0), (2.0, 6.0)),
      @drawing.error_info((1.0, 1.0 / 0.0), (2.0, 6.0)),
    ] {
    let bad = @drawing.drawing(100, 100, "", [point], targets=[
      error_target(point, Point, error=invalid),
    ])
    assert_eq(bad.hit_test(50.0, 50.0), None)
  }
}

///|
test "segment hits use nearest projection including endpoints diagonal and degenerate segments" {
  let point = @drawing.hit_point(0, 0, 3, 2.0, 4.0, 50.0, 50.0)
  for
    shape in [
      @drawing.HitShape::Segment(20.0, 50.0, 80.0, 50.0),
      Segment(50.0, 20.0, 50.0, 80.0),
      Segment(20.0, 20.0, 80.0, 80.0),
      Segment(50.0, 50.0, 50.0, 50.0),
    ] {
    let frame = @drawing.drawing(100, 100, "", [], targets=[
      error_target(point, shape),
    ])
    assert_eq(frame.hit_test(50.0, 50.0, radius=0.0), Some(point))
    assert_eq(frame.hit_info(point).unwrap().point, point)
  }
  let frame = @drawing.drawing(100, 100, "", [], targets=[
    error_target(point, Segment(20.0, 50.0, 80.0, 50.0)),
  ])
  for (x, y) in [(50.0, 53.0), (17.0, 50.0), (83.0, 50.0)] {
    assert_eq(frame.hit_test(x, y, radius=3.0), Some(point))
    assert_eq(frame.hit_test(x, y, radius=2.999), None)
  }
  let diagonal = @drawing.drawing(100, 100, "", [], targets=[
    error_target(point, Segment(20.0, 20.0, 80.0, 80.0)),
  ])
  assert_eq(diagonal.hit_test(52.0, 48.0, radius=2.83), Some(point))
  assert_eq(diagonal.hit_test(52.0, 48.0, radius=2.82), None)
}

///|
test "segment proximity clips first and never reaches hidden off panel geometry" {
  let point = @drawing.hit_point(0, 0, 0, 2.0, 4.0, -20.0, 50.0)
  let frame = @drawing.drawing(100, 100, "", [point], targets=[
    error_target(point, Point, bounds=(10.0, 10.0, 80.0, 80.0)),
    error_target(
      point,
      Segment(-20.0, 50.0, 40.0, 50.0),
      bounds=(10.0, 10.0, 80.0, 80.0),
    ),
  ])
  assert_eq(frame.hit_test(10.0, 50.0, radius=0.0), Some(point))
  assert_eq(frame.hit_test(35.0, 50.0, radius=0.0), Some(point))
  assert_eq(frame.hit_test(9.0, 50.0, radius=100.0), None)
  let outside = @drawing.drawing(100, 100, "", [], targets=[
    error_target(
      point,
      Segment(95.0, 40.0, 95.0, 60.0),
      bounds=(10.0, 10.0, 80.0, 80.0),
    ),
  ])
  assert_eq(outside.hit_test(89.0, 50.0, radius=20.0), None)
}

///|
test "segment radius remains in CSS pixels under scaling letterboxes and panel exclusions" {
  let point = @drawing.hit_point(0, 0, 0, 2.0, 4.0, 50.0, 50.0)
  let frame = @drawing.drawing(
    100,
    100,
    "",
    [point],
    targets=[error_target(point, Segment(20.0, 50.0, 80.0, 50.0))],
    exclusions=[(0, (50.0, 40.0, 10.0, 20.0))],
  )
  assert_eq(
    frame.hit_test_client(20.0, 28.0, 0.0, 0.0, 50.0, 50.0, radius=3.0),
    Some(point),
  )
  assert_eq(
    frame.hit_test_client(20.0, 28.0, 0.0, 0.0, 50.0, 50.0, radius=2.99),
    None,
  )
  assert_eq(
    frame.hit_test_client(90.0, 53.0, 0.0, 0.0, 200.0, 100.0, radius=3.0),
    Some(point),
  )
  assert_eq(frame.hit_test_client(100.0, 50.0, 0.0, 0.0, 200.0, 100.0), None)
  assert_eq(
    frame.hit_test_client(40.0, 50.0, 0.0, 0.0, 200.0, 100.0, radius=100.0),
    None,
  )
}

///|
test "error XNearest uses real samples instead of whisker endpoints within the current panel" {
  let first = @drawing.hit_point(0, 0, 0, 1.0, 2.0, 20.0, 20.0)
  let second = @drawing.hit_point(0, 0, 1, 3.0, 8.0, 80.0, 80.0)
  let frame = @drawing.drawing(100, 100, "", [first, second], targets=[
    error_target(first, Point),
    error_target(first, Segment(20.0, 20.0, 90.0, 20.0)),
    error_target(second, Point),
  ])
  assert_eq(frame.hit_test(70.0, 20.0, radius=0.0), Some(first))
  assert_eq(
    frame.hit_test(70.0, 20.0, radius=100.0, mode=XNearest),
    Some(second),
  )
  let other = @drawing.hit_point(1, 0, 0, 1.0, 2.0, 51.0, 20.0)
  let panels = @drawing.drawing(100, 100, "", [first, other], targets=[
    error_target(first, Point, bounds=(0.0, 0.0, 50.0, 100.0)),
    error_target(other, Point, bounds=(50.0, 0.0, 50.0, 100.0)),
  ])
  assert_eq(panels.hit_test(49.0, 80.0, mode=XNearest), Some(first))
}

///|
test "invalid segment geometry is ignored without disturbing valid sample hits" {
  let point = @drawing.hit_point(0, 0, 0, 2.0, 4.0, 50.0, 50.0)
  for
    shape in [
      @drawing.HitShape::Segment(0.0 / 0.0, 50.0, 80.0, 50.0),
      Segment(20.0, 50.0, 1.0 / 0.0, 50.0),
      Segment(-1.7e308, 50.0, 1.7e308, 50.0),
    ] {
    let frame = @drawing.drawing(100, 100, "", [], targets=[
      error_target(point, shape),
    ])
    assert_eq(frame.hit_test(50.0, 50.0, radius=100.0), None)
  }
}
