///|
test "axes expose four configurable spines and SVG consumes their style" {
  let fig = @scene.figure(width=320, height=220)
  let axes = fig.axes()
  let spines = axes.spines()
  assert_eq(spines.length(), 4)
  match spines[0].side() {
    @scene.SpineSide::Left => ()
    _ => fail("first spine should be the left side")
  }
  assert_true(spines[0].visible())
  assert_eq(spines[0].color(), "#374151")
  assert_true(spines[0].linewidth() == 1.2)
  try! spines[0].set_color("#abcdef")
  try! spines[0].set_linewidth(2.5)
  let svg = fig.to_svg()
  assert_true(svg.contains("stroke=\"#abcdef\""))
  assert_true(svg.contains("stroke-width=\"2.5\""))
  spines[0].set_visible(false)
  let hidden = fig.to_svg()
  assert_true(!hidden.contains("stroke=\"#abcdef\""))
  assert_eq(fig.spines().length(), 4)
}

///|
test "spines validate colors and linewidths and axis off hides them" {
  let fig = @scene.figure()
  let left = fig.spine(@scene.SpineSide::Left)
  try left.set_color("") catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("spine color"))
    _ => fail("expected an empty spine color error")
  } noraise {
    _ => fail("expected an empty spine color error")
  }
  try left.set_linewidth(0.0) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("spine linewidth"))
    _ => fail("expected a spine linewidth error")
  } noraise {
    _ => fail("expected a spine linewidth error")
  }
  fig.set_axis_off()
  let svg = fig.to_svg()
  assert_true(!svg.contains("stroke=\"#374151\""))
  fig.set_axis_on()
  assert_true(fig.to_svg().contains("stroke=\"#374151\""))
}

///|
test "spines support data and outward positions with finite bounds" {
  let fig = @scene.figure(width=320, height=220)
  let left = fig.spine(@scene.SpineSide::Left)
  try! left.set_color("#123abc")
  try! left.set_position(@scene.SpinePosition::Data(0.5))
  try! left.set_bounds(0.25, 0.75)
  match left.position() {
    @scene.SpinePosition::Data(value) => assert_true(value == 0.5)
    _ => fail("left spine should keep its data position")
  }
  assert_eq(left.bounds(), Some((0.25, 0.75)))
  let bounded = fig.to_svg()
  left.clear_bounds()
  let unbounded = fig.to_svg()
  assert_true(bounded.contains("stroke=\"#123abc\""))
  assert_true(bounded != unbounded)
  let top = fig.spine(@scene.SpineSide::Top)
  try! top.set_position(@scene.SpinePosition::Outward(8.0))
  match top.position() {
    @scene.SpinePosition::Outward(value) => assert_true(value == 8.0)
    _ => fail("top spine should keep its outward position")
  }
}

///|
test "spine positions and bounds reject non-finite or degenerate values" {
  let left = @scene.figure().spine(@scene.SpineSide::Left)
  try left.set_position(@scene.SpinePosition::Data(0.0 / 0.0)) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("position"))
    _ => fail("expected an invalid spine position")
  } noraise {
    _ => fail("expected an invalid spine position")
  }
  try left.set_bounds(1.0, 1.0) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("non-zero"))
    _ => fail("expected degenerate spine bounds")
  } noraise {
    _ => fail("expected degenerate spine bounds")
  }
}
