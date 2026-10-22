// Complete original Asinh AST, independent mathematical primitives and explicit NaN ordering profile.

///|
fn verify_asinh_grid_bits(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() {
      assert_true(actual[index].is_nan())
    } else {
      assert_eq(
        actual[index].reinterpret_as_uint64(),
        value.reinterpret_as_uint64(),
      )
    }
  }
}

///|
test "Asinh grid 0 complete width domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 1 complete width domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
    1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7000000000000002, 1.8, 1.9, 2.0,
  ])
}

///|
test "Asinh grid 2 complete width domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 3 complete width domain" {
  let locator = AsinhLocator::new(
    -1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 4 complete width domain" {
  let locator = AsinhLocator::new(
    -1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
    1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7000000000000002, 1.8, 1.9, 2.0,
  ])
}

///|
test "Asinh grid 5 complete width domain" {
  let locator = AsinhLocator::new(
    -1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 6 complete width domain" {
  let locator = AsinhLocator::new(
    0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
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
test "Asinh grid 7 complete width domain" {
  let locator = AsinhLocator::new(
    0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
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
test "Asinh grid 8 complete width domain" {
  let locator = AsinhLocator::new(
    0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
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
test "Asinh grid 9 complete width domain" {
  let locator = AsinhLocator::new(
    -0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
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
test "Asinh grid 10 complete width domain" {
  let locator = AsinhLocator::new(
    -0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
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
test "Asinh grid 11 complete width domain" {
  let locator = AsinhLocator::new(
    -0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
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
test "Asinh grid 12 complete width domain" {
  let locator = AsinhLocator::new(
    1.0e-300,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -1.0e-59, -1.0e-119, -1.0e-180, -1.0e-240, 0.0, 1.0e-240, 1.0e-180, 1.0e-119,
    1.0e-59, 100.0,
  ])
}

///|
test "Asinh grid 13 complete width domain" {
  let locator = AsinhLocator::new(
    1.0e-300,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
    1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7000000000000002, 1.8, 1.9, 2.0,
  ])
}

///|
test "Asinh grid 14 complete width domain" {
  let locator = AsinhLocator::new(
    1.0e-300,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 15 complete width domain" {
  let locator = AsinhLocator::new(
    1.0e+300,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, 0.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 16 complete width domain" {
  let locator = AsinhLocator::new(
    1.0e+300,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
    1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7000000000000002, 1.8, 1.9, 2.0,
  ])
}

///|
test "Asinh grid 17 complete width domain" {
  let locator = AsinhLocator::new(
    1.0e+300,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 18 complete width domain" {
  let locator = AsinhLocator::new(
    5.0e-324,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -80.0, -60.0, -40.0, -20.0, 0.0, 20.0, 40.0, 60.0, 80.0, 100.0,
  ])
}

///|
test "Asinh grid 19 complete width domain" {
  let locator = AsinhLocator::new(
    5.0e-324,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
    1.0 / 0.0,
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
test "Asinh grid 20 complete width domain" {
  let locator = AsinhLocator::new(
    5.0e-324,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 21 complete width domain" {
  let locator = AsinhLocator::new(
    0.0 / 0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
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
test "Asinh grid 22 complete width domain" {
  let locator = AsinhLocator::new(
    0.0 / 0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
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
test "Asinh grid 23 complete width domain" {
  let locator = AsinhLocator::new(
    0.0 / 0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
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
test "Asinh grid 24 complete width domain" {
  let locator = AsinhLocator::new(
    1.0 / 0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
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
test "Asinh grid 25 complete width domain" {
  let locator = AsinhLocator::new(
    1.0 / 0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
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
test "Asinh grid 26 complete width domain" {
  let locator = AsinhLocator::new(
    1.0 / 0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
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
test "Asinh grid 27 complete width domain" {
  let locator = AsinhLocator::new(
    -1.0 / 0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
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
test "Asinh grid 28 complete width domain" {
  let locator = AsinhLocator::new(
    -1.0 / 0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
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
test "Asinh grid 29 complete width domain" {
  let locator = AsinhLocator::new(
    -1.0 / 0.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
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
test "Asinh grid 30 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(1.0, numticks=None, base=10.0, subs=None)
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 31 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(1.0, numticks=None, base=10.0, subs=None)
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 32 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(1.0, numticks=None, base=10.0, subs=None)
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 33 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(1.0, numticks=None, base=10.0, subs=None)
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 34 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("-1"))),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 35 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("-1"))),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 36 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("-1"))),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 37 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("-1"))),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 38 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("0"))),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 39 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("0"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [])
}

///|
test "Asinh grid 40 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("0"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "Asinh grid 41 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("0"))),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 42 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("1"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [-100.0])
}

///|
test "Asinh grid 43 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("1"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [1.0])
}

///|
test "Asinh grid 44 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("1"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [0.0])
}

///|
test "Asinh grid 45 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("1"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 1.0), [-100.0, 0.0])
}

///|
test "Asinh grid 46 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("2"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, 0.0, 100.0,
  ])
}

///|
test "Asinh grid 47 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("2"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [1.0, 2.0])
}

///|
test "Asinh grid 48 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("2"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [0.0, 0.0])
}

///|
test "Asinh grid 49 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("2"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 1.0), [-100.0, 0.0])
}

///|
test "Asinh grid 50 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, 0.0, 100.0,
  ])
}

///|
test "Asinh grid 51 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [1.0, 1.5, 2.0])
}

///|
test "Asinh grid 52 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [0.0, 0.0, 0.0])
}

///|
test "Asinh grid 53 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 1.0), [-100.0, -1.0, 0.0])
}

///|
test "Asinh grid 54 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 55 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
    1.0, 1.1111111111111112, 1.2222222222222223, 1.3333333333333333, 1.4444444444444444,
    1.5555555555555556, 1.6666666666666665, 1.7777777777777777, 1.8888888888888888,
    2.0,
  ])
}

///|
test "Asinh grid 56 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 57 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 1.0), [
    -100.0, -10.0, -1.0, -0.1, 0.0, 1.0,
  ])
}

///|
test "Asinh grid 58 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 59 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
    1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7000000000000002, 1.8, 1.9, 2.0,
  ])
}

///|
test "Asinh grid 60 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 61 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 1.0), [
    -100.0, -10.0, -1.0, -0.1, 0.0, 1.0,
  ])
}

///|
test "Asinh grid 62 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("12"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 63 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("12"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
    1.0, 1.0909090909090908, 1.1818181818181819, 1.2727272727272727, 1.3636363636363638,
    1.4545454545454546, 1.5454545454545454, 1.6363636363636362, 1.7272727272727273,
    1.8181818181818183, 1.9090909090909092, 2.0,
  ])
}

///|
test "Asinh grid 64 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("12"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 65 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("12"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 1.0), [
    -100.0, -10.0, -1.0, -0.1, 0.0, 0.1, 1.0,
  ])
}

///|
test "Asinh grid 66 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(11.0)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 67 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(11.0)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 68 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(11.0)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 69 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(11.0)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 70 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(2.5)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 71 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(2.5)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 72 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(2.5)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 73 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(2.5)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 74 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(0.0 / 0.0)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 75 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(0.0 / 0.0)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 76 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(0.0 / 0.0)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 77 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(0.0 / 0.0)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 78 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(1.0 / 0.0)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 79 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(1.0 / 0.0)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 80 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(1.0 / 0.0)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 81 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Number(1.0 / 0.0)),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 82 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(
      LogNumTicks::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 83 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(
      LogNumTicks::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 84 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(
      LogNumTicks::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 85 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(
      LogNumTicks::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 86 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Text("11")),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 87 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Text("11")),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 88 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Text("11")),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 89 raw integer index protocol and cross-zero timing" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Text("11")),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 90 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=-10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 91 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=-10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [1.0, 2.0])
}

///|
test "Asinh grid 92 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=-10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 93 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=-0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 94 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=-0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [1.0, 2.0])
}

///|
test "Asinh grid 95 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=-0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 96 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 97 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [1.0, 2.0])
}

///|
test "Asinh grid 98 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 99 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=0.5,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 100 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=0.5,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [1.0, 2.0])
}

///|
test "Asinh grid 101 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=0.5,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 102 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 103 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [1.0, 2.0])
}

///|
test "Asinh grid 104 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 105 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0000000000000002,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.00000000000009, -34.65072192827356, -11.990610985082988, -4.102752042154532,
    -1.269421774761896, 0.0, 1.269421774761896, 4.102752042154532, 11.990610985082988,
    34.65072192827356, 100.00000000000009,
  ])
}

///|
test "Asinh grid 106 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0000000000000002,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
    1.0, 1.0811388507241628, 1.1656964973815676, 1.2539403296218627, 1.3461493936143667,
    1.4426152744526828, 1.5436430182101117, 1.6495520965616113, 1.7606774170226394,
    1.87737038199948, 2.0,
  ])
}

///|
test "Asinh grid 107 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0000000000000002,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 108 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -64.0, -32.0, -8.0, -4.0, -1.0, 0.0, 1.0, 4.0, 8.0, 32.0, 64.0,
  ])
}

///|
test "Asinh grid 109 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [1.0, 2.0])
}

///|
test "Asinh grid 110 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 111 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=3.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -81.0, -27.0, -9.0, -3.0, -1.0, 0.0, 1.0, 3.0, 9.0, 27.0, 81.0,
  ])
}

///|
test "Asinh grid 112 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=3.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
    1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7000000000000002, 1.8, 1.9, 2.0,
  ])
}

///|
test "Asinh grid 113 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=3.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 114 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -54.59815003314423, -20.085536923187664, -7.3890560989306495, -2.718281828459045,
    -1.0, 0.0, 1.0, 2.718281828459045, 7.3890560989306495, 20.085536923187664, 54.59815003314423,
  ])
}

///|
test "Asinh grid 115 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
    1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7000000000000002, 1.8, 1.9, 2.0,
  ])
}

///|
test "Asinh grid 116 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 117 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 118 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
    1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7000000000000002, 1.8, 1.9, 2.0,
  ])
}

///|
test "Asinh grid 119 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 120 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=0.0 / 0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 121 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=0.0 / 0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [1.0, 2.0])
}

///|
test "Asinh grid 122 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=0.0 / 0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 123 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0 / 0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -1.0,
    1.0,
    0.0 / 0.0,
  ])
}

///|
test "Asinh grid 124 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0 / 0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [
    1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7000000000000002, 1.8, 1.9, 2.0,
  ])
}

///|
test "Asinh grid 125 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0 / 0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
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
test "Asinh grid 126 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=-1.0 / 0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 127 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=-1.0 / 0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 2.0), [1.0, 2.0])
}

///|
test "Asinh grid 128 complete base domain" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=-1.0 / 0.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 129 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::Sequence([])),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 130 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::Sequence([])),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 131 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::Sequence([0.0])),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -80.0, -60.0, -40.0, -20.0, 0.0, 20.0, 40.0, 60.0, 80.0, 100.0,
  ])
}

///|
test "Asinh grid 132 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::Sequence([0.0])),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 133 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::Sequence([-0.0])),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -80.0, -60.0, -40.0, -20.0, 0.0, 20.0, 40.0, 60.0, 80.0, 100.0,
  ])
}

///|
test "Asinh grid 134 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::Sequence([-0.0])),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 135 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::Sequence([1.0])),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 136 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::Sequence([1.0])),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 137 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::Sequence([2.0, 5.0])),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -500.0, -200.0, -50.0, -20.0, -5.0, -2.0, 0.0, 2.0, 5.0, 20.0, 50.0, 200.0, 500.0,
  ])
}

///|
test "Asinh grid 138 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::Sequence([2.0, 5.0])),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 139 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::Sequence([-1.0, 0.0, 1.0])),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, -0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 140 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::Sequence([-1.0, 0.0, 1.0])),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 141 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::Sequence([0.0 / 0.0, 1.0 / 0.0])),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -1.0 / 0.0,
    1.0 / 0.0,
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
test "Asinh grid 142 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::Sequence([0.0 / 0.0, 1.0 / 0.0])),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 143 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::NdArray(TickValues::from_array([]))),
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 144 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::NdArray(TickValues::from_array([]))),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 145 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::NdArray(TickValues::from_array([0.0]))),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 146 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::NdArray(TickValues::from_array([0.0]))),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 147 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::NdArray(TickValues::from_array([1.0]))),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 148 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::NdArray(TickValues::from_array([1.0]))),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 149 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::NdArray(TickValues::from_array([2.0]))),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -200.0, -20.0, -2.0, 0.0, 2.0, 20.0, 200.0,
  ])
}

///|
test "Asinh grid 150 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::NdArray(TickValues::from_array([2.0]))),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 151 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::NdArray(TickValues::from_array([2.0, 5.0]))),
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 152 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::NdArray(TickValues::from_array([2.0, 5.0]))),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 153 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(
      AsinhSubs::NdArray(TickValues::from_int64_array([9007199254740993L])),
    ),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -9.007199254740992e+17, -9.007199254740992e+16, -9007199254740992.0, 0.0, 9007199254740992.0,
    9.007199254740992e+16, 9.007199254740992e+17,
  ])
}

///|
test "Asinh grid 154 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(
      AsinhSubs::NdArray(TickValues::from_int64_array([9007199254740993L])),
    ),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 155 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::NdArray(TickValues::from_int64_array([1L, 2L]))),
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 156 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::NdArray(TickValues::from_int64_array([1L, 2L]))),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 157 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::Number(0.0)),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 158 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::Number(0.0)),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 159 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::Number(2.0)),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -200.0, -20.0, -2.0, 0.0, 2.0, 20.0, 200.0,
  ])
}

///|
test "Asinh grid 160 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::Number(2.0)),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 161 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::Number(0.0 / 0.0)),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
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
test "Asinh grid 162 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::Number(0.0 / 0.0)),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 163 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::Text("")),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 164 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::Text("")),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 165 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(AsinhSubs::Text("bad")),
  )
  assert_true(
    try {
      ignore(locator.tick_values(-100.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 166 late subs truth scalar ndarray and NaN multiplicity" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=Some(AsinhSubs::Text("bad")),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -30.0, -10.0, -4.0, -1.0, 0.0, 1.0, 4.0, 10.0, 30.0, 100.0,
  ])
}

///|
test "Asinh grid 167 ordered raw view and nonfinite stages" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(100.0, -100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 168 ordered raw view and nonfinite stages" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(2.0, 1.0), [
    2.0, 1.9, 1.8, 1.7, 1.6, 1.5, 1.4, 1.2999999999999998, 1.2, 1.1, 1.0,
  ])
}

///|
test "Asinh grid 169 ordered raw view and nonfinite stages" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh grid 170 ordered raw view and nonfinite stages" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, -0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.0,
  ])
}

///|
test "Asinh grid 171 ordered raw view and nonfinite stages" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 172 ordered raw view and nonfinite stages" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0 / 0.0, 1.0), [
    1.0,
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
test "Asinh grid 173 ordered raw view and nonfinite stages" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 0.0 / 0.0), [
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
test "Asinh grid 174 ordered raw view and nonfinite stages" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0 / 0.0, 1.0), [
    1.0,
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
test "Asinh grid 175 ordered raw view and nonfinite stages" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0 / 0.0), [
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "Asinh grid 176 ordered raw view and nonfinite stages" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0 / 0.0, 1.0 / 0.0), [
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
    1.0 / 0.0,
  ])
}

///|
test "Asinh grid 177 ordered raw view and nonfinite stages" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0e+308, 1.0e+308), [
    -1.0e+308, -1.0e+246, -1.0e+184, -1.0e+123, -1.0e+61, 0.0, 1.0e+61, 1.0e+123,
    1.0e+184, 1.0e+246, 1.0e+308,
  ])
}

///|
test "Asinh grid 178 ordered raw view and nonfinite stages" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(5.0e-324, 1.0e-300), [
    0.0, 1.0e-301, 1.0e-300,
  ])
}

///|
test "Asinh grid 179 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.1, -0.01, 0.0, 0.01, 0.1, 1.0,
  ])
}

///|
test "Asinh grid 180 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0,
  ])
}

///|
test "Asinh grid 181 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -100.0, -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 182 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [0.0, 0.01, 0.1, 1.0])
}

///|
test "Asinh grid 183 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [0.0, 0.1, 1.0, 10.0])
}

///|
test "Asinh grid 184 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.1, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 185 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [1.0, 10.0])
}

///|
test "Asinh grid 186 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [10.0, 100.0])
}

///|
test "Asinh grid 187 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [-10.0, -1.0])
}

///|
test "Asinh grid 188 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [-100.0, -10.0])
}

///|
test "Asinh grid 189 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -100.0, -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 190 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -10.0, -1.0, -0.1, 0.0, 1.0,
  ])
}

///|
test "Asinh grid 191 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.1, -0.01, 0.0, 0.01, 0.1,
  ])
}

///|
test "Asinh grid 192 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 193 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    1.0e-10, 1.0e-09,
  ])
}

///|
test "Asinh grid 194 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.1, 0.0, 0.1, 1.0,
  ])
}

///|
test "Asinh grid 195 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0,
  ])
}

///|
test "Asinh grid 196 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 197 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [0.0, 0.01, 0.1, 1.0])
}

///|
test "Asinh grid 198 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [0.0, 0.1, 1.0, 10.0])
}

///|
test "Asinh grid 199 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.1, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 200 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [1.0, 10.0])
}

///|
test "Asinh grid 201 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [10.0, 100.0])
}

///|
test "Asinh grid 202 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [-10.0, -1.0])
}

///|
test "Asinh grid 203 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [-100.0, -10.0])
}

///|
test "Asinh grid 204 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 205 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -10.0, -1.0, -0.1, 0.0, 0.1, 1.0,
  ])
}

///|
test "Asinh grid 206 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.1, 0.0, 0.1,
  ])
}

///|
test "Asinh grid 207 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 208 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    1.0e-10, 1.0e-09,
  ])
}

///|
test "Asinh grid 209 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.1, -0.01, 0.0, 0.01, 0.1, 1.0,
  ])
}

///|
test "Asinh grid 210 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -10.0, -1.0, -0.1, -0.01, 0.0, 0.01, 0.1, 1.0, 10.0,
  ])
}

///|
test "Asinh grid 211 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -100.0, -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 212 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [0.0, 0.01, 0.1, 1.0])
}

///|
test "Asinh grid 213 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [
    0.0, 0.01, 0.1, 1.0, 10.0,
  ])
}

///|
test "Asinh grid 214 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.1, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 215 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [1.0, 10.0])
}

///|
test "Asinh grid 216 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [10.0, 100.0])
}

///|
test "Asinh grid 217 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [-10.0, -1.0])
}

///|
test "Asinh grid 218 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [-100.0, -10.0])
}

///|
test "Asinh grid 219 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -100.0, -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 220 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -10.0, -1.0, -0.1, -0.01, 0.0, 0.01, 0.1, 1.0,
  ])
}

///|
test "Asinh grid 221 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.1, -0.01, 0.0, 0.01, 0.1,
  ])
}

///|
test "Asinh grid 222 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 223 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    1.0e-10, 1.0e-09,
  ])
}

///|
test "Asinh grid 224 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.1, -0.01, 0.0, 0.01, 0.1, 1.0,
  ])
}

///|
test "Asinh grid 225 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0,
  ])
}

///|
test "Asinh grid 226 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -100.0, -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 227 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [0.0, 0.01, 0.1, 1.0])
}

///|
test "Asinh grid 228 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [
    0.0, 0.01, 0.1, 1.0, 10.0,
  ])
}

///|
test "Asinh grid 229 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.1, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 230 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [1.0, 10.0])
}

///|
test "Asinh grid 231 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [10.0, 100.0])
}

///|
test "Asinh grid 232 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [-10.0, -1.0])
}

///|
test "Asinh grid 233 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [-100.0, -10.0])
}

///|
test "Asinh grid 234 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -100.0, -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 235 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -10.0, -1.0, -0.1, 0.0, 0.1, 1.0,
  ])
}

///|
test "Asinh grid 236 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.1, -0.01, 0.0, 0.01, 0.1,
  ])
}

///|
test "Asinh grid 237 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 238 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    1.0e-10, 1.0e-09,
  ])
}

///|
test "Asinh grid 239 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.5, -0.25, -0.0625, 0.0, 0.0625, 0.25, 0.5, 1.0,
  ])
}

///|
test "Asinh grid 240 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -8.0, -4.0, -2.0, -1.0, -0.25, 0.0, 0.25, 1.0, 2.0, 4.0, 8.0,
  ])
}

///|
test "Asinh grid 241 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -512.0, -128.0, -32.0, -4.0, -0.5, 0.0, 0.5, 4.0, 32.0, 128.0, 512.0,
  ])
}

///|
test "Asinh grid 242 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [
    0.0, 0.0625, 0.125, 0.25, 0.5, 1.0,
  ])
}

///|
test "Asinh grid 243 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [
    0.0, 0.25, 0.5, 1.0, 2.0, 4.0, 8.0,
  ])
}

///|
test "Asinh grid 244 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.5, 2.0, 4.0, 8.0, 32.0, 64.0, 128.0, 256.0, 512.0,
  ])
}

///|
test "Asinh grid 245 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [1.0, 2.0, 4.0, 8.0])
}

///|
test "Asinh grid 246 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [
    8.0, 16.0, 32.0, 64.0, 128.0, 256.0, 512.0,
  ])
}

///|
test "Asinh grid 247 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [
    -8.0, -4.0, -2.0, -1.0,
  ])
}

///|
test "Asinh grid 248 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [
    -512.0, -256.0, -128.0, -64.0, -32.0, -16.0, -8.0,
  ])
}

///|
test "Asinh grid 249 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -512.0, -128.0, -32.0, -4.0, -0.5, 0.0, 0.5, 4.0, 32.0, 128.0, 512.0,
  ])
}

///|
test "Asinh grid 250 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -8.0, -4.0, -2.0, -1.0, -0.25, 0.0, 1.0, 2.0, 4.0, 8.0,
  ])
}

///|
test "Asinh grid 251 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.5, -0.25, -0.0625, 0.0, 0.0625, 0.25, 0.5,
  ])
}

///|
test "Asinh grid 252 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 253 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    5.820766091346741e-11, 1.1641532182693481e-10, 2.3283064365386963e-10, 4.656612873077393e-10,
    9.313225746154785e-10,
  ])
}

///|
test "Asinh grid 254 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.5, -0.25, -0.125, 0.0, 0.125, 0.25, 0.5, 1.0,
  ])
}

///|
test "Asinh grid 255 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -8.0, -4.0, -2.0, -1.0, -0.5, 0.0, 0.5, 1.0, 2.0, 4.0, 8.0,
  ])
}

///|
test "Asinh grid 256 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -512.0, -128.0, -32.0, -8.0, -2.0, 0.0, 2.0, 8.0, 32.0, 128.0, 512.0,
  ])
}

///|
test "Asinh grid 257 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [
    0.0, 0.0625, 0.125, 0.25, 0.5, 1.0,
  ])
}

///|
test "Asinh grid 258 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [
    0.0, 0.25, 0.5, 1.0, 2.0, 4.0, 8.0,
  ])
}

///|
test "Asinh grid 259 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.5, 2.0, 4.0, 8.0, 16.0, 32.0, 64.0, 128.0, 256.0, 512.0,
  ])
}

///|
test "Asinh grid 260 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [1.0, 2.0, 4.0, 8.0])
}

///|
test "Asinh grid 261 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [
    8.0, 16.0, 32.0, 64.0, 128.0, 256.0, 512.0,
  ])
}

///|
test "Asinh grid 262 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [
    -8.0, -4.0, -2.0, -1.0,
  ])
}

///|
test "Asinh grid 263 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [
    -512.0, -256.0, -128.0, -64.0, -32.0, -16.0, -8.0,
  ])
}

///|
test "Asinh grid 264 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -512.0, -128.0, -32.0, -8.0, -2.0, 0.0, 2.0, 8.0, 32.0, 128.0, 512.0,
  ])
}

///|
test "Asinh grid 265 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -8.0, -4.0, -2.0, -1.0, -0.5, 0.0, 0.5, 1.0, 2.0, 4.0, 8.0,
  ])
}

///|
test "Asinh grid 266 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.5, -0.25, -0.125, 0.0, 0.125, 0.25, 0.5,
  ])
}

///|
test "Asinh grid 267 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 268 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    5.820766091346741e-11, 1.1641532182693481e-10, 2.3283064365386963e-10, 4.656612873077393e-10,
    9.313225746154785e-10,
  ])
}

///|
test "Asinh grid 269 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.5, -0.25, -0.0625, -0.03125, 0.0, 0.03125, 0.0625, 0.25, 0.5, 1.0,
  ])
}

///|
test "Asinh grid 270 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -8.0, -2.0, -0.5, -0.25, -0.03125, 0.0, 0.03125, 0.25, 0.5, 2.0, 8.0,
  ])
}

///|
test "Asinh grid 271 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -512.0, -64.0, -8.0, -1.0, -0.125, 0.0, 0.125, 1.0, 8.0, 64.0, 512.0,
  ])
}

///|
test "Asinh grid 272 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [
    0.0, 0.03125, 0.0625, 0.125, 0.25, 0.5, 1.0,
  ])
}

///|
test "Asinh grid 273 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [
    0.0, 0.03125, 0.125, 0.25, 0.5, 1.0, 2.0, 4.0, 8.0,
  ])
}

///|
test "Asinh grid 274 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.125, 0.25, 1.0, 4.0, 8.0, 32.0, 64.0, 256.0, 512.0,
  ])
}

///|
test "Asinh grid 275 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [1.0, 2.0, 4.0, 8.0])
}

///|
test "Asinh grid 276 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [
    8.0, 16.0, 32.0, 64.0, 128.0, 256.0, 512.0,
  ])
}

///|
test "Asinh grid 277 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [
    -8.0, -4.0, -2.0, -1.0,
  ])
}

///|
test "Asinh grid 278 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [
    -512.0, -256.0, -128.0, -64.0, -32.0, -16.0, -8.0,
  ])
}

///|
test "Asinh grid 279 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -512.0, -64.0, -8.0, -1.0, -0.125, 0.0, 0.125, 1.0, 8.0, 64.0, 512.0,
  ])
}

///|
test "Asinh grid 280 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -8.0, -2.0, -0.5, -0.25, -0.0625, 0.0, 0.03125, 0.25, 0.5, 2.0, 8.0,
  ])
}

///|
test "Asinh grid 281 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.5, -0.25, -0.0625, -0.03125, 0.0, 0.03125, 0.0625, 0.25, 0.5,
  ])
}

///|
test "Asinh grid 282 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 283 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    5.820766091346741e-11, 1.1641532182693481e-10, 2.3283064365386963e-10, 4.656612873077393e-10,
    9.313225746154785e-10,
  ])
}

///|
test "Asinh grid 284 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.5, -0.25, -0.125, -0.0625, 0.0, 0.0625, 0.125, 0.25, 0.5, 1.0,
  ])
}

///|
test "Asinh grid 285 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -8.0, -2.0, -1.0, -0.25, -0.125, 0.0, 0.125, 0.25, 1.0, 2.0, 8.0,
  ])
}

///|
test "Asinh grid 286 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -512.0, -128.0, -16.0, -2.0, -0.25, 0.0, 0.25, 2.0, 16.0, 128.0, 512.0,
  ])
}

///|
test "Asinh grid 287 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [
    0.0, 0.015625, 0.0625, 0.125, 0.25, 0.5, 1.0,
  ])
}

///|
test "Asinh grid 288 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [
    0.0, 0.03125, 0.125, 0.25, 0.5, 1.0, 2.0, 4.0, 8.0,
  ])
}

///|
test "Asinh grid 289 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.0625, 0.25, 0.5, 2.0, 4.0, 16.0, 32.0, 128.0, 256.0, 512.0,
  ])
}

///|
test "Asinh grid 290 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [1.0, 2.0, 4.0, 8.0])
}

///|
test "Asinh grid 291 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [
    8.0, 16.0, 32.0, 64.0, 128.0, 256.0, 512.0,
  ])
}

///|
test "Asinh grid 292 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [
    -8.0, -4.0, -2.0, -1.0,
  ])
}

///|
test "Asinh grid 293 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [
    -512.0, -256.0, -128.0, -64.0, -32.0, -16.0, -8.0,
  ])
}

///|
test "Asinh grid 294 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -512.0, -128.0, -16.0, -2.0, -0.25, 0.0, 0.25, 2.0, 16.0, 128.0, 512.0,
  ])
}

///|
test "Asinh grid 295 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -8.0, -2.0, -1.0, -0.25, -0.125, 0.0, 0.0625, 0.25, 1.0, 2.0, 8.0,
  ])
}

///|
test "Asinh grid 296 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.5, -0.25, -0.125, -0.0625, 0.0, 0.0625, 0.125, 0.25, 0.5,
  ])
}

///|
test "Asinh grid 297 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 298 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    5.820766091346741e-11, 1.1641532182693481e-10, 2.3283064365386963e-10, 4.656612873077393e-10,
    9.313225746154785e-10,
  ])
}

///|
test "Asinh grid 299 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.36787944117144233, -0.1353352832366127, -0.04978706836786395, 0.0, 0.04978706836786395,
    0.1353352832366127, 0.36787944117144233, 1.0,
  ])
}

///|
test "Asinh grid 300 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -7.3890560989306495, -2.718281828459045, -1.0, -0.1353352832366127, 0.0, 0.1353352832366127,
    1.0, 2.718281828459045, 7.3890560989306495,
  ])
}

///|
test "Asinh grid 301 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -403.428793492735, -148.41315910257657, -20.085536923187664, -2.718281828459045,
    -0.36787944117144233, 0.0, 0.36787944117144233, 2.718281828459045, 20.085536923187664,
    148.41315910257657, 403.428793492735,
  ])
}

///|
test "Asinh grid 302 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [
    0.0, 0.04978706836786395, 0.1353352832366127, 0.36787944117144233, 1.0,
  ])
}

///|
test "Asinh grid 303 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [
    0.0, 0.1353352832366127, 0.36787944117144233, 1.0, 2.718281828459045, 7.3890560989306495,
  ])
}

///|
test "Asinh grid 304 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.36787944117144233, 1.0, 2.718281828459045, 7.3890560989306495, 20.085536923187664,
    54.59815003314423, 148.41315910257657, 403.428793492735,
  ])
}

///|
test "Asinh grid 305 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [
    1.0, 2.718281828459045, 7.3890560989306495,
  ])
}

///|
test "Asinh grid 306 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [
    7.3890560989306495, 20.085536923187664, 54.59815003314423, 148.41315910257657,
    403.428793492735,
  ])
}

///|
test "Asinh grid 307 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [
    -7.3890560989306495, -2.718281828459045, -1.0,
  ])
}

///|
test "Asinh grid 308 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [
    -403.428793492735, -148.41315910257657, -54.59815003314423, -20.085536923187664,
    -7.3890560989306495,
  ])
}

///|
test "Asinh grid 309 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -403.428793492735, -148.41315910257657, -20.085536923187664, -2.718281828459045,
    -0.36787944117144233, 0.0, 0.36787944117144233, 2.718281828459045, 20.085536923187664,
    148.41315910257657, 403.428793492735,
  ])
}

///|
test "Asinh grid 310 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -7.3890560989306495, -2.718281828459045, -1.0, -0.36787944117144233, 0.0, 1.0,
    2.718281828459045, 7.3890560989306495,
  ])
}

///|
test "Asinh grid 311 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.36787944117144233, -0.1353352832366127, -0.04978706836786395, 0.0, 0.04978706836786395,
    0.1353352832366127, 0.36787944117144233,
  ])
}

///|
test "Asinh grid 312 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 313 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    3.775134544279102e-11, 1.0261879631701903e-10, 2.789468092868928e-10, 7.582560427911915e-10,
  ])
}

///|
test "Asinh grid 314 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.36787944117144233, -0.1353352832366127, 0.0, 0.1353352832366127, 0.36787944117144233,
    1.0,
  ])
}

///|
test "Asinh grid 315 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -7.3890560989306495, -2.718281828459045, -1.0, -0.36787944117144233, 0.0, 0.36787944117144233,
    1.0, 2.718281828459045, 7.3890560989306495,
  ])
}

///|
test "Asinh grid 316 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -403.428793492735, -148.41315910257657, -20.085536923187664, -7.3890560989306495,
    -1.0, 0.0, 1.0, 7.3890560989306495, 20.085536923187664, 148.41315910257657, 403.428793492735,
  ])
}

///|
test "Asinh grid 317 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [
    0.0, 0.04978706836786395, 0.1353352832366127, 0.36787944117144233, 1.0,
  ])
}

///|
test "Asinh grid 318 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [
    0.0, 0.1353352832366127, 0.36787944117144233, 1.0, 2.718281828459045, 7.3890560989306495,
  ])
}

///|
test "Asinh grid 319 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.36787944117144233, 1.0, 2.718281828459045, 7.3890560989306495, 20.085536923187664,
    54.59815003314423, 148.41315910257657, 403.428793492735,
  ])
}

///|
test "Asinh grid 320 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [
    1.0, 2.718281828459045, 7.3890560989306495,
  ])
}

///|
test "Asinh grid 321 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [
    7.3890560989306495, 20.085536923187664, 54.59815003314423, 148.41315910257657,
    403.428793492735,
  ])
}

///|
test "Asinh grid 322 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [
    -7.3890560989306495, -2.718281828459045, -1.0,
  ])
}

///|
test "Asinh grid 323 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [
    -403.428793492735, -148.41315910257657, -54.59815003314423, -20.085536923187664,
    -7.3890560989306495,
  ])
}

///|
test "Asinh grid 324 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -403.428793492735, -148.41315910257657, -20.085536923187664, -7.3890560989306495,
    -1.0, 0.0, 1.0, 7.3890560989306495, 20.085536923187664, 148.41315910257657, 403.428793492735,
  ])
}

///|
test "Asinh grid 325 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -7.3890560989306495, -2.718281828459045, -1.0, -0.36787944117144233, 0.0, 0.36787944117144233,
    1.0, 2.718281828459045, 7.3890560989306495,
  ])
}

///|
test "Asinh grid 326 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.36787944117144233, -0.1353352832366127, 0.0, 0.1353352832366127, 0.36787944117144233,
  ])
}

///|
test "Asinh grid 327 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 328 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    3.775134544279102e-11, 1.0261879631701903e-10, 2.789468092868928e-10, 7.582560427911915e-10,
  ])
}

///|
test "Asinh grid 329 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.36787944117144233, -0.1353352832366127, -0.04978706836786395, -0.018315638888734186,
    0.0, 0.018315638888734186, 0.04978706836786395, 0.1353352832366127, 0.36787944117144233,
    1.0,
  ])
}

///|
test "Asinh grid 330 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -7.3890560989306495, -2.718281828459045, -0.36787944117144233, -0.1353352832366127,
    -0.04978706836786395, 0.0, 0.04978706836786395, 0.1353352832366127, 0.36787944117144233,
    2.718281828459045, 7.3890560989306495,
  ])
}

///|
test "Asinh grid 331 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -403.428793492735, -54.59815003314423, -7.3890560989306495, -1.0, -0.04978706836786395,
    0.0, 0.04978706836786395, 1.0, 7.3890560989306495, 54.59815003314423, 403.428793492735,
  ])
}

///|
test "Asinh grid 332 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [
    0.0, 0.018315638888734186, 0.04978706836786395, 0.1353352832366127, 0.36787944117144233,
    1.0,
  ])
}

///|
test "Asinh grid 333 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [
    0.0, 0.04978706836786395, 0.1353352832366127, 0.36787944117144233, 1.0, 2.718281828459045,
    7.3890560989306495,
  ])
}

///|
test "Asinh grid 334 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.04978706836786395, 0.36787944117144233, 1.0, 2.718281828459045, 7.3890560989306495,
    20.085536923187664, 54.59815003314423, 148.41315910257657, 403.428793492735,
  ])
}

///|
test "Asinh grid 335 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [
    1.0, 2.718281828459045, 7.3890560989306495,
  ])
}

///|
test "Asinh grid 336 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [
    7.3890560989306495, 20.085536923187664, 54.59815003314423, 148.41315910257657,
    403.428793492735,
  ])
}

///|
test "Asinh grid 337 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [
    -7.3890560989306495, -2.718281828459045, -1.0,
  ])
}

///|
test "Asinh grid 338 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [
    -403.428793492735, -148.41315910257657, -54.59815003314423, -20.085536923187664,
    -7.3890560989306495,
  ])
}

///|
test "Asinh grid 339 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -403.428793492735, -54.59815003314423, -7.3890560989306495, -1.0, -0.04978706836786395,
    0.0, 0.04978706836786395, 1.0, 7.3890560989306495, 54.59815003314423, 403.428793492735,
  ])
}

///|
test "Asinh grid 340 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -7.3890560989306495, -2.718281828459045, -0.36787944117144233, -0.1353352832366127,
    -0.04978706836786395, 0.0, 0.04978706836786395, 0.1353352832366127, 0.36787944117144233,
    2.718281828459045, 7.3890560989306495,
  ])
}

///|
test "Asinh grid 341 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.36787944117144233, -0.1353352832366127, -0.04978706836786395, -0.018315638888734186,
    0.0, 0.018315638888734186, 0.04978706836786395, 0.1353352832366127, 0.36787944117144233,
  ])
}

///|
test "Asinh grid 342 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 343 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    3.775134544279102e-11, 1.0261879631701903e-10, 2.789468092868928e-10, 7.582560427911915e-10,
  ])
}

///|
test "Asinh grid 344 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.36787944117144233, -0.1353352832366127, -0.04978706836786395, 0.0, 0.04978706836786395,
    0.1353352832366127, 0.36787944117144233, 1.0,
  ])
}

///|
test "Asinh grid 345 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -7.3890560989306495, -2.718281828459045, -1.0, -0.36787944117144233, -0.04978706836786395,
    0.0, 0.04978706836786395, 0.36787944117144233, 1.0, 2.718281828459045, 7.3890560989306495,
  ])
}

///|
test "Asinh grid 346 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -403.428793492735, -54.59815003314423, -7.3890560989306495, -1.0, -0.1353352832366127,
    0.0, 0.1353352832366127, 1.0, 7.3890560989306495, 54.59815003314423, 403.428793492735,
  ])
}

///|
test "Asinh grid 347 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [
    0.0, 0.018315638888734186, 0.04978706836786395, 0.1353352832366127, 0.36787944117144233,
    1.0,
  ])
}

///|
test "Asinh grid 348 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [
    0.0, 0.04978706836786395, 0.1353352832366127, 0.36787944117144233, 1.0, 2.718281828459045,
    7.3890560989306495,
  ])
}

///|
test "Asinh grid 349 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.04978706836786395, 0.1353352832366127, 0.36787944117144233, 1.0, 2.718281828459045,
    7.3890560989306495, 20.085536923187664, 54.59815003314423, 148.41315910257657,
    403.428793492735,
  ])
}

///|
test "Asinh grid 350 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [
    1.0, 2.718281828459045, 7.3890560989306495,
  ])
}

///|
test "Asinh grid 351 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [
    7.3890560989306495, 20.085536923187664, 54.59815003314423, 148.41315910257657,
    403.428793492735,
  ])
}

///|
test "Asinh grid 352 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [
    -7.3890560989306495, -2.718281828459045, -1.0,
  ])
}

///|
test "Asinh grid 353 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [
    -403.428793492735, -148.41315910257657, -54.59815003314423, -20.085536923187664,
    -7.3890560989306495,
  ])
}

///|
test "Asinh grid 354 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -403.428793492735, -54.59815003314423, -7.3890560989306495, -1.0, -0.1353352832366127,
    0.0, 0.1353352832366127, 1.0, 7.3890560989306495, 54.59815003314423, 403.428793492735,
  ])
}

///|
test "Asinh grid 355 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -7.3890560989306495, -2.718281828459045, -1.0, -0.36787944117144233, -0.04978706836786395,
    0.0, 0.04978706836786395, 0.36787944117144233, 1.0, 2.718281828459045, 7.3890560989306495,
  ])
}

///|
test "Asinh grid 356 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.36787944117144233, -0.1353352832366127, -0.04978706836786395, 0.0, 0.04978706836786395,
    0.1353352832366127, 0.36787944117144233,
  ])
}

///|
test "Asinh grid 357 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 358 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    3.775134544279102e-11, 1.0261879631701903e-10, 2.789468092868928e-10, 7.582560427911915e-10,
  ])
}

///|
test "Asinh grid 359 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.7000000000000001, -0.5, -0.30000000000000004, -0.1, 0.0, 0.1, 0.30000000000000004,
    0.5, 0.7000000000000001, 1.0,
  ])
}

///|
test "Asinh grid 360 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -10.0, -5.0, -3.0, -1.0, -0.30000000000000004, 0.0, 0.30000000000000004, 1.0,
    3.0, 5.0, 10.0,
  ])
}

///|
test "Asinh grid 361 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -1000.0, -200.0, -30.0, -6.0, -0.9, 0.0, 0.9, 6.0, 30.0, 200.0, 1000.0,
  ])
}

///|
test "Asinh grid 362 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [
    0.0, 0.1, 0.2, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001, 0.7000000000000001,
    0.9, 1.0,
  ])
}

///|
test "Asinh grid 363 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [
    0.0, 0.30000000000000004, 0.7000000000000001, 1.0, 2.0, 3.0, 4.0, 5.0, 7.0, 10.0,
  ])
}

///|
test "Asinh grid 364 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.9, 3.0, 6.0, 10.0, 30.0, 80.0, 200.0, 400.0, 1000.0,
  ])
}

///|
test "Asinh grid 365 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [
    1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
}

///|
test "Asinh grid 366 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [
    10.0, 20.0, 30.0, 50.0, 80.0, 100.0, 200.0, 400.0, 600.0, 1000.0,
  ])
}

///|
test "Asinh grid 367 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [
    -10.0, -8.0, -6.0, -5.0, -4.0, -3.0, -2.0, -1.0,
  ])
}

///|
test "Asinh grid 368 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [
    -1000.0, -600.0, -400.0, -200.0, -100.0, -80.0, -50.0, -30.0, -20.0, -10.0,
  ])
}

///|
test "Asinh grid 369 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -1000.0, -200.0, -30.0, -6.0, -0.9, 0.0, 0.9, 6.0, 30.0, 200.0, 1000.0,
  ])
}

///|
test "Asinh grid 370 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -10.0, -5.0, -3.0, -1.0, -0.4, 0.0, 1.0, 2.0, 5.0, 9.0,
  ])
}

///|
test "Asinh grid 371 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.7000000000000001, -0.5, -0.30000000000000004, -0.1, 0.0, 0.1, 0.30000000000000004,
    0.5, 0.7000000000000001, 1.0,
  ])
}

///|
test "Asinh grid 372 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 373 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    1.0e-10, 2.0e-10, 3.0e-10, 4.0e-10, 5.0e-10, 6.0e-10, 7.000000000000001e-10,
    8.0e-10, 9.0e-10, 1.0e-09,
  ])
}

///|
test "Asinh grid 374 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.8, -0.6000000000000001, -0.4, -0.2, 0.0, 0.2, 0.4, 0.6000000000000001,
    0.8, 1.0,
  ])
}

///|
test "Asinh grid 375 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -10.0, -5.0, -3.0, -2.0, -0.6000000000000001, 0.0, 0.6000000000000001, 2.0, 3.0,
    5.0, 10.0,
  ])
}

///|
test "Asinh grid 376 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -1000.0, -200.0, -50.0, -10.0, -2.0, 0.0, 2.0, 10.0, 50.0, 200.0, 1000.0,
  ])
}

///|
test "Asinh grid 377 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [
    0.0, 0.09, 0.2, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001, 0.7000000000000001,
    0.8, 0.9, 1.0,
  ])
}

///|
test "Asinh grid 378 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [
    0.0, 0.30000000000000004, 0.6000000000000001, 1.0, 2.0, 3.0, 4.0, 5.0, 7.0, 10.0,
  ])
}

///|
test "Asinh grid 379 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.8, 2.0, 5.0, 10.0, 20.0, 50.0, 100.0, 200.0, 500.0, 1000.0,
  ])
}

///|
test "Asinh grid 380 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [
    1.0, 2.0, 3.0, 4.0, 5.0, 7.0, 8.0, 10.0,
  ])
}

///|
test "Asinh grid 381 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [
    10.0, 20.0, 30.0, 40.0, 60.0, 100.0, 200.0, 300.0, 400.0, 600.0, 1000.0,
  ])
}

///|
test "Asinh grid 382 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [
    -10.0, -8.0, -7.0, -5.0, -4.0, -3.0, -2.0, -1.0,
  ])
}

///|
test "Asinh grid 383 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [
    -1000.0, -600.0, -400.0, -300.0, -200.0, -100.0, -60.0, -40.0, -30.0, -20.0,
    -10.0,
  ])
}

///|
test "Asinh grid 384 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -1000.0, -200.0, -50.0, -10.0, -2.0, 0.0, 2.0, 10.0, 50.0, 200.0, 1000.0,
  ])
}

///|
test "Asinh grid 385 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -10.0, -6.0, -3.0, -2.0, -0.7000000000000001, 0.0, 0.6000000000000001, 1.0, 3.0,
    5.0, 9.0,
  ])
}

///|
test "Asinh grid 386 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.8, -0.6000000000000001, -0.4, -0.2, 0.0, 0.2, 0.4, 0.6000000000000001,
    0.8, 1.0,
  ])
}

///|
test "Asinh grid 387 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 388 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    1.0e-10, 2.0e-10, 3.0e-10, 4.0e-10, 5.0e-10, 6.0e-10, 7.000000000000001e-10,
    8.0e-10, 9.0e-10, 1.0e-09,
  ])
}

///|
test "Asinh grid 389 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.5, -0.30000000000000004, -0.1, -0.03, 0.0, 0.03, 0.1, 0.30000000000000004,
    0.5, 1.0,
  ])
}

///|
test "Asinh grid 390 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -10.0, -3.0, -0.9, -0.30000000000000004, -0.06, 0.0, 0.06, 0.30000000000000004,
    0.9, 3.0, 10.0,
  ])
}

///|
test "Asinh grid 391 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -1000.0, -100.0, -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
}

///|
test "Asinh grid 392 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [
    0.0, 0.03, 0.07, 0.1, 0.2, 0.30000000000000004, 0.4, 0.5, 0.7000000000000001,
    1.0,
  ])
}

///|
test "Asinh grid 393 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [
    0.0, 0.06, 0.1, 0.30000000000000004, 0.5, 0.9, 2.0, 3.0, 6.0, 10.0,
  ])
}

///|
test "Asinh grid 394 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.1, 0.4, 1.0, 4.0, 10.0, 40.0, 100.0, 300.0, 1000.0,
  ])
}

///|
test "Asinh grid 395 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [
    1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
}

///|
test "Asinh grid 396 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [
    10.0, 20.0, 30.0, 50.0, 80.0, 100.0, 200.0, 400.0, 600.0, 1000.0,
  ])
}

///|
test "Asinh grid 397 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [
    -10.0, -8.0, -6.0, -5.0, -4.0, -3.0, -2.0, -1.0,
  ])
}

///|
test "Asinh grid 398 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [
    -1000.0, -600.0, -400.0, -200.0, -100.0, -80.0, -50.0, -30.0, -20.0, -10.0,
  ])
}

///|
test "Asinh grid 399 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -1000.0, -100.0, -10.0, -1.0, -0.1, 0.0, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
}

///|
test "Asinh grid 400 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -10.0, -3.0, -1.0, -0.30000000000000004, -0.07, 0.0, 0.06, 0.30000000000000004,
    0.9, 3.0, 9.0,
  ])
}

///|
test "Asinh grid 401 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.5, -0.30000000000000004, -0.1, -0.03, 0.0, 0.03, 0.1, 0.30000000000000004,
    0.5, 1.0,
  ])
}

///|
test "Asinh grid 402 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 403 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    1.0e-10, 2.0e-10, 3.0e-10, 4.0e-10, 5.0e-10, 6.0e-10, 7.000000000000001e-10,
    8.0e-10, 9.0e-10, 1.0e-09,
  ])
}

///|
test "Asinh grid 404 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -1.0, -0.5, -0.30000000000000004, -0.2, -0.06, 0.0, 0.06, 0.2, 0.30000000000000004,
    0.5, 1.0,
  ])
}

///|
test "Asinh grid 405 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 10.0), [
    -10.0, -3.0, -1.0, -0.4, -0.1, 0.0, 0.1, 0.4, 1.0, 3.0, 10.0,
  ])
}

///|
test "Asinh grid 406 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, 1000.0), [
    -1000.0, -100.0, -20.0, -3.0, -0.4, 0.0, 0.4, 3.0, 20.0, 100.0, 1000.0,
  ])
}

///|
test "Asinh grid 407 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1.0), [
    0.0, 0.03, 0.06, 0.1, 0.2, 0.30000000000000004, 0.4, 0.5, 0.7000000000000001,
    1.0,
  ])
}

///|
test "Asinh grid 408 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.0), [
    0.0, 0.06, 0.1, 0.2, 0.4, 0.7000000000000001, 1.0, 2.0, 3.0, 6.0, 10.0,
  ])
}

///|
test "Asinh grid 409 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0), [
    0.0, 0.1, 0.4, 1.0, 3.0, 7.0, 20.0, 50.0, 100.0, 400.0, 1000.0,
  ])
}

///|
test "Asinh grid 410 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 10.0), [
    1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
}

///|
test "Asinh grid 411 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(10.0, 1000.0), [
    10.0, 20.0, 30.0, 40.0, 60.0, 100.0, 200.0, 300.0, 400.0, 600.0, 1000.0,
  ])
}

///|
test "Asinh grid 412 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, -1.0), [
    -10.0, -8.0, -6.0, -5.0, -4.0, -3.0, -2.0, -1.0,
  ])
}

///|
test "Asinh grid 413 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1000.0, -10.0), [
    -1000.0, -600.0, -400.0, -300.0, -200.0, -100.0, -60.0, -40.0, -30.0, -20.0,
    -10.0,
  ])
}

///|
test "Asinh grid 414 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1000.0, -1000.0), [
    -1000.0, -100.0, -20.0, -3.0, -0.4, 0.0, 0.4, 3.0, 20.0, 100.0, 1000.0,
  ])
}

///|
test "Asinh grid 415 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-10.0, 9.0), [
    -10.0, -4.0, -1.0, -0.4, -0.1, 0.0, 0.1, 0.4, 1.0, 3.0, 9.0,
  ])
}

///|
test "Asinh grid 416 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 0.9999999999999999), [
    -1.0, -0.5, -0.30000000000000004, -0.2, -0.06, 0.0, 0.06, 0.2, 0.30000000000000004,
    0.5, 1.0,
  ])
}

///|
test "Asinh grid 417 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
  ])
}

///|
test "Asinh grid 418 common source and mathematical collection profile" {
  let locator = AsinhLocator::new(
    0.1,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(1.0e-10, 1.0e-09), [
    1.0e-10, 2.0e-10, 3.0e-10, 4.0e-10, 5.0e-10, 6.0e-10, 7.000000000000001e-10,
    8.0e-10, 9.0e-10, 1.0e-09,
  ])
}

///|
test "Asinh grid 419 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    25296.741148454974,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1096.6331584284585), [
    0.0, 54.59815003314423, 148.41315910257657, 403.428793492735, 1096.6331584284583,
  ])
}

///|
test "Asinh grid 420 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    7.412419818125286e-06,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000.0000000000001), [
    0.0, 0.01, 1000.0,
  ])
}

///|
test "Asinh grid 421 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    9.659448444142718,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-99.99999999999999, 99.99999999999999),
    [-10.0, 0.0, 10.0],
  )
}

///|
test "Asinh grid 422 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    0.019576923958925834,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000000000.0000001), [
    0.0, 1000.0, 1000000000.0,
  ])
}

///|
test "Asinh grid 423 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    7.618201075332841e-05,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-3.9999999999999996, 3.9999999999999996),
    [
      -4.0, -0.25, -0.015625, -0.0009765625, -0.0001220703125, 0.0, 0.0001220703125,
      0.0009765625, 0.015625, 0.25, 4.0,
    ],
  )
}

///|
test "Asinh grid 424 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    1.88361562718168e-05,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10000.000000000002), [
    0.0, 0.1, 10000.0,
  ])
}

///|
test "Asinh grid 425 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    0.010697714786816186,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000000000.0000001), [
    0.0, 1000.0, 1000000000.0,
  ])
}

///|
test "Asinh grid 426 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    253757.67346088222,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-2980.957987041727, 2980.957987041727),
    [
      -1096.6331584284583, -403.428793492735, 0.0, 403.428793492735, 1096.6331584284583,
    ],
  )
}

///|
test "Asinh grid 427 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    1.0656200215372753e-05,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 100000000.00000001), [
    0.0, 10.0, 100000000.0,
  ])
}

///|
test "Asinh grid 428 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    0.00010878292679053294,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10000000000.000002), [
    0.0, 100.0, 1000000000.0,
  ])
}

///|
test "Asinh grid 429 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    9.956678644921975e-05,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-22026.4657948067, 22026.4657948067),
    [
      -22026.465794806703, -403.428793492735, -7.3890560989306495, -0.1353352832366127,
      -0.0024787521766663594, 0.0, 0.0024787521766663594, 0.1353352832366127, 7.3890560989306495,
      403.428793492735, 22026.465794806703,
    ],
  )
}

///|
test "Asinh grid 430 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    6.456689527081106e-05,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10000000000.000002), [
    0.0, 100.0, 1000000000.0,
  ])
}

///|
test "Asinh grid 431 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    0.0009569144950820967,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10000000.000000002), [
    0.0, 10.0, 10000000.0,
  ])
}

///|
test "Asinh grid 432 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    275.572696626167,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-2.0, 2.0), [
    -2.0, -1.0, -0.5, -0.125, 0.0, 0.125, 0.5, 1.0, 2.0,
  ])
}

///|
test "Asinh grid 433 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    0.0010167944022056287,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10000000000.000002), [
    0.0, 1000.0, 10000000000.0,
  ])
}

///|
test "Asinh grid 434 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    273.8550720812399,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, 0.0, 100.0,
  ])
}

///|
test "Asinh grid 435 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    2.1137711063631862e-05,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-22026.4657948067, 22026.4657948067),
    [
      -22026.465794806703, -148.41315910257657, -2.718281828459045, -0.04978706836786395,
      -0.00033546262790251196, 0.0, 0.00033546262790251196, 0.04978706836786395,
      2.718281828459045, 148.41315910257657, 22026.465794806703,
    ],
  )
}

///|
test "Asinh grid 436 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    1.5929961847521284e-05,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-8103.08392757538, 8103.08392757538),
    [
      -8103.08392757538, -54.59815003314423, -1.0, -0.018315638888734186, -0.00033546262790251196,
      0.0, 0.00033546262790251196, 0.018315638888734186, 1.0, 54.59815003314423,
      8103.08392757538,
    ],
  )
}

///|
test "Asinh grid 437 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    55.03224553750409,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-9.999999999999998, 9.999999999999998),
    [-1.0, 0.0, 1.0],
  )
}

///|
test "Asinh grid 438 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    35933.003052262735,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-403.42879349273494, 403.42879349273494),
    [
      -148.41315910257657, -54.59815003314423, 0.0, 54.59815003314423, 148.41315910257657,
    ],
  )
}

///|
test "Asinh grid 439 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    0.0063830671299047615,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10000000000.000002), [
    0.0, 1000.0, 10000000000.0,
  ])
}

///|
test "Asinh grid 440 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    0.0006410063222012242,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 100000000.00000001), [
    0.0, 100.0, 100000000.0,
  ])
}

///|
test "Asinh grid 441 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    2.8203986842580927e-06,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-999.9999999999999, 999.9999999999999),
    [-1000.0, 0.0, 1000.0],
  )
}

///|
test "Asinh grid 442 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    0.03087576795878052,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-9999999.999999998, 9999999.999999998),
    [-10000000.0, 0.0, 10000000.0],
  )
}

///|
test "Asinh grid 443 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    167.04651674942346,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-0.015624999999999998, 0.015624999999999998),
    [
      -0.0078125, -0.00390625, -0.0009765625, 0.0, 0.0009765625, 0.00390625, 0.0078125,
    ],
  )
}

///|
test "Asinh grid 444 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    6.529580814933349e-06,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=2.718281828459045,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-22026.4657948067, 22026.4657948067),
    [
      -22026.465794806703, -148.41315910257657, -1.0, -0.018315638888734186, -0.00012340980408667962,
      0.0, 0.00012340980408667962, 0.018315638888734186, 1.0, 148.41315910257657,
      22026.465794806703,
    ],
  )
}

///|
test "Asinh grid 445 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    0.004443064800322056,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 1000000.0000000001), [
    0.0, 10.0, 1000000.0,
  ])
}

///|
test "Asinh grid 446 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    0.0007816380153943341,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-0.015624999999999998, 0.015624999999999998),
    [
      -0.015625, -0.00390625, -0.001953125, -0.0009765625, -0.000244140625, 0.0,
      0.000244140625, 0.0009765625, 0.001953125, 0.00390625, 0.015625,
    ],
  )
}

///|
test "Asinh grid 447 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    4.118036048077514e-06,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10000000.000000002), [
    0.0, 1.0, 10000000.0,
  ])
}

///|
test "Asinh grid 448 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    4.705112930954777e-06,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 100000.00000000001), [
    0.0, 0.1, 100000.0,
  ])
}

///|
test "Asinh grid 449 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    124.09826336014366,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-3.9999999999999996, 3.9999999999999996),
    [-4.0, -2.0, -1.0, -0.25, 0.0, 0.25, 1.0, 2.0, 4.0],
  )
}

///|
test "Asinh grid 450 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    17.32763353240028,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-9.999999999999998, 9.999999999999998),
    [-1.0, 0.0, 1.0],
  )
}

///|
test "Asinh grid 451 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    3.3795085169829755,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-0.015625, 0.015625), [
    -0.015625, -0.0078125, -0.00390625, -0.0009765625, 0.0, 0.0009765625, 0.00390625,
    0.0078125, 0.015625,
  ])
}

///|
test "Asinh grid 452 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    0.2812912451399114,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-1023.9999999999999, 1023.9999999999999),
    [-1024.0, -128.0, -16.0, -2.0, -0.25, 0.0, 0.25, 2.0, 16.0, 128.0, 1024.0],
  )
}

///|
test "Asinh grid 453 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    1769.3487656836926,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0, 1.0), [
    -0.5, -0.25, -0.0625, 0.0, 0.0625, 0.25, 0.5,
  ])
}

///|
test "Asinh grid 454 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    4.228189848355885e-05,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100000000.0, 100000000.0), [
    -100000000.0, 0.0, 100000000.0,
  ])
}

///|
test "Asinh grid 455 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    0.011911617392108127,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(0.0, 10.000000000000002), [
    0.0, 0.1, 1.0,
  ])
}

///|
test "Asinh grid 456 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    0.29102281626104565,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, 0.0, 100.0,
  ])
}

///|
test "Asinh grid 457 actual source vs mathematical boundary collection" {
  let locator = AsinhLocator::new(
    0.0184123227877044,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("10"))),
    base=2.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(-0.12499999999999999, 0.12499999999999999),
    [
      -0.0625, -0.03125, -0.015625, -0.00390625, 0.0, 0.00390625, 0.015625, 0.03125,
      0.0625,
    ],
  )
}

///|
test "Asinh grid 458 decimal phase boundaries merged before set" {
  let locator = AsinhLocator::new(
    1.0e-316,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("101"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(9.9999993e-317, 1.00000003e-316), [
    9.9999993e-317, 9.9999993e-317, 9.9999993e-317, 9.9999993e-317, 9.9999993e-317,
    9.9999993e-317, 9.9999993e-317, 9.9999993e-317, 9.9999993e-317, 9.9999993e-317,
    9.9999993e-317, 9.9999993e-317, 9.9999993e-317, 9.9999993e-317, 9.9999993e-317,
    9.9999993e-317, 9.9999993e-317, 9.9999993e-317, 9.9999993e-317, 9.9999993e-317,
    9.9999993e-317, 9.9999993e-317, 9.9999993e-317, 9.9999993e-317, 9.9999993e-317,
    9.9999993e-317, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316,
    1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316,
    1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316,
    1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316,
    1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316,
    1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316, 1.0e-316,
    1.0e-316, 1.0e-316, 1.00000003e-316, 1.00000003e-316, 1.00000003e-316, 1.00000003e-316,
    1.00000003e-316, 1.00000003e-316, 1.00000003e-316, 1.00000003e-316, 1.00000003e-316,
    1.00000003e-316, 1.00000003e-316, 1.00000003e-316, 1.00000003e-316, 1.00000003e-316,
    1.00000003e-316, 1.00000003e-316, 1.00000003e-316, 1.00000003e-316, 1.00000003e-316,
    1.00000003e-316, 1.00000003e-316, 1.00000003e-316, 1.00000003e-316, 1.00000003e-316,
    1.00000003e-316, 1.00000003e-316,
  ])
}

///|
test "Asinh grid 459 decimal phase boundaries merged before set" {
  let locator = AsinhLocator::new(
    1.0e-291,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("101"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(9.999999999999998e-292, 1.0000000000000001e-291),
    [
      9.999999999999998e-292, 9.999999999999998e-292, 9.999999999999998e-292, 9.999999999999998e-292,
      9.999999999999998e-292, 9.999999999999998e-292, 9.999999999999998e-292, 9.999999999999998e-292,
      9.999999999999998e-292, 9.999999999999998e-292, 9.999999999999998e-292, 9.999999999999998e-292,
      9.999999999999998e-292, 9.999999999999998e-292, 9.999999999999998e-292, 9.999999999999998e-292,
      9.999999999999998e-292, 9.999999999999998e-292, 9.999999999999998e-292, 9.999999999999998e-292,
      9.999999999999998e-292, 9.999999999999998e-292, 9.999999999999998e-292, 9.999999999999998e-292,
      9.999999999999998e-292, 9.999999999999998e-292, 1.0e-291, 1.0e-291, 1.0e-291,
      1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291,
      1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291,
      1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291,
      1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291,
      1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291,
      1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0e-291, 1.0000000000000001e-291,
      1.0000000000000001e-291, 1.0000000000000001e-291, 1.0000000000000001e-291,
      1.0000000000000001e-291, 1.0000000000000001e-291, 1.0000000000000001e-291,
      1.0000000000000001e-291, 1.0000000000000001e-291, 1.0000000000000001e-291,
      1.0000000000000001e-291, 1.0000000000000001e-291, 1.0000000000000001e-291,
      1.0000000000000001e-291, 1.0000000000000001e-291, 1.0000000000000001e-291,
      1.0000000000000001e-291, 1.0000000000000001e-291, 1.0000000000000001e-291,
      1.0000000000000001e-291, 1.0000000000000001e-291, 1.0000000000000001e-291,
      1.0000000000000001e-291, 1.0000000000000001e-291, 1.0000000000000001e-291,
    ],
  )
}

///|
test "Asinh grid 460 decimal phase boundaries merged before set" {
  let locator = AsinhLocator::new(
    1.0e-99,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("101"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(9.999999999999998e-100, 1.0000000000000002e-99),
    [
      9.999999999999998e-100, 9.999999999999998e-100, 9.999999999999998e-100, 9.999999999999998e-100,
      9.999999999999998e-100, 9.999999999999998e-100, 9.999999999999998e-100, 9.999999999999998e-100,
      9.999999999999998e-100, 9.999999999999998e-100, 9.999999999999998e-100, 9.999999999999998e-100,
      9.999999999999998e-100, 9.999999999999998e-100, 9.999999999999998e-100, 9.999999999999998e-100,
      9.999999999999998e-100, 9.999999999999998e-100, 9.999999999999998e-100, 9.999999999999998e-100,
      9.999999999999998e-100, 9.999999999999998e-100, 9.999999999999998e-100, 9.999999999999998e-100,
      9.999999999999998e-100, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99,
      1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99,
      1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99,
      1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99,
      1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99,
      1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99, 1.0e-99,
      1.0000000000000002e-99, 1.0000000000000002e-99, 1.0000000000000002e-99, 1.0000000000000002e-99,
      1.0000000000000002e-99, 1.0000000000000002e-99, 1.0000000000000002e-99, 1.0000000000000002e-99,
      1.0000000000000002e-99, 1.0000000000000002e-99, 1.0000000000000002e-99, 1.0000000000000002e-99,
      1.0000000000000002e-99, 1.0000000000000002e-99, 1.0000000000000002e-99, 1.0000000000000002e-99,
      1.0000000000000002e-99, 1.0000000000000002e-99, 1.0000000000000002e-99, 1.0000000000000002e-99,
      1.0000000000000002e-99, 1.0000000000000002e-99, 1.0000000000000002e-99, 1.0000000000000002e-99,
      1.0000000000000002e-99,
    ],
  )
}

///|
test "Asinh grid 461 decimal phase boundaries merged before set" {
  let locator = AsinhLocator::new(
    1.0e-23,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("101"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(9.999999999999998e-24, 1.0000000000000001e-23),
    [
      9.999999999999998e-24, 9.999999999999998e-24, 9.999999999999998e-24, 9.999999999999998e-24,
      9.999999999999998e-24, 9.999999999999998e-24, 9.999999999999998e-24, 9.999999999999998e-24,
      9.999999999999998e-24, 9.999999999999998e-24, 9.999999999999998e-24, 9.999999999999998e-24,
      9.999999999999998e-24, 9.999999999999998e-24, 9.999999999999998e-24, 9.999999999999998e-24,
      9.999999999999998e-24, 9.999999999999998e-24, 9.999999999999998e-24, 9.999999999999998e-24,
      9.999999999999998e-24, 9.999999999999998e-24, 9.999999999999998e-24, 9.999999999999998e-24,
      9.999999999999998e-24, 9.999999999999998e-24, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23,
      1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23,
      1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23,
      1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23,
      1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23,
      1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23, 1.0e-23,
      1.0000000000000001e-23, 1.0000000000000001e-23, 1.0000000000000001e-23, 1.0000000000000001e-23,
      1.0000000000000001e-23, 1.0000000000000001e-23, 1.0000000000000001e-23, 1.0000000000000001e-23,
      1.0000000000000001e-23, 1.0000000000000001e-23, 1.0000000000000001e-23, 1.0000000000000001e-23,
      1.0000000000000001e-23, 1.0000000000000001e-23, 1.0000000000000001e-23, 1.0000000000000001e-23,
      1.0000000000000001e-23, 1.0000000000000001e-23, 1.0000000000000001e-23, 1.0000000000000001e-23,
      1.0000000000000001e-23, 1.0000000000000001e-23, 1.0000000000000001e-23, 1.0000000000000001e-23,
      1.0000000000000001e-23, 1.0000000000000001e-23,
    ],
  )
}

///|
test "Asinh grid 462 decimal phase boundaries merged before set" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("101"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(0.9999999999999999, 1.0000000000000002),
    [
      0.9999999999999999, 0.9999999999999999, 0.9999999999999999, 0.9999999999999999,
      0.9999999999999999, 0.9999999999999999, 0.9999999999999999, 0.9999999999999999,
      0.9999999999999999, 0.9999999999999999, 0.9999999999999999, 0.9999999999999999,
      0.9999999999999999, 0.9999999999999999, 0.9999999999999999, 0.9999999999999999,
      0.9999999999999999, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
      1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
      1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
      1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0000000000000002, 1.0000000000000002,
      1.0000000000000002, 1.0000000000000002, 1.0000000000000002, 1.0000000000000002,
      1.0000000000000002, 1.0000000000000002, 1.0000000000000002, 1.0000000000000002,
      1.0000000000000002, 1.0000000000000002, 1.0000000000000002, 1.0000000000000002,
      1.0000000000000002, 1.0000000000000002, 1.0000000000000002, 1.0000000000000002,
      1.0000000000000002, 1.0000000000000002, 1.0000000000000002, 1.0000000000000002,
      1.0000000000000002, 1.0000000000000002, 1.0000000000000002, 1.0000000000000002,
      1.0000000000000002, 1.0000000000000002, 1.0000000000000002, 1.0000000000000002,
      1.0000000000000002, 1.0000000000000002, 1.0000000000000002, 1.0000000000000002,
    ],
  )
}

///|
test "Asinh grid 463 decimal phase boundaries merged before set" {
  let locator = AsinhLocator::new(
    10.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("101"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(9.999999999999998, 10.000000000000002),
    [
      9.999999999999998, 9.999999999999998, 9.999999999999998, 9.999999999999998,
      9.999999999999998, 9.999999999999998, 9.999999999999998, 9.999999999999998,
      9.999999999999998, 9.999999999999998, 9.999999999999998, 9.999999999999998,
      9.999999999999998, 9.999999999999998, 9.999999999999998, 9.999999999999998,
      9.999999999999998, 9.999999999999998, 9.999999999999998, 9.999999999999998,
      9.999999999999998, 9.999999999999998, 9.999999999999998, 9.999999999999998,
      9.999999999999998, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0,
      10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0,
      10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0,
      10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0,
      10.0, 10.0, 10.000000000000002, 10.000000000000002, 10.000000000000002, 10.000000000000002,
      10.000000000000002, 10.000000000000002, 10.000000000000002, 10.000000000000002,
      10.000000000000002, 10.000000000000002, 10.000000000000002, 10.000000000000002,
      10.000000000000002, 10.000000000000002, 10.000000000000002, 10.000000000000002,
      10.000000000000002, 10.000000000000002, 10.000000000000002, 10.000000000000002,
      10.000000000000002, 10.000000000000002, 10.000000000000002, 10.000000000000002,
      10.000000000000002,
    ],
  )
}

///|
test "Asinh grid 464 decimal phase boundaries merged before set" {
  let locator = AsinhLocator::new(
    1.0e+21,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("101"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(9.999999999999999e+20, 1.0000000000000001e+21),
    [
      9.999999999999999e+20, 9.999999999999999e+20, 9.999999999999999e+20, 9.999999999999999e+20,
      9.999999999999999e+20, 9.999999999999999e+20, 9.999999999999999e+20, 9.999999999999999e+20,
      9.999999999999999e+20, 9.999999999999999e+20, 9.999999999999999e+20, 9.999999999999999e+20,
      9.999999999999999e+20, 9.999999999999999e+20, 9.999999999999999e+20, 9.999999999999999e+20,
      9.999999999999999e+20, 9.999999999999999e+20, 9.999999999999999e+20, 9.999999999999999e+20,
      9.999999999999999e+20, 9.999999999999999e+20, 9.999999999999999e+20, 9.999999999999999e+20,
      9.999999999999999e+20, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21,
      1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21,
      1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21,
      1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21,
      1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21,
      1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21, 1.0e+21,
      1.0000000000000001e+21, 1.0000000000000001e+21, 1.0000000000000001e+21, 1.0000000000000001e+21,
      1.0000000000000001e+21, 1.0000000000000001e+21, 1.0000000000000001e+21, 1.0000000000000001e+21,
      1.0000000000000001e+21, 1.0000000000000001e+21, 1.0000000000000001e+21, 1.0000000000000001e+21,
      1.0000000000000001e+21, 1.0000000000000001e+21, 1.0000000000000001e+21, 1.0000000000000001e+21,
      1.0000000000000001e+21, 1.0000000000000001e+21, 1.0000000000000001e+21, 1.0000000000000001e+21,
      1.0000000000000001e+21, 1.0000000000000001e+21, 1.0000000000000001e+21, 1.0000000000000001e+21,
      1.0000000000000001e+21,
    ],
  )
}

///|
test "Asinh grid 465 decimal phase boundaries merged before set" {
  let locator = AsinhLocator::new(
    1.0e+23,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("101"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(9.999999999999997e+22, 1.0000000000000001e+23),
    [
      9.999999999999997e+22, 9.999999999999997e+22, 9.999999999999997e+22, 9.999999999999997e+22,
      9.999999999999997e+22, 9.999999999999997e+22, 9.999999999999997e+22, 9.999999999999997e+22,
      9.999999999999997e+22, 9.999999999999997e+22, 9.999999999999997e+22, 9.999999999999997e+22,
      9.999999999999997e+22, 9.999999999999997e+22, 9.999999999999997e+22, 9.999999999999997e+22,
      9.999999999999997e+22, 9.999999999999997e+22, 9.999999999999997e+22, 9.999999999999997e+22,
      9.999999999999997e+22, 9.999999999999997e+22, 9.999999999999997e+22, 9.999999999999997e+22,
      9.999999999999997e+22, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23,
      1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23,
      1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23,
      1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23,
      1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23,
      1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23, 1.0e+23,
      1.0000000000000001e+23, 1.0000000000000001e+23, 1.0000000000000001e+23, 1.0000000000000001e+23,
      1.0000000000000001e+23, 1.0000000000000001e+23, 1.0000000000000001e+23, 1.0000000000000001e+23,
      1.0000000000000001e+23, 1.0000000000000001e+23, 1.0000000000000001e+23, 1.0000000000000001e+23,
      1.0000000000000001e+23, 1.0000000000000001e+23, 1.0000000000000001e+23, 1.0000000000000001e+23,
      1.0000000000000001e+23, 1.0000000000000001e+23, 1.0000000000000001e+23, 1.0000000000000001e+23,
      1.0000000000000001e+23, 1.0000000000000001e+23, 1.0000000000000001e+23, 1.0000000000000001e+23,
      1.0000000000000001e+23,
    ],
  )
}

///|
test "Asinh grid 466 decimal phase boundaries merged before set" {
  let locator = AsinhLocator::new(
    1.0e+24,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("101"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(9.999999999999998e+23, 1.0000000000000001e+24),
    [
      9.999999999999998e+23, 9.999999999999998e+23, 9.999999999999998e+23, 9.999999999999998e+23,
      9.999999999999998e+23, 9.999999999999998e+23, 9.999999999999998e+23, 9.999999999999998e+23,
      9.999999999999998e+23, 9.999999999999998e+23, 9.999999999999998e+23, 9.999999999999998e+23,
      9.999999999999998e+23, 9.999999999999998e+23, 9.999999999999998e+23, 9.999999999999998e+23,
      9.999999999999998e+23, 9.999999999999998e+23, 9.999999999999998e+23, 9.999999999999998e+23,
      9.999999999999998e+23, 9.999999999999998e+23, 9.999999999999998e+23, 9.999999999999998e+23,
      9.999999999999998e+23, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24,
      1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24,
      1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24,
      1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24,
      1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24,
      1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24, 1.0e+24,
      1.0000000000000001e+24, 1.0000000000000001e+24, 1.0000000000000001e+24, 1.0000000000000001e+24,
      1.0000000000000001e+24, 1.0000000000000001e+24, 1.0000000000000001e+24, 1.0000000000000001e+24,
      1.0000000000000001e+24, 1.0000000000000001e+24, 1.0000000000000001e+24, 1.0000000000000001e+24,
      1.0000000000000001e+24, 1.0000000000000001e+24, 1.0000000000000001e+24, 1.0000000000000001e+24,
      1.0000000000000001e+24, 1.0000000000000001e+24, 1.0000000000000001e+24, 1.0000000000000001e+24,
      1.0000000000000001e+24, 1.0000000000000001e+24, 1.0000000000000001e+24, 1.0000000000000001e+24,
      1.0000000000000001e+24,
    ],
  )
}

///|
test "Asinh grid 467 decimal phase boundaries merged before set" {
  let locator = AsinhLocator::new(
    1.0e+101,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("101"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(9.999999999999998e+100, 1.0000000000000001e+101),
    [
      9.999999999999998e+100, 9.999999999999998e+100, 9.999999999999998e+100, 9.999999999999998e+100,
      9.999999999999998e+100, 9.999999999999998e+100, 9.999999999999998e+100, 9.999999999999998e+100,
      9.999999999999998e+100, 9.999999999999998e+100, 9.999999999999998e+100, 9.999999999999998e+100,
      9.999999999999998e+100, 9.999999999999998e+100, 9.999999999999998e+100, 9.999999999999998e+100,
      9.999999999999998e+100, 9.999999999999998e+100, 9.999999999999998e+100, 9.999999999999998e+100,
      9.999999999999998e+100, 9.999999999999998e+100, 9.999999999999998e+100, 9.999999999999998e+100,
      9.999999999999998e+100, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101,
      1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101,
      1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101,
      1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101,
      1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101,
      1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101,
      1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0e+101, 1.0000000000000001e+101,
      1.0000000000000001e+101, 1.0000000000000001e+101, 1.0000000000000001e+101,
      1.0000000000000001e+101, 1.0000000000000001e+101, 1.0000000000000001e+101,
      1.0000000000000001e+101, 1.0000000000000001e+101, 1.0000000000000001e+101,
      1.0000000000000001e+101, 1.0000000000000001e+101, 1.0000000000000001e+101,
      1.0000000000000001e+101, 1.0000000000000001e+101, 1.0000000000000001e+101,
      1.0000000000000001e+101, 1.0000000000000001e+101, 1.0000000000000001e+101,
      1.0000000000000001e+101, 1.0000000000000001e+101, 1.0000000000000001e+101,
      1.0000000000000001e+101, 1.0000000000000001e+101, 1.0000000000000001e+101,
    ],
  )
}

///|
test "Asinh grid 468 decimal phase boundaries merged before set" {
  let locator = AsinhLocator::new(
    1.0e+301,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("101"))),
    base=1.0,
    subs=None,
  )
  verify_asinh_grid_bits(
    locator.tick_values(9.999999999999999e+300, 1.0000000000000002e+301),
    [
      9.999999999999999e+300, 9.999999999999999e+300, 9.999999999999999e+300, 9.999999999999999e+300,
      9.999999999999999e+300, 9.999999999999999e+300, 9.999999999999999e+300, 9.999999999999999e+300,
      9.999999999999999e+300, 9.999999999999999e+300, 9.999999999999999e+300, 9.999999999999999e+300,
      9.999999999999999e+300, 9.999999999999999e+300, 9.999999999999999e+300, 9.999999999999999e+300,
      9.999999999999999e+300, 9.999999999999999e+300, 9.999999999999999e+300, 9.999999999999999e+300,
      9.999999999999999e+300, 9.999999999999999e+300, 9.999999999999999e+300, 9.999999999999999e+300,
      9.999999999999999e+300, 9.999999999999999e+300, 1.0e+301, 1.0e+301, 1.0e+301,
      1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301,
      1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301,
      1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301,
      1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301,
      1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301,
      1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0e+301, 1.0000000000000002e+301,
      1.0000000000000002e+301, 1.0000000000000002e+301, 1.0000000000000002e+301,
      1.0000000000000002e+301, 1.0000000000000002e+301, 1.0000000000000002e+301,
      1.0000000000000002e+301, 1.0000000000000002e+301, 1.0000000000000002e+301,
      1.0000000000000002e+301, 1.0000000000000002e+301, 1.0000000000000002e+301,
      1.0000000000000002e+301, 1.0000000000000002e+301, 1.0000000000000002e+301,
      1.0000000000000002e+301, 1.0000000000000002e+301, 1.0000000000000002e+301,
      1.0000000000000002e+301, 1.0000000000000002e+301, 1.0000000000000002e+301,
      1.0000000000000002e+301, 1.0000000000000002e+301, 1.0000000000000002e+301,
      1.0000000000000002e+301,
    ],
  )
}

///|
test "Asinh grid 469 integer reverse ndarray view truth" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
    base=10.0,
    subs=Some(
      AsinhSubs::NdArray(
        TickValues::from_int64_array([0L, 9007199254740993L, 0L]).view(1, -1, 1),
      ),
    ),
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -9.007199254740992e+17, -9.007199254740992e+16, -9007199254740992.0, 0.0, 9007199254740992.0,
    9.007199254740992e+16, 9.007199254740992e+17,
  ])
}

///|
test "Asinh grid 470 full source125000 fallback denominator" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("125000"))),
    base=10.0,
    subs=None,
  )
  let ticks = locator.tick_values(1.0, 2.0)
  assert_eq(ticks.length(), 100000)
  verify_asinh_grid_bits(
    [
      ticks[0],
      ticks[1],
      ticks[2],
      ticks[3],
      ticks[4],
      ticks[5],
      ticks[6],
      ticks[7],
      ticks[49998],
      ticks[49999],
      ticks[50000],
      ticks[50001],
      ticks[99996],
      ticks[99997],
      ticks[99998],
      ticks[99999],
    ],
    [
      1.0, 1.0000080000640006, 1.000016000128001, 1.0000240001920015, 1.0000320002560021,
      1.0000400003200025, 1.000048000384003, 1.0000560004480037, 1.3999871998975992,
      1.3999951999615998, 1.4000032000256002, 1.4000112000896008, 1.7999743997951985,
      1.7999823998591988, 1.7999903999231994, 1.7999983999871998,
    ],
  )
}

///|
test "Asinh grid 471 full source200001 grid before unique" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("200001"))),
    base=10.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, -0.1, -0.01, -0.001, -0.0001, -1.0e-05, 0.0, 1.0e-05, 0.0001,
    0.001, 0.01, 0.1, 1.0, 10.0, 100.0,
  ])
}

///|
test "Asinh grid 472 full source outer375000 sorted350000" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
    base=10.0,
    subs=Some(
      AsinhSubs::Sequence(
        Array::makei(125000, index => (125000 - index).to_double()),
      ),
    ),
  )
  let ticks = locator.tick_values(1.0, 100.0)
  assert_eq(ticks.length(), 100000)
  verify_asinh_grid_bits(
    [
      ticks[0],
      ticks[1],
      ticks[2],
      ticks[3],
      ticks[4],
      ticks[5],
      ticks[6],
      ticks[7],
      ticks[49998],
      ticks[49999],
      ticks[50000],
      ticks[50001],
      ticks[99996],
      ticks[99997],
      ticks[99998],
      ticks[99999],
    ],
    [
      1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 49999.0, 50000.0, 50001.0, 50002.0,
      99997.0, 99998.0, 99999.0, 100000.0,
    ],
  )
}

///|
test "Asinh grid 476 actual rounded arange byte shape failure" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(
      LogNumTicks::Integer(@bigint.BigInt::from_string("1152921504606846975")),
    ),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 477 actual rounded arange byte shape failure" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(
      LogNumTicks::Integer(@bigint.BigInt::from_string("1152921504606846974")),
    ),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 478 actual rounded arange byte shape failure" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(
      LogNumTicks::Integer(@bigint.BigInt::from_string("1152921504606846913")),
    ),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 479 actual rounded arange byte shape failure" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(
      LogNumTicks::Integer(@bigint.BigInt::from_string("1152921504606846912")),
    ),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 480 actual rounded arange byte shape failure" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(
      LogNumTicks::Integer(@bigint.BigInt::from_string("1152921504606846976")),
    ),
    base=10.0,
    subs=None,
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh grid 481 accepted integer power math and source profile" {
  let locator = AsinhLocator::new(
    1.0,
    numticks=Some(LogNumTicks::Integer(@bigint.BigInt::from_string("100"))),
    base=3.0,
    subs=None,
  )
  verify_asinh_grid_bits(locator.tick_values(-1.0e+20, 1.0e+20), [
    -3.647299637717079e+19, -1.2157665459056929e+19, -4.052555153018976e+18, -1.350851717672992e+18,
    -4.502839058909974e+17, -1.5009463529699914e+17, -5.0031545098999704e+16, -1.6677181699666568e+16,
    -5559060566555523.0, -1853020188851841.0, -617673396283947.0, -205891132094649.0,
    -68630377364883.0, -22876792454961.0, -7625597484987.0, -2541865828329.0, -847288609443.0,
    -282429536481.0, -94143178827.0, -31381059609.0, -10460353203.0, -3486784401.0,
    -1162261467.0, -387420489.0, -129140163.0, -43046721.0, -14348907.0, -4782969.0,
    -1594323.0, -531441.0, -177147.0, -59049.0, -19683.0, -6561.0, -2187.0, -729.0,
    -243.0, -81.0, -27.0, -9.0, -3.0, -1.0, -0.3333333333333333, 0.0, 0.3333333333333333,
    1.0, 3.0, 9.0, 27.0, 81.0, 243.0, 729.0, 2187.0, 6561.0, 19683.0, 59049.0, 177147.0,
    531441.0, 1594323.0, 4782969.0, 14348907.0, 43046721.0, 129140163.0, 387420489.0,
    1162261467.0, 3486784401.0, 10460353203.0, 31381059609.0, 94143178827.0, 282429536481.0,
    847288609443.0, 2541865828329.0, 7625597484987.0, 22876792454961.0, 68630377364883.0,
    205891132094649.0, 617673396283947.0, 1853020188851841.0, 5559060566555523.0,
    1.6677181699666568e+16, 5.0031545098999704e+16, 1.5009463529699914e+17, 4.502839058909974e+17,
    1.350851717672992e+18, 4.052555153018976e+18, 1.2157665459056929e+19, 3.647299637717079e+19,
  ])
}

///|
test "Asinh full scalar linspace shape 9007199254740993" {
  let line = asinh_grid_line(-1.0, 3.0, 9007199254740993L)
  assert_eq(line.requested, 9007199254740993L)
  assert_eq(line.count, 9007199254740992L)
  verify_asinh_grid_bits(
    [
      line.at(0L),
      line.at(1L),
      line.at(2L),
      line.at(9007199254740990L),
      line.at(9007199254740991L),
    ],
    [-1.0, -0.9999999999999996, -0.9999999999999991, 2.999999999999999, 3.0],
  )
}

///|
test "Asinh full scalar linspace shape 9007199254740995" {
  let line = asinh_grid_line(-1.0, 3.0, 9007199254740995L)
  assert_eq(line.requested, 9007199254740995L)
  assert_eq(line.count, 9007199254740996L)
  verify_asinh_grid_bits(
    [
      line.at(0L),
      line.at(1L),
      line.at(2L),
      line.at(9007199254740994L),
      line.at(9007199254740995L),
    ],
    [-1.0, -0.9999999999999996, -0.9999999999999991, 3.0, 3.0],
  )
}

///|
test "Asinh full scalar linspace shape 18014398509481983" {
  let line = asinh_grid_line(-1.0, 3.0, 18014398509481983L)
  assert_eq(line.requested, 18014398509481983L)
  assert_eq(line.count, 18014398509481984L)
  verify_asinh_grid_bits(
    [
      line.at(0L),
      line.at(1L),
      line.at(2L),
      line.at(18014398509481982L),
      line.at(18014398509481983L),
    ],
    [-1.0, -0.9999999999999998, -0.9999999999999996, 3.0, 3.0],
  )
}

///|
test "Asinh full scalar linspace shape 1000000000000" {
  let line = asinh_grid_line(-1.0, 3.0, 1000000000000L)
  assert_eq(line.requested, 1000000000000L)
  assert_eq(line.count, 1000000000000L)
  verify_asinh_grid_bits(
    [
      line.at(0L),
      line.at(1L),
      line.at(2L),
      line.at(999999999998L),
      line.at(999999999999L),
    ],
    [-1.0, -0.999999999996, -0.999999999992, 2.999999999996, 3.0],
  )
}
