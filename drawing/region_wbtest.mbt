///|
fn region_test_frame(region : FilledRegion) -> Drawing {
  let point = hit_point(0, 0, 0, 0.0, 0.0, 1.0, 1.0)
  drawing(100, 100, "", [], targets=[
    hit_target(
      hit_info(point, ContourF, value=1.0),
      FilledRegion(region),
      (0.0, 0.0, 100.0, 100.0),
    ),
  ])
}

///|
test "opaque filled region copies nested inputs and getters so shared Drawings remain immutable" {
  let ring = [(10.0, 10.0), (90.0, 10.0), (90.0, 90.0), (10.0, 90.0)]
  let rings = [ring]
  let region = filled_region(rings)
  let a = region_test_frame(region)
  let b = region_test_frame(region)
  rings.push([(20.0, 20.0), (80.0, 20.0), (80.0, 80.0), (20.0, 80.0)])
  ring[0] = (100.0, 100.0)
  let exposed = region.rings()
  exposed[0].clear()
  exposed.clear()
  guard a.targets()[0].shape is FilledRegion(copy) else { fail("FilledRegion") }
  copy.rings()[0].clear()
  assert_eq(region.rings()[0][0], (10.0, 10.0))
  assert_true(!region.even_odd())
  assert_true(a.hit_test(50.0, 50.0, radius=0.0) is Some(_))
  assert_true(b.hit_test(50.0, 50.0, radius=0.0) is Some(_))
  assert_eq(a.targets(), b.targets())
}

///|
test "filled region applies one actual nonzero or evenodd rule over holes and disconnected rings" {
  let outer = [(10.0, 10.0), (40.0, 10.0), (40.0, 40.0), (10.0, 40.0)]
  let inner = [(20.0, 20.0), (30.0, 20.0), (30.0, 30.0), (20.0, 30.0)]
  let second = [(60.0, 10.0), (90.0, 10.0), (90.0, 40.0), (60.0, 40.0)]
  for even_odd in [false, true] {
    let frame = region_test_frame(
      filled_region([outer, inner, second], even_odd~),
    )
    assert_true(frame.hit_test(15.0, 25.0, radius=0.0) is Some(_))
    assert_eq(frame.hit_test(25.0, 25.0, radius=0.0) is Some(_), !even_odd)
    assert_true(frame.hit_test(75.0, 25.0, radius=0.0) is Some(_))
    for mode in [Nearest, XNearest] {
      assert_eq(frame.hit_test(50.0, 25.0, radius=100.0, mode~), None)
      if even_odd {
        assert_eq(frame.hit_test(25.0, 25.0, radius=100.0, mode~), None)
      }
    }
  }
  let reversed = Array::makei(inner.length(), i => inner[inner.length() - 1 - i])
  assert_eq(
    region_test_frame(filled_region([outer, reversed])).hit_test(
      25.0,
      25.0,
      radius=0.0,
    ),
    None,
  )
}

///|
test "filled region preserves self crossing lobes while rejecting invalid and collinear geometry" {
  let crossing = filled_region([
    [(10.0, 10.0), (90.0, 90.0), (10.0, 90.0), (90.0, 10.0)],
  ])
  assert_true(crossing.valid)
  assert_true(
    region_test_frame(crossing).hit_test(50.0, 20.0, radius=0.0) is Some(_),
  )
  for
    rings in [
      [],
      [[(1.0, 1.0), (2.0, 2.0)]],
      [[(1.0, 1.0), (2.0, 2.0), (3.0, 3.0)]],
      [[(1.0, 1.0), (0.0 / 0.0, 2.0), (3.0, 1.0)]],
    ] {
    let region = filled_region(rings)
    assert_true(!region.valid)
    assert_eq(region_test_frame(region).hit_test(2.0, 2.0, radius=0.0), None)
  }
}
