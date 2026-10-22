// Generated original LogLocator parameter, alias, provider and range observations.

///|
fn verify_log_params_base(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn verify_log_params_values(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    verify_log_params_base(actual[index], value)
  }
}

///|
fn verify_log_params_numticks(
  actual : @ticker.LogNumTicks,
  expected : @ticker.LogNumTicks,
) -> Unit raise {
  match (actual, expected) {
    (@ticker.LogNumTicks::Text(a), @ticker.LogNumTicks::Text(b)) =>
      assert_eq(a, b)
    (@ticker.LogNumTicks::Integer(a), @ticker.LogNumTicks::Integer(b)) =>
      assert_eq(a, b)
    (@ticker.LogNumTicks::Number(a), @ticker.LogNumTicks::Number(b)) =>
      verify_log_params_base(a, b)
    _ => fail("unexpected log numticks dtype")
  }
}

///|
fn verify_log_params_subs(
  actual : @ticker.LogSubs,
  expected : @ticker.LogSubs,
) -> Unit raise {
  match (actual, expected) {
    (@ticker.LogSubs::Text(a), @ticker.LogSubs::Text(b)) => assert_eq(a, b)
    (@ticker.LogSubs::Values(a), @ticker.LogSubs::Values(b)) =>
      verify_log_params_values(a.to_array(), b.to_array())
    _ => fail("unexpected log subs kind")
  }
}

///|
test "Log original constructor 0" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new()
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 1" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(subs=None)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(locator.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 2" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    subs=Some(@ticker.LogSubs::Text("auto")),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(locator.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 3" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(subs=Some(@ticker.LogSubs::Text("all")))
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(locator.subs(), @ticker.LogSubs::Text("all"))
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 4" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  assert_true(
    try {
      ignore(@ticker.LogLocator::new(subs=Some(@ticker.LogSubs::Text("AUTO"))))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Log original constructor 5" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  assert_true(
    try {
      ignore(@ticker.LogLocator::new(subs=Some(@ticker.LogSubs::Text("bad"))))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Log original constructor 6" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    subs=Some(@ticker.LogSubs::Values(@ticker.TickValues::from_array([]))),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 7" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.5])),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.5])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 8" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(
        @ticker.TickValues::from_array([-1.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]),
      ),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(
      @ticker.TickValues::from_array([-1.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]),
    ),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 9" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(numticks=None)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 10" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Text("auto")),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 11" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Text("AUTO")),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("AUTO"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 12" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 13" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("1")),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 14" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1")),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 15" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Number(2.5)),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(2.5),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 16" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Number(0.5)),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(0.5),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 17" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Number(0.0 / 0.0)),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(0.0 / 0.0),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 18" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Number(1.0 / 0.0)),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(1.0 / 0.0),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 19" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Number(-1.0 / 0.0)),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(-1.0 / 0.0),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 20" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    numticks=Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string("9223372036854775808"),
      ),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(
      @bigint.BigInt::from_string("9223372036854775808"),
    ),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 21" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(
    numticks=Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 22" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new()
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 23" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(subs=None)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(locator.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 24" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    subs=Some(@ticker.LogSubs::Text("auto")),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(locator.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 25" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(subs=Some(@ticker.LogSubs::Text("all")))
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(locator.subs(), @ticker.LogSubs::Text("all"))
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 26" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  assert_true(
    try {
      ignore(@ticker.LogLocator::new(subs=Some(@ticker.LogSubs::Text("AUTO"))))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Log original constructor 27" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  assert_true(
    try {
      ignore(@ticker.LogLocator::new(subs=Some(@ticker.LogSubs::Text("bad"))))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Log original constructor 28" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    subs=Some(@ticker.LogSubs::Values(@ticker.TickValues::from_array([]))),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 29" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.5])),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.5])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 30" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(
        @ticker.TickValues::from_array([-1.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]),
      ),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(
      @ticker.TickValues::from_array([-1.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]),
    ),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 31" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(numticks=None)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 32" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Text("auto")),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 33" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Text("AUTO")),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("AUTO"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 34" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 35" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("1")),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 36" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1")),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 37" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Number(2.5)),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(2.5),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 38" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Number(0.5)),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(0.5),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 39" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Number(0.0 / 0.0)),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(0.0 / 0.0),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 40" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Number(1.0 / 0.0)),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(1.0 / 0.0),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 41" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    numticks=Some(@ticker.LogNumTicks::Number(-1.0 / 0.0)),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(-1.0 / 0.0),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 42" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    numticks=Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string("9223372036854775808"),
      ),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(
      @bigint.BigInt::from_string("9223372036854775808"),
    ),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 43" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new(
    numticks=Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 44" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(base=0.0)
  verify_log_params_base(locator.base(), 0.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 45" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(base=1.0)
  verify_log_params_base(locator.base(), 1.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 46" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(base=-2.0)
  verify_log_params_base(locator.base(), -2.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 47" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(base=0.0 / 0.0)
  verify_log_params_base(locator.base(), 0.0 / 0.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 48" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(base=1.0 / 0.0)
  verify_log_params_base(locator.base(), 1.0 / 0.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 49" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(base=-1.0 / 0.0)
  verify_log_params_base(locator.base(), -1.0 / 0.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 50" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(base=2.0)
  verify_log_params_base(locator.base(), 2.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 51" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(base=2.5)
  verify_log_params_base(locator.base(), 2.5)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original constructor 52" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.LogLocator::new(base=1.0000000000000002)
  verify_log_params_base(locator.base(), 1.0000000000000002)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original partial parameter update 0" {
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  locator.set_params()
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
  )
}

///|
test "Log original partial parameter update 1" {
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  locator.set_params(base=None, subs=None, numticks=None)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
  )
}

///|
test "Log original partial parameter update 2" {
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  locator.set_params(base=Some(2.0))
  verify_log_params_base(locator.base(), 2.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
  )
}

///|
test "Log original partial parameter update 3" {
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  locator.set_params(subs=Some(@ticker.LogSubs::Text("auto")))
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(locator.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
  )
}

///|
test "Log original partial parameter update 4" {
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  locator.set_params(subs=Some(@ticker.LogSubs::Text("all")))
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(locator.subs(), @ticker.LogSubs::Text("all"))
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
  )
}

///|
test "Log original partial parameter update 5" {
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  locator.set_params(
    subs=Some(@ticker.LogSubs::Values(@ticker.TickValues::from_array([]))),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
  )
}

///|
test "Log original partial parameter update 6" {
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  locator.set_params(
    subs=Some(
      @ticker.LogSubs::Values(
        @ticker.TickValues::from_array([-1.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]),
      ),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(
      @ticker.TickValues::from_array([-1.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]),
    ),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
  )
}

///|
test "Log original partial parameter update 7" {
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  locator.set_params(numticks=Some(@ticker.LogNumTicks::Number(2.5)))
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(2.5),
  )
}

///|
test "Log original partial parameter update 8" {
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  locator.set_params(numticks=Some(@ticker.LogNumTicks::Text("AUTO")))
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("AUTO"),
  )
}

///|
test "Log original partial parameter update 9" {
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  locator.set_params(
    numticks=Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
}

///|
test "Log original partial parameter update 10" {
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  assert_true(
    try {
      ignore(
        locator.set_params(
          base=Some(2.0),
          subs=Some(@ticker.LogSubs::Text("AUTO")),
          numticks=Some(
            @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("99")),
          ),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_params_base(locator.base(), 2.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
  )
}

///|
test "Log original partial parameter update 11" {
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  assert_true(
    try {
      ignore(
        locator.set_params(
          base=Some(-2.0),
          subs=Some(@ticker.LogSubs::Text("bad")),
          numticks=Some(
            @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("99")),
          ),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_log_params_base(locator.base(), -2.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
  )
}

///|
test "Log original partial parameter update 12" {
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  locator.set_params(
    base=Some(0.0 / 0.0),
    subs=Some(@ticker.LogSubs::Text("all")),
    numticks=Some(@ticker.LogNumTicks::Number(1.0 / 0.0)),
  )
  verify_log_params_base(locator.base(), 0.0 / 0.0)
  verify_log_params_subs(locator.subs(), @ticker.LogSubs::Text("all"))
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Number(1.0 / 0.0),
  )
}

///|
test "Log original partial parameter update 13" {
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
    ),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  locator.set_params(
    base=Some(0.0),
    subs=None,
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  verify_log_params_base(locator.base(), 0.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1")),
  )
}

///|
test "Log original subs alias contiguous" {
  let owner = [1.0, 2.0, 5.0]
  let locator = @ticker.LogLocator::new(
    subs=Some(@ticker.LogSubs::Values(@ticker.TickValues::from_array(owner))),
  )
  let shallow = locator.copy()
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  owner[0] = 7.0
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([7.0, 2.0, 5.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  guard locator.subs() is @ticker.LogSubs::Values(normalized) else {
    fail("expected numeric subs")
  }
  normalized.set(-1, 8.25)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([7.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 10.0)
  verify_log_params_subs(
    shallow.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([7.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_values(owner, [7.0, 2.0, 8.25])
  shallow.set_params(
    base=Some(2.0),
    subs=Some(@ticker.LogSubs::Text("auto")),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([7.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 2.0)
  verify_log_params_subs(shallow.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
}

///|
test "Log original subs alias signed" {
  let owner = [5.0, 2.0, 1.0]
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(
        @ticker.TickValues::from_array(owner).view(-1, -1, 3),
      ),
    ),
  )
  let shallow = locator.copy()
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  owner[2] = 7.0
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([7.0, 2.0, 5.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  guard locator.subs() is @ticker.LogSubs::Values(normalized) else {
    fail("expected numeric subs")
  }
  normalized.set(-1, 8.25)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([7.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 10.0)
  verify_log_params_subs(
    shallow.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([7.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_values(owner, [8.25, 2.0, 7.0])
  shallow.set_params(
    base=Some(2.0),
    subs=Some(@ticker.LogSubs::Text("auto")),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([7.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 2.0)
  verify_log_params_subs(shallow.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
}

///|
test "Log original subs alias nested" {
  let owner = [1.0, 0.0, 2.0, 0.0, 5.0]
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(
        @ticker.TickValues::from_array(owner).view(0, 1, 5).view(4, -2, 3),
      ),
    ),
  )
  let shallow = locator.copy()
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([5.0, 2.0, 1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  owner[4] = 7.0
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([7.0, 2.0, 1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  guard locator.subs() is @ticker.LogSubs::Values(normalized) else {
    fail("expected numeric subs")
  }
  normalized.set(-1, 8.25)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([7.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 10.0)
  verify_log_params_subs(
    shallow.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([7.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_values(owner, [8.25, 0.0, 2.0, 0.0, 7.0])
  shallow.set_params(
    base=Some(2.0),
    subs=Some(@ticker.LogSubs::Text("auto")),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([7.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 2.0)
  verify_log_params_subs(shallow.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
}

///|
test "Log original subs alias zero stride" {
  let owner = [2.0]
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(
        @ticker.TickValues::from_array(owner).view(0, 0, 3),
      ),
    ),
  )
  let shallow = locator.copy()
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([2.0, 2.0, 2.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  owner[0] = 7.0
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([7.0, 7.0, 7.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  guard locator.subs() is @ticker.LogSubs::Values(normalized) else {
    fail("expected numeric subs")
  }
  normalized.set(-1, 8.25)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([8.25, 8.25, 8.25])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 10.0)
  verify_log_params_subs(
    shallow.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([8.25, 8.25, 8.25])),
  )
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_values(owner, [8.25])
  shallow.set_params(
    base=Some(2.0),
    subs=Some(@ticker.LogSubs::Text("auto")),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([8.25, 8.25, 8.25])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 2.0)
  verify_log_params_subs(shallow.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
}

///|
test "Log original subs alias empty" {
  let owner = []
  let locator = @ticker.LogLocator::new(
    subs=Some(@ticker.LogSubs::Values(@ticker.TickValues::from_array(owner))),
  )
  let shallow = locator.copy()
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 10.0)
  verify_log_params_subs(
    shallow.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_values(owner, [])
  shallow.set_params(
    base=Some(2.0),
    subs=Some(@ticker.LogSubs::Text("auto")),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 2.0)
  verify_log_params_subs(shallow.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
}

///|
test "Log original subs alias nonfinite" {
  let owner = [-1.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]
  let locator = @ticker.LogLocator::new(
    subs=Some(@ticker.LogSubs::Values(@ticker.TickValues::from_array(owner))),
  )
  let shallow = locator.copy()
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(
      @ticker.TickValues::from_array([-1.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]),
    ),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  owner[0] = 7.0
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(
      @ticker.TickValues::from_array([7.0, 0.0, 0.0 / 0.0, 1.0 / 0.0]),
    ),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  guard locator.subs() is @ticker.LogSubs::Values(normalized) else {
    fail("expected numeric subs")
  }
  normalized.set(-1, 8.25)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(
      @ticker.TickValues::from_array([7.0, 0.0, 0.0 / 0.0, 8.25]),
    ),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 10.0)
  verify_log_params_subs(
    shallow.subs(),
    @ticker.LogSubs::Values(
      @ticker.TickValues::from_array([7.0, 0.0, 0.0 / 0.0, 8.25]),
    ),
  )
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_values(owner, [7.0, 0.0, 0.0 / 0.0, 8.25])
  shallow.set_params(
    base=Some(2.0),
    subs=Some(@ticker.LogSubs::Text("auto")),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(
      @ticker.TickValues::from_array([7.0, 0.0, 0.0 / 0.0, 8.25]),
    ),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 2.0)
  verify_log_params_subs(shallow.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
}

///|
test "Log original subs alias integer normalized" {
  let owner = [1L, 2L, 5L]
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_int64_array(owner)),
    ),
  )
  let shallow = locator.copy()
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  owner[0] = 7L
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  guard locator.subs() is @ticker.LogSubs::Values(normalized) else {
    fail("expected numeric subs")
  }
  normalized.set(-1, 8.25)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 10.0)
  verify_log_params_subs(
    shallow.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(owner, [7L, 2L, 5L])
  shallow.set_params(
    base=Some(2.0),
    subs=Some(@ticker.LogSubs::Text("auto")),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 2.0)
  verify_log_params_subs(shallow.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
}

///|
test "Log original subs alias integer signed normalized" {
  let owner = [5L, 2L, 1L]
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(
        @ticker.TickValues::from_int64_array(owner).view(-1, -1, 3),
      ),
    ),
  )
  let shallow = locator.copy()
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  owner[2] = 7L
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 5.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  guard locator.subs() is @ticker.LogSubs::Values(normalized) else {
    fail("expected numeric subs")
  }
  normalized.set(-1, 8.25)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 10.0)
  verify_log_params_subs(
    shallow.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(owner, [5L, 2L, 7L])
  shallow.set_params(
    base=Some(2.0),
    subs=Some(@ticker.LogSubs::Text("auto")),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 2.0)
  verify_log_params_subs(shallow.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
}

///|
test "Log original subs alias integer zero stride normalized" {
  let owner = [2L]
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(
        @ticker.TickValues::from_int64_array(owner).view(0, 0, 3),
      ),
    ),
  )
  let shallow = locator.copy()
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([2.0, 2.0, 2.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  owner[0] = 7L
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([2.0, 2.0, 2.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  guard locator.subs() is @ticker.LogSubs::Values(normalized) else {
    fail("expected numeric subs")
  }
  normalized.set(-1, 8.25)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([2.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 10.0)
  verify_log_params_subs(
    shallow.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([2.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(owner, [7L])
  shallow.set_params(
    base=Some(2.0),
    subs=Some(@ticker.LogSubs::Text("auto")),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([2.0, 2.0, 8.25])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 2.0)
  verify_log_params_subs(shallow.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
}

///|
test "Log original subs alias integer large normalized" {
  let owner = [9007199254740993L, 9223372036854775807L]
  let locator = @ticker.LogLocator::new(
    subs=Some(
      @ticker.LogSubs::Values(@ticker.TickValues::from_int64_array(owner)),
    ),
  )
  let shallow = locator.copy()
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(
      @ticker.TickValues::from_array([9007199254740992.0, 9.223372036854776e+18]),
    ),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  owner[0] = 7L
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(
      @ticker.TickValues::from_array([9007199254740992.0, 9.223372036854776e+18]),
    ),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  guard locator.subs() is @ticker.LogSubs::Values(normalized) else {
    fail("expected numeric subs")
  }
  normalized.set(-1, 8.25)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(
      @ticker.TickValues::from_array([9007199254740992.0, 8.25]),
    ),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 10.0)
  verify_log_params_subs(
    shallow.subs(),
    @ticker.LogSubs::Values(
      @ticker.TickValues::from_array([9007199254740992.0, 8.25]),
    ),
  )
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  assert_eq(owner, [7L, 9223372036854775807L])
  shallow.set_params(
    base=Some(2.0),
    subs=Some(@ticker.LogSubs::Text("auto")),
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
  )
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(
      @ticker.TickValues::from_array([9007199254740992.0, 8.25]),
    ),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("auto"),
  )
  verify_log_params_base(shallow.base(), 2.0)
  verify_log_params_subs(shallow.subs(), @ticker.LogSubs::Text("auto"))
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
  )
}

///|
test "Log original nonsingular and live autolimits 0" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
}

///|
test "Log original nonsingular and live autolimits 1" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 2" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.0001, 0.01])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.0001, 0.01])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.0001, 0.1])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 3" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 4" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 5" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 6" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 7" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 8" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 16.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
}

///|
test "Log original nonsingular and live autolimits 9" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.5, 2.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.5, 2.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.5, 2.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 10" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.0009765625, 0.001953125])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.0009765625, 0.001953125])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.0009765625, 0.001953125])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 11" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 128.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 12" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.0078125, 16.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 13" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 16.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 14" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 16.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 15" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 16.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 16" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.5)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 15.625])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
}

///|
test "Log original nonsingular and live autolimits 17" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.5)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.4, 2.5])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.4, 2.5])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.4, 2.5])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 18" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.5)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.00065536, 0.0016384])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.00065536, 0.0016384])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.00065536, 0.0016384])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 19" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.5)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 244.140625])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 20" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.5)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.004096, 15.625])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 21" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.5)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 15.625])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 22" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.5)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 15.625])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 23" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=2.5)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 15.625])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 24" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
}

///|
test "Log original nonsingular and live autolimits 25" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 26" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 27" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 28" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 29" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 30" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 31" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 32" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
}

///|
test "Log original nonsingular and live autolimits 33" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_log_params_values([lo, hi], [1.0 / 0.0, 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [1.0 / 0.0, 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 34" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 35" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 36" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 37" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 38" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 39" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 40" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=-2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
}

///|
test "Log original nonsingular and live autolimits 41" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=-2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 42" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=-2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 43" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=-2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 44" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=-2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 45" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=-2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 46" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=-2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 47" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=-2.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 48" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
}

///|
test "Log original nonsingular and live autolimits 49" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 50" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 51" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 52" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 53" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 54" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 55" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=0.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [0.0 / 0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 56" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
}

///|
test "Log original nonsingular and live autolimits 57" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.0, 1.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.0, 1.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.0, 0.0 / 0.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 58" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.001, 0.001)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.001, 0.001)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 59" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 100.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 100.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 60" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 61" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 62" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, [])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 63" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=1.0 / 0.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(10.0, 1.0)
  verify_log_params_values([lo, hi], [1.0, 1.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 64" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [1.0 / 0.0]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0, 10.0)
  verify_log_params_values([lo, hi], [1.0e-300, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [1.0e-300, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [1.0e-300, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 65" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [1.0 / 0.0]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 66" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    events.push("shared 1")
    [0.0 / 0.0, 0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0, 10.0)
  verify_log_params_values([lo, hi], [1.0e-300, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [1.0e-300, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [1.0e-300, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 67" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    events.push("shared 1")
    [0.0 / 0.0, 0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 68" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    events.push("shared 1")
    [0.01, 0.0 / 0.0]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.01, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 69" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    events.push("shared 1")
    [0.01, 0.0 / 0.0]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 70" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    events.push("shared 1")
    [0.1, 0.0]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.0, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.0, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [0.0, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 71" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    events.push("shared 1")
    [0.1, 0.0]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 72" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    events.push("shared 1")
    [-0.1, 0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(-1.0, 10.0)
  verify_log_params_values([lo, hi], [-0.1, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [-0.1, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(-1.0, 10.0)
  verify_log_params_values([lo, hi], [-1.0, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 73" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    events.push("shared 1")
    [-0.1, 0.01]
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_log_params_values([lo, hi], [0.1, 10.0])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 74" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    []
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  assert_true(
    try {
      ignore(locator.nonsingular(-1.0, 10.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(events, ["shared"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  assert_true(
    try {
      ignore(locator.view_limits(-1.0, 10.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(events, ["shared"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  assert_true(
    try {
      ignore(locator.view_limits(-1.0, 10.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(events, ["shared"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original nonsingular and live autolimits 75" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(base=10.0)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    []
  })
  @config.set_axes_autolimit_mode("data")
  events.clear()
  assert_true(
    try {
      ignore(locator.nonsingular(1.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(events, ["shared"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("data")
  events.clear()
  assert_true(
    try {
      ignore(locator.view_limits(1.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(events, ["shared"])
  assert_eq(locator.warnings(), [])
  @config.set_axes_autolimit_mode("round_numbers")
  events.clear()
  assert_true(
    try {
      ignore(locator.view_limits(1.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(events, ["shared"])
  assert_eq(locator.warnings(), [])
}

///|
test "Log original provider order call view then automatic space" {
  let old_classic = @config.classic_mode()
  defer @config.set_classic_mode(old_classic)
  @config.set_classic_mode(false)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(numticks=None)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  verify_log_params_values(locator.call(), [0.1, 1.0, 10.0, 100.0, 1000.0])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["view", "space"])
}

///|
test "Log original provider order call view before space error" {
  let old_classic = @config.classic_mode()
  defer @config.set_classic_mode(old_classic)
  @config.set_classic_mode(false)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(numticks=None)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() raise @core.DataError {
    events.push("space")
    raise @core.DataError::InvalidTicks(message="fixture space")
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["view", "space"])
}

///|
test "Log original provider order call view error first" {
  let old_classic = @config.classic_mode()
  defer @config.set_classic_mode(old_classic)
  @config.set_classic_mode(false)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(numticks=None)
  locator.bind_view_interval(fn() raise @core.DataError {
    events.push("view")
    raise @core.DataError::InvalidTicks(message="fixture view")
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["view"])
}

///|
test "Log original provider order negative call reads own minpos" {
  let old_classic = @config.classic_mode()
  defer @config.set_classic_mode(old_classic)
  @config.set_classic_mode(false)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(numticks=None)
  locator.bind_view_interval(fn() {
    events.push("view")
    (-1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  verify_log_params_values(locator.call(), [
    0.001, 0.01, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["view", "space", "minpos"])
}

///|
test "Log original provider order own minpos error after space" {
  let old_classic = @config.classic_mode()
  defer @config.set_classic_mode(old_classic)
  @config.set_classic_mode(false)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(numticks=None)
  locator.bind_view_interval(fn() {
    events.push("view")
    (-1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() raise @core.DataError {
    events.push("minpos")
    raise @core.DataError::InvalidTicks(message="fixture minpos")
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["view", "space", "minpos"])
}

///|
test "Log original provider order explicit budget skips space" {
  let old_classic = @config.classic_mode()
  defer @config.set_classic_mode(old_classic)
  @config.set_classic_mode(false)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("9")),
    ),
  )
  locator.bind_view_interval(fn() {
    events.push("view")
    (-1.0, 100.0)
  })
  locator.bind_tick_space(fn() raise @core.DataError {
    events.push("space")
    raise @core.DataError::InvalidTicks(message="fixture space")
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  verify_log_params_values(locator.call(), [
    0.001, 0.01, 0.1, 1.0, 10.0, 100.0, 1000.0,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["view", "minpos"])
}

///|
test "Log original provider order reversed positive first does not read own minpos" {
  let old_classic = @config.classic_mode()
  defer @config.set_classic_mode(old_classic)
  @config.set_classic_mode(false)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(numticks=None)
  locator.bind_view_interval(fn() {
    events.push("view")
    (100.0, -1.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() {
    events.push("shared")
    events.push("shared 0")
    [0.01]
  })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["view", "space"])
}

///|
test "Log original provider order nonsingular shared error" {
  let old_classic = @config.classic_mode()
  defer @config.set_classic_mode(old_classic)
  @config.set_classic_mode(false)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(numticks=None)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() raise @core.DataError {
    events.push("shared")
    raise @core.DataError::InvalidTicks(message="fixture shared")
  })
  assert_true(
    try {
      ignore(locator.nonsingular(1.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["shared"])
}

///|
test "Log original provider order nonsingular item error" {
  let old_classic = @config.classic_mode()
  defer @config.set_classic_mode(old_classic)
  @config.set_classic_mode(false)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(numticks=None)
  locator.bind_view_interval(fn() {
    events.push("view")
    (1.0, 100.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() raise @core.DataError {
    events.push("shared")
    events.push("shared 0")
    events.push("shared 1")
    raise @core.DataError::InvalidTicks(message="fixture shared item")
  })
  assert_true(
    try {
      ignore(locator.nonsingular(1.0, 100.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["shared", "shared 0", "shared 1"])
}

///|
test "Log original provider order nonsingular nonpositive skips errors" {
  let old_classic = @config.classic_mode()
  defer @config.set_classic_mode(old_classic)
  @config.set_classic_mode(false)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(numticks=None)
  locator.bind_view_interval(fn() {
    events.push("view")
    (-1.0, 0.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() raise @core.DataError {
    events.push("shared")
    raise @core.DataError::InvalidTicks(message="fixture shared")
  })
  let (lo, hi) = locator.nonsingular(-1.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
  assert_eq(events, [])
}

///|
test "Log original provider order nonsingular nonfinite skips errors" {
  let old_classic = @config.classic_mode()
  defer @config.set_classic_mode(old_classic)
  @config.set_classic_mode(false)
  let events : Array[String] = []
  let locator = @ticker.LogLocator::new(numticks=None)
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.0 / 0.0, 1.0 / 0.0)
  })
  locator.bind_tick_space(fn() {
    events.push("space")
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9"))
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_shared_minpos(fn() raise @core.DataError {
    events.push("shared")
    raise @core.DataError::InvalidTicks(message="fixture shared")
  })
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(locator.warnings(), [])
  assert_eq(events, [])
}

///|
test "Log tick space integer transport 0" {
  assert_eq(
    @ticker.LogTickSpace::from_integer(0.0),
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("0")),
  )
}

///|
test "Log tick space integer transport 1" {
  assert_eq(
    @ticker.LogTickSpace::from_integer(-0.0),
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("0")),
  )
}

///|
test "Log tick space integer transport 2" {
  assert_eq(
    @ticker.LogTickSpace::from_integer(-1.0),
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("-1")),
  )
}

///|
test "Log tick space integer transport 3" {
  assert_eq(
    @ticker.LogTickSpace::from_integer(2.0),
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("2")),
  )
}

///|
test "Log tick space integer transport 4" {
  assert_eq(
    @ticker.LogTickSpace::from_integer(9.0),
    @ticker.LogTickSpace::Integer(@bigint.BigInt::from_string("9")),
  )
}

///|
test "Log tick space integer transport 5" {
  assert_eq(
    @ticker.LogTickSpace::from_integer(9007199254740992.0),
    @ticker.LogTickSpace::Integer(
      @bigint.BigInt::from_string("9007199254740992"),
    ),
  )
}

///|
test "Log tick space integer transport 6" {
  assert_eq(
    @ticker.LogTickSpace::from_integer(1.0e+100),
    @ticker.LogTickSpace::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000159028911097599180468360808563945281389781327557747838772170381060813469985856815104",
      ),
    ),
  )
}

///|
test "Log tick space integer transport 7" {
  assert_eq(
    @ticker.LogTickSpace::from_integer(1.7976931348623157e+308),
    @ticker.LogTickSpace::Integer(
      @bigint.BigInt::from_string(
        "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
      ),
    ),
  )
}

///|
test "Log tick space integer transport 8" {
  assert_true(
    try {
      ignore(@ticker.LogTickSpace::from_integer(0.5))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Log tick space integer transport 9" {
  assert_true(
    try {
      ignore(@ticker.LogTickSpace::from_integer(-0.5))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Log tick space integer transport 10" {
  assert_true(
    try {
      ignore(@ticker.LogTickSpace::from_integer(0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Log tick space integer transport 11" {
  assert_true(
    try {
      ignore(@ticker.LogTickSpace::from_integer(1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Log tick space integer transport 12" {
  assert_true(
    try {
      ignore(@ticker.LogTickSpace::from_integer(-1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Log original classic capture raw property and shallow scalar independence" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.LogLocator::new()
  let shallow = locator.copy()
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_log_params_base(shallow.base(), 10.0)
  verify_log_params_subs(
    shallow.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  @config.set_classic_mode(false)
  locator.set_params(base=None, subs=None, numticks=None)
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  verify_log_params_base(shallow.base(), 10.0)
  verify_log_params_subs(
    shallow.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
  locator.set_numticks(@ticker.LogNumTicks::Text("AUTO"))
  verify_log_params_base(locator.base(), 10.0)
  verify_log_params_subs(
    locator.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    locator.numticks(),
    @ticker.LogNumTicks::Text("AUTO"),
  )
  verify_log_params_base(shallow.base(), 10.0)
  verify_log_params_subs(
    shallow.subs(),
    @ticker.LogSubs::Values(@ticker.TickValues::from_array([1.0])),
  )
  verify_log_params_numticks(
    shallow.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
  )
}

///|
test "Log original unbound nonsingular 0" {
  let locator = @ticker.LogLocator::new()
  assert_true(
    try {
      ignore(locator.nonsingular(1.0, 10.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original unbound nonsingular 1" {
  let locator = @ticker.LogLocator::new()
  assert_true(
    try {
      ignore(locator.nonsingular(1.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original unbound nonsingular 2" {
  let locator = @ticker.LogLocator::new()
  assert_true(
    try {
      ignore(locator.nonsingular(-1.0, 10.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Log original unbound nonsingular 3" {
  let locator = @ticker.LogLocator::new()
  let (lo, hi) = locator.nonsingular(-1.0, 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(locator.warnings(), [
    "Data has no positive values, and therefore cannot be log-scaled.",
  ])
}

///|
test "Log original unbound nonsingular 4" {
  let locator = @ticker.LogLocator::new()
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0 / 0.0)
  verify_log_params_values([lo, hi], [1.0, 10.0])
  assert_eq(locator.warnings(), [])
}
