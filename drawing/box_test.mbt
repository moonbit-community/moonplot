///|
test "box summaries are scalar immutable metadata with a typed original outlier" {
  let point = @drawing.hit_point(0, 2, 4, 5.0, 20.0, 50.0, 30.0)
  let box = @drawing.box_info(
    4,
    q1=2.0,
    median=3.0,
    q3=4.0,
    lower_whisker=1.0,
    upper_whisker=6.0,
    part=Outlier(20.0),
  )
  let info = @drawing.hit_info(
    point,
    BoxPlot,
    value=20.0,
    series="Measurements",
    box=Some(box),
  )
  let frame = @drawing.drawing(100, 100, "same", [point], targets=[
    @drawing.hit_target(info, Point, (0.0, 0.0, 100.0, 100.0)),
  ])
  assert_eq(frame.hit_info(point).unwrap().box, Some(box))
  assert_eq(frame.hit_info(point).unwrap().kind, @drawing.HitKind::BoxPlot)
  assert_eq(box.part, @drawing.BoxPart::Outlier(20.0))
  assert_eq(frame.hit_test(50.0, 30.0, radius=0.0), Some(point))
  let returned = frame.targets()
  returned.clear()
  assert_eq(frame.hit_info(point).unwrap().box.unwrap().group_index, 4)
  assert_eq(frame.svg(), "same")
}

///|
test "box summary validation rejects invalid indices nonfinite statistics and reversed quartiles" {
  let point = @drawing.hit_point(0, 0, 0, 1.0, 3.0, 50.0, 50.0)
  let nan = 0.0 / 0.0
  let inf = 1.0 / 0.0
  let cases = [
    @drawing.box_info(
      -1,
      q1=2.0,
      median=3.0,
      q3=4.0,
      lower_whisker=1.0,
      upper_whisker=5.0,
    ),
    @drawing.box_info(
      0,
      q1=nan,
      median=3.0,
      q3=4.0,
      lower_whisker=1.0,
      upper_whisker=5.0,
    ),
    @drawing.box_info(
      0,
      q1=2.0,
      median=inf,
      q3=4.0,
      lower_whisker=1.0,
      upper_whisker=5.0,
    ),
    @drawing.box_info(
      0,
      q1=2.0,
      median=3.0,
      q3=nan,
      lower_whisker=1.0,
      upper_whisker=5.0,
    ),
    @drawing.box_info(
      0,
      q1=2.0,
      median=3.0,
      q3=4.0,
      lower_whisker=-inf,
      upper_whisker=5.0,
    ),
    @drawing.box_info(
      0,
      q1=2.0,
      median=3.0,
      q3=4.0,
      lower_whisker=1.0,
      upper_whisker=inf,
    ),
    @drawing.box_info(
      0,
      q1=4.0,
      median=3.0,
      q3=5.0,
      lower_whisker=1.0,
      upper_whisker=6.0,
    ),
    @drawing.box_info(
      0,
      q1=2.0,
      median=5.0,
      q3=4.0,
      lower_whisker=1.0,
      upper_whisker=6.0,
    ),
    @drawing.box_info(
      0,
      q1=2.0,
      median=3.0,
      q3=4.0,
      lower_whisker=2.5,
      upper_whisker=6.0,
    ),
    @drawing.box_info(
      0,
      q1=2.0,
      median=3.0,
      q3=4.0,
      lower_whisker=1.0,
      upper_whisker=3.5,
    ),
    @drawing.box_info(
      0,
      q1=2.0,
      median=3.0,
      q3=4.0,
      lower_whisker=1.0,
      upper_whisker=5.0,
      part=Outlier(nan),
    ),
    @drawing.box_info(
      0,
      q1=2.0,
      median=3.0,
      q3=4.0,
      lower_whisker=1.0,
      upper_whisker=5.0,
      part=Outlier(inf),
    ),
  ]
  for box in cases {
    let info = @drawing.hit_info(point, BoxPlot, value=3.0, box=Some(box))
    let frame = @drawing.drawing(100, 100, "", [point], targets=[
      @drawing.hit_target(
        info,
        Segment(20.0, 50.0, 80.0, 50.0),
        (0.0, 0.0, 100.0, 100.0),
      ),
    ])
    assert_eq(frame.hit_test(50.0, 50.0, radius=0.0), None)
  }
  let constant = @drawing.box_info(
    0,
    q1=3.0,
    median=3.0,
    q3=3.0,
    lower_whisker=3.0,
    upper_whisker=3.0,
  )
  let info = @drawing.hit_info(point, BoxPlot, value=3.0, box=Some(constant))
  let frame = @drawing.drawing(100, 100, "", [point], targets=[
    @drawing.hit_target(
      info,
      Segment(20.0, 50.0, 80.0, 50.0),
      (0.0, 0.0, 100.0, 100.0),
    ),
  ])
  assert_eq(frame.hit_test(50.0, 50.0, radius=0.0), Some(point))
}
