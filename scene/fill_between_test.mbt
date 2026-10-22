///|
test "fill_betweenx uses left and right values as x coordinates" {
  let fig = @scene.figure()
  try! fig.fill_betweenx([10.0, 20.0], [2.0, 3.0], right=[5.0, 6.0])
  match fig.artists()[0] {
    @scene.Artist::FillBetween(upper, lower, _) => {
      assert_eq(lower.map(p => (p.x(), p.y())), [(2.0, 10.0), (3.0, 20.0)])
      assert_eq(upper.map(p => (p.x(), p.y())), [(5.0, 10.0), (6.0, 20.0)])
    }
    _ => fail("expected horizontal fill vertices")
  }
  try! fig.fill_betweenx([10.0, 20.0], [2.0, 3.0])
  match fig.artists()[1] {
    @scene.Artist::FillBetween(upper, _, _) =>
      assert_eq(upper.map(p => (p.x(), p.y())), [(0.0, 10.0), (0.0, 20.0)])
    _ => fail("expected a zero baseline")
  }
}

///|
test "fill input errors leave the scene unchanged" {
  let fig = @scene.figure()
  try fig.fill_between([0.0, 1.0], [0.0], [2.0, 3.0]) catch {
    @core.DataError::LengthMismatch(expected=2, actual=1) => ()
    _ => fail("expected a lower endpoint length error")
  } noraise {
    _ => fail("expected a length error")
  }
  try fig.fill_betweenx([0.0, 1.0], [2.0, 3.0], right=[4.0]) catch {
    @core.DataError::LengthMismatch(expected=2, actual=1) => ()
    _ => fail("expected a right endpoint length error")
  } noraise {
    _ => fail("expected a length error")
  }
  assert_eq(fig.artists().length(), 0)
}
