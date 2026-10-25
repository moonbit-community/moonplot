///|
fn violin_test_target(
  index : Int32,
  part : @drawing.ViolinPart,
  shape : @drawing.HitShape,
) -> @drawing.HitTarget {
  let point = @drawing.hit_point(0, 0, index, 1.0, 2.0, 50.0, 50.0)
  let violin = @drawing.violin_info(
    0,
    position=1.0,
    mean=2.0,
    median=2.0,
    minimum=1.0,
    maximum=3.0,
    part~,
  )
  @drawing.hit_target(
    @drawing.hit_info(point, Violin, value=2.0, violin=Some(violin)),
    shape,
    (0.0, 0.0, 100.0, 100.0),
  )
}

///|
test "violin semantic slots distinguish equal body and summary anchors through final hit info" {
  let body = violin_test_target(
    1,
    Body(1, 2.0, 0.5),
    Quadrilateral(0.0, 0.0, 100.0, 0.0, 100.0, 100.0, 0.0, 100.0),
  )
  let mean = violin_test_target(3, Mean, Segment(0.0, 50.0, 100.0, 50.0))
  let median = violin_test_target(4, Median, Segment(0.0, 50.0, 100.0, 50.0))
  let quantile = violin_test_target(
    8,
    Quantile(1, 2.0),
    Segment(0.0, 50.0, 100.0, 50.0),
  )
  let drawing = @drawing.drawing(
    100,
    100,
    "",
    [body.info.point, mean.info.point, median.info.point, quantile.info.point],
    targets=[body, mean, median, quantile],
  )
  for target in drawing.targets() {
    assert_eq(drawing.hit_info(target.info.point), Some(target.info))
  }
  let hit = drawing.hit_test(50.0, 50.0, radius=0.0).unwrap()
  assert_eq(
    drawing.hit_info(hit).unwrap().violin.unwrap().part,
    @drawing.ViolinPart::Quantile(1, 2.0),
  )
  let strokes = @drawing.drawing(100, 100, "", [], targets=[
    mean, median, quantile,
  ])
  assert_eq(
    strokes.hit_info(strokes.hit_test(50.0, 50.0, radius=0.0).unwrap()).unwrap().violin.unwrap().part,
    @drawing.ViolinPart::Quantile(1, 2.0),
  )
}

///|
test "later violin strokes win over both halves of filled quad areas and later filled areas occlude them" {
  let area_point = @drawing.hit_point(0, 1, 0, 0.0, 0.0, 50.0, 50.0)
  let area = @drawing.hit_info(area_point, Area, value=1.0)
  let left = @drawing.hit_target(
    area,
    Quadrilateral(0.0, 0.0, 50.0, 0.0, 50.0, 100.0, 0.0, 100.0),
    (0.0, 0.0, 100.0, 100.0),
  )
  let right = @drawing.hit_target(
    area,
    Quadrilateral(50.0, 0.0, 100.0, 0.0, 100.0, 100.0, 50.0, 100.0),
    (0.0, 0.0, 100.0, 100.0),
  )
  let mean = violin_test_target(3, Mean, Segment(0.0, 50.0, 100.0, 50.0))
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    let above = @drawing.drawing(100, 100, "", [], targets=[left, right, mean])
    for x in [25.0, 75.0] {
      assert_eq(
        above.hit_test(x, 50.0, radius=0.0, mode~),
        Some(mean.info.point),
      )
    }
    let below = @drawing.drawing(100, 100, "", [], targets=[mean, left, right])
    assert_eq(below.hit_test(25.0, 50.0, radius=0.0, mode~), Some(area_point))
  }
}

///|
test "invalid violin density or summary metadata cannot produce a selectable target" {
  let invalid = violin_test_target(
    0,
    Body(0, 2.0, -1.0),
    Segment(0.0, 50.0, 100.0, 50.0),
  )
  let drawing = @drawing.drawing(100, 100, "", [], targets=[invalid])
  assert_eq(drawing.hit_test(50.0, 50.0), None)
}
