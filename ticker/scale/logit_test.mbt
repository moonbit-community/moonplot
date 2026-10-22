///|
test "Logit geometry classifies strict probabilities independently of clipping" {
  for mode in ["mask", "clip"] {
    let scale = @scale.logit_scale(nonpositive=mode)
    assert_true(scale.is_logit())
    assert_true(scale.is_nonlinear())
    assert_true(!scale.is_log() && !scale.is_symlog() && !scale.is_asinh())
    assert_eq(scale.logit_nonpositive(), Some(mode))
    assert_eq(scale.asinh_linear_width(), None)
    assert_eq(scale.symlog_base(), None)
    assert_eq(scale.symlog_linthresh(), None)
    for value in [0.0, -0.0, -1.0, 1.0, 2.0, 1.0 / 0.0, 0.0 / 0.0] {
      assert_true(!scale.is_valid(value))
    }
    for value in [5.0e-324, 0.1, 0.5, 0.9999999999999999] {
      assert_true(scale.is_valid(value))
    }
  }
  assert_eq(@scale.linear_scale().logit_nonpositive(), None)
}

///|
test "Logit convenience sampler preserves direction endpoints and independent count policy" {
  let scale = @scale.logit_scale()
  let ticks = scale.tick_values(@core.limits(0.01, 0.99))
  assert_eq(ticks.length(), 6)
  assert_eq(ticks[0], 0.01)
  assert_eq(ticks[5], 0.99)
  let reversed = scale.tick_values(@core.limits(0.99, 0.01))
  assert_eq(reversed.length(), 6)
  assert_eq(reversed[0], 0.99)
  assert_eq(reversed[5], 0.01)
  for index in 1..<reversed.length() {
    assert_true(reversed[index] < reversed[index - 1])
  }
  assert_eq(scale.tick_values(@core.limits(0.2, 0.8), count=-4), [0.2, 0.8])
  assert_eq(scale.tick_values(@core.limits(0.5, 0.5), count=100001), [0.5])
  assert_eq(scale.tick_values(@core.limits(5.0e-324, 5.0e-324)), [5.0e-324])
}

///|
test "Logit convenience sampler rejects invalid original and rounded inverse probabilities" {
  for scale in [@scale.logit_scale(), @scale.logit_scale(nonpositive="clip")] {
    for lower in [-1.0, 0.0, 1.0, 2.0, 0.0 / 0.0, 1.0 / 0.0] {
      assert_eq(scale.tick_values(@core.limits(lower, 0.5)), [])
      assert_eq(scale.tick_values(@core.limits(0.5, lower)), [])
    }
    assert_eq(scale.tick_values(@core.limits(0.0, 0.0)), [])
    assert_eq(scale.tick_values(@core.limits(5.0e-324, 1.0e-323)), [])
  }
}

///|
test "Logit convenience cap retains the full display interpolation denominator" {
  let scale = @scale.logit_scale()
  let ticks = scale.tick_values(@core.limits(0.01, 0.99), count=200001)
  assert_eq(ticks.length(), 100000)
  assert_eq(ticks[0], 0.01)
  assert_true(ticks[99999] < 0.5)
  let lower = scale.transform(0.01)
  let upper = scale.transform(0.99)
  let actual = (scale.transform(ticks[99999]) - lower) / (upper - lower)
  let expected = 99999.0 / 200000.0
  assert_true(Double::abs(actual - expected) <= Double::abs(expected) * 1.0e-12)
}
