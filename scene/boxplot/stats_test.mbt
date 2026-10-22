///|
test "box statistics compute quartiles, whiskers, and fliers" {
  let stats = try! @boxplot.box_stats([1.0, 2.0, 3.0, 4.0, 5.0, 20.0])
  assert_eq(stats.q1(), 2.25)
  assert_eq(stats.median(), 3.5)
  assert_eq(stats.q3(), 4.75)
  assert_eq(stats.lower_whisker(), 1.0)
  assert_eq(stats.upper_whisker(), 5.0)
  assert_eq(stats.fliers(), [20.0])
}

///|
test "box statistics ignore non-finite values and reject empty input" {
  let stats = try! @boxplot.box_stats([0.0 / 0.0, 1.0, 2.0, 1.0 / 0.0])
  assert_eq(stats.median(), 1.5)
  try @boxplot.box_stats([0.0 / 0.0]) catch {
    @core.DataError::InvalidBoxPlot(message~) =>
      assert_true(message.contains("finite"))
    _ => fail("expected invalid boxplot error")
  } noraise {
    _ => fail("expected a boxplot error")
  }
}
