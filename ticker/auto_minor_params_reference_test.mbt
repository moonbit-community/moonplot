// Generated pinned AutoMinor parameter/state/provider observations.

///|
fn verify_auto_minor_params_values(
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
fn verify_auto_minor_params_ndivs(
  actual : @config.MinorTickDivisions?,
  expected : @config.MinorTickDivisions?,
) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (
      Some(@config.MinorTickDivisions::Text(a)),
      Some(@config.MinorTickDivisions::Text(b)),
    ) => assert_eq(a, b)
    (
      Some(@config.MinorTickDivisions::Integer(a)),
      Some(@config.MinorTickDivisions::Integer(b)),
    ) => assert_eq(a, b)
    (
      Some(@config.MinorTickDivisions::Number(a)),
      Some(@config.MinorTickDivisions::Number(b)),
    ) =>
      if b.is_nan() {
        assert_true(a.is_nan())
      } else {
        assert_eq(a.reinterpret_as_uint64(), b.reinterpret_as_uint64())
      }
    _ => fail("unexpected subdivision representation")
  }
}

///|
test "AutoMinor original unchecked constructor 0" {
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  verify_auto_minor_params_ndivs(locator.ndivs(), None)
  assert_eq(locator.warnings(), [])
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(locator.scale_provider() is None)
  assert_true(locator.axis_name_provider() is None)
  assert_true(locator.major_ticks_provider() is None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "AutoMinor original unchecked constructor 1" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Text("auto")),
  )
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Text("auto")),
  )
  assert_eq(locator.warnings(), [])
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(locator.scale_provider() is None)
  assert_true(locator.axis_name_provider() is None)
  assert_true(locator.major_ticks_provider() is None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "AutoMinor original unchecked constructor 2" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Text("AUTO")),
  )
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Text("AUTO")),
  )
  assert_eq(locator.warnings(), [])
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(locator.scale_provider() is None)
  assert_true(locator.axis_name_provider() is None)
  assert_true(locator.major_ticks_provider() is None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "AutoMinor original unchecked constructor 3" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Text("2")),
  )
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Text("2")),
  )
  assert_eq(locator.warnings(), [])
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(locator.scale_provider() is None)
  assert_true(locator.axis_name_provider() is None)
  assert_true(locator.major_ticks_provider() is None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "AutoMinor original unchecked constructor 4" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Text("bad")),
  )
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Text("bad")),
  )
  assert_eq(locator.warnings(), [])
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(locator.scale_provider() is None)
  assert_true(locator.axis_name_provider() is None)
  assert_true(locator.major_ticks_provider() is None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "AutoMinor original unchecked constructor 5" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(0.0)),
  )
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Number(0.0)),
  )
  assert_eq(locator.warnings(), [])
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(locator.scale_provider() is None)
  assert_true(locator.axis_name_provider() is None)
  assert_true(locator.major_ticks_provider() is None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "AutoMinor original unchecked constructor 6" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(-0.0)),
  )
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Number(-0.0)),
  )
  assert_eq(locator.warnings(), [])
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(locator.scale_provider() is None)
  assert_true(locator.axis_name_provider() is None)
  assert_true(locator.major_ticks_provider() is None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "AutoMinor original unchecked constructor 7" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(-1.0)),
  )
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Number(-1.0)),
  )
  assert_eq(locator.warnings(), [])
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(locator.scale_provider() is None)
  assert_true(locator.axis_name_provider() is None)
  assert_true(locator.major_ticks_provider() is None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "AutoMinor original unchecked constructor 8" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.5)),
  )
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Number(2.5)),
  )
  assert_eq(locator.warnings(), [])
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(locator.scale_provider() is None)
  assert_true(locator.axis_name_provider() is None)
  assert_true(locator.major_ticks_provider() is None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "AutoMinor original unchecked constructor 9" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(0.0 / 0.0)),
  )
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Number(0.0 / 0.0)),
  )
  assert_eq(locator.warnings(), [])
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(locator.scale_provider() is None)
  assert_true(locator.axis_name_provider() is None)
  assert_true(locator.major_ticks_provider() is None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "AutoMinor original unchecked constructor 10" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(1.0 / 0.0)),
  )
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Number(1.0 / 0.0)),
  )
  assert_eq(locator.warnings(), [])
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(locator.scale_provider() is None)
  assert_true(locator.axis_name_provider() is None)
  assert_true(locator.major_ticks_provider() is None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "AutoMinor original unchecked constructor 11" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(-1.0 / 0.0)),
  )
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Number(-1.0 / 0.0)),
  )
  assert_eq(locator.warnings(), [])
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(locator.scale_provider() is None)
  assert_true(locator.axis_name_provider() is None)
  assert_true(locator.major_ticks_provider() is None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "AutoMinor original unchecked constructor 12" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(
      @config.MinorTickDivisions::Integer(
        @bigint.BigInt::from_string("9007199254740993"),
      ),
    ),
  )
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(
      @config.MinorTickDivisions::Integer(
        @bigint.BigInt::from_string("9007199254740993"),
      ),
    ),
  )
  assert_eq(locator.warnings(), [])
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(locator.scale_provider() is None)
  assert_true(locator.axis_name_provider() is None)
  assert_true(locator.major_ticks_provider() is None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "AutoMinor original unchecked constructor 13" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(
      @config.MinorTickDivisions::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(
      @config.MinorTickDivisions::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  assert_eq(locator.warnings(), [])
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(locator.scale_provider() is None)
  assert_true(locator.axis_name_provider() is None)
  assert_true(locator.major_ticks_provider() is None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "AutoMinor original provider order log before all other providers" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "log"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
  })
  verify_auto_minor_params_values(locator.call(), [])
  verify_auto_minor_params_ndivs(locator.ndivs(), None)
  assert_eq(trace, ["scale"])
  assert_eq(locator.warnings(), [
    "AutoMinorLocator does not work on logarithmic scales",
  ])
}

///|
test "AutoMinor original provider order one major before axis name" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
  })
  verify_auto_minor_params_values(locator.call(), [])
  verify_auto_minor_params_ndivs(locator.ndivs(), None)
  assert_eq(trace, ["scale", "major"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order duplicate major before axis name" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([1.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
  })
  verify_auto_minor_params_values(locator.call(), [])
  verify_auto_minor_params_ndivs(locator.ndivs(), None)
  assert_eq(trace, ["scale", "major"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order NaN unique one before axis name" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0 / 0.0, 0.0 / 0.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
  })
  verify_auto_minor_params_values(locator.call(), [])
  verify_auto_minor_params_ndivs(locator.ndivs(), None)
  assert_eq(trace, ["scale", "major"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order capture x float rc truncation" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(2.5))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(2.5),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
  })
  verify_auto_minor_params_values(locator.call(), [0.0, 0.5, 1.0])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2"))),
  )
  assert_eq(trace, ["scale", "major", "name", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order capture y rc" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(3.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(3.0),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "y"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
  })
  verify_auto_minor_params_values(locator.call(), [
    0.0, 0.3333333333333333, 0.6666666666666666, 1.0,
  ])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("3"))),
  )
  assert_eq(trace, ["scale", "major", "name", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order z uses x rc" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(2.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(2.0),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "z"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
  })
  verify_auto_minor_params_values(locator.call(), [0.0, 0.5, 1.0])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2"))),
  )
  assert_eq(trace, ["scale", "major", "name", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order uppercase Y uses x rc" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(2.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(2.0),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "Y"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
  })
  verify_auto_minor_params_values(locator.call(), [0.0, 0.5, 1.0])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2"))),
  )
  assert_eq(trace, ["scale", "major", "name", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order uppercase auto captured before failure" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("AUTO"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("AUTO"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
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
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Text("AUTO")),
  )
  assert_eq(trace, ["scale", "major", "name"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order capture remains after view failure" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(2.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(2.0),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() raise @core.DataError {
    trace.push("view")
    raise @core.DataError::InvalidTicks(message="fixture provider view")
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
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2"))),
  )
  assert_eq(trace, ["scale", "major", "name", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order scale provider failure" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() raise @core.DataError {
    trace.push("scale")
    raise @core.DataError::InvalidTicks(message="fixture provider scale")
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
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
  verify_auto_minor_params_ndivs(locator.ndivs(), None)
  assert_eq(trace, ["scale"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order major provider failure" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() raise @core.DataError {
    trace.push("major")
    raise @core.DataError::InvalidTicks(message="fixture provider major")
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
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
  verify_auto_minor_params_ndivs(locator.ndivs(), None)
  assert_eq(trace, ["scale", "major"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order axis name provider failure" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() raise @core.DataError {
    trace.push("name")
    raise @core.DataError::InvalidTicks(message="fixture provider name")
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
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
  verify_auto_minor_params_ndivs(locator.ndivs(), None)
  assert_eq(trace, ["scale", "major", "name"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order explicit skips axis name failure" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() raise @core.DataError {
    trace.push("name")
    raise @core.DataError::InvalidTicks(message="fixture provider name")
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
  })
  verify_auto_minor_params_values(locator.call(), [0.0, 0.5, 1.0])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Number(2.0)),
  )
  assert_eq(trace, ["scale", "major", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order explicit uppercase fails before view" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Text("AUTO")),
  )
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() raise @core.DataError {
    trace.push("view")
    raise @core.DataError::InvalidTicks(message="fixture provider view")
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
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Text("AUTO")),
  )
  assert_eq(trace, ["scale", "major"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order NaN step capture before round failure" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 0.0 / 0.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
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
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Text("auto")),
  )
  assert_eq(trace, ["scale", "major", "name", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order explicit fractional constructor" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.5)),
  )
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
  })
  verify_auto_minor_params_values(locator.call(), [0.0, 0.4, 0.8])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Number(2.5)),
  )
  assert_eq(trace, ["scale", "major", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order negative division still reads view" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(-1.0)),
  )
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.1, 0.4)
  })
  verify_auto_minor_params_values(locator.call(), [0.0])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Number(-1.0)),
  )
  assert_eq(trace, ["scale", "major", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order zero division still reads view" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(0.0)),
  )
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
  })
  verify_auto_minor_params_values(locator.call(), [0.0 / 0.0])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Number(0.0)),
  )
  assert_eq(trace, ["scale", "major", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order nonlog scale continues" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "symlog"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([-1.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
  })
  verify_auto_minor_params_values(locator.call(), [0.0, 0.5, 1.0])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Text("auto")),
  )
  assert_eq(trace, ["scale", "major", "name", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order huge rc integer point view" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text(
      "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  )
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text(
      "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 0.0)
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
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(
      @config.MinorTickDivisions::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  assert_eq(trace, ["scale", "major", "name"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order rc finite huge float becomes integer" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(1.0e+308))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(1.0e+308),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 0.0)
  })
  verify_auto_minor_params_values(locator.call(), [0.0])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(
      @config.MinorTickDivisions::Integer(
        @bigint.BigInt::from_string(
          "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336",
        ),
      ),
    ),
  )
  assert_eq(trace, ["scale", "major", "name", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order rc largest finite float becomes integer" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(1.7976931348623157e+308),
  )
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(1.7976931348623157e+308),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 0.0)
  })
  verify_auto_minor_params_values(locator.call(), [0.0])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(
      @config.MinorTickDivisions::Integer(
        @bigint.BigInt::from_string(
          "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
        ),
      ),
    ),
  )
  assert_eq(trace, ["scale", "major", "name", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order rc integer above max float rounds finite" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text(
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858369",
    ),
  )
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text(
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858369",
    ),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 0.0)
  })
  verify_auto_minor_params_values(locator.call(), [0.0])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(
      @config.MinorTickDivisions::Integer(
        @bigint.BigInt::from_string(
          "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858369",
        ),
      ),
    ),
  )
  assert_eq(trace, ["scale", "major", "name", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order rc integer float conversion overflows" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text(
      "1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  )
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text(
      "1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(ndivs=None)
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 0.0)
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
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(
      @config.MinorTickDivisions::Integer(
        @bigint.BigInt::from_string(
          "1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  assert_eq(trace, ["scale", "major", "name"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order constructor finite huge float remains float" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(1.0e+308)),
  )
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 0.0)
  })
  verify_auto_minor_params_values(locator.call(), [0.0])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Number(1.0e+308)),
  )
  assert_eq(trace, ["scale", "major", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original provider order constructor largest finite float remains float" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("auto"),
    horizontal=false,
  )
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(1.7976931348623157e+308)),
  )
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 0.0)
  })
  verify_auto_minor_params_values(locator.call(), [0.0])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Number(1.7976931348623157e+308)),
  )
  assert_eq(trace, ["scale", "major", "view"])
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor original capture reset shallow copy and owner rebind" {
  let old_x = @config.minor_tick_divisions()
  let old_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(old_x)
  defer @config.set_minor_tick_divisions(old_y, horizontal=false)
  let trace : Array[String] = []
  let locator = @ticker.AutoMinorLocator::new()
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "x"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
  })
  let shallow = locator.copy()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(2.0))
  verify_auto_minor_params_values(locator.call(), [0.0, 0.5, 1.0])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2"))),
  )
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(4.0))
  verify_auto_minor_params_values(shallow.call(), [0.0, 0.25, 0.5, 0.75, 1.0])
  verify_auto_minor_params_ndivs(
    shallow.ndivs(),
    Some(@config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("4"))),
  )
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(3.0),
    horizontal=false,
  )
  locator.bind_scale(fn() {
    trace.push("scale")
    "linear"
  })
  locator.bind_axis_name(fn() {
    trace.push("name")
    "y"
  })
  locator.bind_major_ticks(fn() {
    trace.push("major")
    @ticker.TickValues::from_array([0.0, 1.0])
  })
  locator.bind_view_interval(fn() {
    trace.push("view")
    (0.0, 1.0)
  })
  verify_auto_minor_params_values(locator.call(), [0.0, 0.5, 1.0])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2"))),
  )
  locator.set_ndivs(None)
  verify_auto_minor_params_values(locator.call(), [
    0.0, 0.3333333333333333, 0.6666666666666666, 1.0,
  ])
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_auto_minor_params_values(shallow.call(), [0.0, 0.25, 0.5, 0.75, 1.0])
  verify_auto_minor_params_ndivs(
    shallow.ndivs(),
    Some(@config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("4"))),
  )
}

///|
test "AutoMinor inherited set params warning no-op and diagnostic copies" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  locator.set_params()
  verify_auto_minor_params_ndivs(
    locator.ndivs(),
    Some(@config.MinorTickDivisions::Number(2.0)),
  )
  assert_eq(locator.warnings(), [
    "'set_params()' not defined for locator of type <class 'matplotlib.ticker.AutoMinorLocator'>",
  ])
  let saved = locator.warnings()
  saved.clear()
  assert_eq(locator.warnings(), [
    "'set_params()' not defined for locator of type <class 'matplotlib.ticker.AutoMinorLocator'>",
  ])
  let shallow = locator.copy()
  locator.bind_scale(fn() { "log" })
  assert_eq(locator.call(), [])
  assert_eq(locator.warnings(), [
    "AutoMinorLocator does not work on logarithmic scales",
  ])
  assert_eq(shallow.warnings(), [
    "'set_params()' not defined for locator of type <class 'matplotlib.ticker.AutoMinorLocator'>",
  ])
  locator.bind_scale(fn() { "linear" })
  locator.bind_major_ticks(fn() { @ticker.TickValues::from_array([1.0]) })
  assert_eq(locator.call(), [])
  assert_eq(locator.warnings(), [])
}
