///|
test "advanced Barbs reject nonfinite derived magnitudes and unrepresentable flag full or total counts before expansion" {
  for
    (u, half, full, flag, rounding) in [
      (1.0e200, 5.0, 10.0, 50.0, true),
      (1.0, 1.0e-309, 2.0e-309, 3.0e-309, true),
      (1.0, 1.0e-12, 1.0e-12, 1.0e-12, false),
      (1.0, 1.0e-12, 1.0e-12, 50.0, false),
      (2147483647.0, 1.0, 1.0, 1.0, false),
    ] {
    let fig = figure()
    try
      fig.barbs_with_options(
        [0.0],
        [0.0],
        [u],
        [0.0],
        half_increment=half,
        full_increment=full,
        flag_increment=flag,
        rounding~,
      )
    catch {
      @core.DataError::InvalidQuiver(message~) =>
        assert_true(message.contains("derived"))
      _ => fail("Expected derived Barbs error")
    } noraise {
      _ => fail("Unrepresentable expansion must reject before a loop")
    }
    assert_eq((fig.artists().length(), fig.containers().length()), (0, 0))
  }
}

///|
test "advanced Barbs derived errors preserve earlier valid input components" {
  let fig = figure()
  try
    fig.barbs_with_options([0.0, 1.0], [0.0, 0.0], [55.0, 1.0e200], [0.0, 0.0])
  catch {
    @core.DataError::InvalidQuiver(_) => ()
    _ => fail("Expected derived magnitude error")
  } noraise {
    _ => fail("Expected overflow")
  }
  assert_eq(fig.artists().length(), 3)
  let expected = figure()
  expected.barbs_with_options([0.0], [0.0], [55.0], [0.0])
  assert_eq(fig.to_svg_checked(), expected.to_svg_checked())
}

///|
test "Barbs count guard uses representable lengths rather than an arbitrary small cap" {
  assert_eq(
    checked_barb_counts(2147483646.0, 1.0, 1.0, 1.0, 0),
    (2147483646, 0, 0),
  )
  assert_eq(checked_barb_counts(1000000.0, 1.0, 1.0, 1.0, 0), (1000000, 0, 0))
  assert_eq(checked_barb_counts(55.0, 5.0, 10.0, 50.0, 0), (1, 0, 1))
  try checked_barb_counts(2147483646.0, 1.0, 1.0, 1.0, 1) catch {
    @core.DataError::InvalidQuiver(_) => ()
    _ => fail("Expected total length error")
  } noraise {
    _ => fail("Previous components also consume representable length")
  }
}
