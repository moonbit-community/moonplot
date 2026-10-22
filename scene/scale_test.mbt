///|
test "axes expose logarithmic scales and loglog plotting" {
  let fig = @scene.figure(width=360, height=240)
  let ax = fig.axes()
  try! ax.loglog([1.0, 10.0, 100.0], [10.0, 100.0, 1000.0], label="power")
  assert_true(ax.x_scale().is_log())
  assert_true(ax.y_scale().is_log())
  let svg = fig.to_svg()
  assert_true(svg.contains("power"))
  assert_true(svg.contains(">1<"))
  assert_true(svg.contains(">100<"))
  assert_true(!svg.contains("NaN"))
}

///|
test "semilog helpers only change their named axis" {
  let fig = @scene.figure()
  let ax = fig.axes()
  try! ax.semilogx([1.0, 10.0], [0.0, 1.0])
  assert_true(ax.x_scale().is_log())
  assert_true(!ax.y_scale().is_log())
  try! ax.semilogy([0.0, 1.0], [1.0, 10.0])
  assert_true(ax.x_scale().is_log())
  assert_true(ax.y_scale().is_log())
}

///|
test "semilog helpers preserve an existing scale on the other axis" {
  let fig = @scene.figure()
  let ax = fig.axes()
  try! ax.set_y_scale(@scale.log_scale())
  try! ax.semilogx([1.0, 10.0], [1.0, 10.0])
  assert_true(ax.x_scale().is_log())
  assert_true(ax.y_scale().is_log())

  let second = @scene.figure().axes()
  try! second.set_x_scale(@scale.log_scale())
  try! second.semilogy([1.0, 10.0], [1.0, 10.0])
  assert_true(second.x_scale().is_log())
  assert_true(second.y_scale().is_log())
}

///|
test "log scales reject non-positive explicit limits and categories" {
  let axis = @axis.axis()
  try! axis.set_scale(@scale.log_scale())
  try axis.set_limits(0.0, 10.0) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("positive"))
    _ => fail("expected positive log limit error")
  } noraise {
    _ => fail("expected a log limit error")
  }
  try axis.set_categories(["a", "b"]) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("category"))
    _ => fail("expected category/log conflict")
  } noraise {
    _ => fail("expected a category/log error")
  }
}

///|
test "log scales reject non-positive fixed ticks" {
  let axis = @axis.axis()
  try! axis.set_scale(@scale.log_scale())
  try axis.set_ticks([1.0, 0.0, 10.0]) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("positive"))
    _ => fail("expected positive log tick error")
  } noraise {
    _ => fail("expected a log tick error")
  }
}

///|
test "axes render a symmetric logarithmic scale across zero" {
  let fig = @scene.figure(width=360, height=240)
  let ax = fig.axes()
  let symlog = try! @scale.symlog_scale(linthresh=1.0)
  try! ax.set_x_scale(symlog)
  try! ax.set_y_scale(symlog)
  try! ax.plot([-100.0, -1.0, 0.0, 1.0, 100.0], [-100.0, -1.0, 0.0, 1.0, 100.0])
  assert_true(ax.x_scale().is_nonlinear())
  assert_true(ax.x_scale().is_valid(-1.0))
  let svg = fig.to_svg()
  assert_true(svg.contains("-100"))
  assert_true(svg.contains("100"))
  assert_true(!svg.contains("NaN"))
}
