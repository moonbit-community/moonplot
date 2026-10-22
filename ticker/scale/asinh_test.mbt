///|
test "Asinh geometry classification keeps finite domain and source width predicate" {
  let scale = @scale.asinh_scale(linear_width=2.0)
  assert_true(scale.is_asinh())
  assert_true(scale.is_nonlinear())
  assert_true(!scale.is_log())
  assert_true(!scale.is_symlog())
  assert_eq(scale.asinh_linear_width(), Some(2.0))
  assert_eq(scale.symlog_base(), None)
  assert_eq(scale.symlog_linthresh(), None)
  assert_true(scale.is_valid(-100.0))
  assert_true(scale.is_valid(-0.0))
  assert_true(!scale.is_valid(1.0 / 0.0))
  assert_true(!scale.is_valid(0.0 / 0.0))
  assert_true(!@scale.linear_scale().is_asinh())
  assert_eq(@scale.linear_scale().asinh_linear_width(), None)
  assert_true(
    @scale.asinh_scale(linear_width=0.0 / 0.0)
    .asinh_linear_width()
    .unwrap()
    .is_nan(),
  )
  assert_eq(
    @scale.asinh_scale(linear_width=1.0 / 0.0).asinh_linear_width(),
    Some(1.0 / 0.0),
  )
}

///|
test "Asinh convenience sampling preserves endpoints direction and invalid geometry policy" {
  let scale = @scale.asinh_scale()
  let ticks = scale.tick_values(@core.limits(-100.0, 100.0))
  assert_eq(ticks.length(), 6)
  assert_eq(ticks[0], -100.0)
  assert_eq(ticks[5], 100.0)
  let reversed = scale.tick_values(@core.limits(100.0, -100.0))
  assert_eq(reversed.length(), 6)
  assert_eq(reversed[0], 100.0)
  assert_eq(reversed[5], -100.0)
  for index in 1..<reversed.length() {
    assert_true(reversed[index] < reversed[index - 1])
  }
  assert_eq(scale.tick_values(@core.limits(2.0, 3.0), count=-4), [2.0, 3.0])
  let singleton = scale.tick_values(@core.limits(-0.0, 0.0), count=100001)
  assert_eq(singleton.length(), 1)
  assert_eq(
    singleton[0].reinterpret_as_uint64(),
    (-0.0).reinterpret_as_uint64(),
  )
  assert_eq(scale.tick_values(@core.limits(0.0 / 0.0, 1.0)), [])
  assert_eq(scale.tick_values(@core.limits(0.0, 1.0 / 0.0)), [])
  for width in [0.0 / 0.0, 1.0 / 0.0, 1.0e-308] {
    let invalid_geometry = @scale.asinh_scale(linear_width=width)
    assert_eq(invalid_geometry.tick_values(@core.limits(100.0, 200.0)), [])
  }
}

///|
test "Asinh convenience prefix retains the full requested denominator" {
  let scale = @scale.asinh_scale()
  let ticks = scale.tick_values(@core.limits(-1.0, 1.0), count=200001)
  assert_eq(ticks.length(), 100000)
  assert_eq(ticks[0], -1.0)
  assert_true(ticks[99999] < 0.0)
  let lower = scale.transform(-1.0)
  let upper = scale.transform(1.0)
  let actual = (scale.transform(ticks[99999]) - lower) / (upper - lower)
  let expected = 99999.0 / 200000.0
  assert_true(Double::abs(actual - expected) <= Double::abs(expected) * 1.0e-12)
}

///|
test "Asinh convenience sampling handles finite endpoints with overflowing display span" {
  let scale = @scale.asinh_scale(linear_width=1.0e308)
  let magnitude = 1.7976931348623157e308
  let ticks = scale.tick_values(@core.limits(-magnitude, magnitude))
  assert_eq(ticks.length(), 6)
  assert_eq(ticks[0], -magnitude)
  assert_eq(ticks[5], magnitude)
  for index, value in ticks {
    assert_true(!value.is_nan() && !value.is_inf())
    if index > 0 {
      assert_true(value > ticks[index - 1])
    }
  }
}
