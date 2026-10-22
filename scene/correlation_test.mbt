///|
test "acorr and xcorr return lags and render correlation lines" {
  let fig = @scene.figure(width=360, height=260)
  let auto = try! fig.acorr([1.0, 2.0, 3.0], maxlags=1, color="#123456")
  assert_eq(auto.lags(), [-1.0, 0.0, 1.0])
  assert_true(auto.values()[1] == 1.0)
  let cross = try! fig.xcorr(
    [1.0, 2.0, 3.0],
    [3.0, 2.0, 1.0],
    maxlags=1,
    usevlines=false,
    color="#abcdef",
    label="cross",
  )
  assert_eq(cross.values().length(), 3)
  let svg = fig.to_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("<line"))
  assert_true(svg.contains("<polyline"))
  assert_true(svg.contains("cross"))
}

///|
test "correlations apply the supplied detrending function" {
  let fig = @scene.figure()
  let auto = try! fig.acorr(
    [1.0, 2.0, 3.0],
    detrend=@scene.detrend_mean,
    maxlags=2,
    usevlines=false,
  )
  assert_eq(auto.lags(), [-2.0, -1.0, 0.0, 1.0, 2.0])
  assert_true(auto.values()[0] == -0.5)
  assert_true(auto.values()[2] == 1.0)
  assert_true(auto.values()[4] == -0.5)

  let cross = try! fig.xcorr(
    [1.0, 2.0, 3.0],
    [3.0, 2.0, 1.0],
    detrend=values => values.map(value => value * 2.0),
    normed=false,
    maxlags=1,
    usevlines=false,
  )
  assert_eq(cross.values(), [16.0, 40.0, 48.0])

  let residuals = @scene.detrend_linear([1.0, 2.0, 4.0])
  assert_true(Double::abs(residuals[0] - 1.0 / 6.0) < 1.0e-12)
  assert_true(Double::abs(residuals[1] + 1.0 / 3.0) < 1.0e-12)
  assert_true(Double::abs(residuals[2] - 1.0 / 6.0) < 1.0e-12)
}

///|
test "correlation rejects detrenders that change length or produce invalid data" {
  let fig = @scene.figure()
  try fig.acorr([1.0, 2.0], detrend=values => values[:1].to_owned()) catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 2)
      assert_eq(actual, 1)
    }
    _ => fail("expected a detrend length error")
  } noraise {
    _ => fail("expected a detrend length error")
  }
  try
    fig.xcorr([1.0, 2.0], [2.0, 1.0], detrend=values => {
      values.map(_ => @double.not_a_number)
    })
  catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("finite"))
    _ => fail("expected a detrend finite-value error")
  } noraise {
    _ => fail("expected a detrend finite-value error")
  }
}

///|
test "correlation validates samples and lag controls" {
  let fig = @scene.figure()
  try fig.acorr([], maxlags=1) catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("at least one"))
    _ => fail("expected an empty correlation error")
  } noraise {
    _ => fail("expected an empty correlation error")
  }
  try fig.xcorr([1.0], [1.0, 2.0]) catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 1)
      assert_eq(actual, 2)
    }
    _ => fail("expected a correlation length error")
  } noraise {
    _ => fail("expected a correlation length error")
  }
  try fig.acorr([1.0, 2.0], maxlags=-1) catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("maxlags"))
    _ => fail("expected a correlation lag error")
  } noraise {
    _ => fail("expected a correlation lag error")
  }
}
