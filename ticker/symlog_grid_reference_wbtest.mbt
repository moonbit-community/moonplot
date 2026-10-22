// Complete original SymmetricalLogLocator AST; independent D24 mathematical primitives.

///|
fn verify_symlog_grid_bits(
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
test "SymLog original grid 0 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-1.0, 1.0), [-1.0, 0.0, 1.0])
}

///|
test "SymLog original grid 1 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 2 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.0, 0.5), [-0.0, 0.5])
}

///|
test "SymLog original grid 3 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, -0.0), [-0.5, 0.0])
}

///|
test "SymLog original grid 4 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.5), [0.0, 0.5])
}

///|
test "SymLog original grid 5 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.0), [-0.5, 0.0])
}

///|
test "SymLog original grid 6 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 7 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(0.5, 0.5), [])
}

///|
test "SymLog original grid 8 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(1.0, 1.0), [])
}

///|
test "SymLog original grid 9 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-1.0, -1.0), [])
}

///|
test "SymLog original grid 10 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(1.0, -1.0), [-1.0, 0.0, 1.0])
}

///|
test "SymLog original grid 11 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-1.0, 1.0000000000000002), [
    0.0, 1.0,
  ])
}

///|
test "SymLog original grid 12 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-1.0000000000000002, 1.0), [
    -1.0, 0.0,
  ])
}

///|
test "SymLog original grid 13 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(1.0, 10.0), [1.0, 10.0])
}

///|
test "SymLog original grid 14 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-10.0, -1.0), [-10.0, -1.0])
}

///|
test "SymLog original grid 15 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 100.0), [
    0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original grid 16 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 0.5), [
    -100.0, -10.0, -1.0, 0.0,
  ])
}

///|
test "SymLog original grid 17 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, -2.0), [
    -100.0, -10.0, -1.0,
  ])
}

///|
test "SymLog original grid 18 simple set and three region boundaries" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 10.0, 100.0])
}

///|
test "SymLog original grid 19 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=0.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 20 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=0.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [0.0])
}

///|
test "SymLog original grid 21 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=0.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [])
}

///|
test "SymLog original grid 22 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=-0.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 23 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=-0.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [0.0])
}

///|
test "SymLog original grid 24 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=-0.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [])
}

///|
test "SymLog original grid 25 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=0.5, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 26 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=0.5, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [0.0])
}

///|
test "SymLog original grid 27 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=0.5, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [])
}

///|
test "SymLog original grid 28 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=1.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 29 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=1.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
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
test "SymLog original grid 30 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=1.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 31 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=-1.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 32 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=-1.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
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
test "SymLog original grid 33 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=-1.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 34 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=0.0 / 0.0,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 35 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=0.0 / 0.0,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
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
test "SymLog original grid 36 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=0.0 / 0.0,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 37 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=1.0 / 0.0,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 38 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=1.0 / 0.0,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [0.0])
}

///|
test "SymLog original grid 39 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=1.0 / 0.0,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [])
}

///|
test "SymLog original grid 40 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=-1.0 / 0.0,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 41 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=-1.0 / 0.0,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
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
test "SymLog original grid 42 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=-1.0 / 0.0,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 43 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 44 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -64.0, -32.0, -16.0, -8.0, -4.0, -2.0, -1.0, 0.0, 1.0, 2.0, 4.0, 8.0, 16.0, 32.0,
    64.0,
  ])
}

///|
test "SymLog original grid 45 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [
    2.0, 4.0, 8.0, 16.0, 32.0, 64.0,
  ])
}

///|
test "SymLog original grid 46 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 47 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -81.0, -27.0, -9.0, -3.0, -1.0, 0.0, 1.0, 3.0, 9.0, 27.0, 81.0,
  ])
}

///|
test "SymLog original grid 48 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [
    1.0, 3.0, 9.0, 27.0, 81.0,
  ])
}

///|
test "SymLog original grid 49 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=2.718281828459045,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 50 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=2.718281828459045,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -54.59815003314423, -20.085536923187664, -7.3890560989306495, -2.718281828459045,
    -1.0, 0.0, 1.0, 2.718281828459045, 7.3890560989306495, 20.085536923187664, 54.59815003314423,
  ])
}

///|
test "SymLog original grid 51 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=2.718281828459045,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [
    1.0, 2.718281828459045, 7.3890560989306495, 20.085536923187664, 54.59815003314423,
  ])
}

///|
test "SymLog original grid 52 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=1.0000000000000002,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 53 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=1.0000000000000002,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.99999999999997, -52.23838585573249, -27.018306503093, -13.974185349277409,
    -7.227612735594824, -3.7382061673050364, -1.9334441205540531, -1.0, 0.0, 1.0,
    1.9334441205540531, 3.7382061673050364, 7.227612735594824, 13.974185349277409,
    27.018306503093, 52.23838585573249, 100.99999999999997,
  ])
}

///|
test "SymLog original grid 54 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=1.0000000000000002,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [
    2.0, 2.6466326481155056, 3.5023321870354467, 4.634693355376897, 6.133165374172247,
    8.11611785778791, 10.74019124918738, 14.212670403551888, 18.8078587534727, 24.88874650904292,
    32.93568454075191, 43.584328996793566, 57.67585403456059, 76.32339914790623,
    100.99999999999989,
  ])
}

///|
test "SymLog original grid 55 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=0.9999999999999999,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 56 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=0.9999999999999999,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [0.0])
}

///|
test "SymLog original grid 57 complete Double base domain" {
  let locator = SymmetricalLogLocator::new(
    base=0.9999999999999999,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [])
}

///|
test "SymLog original grid 58 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=0.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  assert_true(
    try {
      ignore(locator.tick_values(-0.5, 0.5))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 59 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=0.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
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
test "SymLog original grid 60 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=0.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 10.0, 100.0])
}

///|
test "SymLog original grid 61 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=-0.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  assert_true(
    try {
      ignore(locator.tick_values(-0.5, 0.5))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 62 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=-0.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
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
test "SymLog original grid 63 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=-0.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 10.0, 100.0])
}

///|
test "SymLog original grid 64 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=-1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  assert_true(
    try {
      ignore(locator.tick_values(-0.5, 0.5))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 65 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=-1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
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
test "SymLog original grid 66 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=-1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 10.0, 100.0])
}

///|
test "SymLog original grid 67 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=0.0 / 0.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [])
}

///|
test "SymLog original grid 68 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=0.0 / 0.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [])
}

///|
test "SymLog original grid 69 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=0.0 / 0.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [])
}

///|
test "SymLog original grid 70 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0 / 0.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 71 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0 / 0.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, 0.0, 100.0,
  ])
}

///|
test "SymLog original grid 72 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0 / 0.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [0.0, 2.0, 100.0])
}

///|
test "SymLog original grid 73 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=-1.0 / 0.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  assert_true(
    try {
      ignore(locator.tick_values(-0.5, 0.5))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 74 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=-1.0 / 0.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
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
test "SymLog original grid 75 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=-1.0 / 0.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 10.0, 100.0])
}

///|
test "SymLog original grid 76 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=5.0e-324,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [
    -0.01, -1.0e-48, -1.0e-94, -1.0e-140, -1.0e-186, -1.0e-232, -1.0e-278, -0.0,
    0.0, 0.0, 1.0e-278, 1.0e-232, 1.0e-186, 1.0e-140, 1.0e-94, 1.0e-48, 0.01,
  ])
}

///|
test "SymLog original grid 77 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=5.0e-324,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -0.01, -1.0e-48, -1.0e-94, -1.0e-140, -1.0e-186, -1.0e-232, -1.0e-278, -0.0,
    0.0, 0.0, 1.0e-278, 1.0e-232, 1.0e-186, 1.0e-140, 1.0e-94, 1.0e-48, 0.01,
  ])
}

///|
test "SymLog original grid 78 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=5.0e-324,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 10.0, 100.0])
}

///|
test "SymLog original grid 79 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0e+308,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 80 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0e+308,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, 0.0, 100.0,
  ])
}

///|
test "SymLog original grid 81 complete threshold domain" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0e+308,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [0.0, 2.0, 100.0])
}

///|
test "SymLog original grid 82 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("-10")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 83 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("-10")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 84 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("-10")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original grid 85 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("-10")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 10.0, 100.0])
}

///|
test "SymLog original grid 86 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("-1")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 87 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("-1")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 88 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("-1")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original grid 89 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("-1")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 10.0, 100.0])
}

///|
test "SymLog original grid 90 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("0")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 91 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("0")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 92 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("0")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original grid 93 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("0")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 10.0, 100.0])
}

///|
test "SymLog original grid 94 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("1")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 95 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("1")))
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
test "SymLog original grid 96 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("1")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [-1.0, 0.0, 1.0])
}

///|
test "SymLog original grid 97 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("1")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0])
}

///|
test "SymLog original grid 98 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("2")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 99 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("2")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 100 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("2")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [-1.0, 0.0, 1.0])
}

///|
test "SymLog original grid 101 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("2")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0])
}

///|
test "SymLog original grid 102 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("3")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 103 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("3")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 104 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("3")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [-1.0, 0.0, 1.0])
}

///|
test "SymLog original grid 105 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("3")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 10.0, 100.0])
}

///|
test "SymLog original grid 106 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 107 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 108 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original grid 109 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 10.0, 100.0])
}

///|
test "SymLog original grid 110 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(0.5))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 111 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(0.5))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 112 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(0.5))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original grid 113 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(0.5))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 10.0, 100.0])
}

///|
test "SymLog original grid 114 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(1.0))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 115 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(1.0))
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
test "SymLog original grid 116 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(1.0))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [-1.0, 0.0, 1.0])
}

///|
test "SymLog original grid 117 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(1.0))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0])
}

///|
test "SymLog original grid 118 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(1.5))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 119 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(1.5))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 120 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(1.5))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [-1.0, 0.0, 1.0])
}

///|
test "SymLog original grid 121 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(1.5))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0])
}

///|
test "SymLog original grid 122 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(2.5))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 123 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(2.5))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 124 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(2.5))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [-1.0, 0.0, 1.0])
}

///|
test "SymLog original grid 125 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(2.5))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 100.0])
}

///|
test "SymLog original grid 126 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(0.0 / 0.0))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 127 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(0.0 / 0.0))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 128 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(0.0 / 0.0))
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
test "SymLog original grid 129 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 130 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(1.0 / 0.0))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 131 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(1.0 / 0.0))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 132 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(1.0 / 0.0))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original grid 133 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(1.0 / 0.0))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 10.0, 100.0])
}

///|
test "SymLog original grid 134 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(-1.0 / 0.0))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 135 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(-1.0 / 0.0))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 136 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(-1.0 / 0.0))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original grid 137 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Number(-1.0 / 0.0))
  verify_symlog_grid_bits(locator.tick_values(2.0, 100.0), [1.0, 10.0, 100.0])
}

///|
test "SymLog original grid 138 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(
    LogNumTicks::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 139 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(
    LogNumTicks::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 140 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(
    LogNumTicks::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
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
test "SymLog original grid 141 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(
    LogNumTicks::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 142 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(
    LogNumTicks::Integer(
      @bigint.BigInt::from_string(
        "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 143 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(
    LogNumTicks::Integer(
      @bigint.BigInt::from_string(
        "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 144 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(
    LogNumTicks::Integer(
      @bigint.BigInt::from_string(
        "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
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
test "SymLog original grid 145 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(
    LogNumTicks::Integer(
      @bigint.BigInt::from_string(
        "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 146 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Text("auto"))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 147 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Text("auto"))
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
test "SymLog original grid 148 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Text("auto"))
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
test "SymLog original grid 149 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Text("auto"))
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 150 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Text(""))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 151 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Text(""))
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
test "SymLog original grid 152 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Text(""))
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
test "SymLog original grid 153 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Text(""))
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 154 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Text("3"))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 155 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Text("3"))
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
test "SymLog original grid 156 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Text("3"))
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
test "SymLog original grid 157 Python integer float and text budget timing" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Text("3"))
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 158 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 159 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
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
test "SymLog original grid 160 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
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
test "SymLog original grid 161 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([1.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 162 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([1.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original grid 163 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([1.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 164 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([2.0, 1.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 165 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([2.0, 1.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -200.0, -100.0, -20.0, -10.0, -2.0, -1.0, 0.0, 2.0, 1.0, 20.0, 10.0, 200.0, 100.0,
  ])
}

///|
test "SymLog original grid 166 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([2.0, 1.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 167 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([2.0, 2.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 168 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([2.0, 2.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -200.0, -200.0, -20.0, -20.0, -2.0, -2.0, 0.0, 2.0, 2.0, 20.0, 20.0, 200.0, 200.0,
  ])
}

///|
test "SymLog original grid 169 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([2.0, 2.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 170 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([0.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 171 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([0.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -0.0, -0.0, -0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "SymLog original grid 172 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([0.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 173 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([-1.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 174 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([-1.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    100.0, 10.0, 1.0, 0.0, -1.0, -10.0, -100.0,
  ])
}

///|
test "SymLog original grid 175 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([-1.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 176 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([0.0 / 0.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 177 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([0.0 / 0.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0,
    0.0 / 0.0,
    0.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original grid 178 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([0.0 / 0.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 179 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([1.0 / 0.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 180 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([1.0 / 0.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -1.0 / 0.0,
    -1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    1.0 / 0.0,
    1.0 / 0.0,
    1.0 / 0.0,
  ])
}

///|
test "SymLog original grid 181 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Values(TickValues::from_array([1.0 / 0.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 182 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      SymLogSubs::Values(
        TickValues::from_int64_array([9007199254740993L, 9007199254740994L]),
      ),
    ),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 183 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      SymLogSubs::Values(
        TickValues::from_int64_array([9007199254740993L, 9007199254740994L]),
      ),
    ),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -9.007199254740992e+17, -9.007199254740995e+17, -9.007199254740992e+16, -9.007199254740994e+16,
    -9007199254740992.0, -9007199254740994.0, 0.0, 9007199254740992.0, 9007199254740994.0,
    9.007199254740992e+16, 9.007199254740994e+16, 9.007199254740992e+17, 9.007199254740995e+17,
  ])
}

///|
test "SymLog original grid 184 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      SymLogSubs::Values(
        TickValues::from_int64_array([9007199254740993L, 9007199254740994L]),
      ),
    ),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 185 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      SymLogSubs::Values(
        TickValues::from_int64_array([
          -9223372036854775808L, 9223372036854775807L,
        ]),
      ),
    ),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 186 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      SymLogSubs::Values(
        TickValues::from_int64_array([
          -9223372036854775808L, 9223372036854775807L,
        ]),
      ),
    ),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    9.223372036854776e+20, -9.223372036854776e+20, 9.223372036854776e+19, -9.223372036854776e+19,
    9.223372036854776e+18, -9.223372036854776e+18, 0.0, -9.223372036854776e+18, 9.223372036854776e+18,
    -9.223372036854776e+19, 9.223372036854776e+19, -9.223372036854776e+20, 9.223372036854776e+20,
  ])
}

///|
test "SymLog original grid 187 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      SymLogSubs::Values(
        TickValues::from_int64_array([
          -9223372036854775808L, 9223372036854775807L,
        ]),
      ),
    ),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(0.0, 0.0), [])
}

///|
test "SymLog original grid 188 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Text("auto")),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 189 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Text("auto")),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
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
test "SymLog original grid 190 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Text("auto")),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
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
test "SymLog original grid 191 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Number(2.0)),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
}

///|
test "SymLog original grid 192 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Number(2.0)),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
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
test "SymLog original grid 193 late subs shape dtype and flatten order" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(SymLogSubs::Number(2.0)),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
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
test "SymLog original grid 194 extreme and unordered bounds" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(0.0 / 0.0, 10.0), [1.0, 10.0])
}

///|
test "SymLog original grid 195 extreme and unordered bounds" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(1.0, 0.0 / 0.0), [])
}

///|
test "SymLog original grid 196 extreme and unordered bounds" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  assert_true(
    try {
      ignore(locator.tick_values(1.0 / 0.0, 10.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 197 extreme and unordered bounds" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 198 extreme and unordered bounds" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  assert_true(
    try {
      ignore(locator.tick_values(-1.0 / 0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 199 extreme and unordered bounds" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  assert_true(
    try {
      ignore(locator.tick_values(-1.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original grid 200 extreme and unordered bounds" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(1.0e+308, 1.0e+308), [])
}

///|
test "SymLog original grid 201 extreme and unordered bounds" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(5.0e-324, 1.0e-300), [
    0.0, 5.0e-324, 1.0e-300,
  ])
}

///|
test "SymLog original grid 202 extreme and unordered bounds" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+308, 1.0e+308), [
    -1.0e+264, -1.0e+220, -1.0e+176, -1.0e+132, -1.0e+88, -1.0e+44, -1.0, 0.0, 1.0,
    1.0e+44, 1.0e+88, 1.0e+132, 1.0e+176, 1.0e+220, 1.0e+264,
  ])
}

///|
test "SymLog original grid 203 underflow zero decades expand only once" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=5.0e-324,
    subs=Some(SymLogSubs::Values(TickValues::from_array([1.0, 2.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [
    -0.01, -0.02, -1.0e-48, -2.0e-48, -1.0e-94, -2.0e-94, -1.0e-140, -2.0e-140, -1.0e-186,
    -2.0e-186, -1.0e-232, -2.0e-232, -1.0e-278, -2.0e-278, -0.0, 0.0, 0.0, 1.0e-278,
    2.0e-278, 1.0e-232, 2.0e-232, 1.0e-186, 2.0e-186, 1.0e-140, 2.0e-140, 1.0e-94,
    2.0e-94, 1.0e-48, 2.0e-48, 0.01, 0.02,
  ])
}

///|
test "SymLog original grid 204 underflow zero decades expand only once" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=5.0e-324,
    subs=Some(
      SymLogSubs::Values(TickValues::from_array([1.0 / 0.0, 0.0 / 0.0])),
    ),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [
    -1.0 / 0.0,
    0.0 / 0.0,
    -1.0 / 0.0,
    0.0 / 0.0,
    -1.0 / 0.0,
    0.0 / 0.0,
    -1.0 / 0.0,
    0.0 / 0.0,
    -1.0 / 0.0,
    0.0 / 0.0,
    -1.0 / 0.0,
    0.0 / 0.0,
    -1.0 / 0.0,
    0.0 / 0.0,
    -0.0,
    0.0,
    0.0,
    1.0 / 0.0,
    0.0 / 0.0,
    1.0 / 0.0,
    0.0 / 0.0,
    1.0 / 0.0,
    0.0 / 0.0,
    1.0 / 0.0,
    0.0 / 0.0,
    1.0 / 0.0,
    0.0 / 0.0,
    1.0 / 0.0,
    0.0 / 0.0,
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "SymLog original grid 205 underflow zero decades expand only once" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=5.0e-324,
    subs=Some(SymLogSubs::Values(TickValues::from_array([0.0, -1.0]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [
    -0.0, 0.01, -0.0, 1.0e-48, -0.0, 1.0e-94, -0.0, 1.0e-140, -0.0, 1.0e-186, -0.0,
    1.0e-232, -0.0, 1.0e-278, -0.0, 0.0, 0.0, 0.0, -1.0e-278, 0.0, -1.0e-232, 0.0,
    -1.0e-186, 0.0, -1.0e-140, 0.0, -1.0e-94, 0.0, -1.0e-48, 0.0, -0.01,
  ])
}

///|
test "SymLog original grid 206 underflow zero decades expand only once" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=5.0e-324,
    subs=Some(SymLogSubs::Values(TickValues::from_int64_array([1L, 2L]))),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-0.5, 0.5), [
    -0.01, -0.02, -1.0e-48, -2.0e-48, -1.0e-94, -2.0e-94, -1.0e-140, -2.0e-140, -1.0e-186,
    -2.0e-186, -1.0e-232, -2.0e-232, -1.0e-278, -2.0e-278, -0.0, 0.0, 0.0, 1.0e-278,
    2.0e-278, 1.0e-232, 2.0e-232, 1.0e-186, 2.0e-186, 1.0e-140, 2.0e-140, 1.0e-94,
    2.0e-94, 1.0e-48, 2.0e-48, 0.01, 0.02,
  ])
}

///|
test "SymLog original grid 207 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("2")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, -2.0), [-2.0])
}

///|
test "SymLog original grid 208 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("2")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, 1.0e+20), [
    -1.0, 0.0, 1.0,
  ])
}

///|
test "SymLog original grid 209 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("2")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 1.0e+20), [2.0])
}

///|
test "SymLog original grid 210 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("4")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, -2.0), [
    -35184372088832.0, -8388608.0, -2.0,
  ])
}

///|
test "SymLog original grid 211 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("4")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, 1.0e+20), [
    -35184372088832.0, -1.0, 0.0, 1.0, 35184372088832.0,
  ])
}

///|
test "SymLog original grid 212 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("4")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 1.0e+20), [
    2.0, 8388608.0, 35184372088832.0,
  ])
}

///|
test "SymLog original grid 213 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, -2.0), [
    -3.6893488147419103e+19, -2.305843009213694e+18, -1.4411518807585587e+17, -9007199254740992.0,
    -562949953421312.0, -35184372088832.0, -2199023255552.0, -137438953472.0, -8589934592.0,
    -536870912.0, -33554432.0, -2097152.0, -131072.0, -8192.0, -512.0, -32.0, -2.0,
  ])
}

///|
test "SymLog original grid 214 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, 1.0e+20), [
    -9.223372036854776e+18, -1.8014398509481984e+16, -35184372088832.0, -68719476736.0,
    -134217728.0, -262144.0, -512.0, -1.0, 0.0, 1.0, 512.0, 262144.0, 134217728.0,
    68719476736.0, 35184372088832.0, 1.8014398509481984e+16, 9.223372036854776e+18,
  ])
}

///|
test "SymLog original grid 215 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 1.0e+20), [
    2.0, 32.0, 512.0, 8192.0, 131072.0, 2097152.0, 33554432.0, 536870912.0, 8589934592.0,
    137438953472.0, 2199023255552.0, 35184372088832.0, 562949953421312.0, 9007199254740992.0,
    1.4411518807585587e+17, 2.305843009213694e+18, 3.6893488147419103e+19,
  ])
}

///|
test "SymLog original grid 216 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("100")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, -2.0), [
    -7.378697629483821e+19, -3.6893488147419103e+19, -1.8446744073709552e+19, -9.223372036854776e+18,
    -4.611686018427388e+18, -2.305843009213694e+18, -1.152921504606847e+18, -5.764607523034235e+17,
    -2.8823037615171174e+17, -1.4411518807585587e+17, -7.205759403792794e+16, -3.602879701896397e+16,
    -1.8014398509481984e+16, -9007199254740992.0, -4503599627370496.0, -2251799813685248.0,
    -1125899906842624.0, -562949953421312.0, -281474976710656.0, -140737488355328.0,
    -70368744177664.0, -35184372088832.0, -17592186044416.0, -8796093022208.0, -4398046511104.0,
    -2199023255552.0, -1099511627776.0, -549755813888.0, -274877906944.0, -137438953472.0,
    -68719476736.0, -34359738368.0, -17179869184.0, -8589934592.0, -4294967296.0,
    -2147483648.0, -1073741824.0, -536870912.0, -268435456.0, -134217728.0, -67108864.0,
    -33554432.0, -16777216.0, -8388608.0, -4194304.0, -2097152.0, -1048576.0, -524288.0,
    -262144.0, -131072.0, -65536.0, -32768.0, -16384.0, -8192.0, -4096.0, -2048.0,
    -1024.0, -512.0, -256.0, -128.0, -64.0, -32.0, -16.0, -8.0, -4.0, -2.0,
  ])
}

///|
test "SymLog original grid 217 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("100")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, 1.0e+20), [
    -7.378697629483821e+19, -3.6893488147419103e+19, -1.8446744073709552e+19, -9.223372036854776e+18,
    -4.611686018427388e+18, -2.305843009213694e+18, -1.152921504606847e+18, -5.764607523034235e+17,
    -2.8823037615171174e+17, -1.4411518807585587e+17, -7.205759403792794e+16, -3.602879701896397e+16,
    -1.8014398509481984e+16, -9007199254740992.0, -4503599627370496.0, -2251799813685248.0,
    -1125899906842624.0, -562949953421312.0, -281474976710656.0, -140737488355328.0,
    -70368744177664.0, -35184372088832.0, -17592186044416.0, -8796093022208.0, -4398046511104.0,
    -2199023255552.0, -1099511627776.0, -549755813888.0, -274877906944.0, -137438953472.0,
    -68719476736.0, -34359738368.0, -17179869184.0, -8589934592.0, -4294967296.0,
    -2147483648.0, -1073741824.0, -536870912.0, -268435456.0, -134217728.0, -67108864.0,
    -33554432.0, -16777216.0, -8388608.0, -4194304.0, -2097152.0, -1048576.0, -524288.0,
    -262144.0, -131072.0, -65536.0, -32768.0, -16384.0, -8192.0, -4096.0, -2048.0,
    -1024.0, -512.0, -256.0, -128.0, -64.0, -32.0, -16.0, -8.0, -4.0, -2.0, -1.0,
    0.0, 1.0, 2.0, 4.0, 8.0, 16.0, 32.0, 64.0, 128.0, 256.0, 512.0, 1024.0, 2048.0,
    4096.0, 8192.0, 16384.0, 32768.0, 65536.0, 131072.0, 262144.0, 524288.0, 1048576.0,
    2097152.0, 4194304.0, 8388608.0, 16777216.0, 33554432.0, 67108864.0, 134217728.0,
    268435456.0, 536870912.0, 1073741824.0, 2147483648.0, 4294967296.0, 8589934592.0,
    17179869184.0, 34359738368.0, 68719476736.0, 137438953472.0, 274877906944.0,
    549755813888.0, 1099511627776.0, 2199023255552.0, 4398046511104.0, 8796093022208.0,
    17592186044416.0, 35184372088832.0, 70368744177664.0, 140737488355328.0, 281474976710656.0,
    562949953421312.0, 1125899906842624.0, 2251799813685248.0, 4503599627370496.0,
    9007199254740992.0, 1.8014398509481984e+16, 3.602879701896397e+16, 7.205759403792794e+16,
    1.4411518807585587e+17, 2.8823037615171174e+17, 5.764607523034235e+17, 1.152921504606847e+18,
    2.305843009213694e+18, 4.611686018427388e+18, 9.223372036854776e+18, 1.8446744073709552e+19,
    3.6893488147419103e+19, 7.378697629483821e+19,
  ])
}

///|
test "SymLog original grid 218 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=2.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("100")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 1.0e+20), [
    2.0, 4.0, 8.0, 16.0, 32.0, 64.0, 128.0, 256.0, 512.0, 1024.0, 2048.0, 4096.0,
    8192.0, 16384.0, 32768.0, 65536.0, 131072.0, 262144.0, 524288.0, 1048576.0, 2097152.0,
    4194304.0, 8388608.0, 16777216.0, 33554432.0, 67108864.0, 134217728.0, 268435456.0,
    536870912.0, 1073741824.0, 2147483648.0, 4294967296.0, 8589934592.0, 17179869184.0,
    34359738368.0, 68719476736.0, 137438953472.0, 274877906944.0, 549755813888.0,
    1099511627776.0, 2199023255552.0, 4398046511104.0, 8796093022208.0, 17592186044416.0,
    35184372088832.0, 70368744177664.0, 140737488355328.0, 281474976710656.0, 562949953421312.0,
    1125899906842624.0, 2251799813685248.0, 4503599627370496.0, 9007199254740992.0,
    1.8014398509481984e+16, 3.602879701896397e+16, 7.205759403792794e+16, 1.4411518807585587e+17,
    2.8823037615171174e+17, 5.764607523034235e+17, 1.152921504606847e+18, 2.305843009213694e+18,
    4.611686018427388e+18, 9.223372036854776e+18, 1.8446744073709552e+19, 3.6893488147419103e+19,
    7.378697629483821e+19,
  ])
}

///|
test "SymLog original grid 219 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("2")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, -2.0), [-1.0])
}

///|
test "SymLog original grid 220 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("2")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, 1.0e+20), [
    -1.0, 0.0, 1.0,
  ])
}

///|
test "SymLog original grid 221 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("2")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 1.0e+20), [1.0])
}

///|
test "SymLog original grid 222 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("4")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, -2.0), [
    -22876792454961.0, -4782969.0, -1.0,
  ])
}

///|
test "SymLog original grid 223 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("4")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, 1.0e+20), [
    -22876792454961.0, -1.0, 0.0, 1.0, 22876792454961.0,
  ])
}

///|
test "SymLog original grid 224 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("4")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 1.0e+20), [
    1.0, 4782969.0, 22876792454961.0,
  ])
}

///|
test "SymLog original grid 225 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, -2.0), [
    -4.052555153018976e+18, -1.5009463529699914e+17, -5559060566555523.0, -205891132094649.0,
    -7625597484987.0, -282429536481.0, -10460353203.0, -387420489.0, -14348907.0,
    -531441.0, -19683.0, -729.0, -27.0, -1.0,
  ])
}

///|
test "SymLog original grid 226 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, 1.0e+20), [
    -1.5009463529699914e+17, -205891132094649.0, -282429536481.0, -387420489.0, -531441.0,
    -729.0, -1.0, 0.0, 1.0, 729.0, 531441.0, 387420489.0, 282429536481.0, 205891132094649.0,
    1.5009463529699914e+17,
  ])
}

///|
test "SymLog original grid 227 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 1.0e+20), [
    1.0, 27.0, 729.0, 19683.0, 531441.0, 14348907.0, 387420489.0, 10460353203.0,
    282429536481.0, 7625597484987.0, 205891132094649.0, 5559060566555523.0, 1.5009463529699914e+17,
    4.052555153018976e+18,
  ])
}

///|
test "SymLog original grid 228 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("100")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, -2.0), [
    -3.647299637717079e+19, -1.2157665459056929e+19, -4.052555153018976e+18, -1.350851717672992e+18,
    -4.502839058909974e+17, -1.5009463529699914e+17, -5.0031545098999704e+16, -1.6677181699666568e+16,
    -5559060566555523.0, -1853020188851841.0, -617673396283947.0, -205891132094649.0,
    -68630377364883.0, -22876792454961.0, -7625597484987.0, -2541865828329.0, -847288609443.0,
    -282429536481.0, -94143178827.0, -31381059609.0, -10460353203.0, -3486784401.0,
    -1162261467.0, -387420489.0, -129140163.0, -43046721.0, -14348907.0, -4782969.0,
    -1594323.0, -531441.0, -177147.0, -59049.0, -19683.0, -6561.0, -2187.0, -729.0,
    -243.0, -81.0, -27.0, -9.0, -3.0, -1.0,
  ])
}

///|
test "SymLog original grid 229 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("100")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, 1.0e+20), [
    -3.647299637717079e+19, -1.2157665459056929e+19, -4.052555153018976e+18, -1.350851717672992e+18,
    -4.502839058909974e+17, -1.5009463529699914e+17, -5.0031545098999704e+16, -1.6677181699666568e+16,
    -5559060566555523.0, -1853020188851841.0, -617673396283947.0, -205891132094649.0,
    -68630377364883.0, -22876792454961.0, -7625597484987.0, -2541865828329.0, -847288609443.0,
    -282429536481.0, -94143178827.0, -31381059609.0, -10460353203.0, -3486784401.0,
    -1162261467.0, -387420489.0, -129140163.0, -43046721.0, -14348907.0, -4782969.0,
    -1594323.0, -531441.0, -177147.0, -59049.0, -19683.0, -6561.0, -2187.0, -729.0,
    -243.0, -81.0, -27.0, -9.0, -3.0, -1.0, 0.0, 1.0, 3.0, 9.0, 27.0, 81.0, 243.0,
    729.0, 2187.0, 6561.0, 19683.0, 59049.0, 177147.0, 531441.0, 1594323.0, 4782969.0,
    14348907.0, 43046721.0, 129140163.0, 387420489.0, 1162261467.0, 3486784401.0,
    10460353203.0, 31381059609.0, 94143178827.0, 282429536481.0, 847288609443.0,
    2541865828329.0, 7625597484987.0, 22876792454961.0, 68630377364883.0, 205891132094649.0,
    617673396283947.0, 1853020188851841.0, 5559060566555523.0, 1.6677181699666568e+16,
    5.0031545098999704e+16, 1.5009463529699914e+17, 4.502839058909974e+17, 1.350851717672992e+18,
    4.052555153018976e+18, 1.2157665459056929e+19, 3.647299637717079e+19,
  ])
}

///|
test "SymLog original grid 230 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=3.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("100")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 1.0e+20), [
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
test "SymLog original grid 231 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("2")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, -2.0), [-1.0])
}

///|
test "SymLog original grid 232 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("2")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, 1.0e+20), [
    -1.0, 0.0, 1.0,
  ])
}

///|
test "SymLog original grid 233 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("2")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 1.0e+20), [1.0])
}

///|
test "SymLog original grid 234 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("4")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, -2.0), [
    -1.0e+18, -1000000000000.0, -1000000.0, -1.0,
  ])
}

///|
test "SymLog original grid 235 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("4")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, 1.0e+20), [
    -10000000000000.0, -1.0, 0.0, 1.0, 10000000000000.0,
  ])
}

///|
test "SymLog original grid 236 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("4")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 1.0e+20), [
    1.0, 1000000.0, 1000000000000.0, 1.0e+18,
  ])
}

///|
test "SymLog original grid 237 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, -2.0), [
    -1.0e+19, -1.0e+18, -1.0e+17, -1.0e+16, -1000000000000000.0, -100000000000000.0,
    -10000000000000.0, -1000000000000.0, -100000000000.0, -10000000000.0, -1000000000.0,
    -100000000.0, -10000000.0, -1000000.0, -100000.0, -10000.0, -1000.0, -100.0,
    -10.0, -1.0,
  ])
}

///|
test "SymLog original grid 238 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, 1.0e+20), [
    -1.0e+18, -1.0e+16, -100000000000000.0, -1000000000000.0, -10000000000.0, -100000000.0,
    -1000000.0, -10000.0, -100.0, -1.0, 0.0, 1.0, 100.0, 10000.0, 1000000.0, 100000000.0,
    10000000000.0, 1000000000000.0, 100000000000000.0, 1.0e+16, 1.0e+18,
  ])
}

///|
test "SymLog original grid 239 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 1.0e+20), [
    1.0, 10.0, 100.0, 1000.0, 10000.0, 100000.0, 1000000.0, 10000000.0, 100000000.0,
    1000000000.0, 10000000000.0, 100000000000.0, 1000000000000.0, 10000000000000.0,
    100000000000000.0, 1000000000000000.0, 1.0e+16, 1.0e+17, 1.0e+18, 1.0e+19,
  ])
}

///|
test "SymLog original grid 240 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("100")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, -2.0), [
    -1.0e+19, -1.0e+18, -1.0e+17, -1.0e+16, -1000000000000000.0, -100000000000000.0,
    -10000000000000.0, -1000000000000.0, -100000000000.0, -10000000000.0, -1000000000.0,
    -100000000.0, -10000000.0, -1000000.0, -100000.0, -10000.0, -1000.0, -100.0,
    -10.0, -1.0,
  ])
}

///|
test "SymLog original grid 241 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("100")))
  verify_symlog_grid_bits(locator.tick_values(-1.0e+20, 1.0e+20), [
    -1.0e+19, -1.0e+18, -1.0e+17, -1.0e+16, -1000000000000000.0, -100000000000000.0,
    -10000000000000.0, -1000000000000.0, -100000000000.0, -10000000000.0, -1000000000.0,
    -100000000.0, -10000000.0, -1000000.0, -100000.0, -10000.0, -1000.0, -100.0,
    -10.0, -1.0, 0.0, 1.0, 10.0, 100.0, 1000.0, 10000.0, 100000.0, 1000000.0, 10000000.0,
    100000000.0, 1000000000.0, 10000000000.0, 100000000000.0, 1000000000000.0, 10000000000000.0,
    100000000000000.0, 1000000000000000.0, 1.0e+16, 1.0e+17, 1.0e+18, 1.0e+19,
  ])
}

///|
test "SymLog original grid 242 full exponent phase and reverse" {
  let locator = SymmetricalLogLocator::new(base=10.0, linthresh=1.0, subs=None)
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("100")))
  verify_symlog_grid_bits(locator.tick_values(2.0, 1.0e+20), [
    1.0, 10.0, 100.0, 1000.0, 10000.0, 100000.0, 1000000.0, 10000000.0, 100000000.0,
    1000000000.0, 10000000000.0, 100000000000.0, 1000000000000.0, 10000000000000.0,
    100000000000000.0, 1000000000000000.0, 1.0e+16, 1.0e+17, 1.0e+18, 1.0e+19,
  ])
}

///|
test "SymLog original grid 243 float negative stride input alias" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      SymLogSubs::Values(
        TickValues::from_array([1.0, 0.0, 2.0, 0.0, 3.0]).view(4, -2, 3),
      ),
    ),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -300.0, -200.0, -100.0, -30.0, -20.0, -10.0, -3.0, -2.0, -1.0, 0.0, 3.0, 2.0,
    1.0, 30.0, 20.0, 10.0, 300.0, 200.0, 100.0,
  ])
}

///|
test "SymLog original grid 244 integer zero stride input alias" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      SymLogSubs::Values(TickValues::from_int64_array([2L]).view(0, 0, 5)),
    ),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  verify_symlog_grid_bits(locator.tick_values(-100.0, 100.0), [
    -200.0, -200.0, -200.0, -200.0, -200.0, -20.0, -20.0, -20.0, -20.0, -20.0, -2.0,
    -2.0, -2.0, -2.0, -2.0, 0.0, 2.0, 2.0, 2.0, 2.0, 2.0, 20.0, 20.0, 20.0, 20.0,
    20.0, 200.0, 200.0, 200.0, 200.0, 200.0,
  ])
}

///|
test "SymLog original grid 245 full negative source cap" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      SymLogSubs::Values(
        TickValues::from_array(
          Array::makei(125000, index => (index + 1).to_double()),
        ),
      ),
    ),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  let ticks = locator.tick_values(-3.0, -2.0)
  assert_eq(ticks.length(), 100000)
  verify_symlog_grid_bits(
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
      -1.0, -2.0, -3.0, -4.0, -5.0, -6.0, -7.0, -8.0, -49999.0, -50000.0, -50001.0,
      -50002.0, -99997.0, -99998.0, -99999.0, -100000.0,
    ],
  )
}

///|
test "SymLog original grid 246 full crossing source cap" {
  let locator = SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      SymLogSubs::Values(
        TickValues::from_array(
          Array::makei(100000, index => (index + 1).to_double()),
        ),
      ),
    ),
  )
  locator.set_numticks(LogNumTicks::Integer(@bigint.BigInt::from_string("15")))
  let ticks = locator.tick_values(-3.0, 3.0)
  assert_eq(ticks.length(), 100000)
  verify_symlog_grid_bits(
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
      -1.0, -2.0, -3.0, -4.0, -5.0, -6.0, -7.0, -8.0, -49999.0, -50000.0, -50001.0,
      -50002.0, -99997.0, -99998.0, -99999.0, -100000.0,
    ],
  )
}

///|
test "SymLog original grid 248 genuine arange byte size failure" {
  let locator = SymmetricalLogLocator::new(
    base=1.0000000000000002,
    linthresh=1.0,
    subs=None,
  )
  locator.set_numticks(LogNumTicks::Number(1.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 1.0e+308))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}
