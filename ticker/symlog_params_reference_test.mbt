// Generated pinned SymmetricalLogLocator raw parameter, alias and range observations.

///|
fn verify_symlog_params_number(
  actual : Double,
  expected : Double,
) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn verify_symlog_params_values(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    verify_symlog_params_number(actual[index], value)
  }
}

///|
fn verify_symlog_params_numticks(
  actual : @ticker.LogNumTicks,
  expected : @ticker.LogNumTicks,
) -> Unit raise {
  match (actual, expected) {
    (@ticker.LogNumTicks::Text(a), @ticker.LogNumTicks::Text(b)) =>
      assert_eq(a, b)
    (@ticker.LogNumTicks::Integer(a), @ticker.LogNumTicks::Integer(b)) =>
      assert_eq(a, b)
    (@ticker.LogNumTicks::Number(a), @ticker.LogNumTicks::Number(b)) =>
      verify_symlog_params_number(a, b)
    _ => fail("unexpected symlog count storage")
  }
}

///|
fn verify_symlog_params_subs(
  actual : @ticker.SymLogSubs,
  expected : @ticker.SymLogSubs,
) -> Unit raise {
  match (actual, expected) {
    (@ticker.SymLogSubs::Text(a), @ticker.SymLogSubs::Text(b)) =>
      assert_eq(a, b)
    (@ticker.SymLogSubs::Number(a), @ticker.SymLogSubs::Number(b)) =>
      verify_symlog_params_number(a, b)
    (@ticker.SymLogSubs::Values(a), @ticker.SymLogSubs::Values(b)) =>
      verify_symlog_params_values(a.to_array(), b.to_array())
    _ => fail("unexpected symlog subs storage")
  }
}

///|
test "SymLog original constructor 0" {
  assert_true(
    try {
      ignore(@ticker.SymmetricalLogLocator::new())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original constructor 1" {
  assert_true(
    try {
      ignore(@ticker.SymmetricalLogLocator::new(base=10.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original constructor 2" {
  assert_true(
    try {
      ignore(@ticker.SymmetricalLogLocator::new(linthresh=1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original constructor 3" {
  assert_true(
    try {
      ignore(@ticker.SymmetricalLogLocator::new(linthresh=1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original constructor 4" {
  assert_true(
    try {
      ignore(@ticker.SymmetricalLogLocator::new(base=10.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original constructor 5" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 6" {
  assert_true(
    try {
      ignore(
        @ticker.SymmetricalLogLocator::new(
          base=999.0,
          linthresh=999.0,
          transform=@scale.Scale::Linear,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original constructor 7" {
  assert_true(
    try {
      ignore(
        @ticker.SymmetricalLogLocator::new(
          base=999.0,
          linthresh=999.0,
          transform=@scale.Scale::Log,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original constructor 8" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=999.0,
    linthresh=999.0,
    transform=@scale.Scale::SymLog(base=2.0, linthresh=0.5, linscale=1.0),
  )
  verify_symlog_params_number(locator.base(), 2.0)
  verify_symlog_params_number(locator.linthresh(), 0.5)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 9" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=999.0,
    linthresh=999.0,
    transform=@scale.Scale::SymLog(base=0.0, linthresh=0.0 / 0.0, linscale=-1.0),
  )
  verify_symlog_params_number(locator.base(), 0.0)
  verify_symlog_params_number(locator.linthresh(), 0.0 / 0.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 10" {
  let locator = @ticker.SymmetricalLogLocator::new(base=0.0, linthresh=1.0)
  verify_symlog_params_number(locator.base(), 0.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 11" {
  let locator = @ticker.SymmetricalLogLocator::new(base=-0.0, linthresh=1.0)
  verify_symlog_params_number(locator.base(), -0.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 12" {
  let locator = @ticker.SymmetricalLogLocator::new(base=-1.0, linthresh=1.0)
  verify_symlog_params_number(locator.base(), -1.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 13" {
  let locator = @ticker.SymmetricalLogLocator::new(base=1.0, linthresh=1.0)
  verify_symlog_params_number(locator.base(), 1.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 14" {
  let locator = @ticker.SymmetricalLogLocator::new(base=2.0, linthresh=1.0)
  verify_symlog_params_number(locator.base(), 2.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 15" {
  let locator = @ticker.SymmetricalLogLocator::new(base=2.5, linthresh=1.0)
  verify_symlog_params_number(locator.base(), 2.5)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 16" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=0.0 / 0.0,
    linthresh=1.0,
  )
  verify_symlog_params_number(locator.base(), 0.0 / 0.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 17" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=1.0 / 0.0,
    linthresh=1.0,
  )
  verify_symlog_params_number(locator.base(), 1.0 / 0.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 18" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=-1.0 / 0.0,
    linthresh=1.0,
  )
  verify_symlog_params_number(locator.base(), -1.0 / 0.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 19" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=1.7976931348623157e+308,
    linthresh=1.0,
  )
  verify_symlog_params_number(locator.base(), 1.7976931348623157e+308)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 20" {
  let locator = @ticker.SymmetricalLogLocator::new(base=5.0e-324, linthresh=1.0)
  verify_symlog_params_number(locator.base(), 5.0e-324)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 21" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=1.0000000000000002,
    linthresh=1.0,
  )
  verify_symlog_params_number(locator.base(), 1.0000000000000002)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 22" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=0.0)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 0.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 23" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=-0.0)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), -0.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 24" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=-1.0)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), -1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 25" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 26" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=2.0)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 2.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 27" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=2.5)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 2.5)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 28" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=0.0 / 0.0,
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 0.0 / 0.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 29" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0 / 0.0,
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0 / 0.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 30" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=-1.0 / 0.0,
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), -1.0 / 0.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 31" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.7976931348623157e+308,
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.7976931348623157e+308)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 32" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=5.0e-324,
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 5.0e-324)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 33" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0000000000000002,
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0000000000000002)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 34" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 35" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(@ticker.SymLogSubs::Values(@ticker.TickValues::from_array([]))),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 36" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(@ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0]))),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 37" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([2.0, 1.0])),
    ),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([2.0, 1.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 38" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(
        @ticker.TickValues::from_array([-1.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]),
      ),
    ),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([-1.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]),
    ),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 39" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(@ticker.SymLogSubs::Text("auto")),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(locator.subs(), @ticker.SymLogSubs::Text("auto"))
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 40" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(@ticker.SymLogSubs::Text("all")),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(locator.subs(), @ticker.SymLogSubs::Text("all"))
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 41" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(@ticker.SymLogSubs::Text("bad")),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(locator.subs(), @ticker.SymLogSubs::Text("bad"))
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 42" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(@ticker.SymLogSubs::Number(0.0)),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(locator.subs(), @ticker.SymLogSubs::Number(0.0))
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 43" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(@ticker.SymLogSubs::Number(0.0 / 0.0)),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Number(0.0 / 0.0),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original constructor 44" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(@ticker.SymLogSubs::Number(1.0 / 0.0)),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Number(1.0 / 0.0),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "SymLog original raw update and delayed consumption 0" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params()
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
  verify_symlog_params_values(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original raw update and delayed consumption 1" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params()
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
  verify_symlog_params_values(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original raw update and delayed consumption 2" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(
    subs=@ticker.SymLogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
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
test "SymLog original raw update and delayed consumption 3" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(subs=@ticker.SymLogSubs::Text("auto"))
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(locator.subs(), @ticker.SymLogSubs::Text("auto"))
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
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
test "SymLog original raw update and delayed consumption 4" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(
    subs=@ticker.SymLogSubs::Text("all"),
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_symlog_params_subs(locator.subs(), @ticker.SymLogSubs::Text("all"))
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
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
test "SymLog original raw update and delayed consumption 5" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(
    subs=@ticker.SymLogSubs::Number(0.0),
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("1")),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("1")),
  )
  verify_symlog_params_subs(locator.subs(), @ticker.SymLogSubs::Number(0.0))
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
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
test "SymLog original raw update and delayed consumption 6" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(
    subs=@ticker.SymLogSubs::Number(0.0 / 0.0),
    numticks=@ticker.LogNumTicks::Number(1.0 / 0.0),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(1.0 / 0.0),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Number(0.0 / 0.0),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
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
test "SymLog original raw update and delayed consumption 7" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(
    subs=@ticker.SymLogSubs::Values(@ticker.TickValues::from_array([2.0, 1.0])),
    numticks=@ticker.LogNumTicks::Number(2.5),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(2.5),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([2.0, 1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
  verify_symlog_params_values(locator.tick_values(-100.0, 100.0), [
    -2.0, -1.0, 0.0, 2.0, 1.0,
  ])
}

///|
test "SymLog original raw update and delayed consumption 8" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(
    subs=@ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([-1.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]),
    ),
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1")),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([-1.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]),
    ),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
  verify_symlog_params_values(locator.tick_values(-100.0, 100.0), [
    100.0,
    -0.0,
    0.0 / 0.0,
    -1.0 / 0.0,
    10.0,
    -0.0,
    0.0 / 0.0,
    -1.0 / 0.0,
    1.0,
    -0.0,
    0.0 / 0.0,
    -1.0 / 0.0,
    0.0,
    -1.0,
    0.0,
    0.0 / 0.0,
    1.0 / 0.0,
    -10.0,
    0.0,
    0.0 / 0.0,
    1.0 / 0.0,
    -100.0,
    0.0,
    0.0 / 0.0,
    1.0 / 0.0,
  ])
}

///|
test "SymLog original raw update and delayed consumption 9" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("0")),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("0")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
  verify_symlog_params_values(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original raw update and delayed consumption 10" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("1")),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("1")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
  verify_symlog_params_values(locator.tick_values(-100.0, 100.0), [
    -1.0, 0.0, 1.0,
  ])
}

///|
test "SymLog original raw update and delayed consumption 11" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1")),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
  verify_symlog_params_values(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original raw update and delayed consumption 12" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(numticks=@ticker.LogNumTicks::Number(0.5))
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(0.5),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
  verify_symlog_params_values(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original raw update and delayed consumption 13" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(numticks=@ticker.LogNumTicks::Number(2.5))
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(2.5),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
  verify_symlog_params_values(locator.tick_values(-100.0, 100.0), [
    -1.0, 0.0, 1.0,
  ])
}

///|
test "SymLog original raw update and delayed consumption 14" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(numticks=@ticker.LogNumTicks::Number(0.0 / 0.0))
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(0.0 / 0.0),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
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
test "SymLog original raw update and delayed consumption 15" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(numticks=@ticker.LogNumTicks::Number(1.0 / 0.0))
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(1.0 / 0.0),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
  verify_symlog_params_values(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original raw update and delayed consumption 16" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(numticks=@ticker.LogNumTicks::Number(-1.0 / 0.0))
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(-1.0 / 0.0),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
  verify_symlog_params_values(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original raw update and delayed consumption 17" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(numticks=@ticker.LogNumTicks::Text("auto"))
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
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
test "SymLog original raw update and delayed consumption 18" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(numticks=@ticker.LogNumTicks::Text("bad"))
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("bad"),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
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
test "SymLog original raw update and delayed consumption 19" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(
    numticks=@ticker.LogNumTicks::Integer(
      @bigint.BigInt::from_string("9223372036854775808"),
    ),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(
      @bigint.BigInt::from_string("9223372036854775808"),
    ),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
  verify_symlog_params_values(locator.tick_values(-100.0, 100.0), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
}

///|
test "SymLog original raw update and delayed consumption 20" {
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.set_params(
    numticks=@ticker.LogNumTicks::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_symlog_params_values(locator.tick_values(-0.5, 0.5), [-0.5, 0.0, 0.5])
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
test "SymLog original retained subs alias float contiguous" {
  let owner = [1.0, 2.0, 5.0]
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(@ticker.SymLogSubs::Values(@ticker.TickValues::from_array(owner))),
  )
  let shallow = locator.copy()
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
  )
  owner[0] = 1.25
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.25, 2.0, 5.0])),
  )
  guard locator.subs() is @ticker.SymLogSubs::Values(values) else {
    fail("expected numeric subs")
  }
  values.set(-1, 3.75)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.25, 2.0, 3.75]),
    ),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    shallow.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.25, 2.0, 3.75]),
    ),
  )
  verify_symlog_params_values(owner, [1.25, 2.0, 3.75])
  shallow.set_params(
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    subs=@ticker.SymLogSubs::Text("bad"),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.25, 2.0, 3.75]),
    ),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
  verify_symlog_params_subs(shallow.subs(), @ticker.SymLogSubs::Text("bad"))
}

///|
test "SymLog original retained subs alias float signed" {
  let owner = [5.0, 2.0, 1.0]
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(
        @ticker.TickValues::from_array(owner).view(-1, -1, 3),
      ),
    ),
  )
  let shallow = locator.copy()
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
  )
  owner[2] = 1.25
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.25, 2.0, 5.0])),
  )
  guard locator.subs() is @ticker.SymLogSubs::Values(values) else {
    fail("expected numeric subs")
  }
  values.set(-1, 3.75)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.25, 2.0, 3.75]),
    ),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    shallow.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.25, 2.0, 3.75]),
    ),
  )
  verify_symlog_params_values(owner, [3.75, 2.0, 1.25])
  shallow.set_params(
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    subs=@ticker.SymLogSubs::Text("bad"),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.25, 2.0, 3.75]),
    ),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
  verify_symlog_params_subs(shallow.subs(), @ticker.SymLogSubs::Text("bad"))
}

///|
test "SymLog original retained subs alias float nested" {
  let owner = [1.0, 0.0, 2.0, 0.0, 5.0]
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(
        @ticker.TickValues::from_array(owner).view(0, 1, 5).view(4, -2, 3),
      ),
    ),
  )
  let shallow = locator.copy()
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([5.0, 2.0, 1.0])),
  )
  owner[4] = 1.25
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.25, 2.0, 1.0])),
  )
  guard locator.subs() is @ticker.SymLogSubs::Values(values) else {
    fail("expected numeric subs")
  }
  values.set(-1, 3.75)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.25, 2.0, 3.75]),
    ),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    shallow.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.25, 2.0, 3.75]),
    ),
  )
  verify_symlog_params_values(owner, [3.75, 0.0, 2.0, 0.0, 1.25])
  shallow.set_params(
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    subs=@ticker.SymLogSubs::Text("bad"),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.25, 2.0, 3.75]),
    ),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
  verify_symlog_params_subs(shallow.subs(), @ticker.SymLogSubs::Text("bad"))
}

///|
test "SymLog original retained subs alias float zero stride" {
  let owner = [2.0]
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(
        @ticker.TickValues::from_array(owner).view(0, 0, 3),
      ),
    ),
  )
  let shallow = locator.copy()
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([2.0, 2.0, 2.0])),
  )
  owner[0] = 1.25
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.25, 1.25, 1.25]),
    ),
  )
  guard locator.subs() is @ticker.SymLogSubs::Values(values) else {
    fail("expected numeric subs")
  }
  values.set(-1, 3.75)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([3.75, 3.75, 3.75]),
    ),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    shallow.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([3.75, 3.75, 3.75]),
    ),
  )
  verify_symlog_params_values(owner, [3.75])
  shallow.set_params(
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    subs=@ticker.SymLogSubs::Text("bad"),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([3.75, 3.75, 3.75]),
    ),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
  verify_symlog_params_subs(shallow.subs(), @ticker.SymLogSubs::Text("bad"))
}

///|
test "SymLog original retained subs alias float empty" {
  let owner = []
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(@ticker.SymLogSubs::Values(@ticker.TickValues::from_array(owner))),
  )
  let shallow = locator.copy()
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    shallow.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_symlog_params_values(owner, [])
  shallow.set_params(
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    subs=@ticker.SymLogSubs::Text("bad"),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
  verify_symlog_params_subs(shallow.subs(), @ticker.SymLogSubs::Text("bad"))
}

///|
test "SymLog original retained subs alias float nonfinite" {
  let owner = [-1.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(@ticker.SymLogSubs::Values(@ticker.TickValues::from_array(owner))),
  )
  let shallow = locator.copy()
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([-1.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]),
    ),
  )
  owner[0] = 1.25
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.25, 0.0, 0.0 / 0.0, 1.0 / 0.0]),
    ),
  )
  guard locator.subs() is @ticker.SymLogSubs::Values(values) else {
    fail("expected numeric subs")
  }
  values.set(-1, 3.75)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.25, 0.0, 0.0 / 0.0, 3.75]),
    ),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    shallow.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.25, 0.0, 0.0 / 0.0, 3.75]),
    ),
  )
  verify_symlog_params_values(owner, [1.25, 0.0, 0.0 / 0.0, 3.75])
  shallow.set_params(
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    subs=@ticker.SymLogSubs::Text("bad"),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.25, 0.0, 0.0 / 0.0, 3.75]),
    ),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
  verify_symlog_params_subs(shallow.subs(), @ticker.SymLogSubs::Text("bad"))
}

///|
test "SymLog original retained subs alias integer contiguous" {
  let owner = [1L, 2L, 5L]
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_int64_array(owner)),
    ),
  )
  let shallow = locator.copy()
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
  )
  owner[0] = 1L
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
  )
  guard locator.subs() is @ticker.SymLogSubs::Values(values) else {
    fail("expected numeric subs")
  }
  values.set(-1, 3.75)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 3.0])),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    shallow.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 3.0])),
  )
  assert_eq(owner, [1L, 2L, 3L])
  shallow.set_params(
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    subs=@ticker.SymLogSubs::Text("bad"),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 3.0])),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
  verify_symlog_params_subs(shallow.subs(), @ticker.SymLogSubs::Text("bad"))
}

///|
test "SymLog original retained subs alias integer signed" {
  let owner = [5L, 2L, 1L]
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(
        @ticker.TickValues::from_int64_array(owner).view(-1, -1, 3),
      ),
    ),
  )
  let shallow = locator.copy()
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
  )
  owner[2] = 1L
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
  )
  guard locator.subs() is @ticker.SymLogSubs::Values(values) else {
    fail("expected numeric subs")
  }
  values.set(-1, 3.75)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 3.0])),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    shallow.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 3.0])),
  )
  assert_eq(owner, [3L, 2L, 1L])
  shallow.set_params(
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    subs=@ticker.SymLogSubs::Text("bad"),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 3.0])),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
  verify_symlog_params_subs(shallow.subs(), @ticker.SymLogSubs::Text("bad"))
}

///|
test "SymLog original retained subs alias integer zero stride" {
  let owner = [2L]
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(
        @ticker.TickValues::from_int64_array(owner).view(0, 0, 3),
      ),
    ),
  )
  let shallow = locator.copy()
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([2.0, 2.0, 2.0])),
  )
  owner[0] = 1L
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 1.0, 1.0])),
  )
  guard locator.subs() is @ticker.SymLogSubs::Values(values) else {
    fail("expected numeric subs")
  }
  values.set(-1, 3.75)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([3.0, 3.0, 3.0])),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    shallow.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([3.0, 3.0, 3.0])),
  )
  assert_eq(owner, [3L])
  shallow.set_params(
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    subs=@ticker.SymLogSubs::Text("bad"),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([3.0, 3.0, 3.0])),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
  verify_symlog_params_subs(shallow.subs(), @ticker.SymLogSubs::Text("bad"))
}

///|
test "SymLog original retained subs alias integer exact large" {
  let owner = [9007199254740993L, 9223372036854775807L]
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_int64_array(owner)),
    ),
  )
  let shallow = locator.copy()
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([9007199254740992.0, 9.223372036854776e+18]),
    ),
  )
  owner[0] = 1L
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(
      @ticker.TickValues::from_array([1.0, 9.223372036854776e+18]),
    ),
  )
  guard locator.subs() is @ticker.SymLogSubs::Values(values) else {
    fail("expected numeric subs")
  }
  values.set(-1, 3.75)
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 3.0])),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    shallow.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 3.0])),
  )
  assert_eq(owner, [1L, 3L])
  shallow.set_params(
    numticks=@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    subs=@ticker.SymLogSubs::Text("bad"),
  )
  verify_symlog_params_number(locator.base(), 10.0)
  verify_symlog_params_number(locator.linthresh(), 1.0)
  verify_symlog_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_symlog_params_subs(
    locator.subs(),
    @ticker.SymLogSubs::Values(@ticker.TickValues::from_array([1.0, 3.0])),
  )
  verify_symlog_params_number(shallow.base(), 10.0)
  verify_symlog_params_number(shallow.linthresh(), 1.0)
  verify_symlog_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
  verify_symlog_params_subs(shallow.subs(), @ticker.SymLogSubs::Text("bad"))
}

///|
test "SymLog original post-round nonsingular 0" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 1" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.00095, 0.00105])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.000999, 0.001001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.001, 0.01])
}

///|
test "SymLog original post-round nonsingular 2" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.95, 1.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.999, 1.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.1, 10.0])
}

///|
test "SymLog original post-round nonsingular 3" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
}

///|
test "SymLog original post-round nonsingular 4" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-10.0, 10.0])
}

///|
test "SymLog original post-round nonsingular 5" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 6" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 7" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=2.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 8" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=2.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.00095, 0.00105])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.000999, 0.001001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.0009765625, 0.001953125])
}

///|
test "SymLog original post-round nonsingular 9" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=2.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.95, 1.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.999, 1.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.5, 2.0])
}

///|
test "SymLog original post-round nonsingular 10" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=2.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
}

///|
test "SymLog original post-round nonsingular 11" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=2.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 16.0])
}

///|
test "SymLog original post-round nonsingular 12" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=2.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 13" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=2.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 14" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=2.5, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 15" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=2.5, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.00095, 0.00105])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.000999, 0.001001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.00065536, 0.0016384])
}

///|
test "SymLog original post-round nonsingular 16" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=2.5, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.95, 1.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.999, 1.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.4, 2.5])
}

///|
test "SymLog original post-round nonsingular 17" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=2.5, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
}

///|
test "SymLog original post-round nonsingular 18" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=2.5, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.5, 15.625])
}

///|
test "SymLog original post-round nonsingular 19" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=2.5, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 20" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=2.5, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 21" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=1.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 22" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=1.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.00095, 0.00105])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.000999, 0.001001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.999, 1.001])
}

///|
test "SymLog original post-round nonsingular 23" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=1.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.95, 1.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.999, 1.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.999, 1.001])
}

///|
test "SymLog original post-round nonsingular 24" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=1.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
}

///|
test "SymLog original post-round nonsingular 25" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=1.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
}

///|
test "SymLog original post-round nonsingular 26" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=1.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
}

///|
test "SymLog original post-round nonsingular 27" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=1.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.999, 1.001])
}

///|
test "SymLog original post-round nonsingular 28" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original post-round nonsingular 29" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.00095, 0.00105])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.000999, 0.001001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 30" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.95, 1.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.999, 1.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 31" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
}

///|
test "SymLog original post-round nonsingular 32" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
}

///|
test "SymLog original post-round nonsingular 33" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 34" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 35" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-2.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 36" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-2.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.00095, 0.00105])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.000999, 0.001001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 37" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-2.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.95, 1.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.999, 1.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 38" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-2.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 39" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-2.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 40" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-2.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 41" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-2.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 42" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(
    base=0.0 / 0.0,
    linthresh=1.0,
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 43" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(
    base=0.0 / 0.0,
    linthresh=1.0,
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.00095, 0.00105])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.000999, 0.001001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 44" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(
    base=0.0 / 0.0,
    linthresh=1.0,
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.95, 1.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.999, 1.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 45" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(
    base=0.0 / 0.0,
    linthresh=1.0,
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 46" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(
    base=0.0 / 0.0,
    linthresh=1.0,
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 47" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(
    base=0.0 / 0.0,
    linthresh=1.0,
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 48" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(
    base=0.0 / 0.0,
    linthresh=1.0,
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 49" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(
    base=1.0 / 0.0,
    linthresh=1.0,
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 50" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(
    base=1.0 / 0.0,
    linthresh=1.0,
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.00095, 0.00105])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [0.000999, 0.001001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 51" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(
    base=1.0 / 0.0,
    linthresh=1.0,
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.95, 1.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.999, 1.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 52" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(
    base=1.0 / 0.0,
    linthresh=1.0,
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
}

///|
test "SymLog original post-round nonsingular 53" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(
    base=1.0 / 0.0,
    linthresh=1.0,
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_symlog_params_values([lo, hi], [-1.0, 1.0])
}

///|
test "SymLog original post-round nonsingular 54" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(
    base=1.0 / 0.0,
    linthresh=1.0,
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 55" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(
    base=1.0 / 0.0,
    linthresh=1.0,
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 56" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original post-round nonsingular 57" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0, -0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0, -0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, -0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original post-round nonsingular 58" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-0.0, -0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-0.0, -0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-0.0, -0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original post-round nonsingular 59" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original post-round nonsingular 60" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-0.0, 0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original post-round nonsingular 61" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0, -0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0, -0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, -0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original post-round nonsingular 62" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-0.0, -0.0)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-0.0, -0.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-0.0, -0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "SymLog original post-round nonsingular 63" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.95, 1.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.999, 1.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 64" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.0, 1.0])
}

///|
test "SymLog original post-round nonsingular 65" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0, 0.0)
  verify_symlog_params_values([lo, hi], [-1.0, 0.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0, 0.0)
  verify_symlog_params_values([lo, hi], [-1.0, 0.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0, 0.0)
  verify_symlog_params_values([lo, hi], [-1.0, 0.0])
}

///|
test "SymLog original post-round nonsingular 66" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(5.0e-324, 5.0e-324)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(5.0e-324, 5.0e-324)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(5.0e-324, 5.0e-324)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original post-round nonsingular 67" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(0.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(0.0, 1.0)
  verify_symlog_params_values([lo, hi], [0.0, 1.0])
}

///|
test "SymLog original post-round nonsingular 68" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0, 0.0)
  verify_symlog_params_values([lo, hi], [-1.0, 0.0])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(-1.0, 0.0)
  verify_symlog_params_values([lo, hi], [-1.0, 0.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(-1.0, 0.0)
  verify_symlog_params_values([lo, hi], [-1.0, 0.0])
}

///|
test "SymLog original post-round nonsingular 69" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.SymmetricalLogLocator::new(base=-0.0, linthresh=1.0)
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(5.0e-324, 5.0e-324)
  verify_symlog_params_values([lo, hi], [-0.05, 0.05])
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.view_limits(5.0e-324, 5.0e-324)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.view_limits(5.0e-324, 5.0e-324)
  verify_symlog_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "SymLog original view provider shallow copy and rebind" {
  let events : Array[String] = []
  let view = Ref((-10.0, 10.0))
  let locator = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  locator.bind_view_interval(fn() {
    events.push("first")
    view.val
  })
  let shallow = locator.copy()
  verify_symlog_params_values(locator.call(), [-10.0, -1.0, 0.0, 1.0, 10.0])
  verify_symlog_params_values(shallow.call(), [-10.0, -1.0, 0.0, 1.0, 10.0])
  view.val = (-100.0, 100.0)
  verify_symlog_params_values(shallow.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  locator.bind_view_interval(fn() {
    events.push("second")
    (0.2, 0.8)
  })
  verify_symlog_params_values(locator.call(), [0.0, 0.2, 0.8])
  verify_symlog_params_values(shallow.call(), [
    -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0,
  ])
  assert_eq(events, ["first", "first", "first", "second", "first"])
}
