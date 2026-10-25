///|
test "polar client meet mapping keeps CSS distance disk admission letterbox and ordinary panels independent" {
  let a = hit_point(0, 0, 0, 7.0, 1.0, 130.0, 100.0)
  let b = hit_point(1, 0, 0, 2.0, 0.0, 270.0, 100.0)
  let ordinary = hit_point(2, 0, 0, 1.0, 2.0, 20.0, 20.0)
  let frame = drawing(
    400,
    200,
    "",
    [a, b, ordinary],
    targets=[
      hit_target(
        hit_info(a, Polar, value=1.0),
        Point,
        (50.0, 50.0, 100.0, 100.0),
      ),
      hit_target(
        hit_info(b, Polar, value=0.0),
        Point,
        (230.0, 60.0, 80.0, 80.0),
      ),
      hit_target(
        hit_info(ordinary, Scatter, value=2.0),
        Point,
        (0.0, 0.0, 400.0, 200.0),
      ),
    ],
    polar_circles=[(0, (100.0, 100.0, 50.0)), (1, (270.0, 100.0, 40.0))],
  )
  let scale = 375.0 / 400.0
  let top = 11.0 + (300.0 - 200.0 * scale) / 2.0
  let left = 17.0
  for mode in [Nearest, XNearest] {
    assert_eq(
      frame.hit_test_client(
        left + 130.0 * scale,
        top + 100.0 * scale,
        left,
        11.0,
        375.0,
        300.0,
        radius=0.0,
        mode~,
      ),
      Some(a),
    )
    assert_eq(
      frame.hit_test_client(
        left + 270.0 * scale,
        top + 100.0 * scale,
        left,
        11.0,
        375.0,
        300.0,
        radius=0.0,
        mode~,
      ),
      Some(b),
    )
    assert_eq(
      frame.hit_test_client(
        left + 20.0 * scale,
        top + 20.0 * scale,
        left,
        11.0,
        375.0,
        300.0,
        radius=0.0,
        mode~,
      ),
      Some(ordinary),
    )
    assert_eq(
      frame.hit_test_client(
        left + 130.0 * scale + 8.0,
        top + 100.0 * scale,
        left,
        11.0,
        375.0,
        300.0,
        radius=8.01,
        mode~,
      ),
      Some(a),
    )
    assert_eq(
      frame.hit_test_client(
        left + 130.0 * scale + 8.0,
        top + 100.0 * scale,
        left,
        11.0,
        375.0,
        300.0,
        radius=7.99,
        mode~,
      ),
      None,
    )
    assert_eq(
      frame.hit_test_client(
        left + 50.0 * scale,
        top + 50.0 * scale,
        left,
        11.0,
        375.0,
        300.0,
        radius=1.0e6,
        mode~,
      ),
      Some(ordinary),
    )
    assert_eq(
      frame.hit_test_client(
        left + 130.0 * scale,
        12.0,
        left,
        11.0,
        375.0,
        300.0,
        radius=1.0e6,
        mode~,
      ),
      None,
    )
    assert_eq(frame.hit_test(100.0, 100.0, radius=1.0, mode~), None)
  }
}
