///|
test "reference segments and spans render with labels" {
  let fig = @scene.figure(width=320, height=240)
  let ax = fig.axes()
  try! ax.hlines([0.25, 0.75], 0.0, 1.0, color="#123456", label="levels")
  try! ax.vlines([0.5], 0.0, 1.0, color="#654321")
  try! ax.axhspan(0.4, 0.6, color="#abcdef", label="band")
  try! ax.axvspan(0.2, 0.3, color="#fedcba")
  let svg = fig.to_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("levels"))
  assert_true(svg.contains("band"))
}

///|
test "reference segments reject non-finite limits" {
  let fig = @scene.figure()
  try fig.hlines([0.0], 0.0 / 0.0, 1.0) catch {
    @core.DataError::NonFiniteLimit(axis~) => assert_eq(axis, "x")
    _ => fail("expected non-finite reference error")
  } noraise {
    _ => fail("expected a reference error")
  }
}

///|
test "axline clips an infinite line to the axes rectangle" {
  let fig = @scene.figure(width=320, height=240)
  try! fig.set_bounds(@core.bounds(0.0, 1.0, 0.0, 1.0))
  try! fig.axline(@core.point(0.0, 0.0), slope=1.0, color="#123456")
  try! fig.axline(
    @core.point(0.25, 0.0),
    xy2=@core.point(0.25, 1.0),
    color="#654321",
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("stroke=\"#123456\""))
  assert_true(svg.contains("stroke=\"#654321\""))
}

///|
test "axline requires a valid definition" {
  let fig = @scene.figure()
  try fig.axline(@core.point(0.0, 0.0)) catch {
    @core.DataError::InvalidReference(message~) =>
      assert_true(message.contains("requires"))
    _ => fail("expected invalid axline error")
  } noraise {
    _ => fail("expected an axline error")
  }
  try fig.axline(@core.point(0.0, 0.0), xy2=@core.point(0.0, 0.0)) catch {
    @core.DataError::InvalidReference(message~) =>
      assert_true(message.contains("distinct"))
    _ => fail("expected invalid axline points")
  } noraise {
    _ => fail("expected an axline error")
  }
}

///|
test "axline rejects slope form on logarithmic axes" {
  let fig = @scene.figure()
  try! fig.set_x_scale(@scale.log_scale())
  try fig.axline(@core.point(1.0, 1.0), slope=1.0) catch {
    @core.DataError::InvalidReference(message~) =>
      assert_true(message.contains("non-linear"))
    _ => fail("expected a non-linear axline error")
  } noraise {
    _ => fail("expected a non-linear axline error")
  }
}

///|
test "axline clips two-point lines in logarithmic display space" {
  let fig = @scene.figure(width=320, height=240)
  try! fig.set_bounds(@core.bounds(1.0, 100.0, 1.0, 100.0))
  try! fig.set_x_scale(@scale.log_scale())
  try! fig.set_y_scale(@scale.log_scale())
  try! fig.axline(
    @core.point(2.0, 2.0),
    xy2=@core.point(10.0, 20.0),
    color="#123456",
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("stroke=\"#123456\""))
  assert_true(!svg.contains("NaN"))
}
