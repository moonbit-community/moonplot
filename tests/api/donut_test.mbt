///|
test "facade figure exposes donut geometry and semantic values" {
  let fig = @mathplotlib.figure(width=400, height=200)
  ignore(try! fig.donut([2.0, 3.0], labels=["Used", "Free"]))
  let frame = try! fig.to_drawing()
  assert_eq(frame.targets()[0].info.category, Some("Used"))
  assert_eq(frame.targets()[0].info.value, 2.0)
  assert_eq(frame.targets()[0].info.fraction, Some(0.4))
  guard frame.targets()[0].shape
    is @mathplotlib.HitShape::AnnularSector(cx, cy, _, _, _, _) else {
    fail("expected an annular sector through the facade")
  }
  assert_eq(frame.hit_test(cx, cy), None)
}
