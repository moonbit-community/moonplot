// Original complete forward/inverse SymmetricalLogTransform bodies.

///|
fn verify_symlog_scale_source(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() {
      assert_true(actual[index].is_nan())
    } else if value.is_inf() || value == 0.0 {
      assert_eq(
        actual[index].reinterpret_as_uint64(),
        value.reinterpret_as_uint64(),
      )
    } else {
      assert_true(
        Double::abs(actual[index] - value) <= Double::abs(value) * 1.0e-12,
      )
    }
  }
}

///|
test "SymLog original transform 0: ordinary base10" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=1.0, linscale=1.0)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -100.0,
    -10.0,
    -1.0,
    -0.0,
    0.0,
    1.0,
    10.0,
    100.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.transform(value))
  verify_symlog_scale_source(actual, [
    -1.0 / 0.0,
    -309.1111111111111,
    -3.111111111111111,
    -2.111111111111111,
    -1.1111111111111112,
    -0.0,
    0.0,
    1.1111111111111112,
    2.111111111111111,
    3.111111111111111,
    309.1111111111111,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original transform 1: ordinary base10" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=1.0, linscale=1.0)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -100.0,
    -10.0,
    -1.0,
    -0.0,
    0.0,
    1.0,
    10.0,
    100.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.inverse(value))
  verify_symlog_scale_source(actual, [
    -1.0 / 0.0,
    -1.0 / 0.0,
    -7.742636826811487e+98,
    -774263682.6811295,
    -0.8999999999999999,
    -0.0,
    0.0,
    0.8999999999999999,
    774263682.6811295,
    7.742636826811487e+98,
    1.0 / 0.0,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original transform 2: source default threshold2 and boundary neighbors" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=2.0, linscale=1.0)
  let actual = [
    -2.0000000000000004, -2.0, -1.9999999999999998, -5.0e-324, -0.0, 0.0, 5.0e-324,
    1.9999999999999998, 2.0, 2.0000000000000004,
  ].map(value => scale.transform(value))
  verify_symlog_scale_source(actual, [
    -2.2222222222222223, -2.2222222222222223, -2.222222222222222, -5.0e-324, -0.0,
    0.0, 5.0e-324, 2.222222222222222, 2.2222222222222223, 2.2222222222222223,
  ])
}

///|
test "SymLog original transform 3: source default threshold2 and boundary neighbors" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=2.0, linscale=1.0)
  let actual = [
    -2.0000000000000004, -2.0, -1.9999999999999998, -5.0e-324, -0.0, 0.0, 5.0e-324,
    1.9999999999999998, 2.0, 2.0000000000000004,
  ].map(value => scale.inverse(value))
  verify_symlog_scale_source(actual, [
    -1.8000000000000003, -1.7999999999999998, -1.7999999999999998, -5.0e-324, -0.0,
    0.0, 5.0e-324, 1.7999999999999998, 1.7999999999999998, 1.8000000000000003,
  ])
}

///|
test "SymLog original transform 4: base2 custom linear stretch" {
  let scale = @scale.Scale::SymLog(base=2.0, linthresh=0.5, linscale=2.0)
  let actual = [-100.0, -1.0, -0.5, -0.0, 0.0, 0.5, 1.0, 100.0].map(value => {
    scale.transform(value)
  })
  verify_symlog_scale_source(actual, [
    -5.821928094887363, -2.5, -2.0, -0.0, 0.0, 2.0, 2.5, 5.821928094887363,
  ])
}

///|
test "SymLog original transform 5: base2 custom linear stretch" {
  let scale = @scale.Scale::SymLog(base=2.0, linthresh=0.5, linscale=2.0)
  let actual = [-100.0, -1.0, -0.5, -0.0, 0.0, 0.5, 1.0, 100.0].map(value => {
    scale.inverse(value)
  })
  verify_symlog_scale_source(actual, [
    -5.021681388309324e+58, -0.25, -0.125, -0.0, 0.0, 0.125, 0.25, 5.021681388309324e+58,
  ])
}

///|
test "SymLog original transform 6: base e" {
  let scale = @scale.Scale::SymLog(
    base=2.718281828459045,
    linthresh=1.0,
    linscale=1.0,
  )
  let actual = [-100.0, -2.0, -1.0, 0.0, 1.0, 2.0, 100.0].map(value => {
    scale.transform(value)
  })
  verify_symlog_scale_source(actual, [
    -6.1871468928574185, -2.2751238874292716, -1.5819767068693265, 0.0, 1.5819767068693265,
    2.2751238874292716, 6.1871468928574185,
  ])
}

///|
test "SymLog original transform 7: base e" {
  let scale = @scale.Scale::SymLog(
    base=2.718281828459045,
    linthresh=1.0,
    linscale=1.0,
  )
  let actual = [-100.0, -2.0, -1.0, 0.0, 1.0, 2.0, 100.0].map(value => {
    scale.inverse(value)
  })
  verify_symlog_scale_source(actual, [
    -5.5259179996286897e+42, -1.5189560552320551, -0.6321205588285577, 0.0, 0.6321205588285577,
    1.5189560552320551, 5.5259179996286897e+42,
  ])
}

///|
test "SymLog original transform 8: tiny threshold avoids quotient overflow" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=1.0e-308, linscale=1.0)
  let actual = [
    -1.0e+308, -1.0, -1.0e-308, -5.0e-324, 0.0, 5.0e-324, 1.0e-308, 1.0, 1.0e+308,
  ].map(value => scale.transform(value))
  verify_symlog_scale_source(actual, [
    -6.17111111111111e-306, -3.0911111111111104e-306, -1.1111111111111113e-308, -5.0e-324,
    0.0, 5.0e-324, 1.1111111111111113e-308, 3.0911111111111104e-306, 6.17111111111111e-306,
  ])
}

///|
test "SymLog original transform 9: tiny threshold avoids quotient overflow" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=1.0e-308, linscale=1.0)
  let actual = [
    -1.0e+308, -1.0, -1.0e-308, -5.0e-324, 0.0, 5.0e-324, 1.0e-308, 1.0, 1.0e+308,
  ].map(value => scale.inverse(value))
  verify_symlog_scale_source(actual, [
    -1.0 / 0.0,
    -1.0 / 0.0,
    -8.999999999999997e-309,
    -5.0e-324,
    0.0,
    5.0e-324,
    8.999999999999997e-309,
    1.0 / 0.0,
    1.0 / 0.0,
  ])
}

///|
test "SymLog original transform 10: huge threshold" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=1.0e+308, linscale=1.0)
  let actual = [
    -1.0 / 0.0,
    -1.7976931348623157e+308,
    -1.0e+308,
    -1.0,
    0.0,
    1.0,
    1.0e+308,
    1.7976931348623157e+308,
    1.0 / 0.0,
  ].map(value => scale.transform(value))
  verify_symlog_scale_source(actual, [
    -1.0 / 0.0,
    -1.3658266710277757e+308,
    -1.1111111111111112e+308,
    -1.1111111111111112,
    0.0,
    1.1111111111111112,
    1.1111111111111112e+308,
    1.3658266710277757e+308,
    1.0 / 0.0,
  ])
}

///|
test "SymLog original transform 11: huge threshold" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=1.0e+308, linscale=1.0)
  let actual = [
    -1.0 / 0.0,
    -1.7976931348623157e+308,
    -1.0e+308,
    -1.0,
    0.0,
    1.0,
    1.0e+308,
    1.7976931348623157e+308,
    1.0 / 0.0,
  ].map(value => scale.inverse(value))
  verify_symlog_scale_source(actual, [
    -1.0 / 0.0,
    -1.0 / 0.0,
    -9.0e+307,
    -0.8999999999999999,
    0.0,
    0.8999999999999999,
    9.0e+307,
    1.0 / 0.0,
    1.0 / 0.0,
  ])
}

///|
test "SymLog original transform 12: base nextafter one" {
  let scale = @scale.Scale::SymLog(
    base=1.0000000000000002,
    linthresh=2.0,
    linscale=1.0,
  )
  let actual = [-1.0e+308, -100.0, -2.0, 0.0, 2.0, 100.0, 1.0e+308].map(value => {
    scale.transform(value)
  })
  verify_symlog_scale_source(actual, [
    -6.390635446433433e+18, -4.4243569953763016e+16, -9007199254740992.0, 0.0, 9007199254740992.0,
    4.4243569953763016e+16, 6.390635446433433e+18,
  ])
}

///|
test "SymLog original transform 13: base nextafter one" {
  let scale = @scale.Scale::SymLog(
    base=1.0000000000000002,
    linthresh=2.0,
    linscale=1.0,
  )
  let actual = [-1.0e+308, -100.0, -2.0, 0.0, 2.0, 100.0, 1.0e+308].map(value => {
    scale.inverse(value)
  })
  verify_symlog_scale_source(actual, [
    -1.0 / 0.0,
    -2.220446049250313e-14,
    -4.440892098500626e-16,
    0.0,
    4.440892098500626e-16,
    2.220446049250313e-14,
    1.0 / 0.0,
  ])
}

///|
test "SymLog original transform 14: source accepts infinite base" {
  let scale = @scale.Scale::SymLog(base=1.0 / 0.0, linthresh=2.0, linscale=1.0)
  let actual = [
    -1.0 / 0.0,
    -10.0,
    -2.0,
    -0.0,
    0.0,
    2.0,
    10.0,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.transform(value))
  verify_symlog_scale_source(actual, [
    0.0 / 0.0,
    -2.0,
    -2.0,
    -0.0,
    0.0,
    2.0,
    2.0,
    0.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original transform 15: source accepts infinite base" {
  let scale = @scale.Scale::SymLog(base=1.0 / 0.0, linthresh=2.0, linscale=1.0)
  let actual = [
    -1.0 / 0.0,
    -10.0,
    -2.0,
    -0.0,
    0.0,
    2.0,
    10.0,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.inverse(value))
  verify_symlog_scale_source(actual, [
    -1.0 / 0.0,
    -1.0 / 0.0,
    -2.0,
    -0.0,
    0.0,
    2.0,
    1.0 / 0.0,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original transform 16: source accepts NaN base" {
  let scale = @scale.Scale::SymLog(base=0.0 / 0.0, linthresh=2.0, linscale=1.0)
  let actual = [-10.0, -2.0, -0.0, 0.0, 2.0, 10.0, 0.0 / 0.0].map(value => {
    scale.transform(value)
  })
  verify_symlog_scale_source(actual, [
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original transform 17: source accepts NaN base" {
  let scale = @scale.Scale::SymLog(base=0.0 / 0.0, linthresh=2.0, linscale=1.0)
  let actual = [-10.0, -2.0, -0.0, 0.0, 2.0, 10.0, 0.0 / 0.0].map(value => {
    scale.inverse(value)
  })
  verify_symlog_scale_source(actual, [
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original transform 18: source accepts infinite threshold" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=1.0 / 0.0, linscale=1.0)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -0.0,
    0.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.transform(value))
  verify_symlog_scale_source(actual, [
    -1.0 / 0.0,
    -1.1111111111111112e+308,
    -0.0,
    0.0,
    1.1111111111111112e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original transform 19: source accepts infinite threshold" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=1.0 / 0.0, linscale=1.0)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -0.0,
    0.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.inverse(value))
  verify_symlog_scale_source(actual, [
    -1.0 / 0.0,
    -9.0e+307,
    -0.0,
    0.0,
    9.0e+307,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original transform 20: source accepts NaN threshold" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=0.0 / 0.0, linscale=1.0)
  let actual = [-10.0, -0.0, 0.0, 10.0, 0.0 / 0.0].map(value => {
    scale.transform(value)
  })
  verify_symlog_scale_source(actual, [
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original transform 21: source accepts NaN threshold" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=0.0 / 0.0, linscale=1.0)
  let actual = [-10.0, -0.0, 0.0, 10.0, 0.0 / 0.0].map(value => {
    scale.inverse(value)
  })
  verify_symlog_scale_source(actual, [
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original transform 22: source accepts infinite stretch" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=2.0, linscale=1.0 / 0.0)
  let actual = [-1.0 / 0.0, -10.0, -0.0, 0.0, 10.0, 1.0 / 0.0, 0.0 / 0.0].map(value => {
    scale.transform(value)
  })
  verify_symlog_scale_source(actual, [
    -1.0 / 0.0,
    -1.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    1.0 / 0.0,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original transform 23: source accepts infinite stretch" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=2.0, linscale=1.0 / 0.0)
  let actual = [-1.0 / 0.0, -10.0, -0.0, 0.0, 10.0, 1.0 / 0.0, 0.0 / 0.0].map(value => {
    scale.inverse(value)
  })
  verify_symlog_scale_source(actual, [
    0.0 / 0.0,
    -0.0,
    -0.0,
    0.0,
    0.0,
    0.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original transform 24: source accepts NaN stretch" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=2.0, linscale=0.0 / 0.0)
  let actual = [-10.0, -0.0, 0.0, 10.0, 0.0 / 0.0].map(value => {
    scale.transform(value)
  })
  verify_symlog_scale_source(actual, [
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original transform 25: source accepts NaN stretch" {
  let scale = @scale.Scale::SymLog(base=10.0, linthresh=2.0, linscale=0.0 / 0.0)
  let actual = [-10.0, -0.0, 0.0, 10.0, 0.0 / 0.0].map(value => {
    scale.inverse(value)
  })
  verify_symlog_scale_source(actual, [
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
  ])
}
