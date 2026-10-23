///|
test "pyplot-created Line removes from current axes and SVG without changing its data" {
  @pyplot.close()
  defer @pyplot.close()
  let fig = @pyplot.figure(width=400, height=200)
  let axes = @pyplot.axes(left=0.0, bottom=0.0, width=1.0, height=1.0)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  let line = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([0.0, 1.0]),
    color="#d1e2f3",
  )
  assert_true(fig.to_svg_checked().contains("#d1e2f3"))
  let original = line.xy_values_checked().to_array()
  line.remove()
  assert_eq(axes.artists().length(), 0)
  assert_true(!fig.to_svg_checked().contains("#d1e2f3"))
  assert_eq(line.xy_values_checked().to_array(), original)
  try line.remove() catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "ValueError: list.remove(x): x not in list")
    _ => fail("expected the retained removal callback's membership error")
  } noraise {
    _ => fail("expected repeated remove to fail")
  }
  assert_eq(@pyplot.gca().artists().length(), 0)
}

///|
test "pyplot distinguishes clear-detached from previously removed handles after a new attachment" {
  @pyplot.close()
  defer @pyplot.close()
  let fig = @pyplot.figure(width=400, height=200)
  let axes = @pyplot.gca()
  let removed = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([0.0, 1.0]),
    color="#abc102",
  )
  let cleared = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([1.0, 0.0]),
    color="#abc203",
  )
  removed.remove()
  axes.clear_checked()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  let current = @pyplot.plot_line(
    @scene.LineData::Numeric([0.0, 1.0]),
    @scene.LineData::Numeric([0.5, 0.5]),
    color="#abc304",
  )
  try cleared.remove() catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "NotImplementedError: cannot remove artist")
    _ => fail("expected clear to disable the attached Line's removal callback")
  } noraise {
    _ => fail("expected clear-detached remove to fail")
  }
  try removed.remove() catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "ValueError: list.remove(x): x not in list")
    _ => fail("expected an already removed handle to retain its old callback")
  } noraise {
    _ => fail("expected the historical repeated-remove error")
  }
  assert_eq(axes.artists().length(), 1)
  assert_eq(current.y_values_checked().to_array(), [0.5, 0.5])
  let svg = fig.to_svg_checked()
  assert_true(svg.contains("#abc304"))
  assert_true(!svg.contains("#abc102"))
  assert_true(!svg.contains("#abc203"))
}
