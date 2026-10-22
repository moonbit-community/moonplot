// Generated original rc minor subdivision validator observations.

///|
fn verify_minor_tick_divisions(
  actual : @config.MinorTickDivisions,
  expected : @config.MinorTickDivisions,
) -> Unit raise {
  assert_eq(actual, expected)
}

///|
test "minor ndivs original rc validator 0" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(0.0))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("0")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 1" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(-0.0))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("0")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 2" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(0.5))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("0")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 3" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(-0.5))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("0")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 4" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(1.0))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("1")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 5" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Number(-1.0),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 6" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(2.5))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 7" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Number(-2.5),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 8" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(0.9999999999999999),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("0")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 9" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(-0.9999999999999999),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("0")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 10" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(9007199254740992.0),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(
      @bigint.BigInt::from_string("9007199254740992"),
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 11" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(9007199254740994.0),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(
      @bigint.BigInt::from_string("9007199254740994"),
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 12" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(9.223372036854776e+18),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(
      @bigint.BigInt::from_string("9223372036854775808"),
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 13" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(1.0e+100))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000159028911097599180468360808563945281389781327557747838772170381060813469985856815104",
      ),
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 14" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(1.0e+308))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(
      @bigint.BigInt::from_string(
        "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336",
      ),
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 15" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(1.7976931348623157e+308),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(
      @bigint.BigInt::from_string(
        "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
      ),
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 16" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Number(0.0 / 0.0),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 17" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Number(1.0 / 0.0),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 18" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Number(-1.0 / 0.0),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 19" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("auto"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Text("auto"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 20" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("AUTO"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Text("AUTO"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 21" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("Auto"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Text("Auto"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 22" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("aUtO"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Text("aUtO"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 23" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Text(" auto"),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 24" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Text("auto "),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 25" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("")),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 26" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("2"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 27" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("+2"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 28" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("-0"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("0")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 29" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("-1")),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 30" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Text("2.5"),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 31" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Text("2e1"),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 32" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Text("0x10"),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 33" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("1_000"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("1000")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 34" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("_2")),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 35" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("2_")),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 36" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Text("2__0"),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 37" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Text("+_2"),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 38" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text(" +1_2 "))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 39" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("-0_0"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("0")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 40" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Text("\u001c2"),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 41" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Text("﻿2"),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 42" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Text("1 2"),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 43" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Text("++2"),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 44" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("²")),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 45" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("9007199254740993"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(
      @bigint.BigInt::from_string("9007199254740993"),
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 46" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text(
      "100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(
      @bigint.BigInt::from_string(
        "100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 47" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text(
      "1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(
      @bigint.BigInt::from_string(
        "1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 48" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text(
      "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("0")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 49" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Text(
            "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
          ),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 50" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("1_2"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 51" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("١_٢"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 52" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("۱_۲"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 53" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("߁_߂"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 54" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("१_२"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 55" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("১_২"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 56" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("੧_੨"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 57" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("૧_૨"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 58" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("୧_୨"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 59" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("௧_௨"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 60" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("౧_౨"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 61" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("೧_೨"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 62" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("൧_൨"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 63" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("෧_෨"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 64" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("๑_๒"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 65" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("໑_໒"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 66" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("༡_༢"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 67" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("၁_၂"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 68" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("႑_႒"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 69" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("១_២"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 70" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("᠑_᠒"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 71" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("᥇_᥈"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 72" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("᧑_᧒"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 73" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("᪁_᪂"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 74" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("᪑_᪒"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 75" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("᭑_᭒"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 76" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("᮱_᮲"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 77" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("᱁_᱂"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 78" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("᱑_᱒"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 79" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("꘡_꘢"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 80" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("꣑_꣒"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 81" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("꤁_꤂"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 82" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("꧑_꧒"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 83" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("꧱_꧲"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 84" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("꩑_꩒"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 85" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("꯱_꯲"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 86" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("１_２"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 87" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𐒡_𐒢"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 88" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𐴱_𐴲"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 89" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑁧_𑁨"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 90" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑃱_𑃲"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 91" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑄷_𑄸"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 92" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑇑_𑇒"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 93" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑋱_𑋲"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 94" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑑑_𑑒"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 95" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑓑_𑓒"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 96" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑙑_𑙒"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 97" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑛁_𑛂"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 98" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑜱_𑜲"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 99" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑣡_𑣢"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 100" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑥑_𑥒"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 101" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑱑_𑱒"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 102" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑵑_𑵒"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 103" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑶡_𑶢"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 104" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𑽑_𑽒"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 105" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𖩡_𖩢"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 106" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𖫁_𖫂"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 107" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𖭑_𖭒"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 108" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𝟏_𝟐"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 109" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𝟙_𝟚"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 110" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𝟣_𝟤"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 111" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𝟭_𝟮"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 112" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𝟷_𝟸"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 113" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𞅁_𞅂"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 114" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𞋱_𞋲"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 115" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𞓱_𞓲"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 116" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("𞥑_𞥒"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 117" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("🯱_🯲"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("12")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 118" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("\t+2\t"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 119" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("\n+2\n"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 120" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("\u000b+2\u000b"),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 121" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("\f+2\f"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 122" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("\r+2\r"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 123" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text(" +2 "))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 124" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("+2"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 125" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text(" +2 "))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 126" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text(" +2 "))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 127" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text(" +2 "))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 128" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text(" +2 "))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 129" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text(" +2 "))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 130" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text(" +2 "))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 131" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text(" +2 "))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 132" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text(" +2 "))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 133" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Text("　+2　"))
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 134" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Integer(
      @bigint.BigInt::from_string("9007199254740993"),
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(
      @bigint.BigInt::from_string("9007199254740993"),
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 135" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}

///|
test "minor ndivs original rc validator 136" {
  let previous_x = @config.minor_tick_divisions()
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(7.0))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(8.0),
    horizontal=false,
  )
  let before = @config.rc_params()
  assert_true(
    try {
      ignore(
        @config.set_minor_tick_divisions(
          @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("-1")),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
  verify_minor_tick_divisions(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("8")),
  )
  verify_minor_tick_divisions(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_string("7")),
  )
}
