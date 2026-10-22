///|
test "boxplot renders boxes, whiskers, medians, and fliers" {
  let fig = @scene.figure(width=360, height=240)
  let stats = try! fig.boxplot([
    [1.0, 2.0, 3.0, 4.0, 5.0, 20.0],
    [2.0, 3.0, 4.0, 5.0],
  ])
  assert_eq(stats.length(), 2)
  let svg = fig.to_svg()
  assert_true(svg.contains("#1f77b4"))
  assert_true(svg.contains("<rect"))
  assert_true(svg.contains("<circle"))
}

///|
test "horizontal boxplot and empty input validation" {
  let fig = @scene.figure(width=360, height=240)
  ignore(try! fig.boxplot([[1.0, 2.0, 3.0]], horizontal=true, color="#abcdef"))
  assert_true(fig.to_svg().contains("#abcdef"))
  try fig.boxplot([]) catch {
    @core.DataError::InvalidBoxPlot(message~) =>
      assert_true(message.contains("series"))
    _ => fail("expected empty boxplot error")
  } noraise {
    _ => fail("expected a boxplot error")
  }
}
