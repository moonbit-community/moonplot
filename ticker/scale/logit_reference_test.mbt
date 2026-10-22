// Original complete Logit/Logistic transform and actual Scale range restriction.

///|
fn verify_logit_scale_source(
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
test "Logit original geometry 0" {
  let scale = @scale.logit_scale(nonpositive="mask")
  verify_logit_scale_source(
    [
      -1.0 / 0.0,
      -1.0,
      -5.0e-324,
      -0.0,
      0.0,
      5.0e-324,
      1.0e-308,
      0.01,
      0.1,
      0.5,
      0.9,
      0.99,
      0.9999999999999999,
      1.0,
      1.0000000000000002,
      2.0,
      1.0 / 0.0,
      0.0 / 0.0,
    ].map(value => scale.transform(value)),
    [
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      -1.0 / 0.0,
      -1.0 / 0.0,
      -323.3062153431158,
      -308.0,
      -1.99563519459755,
      -0.9542425094393249,
      0.0,
      0.954242509439325,
      1.9956351945975495,
      15.954589770191003,
      1.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
    ],
  )
}

///|
test "Logit original geometry 1" {
  let scale = @scale.logit_scale(nonpositive="mask")
  verify_logit_scale_source(
    [
      -1.0 / 0.0,
      -1000.0,
      -324.0,
      -308.0,
      -2.0,
      -1.0,
      -0.0,
      0.0,
      1.0,
      2.0,
      16.0,
      17.0,
      308.0,
      324.0,
      1000.0,
      1.0 / 0.0,
      0.0 / 0.0,
    ].map(value => scale.inverse(value)),
    [
      0.0,
      0.0,
      0.0,
      1.0e-308,
      0.009900990099009901,
      0.09090909090909091,
      0.5,
      0.5,
      0.9090909090909091,
      0.9900990099009901,
      1.0,
      1.0,
      1.0,
      1.0,
      1.0,
      1.0,
      0.0 / 0.0,
    ],
  )
}

///|
test "Logit original geometry 2" {
  let scale = @scale.logit_scale(nonpositive="clip")
  verify_logit_scale_source(
    [
      -1.0 / 0.0,
      -1.0,
      -5.0e-324,
      -0.0,
      0.0,
      5.0e-324,
      1.0e-308,
      0.01,
      0.1,
      0.5,
      0.9,
      0.99,
      0.9999999999999999,
      1.0,
      1.0000000000000002,
      2.0,
      1.0 / 0.0,
      0.0 / 0.0,
    ].map(value => scale.transform(value)),
    [
      -1000.0,
      -1000.0,
      -1000.0,
      -1000.0,
      -1000.0,
      -323.3062153431158,
      -308.0,
      -1.99563519459755,
      -0.9542425094393249,
      0.0,
      0.954242509439325,
      1.9956351945975495,
      15.954589770191003,
      1000.0,
      1000.0,
      1000.0,
      1000.0,
      0.0 / 0.0,
    ],
  )
}

///|
test "Logit original geometry 3" {
  let scale = @scale.logit_scale(nonpositive="clip")
  verify_logit_scale_source(
    [
      -1.0 / 0.0,
      -1000.0,
      -324.0,
      -308.0,
      -2.0,
      -1.0,
      -0.0,
      0.0,
      1.0,
      2.0,
      16.0,
      17.0,
      308.0,
      324.0,
      1000.0,
      1.0 / 0.0,
      0.0 / 0.0,
    ].map(value => scale.inverse(value)),
    [
      0.0,
      0.0,
      0.0,
      1.0e-308,
      0.009900990099009901,
      0.09090909090909091,
      0.5,
      0.5,
      0.9090909090909091,
      0.9900990099009901,
      1.0,
      1.0,
      1.0,
      1.0,
      1.0,
      1.0,
      0.0 / 0.0,
    ],
  )
}

///|
test "Logit original mode validation 0" {
  assert_true(
    try {
      ignore(@scale.logit_scale(nonpositive="invalid"))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Logit original mode validation 1" {
  assert_true(
    try {
      ignore(@scale.logit_scale(nonpositive="MASK"))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Logit original mode validation 2" {
  assert_true(
    try {
      ignore(@scale.logit_scale(nonpositive=""))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Logit original mode validation 3" {
  assert_true(
    try {
      ignore(@scale.logit_scale(nonpositive="clip "))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Logit original actual Scale limiter 0: linear" {
  let scale = @scale.linear_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.01)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 1: linear" {
  let scale = @scale.linear_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.9)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 2: linear" {
  let scale = @scale.linear_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 1.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 3: linear" {
  let scale = @scale.linear_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 2.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 4: linear" {
  let scale = @scale.linear_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 5: linear" {
  let scale = @scale.linear_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, -0.1)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 6: linear" {
  let scale = @scale.linear_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.0 / 0.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 7: linear" {
  let scale = @scale.linear_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 1.0 / 0.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 8: log" {
  let scale = @scale.log_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.01)
  verify_logit_scale_source([actual.0, actual.1], [0.01, 2.0])
}

///|
test "Logit original actual Scale limiter 9: log" {
  let scale = @scale.log_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.9)
  verify_logit_scale_source([actual.0, actual.1], [0.9, 2.0])
}

///|
test "Logit original actual Scale limiter 10: log" {
  let scale = @scale.log_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 1.0)
  verify_logit_scale_source([actual.0, actual.1], [1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 11: log" {
  let scale = @scale.log_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 2.0)
  verify_logit_scale_source([actual.0, actual.1], [2.0, 2.0])
}

///|
test "Logit original actual Scale limiter 12: log" {
  let scale = @scale.log_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.0)
  verify_logit_scale_source([actual.0, actual.1], [0.0, 2.0])
}

///|
test "Logit original actual Scale limiter 13: log" {
  let scale = @scale.log_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, -0.1)
  verify_logit_scale_source([actual.0, actual.1], [-0.1, 2.0])
}

///|
test "Logit original actual Scale limiter 14: log" {
  let scale = @scale.log_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.0 / 0.0)
  verify_logit_scale_source([actual.0, actual.1], [1.0e-300, 2.0])
}

///|
test "Logit original actual Scale limiter 15: log" {
  let scale = @scale.log_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 1.0 / 0.0)
  verify_logit_scale_source([actual.0, actual.1], [1.0e-300, 2.0])
}

///|
test "Logit original actual Scale limiter 16: symlog" {
  let scale = @scale.symlog_scale(linthresh=2.0)
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.01)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 17: symlog" {
  let scale = @scale.symlog_scale(linthresh=2.0)
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.9)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 18: symlog" {
  let scale = @scale.symlog_scale(linthresh=2.0)
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 1.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 19: symlog" {
  let scale = @scale.symlog_scale(linthresh=2.0)
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 2.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 20: symlog" {
  let scale = @scale.symlog_scale(linthresh=2.0)
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 21: symlog" {
  let scale = @scale.symlog_scale(linthresh=2.0)
  let actual = scale.limit_range_for_scale(-1.0, 2.0, -0.1)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 22: symlog" {
  let scale = @scale.symlog_scale(linthresh=2.0)
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.0 / 0.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 23: symlog" {
  let scale = @scale.symlog_scale(linthresh=2.0)
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 1.0 / 0.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 24: asinh" {
  let scale = @scale.asinh_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.01)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 25: asinh" {
  let scale = @scale.asinh_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.9)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 26: asinh" {
  let scale = @scale.asinh_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 1.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 27: asinh" {
  let scale = @scale.asinh_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 2.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 28: asinh" {
  let scale = @scale.asinh_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 29: asinh" {
  let scale = @scale.asinh_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, -0.1)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 30: asinh" {
  let scale = @scale.asinh_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.0 / 0.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 31: asinh" {
  let scale = @scale.asinh_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 1.0 / 0.0)
  verify_logit_scale_source([actual.0, actual.1], [-1.0, 2.0])
}

///|
test "Logit original actual Scale limiter 32: logit" {
  let scale = @scale.logit_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.01)
  verify_logit_scale_source([actual.0, actual.1], [0.01, 0.99])
}

///|
test "Logit original actual Scale limiter 33: logit" {
  let scale = @scale.logit_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.9)
  verify_logit_scale_source([actual.0, actual.1], [0.9, 0.09999999999999998])
}

///|
test "Logit original actual Scale limiter 34: logit" {
  let scale = @scale.logit_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 1.0)
  verify_logit_scale_source([actual.0, actual.1], [1.0, 0.0])
}

///|
test "Logit original actual Scale limiter 35: logit" {
  let scale = @scale.logit_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 2.0)
  verify_logit_scale_source([actual.0, actual.1], [2.0, -1.0])
}

///|
test "Logit original actual Scale limiter 36: logit" {
  let scale = @scale.logit_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.0)
  verify_logit_scale_source([actual.0, actual.1], [0.0, 1.0])
}

///|
test "Logit original actual Scale limiter 37: logit" {
  let scale = @scale.logit_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, -0.1)
  verify_logit_scale_source([actual.0, actual.1], [-0.1, 1.1])
}

///|
test "Logit original actual Scale limiter 38: logit" {
  let scale = @scale.logit_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 0.0 / 0.0)
  verify_logit_scale_source([actual.0, actual.1], [1.0e-07, 0.9999999])
}

///|
test "Logit original actual Scale limiter 39: logit" {
  let scale = @scale.logit_scale()
  let actual = scale.limit_range_for_scale(-1.0, 2.0, 1.0 / 0.0)
  verify_logit_scale_source([actual.0, actual.1], [1.0e-07, 0.9999999])
}
