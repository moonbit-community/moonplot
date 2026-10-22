// Complete original AsinhTransform / InvertedAsinhTransform source observations.

///|
fn verify_asinh_scale_source(
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
test "Asinh original transform and constructor 0" {
  assert_true(
    try {
      ignore(@scale.asinh_scale(linear_width=0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original transform and constructor 1" {
  assert_true(
    try {
      ignore(@scale.asinh_scale(linear_width=-0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original transform and constructor 2" {
  assert_true(
    try {
      ignore(@scale.asinh_scale(linear_width=-1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original transform and constructor 3" {
  assert_true(
    try {
      ignore(@scale.asinh_scale(linear_width=-1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original transform and constructor 4" {
  let scale = @scale.asinh_scale(linear_width=0.0 / 0.0)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -100.0,
    -1.0,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    1.0,
    100.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.transform(value))
  verify_asinh_scale_source(actual, [
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
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
test "Asinh original transform and constructor 5" {
  let scale = @scale.asinh_scale(linear_width=0.0 / 0.0)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -100.0,
    -1.0,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    1.0,
    100.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.inverse(value))
  verify_asinh_scale_source(actual, [
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
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
test "Asinh original transform and constructor 6" {
  let scale = @scale.asinh_scale(linear_width=1.0 / 0.0)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -100.0,
    -1.0,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    1.0,
    100.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.transform(value))
  verify_asinh_scale_source(actual, [
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
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
test "Asinh original transform and constructor 7" {
  let scale = @scale.asinh_scale(linear_width=1.0 / 0.0)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -100.0,
    -1.0,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    1.0,
    100.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.inverse(value))
  verify_asinh_scale_source(actual, [
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
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
test "Asinh original transform and constructor 8" {
  let scale = @scale.asinh_scale(linear_width=1.0e-308)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -100.0,
    -1.0,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    1.0,
    100.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.transform(value))
  verify_asinh_scale_source(actual, [
    -1.0 / 0.0,
    -1.0 / 0.0,
    -1.0 / 0.0,
    -7.098893558227259e-306,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    7.098893558227259e-306,
    1.0 / 0.0,
    1.0 / 0.0,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "Asinh original transform and constructor 9" {
  let scale = @scale.asinh_scale(linear_width=1.0e-308)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -100.0,
    -1.0,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    1.0,
    100.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.inverse(value))
  verify_asinh_scale_source(actual, [
    -1.0 / 0.0,
    -1.0 / 0.0,
    -1.0 / 0.0,
    -1.0 / 0.0,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    1.0 / 0.0,
    1.0 / 0.0,
    1.0 / 0.0,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "Asinh original transform and constructor 10" {
  let scale = @scale.asinh_scale(linear_width=1.0)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -100.0,
    -1.0,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    1.0,
    100.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.transform(value))
  verify_asinh_scale_source(actual, [
    -1.0 / 0.0,
    -709.889355822726,
    -5.298342365610589,
    -0.881373587019543,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    0.881373587019543,
    5.298342365610589,
    709.889355822726,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "Asinh original transform and constructor 11" {
  let scale = @scale.asinh_scale(linear_width=1.0)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -100.0,
    -1.0,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    1.0,
    100.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.inverse(value))
  verify_asinh_scale_source(actual, [
    -1.0 / 0.0,
    -1.0 / 0.0,
    -1.3440585709080678e+43,
    -1.1752011936438014,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    1.1752011936438014,
    1.3440585709080678e+43,
    1.0 / 0.0,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "Asinh original transform and constructor 12" {
  let scale = @scale.asinh_scale(linear_width=2.0)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -100.0,
    -1.0,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    1.0,
    100.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.transform(value))
  verify_asinh_scale_source(actual, [
    -1.0 / 0.0,
    -1418.392417284332,
    -9.210540341982847,
    -0.9624236501192069,
    -0.0,
    -0.0,
    0.0,
    0.0,
    0.9624236501192069,
    9.210540341982847,
    1418.392417284332,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "Asinh original transform and constructor 13" {
  let scale = @scale.asinh_scale(linear_width=2.0)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -100.0,
    -1.0,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    1.0,
    100.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.inverse(value))
  verify_asinh_scale_source(actual, [
    -1.0 / 0.0,
    -1.0 / 0.0,
    -5.184705528587072e+21,
    -1.0421906109874948,
    -0.0,
    -0.0,
    0.0,
    0.0,
    1.0421906109874948,
    5.184705528587072e+21,
    1.0 / 0.0,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "Asinh original transform and constructor 14" {
  let scale = @scale.asinh_scale(linear_width=1.0e+308)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -100.0,
    -1.0,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    1.0,
    100.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.transform(value))
  verify_asinh_scale_source(actual, [
    -1.0 / 0.0,
    -8.81373587019543e+307,
    -100.0,
    -0.9999999999999999,
    -0.0,
    -0.0,
    0.0,
    0.0,
    0.9999999999999999,
    100.0,
    8.81373587019543e+307,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "Asinh original transform and constructor 15" {
  let scale = @scale.asinh_scale(linear_width=1.0e+308)
  let actual = [
    -1.0 / 0.0,
    -1.0e+308,
    -100.0,
    -1.0,
    -5.0e-324,
    -0.0,
    0.0,
    5.0e-324,
    1.0,
    100.0,
    1.0e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ].map(value => scale.inverse(value))
  verify_asinh_scale_source(actual, [
    -1.0 / 0.0,
    -1.1752011936438015e+308,
    -100.0,
    -0.9999999999999999,
    -0.0,
    -0.0,
    0.0,
    0.0,
    0.9999999999999999,
    100.0,
    1.1752011936438015e+308,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}
