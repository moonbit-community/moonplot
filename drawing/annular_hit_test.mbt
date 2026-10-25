///|
test "annular sectors include radial and angular edges while leaving the hole empty" {
  let point = sample(7, 70.0, 50.0)
  let frame = @drawing.drawing(100, 100, "", [], targets=[
    target(point, AnnularSector(50.0, 50.0, 10.0, 30.0, 315.0, 90.0), kind=Pie),
  ])
  for
    (x, y) in [
      (60.0, 50.0),
      (80.0, 50.0),
      (70.0, 50.0),
      (65.0, 35.0),
      (65.0, 65.0),
    ] {
    assert_eq(frame.hit_test(x, y, radius=0.0), Some(point))
  }
  for
    (x, y) in [
      (50.0, 50.0),
      (59.99, 50.0),
      (80.01, 50.0),
      (30.0, 50.0),
      (50.0, 70.0),
    ] {
    assert_eq(frame.hit_test(x, y, radius=1000.0, mode=XNearest), None)
  }
}

///|
test "full annular sectors handle any rotation and zero inner radius restores the center" {
  let point = sample(2, 70.0, 50.0)
  let frame = @drawing.drawing(100, 100, "", [], targets=[
    target(
      point,
      AnnularSector(50.0, 50.0, 10.0, 30.0, -720.0, 360.0),
      kind=Pie,
    ),
  ])
  for (x, y) in [(30.0, 50.0), (50.0, 30.0), (50.0, 70.0), (70.0, 50.0)] {
    assert_eq(frame.hit_test(x, y, radius=0.0), Some(point))
  }
  assert_eq(frame.hit_test(50.0, 50.0), None)
  let filled = @drawing.drawing(100, 100, "", [], targets=[
    target(point, AnnularSector(50.0, 50.0, 0.0, 30.0, 90.0, 90.0), kind=Pie),
  ])
  assert_eq(filled.hit_test(50.0, 50.0, radius=0.0), Some(point))
}

///|
test "annular sectors reject invalid radii geometry and nonfinite sweeps" {
  let point = sample(0, 70.0, 50.0)
  let nan = 0.0 / 0.0
  let inf = 1.0 / 0.0
  for
    shape in [
      @drawing.HitShape::AnnularSector(50.0, 50.0, -1.0, 30.0, 0.0, 360.0),
      AnnularSector(50.0, 50.0, 30.0, 30.0, 0.0, 360.0),
      AnnularSector(50.0, 50.0, 31.0, 30.0, 0.0, 360.0),
      AnnularSector(50.0, 50.0, 0.0, 0.0, 0.0, 360.0),
      AnnularSector(nan, 50.0, 10.0, 30.0, 0.0, 360.0),
      AnnularSector(50.0, inf, 10.0, 30.0, 0.0, 360.0),
      AnnularSector(50.0, 50.0, inf, 30.0, 0.0, 360.0),
      AnnularSector(50.0, 50.0, 10.0, inf, 0.0, 360.0),
      AnnularSector(50.0, 50.0, 10.0, 30.0, nan, 360.0),
      AnnularSector(50.0, 50.0, 10.0, 30.0, 0.0, inf),
      AnnularSector(50.0, 50.0, 10.0, 30.0, 0.0, 0.0),
      AnnularSector(50.0, 50.0, 10.0, 30.0, 0.0, -90.0),
    ] {
    let frame = @drawing.drawing(100, 100, "", [], targets=[
      target(point, shape, kind=Pie),
    ])
    assert_eq(frame.hit_test(70.0, 50.0), None)
  }
}

///|
test "annular clients preserve the transparent hole under scaling letterboxes and overlays" {
  let point = sample(0, 70.0, 50.0)
  let frame = @drawing.drawing(
    100,
    100,
    "",
    [],
    targets=[
      target(point, AnnularSector(50.0, 50.0, 10.0, 30.0, 0.0, 360.0), kind=Pie),
    ],
    exclusions=[(0, (70.0, 45.0, 10.0, 10.0))],
  )
  // ViewBox 100x100 in a 200x100 client has a 50 px horizontal letterbox.
  assert_eq(frame.hit_test_client(120.0, 50.0, 0.0, 0.0, 200.0, 100.0), None)
  assert_eq(frame.hit_test_client(100.0, 50.0, 0.0, 0.0, 200.0, 100.0), None)
  assert_eq(
    frame.hit_test_client(80.0, 50.0, 0.0, 0.0, 200.0, 100.0),
    Some(point),
  )
  assert_eq(frame.hit_test_client(40.0, 50.0, 0.0, 0.0, 200.0, 100.0), None)
  assert_eq(
    frame.hit_test_client(15.0, 25.0, 0.0, 0.0, 50.0, 50.0),
    Some(point),
  )
}

///|
fn annular_edge_point(angle : Double) -> (Double, Double) {
  let radians = angle * @math.PI / 180.0
  (200.0 + 50.0 * @math.cos(radians), 100.0 - 50.0 * @math.sin(radians))
}

///|
test "annular angular edges tolerate only floating point roundoff at rotated start and end rays" {
  let point = @drawing.hit_point(0, 0, 0, 0.0, 1.0, 250.0, 100.0)
  for start in [15.0, 30.0, 60.0, 120.0, 195.0, 315.0, -330.0, 735.0] {
    for sweep in [15.0, 90.0, 210.0] {
      let frame = @drawing.drawing(400, 200, "", [], targets=[
        target(
          point,
          AnnularSector(200.0, 100.0, 20.0, 64.0, start, sweep),
          kind=Pie,
          bounds=(0.0, 0.0, 400.0, 200.0),
        ),
      ])
      for angle in [start, start + sweep] {
        let (x, y) = annular_edge_point(angle)
        assert_eq(frame.hit_test(x, y, radius=0.0), Some(point))
      }
      // These points are still extremely close to the edge, but their
      // directional displacement exceeds the calculation's rounding budget.
      for distance in [1.0e-12, 1.0e-11, 1.0e-10] {
        for angle in [start + distance, start + sweep - distance] {
          let (x, y) = annular_edge_point(angle)
          assert_eq(frame.hit_test(x, y, radius=0.0), Some(point))
        }
        for angle in [start - distance, start + sweep + distance] {
          let (x, y) = annular_edge_point(angle)
          assert_eq(frame.hit_test(x, y, radius=1000.0, mode=XNearest), None)
        }
      }
    }
  }
}
