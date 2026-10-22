///|
test "barbs render shafts and wind wings" {
  let fig = @scene.figure(width=320, height=240)
  try! fig.barbs(
    [0.0, 1.0],
    [0.0, 1.0],
    [1.0, -0.5],
    [0.5, 1.0],
    color="#123456",
    label="wind",
  )
  assert_eq(fig.artists().length(), 8)
  let svg = fig.to_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("<line"))
  assert_true(svg.contains("wind"))
}

///|
test "barbs validate vector lengths and styles" {
  let fig = @scene.figure()
  try fig.barbs([0.0], [0.0], [1.0, 2.0], [0.0]) catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 1)
      assert_eq(actual, 2)
    }
    _ => fail("expected a barb vector length error")
  } noraise {
    _ => fail("expected a barb vector length error")
  }
  try fig.barbs([0.0], [0.0], [1.0], [0.0], barb_length=-0.1) catch {
    @core.DataError::InvalidQuiver(message~) =>
      assert_true(message.contains("length"))
    _ => fail("expected a barb style error")
  } noraise {
    _ => fail("expected a barb style error")
  }
}

///|
test "advanced barbs render flags full barbs and half barbs" {
  let fig = @scene.figure(width=320, height=240)
  try! fig.barbs_with_options(
    [0.0, 1.0],
    [0.0, 1.0],
    [55.0, 25.0],
    [0.0, 0.0],
    color="#123456",
    label="advanced-wind",
  )
  // 55 = one flag plus one half barb; 25 = two full barbs plus one half.
  assert_eq(fig.artists().length(), 7)
  let svg = fig.to_svg()
  assert_true(svg.contains("<polygon"))
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("advanced-wind"))
}

///|
test "advanced barbs support calm fill, pivot, and validation" {
  let filled = @scene.figure()
  try! filled.barbs_with_options([0.0], [0.0], [0.0], [0.0], pivot="middle")
  assert_eq(filled.artists().length(), 1)
  let empty = @scene.figure()
  try! empty.barbs_with_options([0.0], [0.0], [0.0], [0.0], fill_empty=false)
  assert_eq(empty.artists().length(), 0)
  try
    filled.barbs_with_options([0.0], [0.0], [1.0], [0.0], half_increment=0.0)
  catch {
    @core.DataError::InvalidQuiver(message~) =>
      assert_true(message.contains("increments"))
    _ => fail("expected a barb increment error")
  } noraise {
    _ => fail("expected a barb increment error")
  }
  try
    filled.barbs_with_options([0.0], [0.0], [1.0], [0.0], pivot="center")
  catch {
    @core.DataError::InvalidQuiver(message~) =>
      assert_true(message.contains("pivot"))
    _ => fail("expected a barb pivot error")
  } noraise {
    _ => fail("expected a barb pivot error")
  }
}
