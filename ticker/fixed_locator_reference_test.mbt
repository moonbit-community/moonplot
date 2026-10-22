// Generated from fixed original FixedLocator, Locator and _api.check_shape bodies.

///|
fn verify_fixed_reference_values(
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
fn verify_fixed_reference_nbins(
  actual : Double?,
  expected : Double?,
) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(actual), Some(expected)) =>
      verify_fixed_reference_values([actual], [expected])
    _ => fail("FixedLocator nbins differs")
  }
}

///|
test "FixedLocator original 0 constructor" {
  let locator = @ticker.FixedLocator::new([])
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 1 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params()
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 2 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 3 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 4 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 5 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-5.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 6 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 7 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 8 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 9 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 10 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 11 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 12 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 13 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(5.0e-324))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 14 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 15 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.1))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 16 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 17 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 18 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 19 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 20 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 21 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 22 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 23 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 24 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 25 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 26 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 27 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 28 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 29 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 30 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 31 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 32 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 33 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 34 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 35 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  verify_fixed_reference_values(locator.values().to_array(), [])
}

///|
test "FixedLocator original 36 constructor" {
  let locator = @ticker.FixedLocator::new([], nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 37 set_params" {
  let locator = @ticker.FixedLocator::new([])
  locator.set_params(nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 38 constructor" {
  let locator = @ticker.FixedLocator::new([0.0])
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 39 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params()
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 40 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 41 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 42 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 43 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-5.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 44 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 45 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 46 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 47 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 48 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 49 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 50 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 51 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(5.0e-324))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 52 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 53 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 54 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 55 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.5))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 56 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 57 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 58 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 59 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 60 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 61 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 62 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 63 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 64 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 65 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 66 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 67 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 68 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 69 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 70 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 71 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 72 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 73 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 74 constructor" {
  let locator = @ticker.FixedLocator::new([0.0], nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 75 set_params" {
  let locator = @ticker.FixedLocator::new([0.0])
  locator.set_params(nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 76 constructor" {
  let locator = @ticker.FixedLocator::new([2.0])
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 77 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params()
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 78 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 79 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 80 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 81 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-5.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 82 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 83 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 84 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 85 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 86 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 87 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 88 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 89 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(5.0e-324))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 90 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 91 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 92 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 93 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.5))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 94 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 95 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 96 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 97 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 98 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 99 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 100 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 101 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 102 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 103 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 104 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 105 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 106 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 107 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 108 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 109 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 110 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 111 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [2.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [2.0])
}

///|
test "FixedLocator original 112 constructor" {
  let locator = @ticker.FixedLocator::new([2.0], nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 113 set_params" {
  let locator = @ticker.FixedLocator::new([2.0])
  locator.set_params(nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 114 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0])
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 115 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params()
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 116 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 117 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 118 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 119 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-5.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 120 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 121 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 122 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 123 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 124 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 125 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 126 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 127 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(5.0e-324))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 128 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 129 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 130 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 131 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.5))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 132 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 133 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 134 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 135 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 136 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 137 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 138 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 139 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 140 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 141 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 142 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 143 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 144 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 145 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 146 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 147 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 148 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 149 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [-0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-0.0])
}

///|
test "FixedLocator original 150 constructor" {
  let locator = @ticker.FixedLocator::new([-0.0], nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 151 set_params" {
  let locator = @ticker.FixedLocator::new([-0.0])
  locator.set_params(nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 152 constructor" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, -1.0, 0.0, 1.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
}

///|
test "FixedLocator original 153 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params()
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, -1.0, 0.0, 1.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
}

///|
test "FixedLocator original 154 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=-1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 155 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, -1.0, 0.0, 1.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
}

///|
test "FixedLocator original 156 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=-5.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 157 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-5.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, -1.0, 0.0, 1.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
}

///|
test "FixedLocator original 158 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=-0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 159 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, -1.0, 0.0, 1.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
}

///|
test "FixedLocator original 160 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=-0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 161 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 162 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 163 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 164 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=5.0e-324,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 165 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(5.0e-324))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 166 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=0.1,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 167 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 168 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 169 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.5))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 170 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=1.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 171 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 172 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=1.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 173 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 174 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=2.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 175 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 176 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=2.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, 0.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [3.0, 0.0, -3.0])
}

///|
test "FixedLocator original 177 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, 0.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [3.0, 0.0, -3.0])
}

///|
test "FixedLocator original 178 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=3.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, 0.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [3.0, 0.0, -3.0])
}

///|
test "FixedLocator original 179 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, 0.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [3.0, 0.0, -3.0])
}

///|
test "FixedLocator original 180 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=4.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, 0.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [3.0, 0.0, -3.0])
}

///|
test "FixedLocator original 181 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, 0.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [3.0, 0.0, -3.0])
}

///|
test "FixedLocator original 182 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=10.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, -1.0, 0.0, 1.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
}

///|
test "FixedLocator original 183 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, -1.0, 0.0, 1.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
}

///|
test "FixedLocator original 184 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=1.0e+308,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, -1.0, 0.0, 1.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
}

///|
test "FixedLocator original 185 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, -1.0, 0.0, 1.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
}

///|
test "FixedLocator original 186 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, -1.0, 0.0, 1.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
}

///|
test "FixedLocator original 187 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, -1.0, 0.0, 1.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    3.0, -1.0, 0.0, 1.0, -3.0,
  ])
}

///|
test "FixedLocator original 188 constructor" {
  let locator = @ticker.FixedLocator::new(
    [3.0, -1.0, 0.0, 1.0, -3.0],
    nbins=0.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 189 set_params" {
  let locator = @ticker.FixedLocator::new([3.0, -1.0, 0.0, 1.0, -3.0])
  locator.set_params(nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 190 constructor" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 1.0, 0.0, -1.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
}

///|
test "FixedLocator original 191 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params()
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 1.0, 0.0, -1.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
}

///|
test "FixedLocator original 192 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=-1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 193 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 1.0, 0.0, -1.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
}

///|
test "FixedLocator original 194 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=-5.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 195 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-5.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 1.0, 0.0, -1.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
}

///|
test "FixedLocator original 196 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=-0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 197 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 1.0, 0.0, -1.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
}

///|
test "FixedLocator original 198 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=-0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 199 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 200 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 201 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 202 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=5.0e-324,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 203 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(5.0e-324))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 204 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=0.1,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 205 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 206 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 207 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.5))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 208 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=1.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 209 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 210 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=1.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 211 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 212 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=2.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 213 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 214 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=2.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0, -4.0])
}

///|
test "FixedLocator original 215 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0, -4.0])
}

///|
test "FixedLocator original 216 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=3.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0, -4.0])
}

///|
test "FixedLocator original 217 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0, -4.0])
}

///|
test "FixedLocator original 218 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=4.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0, -4.0])
}

///|
test "FixedLocator original 219 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0, -4.0])
}

///|
test "FixedLocator original 220 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=10.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 1.0, 0.0, -1.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
}

///|
test "FixedLocator original 221 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 1.0, 0.0, -1.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
}

///|
test "FixedLocator original 222 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=1.0e+308,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 1.0, 0.0, -1.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
}

///|
test "FixedLocator original 223 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 1.0, 0.0, -1.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
}

///|
test "FixedLocator original 224 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 1.0, 0.0, -1.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
}

///|
test "FixedLocator original 225 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 1.0, 0.0, -1.0, -4.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 1.0, 0.0, -1.0, -4.0,
  ])
}

///|
test "FixedLocator original 226 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 1.0, 0.0, -1.0, -4.0],
    nbins=0.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 227 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 1.0, 0.0, -1.0, -4.0])
  locator.set_params(nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 228 constructor" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
}

///|
test "FixedLocator original 229 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params()
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
}

///|
test "FixedLocator original 230 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=-1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, -1.0])
}

///|
test "FixedLocator original 231 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
}

///|
test "FixedLocator original 232 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=-5.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, -1.0])
}

///|
test "FixedLocator original 233 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-5.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
}

///|
test "FixedLocator original 234 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=-0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, -1.0])
}

///|
test "FixedLocator original 235 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
}

///|
test "FixedLocator original 236 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=-0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, -1.0])
}

///|
test "FixedLocator original 237 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 238 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, -1.0])
}

///|
test "FixedLocator original 239 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 240 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=5.0e-324,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, -1.0])
}

///|
test "FixedLocator original 241 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(5.0e-324))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 242 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=0.1,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, -1.0])
}

///|
test "FixedLocator original 243 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 244 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, -1.0])
}

///|
test "FixedLocator original 245 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.5))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 246 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=1.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, -1.0])
}

///|
test "FixedLocator original 247 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [1.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0])
}

///|
test "FixedLocator original 248 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=1.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, -1.0])
}

///|
test "FixedLocator original 249 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, 2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, 2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, 2.0])
}

///|
test "FixedLocator original 250 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=2.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, -1.0])
}

///|
test "FixedLocator original 251 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, -1.0])
}

///|
test "FixedLocator original 252 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=2.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, -1.0])
}

///|
test "FixedLocator original 253 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, -1.0])
}

///|
test "FixedLocator original 254 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=3.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, 1.0, 2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, 1.0, 2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, 1.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, 1.0, 2.0])
}

///|
test "FixedLocator original 255 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, 1.0, 2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, 1.0, 2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, 1.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, 1.0, 2.0])
}

///|
test "FixedLocator original 256 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=4.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, 1.0, 2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, 1.0, 2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, 1.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, 1.0, 2.0])
}

///|
test "FixedLocator original 257 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, 1.0, 2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, 1.0, 2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, 1.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0, 1.0, 2.0])
}

///|
test "FixedLocator original 258 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=10.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
}

///|
test "FixedLocator original 259 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
}

///|
test "FixedLocator original 260 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=1.0e+308,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
}

///|
test "FixedLocator original 261 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
}

///|
test "FixedLocator original 262 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
}

///|
test "FixedLocator original 263 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0, -1.0, 1.0, -1.0, 2.0, -2.0,
  ])
}

///|
test "FixedLocator original 264 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0, -1.0, 1.0, -1.0, 2.0, -2.0],
    nbins=0.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 265 set_params" {
  let locator = @ticker.FixedLocator::new([1.0, -1.0, 1.0, -1.0, 2.0, -2.0])
  locator.set_params(nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 266 constructor" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
}

///|
test "FixedLocator original 267 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params()
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
}

///|
test "FixedLocator original 268 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=-1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0])
}

///|
test "FixedLocator original 269 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
}

///|
test "FixedLocator original 270 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=-5.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0])
}

///|
test "FixedLocator original 271 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-5.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
}

///|
test "FixedLocator original 272 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=-0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0])
}

///|
test "FixedLocator original 273 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
}

///|
test "FixedLocator original 274 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=-0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0])
}

///|
test "FixedLocator original 275 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 276 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0])
}

///|
test "FixedLocator original 277 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 278 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=5.0e-324,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0])
}

///|
test "FixedLocator original 279 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(5.0e-324))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 280 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=0.1,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0])
}

///|
test "FixedLocator original 281 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 282 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0])
}

///|
test "FixedLocator original 283 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.5))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 284 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=1.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0])
}

///|
test "FixedLocator original 285 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 286 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=1.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0])
}

///|
test "FixedLocator original 287 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 288 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=2.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0])
}

///|
test "FixedLocator original 289 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0])
}

///|
test "FixedLocator original 290 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=2.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0])
}

///|
test "FixedLocator original 291 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [4.0, 0.0])
}

///|
test "FixedLocator original 292 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=3.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, 0.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [3.0, 0.0, -3.0])
}

///|
test "FixedLocator original 293 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    3.0, 0.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, 0.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [3.0, 0.0, -3.0])
}

///|
test "FixedLocator original 294 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=4.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 2.0, 0.0, -2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 2.0, 0.0, -2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 2.0, 0.0, -2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 2.0, 0.0, -2.0,
  ])
}

///|
test "FixedLocator original 295 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 2.0, 0.0, -2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 2.0, 0.0, -2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 2.0, 0.0, -2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 2.0, 0.0, -2.0,
  ])
}

///|
test "FixedLocator original 296 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=10.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
}

///|
test "FixedLocator original 297 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
}

///|
test "FixedLocator original 298 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=1.0e+308,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
}

///|
test "FixedLocator original 299 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
}

///|
test "FixedLocator original 300 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
}

///|
test "FixedLocator original 301 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
}

///|
test "FixedLocator original 302 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0],
    nbins=0.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 303 set_params" {
  let locator = @ticker.FixedLocator::new([
    4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0, -3.0,
  ])
  locator.set_params(nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 304 constructor" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, 0.0, -1.0, 1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
}

///|
test "FixedLocator original 305 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params()
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, 0.0, -1.0, 1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
}

///|
test "FixedLocator original 306 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=-1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 307 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, 0.0, -1.0, 1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
}

///|
test "FixedLocator original 308 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=-5.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 309 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-5.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, 0.0, -1.0, 1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
}

///|
test "FixedLocator original 310 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=-0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 311 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, 0.0, -1.0, 1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
}

///|
test "FixedLocator original 312 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=-0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 313 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 314 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 315 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 316 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=5.0e-324,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 317 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(5.0e-324))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 318 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=0.1,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 319 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 320 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 321 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.5))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 322 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=1.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 323 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0])
}

///|
test "FixedLocator original 324 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=1.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 325 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, 1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, 1.0])
}

///|
test "FixedLocator original 326 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=2.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 327 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 328 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=2.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 329 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 330 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=3.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 331 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0 / 0.0, -1.0])
}

///|
test "FixedLocator original 332 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=4.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, 0.0, -1.0, 1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
}

///|
test "FixedLocator original 333 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, 0.0, -1.0, 1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
}

///|
test "FixedLocator original 334 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=10.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, 0.0, -1.0, 1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
}

///|
test "FixedLocator original 335 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, 0.0, -1.0, 1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
}

///|
test "FixedLocator original 336 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=1.0e+308,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, 0.0, -1.0, 1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
}

///|
test "FixedLocator original 337 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, 0.0, -1.0, 1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
}

///|
test "FixedLocator original 338 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, 0.0, -1.0, 1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
}

///|
test "FixedLocator original 339 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0 / 0.0, 0.0, -1.0, 1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    0.0 / 0.0,
    0.0,
    -1.0,
    1.0,
  ])
}

///|
test "FixedLocator original 340 constructor" {
  let locator = @ticker.FixedLocator::new(
    [0.0 / 0.0, 0.0, -1.0, 1.0],
    nbins=0.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 341 set_params" {
  let locator = @ticker.FixedLocator::new([0.0 / 0.0, 0.0, -1.0, 1.0])
  locator.set_params(nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 342 constructor" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
}

///|
test "FixedLocator original 343 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params()
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
}

///|
test "FixedLocator original 344 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=-1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, -1.0])
}

///|
test "FixedLocator original 345 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
}

///|
test "FixedLocator original 346 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=-5.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, -1.0])
}

///|
test "FixedLocator original 347 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-5.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
}

///|
test "FixedLocator original 348 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=-0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, -1.0])
}

///|
test "FixedLocator original 349 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
}

///|
test "FixedLocator original 350 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=-0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, -1.0])
}

///|
test "FixedLocator original 351 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 352 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, -1.0])
}

///|
test "FixedLocator original 353 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 354 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=5.0e-324,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, -1.0])
}

///|
test "FixedLocator original 355 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(5.0e-324))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 356 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=0.1,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, -1.0])
}

///|
test "FixedLocator original 357 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 358 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, -1.0])
}

///|
test "FixedLocator original 359 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.5))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 360 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=1.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, -1.0])
}

///|
test "FixedLocator original 361 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 362 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=1.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, -1.0])
}

///|
test "FixedLocator original 363 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 3.0])
}

///|
test "FixedLocator original 364 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=2.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, -1.0])
}

///|
test "FixedLocator original 365 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, -1.0])
}

///|
test "FixedLocator original 366 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=2.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, -1.0])
}

///|
test "FixedLocator original 367 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, -1.0])
}

///|
test "FixedLocator original 368 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=3.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0 / 0.0,
    -1.0,
  ])
}

///|
test "FixedLocator original 369 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0 / 0.0,
    -1.0,
  ])
}

///|
test "FixedLocator original 370 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=4.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0 / 0.0,
    -1.0,
  ])
}

///|
test "FixedLocator original 371 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0 / 0.0,
    -1.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0 / 0.0, -1.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0 / 0.0,
    -1.0,
  ])
}

///|
test "FixedLocator original 372 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=10.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
}

///|
test "FixedLocator original 373 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
}

///|
test "FixedLocator original 374 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=1.0e+308,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
}

///|
test "FixedLocator original 375 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
}

///|
test "FixedLocator original 376 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
}

///|
test "FixedLocator original 377 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    4.0,
    0.0,
    0.0 / 0.0,
    1.0,
    -1.0,
    3.0,
  ])
}

///|
test "FixedLocator original 378 constructor" {
  let locator = @ticker.FixedLocator::new(
    [4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0],
    nbins=0.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 379 set_params" {
  let locator = @ticker.FixedLocator::new([4.0, 0.0, 0.0 / 0.0, 1.0, -1.0, 3.0])
  locator.set_params(nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 380 constructor" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
}

///|
test "FixedLocator original 381 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params()
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
}

///|
test "FixedLocator original 382 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=-1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0 / 0.0, -0.0])
}

///|
test "FixedLocator original 383 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
}

///|
test "FixedLocator original 384 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=-5.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0 / 0.0, -0.0])
}

///|
test "FixedLocator original 385 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-5.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
}

///|
test "FixedLocator original 386 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=-0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0 / 0.0, -0.0])
}

///|
test "FixedLocator original 387 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
}

///|
test "FixedLocator original 388 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=-0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0 / 0.0, -0.0])
}

///|
test "FixedLocator original 389 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 390 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0 / 0.0, -0.0])
}

///|
test "FixedLocator original 391 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 392 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=5.0e-324,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0 / 0.0, -0.0])
}

///|
test "FixedLocator original 393 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(5.0e-324))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 394 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=0.1,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0 / 0.0, -0.0])
}

///|
test "FixedLocator original 395 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 396 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0 / 0.0, -0.0])
}

///|
test "FixedLocator original 397 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.5))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 398 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=1.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0 / 0.0, -0.0])
}

///|
test "FixedLocator original 399 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 400 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=1.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0 / 0.0, -0.0])
}

///|
test "FixedLocator original 401 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    0.0 / 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    0.0 / 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, 0.0 / 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    0.0 / 0.0,
  ])
}

///|
test "FixedLocator original 402 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=2.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0 / 0.0, -0.0])
}

///|
test "FixedLocator original 403 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0 / 0.0, -0.0])
}

///|
test "FixedLocator original 404 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=2.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0 / 0.0, -0.0])
}

///|
test "FixedLocator original 405 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [1.0 / 0.0, -0.0])
}

///|
test "FixedLocator original 406 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=3.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    0.0,
    0.0 / 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    0.0,
    0.0 / 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, 0.0, 0.0 / 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    0.0,
    0.0 / 0.0,
  ])
}

///|
test "FixedLocator original 407 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    0.0,
    0.0 / 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    0.0,
    0.0 / 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, 0.0, 0.0 / 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    0.0,
    0.0 / 0.0,
  ])
}

///|
test "FixedLocator original 408 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=4.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    0.0,
    0.0 / 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    0.0,
    0.0 / 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, 0.0, 0.0 / 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    0.0,
    0.0 / 0.0,
  ])
}

///|
test "FixedLocator original 409 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    0.0,
    0.0 / 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    0.0,
    0.0 / 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, 0.0, 0.0 / 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    0.0,
    0.0 / 0.0,
  ])
}

///|
test "FixedLocator original 410 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=10.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
}

///|
test "FixedLocator original 411 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
}

///|
test "FixedLocator original 412 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=1.0e+308,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
}

///|
test "FixedLocator original 413 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
}

///|
test "FixedLocator original 414 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
}

///|
test "FixedLocator original 415 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
}

///|
test "FixedLocator original 416 constructor" {
  let locator = @ticker.FixedLocator::new(
    [1.0 / 0.0, -1.0 / 0.0, 0.0, -0.0, 0.0 / 0.0, 2.0],
    nbins=0.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 417 set_params" {
  let locator = @ticker.FixedLocator::new([
    1.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -0.0,
    0.0 / 0.0,
    2.0,
  ])
  locator.set_params(nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 418 constructor" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
}

///|
test "FixedLocator original 419 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params()
  verify_fixed_reference_nbins(locator.nbins(), None)
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
}

///|
test "FixedLocator original 420 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=-1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 0.0])
}

///|
test "FixedLocator original 421 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=-1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
}

///|
test "FixedLocator original 422 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=-5.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 0.0])
}

///|
test "FixedLocator original 423 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=-5.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-5.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
}

///|
test "FixedLocator original 424 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=-0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 0.0])
}

///|
test "FixedLocator original 425 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=-0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
}

///|
test "FixedLocator original 426 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=-0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 0.0])
}

///|
test "FixedLocator original 427 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=-0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(-0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 428 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 0.0])
}

///|
test "FixedLocator original 429 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 430 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=5.0e-324,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 0.0])
}

///|
test "FixedLocator original 431 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=5.0e-324)
  verify_fixed_reference_nbins(locator.nbins(), Some(5.0e-324))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 432 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=0.1,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 0.0])
}

///|
test "FixedLocator original 433 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=0.1)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 434 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=0.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 0.0])
}

///|
test "FixedLocator original 435 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=0.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.5))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 436 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=1.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 0.0])
}

///|
test "FixedLocator original 437 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [0.0])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0])
}

///|
test "FixedLocator original 438 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=1.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 0.0])
}

///|
test "FixedLocator original 439 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=1.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    -5.0e-324, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    -5.0e-324, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [-5.0e-324, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [-5.0e-324, 0.0])
}

///|
test "FixedLocator original 440 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=2.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 0.0])
}

///|
test "FixedLocator original 441 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=2.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 0.0])
}

///|
test "FixedLocator original 442 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=2.5,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 0.0])
}

///|
test "FixedLocator original 443 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=2.5)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.5))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    0.0, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [0.0, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [0.0, 0.0])
}

///|
test "FixedLocator original 444 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=3.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, 0.0, -1.0e+308,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, 0.0, -1.0e+308,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, 0.0, -1.0e+308],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, 0.0, -1.0e+308,
  ])
}

///|
test "FixedLocator original 445 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=3.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, 0.0, -1.0e+308,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, 0.0, -1.0e+308,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, 0.0, -1.0e+308],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, 0.0, -1.0e+308,
  ])
}

///|
test "FixedLocator original 446 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=4.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, 0.0, -1.0e+308,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, 0.0, -1.0e+308,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, 0.0, -1.0e+308],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, 0.0, -1.0e+308,
  ])
}

///|
test "FixedLocator original 447 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=4.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(4.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, 0.0, -1.0e+308,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, 0.0, -1.0e+308,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, 0.0, -1.0e+308],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, 0.0, -1.0e+308,
  ])
}

///|
test "FixedLocator original 448 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=10.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
}

///|
test "FixedLocator original 449 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=10.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(10.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
}

///|
test "FixedLocator original 450 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=1.0e+308,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
}

///|
test "FixedLocator original 451 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=1.0e+308)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0e+308))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
}

///|
test "FixedLocator original 452 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=1.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
}

///|
test "FixedLocator original 453 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=1.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  verify_fixed_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(locator.tick_values(100.0, -100.0).to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  verify_fixed_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
  )
  verify_fixed_reference_values(locator.values().to_array(), [
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
}

///|
test "FixedLocator original 454 constructor" {
  let locator = @ticker.FixedLocator::new(
    [5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0],
    nbins=0.0 / 0.0,
  )
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original 455 set_params" {
  let locator = @ticker.FixedLocator::new([
    5.0e-324, -5.0e-324, 0.0, 1.0e+308, -1.0e+308, 0.0,
  ])
  locator.set_params(nbins=0.0 / 0.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(0.0 / 0.0))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(100.0, -100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator original shared result list nbins None" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = [4.0, 1.0, 0.0, -1.0, -4.0]
  let locator = @ticker.FixedLocator::from_list(supplied)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [4.0, 1.0, 0.0, -1.0, -4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), None)
  supplied[0] = 88.5
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
}

///|
test "FixedLocator original shared result list nbins 2.0" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = [4.0, 1.0, 0.0, -1.0, -4.0]
  let locator = @ticker.FixedLocator::from_list(supplied, nbins=2.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [0.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    4.0, 1.0, 42.25, -1.0, -4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    4.0, 1.0, 42.25, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  supplied[0] = 88.5
  verify_fixed_reference_values(locator.locations().to_array(), [
    4.0, 1.0, 42.25, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
}

///|
test "FixedLocator original shared result list nbins 3.0" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = [4.0, 1.0, 0.0, -1.0, -4.0]
  let locator = @ticker.FixedLocator::from_list(supplied, nbins=3.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [4.0, 0.0, -4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  supplied[0] = 88.5
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
}

///|
test "FixedLocator original shared result list nbins inf" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = [4.0, 1.0, 0.0, -1.0, -4.0]
  let locator = @ticker.FixedLocator::from_list(supplied, nbins=1.0 / 0.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [4.0, 1.0, 0.0, -1.0, -4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  supplied[0] = 88.5
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
}

///|
test "FixedLocator original shared result ndarray nbins None" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = [4.0, 1.0, 0.0, -1.0, -4.0]
  let locator = @ticker.FixedLocator::new(supplied)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [4.0, 1.0, 0.0, -1.0, -4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), None)
  supplied[0] = 88.5
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
}

///|
test "FixedLocator original shared result ndarray nbins 2.0" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = [4.0, 1.0, 0.0, -1.0, -4.0]
  let locator = @ticker.FixedLocator::new(supplied, nbins=2.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [0.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    4.0, 1.0, 42.25, -1.0, -4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    4.0, 1.0, 42.25, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  supplied[0] = 88.5
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, 1.0, 42.25, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
}

///|
test "FixedLocator original shared result ndarray nbins 3.0" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = [4.0, 1.0, 0.0, -1.0, -4.0]
  let locator = @ticker.FixedLocator::new(supplied, nbins=3.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [4.0, 0.0, -4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  supplied[0] = 88.5
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
}

///|
test "FixedLocator original shared result ndarray nbins inf" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = [4.0, 1.0, 0.0, -1.0, -4.0]
  let locator = @ticker.FixedLocator::new(supplied, nbins=1.0 / 0.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [4.0, 1.0, 0.0, -1.0, -4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  supplied[0] = 88.5
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
}

///|
test "FixedLocator original shared result ndarray_view nbins None" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner).view(1, 2, 5)
  let locator = @ticker.FixedLocator::from_view(supplied)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [4.0, 1.0, 0.0, -1.0, -4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 42.25, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 42.25, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -99.5,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), None)
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 88.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -99.5,
  ])
}

///|
test "FixedLocator original shared result ndarray_view nbins 2.0" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner).view(1, 2, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=2.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [0.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    4.0, 1.0, 42.25, -1.0, -4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 42.25, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    4.0, 1.0, 42.25, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 42.25, 5.0, -1.0, 3.0, -99.5,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, 1.0, 42.25, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 88.5, 7.0, 1.0, 6.0, 42.25, 5.0, -1.0, 3.0, -99.5,
  ])
}

///|
test "FixedLocator original shared result ndarray_view nbins 3.0" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner).view(1, 2, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=3.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [4.0, 0.0, -4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 42.25, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 42.25, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -99.5,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 88.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -99.5,
  ])
}

///|
test "FixedLocator original shared result ndarray_view nbins inf" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner).view(1, 2, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=1.0 / 0.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [4.0, 1.0, 0.0, -1.0, -4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 42.25, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 42.25, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -99.5,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, 1.0, 0.0, -1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 88.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -99.5,
  ])
}

///|
test "FixedLocator original shared result ndarray_reverse_view nbins None" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner).view(-1, -2, 5)
  let locator = @ticker.FixedLocator::from_view(supplied)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [-4.0, -1.0, 0.0, 1.0, 4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, -1.0, 0.0, 1.0, 4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 42.25,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, -1.0, 0.0, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 42.25,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), None)
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, -1.0, 0.0, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 88.5,
  ])
}

///|
test "FixedLocator original shared result ndarray_reverse_view nbins 2.0" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner).view(-1, -2, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=2.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [0.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    -4.0, -1.0, 42.25, 1.0, 4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 42.25, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    -4.0, -1.0, 42.25, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 42.25, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, -1.0, 42.25, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 42.25, 5.0, -1.0, 3.0, 88.5,
  ])
}

///|
test "FixedLocator original shared result ndarray_reverse_view nbins 3.0" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner).view(-1, -2, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=3.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [-4.0, 0.0, 4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, -1.0, 0.0, 1.0, 4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 42.25,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, -1.0, 0.0, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 42.25,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, -1.0, 0.0, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 88.5,
  ])
}

///|
test "FixedLocator original shared result ndarray_reverse_view nbins inf" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner).view(-1, -2, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=1.0 / 0.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [-4.0, -1.0, 0.0, 1.0, 4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, -1.0, 0.0, 1.0, 4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 42.25,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, -1.0, 0.0, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 42.25,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, -1.0, 0.0, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 88.5,
  ])
}

///|
test "FixedLocator original shared result ndarray_nested_view nbins None" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner)
    .view(1, 2, 5)
    .view(-1, -1, 5)
  let locator = @ticker.FixedLocator::from_view(supplied)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [-4.0, -1.0, 0.0, 1.0, 4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, -1.0, 0.0, 1.0, 4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 42.25,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, -1.0, 0.0, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 42.25,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), None)
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, -1.0, 0.0, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 88.5,
  ])
}

///|
test "FixedLocator original shared result ndarray_nested_view nbins 2.0" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner)
    .view(1, 2, 5)
    .view(-1, -1, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=2.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [0.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    -4.0, -1.0, 42.25, 1.0, 4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 42.25, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    -4.0, -1.0, 42.25, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 42.25, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, -1.0, 42.25, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 42.25, 5.0, -1.0, 3.0, 88.5,
  ])
}

///|
test "FixedLocator original shared result ndarray_nested_view nbins 3.0" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner)
    .view(1, 2, 5)
    .view(-1, -1, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=3.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [-4.0, 0.0, 4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, -1.0, 0.0, 1.0, 4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 42.25,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, -1.0, 0.0, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 42.25,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, -1.0, 0.0, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 88.5,
  ])
}

///|
test "FixedLocator original shared result ndarray_nested_view nbins inf" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner)
    .view(1, 2, 5)
    .view(-1, -1, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=1.0 / 0.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [-4.0, -1.0, 0.0, 1.0, 4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, -1.0, 0.0, 1.0, 4.0,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 42.25,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, -1.0, 0.0, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 42.25,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, -1.0, 0.0, 1.0, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, 88.5,
  ])
}

///|
test "FixedLocator original shared result ndarray_zero_view nbins None" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner).view(1, 0, 5)
  let locator = @ticker.FixedLocator::from_view(supplied)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [4.0, 4.0, 4.0, 4.0, 4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 42.25, 42.25, 42.25, 42.25,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 42.25, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    -99.5, -99.5, -99.5, -99.5, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), None)
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, 88.5, 88.5, 88.5, 88.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 88.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
}

///|
test "FixedLocator original shared result ndarray_zero_view nbins 2.0" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner).view(1, 0, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=2.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [4.0, 4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 42.25, 42.25, 42.25, 42.25,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 42.25, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    -99.5, -99.5, -99.5, -99.5, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(2.0))
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, 88.5, 88.5, 88.5, 88.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 88.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
}

///|
test "FixedLocator original shared result ndarray_zero_view nbins 3.0" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner).view(1, 0, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=3.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [4.0, 4.0, 4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 42.25, 42.25, 42.25, 42.25,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 42.25, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    -99.5, -99.5, -99.5, -99.5, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(3.0))
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, 88.5, 88.5, 88.5, 88.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 88.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
}

///|
test "FixedLocator original shared result ndarray_zero_view nbins inf" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner).view(1, 0, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=1.0 / 0.0)
  let shallow = locator.copy()
  let ticks = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values(ticks.to_array(), [4.0, 4.0, 4.0, 4.0, 4.0])
  ticks.set(0, 42.25)
  verify_fixed_reference_values(locator.locations().to_array(), [
    42.25, 42.25, 42.25, 42.25, 42.25,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 42.25, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.locations().set(-1, -99.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    -99.5, -99.5, -99.5, -99.5, -99.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, -99.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
  shallow.set_params(nbins=1.0)
  verify_fixed_reference_nbins(locator.nbins(), Some(1.0 / 0.0))
  supplied.set(0, 88.5)
  verify_fixed_reference_values(locator.locations().to_array(), [
    88.5, 88.5, 88.5, 88.5, 88.5,
  ])
  verify_fixed_reference_values(owner, [
    9.0, 88.5, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0,
  ])
}

///|
test "FixedLocator original inherited ranges" {
  let locator = @ticker.FixedLocator::new([])
  let pair = locator.nonsingular(0.0, 0.0)
  verify_fixed_reference_values([pair.0, pair.1], [-0.05, 0.05])
  let pair = locator.view_limits(0.0, 0.0)
  verify_fixed_reference_values([pair.0, pair.1], [-0.001, 0.001])
  let pair = locator.nonsingular(1.0, 1.0)
  verify_fixed_reference_values([pair.0, pair.1], [0.95, 1.05])
  let pair = locator.view_limits(1.0, 1.0)
  verify_fixed_reference_values([pair.0, pair.1], [0.999, 1.001])
  let pair = locator.nonsingular(-2.0, -2.0)
  verify_fixed_reference_values([pair.0, pair.1], [-2.1, -1.9])
  let pair = locator.view_limits(-2.0, -2.0)
  verify_fixed_reference_values([pair.0, pair.1], [-2.002, -1.998])
  let pair = locator.nonsingular(3.0, -1.0)
  verify_fixed_reference_values([pair.0, pair.1], [-1.0, 3.0])
  let pair = locator.view_limits(3.0, -1.0)
  verify_fixed_reference_values([pair.0, pair.1], [-1.0, 3.0])
  let pair = locator.nonsingular(5.0e-324, -5.0e-324)
  verify_fixed_reference_values([pair.0, pair.1], [-0.05, 0.05])
  let pair = locator.view_limits(5.0e-324, -5.0e-324)
  verify_fixed_reference_values([pair.0, pair.1], [-0.001, 0.001])
  let pair = locator.nonsingular(1.0e+308, 1.0e+308)
  verify_fixed_reference_values([pair.0, pair.1], [9.5e+307, 1.05e+308])
  let pair = locator.view_limits(1.0e+308, 1.0e+308)
  verify_fixed_reference_values([pair.0, pair.1], [9.99e+307, 1.001e+308])
  let pair = locator.nonsingular(-1.0e+308, 1.0e+308)
  verify_fixed_reference_values([pair.0, pair.1], [-1.0e+308, 1.0e+308])
  let pair = locator.view_limits(-1.0e+308, 1.0e+308)
  verify_fixed_reference_values([pair.0, pair.1], [-1.0e+308, 1.0e+308])
  let pair = locator.nonsingular(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values([pair.0, pair.1], [-0.05, 0.05])
  let pair = locator.view_limits(0.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values([pair.0, pair.1], [-0.001, 0.001])
  let pair = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values([pair.0, pair.1], [-0.05, 0.05])
  let pair = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_fixed_reference_values([pair.0, pair.1], [-0.001, 0.001])
}
